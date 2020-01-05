/*
Last Update:
    - version 1.190421
Creation date: 2019-04-21

*/

using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI.WebControls;

namespace stat2018
{
    public partial class aopc : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();

        private const string tenPlik = "aopc.aspx";
        private const string tenPlikNazwa = "aopc";
        private string path = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            string idWydzial = Request.QueryString["w"];
            try
            {
                if (idWydzial == null) return;
                Session["id_dzialu"] = idWydzial;
                bool dost = cm.dostep(idWydzial, (string)Session["identyfikatorUzytkownika"]);
               if (!dost) Server.Transfer("default.aspx?info='Użytkownik " + (string)Session["identyfikatorUzytkownika"] + " nie praw do działu nr " + idWydzial + "'");
                path = Server.MapPath("~\\Template\\" + tenPlikNazwa + ".xlsx");
                CultureInfo newCulture = (CultureInfo)CultureInfo.CurrentCulture.Clone();
                newCulture.DateTimeFormat = CultureInfo.GetCultureInfo("PL").DateTimeFormat;
                System.Threading.Thread.CurrentThread.CurrentCulture = newCulture;
                System.Threading.Thread.CurrentThread.CurrentUICulture = newCulture;
                DateTime dTime = DateTime.Now.AddMonths(-1); ;

                if (Date1.Text.Length == 0) Date1.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-01");
                if (Date2.Text.Length == 0) Date2.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-" + DateTime.DaysInMonth(dTime.Year, dTime.Month).ToString("D2"));
                Session["id_dzialu"] = idWydzial;
                Session["data_1"] = Date1.Date.ToShortDateString();
                Session["data_2"] = Date2.Date.ToShortDateString();
            }
            catch
            { }
            odswiez();
            debug();
        }// end of Page_Load

        private void debug()
        {
            try
            {
                string User_id = string.Empty;
                string domain = string.Empty;
                try
                {
                    User_id = (string)Session["user_id"];
                    domain = (string)Session["damain"];
                }
                catch
                { }
                Label28.Text = cl.podajUzytkownika(User_id, domain);
                Label29.Text = DateTime.Now.ToLongDateString();
                Label30.Text = System.IO.File.ReadAllText(Server.MapPath(@"~//version.txt")).ToString().Trim();
            }
            catch
            { }

            try
            {
                string idDzialu = (string)Session["id_dzialu"];
                infoLabel1.Visible = cl.debug(int.Parse(idDzialu));
            }
            catch
            {
                infoLabel1.Visible = false;
            }
        }

        protected void Odswiez(object sender, EventArgs e)
        {
            odswiez();
        }

        protected void odswiez()
        {
            if (Session["id_dzialu"] == null)
            {
                return;
            }

            //odswiezenie danych
            tabela_1();
            LabelNazwaSadu.Text = cl.nazwaSadu((string)Session["id_dzialu"]);
        }

        protected void tworzPlikExcell(object sender, EventArgs e)
        {
            // execel begin
            string path = Server.MapPath("Template") + "\\" + tenPlikNazwa + ".xlsx";
            FileInfo existingFile = new FileInfo(path);
            if (!existingFile.Exists)
            {
                return;
            }
            string download = Server.MapPath("Template") + @"\" + tenPlikNazwa + "";

            FileInfo fNewFile = new FileInfo(download + "_.xlsx");

            // pierwsza tabelka

            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                ExcelWorksheet MyWorksheet1 = MyExcel.Workbook.Worksheets[1];

                // pierwsza

                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], (DataTable)Session["tabelka001"], 149, 0,9, true, false, false, false, false);

                try
                {
                    MyExcel.SaveAs(fNewFile);
                    this.Response.Clear();
                    this.Response.ContentType = "application/vnd.ms-excel";
                    this.Response.AddHeader("Content-Disposition", "attachment;filename=" + fNewFile.Name);
                    this.Response.WriteFile(fNewFile.FullName);
                    this.Response.End();
                }
                catch (Exception ex)
                {
                    cm.log.Error(tenPlik + " " + ex.Message);
                }
            }//end of using
        }

        protected void tabela_1()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                //cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 1");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2018(int.Parse(idDzialu), 5, Date1.Date, Date2.Date, 230, tenPlik);
            Session["tabelka001"] = tabelka01;
            gwTabela1.DataSource = null;
            gwTabela1.DataSourceID = null;
            gwTabela1.DataSource = tabelka01;
            gwTabela1.DataBind();
        }

        protected void naglowekTabeli_gwTabela1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                DataTable dT = (DataTable)Session["header_01"];//tb.naglowek(path, 1);
                tb.makeHeader(header_01(), gwTabela1);
            }
        }

        protected void stopkaTabeli_gwTabela1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka001"];
                tb.makeSumRow(table, e, 1);
            }
        }

        protected void pisz(string Template, int iloscWierszy, int iloscKolumn, DataTable dane)
        {
            for (int wiersz = 1; wiersz <= iloscWierszy; wiersz++)
            {
                for (int kolumna = 1; kolumna <= iloscKolumn; kolumna++)
                {
                    string controlName = Template + "w" + wiersz.ToString("D2") + "_c" + kolumna.ToString("D2");
                    Label tb = (Label)this.Master.FindControl("ContentPlaceHolder1").FindControl(controlName);
                    if (tb != null)
                    {
                        try
                        {
                            tb.Text = dane.Rows[wiersz - 1][kolumna].ToString().Trim();
                        }
                        catch
                        {
                        }
                        //tb.Text = dr.wyciagnijWartosc(dane, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza ='" + wiersz + "' and idkolumny='" + kolumna + "'", tenPlik);
                    }
                }
            }
        }// end of pisz

        protected void pisztb(string Template, int iloscWierszy, int iloscKolumn, DataTable dane)
        {
            for (int wiersz = 1; wiersz <= iloscWierszy; wiersz++)
            {
                for (int kolumna = 1; kolumna <= iloscKolumn; kolumna++)
                {
                    string controlName = Template + "w" + wiersz.ToString("D2") + "_c" + kolumna.ToString("D2");
                    TextBox tb = (TextBox)this.Master.FindControl("ContentPlaceHolder1").FindControl(controlName);
                    if (tb != null)
                    {
                        try
                        {
                            tb.Text = dane.Rows[wiersz - 1][kolumna].ToString().Trim();
                        }
                        catch { }
                    }
                }
            }
        }// end of pisz

        private DataTable header_01()
        {
            DataTable tabelaNaglowkowa = tb.SchematTabelinaglowkowej();

            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "1", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "2", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "3", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "4", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "5", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "6", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "7", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "8", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "9", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "10", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "11", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "12", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "13", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "14", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "15", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "16", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "17", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "18", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "19", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "20", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "21", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "22", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "23", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "24", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "25", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "26", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "27", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "28", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "29", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "30", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "31", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "32", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "33", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "34", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "35", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "36", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "37", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "38", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "39", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "40", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "41", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "42", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "43", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "44", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "45", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "46", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "47", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "48", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "49", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "50", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "51", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "52", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "53", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "54", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "55", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "56", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "57", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "58", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "59", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "60", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "61", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "62", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "63", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "64", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "65", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "66", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "67", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "68", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "69", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "70", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "71", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "72", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "73", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "74", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "75", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "76", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "77", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "78", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "79", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "80", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "81", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "82", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "83", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "84", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "85", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "86", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "87", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "88", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "89", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "90", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "91", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "92", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "93", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "94", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "95", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "96", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "97", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "98", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "99", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "100", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "101", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "102", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "103", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "104", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "105", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "106", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "107", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "108", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "109", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "110", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "111", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "112", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "113", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "114", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "115", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "116", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "117", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "118", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "119", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "120", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "121", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "122", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "123", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "124", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "125", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "126", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "127", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "128", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "129", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "130", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "131", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "132", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "133", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "134", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "135", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "136", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "137", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "138", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "139", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "140", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "141", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "142", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "143", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "144", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "145", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "146", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "147", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "148", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "o rozwód", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "o separację", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "ogółem", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "o rozwód", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "o separację", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "o rozwód", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "o separację", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "ogółem", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "o rozwód", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "o separację", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "o rozwód", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "o separację", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "1-14 dni", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w tym nieusprawiedliwione", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "15-30 dni", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w tym nieusprawiedliwione", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "powyżej 1 do 3 mies.", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w tym nieusprawiedliwione", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "ponad 3 mies.", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w tym nieusprawiedliwione", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "razem", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w tym, w których projekt został zaakceptowany przez sędziego", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "na rozprawie", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "na posiedzeniu", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "ogółem", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "w tym", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Ns separacje", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Co (wnioski o zwoln. od kosztów sąd. i ustanow. pełnom. przed złożeniem pozwu)", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Co- nadawanie klauzuli wykonalności orzeczeniu sądu zagranicznego+ (skład 3-os)", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Co (do spraw pr. zakończonych)", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na rozprawę", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na posiedzenie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na rozprawę", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na posiedzenie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na rozprawę", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na posiedzenie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na rozprawę", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na posiedzenie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na rozprawę", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na posiedzenie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na rozprawę", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na posiedzenie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na rozprawę", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na posiedzenie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na rozprawę", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na posiedzenie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na rozprawę", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na posiedzenie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na rozprawę", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na posiedzenie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na rozprawę", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na posiedzenie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na rozprawę", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na posiedzenie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na rozprawę", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na posiedzenie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na rozprawę", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na posiedzenie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na rozprawę", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na posiedzenie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na rozprawę", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na posiedzenie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na rozprawę", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na posiedzenie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na rozprawę", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na posiedzenie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na rozprawę", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na posiedzenie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na rozprawę", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na posiedzenie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na rozprawę", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na posiedzenie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na rozprawę", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na posiedzenie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na rozprawę", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na posiedzenie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na rozprawę", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na posiedzenie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na rozprawę", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na posiedzenie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na rozprawę", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na posiedzenie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na rozprawę", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na posiedzenie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na rozprawę", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na posiedzenie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "ogółem", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "o rozwód", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "o separację", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "RC (do 31.01.2018)", "3", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "od 1.02.2018", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "ogółem", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "o rozwód", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "o separację", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "RC (do 31.01.2018)", "3", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "od 1.02.2018AAAA", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "w których wpłynął wniosek o transkrypcję", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "ogółem", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "uwzględniono", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "liczba  spraw, w których strony skierowano do mediacji", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "liczba ugód zawartych przed mediatorem", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "w tym zatwierdzono ugodę", "1", "2" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "o rozwód", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "o separację", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "o rozwód", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "o separację", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "o rozwód", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "o separację", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "o rozwód", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "o separację", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "o rozwód", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "o separację", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "o rozwód", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "o separację", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Rozprawy", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Posiedzenia", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Rozprawy", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Posiedzenia", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "ogółem", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "w tym", "1", "1" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "wpływ", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "rozpoznano", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "pozostałość", "1", "3" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "WPŁYW", "1", "1" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "rozstrzygnięcie", "2", "1" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Ogółem", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "C", "3", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Ns ogółem", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "w tym", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Ns-rej", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Nc", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Co ogółem", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "w tym", "3", "2" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "WSC", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Ogółem", "2", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "C", "2", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "w tym", "4", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "RC", "2", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "z tego", "4", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "C od 1.02.2018 r.", "4", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Ns", "2", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Ns-Rej", "2", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Nc", "2", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Co", "2", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "WSC", "2", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Ogółem", "2", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "C", "2", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "w tym", "4", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "RC", "2", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "z tego", "4", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "C od 1.02.2018 r.", "4", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Ns", "2", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Ns-Rej", "2", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Nc", "2", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Co", "2", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "WSC", "2", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Ogółem", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "C", "8", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Ns", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Ns-rej", "1", "4" }); //51
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Nc", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Co", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "WSC", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "ogółem", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "z tego", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "ogółem", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "z tego", "2", "1" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "ogółem (wszystkie kategorie spraw)  ", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "C", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Ns", "1", "4" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "z teminem", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "bez wyznaczonego terminu", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "OGÓŁEM (wraz z publikacją orzeczeń)  ", "1", "4" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "ogółem", "1", "4" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "C", "8", "2" });//98
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Ns", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Ns-rej", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Nc", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Co", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "WSC", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Ogółem", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "zakreślonych", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "niezakreślonych", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Ogółem", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "do 3 mies.", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "pow. 3 do 6 m - cy", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "pow.  6 do 12 m - cy", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "pow. 12 m-cy do 2 lat", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "pow. 2 do 3 lat", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "pow. 3 do 5 lat", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "pow. 5 do 8 lat", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "pow.  8 lat", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "łącznie", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "w terminie ustawowym 14 dni", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "razem po terminie ustawowym", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "nieusprawiedliwione", "1", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "po upływie terminiu ustawowego", "8", "3" });
            //tabelaNaglowkowa.Rows.Add(new Object[] { "5", "ogółem", "8", "3" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "6", "wszystkie sesje sędziego w wydziale", "3", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "6", "na potrzeby MS-S", "3", "1" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "7", "lp", "1", "7" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "7", "imię i nazwisko sędziego", "1", "7" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "7", "zaległość z roku 2018", "1", "6" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "7", "WPŁYW", "13", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "7", "Wyznaczono", "28", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "7", "Załatwiono", "28", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "7", "ZAŁATWIENIA", "14", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "7", "sesje odbyte przez sędziego", "6", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "7", "Liczba odroczonych publikacji orzeczeń", "3", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "7", "Liczba odroczonych spraw", "3", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "7", "POZOSTAŁOŚĆ na następny m-c", "14", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "7", "stan spraw zawieszonych (wszystkie kategorie spraw)", "3", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "7", "pozostało spraw starych (wszystkie kategorie spraw)", "9", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "7", "liczba sporządzonych uzasadnień (wszystkie kategorie spraw)", "12", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "7", "uzasadnienia wygłoszone *", "2", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "7", "Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent", "2", "5" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "7", "skargi na przewlekłość", "4", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "7", "mediacje", "3", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "7", "UWAGI", "1", "6" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "7", "Kolumna kontrolna (wyznaczenia>=załatwień)", "2", "5" });
            return tabelaNaglowkowa;
        }

        private DataTable header_02()
        {
            DataTable tabelaNaglowkowa = tb.SchematTabelinaglowkowej();

            for (int i = 0; i < 8; i++)
            {
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "I + II Inst.", "1", "1", "h" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "I Inst.", "1", "1", "h" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "GC", "1", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "II Inst.", "1", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Ga", "1", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Gz", "1", "1" });
            }

            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "I + II Instancja", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "I Instancja", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "II Instancja", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "I + II Instancja", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "I Instancja", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "GC", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "II Instancja", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ga", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Gz", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "I Instancja", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "II Instancja", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "I Instancja", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "II Instancja", "1", "2" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "1-14 dni ", "6", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w tym nieusprawiedliwione", "6", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "15-30 dni ", "6", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w tym nieusprawiedliwione", "6", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "powyżej 1 do 3 mies. ", "6", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w tym nieusprawiedliwione", "6", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "ponad 3 mies. ", "6", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w tym nieusprawiedliwione", "6", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w których wpłynął wniosek o transkrypcję", "1", "2" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Ogółem", "3", "1", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "w terminie ustawowym", "6", "1", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "razem po terminie ustawowym", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "nieusprawiedliwione", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "po upływie terminu ustawowego", "48", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ogółem", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "w tym", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Razem", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "w tym, w których projekt został zaakceptowany przez sędziego", "1", "3" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "L.p.", "1", "4", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "imię i nazwisko sędziego", "1", "4", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "liczba sporządzonych uzasadnień (wszystkie kategorie spraw)", "61", "1", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "uzasadnienia wygłoszone *", "2", "1", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent", "2", "1", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Uwagi", "1", "4", "h" });

            return tabelaNaglowkowa;
        }

        private DataTable header_05()
        {
            DataTable tabelaNaglowkowa = tb.SchematTabelinaglowkowej();

            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "K", "1", "1", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Ko", "1", "1", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Kop", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Kp", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "W", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Razem", "1", "1" });

            return tabelaNaglowkowa;
        }

        private DataTable header_11()
        {
            DataTable tabelaNaglowkowa = tb.SchematTabelinaglowkowej();

            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "uchylono", "1", "1", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "skierowano do wykonania", "1", "1", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "inny sposób", "1", "1" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Sędzia", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Wpływ", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Załatwienia", "3", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Pozostało", "1", "2" });

            return tabelaNaglowkowa;
        }

        private DataTable header_10()
        {
            DataTable tabelaNaglowkowa = tb.SchematTabelinaglowkowej();

            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "K", "1", "1", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Ko", "1", "1", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Kop", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Kp", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "W", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Razem", "1", "1" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Sędzia", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Efektywny okres orzekania", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ilość wyznaczonych spraw", "6", "1" });

            return tabelaNaglowkowa;
        }

        private DataTable header_12()
        {
            DataTable tabelaNaglowkowa = tb.SchematTabelinaglowkowej();

            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "utrzymano  w mocy", "1", "1", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "uchylono ", "1", "1", "h" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Kop", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "zmienionoKp", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "częściowo uchylono", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "pozostawiono bez rozpoznania ", "1", "1" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Sędzia", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Rodzaje orzeczeń ", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Razem", "6", "1" });

            return tabelaNaglowkowa;
        }
    }
}