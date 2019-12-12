/*
Last Update:
    - version 1.191210
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
    public partial class oopg : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();
        public devExpressXXL DevExpressXXL = new devExpressXXL();
        private const string tenPlik = "oopg.aspx";
        private const string tenPlikNazwa = "oopg";
        private string path = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            string idWydzial =  Request.QueryString["w"];
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

        protected void TimerTick(object sender, EventArgs e)
        {
            Timer1.Enabled = false;
            imgLoader.Visible = false;
        }

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

           

            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                ExcelWorksheet MyWorksheet1 = MyExcel.Workbook.Worksheets[1];

             

                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], (DataTable)Session["tabelka001"], 100, 0, 7, true, true, false, false, false);
                tb.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[2], (DataTable)Session["tabelka002"], 12, 100, 1, 7, false);

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

            DataTable tabelka01 = dr.konwertujNaPrzecinek(dr.generuj_dane_do_tabeli_sedziowskiej_2018(int.Parse(idDzialu), 1, Date1.Date, Date2.Date, 114, tenPlik));
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
            idDzialu = "1";
            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("L.p.", "id", idDzialu, "", true, 36));
            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Imie i nazwisko", "Imienazwisko", idDzialu, "", true, 250));

            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznych = DevExpressXXL.GetBoundColumn("Sprawy z zakresu ubezpieczeń społecznych ");
            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("zaległość z roku 2018", "d_01", idDzialu, "", false, szerokoscKolumny));

            #region wplyw

            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(new string[] { "Ogółem", "GC", "GNs", "GNc", "GCo", "GCps", "WSC" }, 2, idDzialu, false, szerokoscKolumny, "WPŁYW"));

            #endregion wplyw

            string[] teksty01 = new string[] { "Wydział ogółem", "GC", "GNs", "GNc", "GCo", "GCps", "WSC" };

            ASPxGridView1.Columns.Add(DevExpressXXL.SekcjaDwiePodKolumny(teksty01, "Wyznaczono", 9, idDzialu, szerokoscKolumny));
            ASPxGridView1.Columns.Add(DevExpressXXL.SekcjaDwiePodKolumny(teksty01, "Załatwiono", 23, idDzialu, szerokoscKolumny));

            #region zalatwienia

            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(new string[] { "Ogółem", "GC", "GNs", "GNc", "GCo", "GCps", "WSC" }, 37, idDzialu, false, szerokoscKolumny, "Załatwienia"));

            #endregion zalatwienia

            #region sesje odbyte przez sędziego

            GridViewBandColumn sesjeSedziego = DevExpressXXL.GetBoundColumn("sesje odbyte przez sędziego ");

            GridViewBandColumn wszystkieSesjeSedziego = DevExpressXXL.GetBoundColumn("wszystkie sesje sędziego w wydziale ");
            wszystkieSesjeSedziego.Columns.Add(DevExpressXXL.kolumnaDoTabeli("ogółem", "d_44", idDzialu, "", false, szerokoscKolumny));
            wszystkieSesjeSedziego.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "rozprawy", "posiedzenia" }, 45, idDzialu, false, szerokoscKolumny, "z tego "));
            sesjeSedziego.Columns.Add(wszystkieSesjeSedziego);

            GridViewBandColumn naPotrzebyMSS = DevExpressXXL.GetBoundColumn("na potrzeby MS-S");
            naPotrzebyMSS.Columns.Add(DevExpressXXL.kolumnaDoTabeli("ogółem", "d_47", idDzialu, "", false, szerokoscKolumny));
            naPotrzebyMSS.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "rozprawy", "posiedzenia" }, 48, idDzialu, false, szerokoscKolumny, "z tego "));
            sesjeSedziego.Columns.Add(naPotrzebyMSS);

            ASPxGridView1.Columns.Add(sesjeSedziego);

            #endregion sesje odbyte przez sędziego

            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(new string[] { "ogółem (wszystkie kategorie spraw)", "GC", "GNs" }, 50, idDzialu, false, szerokoscKolumny, "Liczba odroczonych publikacji orzeczeń"));
            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(new string[] { "z terminem", "bez wyznaczonego terminu", "OGÓŁEM" }, 53, idDzialu, false, szerokoscKolumny, "Liczba spraw odroczonych"));
            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(new string[] { "Ogółem", "GC", "GNs", "GNc", "GCo", "GCps", "WSC" }, 56, idDzialu, false, szerokoscKolumny, "POZOSTAŁOŚĆ na następny m-c"));
            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(new string[] { "Ogółem", "do 3 m-cy", "pow. 3 do 6 m - cy", "pow. 6 do 12 m - cy", "pow. 12 m-cy do 2 lat", "pow. 2 do 3 lat", "pow. 3 do 5 lat", "pow. 5 do 8 lat", "pow. 8 lat" }, 63, idDzialu, false, szerokoscKolumny, "pozostało spraw starych (wszystkie kategorie spraw) "));
            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(new string[] { "Ogółem", "zakreś- lonych", "nie zakreś- lonych" }, 72, idDzialu, false, szerokoscKolumny, "stan spraw zawieszonych (wszystkie kategorie spraw)"));

            GridViewBandColumn liczbaSporzadzonychUzasadnien = DevExpressXXL.podKolumna(new string[] { "Łącznie", "w terminie ustawowym 14 dni", "razem po terminie ustawowym", "nie- usprawied- liwione" }, 75, idDzialu, false, szerokoscKolumny, "liczba sporządzonych uzasadnień (wszystkie kategorie spraw)**");

            GridViewBandColumn PoUplywie = (DevExpressXXL.podKolumna(new string[] { "1-14 dni", "w tym nieuspra -wiedliwione", "15-30 dni", "w tym nieuspra -wiedliwione", "powyżej 1 do 3 mies", "w tym nieuspra -wiedliwione", "ponad 3 mies", "w tym nieuspra -wiedliwione" }, 79, idDzialu, false, szerokoscKolumny, "po upływie terminiu ustawowego"));
            liczbaSporzadzonychUzasadnien.Columns.Add(PoUplywie);
            ASPxGridView1.Columns.Add(liczbaSporzadzonychUzasadnien);
         

            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("uzasadnienia wygłoszone *", "d_87", idDzialu, "", false, szerokoscKolumny));
            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Liczba spraw do których wpłynął wniosek o transkrypcje uzasadnień wygłoszonych", "d_88", idDzialu, "", false, szerokoscKolumny));
            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(new string[] { "razem", "w tym, w których projekt został zaakceptowany przez sędziego" }, 89, idDzialu, false, szerokoscKolumny, "Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent**"));

            GridViewBandColumn zalatwiono01skargiNaPrzewleklosc = DevExpressXXL.GetBoundColumn("skargi na przewlekłość");
            zalatwiono01skargiNaPrzewleklosc.Columns.Add(DevExpressXXL.kolumnaDoTabeli("wpływ", "d_91", idDzialu, "", false, szerokoscKolumny));

            zalatwiono01skargiNaPrzewleklosc.Columns.Add(DevExpressXXL.podKolumna(new string[] { "ogółem", "uwzględniono" }, 92, idDzialu, false, szerokoscKolumny, "załatwiono"));
            zalatwiono01skargiNaPrzewleklosc.Columns.Add(DevExpressXXL.kolumnaDoTabeli("pozostałość", "d_94", idDzialu, "", false, szerokoscKolumny));
            ASPxGridView1.Columns.Add(zalatwiono01skargiNaPrzewleklosc);

            GridViewBandColumn mediacje = DevExpressXXL.GetBoundColumn("mediacje");
            mediacje.Columns.Add(DevExpressXXL.podKolumna(new string[] { "liczba  spraw, w których strony skierowano do mediacji" }, 95, idDzialu, false, szerokoscKolumny, "WPŁYW"));
            mediacje.Columns.Add(DevExpressXXL.podKolumna(new string[] { "liczba ugód zawartych przed mediatorem", "w tym zatwierdzono ugodę" }, 96, idDzialu, false, szerokoscKolumny, "mediacje "));

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
            idDzialu = "2";
            ASPxGridView2.Columns.Add(DevExpressXXL.kolumnaDoTabeli("L.p.", "id", idDzialu, "", true, 36));
            ASPxGridView2.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Miesiąc", "miesiac", idDzialu, "", true, 250));


            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznych = DevExpressXXL.GetBoundColumn("Sprawy z zakresu ubezpieczeń społecznych ");
            ASPxGridView2.Columns.Add(DevExpressXXL.kolumnaDoTabeli("zaległość z roku 2018", "d_01", idDzialu, "", false, szerokoscKolumny));

            #region wplyw

            ASPxGridView2.Columns.Add(DevExpressXXL.podKolumna(new string[] { "Ogółem", "GC", "GNs", "GNc", "GCo", "GCps", "WSC" }, 2, idDzialu, false, szerokoscKolumny, "WPŁYW"));

            #endregion wplyw

            string[] teksty01 = new string[] { "Wydział ogółem", "GC", "GNs", "GNc", "GCo", "GCps", "WSC" };

            ASPxGridView2.Columns.Add(DevExpressXXL.SekcjaDwiePodKolumny(teksty01, "Wyznaczono", 9, idDzialu, szerokoscKolumny));
            ASPxGridView2.Columns.Add(DevExpressXXL.SekcjaDwiePodKolumny(teksty01, "Załatwiono", 23, idDzialu, szerokoscKolumny));

            #region zalatwienia

            ASPxGridView2.Columns.Add(DevExpressXXL.podKolumna(new string[] { "Ogółem", "GC", "GNs", "GNc", "GCo", "GCps", "WSC" }, 37, idDzialu, false, szerokoscKolumny, "Załatwienia"));

            #endregion zalatwienia

            #region sesje odbyte przez sędziego

            GridViewBandColumn sesjeSedziego = DevExpressXXL.GetBoundColumn("sesje odbyte przez sędziego ");

            GridViewBandColumn wszystkieSesjeSedziego = DevExpressXXL.GetBoundColumn("wszystkie sesje sędziego w wydziale ");
            wszystkieSesjeSedziego.Columns.Add(DevExpressXXL.kolumnaDoTabeli("ogółem", "d_44", idDzialu, "", false, szerokoscKolumny));
            wszystkieSesjeSedziego.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "rozprawy", "posiedzenia" }, 45, idDzialu, false, szerokoscKolumny, "z tego "));
            sesjeSedziego.Columns.Add(wszystkieSesjeSedziego);

            GridViewBandColumn naPotrzebyMSS = DevExpressXXL.GetBoundColumn("na potrzeby MS-S");
            naPotrzebyMSS.Columns.Add(DevExpressXXL.kolumnaDoTabeli("ogółem", "d_47", idDzialu, "", false, szerokoscKolumny));
            naPotrzebyMSS.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "rozprawy", "posiedzenia" }, 48, idDzialu, false, szerokoscKolumny, "z tego "));
            sesjeSedziego.Columns.Add(naPotrzebyMSS);

            ASPxGridView2.Columns.Add(sesjeSedziego);

            #endregion sesje odbyte przez sędziego

            ASPxGridView2.Columns.Add(DevExpressXXL.podKolumna(new string[] { "ogółem (wszystkie kategorie spraw)", "GC", "GNs" }, 50, idDzialu, false, szerokoscKolumny, "Liczba odroczonych publikacji orzeczeń"));
            ASPxGridView2.Columns.Add(DevExpressXXL.podKolumna(new string[] { "z terminem", "bez wyznaczonego terminu", "OGÓŁEM" }, 53, idDzialu, false, szerokoscKolumny, "Liczba spraw odroczonych"));
            ASPxGridView2.Columns.Add(DevExpressXXL.podKolumna(new string[] { "Ogółem", "GC", "GNs", "GNc", "GCo", "GCps", "WSC" }, 56, idDzialu, false, szerokoscKolumny, "POZOSTAŁOŚĆ na następny m-c"));
            ASPxGridView2.Columns.Add(DevExpressXXL.podKolumna(new string[] { "Ogółem", "do 3 m-cy", "pow. 3 do 6 m - cy", "pow. 6 do 12 m - cy", "pow. 12 m-cy do 2 lat", "pow. 2 do 3 lat", "pow. 3 do 5 lat", "pow. 5 do 8 lat", "pow. 8 lat" }, 63, idDzialu, false, szerokoscKolumny, "pozostało spraw starych (wszystkie kategorie spraw) "));
            ASPxGridView2.Columns.Add(DevExpressXXL.podKolumna(new string[] { "Ogółem", "zakreś- lonych", "nie zakreś- lonych" }, 72, idDzialu, false, szerokoscKolumny, "stan spraw zawieszonych (wszystkie kategorie spraw)"));

            GridViewBandColumn liczbaSporzadzonychUzasadnien = DevExpressXXL.podKolumna(new string[] { "Łącznie", "w terminie ustawowym 14 dni", "razem po terminie ustawowym", "nie- usprawied- liwione" }, 75, idDzialu, false, szerokoscKolumny, "liczba sporządzonych uzasadnień (wszystkie kategorie spraw)**");

            GridViewBandColumn PoUplywie = (DevExpressXXL.podKolumna(new string[] { "1-14 dni", "w tym nieuspra -wiedliwione", "15-30 dni", "w tym nieuspra -wiedliwione", "powyżej 1 do 3 mies", "w tym nieuspra -wiedliwione", "ponad 3 mies", "w tym nieuspra -wiedliwione" }, 79, idDzialu, false, szerokoscKolumny, "po upływie terminiu ustawowego"));
            liczbaSporzadzonychUzasadnien.Columns.Add(PoUplywie);
            ASPxGridView2.Columns.Add(liczbaSporzadzonychUzasadnien);


            ASPxGridView2.Columns.Add(DevExpressXXL.kolumnaDoTabeli("uzasadnienia wygłoszone *", "d_87", idDzialu, "", false, szerokoscKolumny));
            ASPxGridView2.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Liczba spraw do których wpłynął wniosek o transkrypcje uzasadnień wygłoszonych", "d_88", idDzialu, "", false, szerokoscKolumny));
            ASPxGridView2.Columns.Add(DevExpressXXL.podKolumna(new string[] { "razem", "w tym, w których projekt został zaakceptowany przez sędziego" }, 89, idDzialu, false, szerokoscKolumny, "Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent**"));

            GridViewBandColumn zalatwiono01skargiNaPrzewleklosc = DevExpressXXL.GetBoundColumn("skargi na przewlekłość");
            zalatwiono01skargiNaPrzewleklosc.Columns.Add(DevExpressXXL.kolumnaDoTabeli("wpływ", "d_91", idDzialu, "", false, szerokoscKolumny));

            zalatwiono01skargiNaPrzewleklosc.Columns.Add(DevExpressXXL.podKolumna(new string[] { "ogółem", "uwzględniono" }, 92, idDzialu, false, szerokoscKolumny, "załatwiono"));
            zalatwiono01skargiNaPrzewleklosc.Columns.Add(DevExpressXXL.kolumnaDoTabeli("pozostałość", "d_94", idDzialu, "", false, szerokoscKolumny));
            ASPxGridView2.Columns.Add(zalatwiono01skargiNaPrzewleklosc);

            GridViewBandColumn mediacje = DevExpressXXL.GetBoundColumn("mediacje");
            mediacje.Columns.Add(DevExpressXXL.podKolumna(new string[] { "liczba  spraw, w których strony skierowano do mediacji" }, 95, idDzialu, false, szerokoscKolumny, "WPŁYW"));
            mediacje.Columns.Add(DevExpressXXL.podKolumna(new string[] { "liczba ugód zawartych przed mediatorem", "w tym zatwierdzono ugodę" }, 96, idDzialu, false, szerokoscKolumny, "mediacje "));

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