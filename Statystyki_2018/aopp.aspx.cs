/*
Last Update:
    - version 1.181211
Creation date: 2018-12-11

*/

using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI.WebControls;

namespace stat2018
{
    public partial class aopp : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();

        private const string tenPlik = "aopp.aspx";
        private const string tenPlikNazwa = "aopp";
        private string path = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            string idWydzial =   Request.QueryString["w"];
            try
            {
                if (idWydzial == null)
                {
                    Server.Transfer("default.aspx");
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
                infoLabel2.Visible = cl.debug(int.Parse(idDzialu));
            }
            catch
            {
                infoLabel1.Visible = false;

                infoLabel2.Visible = false;
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
            tabela_2();

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

                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], (DataTable)Session["tabelka001"], 270, 0, 8, true, true, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[2], (DataTable)Session["tabelka002"], 120, 0, 8, true, true, false, false, false);

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
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 1, Date1.Date, Date2.Date, 300, tenPlik);
            Session["tabelka001"] = tabelka01;
            gwTabela1.DataSource = null;
            gwTabela1.DataSourceID = null;
            gwTabela1.DataSource = tabelka01;
            gwTabela1.DataBind();
        }

        protected void tabela_2()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 2");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 2, Date1.Date, Date2.Date, 130, tenPlik);
            Session["tabelka002"] = tabelka01;
            gwTabela2.DataSource = null;
            gwTabela2.DataSourceID = null;
            gwTabela2.DataSource = tabelka01;
            gwTabela2.DataBind();
        }

        protected void naglowekTabeli_gwTabela1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(header_01(), gwTabela1);
            }
        }

        protected void naglowekTabeli_gwTabela2(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(header_02(), gwTabela2);
            }
        }

        protected void stopkaTabeli_gwTabela2(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka002"];
                tb.makeSumRow(table, e, 1);
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
                    }
                }
            }
        }// end of pisz

        private DataTable header_01()
        {
            DataTable tabelaNaglowkowa = tb.SchematTabelinaglowkowej();

            for (int j = 0; j < 2; j++)
            {
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "rozprawy", "1", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "posiedzenia", "1", "1" });

                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "1-14 dni", "1", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "w tym nieusprawiedliwione", "1", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "15-30 dni", "1", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "w tym nieusprawiedliwione", "1", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "powyżej 1 do 3 mies.", "1", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "w tym nieusprawiedliwione", "1", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "ponad 3 mies.", "1", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "w tym nieusprawiedliwione", "1", "1" });

                //w których wpłynął wniosek o transkrypcję
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "w których wpłynął wniosek o transkrypcję", "1", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "1-14 dni", "1", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "w tym nieusprawiedliwione", "1", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "15-30 dni", "1", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "w tym nieusprawiedliwione", "1", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "powyżej 1 do 3 mies.", "1", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "w tym nieusprawiedliwione", "1", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "ponad 3 mies.", "1", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "w tym nieusprawiedliwione", "1", "1" });

                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "ogółem", "1", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "1-14 dni", "1", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "w tym nieusprawiedliwione", "1", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "15-30 dni", "1", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "w tym nieusprawiedliwione", "1", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "powyżej 1 do 3 mies.", "1", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "w tym nieusprawiedliwione", "1", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "ponad 3 mies.", "1", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "w tym nieusprawiedliwione", "1", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "w których wpłynął wniosek o transkrypcję", "1", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "ogółem", "1", "1" });

                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "uwzględniono", "1", "1" });
            }

            for (int j = 0; j < 2; j++)
            {
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ogółem", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "U", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Uo", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "WSC skarga o stw. niezg. z pr.", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "WSNc-I inst.", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ogółem", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ua", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Uz", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Uo II inst", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "WSC skarga kasacyjna", "1", "2" });

                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "WSC skarga o stw. niezg. z pr.II inst.", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Wykaz S skargi na post. sądowe", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "WSNc-II inst.", "1", "2" });

                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ogółem", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "U", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Uo", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "WSC skarga o stw. niezg. z pr.", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "WSNc-I inst.", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ogółem", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ua", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Uz", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Uo II inst", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "WSC skarga kasacyjna", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "WSC skarga o stw. niezg. z pr.", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Wykaz S skargi na post. sądowe", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "WSNc-II inst.", "1", "2" });

                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "ogółem", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "z tego", "2", "1" });

                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ogółem", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "U", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Uo", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "WSC skarga o stw. niezg. z pr.", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "WSNc-I inst.", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ogółem", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ua", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Uz", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Uo II inst", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "WSC skarga kasacyjna", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "WSC skarga o stw. niezg. z pr.  II inst.", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Wykaz S skargi na post. sądowe", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "WSNc-I inst.", "1", "2" });

                for (int i = 0; i < 3; i++)
                {
                    tabelaNaglowkowa.Rows.Add(new Object[] { "2", "ogółem", "1", "2" });
                    tabelaNaglowkowa.Rows.Add(new Object[] { "2", "do 3 m-cy", "1", "2" });
                    tabelaNaglowkowa.Rows.Add(new Object[] { "2", "pow. 3 do 6 m - cy", "1", "2" });
                    tabelaNaglowkowa.Rows.Add(new Object[] { "2", "pow.  6 do 12 m - cy", "1", "2" });
                    tabelaNaglowkowa.Rows.Add(new Object[] { "2", "pow. 12 m-cy do 2 lat", "1", "2" });
                    tabelaNaglowkowa.Rows.Add(new Object[] { "2", "pow. 2 do 3 lat", "1", "2" });
                    tabelaNaglowkowa.Rows.Add(new Object[] { "2", "pow. 3 do 5 lat", "1", "2" });
                    tabelaNaglowkowa.Rows.Add(new Object[] { "2", "pow. 5 do 8 lat", "1", "2" });
                    tabelaNaglowkowa.Rows.Add(new Object[] { "2", "pow.  8 lat", "1", "2" });
                }
                for (int i = 0; i < 3; i++)
                {
                    tabelaNaglowkowa.Rows.Add(new Object[] { "2", "ogółem", "1", "2" });
                    tabelaNaglowkowa.Rows.Add(new Object[] { "2", "zakreślonych", "1", "2" });
                    tabelaNaglowkowa.Rows.Add(new Object[] { "2", "niezakreślonych", "1", "2" });
                }

                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "łącznie", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w terminie ustawowym 14 dni", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "razem po terminie ustawowym", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "nieusprawiedliw.", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "po upływie terminiu ustawowego", "8", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "ogółem", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w tym", "1", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "razem", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w tym, w których projekt został zaakceptowany przez sędziego", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "łącznie", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w terminie ustawowym 14 dni", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "razem po terminie ustawowym", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "nieusprawiedliw.", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "po upływie terminiu ustawowego", "8", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "ogółem", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w tym", "1", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "razem", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w tym, w których projekt został zaakceptowany przez sędziego", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "łącznie", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w terminie ustawowym 14 dni", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "razem po terminie ustawowym", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "nieusprawiedliw.", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "po upływie terminiu ustawowego", "8", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "ogółem", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w tym", "1", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "razem", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w tym, w których projekt został zaakceptowany przez sędziego", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "wpływ", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "załatwiono", "2", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "pozostałość", "1", "2" });
            }

            for (int j = 0; j < 2; j++)
            {
                tabelaNaglowkowa.Rows.Add(new Object[] { "3", "I + II instancja łącznie", "1", "3" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "3", "I instancja", "5", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "3", "II instancja", "8", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "3", "I + II instancja łącznie", "1", "3" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "3", "I instancja", "5", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "3", "II instancja", "8", "1" });

                tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na potrzeby MS-S", "3", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "3", "I + II instancja łącznie", "1", "3" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "3", "I instancja", "5", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "3", "II instancja", "8", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "3", "I + II instancja łącznie", "9", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "3", "I instancja", "9", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "3", "II instancja", "9", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "3", "I + II instancja łącznie", "3", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "3", "I instancja", "3", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "3", "II instancja", "3", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "3", "liczba sporządzonych uzasadnień (wszystkie kategorie spraw)", "12", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "3", "uzasadnienia wygłoszone *", "2", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent", "2", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "3", "liczba sporządzonych uzasadnień (wszystkie kategorie spraw)", "12", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "3", "uzasadnienia wygłoszone *", "2", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent", "2", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "3", "liczba sporządzonych uzasadnień (wszystkie kategorie spraw)", "12", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "3", "uzasadnienia wygłoszone *", "2", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent", "2", "1" });
            }

            for (int j = 0; j < 2; j++)
            {
                tabelaNaglowkowa.Rows.Add(new Object[] { "4", "zaległość z poprzedniego roku", "1", "4" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "4", "WPŁYW", "14", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "4", "ZAŁATWIENIA", "14", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "4", "sesje odbyte przez sędziego", "3", "1" });

                tabelaNaglowkowa.Rows.Add(new Object[] { "4", "POZOSTAŁOŚĆ  na następny m-c", "14", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "4", "pozostało spraw starych - wszystkie kategorie spraw(bez czasu trwania mediacji, zgodnie z dz. 2.1.1.1 MS-S11o)", "27", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "4", "stan spraw zawieszonych (wszystkie kategorie spraw)", "9", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "4", "I + II instancja łącznie", "16", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "4", "I instancja", "16", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "4", "II instancja", "16", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "4", "skargi na przewlekłość", "4", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "4", "UWAGI", "1", "4" });
            }

            /*
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "rozprawy", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "posiedzenia", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "rozprawy", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "posiedzenia", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "z terminem", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "bez terminu", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "OGÓŁEM (wraz z publikacją orzeczeń)", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "z terminem", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "bez terminu", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "OGÓŁEM (wraz z publikacją orzeczeń)", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "1-14 dni", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "w tym nieusprawiedliwione", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "15-30 dni", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "w tym nieusprawiedliwione", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "powyżej 1 do 3 mies.", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "w tym nieusprawiedliwione", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "ponad 3 mies.", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "w tym nieusprawiedliwione", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "w których wpłynął wniosek o transkrypcjęEEEEE", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "razem", "1", "1" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "w tym, w których projekt został zaakceptowany przez sędziego", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "1-14 dni", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "w tym nieusprawiedliwione", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "15-30 dni", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "w tym nieusprawiedliwione", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "powyżej 1 do 3 mies.", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "w tym nieusprawiedliwione", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "ponad 3 mies.", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "w tym nieusprawiedliwione", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "w których wpłynął wniosek o transkrypcję", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "razem", "1", "1" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "w tym, w których projekt został zaakceptowany przez sędziego", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "1-14 dni", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "w tym nieusprawiedliwione", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "15-30 dni", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "w tym nieusprawiedliwione", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "powyżej 1 do 3 mies.", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "w tym nieusprawiedliwione", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "ponad 3 mies.", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "w tym nieusprawiedliwione", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "w których wpłynął wniosek o transkrypcję", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "razem", "1", "1" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "w tym, w których projekt został zaakceptowany przez sędziego", "1", "1" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "ogółem", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "uwzględniono (k.03,w.02)", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "liczba  spraw, w których strony skierowano do mediacji", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "liczba ugód zawartych przed mediatorem", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "1", "w tym zatwierdzonono ugodę", "1", "1" });
            */

            // prawopracy
            /*
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ogółem", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "P", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Np.", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Po", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "WSC skargao stw. niezg. z pr.", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ogółem", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Pa", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Pz", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Po II inst.", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "WSC skarga kasacyjna", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "WSC skarga o stw. niezg. z pr.II inst.", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Wykaz S skargi na post. sądowe", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ogółem", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "P", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Np.", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Po", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "WSC skarga o stw. niezg. z pr.", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ogółem", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Pa", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Pz", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Po II inst.", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "WSC skarga kasacyjna", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "WSC skarga o stw. niezg. z pr. II inst.", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Wykaz S skargi na post. sądowe", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "ogółem", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "z tego", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "ogółem", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "z tego", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ogółem I Instancja", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ogółem II Instancja", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "I Instancja", "3", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "II Instancja", "3", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ogółem", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "P", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Np.", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Po", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "WSC skarga o stw. niezg. z pr.", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ogółem", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Pa", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Pz", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Po II inst.", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "WSC skarga kasacyjna", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "WSC skarga o stw. niezg. z pr. II inst.", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Wykaz S skargi na post. sądowe", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "ogółem", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "zakreślonych", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "niezakreślonych", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "ogółem", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "zakreślonych", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "niezakreślonych", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "ogółem", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "zakreślonych", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "niezakreślonych", "1", "2" });
            for (int i = 0; i < 3; i++)
            {
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "ogółem", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "do 3 m-cy", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "pow. 3 do 6 m - cy", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "pow.  6 do 12 m - cy", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "pow. 12 m-cy do 2 lat", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "pow. 2 do 3 lat", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "pow. 3 do 5 lat", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "pow. 5 do 8 lat", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "pow. 8 lat", "1", "2" });
            }

            for (int i = 0; i < 3; i++)
            {
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "ogółem", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "zakreś-lonych", "1", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "nie zakreś-lonych", "1", "2" });
            }
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "łącznie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w terminie ustawowym 14 dni", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "razem po terminie ustawowym", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "nieusprawiedliw.", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "po upływie terminiu ustawowego", "8", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "ogółem", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w tym", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "łącznie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w terminie ustawowym 14 dni", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "razem po terminie ustawowym", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "nieusprawiedliw.", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "po upływie terminiu ustawowego", "8", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "ogółem", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w tym", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "łącznie", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w terminie ustawowym 14 dni", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "razem po terminie ustawowym", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "nieusprawiedliw.", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "po upływie terminiu ustawowego", "8", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "ogółem", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "w tym", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "wpływ", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "załatwiono", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "pozostałość", "1", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "wpływ", "1", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "rozstrzygnięcie", "2", "1" });
     */
            //
            /*
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "I + II instancja łącznie", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "I instancja", "5", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "II instancja", "7", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "I + II instancja łącznie", "1", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "I instancja", "5", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "II instancja", "7", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "wszystkie sesje sędziego w wydziale", "3", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na potrzeby MS-S", "3", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "I + II instancja łącznie", "1", "3" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "I instancja", "5", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "II instancja", "7", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "I + II instancja łącznie", "3", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "I instancja", "3", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "II instancja", "3", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "I + II instancja łącznie", "9", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "I instancja", "9", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "II instancja", "9", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "liczba sporządzonych uzasadnień (wszystkie kategorie spraw)", "12", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "uzasadnienia wygłoszone *", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent", "2", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "liczba sporządzonych uzasadnień (wszystkie kategorie spraw)", "12", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "uzasadnienia wygłoszone *", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent", "2", "2" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "liczba sporządzonych uzasadnień (wszystkie kategorie spraw)", "12", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "uzasadnienia wygłoszone *", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent", "2", "2" });
     */

            /*      tabelaNaglowkowa.Rows.Add(new Object[] { "4", "zaległość z poprzedniego roku", "1", "4" });

                  tabelaNaglowkowa.Rows.Add(new Object[] { "4", "WPŁYW", "13", "1" });
                  tabelaNaglowkowa.Rows.Add(new Object[] { "4", "ZAŁATWIENIA", "13", "1" });
                  tabelaNaglowkowa.Rows.Add(new Object[] { "4", "sesje odbyte przez sędziego", "6", "1" });
                  tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Liczba odroczonych publikacji orzeczeń", "2", "2" });
                  tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Liczba odroczonych spraw", "6", "2" });
                  ///sssssssss
                  tabelaNaglowkowa.Rows.Add(new Object[] { "4", "POZOSTAŁOŚĆ  na następny m-c", "15", "1" });
                  tabelaNaglowkowa.Rows.Add(new Object[] { "4", "stan spraw zawieszonych (wszystkie kategorie spraw)", "9", "1" });
                  tabelaNaglowkowa.Rows.Add(new Object[] { "4", "pozostało spraw starych (wszystkie kategorie spraw)", "27", "1" });
                  tabelaNaglowkowa.Rows.Add(new Object[] { "4", "I + II instancja łącznie", "16", "1" });
                  tabelaNaglowkowa.Rows.Add(new Object[] { "4", "I instancja", "16", "1" });
                  tabelaNaglowkowa.Rows.Add(new Object[] { "4", "II instancja", "16", "1" });
                  tabelaNaglowkowa.Rows.Add(new Object[] { "4", "skargi na przewlekłość", "4", "2" });
                  tabelaNaglowkowa.Rows.Add(new Object[] { "4", "mediacje", "3", "2" });
                  tabelaNaglowkowa.Rows.Add(new Object[] { "4", "UWAGI", "1", "4" });
                  */
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "L.p.", "1", "5" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "imię i nazwisko sędziego", "1", "5" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Sprawy z zakresu ubezpieczeń społecznych", "135", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Sprawy z zakresu prawa pracy", "135", "1" });

            return tabelaNaglowkowa;
        }

        private DataTable header_02()
        {
            DataTable tabelaNaglowkowa = tb.SchematTabelinaglowkowej();
            for (int i = 0; i < 60; i++)
            {
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "na rozprawie", "1", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "na posiedzeniu", "1", "1" });
            }
            for (int i = 0; i < 2; i++)
            {
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ogółem", "2", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "U", "2", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Uo", "2", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "WSC sk.o stw. niezg. z pr.", "2", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "WSNc  -I inst.", "2", "1" });

                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ogółem", "2", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ua", "2", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Uz", "2", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Uo - II inst.", "2", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "WSC sk. Kasacyjna", "2", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "WSC sk.o stw. niezg. z pr. II inst.", "2", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Wykaz S Skargi na post. sądowe", "2", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "WSNc  -II inst.", "2", "1" });
            }


            for (int i = 0; i < 2; i++)
            {
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ogółem", "2", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "P", "2", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Np.", "2", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Po", "2", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "WSC sk.o stw. niezg. z pr.", "2", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "WSNc  -I inst.", "2", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ogółem", "2", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Pa", "2", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Pz", "2", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Po - II inst.", "2", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "WSC sk. Kasacyjna", "2", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "WSC sk.o stw. niezg. z pr. II inst.", "2", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Wykaz S Skargi na post. sądowe", "2", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "WSNc  -II inst.", "2", "1" });
            }



            for (int i = 0; i < 2; i++)
            {
                tabelaNaglowkowa.Rows.Add(new Object[] { "3", "I + II instancja łącznie", "2", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "3", "I instancja", "10", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "3", "II instancja", "16", "1" });
            }
            for (int i = 0; i < 2; i++)
            {
                tabelaNaglowkowa.Rows.Add(new Object[] { "3", "I + II instancja łącznie", "2", "2" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "3", "I instancja", "12", "1" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "3", "II instancja", "16", "1" });
            }

           

            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Wyznaczono", "28", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Załatwiono", "28", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Wyznaczono", "30", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Załatwiono", "30", "1" });
           tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Kolumna kontrolna (wyznaczenia>=załatwień)", "2", "3" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Kolumna kontrolna (wyznaczenia>=załatwień)", "2", "3" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "lp", "1", "5" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "imię i nazwisko sędziego", "1", "5" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Sprawy z zakresu ubezpieczeń społecznych", "56", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Sprawy z zakresu prawa pracy", "60", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Sprawy z zakresu ubezpieczeń społecznych", "2", "1" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "5", "Sprawy z zakresu prawa pracy", "2", "1" });

            return tabelaNaglowkowa;
        }

        
    }
}