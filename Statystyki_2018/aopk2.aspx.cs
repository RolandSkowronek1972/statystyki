/*
Last Update:
    - version 1.190127
Creation date: 2019-01-27

*/

using OfficeOpenXml;
using System;
using System.Data;
using System.IO;
using System.Web.UI.WebControls;
using System.Globalization;

namespace stat2018
{
    public partial class aopk2 : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();

        private const string tenPlik = "aopk2.aspx";
        private const string tenPlikNazwa = "aopk2";
        private string path = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            string idWydzial = Request.QueryString["w"];
            try
            {
                if (idWydzial == null)
                {
                    return;
                }

                Session["id_dzialu"] = idWydzial;
                bool dost = cm.dostep(idWydzial, (string)Session["identyfikatorUzytkownika"]);
                if (!dost)
                {
                    Server.Transfer("default.aspx?info='Użytkownik " + (string)Session["identyfikatorUzytkownika"] + " nie praw do działu nr " + idWydzial + "'");
                }

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
                //Label3.Text = cl.nazwaSadu((string)Session["id_dzialu"]);
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

            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                ExcelWorksheet MyWorksheet1 = MyExcel.Workbook.Worksheets[1];
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], (DataTable)Session["tabelka001"], 105, 0, 8, true, true, false, false, false);

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
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 1");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2018(int.Parse(idDzialu), 1, Date1.Date, Date2.Date, 300, tenPlik);
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
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "W", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "W", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "W", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "1 osobowe", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "W", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "W", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "W", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "1-14 dni", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w tym nieusprawiedliwione", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "15-30 dni", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w tym nieusprawiedliwione", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "powyżej 1 - 3 mies.", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w tym nieusprawiedliwione", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "ponad 3 mies.", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w tym nieusprawiedliwione", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "razem", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w tym, w których projekt został zaakceptowany przez sędziego", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "na rozprawie", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "na posiedzeniu", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "sądowe", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "prokuratorskie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na rozprawie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na posiedzeniu", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na rozprawie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na posiedzeniu", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na rozprawie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na posiedzeniu", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na rozprawie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na posiedzeniu", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na rozprawie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na posiedzeniu", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na rozprawie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na posiedzeniu", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na rozprawie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na posiedzeniu", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na rozprawie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na posiedzeniu", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na rozprawie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na posiedzeniu", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na rozprawie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na posiedzeniu", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na rozprawie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na posiedzeniu", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na rozprawie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na posiedzeniu", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na rozprawie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na posiedzeniu", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na rozprawie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na posiedzeniu", "1", "2" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "sądowe", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "prokuratorskie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "rozprawy", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "posiedzenia", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "rozprawy", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "posiedzenia", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "sądowe", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "prokuratorskie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "w których wpłynął wniosek o transkrypcję", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "ogółem", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "uwzględniono", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Ogółem", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Ka", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "w tym", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Kz", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "w tym", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Ko", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "WKK", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "WSU", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Wykaz S skargi na postępowanie", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Ogółem", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Ka", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Kz", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Ko", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "WKK", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "WSU", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Wykaz S", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Ogółem", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Ka", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Kz", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Ko", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "WKK", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "WSU", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Wykaz S", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Ogółem", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Ka", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "w tym", "2", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Kz", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "w tym", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Ko", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "WKK", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "WSU)", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Wykaz S skargi na postępowanie", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "ogółem", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "z tego", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "ogółem", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "z tego", "3", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "z terminem", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "bez wyznaczonego terminu", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "OGÓŁEM (wraz z publikacją orzeczeń)", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Ogółem", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "K", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "w tym", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Kz", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "w tym", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Ko", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "WKK", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "WSU", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Wykaz S skargi na postępowanie", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "ogółem", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "zakreślonych", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "niezakreślonych", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "ogółem", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "do 3 m-cy", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "pow. 3 do 6 m - cy", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "pow.  6 do 12 m - cy", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "pow. 12 m-cy do 2 lat", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "pow. 2 do 3 lat", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "pow. 3 do 5 lat", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "pow. 5 do 8 lat", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "pow. 8 lat", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "łącznie", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "w terminie ustawowym 14 dni", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "razem po terminie ustawowym", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "nieusprawiedliw.", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "po upływie terminiu ustawowego", "8", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "ogółem", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "w tym", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "wpływ", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "załatwiono", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "pozostałość", "1", "3" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "wszystkie sesje sędziego w wydziale", "3", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "na potrzeby MS-S", "3", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "6", "lp", "1", "6" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "6", "nazwisko i imię sędziego", "1", "6" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "6", "zaległość z roku 2018", "1", "5" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "6", "WPŁYW", "10", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "6", "Wyznaczono", "14", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "6", "Załatwiono", "14", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "6", "ZAŁATWIENIA", "11", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "6", "sesje odbyte przez sędziego", "6", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "6", "Liczba odroczonych publikacji orzeczeń (rep. Ka)", "1", "5" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "6", "Liczba odroczonych spraw", "3", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "6", "POZOSTAŁOŚĆ na następny m-c", "10", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "6", "stan spraw zawieszonych (wszystkie kategorie spraw)", "3", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "6", "pozostało spraw starych (wszystkie kategorie spraw)", "9", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "6", "liczba sporządzonych uzasadnień", "12", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "6", "uzasadnienia wygłoszone *", "2", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "6", "Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent", "2", "4" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "6", "skargi na przewlekłość", "4", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "6", "UWAGI", "1", "5" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "6", "Kolumna kontrolna (wyznaczenia>=załatwień)", "2", "4" });

            return tabelaNaglowkowa;
        }
    }
}