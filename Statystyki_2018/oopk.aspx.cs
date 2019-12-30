/*
Last Update:
    - version 1.191215
Creation date: 2019-12-15

*/

using DevExpress.Web;
using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;

namespace stat2018
{
    public partial class oopk : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();
        public devExpressXXL DevExpressXXL = new devExpressXXL();
        private const string tenPlik = "oopk.aspx";
        private const string tenPlikNazwa = "oopk";
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
            infoLabel1.Visible = false;
            try
            {
                string idDzialu = (string)Session["id_dzialu"];
                infoLabel1.Visible = cl.debug(int.Parse(idDzialu));
            }
            catch
            { }
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
            DataTable tabela = (DataTable)Session["tabelka001"];
            if (tabela == null)
            {
                return;
            }
            foreach (DataRow dr in tabela.Select($"id=0"))
                dr.Delete();
            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                ExcelWorksheet MyWorksheet1 = MyExcel.Workbook.Worksheets[1];

                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], tabela, 105, 0, 7, true, true, false, false, false);
                // tb.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[2], (DataTable)Session["tabelka002"], 12, 100, 1, 7, false);

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
            string idTabeli = "1";
            DataTable tabelka01 = DevExpressXXL.zLicznikiemKolumn(dr.konwertujNaPrzecinek(dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 1, Date1.Date, Date2.Date, 150, tenPlik)));
            Session["tabelka001"] = tabelka01;
            if (tabelka01 == null)
            {
                cm.log.Info(tenPlik + ": brak danych dla tabeli 1");
                return;
            }
            ASPxGridView1.DataSource = null;
            ASPxGridView1.DataSourceID = null;
            ASPxGridView1.AutoGenerateColumns = true;
            ASPxGridView1.DataSource = tabelka01;
            ASPxGridView1.DataBind();
            ASPxGridView1.KeyFieldName = "id_sedziego";
            ASPxGridView1.Columns.Clear();
            int szerokoscKolumny = 80;
            ASPxGridView1.Width = Panel1.Width;
            idTabeli = "1";
            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("L.p.", "id", idTabeli, "", true, 36));
            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Imie i nazwisko", "Imienazwisko", idTabeli, "", true, 250));

            string[] teksty01 = new string[] { "śledztwa", "dochodzenia" };
            string[] teksty02 = new string[] { "Ogółem", "K", "W", "Kop", "Kp", "Ko karne", "Ko wykrocz." };
            string[] teksty03 = new string[] { "ogółem", "zakreślonych", "niezakreślonych" };
            string[] teksty04 = new string[] { "Ogółem", "do 3 m-cy", "pow. 3 do 6 m - cy", "pow. 6 do 12 m - cy", "pow. 12 m-cy do 2 lat", "pow. 2 do 3 lat", "pow. 3 do 5 lat", "pow. 5 do 8 lat", "pow. 8 lat" };
            string[] teksty05 = new string[] { "z terminem	", "bez terminu", "OGÓŁEM (wraz z publikacją orzeczeń)	" };
            string[] teksty06 = new string[] { "Ogółem (wszystkie kategorie spraw)", "K", "W" };
            string[] teksty07 = new string[] { "z terminem	", "bez wyznaczonego terminu	", "terminu	OGÓŁEM (wraz z publikacją orzeczeń)" };

            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("zaległość z poprzedniego roku", "d_01", idTabeli, "", false, szerokoscKolumny));

            #region wplyw

            GridViewBandColumn kolumna_Wplyw = DevExpressXXL.GetBoundColumn("Wpływ");
            kolumna_Wplyw.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Ogółem", "d_02", idTabeli, "", false, szerokoscKolumny));
            kolumna_Wplyw.Columns.Add(DevExpressXXL.kolumnaDoTabeli("K", "d_03", idTabeli, "", false, szerokoscKolumny));
            kolumna_Wplyw.Columns.Add(DevExpressXXL.podKolumna(teksty01, 4, idTabeli, false, szerokoscKolumny, "w tym postępowanie przygotowawcze zakończone w formie*"));
            kolumna_Wplyw.Columns.Add(DevExpressXXL.kolumnaDoTabeli("W", "d_06", idTabeli, "", false, szerokoscKolumny));
            kolumna_Wplyw.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Kop", "d_07", idTabeli, "", false, szerokoscKolumny));
            kolumna_Wplyw.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Kp", "d_08", idTabeli, "", false, szerokoscKolumny));
            kolumna_Wplyw.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Ko karne", "d_09", idTabeli, "", false, szerokoscKolumny));
            kolumna_Wplyw.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Ko wykrocz.", "d_10", idTabeli, "", false, szerokoscKolumny));
            ASPxGridView1.Columns.Add(kolumna_Wplyw);

            #endregion wplyw

            #region Wyznaczono

            ASPxGridView1.Columns.Add(DevExpressXXL.SekcjaDwiePodKolumny(teksty02, "Wyznaczono", 11, idTabeli, szerokoscKolumny));
            ASPxGridView1.Columns.Add(DevExpressXXL.SekcjaDwiePodKolumny(teksty02, "Załatwiono", 25, idTabeli, szerokoscKolumny));

            #endregion Wyznaczono

            #region zalatwienia

            GridViewBandColumn zalatwienia = DevExpressXXL.GetBoundColumn("Załatwienia");
            zalatwienia.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Ogółem", "d_39", idTabeli, "", false, szerokoscKolumny));
            zalatwienia.Columns.Add(DevExpressXXL.kolumnaDoTabeli("K", "d_40", idTabeli, "", false, szerokoscKolumny));
            zalatwienia.Columns.Add(DevExpressXXL.podKolumna(teksty01, 41, idTabeli, false, szerokoscKolumny, "w tym postępowanie przygotowawcze zakończone w formie*"));
            zalatwienia.Columns.Add(DevExpressXXL.kolumnaDoTabeli("W", "d_43", idTabeli, "", false, szerokoscKolumny));
            zalatwienia.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Kop", "d_44", idTabeli, "", false, szerokoscKolumny));
            zalatwienia.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Kp", "d_45", idTabeli, "", false, szerokoscKolumny));
            zalatwienia.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Ko karne", "d_46", idTabeli, "", false, szerokoscKolumny));
            zalatwienia.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Ko wykrocz.", "d_47", idTabeli, "", false, szerokoscKolumny));
            ASPxGridView1.Columns.Add(zalatwienia);

            #endregion zalatwienia

            #region sesje odbyte przez sędziego

            GridViewBandColumn sesjeSedziego = DevExpressXXL.GetBoundColumn("sesje odbyte przez sędziego ");

            GridViewBandColumn wszystkieSesjeSedziego = DevExpressXXL.GetBoundColumn("wszystkie sesje sędziego w wydziale ");
            wszystkieSesjeSedziego.Columns.Add(DevExpressXXL.kolumnaDoTabeli("ogółem", "d_48", idDzialu, "", false, szerokoscKolumny));
            wszystkieSesjeSedziego.Columns.Add(DevExpressXXL.podKolumna(new string[] { "rozprawy", "posiedzenia" }, 49, idDzialu, false, szerokoscKolumny, "z tego "));
            sesjeSedziego.Columns.Add(wszystkieSesjeSedziego);

            GridViewBandColumn naPotrzebyMSS = DevExpressXXL.GetBoundColumn("na potrzeby MS-S");
            naPotrzebyMSS.Columns.Add(DevExpressXXL.kolumnaDoTabeli("ogółem", "d_51", idDzialu, "", false, szerokoscKolumny));
            naPotrzebyMSS.Columns.Add(DevExpressXXL.podKolumna(new string[] { "rozprawy", "posiedzenia" }, 52, idDzialu, false, szerokoscKolumny, "z tego "));
            sesjeSedziego.Columns.Add(naPotrzebyMSS);

            ASPxGridView1.Columns.Add(sesjeSedziego);

            #endregion sesje odbyte przez sędziego

            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(teksty06, 54, idTabeli, false, szerokoscKolumny, "Liczba odroczonych publikacji orzeczeń"));
            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(teksty07, 57, idTabeli, false, szerokoscKolumny, "Liczba odroczonych spraw"));
            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(teksty02, 60, idTabeli, false, szerokoscKolumny, "POZOSTAŁOŚĆ na następny miesiąc"));

            #region pozostało spraw starych

            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(teksty04, 67, idTabeli, false, szerokoscKolumny, "Pozostało spraw starych"));

            #endregion pozostało spraw starych

            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(teksty03, 76, idTabeli, false, szerokoscKolumny, "stan spraw zawieszonych (wszystkie kategorie spraw)"));

            #region liczba sporządzonych uzasadnień (wszystkie kategorie spraw)

            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznychDwieInstancjeLiczbaSporzadzonychUzasadnien = DevExpressXXL.GetBoundColumn("liczba sporządzonych uzasadnień (wszystkie kategorie spraw)");

            kolumna_SprawyZakresuUbezpieczenSpolecznychDwieInstancjeLiczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeli("łącznie", "d_79", idTabeli, "", false, szerokoscKolumny));
            kolumna_SprawyZakresuUbezpieczenSpolecznychDwieInstancjeLiczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeli("w terminie ustawowym 14 dni", "d_80", idTabeli, "", false, szerokoscKolumny));
            kolumna_SprawyZakresuUbezpieczenSpolecznychDwieInstancjeLiczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeli("razem po terminie ustawowym", "d_81", idTabeli, "", false, szerokoscKolumny));
            kolumna_SprawyZakresuUbezpieczenSpolecznychDwieInstancjeLiczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeli("nieuspra- wiedliwione", "d_82", idTabeli, "", false, szerokoscKolumny));
            kolumna_SprawyZakresuUbezpieczenSpolecznychDwieInstancjeLiczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.podKolumna(new string[] { "1-14 dni", "w tym nieuspra -wiedliwione", "15-30 dni", "w tym nieuspra -wiedliwione", "powyżej 1 do 3 mies", "w tym nieuspra -wiedliwione", "ponad 3 mies", "w tym nieuspra -wiedliwione" }, 83, idTabeli, false, szerokoscKolumny, "po upływie terminiu ustawowego"));

            ASPxGridView1.Columns.Add(kolumna_SprawyZakresuUbezpieczenSpolecznychDwieInstancjeLiczbaSporzadzonychUzasadnien);

            #endregion liczba sporządzonych uzasadnień (wszystkie kategorie spraw)

            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Uzasadnienia wygłoszone", "d_91", idTabeli, "", false, szerokoscKolumny));
            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Liczba spraw do których wpłynął wniosek o transkrypcję uzasadnien wygłoszone", "d_92", idTabeli, "", false, szerokoscKolumny));
            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(new string[] { "razem k.13 w.01", "w tym, w których projekt został zaakceptowany przez sędziego" }, 93, idTabeli, false, szerokoscKolumny, "Liczba spraw, w których projekt uzasadnienia sporządził asystent**"));
            ASPxGridView1.Columns.Add(DevExpressXXL.SkargiNaPrzewleklosc(95, idTabeli, szerokoscKolumny));
            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(new string[] { "liczba mediacji wpisanych w danym miesiącu do Wykazu Med.", "liczba spraw z rep. K załatwionych w związku z postępowaniem mediacyjnym", "w tym liczba spraw, w których postępowanie zakończyło się ugodą" }, 98, idTabeli, false, szerokoscKolumny, "Mediacje"));
            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Uwagi", "d_101", idTabeli, "", false, szerokoscKolumny));
            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(new string[] { "na rozprawe", "na posiedzenie" }, 102, idTabeli, false, szerokoscKolumny, "Kolumna kontrolna (wyznaczenia>=załatwienia)"));

            ASPxGridView1.TotalSummary.Clear();
            ASPxGridView1.TotalSummary.Add(DevExpressXXL.komorkaSumujaca("Ogółem"));
            for (int i = 1; i < 104; i++)
            {
                ASPxGridView1.TotalSummary.Add(DevExpressXXL.komorkaSumujaca(i));
            }
        }

        private GridViewBandColumn sekcjaDuza(string Opis, string idTabeli, int przesuniecie, int szerokoscKolumny)
        {
            string[] teksty02 = new string[] { "Ogółem", "U", "Uo", "WSC sk.o stw. niezg. z pr." };
            string[] teksty03 = new string[] { "Ogółem", "Ua", "Uz", "WSC sk.o stw. niezg. z pr.", "WSC sk. Kasacyjna", "WSC sk.o stw. niezg. z pr. II inst.", "Wykaz S Skargi na post. sądowe" };

            GridViewBandColumn kolumna = DevExpressXXL.GetBoundColumn(Opis);
            //I + II instancja łącznie
            kolumna.Columns.Add(DevExpressXXL.podKolumna(new string[] { "na rozprawe", "na posie- dzenie" }, przesuniecie, idTabeli, false, szerokoscKolumny, "I + II instancja łącznie"));
            kolumna.Columns.Add(DevExpressXXL.SekcjaDwiePodKolumny(teksty02, "I instancja", przesuniecie + 2, idTabeli, szerokoscKolumny));
            kolumna.Columns.Add(DevExpressXXL.SekcjaDwiePodKolumny(teksty03, "II instancja", przesuniecie + 10, idTabeli, szerokoscKolumny));
            return kolumna;
        }

        protected void Suma(object sender, DevExpress.Data.CustomSummaryEventArgs e)
        {
            ASPxSummaryItem sumItem = (ASPxSummaryItem)e.Item;
        }

        protected void ASPxGridView1_SummaryDisplayText(object sender, ASPxGridViewSummaryDisplayTextEventArgs e)
        {
            try
            {
                if (e.Item.FieldName.Contains("d_"))
                {
                    double value = double.Parse(e.Value.ToString());
                    string field = e.Item.FieldName.Replace("d_", "");
                    value = value - double.Parse(field);
                    e.Text = value.ToString();
                }
            }
            catch
            {
            }
        }
    }
}