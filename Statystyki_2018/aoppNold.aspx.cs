/*
Last Update:
    - version 1.181211
Creation date: 2018-12-11

*/

using DevExpress.Web;
using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;

namespace stat2018
{
    public partial class aoppNold : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();
        public devExpressXXL DevExpressXXL = new devExpressXXL();
        private const string tenPlik = "aoppN.aspx";
        private const string tenPlikNazwa = "aopp";
        private string path = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            string idWydzial = "12";// Request.QueryString["w"];
            try
            {
                if (idWydzial == null)
                {
                    return;
                }
                cm.log.Info(tenPlik + ": id wydzialu=" + idWydzial);

                bool dost = cm.dostep(idWydzial, (string)Session["identyfikatorUzytkownika"]);
                if (!dost)
                {
                    //Server.Transfer("default.aspx?info='Użytkownik " + (string)Session["identyfikatorUzytkownika"] + " nie praw do działu nr " + idWydzial + "'");
                }
                Session["id_dzialu"] = idWydzial;
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

                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], (DataTable)Session["tabelka001"], 290, 0, 8, true, true, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[2], (DataTable)Session["tabelka002"], 105, 0, 7, true, true, false, false, false);

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

            DataTable tabelka01 = dr.konwertujNaPrzecinek(dr.generuj_dane_do_tabeli_sedziowskiej_2018(int.Parse(idDzialu), 1, Date1.Date, Date2.Date, 120, tenPlik));
            Session["tabelka001"] = tabelka01;

            ASPxGridView1.DataSource = null;
            ASPxGridView1.DataSourceID = null;
            ASPxGridView1.AutoGenerateColumns = true;
            ASPxGridView1.DataSource = tabelka01;
            ASPxGridView1.DataBind();
            ASPxGridView1.KeyFieldName = "id_sedziego";
            ASPxGridView1.Columns.Clear();
            int szerokoscKolumny = 80;
            ASPxGridView1.Width = Panel1.Width;

            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("L.p.", "id", idDzialu, "", true, 36));
            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Imie i nazwisko", "Imienazwisko", idDzialu, "", true, 250));

            //Sprawy z zakresu ubezpieczeń społecznych
            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznych = DevExpressXXL.GetBoundColumn("Sprawy z zakresu ubezpieczeń społecznych ");
            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("zaległość z roku 2018", "d_01", idDzialu, "", false, szerokoscKolumny));

            #region wplyw

            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(new string[8] { "Ogółem", "P", "Np.", "Po", "WSC", "U", "Uo", "WSC" }, 1, idDzialu, false, szerokoscKolumny, "WPŁYW"));

            #endregion wplyw

            #region Wyznaczono

            GridViewBandColumn Wyznaczono_wplyw01 = DevExpressXXL.GetBoundColumn("Wyznaczono");
            Wyznaczono_wplyw01.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "na rozprawe", "na posie- dzenie" }, 9, idDzialu, false, szerokoscKolumny, "Ogółem"));
            Wyznaczono_wplyw01.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "na rozprawe", "na posie- dzenie" }, 11, idDzialu, false, szerokoscKolumny, "P"));
            Wyznaczono_wplyw01.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "na rozprawe", "na posie- dzenie" }, 13, idDzialu, false, szerokoscKolumny, "Np."));
            Wyznaczono_wplyw01.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "na rozprawe", "na posie- dzenie" }, 15, idDzialu, false, szerokoscKolumny, "Po"));
            Wyznaczono_wplyw01.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "na rozprawe", "na posie- dzenie" }, 17, idDzialu, false, szerokoscKolumny, "WSC"));
            Wyznaczono_wplyw01.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "na rozprawe", "na posie- dzenie" }, 19, idDzialu, false, szerokoscKolumny, "U"));
            Wyznaczono_wplyw01.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "na rozprawe", "na posie- dzenie" }, 21, idDzialu, false, szerokoscKolumny, "Uo"));
            Wyznaczono_wplyw01.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "na rozprawe", "na posie- dzenie" }, 23, idDzialu, false, szerokoscKolumny, "WSC"));

            ASPxGridView1.Columns.Add(Wyznaczono_wplyw01);

            #endregion Wyznaczono

            #region Wyznaczono

            GridViewBandColumn Zalatwiono_wplyw01 = DevExpressXXL.GetBoundColumn("Załatwiono");
            Zalatwiono_wplyw01.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "na rozprawe", "na posie- dzenie" }, 25, idDzialu, false, szerokoscKolumny, "Ogółem"));
            Zalatwiono_wplyw01.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "na rozprawe", "na posie- dzenie" }, 27, idDzialu, false, szerokoscKolumny, "P"));
            Zalatwiono_wplyw01.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "na rozprawe", "na posie- dzenie" }, 29, idDzialu, false, szerokoscKolumny, "Np."));
            Zalatwiono_wplyw01.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "na rozprawe", "na posie- dzenie" }, 31, idDzialu, false, szerokoscKolumny, "Po"));
            Zalatwiono_wplyw01.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "na rozprawe", "na posie- dzenie" }, 33, idDzialu, false, szerokoscKolumny, "WSC"));
            Zalatwiono_wplyw01.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "na rozprawe", "na posie- dzenie" }, 35, idDzialu, false, szerokoscKolumny, "U"));
            Zalatwiono_wplyw01.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "na rozprawe", "na posie- dzenie" }, 37, idDzialu, false, szerokoscKolumny, "Uo"));
            Zalatwiono_wplyw01.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "na rozprawe", "na posie- dzenie" }, 39, idDzialu, false, szerokoscKolumny, "WSC"));

            ASPxGridView1.Columns.Add(Zalatwiono_wplyw01);

            #endregion Wyznaczono

            #region zalatwienia

            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(new string[8] { "Ogółem", "P", "Np.", "Po", "WSC", "U", "Uo", "WSC" }, 41, idDzialu, false, szerokoscKolumny, "Załatwienia"));

            #endregion zalatwienia

            #region sesje odbyte przez sędziego

            GridViewBandColumn sesjeSedziego = DevExpressXXL.GetBoundColumn("sesje odbyte przez sędziego ");

            GridViewBandColumn wszystkieSesjeSedziego = DevExpressXXL.GetBoundColumn("wszystkie sesje sędziego w wydziale ");
            wszystkieSesjeSedziego.Columns.Add(DevExpressXXL.kolumnaDoTabeli("ogółem", "d_49", idDzialu, "", false, szerokoscKolumny));
            wszystkieSesjeSedziego.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "rozprawy", "posiedzenia" }, 50, idDzialu, false, szerokoscKolumny, "z tego "));
            sesjeSedziego.Columns.Add(wszystkieSesjeSedziego);

            GridViewBandColumn naPotrzebyMSS = DevExpressXXL.GetBoundColumn("na potrzeby MS-S");
            naPotrzebyMSS.Columns.Add(DevExpressXXL.kolumnaDoTabeli("ogółem", "d_52", idDzialu, "", false, szerokoscKolumny));
            naPotrzebyMSS.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "rozprawy", "posiedzenia" }, 53, idDzialu, false, szerokoscKolumny, "z tego "));
            sesjeSedziego.Columns.Add(naPotrzebyMSS);

            ASPxGridView1.Columns.Add(sesjeSedziego);

            #endregion sesje odbyte przez sędziego

            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(new string[3] { "ogółem (wszystkie kategorie spraw)", "P", "U" }, 55, idDzialu, false, szerokoscKolumny, "Liczba odroczonych publikacji orzeczeń"));
            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(new string[3] { "z terminem", "bez wyznaczonego terminu", "OGÓŁEM" }, 58, idDzialu, false, szerokoscKolumny, "Liczba spraw odroczonych"));
            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(new string[8] { "Ogółem", "P", "Np.", "Po", "WSC", "U", "Uo", "WSC" }, 61, idDzialu, false, szerokoscKolumny, "POZOSTAŁOŚĆ na następny m-c"));
            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(new string[9] { "Ogółem", "do 3 m-cy", "pow. 3 do 6 m - cy", "pow. 6 do 12 m - cy", "pow. 12 m-cy do 2 lat", "pow. 2 do 3 lat", "pow. 3 do 5 lat", "pow. 5 do 8 lat", "pow. 8 lat" }, 69, idDzialu, false, szerokoscKolumny, "pozostało spraw starych (wszystkie kategorie spraw) "));
            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(new string[3] { "Ogółem", "zakreś- lonych", "nie zakreś- lonych" }, 78, idDzialu, false, szerokoscKolumny, "stan spraw zawieszonych (wszystkie kategorie spraw)"));

            GridViewBandColumn liczbaSporzadzonychUzasadnien = DevExpressXXL.podKolumna(new string[4] { "Łącznie", "w terminie ustawowym 14 dni", "razem po terminie ustawowym", "nie- usprawied- liwione" }, 81, idDzialu, false, szerokoscKolumny, "liczba sporządzonych uzasadnień (wszystkie kategorie spraw)**");

            GridViewBandColumn PoUplywie = (DevExpressXXL.podKolumna(new string[8] { "1-14 dni", "w tym nieuspra -wiedliwione", "15-30 dni", "w tym nieuspra -wiedliwione", "powyżej 1 do 3 mies", "w tym nieuspra -wiedliwione", "ponad 3 mies", "w tym nieuspra -wiedliwione" }, 85, idDzialu, false, szerokoscKolumny, "po upływie terminiu ustawowego"));
            liczbaSporzadzonychUzasadnien.Columns.Add(PoUplywie);
            ASPxGridView1.Columns.Add(liczbaSporzadzonychUzasadnien);
            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("uzasadnienia wygłoszone *", "d_93", idDzialu, "", false, szerokoscKolumny));
            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Liczba spraw do których wpłynął wniosek o transkrypcje uzasadnień wygłoszonych", "d_94", idDzialu, "", false, szerokoscKolumny));
            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "razem", "w tym, w których projekt został zaakceptowany przez sędziego" }, 95, idDzialu, false, szerokoscKolumny, "Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent**"));

            GridViewBandColumn zalatwiono01skargiNaPrzewleklosc = DevExpressXXL.GetBoundColumn("skargi na przewlekłość");
            zalatwiono01skargiNaPrzewleklosc.Columns.Add(DevExpressXXL.kolumnaDoTabeli("wpływ", "d_97", idDzialu, "", false, szerokoscKolumny));

            zalatwiono01skargiNaPrzewleklosc.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "ogółem", "uwzględniono" }, 98, idDzialu, false, szerokoscKolumny, "załatwiono"));
            zalatwiono01skargiNaPrzewleklosc.Columns.Add(DevExpressXXL.kolumnaDoTabeli("pozostałość", "d_100", idDzialu, "", false, szerokoscKolumny));
            ASPxGridView1.Columns.Add(zalatwiono01skargiNaPrzewleklosc);

            GridViewBandColumn mediacje = DevExpressXXL.GetBoundColumn("mediacje");
            mediacje.Columns.Add(DevExpressXXL.podKolumna(new string[1] { "liczba  spraw, w których strony skierowano do mediacji" }, 101, idDzialu, false, szerokoscKolumny, "WPŁYW"));
            mediacje.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "liczba ugód zawartych przed mediatorem", "w tym zatwierdzono ugodę" }, 102, idDzialu, false, szerokoscKolumny, "mediacje "));

            //skargi na przewlekłość

            ASPxGridView1.Columns.Add(mediacje);

            ASPxGridView1.TotalSummary.Clear();
            ASPxGridView1.TotalSummary.Add(DevExpressXXL.komorkaSumujaca("Ogółem"));
            for (int i = 1; i < 104; i++)
            {
                ASPxGridView1.TotalSummary.Add(DevExpressXXL.komorkaSumujaca(i));
            }
        }

        protected void tabela_2()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 2");
            }
            DataTable tabelka01 = dr.konwertujNaPrzecinek(dr.generuj_dane_do_tabeli_z_miesiacami(Date1.Date, Date2.Date, idDzialu, 2, 104, tenPlik));
            Session["tabelka002"] = tabelka01;
            ASPxGridView2.DataSource = null;
            ASPxGridView2.DataSourceID = null;
            ASPxGridView2.DataSource = tabelka01;
            ASPxGridView2.DataBind();

            ASPxGridView2.KeyFieldName = "id";
            ASPxGridView2.Columns.Clear();
            int szerokoscKolumny = 80;
            ASPxGridView2.Width = Panel1.Width;

            ASPxGridView2.Columns.Add(DevExpressXXL.kolumnaDoTabeli("L.p.", "id", idDzialu, "", true, 36));
            ASPxGridView2.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Miesiąc", "miesiac", idDzialu, "", true, 250));

            //Sprawy z zakresu ubezpieczeń społecznych
            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznych = DevExpressXXL.GetBoundColumn("Sprawy z zakresu ubezpieczeń społecznych ");
            ASPxGridView2.Columns.Add(DevExpressXXL.kolumnaDoTabeli("zaległość z roku 2018", "d_01", idDzialu, "", false, szerokoscKolumny));

            #region wplyw

            ASPxGridView2.Columns.Add(DevExpressXXL.podKolumna(new string[8] { "Ogółem", "P", "Np.", "Po", "WSC", "U", "Uo", "WSC" }, 2, idDzialu, false, szerokoscKolumny, "WPŁYW"));

            #endregion wplyw

            #region Wyznaczono

            GridViewBandColumn Wyznaczono_wplyw01 = DevExpressXXL.GetBoundColumn("Wyznaczono");
            Wyznaczono_wplyw01.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "na rozprawe", "na posie- dzenie" }, 9, idDzialu, false, szerokoscKolumny, "Ogółem"));
            Wyznaczono_wplyw01.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "na rozprawe", "na posie- dzenie" }, 11, idDzialu, false, szerokoscKolumny, "P"));
            Wyznaczono_wplyw01.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "na rozprawe", "na posie- dzenie" }, 13, idDzialu, false, szerokoscKolumny, "Np."));
            Wyznaczono_wplyw01.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "na rozprawe", "na posie- dzenie" }, 15, idDzialu, false, szerokoscKolumny, "Po"));
            Wyznaczono_wplyw01.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "na rozprawe", "na posie- dzenie" }, 17, idDzialu, false, szerokoscKolumny, "WSC"));
            Wyznaczono_wplyw01.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "na rozprawe", "na posie- dzenie" }, 19, idDzialu, false, szerokoscKolumny, "U"));
            Wyznaczono_wplyw01.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "na rozprawe", "na posie- dzenie" }, 21, idDzialu, false, szerokoscKolumny, "Uo"));
            Wyznaczono_wplyw01.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "na rozprawe", "na posie- dzenie" }, 23, idDzialu, false, szerokoscKolumny, "WSC"));

            ASPxGridView2.Columns.Add(Wyznaczono_wplyw01);

            #endregion Wyznaczono

            #region Wyznaczono

            GridViewBandColumn Zalatwiono_wplyw01 = DevExpressXXL.GetBoundColumn("Załatwiono");
            Zalatwiono_wplyw01.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "na rozprawe", "na posie- dzenie" }, 25, idDzialu, false, szerokoscKolumny, "Ogółem"));
            Zalatwiono_wplyw01.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "na rozprawe", "na posie- dzenie" }, 27, idDzialu, false, szerokoscKolumny, "P"));
            Zalatwiono_wplyw01.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "na rozprawe", "na posie- dzenie" }, 29, idDzialu, false, szerokoscKolumny, "Np."));
            Zalatwiono_wplyw01.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "na rozprawe", "na posie- dzenie" }, 31, idDzialu, false, szerokoscKolumny, "Po"));
            Zalatwiono_wplyw01.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "na rozprawe", "na posie- dzenie" }, 33, idDzialu, false, szerokoscKolumny, "WSC"));
            Zalatwiono_wplyw01.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "na rozprawe", "na posie- dzenie" }, 35, idDzialu, false, szerokoscKolumny, "U"));
            Zalatwiono_wplyw01.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "na rozprawe", "na posie- dzenie" }, 37, idDzialu, false, szerokoscKolumny, "Uo"));
            Zalatwiono_wplyw01.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "na rozprawe", "na posie- dzenie" }, 39, idDzialu, false, szerokoscKolumny, "WSC"));

            ASPxGridView2.Columns.Add(Zalatwiono_wplyw01);

            #endregion Wyznaczono

            #region zalatwienia

            ASPxGridView2.Columns.Add(DevExpressXXL.podKolumna(new string[8] { "Ogółem", "P", "Np.", "Po", "WSC", "U", "Uo", "WSC" }, 41, idDzialu, false, szerokoscKolumny, "Załatwienia"));

            #endregion zalatwienia

            #region sesje odbyte przez sędziego

            GridViewBandColumn sesjeSedziego = DevExpressXXL.GetBoundColumn("sesje odbyte przez sędziego ");

            GridViewBandColumn wszystkieSesjeSedziego = DevExpressXXL.GetBoundColumn("wszystkie sesje sędziego w wydziale ");
            wszystkieSesjeSedziego.Columns.Add(DevExpressXXL.kolumnaDoTabeli("ogółem", "d_49", idDzialu, "", false, szerokoscKolumny));
            wszystkieSesjeSedziego.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "rozprawy", "posiedzenia" }, 50, idDzialu, false, szerokoscKolumny, "z tego "));
            sesjeSedziego.Columns.Add(wszystkieSesjeSedziego);

            GridViewBandColumn naPotrzebyMSS = DevExpressXXL.GetBoundColumn("na potrzeby MS-S");
            naPotrzebyMSS.Columns.Add(DevExpressXXL.kolumnaDoTabeli("ogółem", "d_52", idDzialu, "", false, szerokoscKolumny));
            naPotrzebyMSS.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "rozprawy", "posiedzenia" }, 53, idDzialu, false, szerokoscKolumny, "z tego "));
            sesjeSedziego.Columns.Add(naPotrzebyMSS);

            ASPxGridView2.Columns.Add(sesjeSedziego);

            #endregion sesje odbyte przez sędziego

            ASPxGridView2.Columns.Add(DevExpressXXL.podKolumna(new string[3] { "ogółem (wszystkie kategorie spraw)", "P", "U" }, 55, idDzialu, false, szerokoscKolumny, "Liczba odroczonych publikacji orzeczeń"));
            ASPxGridView2.Columns.Add(DevExpressXXL.podKolumna(new string[3] { "z terminem", "bez wyznaczonego terminu", "OGÓŁEM" }, 58, idDzialu, false, szerokoscKolumny, "Liczba spraw odroczonych"));
            ASPxGridView2.Columns.Add(DevExpressXXL.podKolumna(new string[8] { "Ogółem", "P", "Np.", "Po", "WSC", "U", "Uo", "WSC" }, 61, idDzialu, false, szerokoscKolumny, "POZOSTAŁOŚĆ na następny m-c"));
            ASPxGridView2.Columns.Add(DevExpressXXL.podKolumna(new string[9] { "Ogółem", "do 3 m-cy", "pow. 3 do 6 m - cy", "pow. 6 do 12 m - cy", "pow. 12 m-cy do 2 lat", "pow. 2 do 3 lat", "pow. 3 do 5 lat", "pow. 5 do 8 lat", "pow. 8 lat" }, 69, idDzialu, false, szerokoscKolumny, "pozostało spraw starych (wszystkie kategorie spraw) "));
            ASPxGridView2.Columns.Add(DevExpressXXL.podKolumna(new string[3] { "Ogółem", "zakreś- lonych", "nie zakreś- lonych" }, 78, idDzialu, false, szerokoscKolumny, "stan spraw zawieszonych (wszystkie kategorie spraw)"));

            GridViewBandColumn liczbaSporzadzonychUzasadnien = DevExpressXXL.podKolumna(new string[4] { "Łącznie", "w terminie ustawowym 14 dni", "razem po terminie ustawowym", "nie- usprawied- liwione" }, 81, idDzialu, false, szerokoscKolumny, "liczba sporządzonych uzasadnień (wszystkie kategorie spraw)**");

            GridViewBandColumn PoUplywie = (DevExpressXXL.podKolumna(new string[8] { "1-14 dni", "w tym nieuspra -wiedliwione", "15-30 dni", "w tym nieuspra -wiedliwione", "powyżej 1 do 3 mies", "w tym nieuspra -wiedliwione", "ponad 3 mies", "w tym nieuspra -wiedliwione" }, 85, idDzialu, false, szerokoscKolumny, "po upływie terminiu ustawowego"));
            liczbaSporzadzonychUzasadnien.Columns.Add(PoUplywie);
            ASPxGridView2.Columns.Add(liczbaSporzadzonychUzasadnien);
            ASPxGridView2.Columns.Add(DevExpressXXL.kolumnaDoTabeli("uzasadnienia wygłoszone *", "d_93", idDzialu, "", false, szerokoscKolumny));
            ASPxGridView2.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Liczba spraw do których wpłynął wniosek o transkrypcje uzasadnień wygłoszonych", "d_94", idDzialu, "", false, szerokoscKolumny));
            ASPxGridView2.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "razem", "w tym, w których projekt został zaakceptowany przez sędziego" }, 95, idDzialu, false, szerokoscKolumny, "Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent**"));

            GridViewBandColumn zalatwiono01skargiNaPrzewleklosc = DevExpressXXL.GetBoundColumn("skargi na przewlekłość");
            zalatwiono01skargiNaPrzewleklosc.Columns.Add(DevExpressXXL.kolumnaDoTabeli("wpływ", "d_97", idDzialu, "", false, szerokoscKolumny));

            zalatwiono01skargiNaPrzewleklosc.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "ogółem", "uwzględniono" }, 98, idDzialu, false, szerokoscKolumny, "załatwiono"));
            zalatwiono01skargiNaPrzewleklosc.Columns.Add(DevExpressXXL.kolumnaDoTabeli("pozostałość", "d_100", idDzialu, "", false, szerokoscKolumny));
            ASPxGridView2.Columns.Add(zalatwiono01skargiNaPrzewleklosc);

            GridViewBandColumn mediacje = DevExpressXXL.GetBoundColumn("Mediacje");
            mediacje.Columns.Add(DevExpressXXL.podKolumna(new string[1] { "liczba  spraw, w których strony skierowano do mediacji" }, 101, idDzialu, false, szerokoscKolumny, "WPŁYW"));
            mediacje.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "liczba ugód zawartych przed mediatorem", "w tym zatwierdzono ugodę" }, 102, idDzialu, false, szerokoscKolumny, "mediacje "));

            ASPxGridView2.Columns.Add(mediacje);

            ASPxGridView2.TotalSummary.Clear();

            ASPxGridView2.TotalSummary.Add(DevExpressXXL.komorkaSumujaca("Ogółem", "miesiac"));

            for (int i = 1; i < 104; i++)
            {
                ASPxGridView2.TotalSummary.Add(DevExpressXXL.komorkaSumujaca(i));
            }
        }

        protected void Suma(object sender, DevExpress.Data.CustomSummaryEventArgs e)
        {
            ASPxSummaryItem sumItem = (ASPxSummaryItem)e.Item;
        }
    }
}