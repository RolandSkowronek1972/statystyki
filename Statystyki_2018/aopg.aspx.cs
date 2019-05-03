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
    public partial class aopg : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();

        private const string tenPlik = "aopg.aspx";
        private const string tenPlikNazwa = "aopg";
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

                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], (DataTable)Session["tabelka001"], 221, 0, 7, true, false, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[2], (DataTable)Session["tabelka002"], 66, 0, 7, true, false, false, false, false);

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
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2018(int.Parse(idDzialu), 1, Date1.Date, Date2.Date, 230, tenPlik);
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
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2018(int.Parse(idDzialu), 2, Date1.Date, Date2.Date, 150, tenPlik);
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
                DataTable dT = (DataTable)Session["header_01"];//tb.naglowek(path, 1);
                tb.makeHeader( header_01(), gwTabela1);
            }
        }

        protected void naglowekTabeli_gwTabela2(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                tb.makeHeader(sn, header_02(), gwTabela2);
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
                        { }
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

            for (int i = 0; i < 30; i++)
            {
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "na rozprawie", "1", "1", "h", "60" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "na posiedzeniu", "1", "1", "h", "60" });
            }
            for (int i = 0; i < 2; i++)
            {
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "rozprawy", "1", "1", "h", "60" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "posiedzenia", "1", "1", "h", "60" });
            }
            for (int i = 0; i < 2; i++)
            {
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "ogółem (wszystkie kategorie spraw)", "1", "1", "h", "60" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "Gc", "1", "1", "h", "60" });
            }

            for (int i = 0; i < 2; i++)
            {
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "z terminem", "1", "1", "h", "60" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "bez terminu", "1", "1", "h", "60" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "1", "OGÓŁEM (wraz z publikacją orzeczeń)", "1", "1", "h", "60" });
            }

            //wpływ
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ogółem", "1", "2", "h", "10" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "GC", "1", "2", "h", "130" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "GNs", "1", "2", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "GNc", "1", "2", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "GCo", "1", "2", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "WSC skarga o stw. niezg. z pr.s", "1", "2", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Wykaz U", "1", "2", "h", "60" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ogółem", "1", "2", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ga", "1", "2", "h", "130" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Gz", "1", "2", "h", "130" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "GCo-II inst.", "1", "2", "h", "45" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "WSC skarga kasacyjna", "1", "2", "h", "45" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "WSC skarga o stw. niezg. z pr. II inst.", "1", "2", "h", "45" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Skargi na post. sądowe", "1", "2", "h", "45" });

            //wyznaczono i załatwiono
            for (int i = 0; i < 2; i++)
            {
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ogółem", "2", "1", "h", "10" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "GC", "2", "1", "h", "130" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "GNs", "2", "1", "h", "60" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "GNc", "2", "1", "h", "60" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "GCo", "2", "1", "h", "60" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "GNWSC skarga o stw. niezg. z pr.s", "2", "1", "h", "60" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Wykaz U", "2", "1", "h", "60" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ogółem", "2", "1", "h", "10" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ga", "2", "1", "h", "130" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Gz", "2", "1", "h", "130" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "GCo-II inst.", "2", "1", "h", "45" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "WSC skarga kasacyjna", "2", "1", "h", "45" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "WSC skarga o stw. niezg. z pr. II inst.", "2", "1", "h", "45" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Skargi na post. sądowe", "2", "1", "h", "45" });
            }
            //załatwienia
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ogółem", "1", "2", "h", "10" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "GC", "1", "2", "h", "130" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "GNs", "1", "2", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "GNc", "1", "2", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "GCo", "1", "2", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "GNWSC skarga o stw. niezg. z pr.s", "1", "2", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Wykaz U", "1", "2", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ogółem", "1", "2", "h", "10" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ga", "1", "2", "h", "130" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Gz", "1", "2", "h", "130" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "GCo-II inst.", "1", "2", "h", "45" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "WSC skarga kasacyjna", "1", "2", "h", "45" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "WSC skarga o stw. niezg. z pr. II inst.", "1", "2", "h", "45" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Skargi na post. sądowe", "1", "2", "h", "45" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "ogółem", "1", "2", "h", "45" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "z tego", "2", "1", "h", "45" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "ogółem", "1", "2", "h", "45" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "z tego", "2", "1", "h", "45" });

            //POZOSTAŁOŚĆ na następny m-c

            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ogółem", "1", "2", "h", "10" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "GC", "1", "2", "h", "130" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "GNs", "1", "2", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "GNc", "1", "2", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "GCo", "1", "2", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "GNWSC skarga o stw. niezg. z pr.s", "1", "2", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Wykaz U", "1", "2", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ogółem", "1", "2", "h", "10" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ga", "1", "2", "h", "130" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Gz", "1", "2", "h", "130" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "GCo-II inst.", "1", "2", "h", "45" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "WSC skarga kasacyjna", "1", "2", "h", "45" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "WSC skarga o stw. niezg. z pr. II inst.", "1", "2", "h", "45" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Skargi na post. sądowe", "1", "2", "h", "45" });

            for (int i = 0; i < 2; i++)
            {
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "ogółem", "1", "2", "h", "130" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "zakreślonych", "1", "2", "h", "130" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "niezakreślonych", "1", "2", "h", "45" });
            }

            for (int i = 0; i < 8; i++)
            {
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ogółem", "1", "2", "h", "10" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "GC", "1", "2", "h", "130" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "GNs", "1", "2", "h", "60" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "GNc", "1", "2", "h", "60" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "GCo", "1", "2", "h", "60" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Ga", "1", "2", "h", "60" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "Gz", "1", "2", "h", "60" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "WSC", "1", "2", "h", "60" });
                tabelaNaglowkowa.Rows.Add(new Object[] { "2", "S", "1", "2", "h", "60" });
            }
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "ogółem", "1", "2", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "uwzględniono", "1", "2", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "liczba ugód zawartych przed mediatorem ", "1", "2", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "uwzglęw tym zatwierdzono ugodę dniono", "1", "2", "h", "60" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "na rozprawie", "1", "2", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "2", "na posiedzeniu", "1", "2", "h", "60" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "I + II instancja łącznie", "1", "3", "h", "60" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "I instancja ", "7", "1", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "II instancja ", "7", "1", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "I + II instancja łącznie", "2", "2", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "I instancja ", "14", "1", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "II instancja ", "14", "1", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "I + II instancja łącznie", "2", "2", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "I instancja ", "14", "1", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "II instancja ", "14", "1", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "I + II instancja łącznie", "1", "3", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "I instancja ", "7", "1", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "II instancja ", "7", "1", "h", "60" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "wszystkie sesje sędziego w wydziale", "3", "1", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "na potrzeby MS-S", "3", "1", "h", "60" });
            //Liczba odroczonych publikacji orzeczeń
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "I instancja ", "2", "2", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "II instancja ", "2", "2", "h", "60" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "I instancja ", "3", "2", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "II instancja ", "3", "2", "h", "60" });
            //POZOSTAŁOŚĆ na następny m-c
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "I + II instancja łącznie", "1", "3", "h", "60" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "I instancja ", "7", "1", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "II instancja ", "7", "1", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "I instancja ", "3", "1", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "II instancja ", "3", "1", "h", "60" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "ogółem", "1", "3", "h", "60" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "do 3 m-cy 2", "9", "1", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "pow. 3 do 6 m-cy", "9", "1", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "pow. 6 do 12 m-cy", "9", "1", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "pow. 12 m-cy do 2 lat", "9", "1", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "pow. 2 do 3 lat", "9", "1", "h", "60" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "pow. 3 do 5 lat", "9", "1", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "pow. 5 do 8 lat", "9", "1", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "pow. 8 lat", "9", "1", "h", "60" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "wpływ", "1", "3", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "załatwiono", "2", "1", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "pozostałość", "1", "3", "h", "60" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "skierowano do mediacji", "1", "3", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "3", "załatwiono", "2", "1", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "L.p.", "1", "4", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "imię i nazwisko sędziego", "1", "4", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "zaległość z roku 2018", "1", "4", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "WPŁYW", "15", "1", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Wyznaczono", "30", "1", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Załatwiono", "30", "1", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Załatwienia", "15", "1", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "sesje odbyte przez sędziego ", "6", "1", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Liczba odroczonych publikacji orzeczeń", "4", "1", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Liczba odroczonych spraw", "6", "1", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "POZOSTAŁOŚĆ na następny m-c", "15", "1", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "stan spraw zawieszonych (wszystkie kategorie spraw)", "6", "1", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "pozostało spraw starych", "73", "1", "h", "60" });

            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "skargi na przewlekłość", "4", "1", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "mediacje", "3", "1", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "UWAGI", "1", "4", "h", "60" });
            tabelaNaglowkowa.Rows.Add(new Object[] { "4", "Kolumna kontrolna (wyznaczenia>=załatwień)", "2", "2", "h", "60" });
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
     
    }
}