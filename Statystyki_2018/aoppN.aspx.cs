/*
Last Update:
    - version 1.191213
Creation date: 2019-12-12

*/

using DevExpress.Web;
using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;

namespace stat2018
{
    public partial class aoppN : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();
        public devExpressXXL DevExpressXXL = new devExpressXXL();
        private const string tenPlik = "aopp.aspx";
        private const string tenPlikNazwa = "aopp";
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


            DataTable tabela = (DataTable)Session["tabelka001"];
            if (tabela == null)
            {
                return;
            }
            foreach (DataRow dr in tabela.Select($"id=0"))
                dr.Delete();


            FileInfo fNewFile = new FileInfo(download + "_.xlsx");

            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                ExcelWorksheet MyWorksheet1 = MyExcel.Workbook.Worksheets[1];

                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], tabela, 100, 0, 7, true, true, false, false, false);
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
            DataTable tabelka01 = DevExpressXXL.zLicznikiemKolumn(dr.konwertujNaPrzecinek(dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 5, Date1.Date, Date2.Date, 281, tenPlik)));

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
            idDzialu = "5";
            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("L.p.", "id", idDzialu, "", true, 36));
            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Imie i nazwisko", "Imienazwisko", idDzialu, "", true, 250));

            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznych = DevExpressXXL.GetBoundColumn("Sprawy z zakresu ubezpieczeń społecznych ");
            kolumna_SprawyZakresuUbezpieczenSpolecznych.Columns.Add(DevExpressXXL.kolumnaDoTabeli("zaległość z poprzedniego roku", "d_01", idDzialu, "", false, szerokoscKolumny));

            string[] teksty01 = new string[] { "Ogółem", "U", "Uo", "WSC skarga o stw. niezg. z pr." };
            string[] teksty02 = new string[] { "Ogółem", "Ua", "Uz", "Uo II inst", "WSC skarga kasacyjna", "WSC skarga o stw. niezg. z pr.II inst.", "I + II instancja łącznie" };
            string[] teksty03 = new string[] { "ogółem", "zakreślonych", "niezakreślonych" };
            string[] teksty04 = new string[] { "Ogółem", "do 3 m-cy", "pow. 3 do 6 m - cy", "pow. 6 do 12 m - cy", "pow. 12 m-cy do 2 lat", "pow. 2 do 3 lat", "pow. 3 do 5 lat", "pow. 5 do 8 lat", "pow. 8 lat" };
            string[] teksty05 = new string[] { "z terminem	", "bez terminu", "OGÓŁEM (wraz z publikacją orzeczeń)	" };

            #region wplyw

            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznychWplyw = DevExpressXXL.GetBoundColumn("Wpływ");
            kolumna_SprawyZakresuUbezpieczenSpolecznychWplyw.Columns.Add(DevExpressXXL.kolumnaDoTabeli("I + II instancja łącznie", "d_02", idDzialu, "", false, szerokoscKolumny));

            kolumna_SprawyZakresuUbezpieczenSpolecznychWplyw.Columns.Add(DevExpressXXL.podKolumna(teksty01, 3, idDzialu, false, szerokoscKolumny, "I instancja"));
            kolumna_SprawyZakresuUbezpieczenSpolecznychWplyw.Columns.Add(DevExpressXXL.podKolumna(teksty02, 7, idDzialu, false, szerokoscKolumny, "II instancja"));
            kolumna_SprawyZakresuUbezpieczenSpolecznych.Columns.Add(kolumna_SprawyZakresuUbezpieczenSpolecznychWplyw);

            #endregion wplyw

            #region ZAŁATWIENIA

            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznychZalatwienia = DevExpressXXL.GetBoundColumn("ZAŁATWIENIA");
            kolumna_SprawyZakresuUbezpieczenSpolecznychZalatwienia.Columns.Add(DevExpressXXL.kolumnaDoTabeli("I + II instancja łącznie", "d_14", idDzialu, "", false, szerokoscKolumny));

            kolumna_SprawyZakresuUbezpieczenSpolecznychZalatwienia.Columns.Add(DevExpressXXL.podKolumna(teksty01, 15, idDzialu, false, szerokoscKolumny, "I instancja"));
            kolumna_SprawyZakresuUbezpieczenSpolecznychZalatwienia.Columns.Add(DevExpressXXL.podKolumna(teksty02, 19, idDzialu, false, szerokoscKolumny, "II instancja"));
            kolumna_SprawyZakresuUbezpieczenSpolecznych.Columns.Add(kolumna_SprawyZakresuUbezpieczenSpolecznychZalatwienia);

            #endregion ZAŁATWIENIA

            #region sesje odbyte przez sędziego

            GridViewBandColumn sesjeSedziego = DevExpressXXL.GetBoundColumn("sesje odbyte przez sędziego ");

            GridViewBandColumn wszystkieSesjeSedziego = DevExpressXXL.GetBoundColumn("wszystkie sesje sędziego w wydziale ");
            wszystkieSesjeSedziego.Columns.Add(DevExpressXXL.kolumnaDoTabeli("ogółem", "d_26", idDzialu, "", false, szerokoscKolumny));
            wszystkieSesjeSedziego.Columns.Add(DevExpressXXL.podKolumna(new string[] { "rozprawy", "posiedzenia" }, 27, idDzialu, false, szerokoscKolumny, "z tego "));
            sesjeSedziego.Columns.Add(wszystkieSesjeSedziego);

            GridViewBandColumn naPotrzebyMSS = DevExpressXXL.GetBoundColumn("na potrzeby MS-S");
            naPotrzebyMSS.Columns.Add(DevExpressXXL.kolumnaDoTabeli("ogółem", "d_29", idDzialu, "", false, szerokoscKolumny));
            naPotrzebyMSS.Columns.Add(DevExpressXXL.podKolumna(new string[] { "rozprawy", "posiedzenia" }, 30, idDzialu, false, szerokoscKolumny, "z tego "));
            sesjeSedziego.Columns.Add(naPotrzebyMSS);

            kolumna_SprawyZakresuUbezpieczenSpolecznych.Columns.Add(sesjeSedziego);

            #endregion sesje odbyte przez sędziego

            kolumna_SprawyZakresuUbezpieczenSpolecznych.Columns.Add(DevExpressXXL.podKolumna(new string[] { "Ogółem I Instancja", "Ogółem II Instancja" }, 32, idDzialu, false, szerokoscKolumny, "Liczba odroczonych publikacji orzeczeń"));

            #region Liczba odroczonych spraw

            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznychLiczbaOdroczonychSpraw = DevExpressXXL.GetBoundColumn("Liczba odroczonych spraw");
            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznychLiczbaOdroczonychSprawInstancjaI = DevExpressXXL.podKolumna(teksty05, 34, idDzialu, false, szerokoscKolumny, "I instancja");
            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznychLiczbaOdroczonychSprawInstancjaII = DevExpressXXL.podKolumna(teksty05, 37, idDzialu, false, szerokoscKolumny, "II instancja");
            kolumna_SprawyZakresuUbezpieczenSpolecznychLiczbaOdroczonychSpraw.Columns.Add(kolumna_SprawyZakresuUbezpieczenSpolecznychLiczbaOdroczonychSprawInstancjaI);
            kolumna_SprawyZakresuUbezpieczenSpolecznychLiczbaOdroczonychSpraw.Columns.Add(kolumna_SprawyZakresuUbezpieczenSpolecznychLiczbaOdroczonychSprawInstancjaII);
            kolumna_SprawyZakresuUbezpieczenSpolecznych.Columns.Add(kolumna_SprawyZakresuUbezpieczenSpolecznychLiczbaOdroczonychSpraw);

            #endregion Liczba odroczonych spraw

            #region Pozostalosc

            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznychPozostalosc = DevExpressXXL.GetBoundColumn("POZOSTAŁOŚĆ na następny m-c");
            kolumna_SprawyZakresuUbezpieczenSpolecznychPozostalosc.Columns.Add(DevExpressXXL.kolumnaDoTabeli("I + II instancja łącznie", "d_40", idDzialu, "", false, szerokoscKolumny));

            kolumna_SprawyZakresuUbezpieczenSpolecznychPozostalosc.Columns.Add(DevExpressXXL.podKolumna(teksty01, 41, idDzialu, false, szerokoscKolumny, "I instancja"));
            kolumna_SprawyZakresuUbezpieczenSpolecznychPozostalosc.Columns.Add(DevExpressXXL.podKolumna(teksty02, 45, idDzialu, false, szerokoscKolumny, "II instancja"));
            kolumna_SprawyZakresuUbezpieczenSpolecznych.Columns.Add(kolumna_SprawyZakresuUbezpieczenSpolecznychPozostalosc);

            #endregion Pozostalosc

            #region stan spraw zawieszonych

            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznychstanSprawZawieszonych = DevExpressXXL.GetBoundColumn("stan spraw zawieszonych (wszystkie kategorie spraw)");
            kolumna_SprawyZakresuUbezpieczenSpolecznychstanSprawZawieszonych.Columns.Add(DevExpressXXL.podKolumna(teksty03, 52, idDzialu, false, szerokoscKolumny, "II instancja łącznie"));
            kolumna_SprawyZakresuUbezpieczenSpolecznychstanSprawZawieszonych.Columns.Add(DevExpressXXL.podKolumna(teksty03, 55, idDzialu, false, szerokoscKolumny, "I instancja"));
            kolumna_SprawyZakresuUbezpieczenSpolecznychstanSprawZawieszonych.Columns.Add(DevExpressXXL.podKolumna(teksty03, 58, idDzialu, false, szerokoscKolumny, "II instancja"));

            kolumna_SprawyZakresuUbezpieczenSpolecznych.Columns.Add(kolumna_SprawyZakresuUbezpieczenSpolecznychstanSprawZawieszonych);

            #endregion stan spraw zawieszonych

            #region pozostało spraw starych

            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznychPozostaloSprawStarych = DevExpressXXL.GetBoundColumn("pozostało spraw starych (wszystkie kategorie spraw)");
            kolumna_SprawyZakresuUbezpieczenSpolecznychPozostaloSprawStarych.Columns.Add(DevExpressXXL.podKolumna(teksty04, 61, idDzialu, false, szerokoscKolumny, "II instancja łącznie"));
            kolumna_SprawyZakresuUbezpieczenSpolecznychPozostaloSprawStarych.Columns.Add(DevExpressXXL.podKolumna(teksty04, 70, idDzialu, false, szerokoscKolumny, "I instancja"));
            kolumna_SprawyZakresuUbezpieczenSpolecznychPozostaloSprawStarych.Columns.Add(DevExpressXXL.podKolumna(teksty04, 79, idDzialu, false, szerokoscKolumny, "II instancja"));

            kolumna_SprawyZakresuUbezpieczenSpolecznych.Columns.Add(kolumna_SprawyZakresuUbezpieczenSpolecznychPozostaloSprawStarych);

            #endregion pozostało spraw starych

            #region dwi instancje

            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznychDwieInstancje = DevExpressXXL.GetBoundColumn("I + II instancja łącznie");

            #region liczba sporządzonych uzasadnień (wszystkie kategorie spraw)

            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznychDwieInstancjeLiczbaSporzadzonychUzasadnien = DevExpressXXL.GetBoundColumn("liczba sporządzonych uzasadnień (wszystkie kategorie spraw)");

            kolumna_SprawyZakresuUbezpieczenSpolecznychDwieInstancjeLiczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeli("łącznie", "d_88", idDzialu, "", false, szerokoscKolumny));
            kolumna_SprawyZakresuUbezpieczenSpolecznychDwieInstancjeLiczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeli("w terminie ustawowym 14 dni", "d_89", idDzialu, "", false, szerokoscKolumny));
            kolumna_SprawyZakresuUbezpieczenSpolecznychDwieInstancjeLiczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeli("razem po terminie ustawowym", "d_90", idDzialu, "", false, szerokoscKolumny));
            kolumna_SprawyZakresuUbezpieczenSpolecznychDwieInstancjeLiczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeli("nieuspra- wiedliwione", "d_91", idDzialu, "", false, szerokoscKolumny));
            kolumna_SprawyZakresuUbezpieczenSpolecznychDwieInstancjeLiczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.podKolumna(new string[] { "1-14 dni", "w tym nieuspra -wiedliwione", "15-30 dni", "w tym nieuspra -wiedliwione", "powyżej 1 do 3 mies", "w tym nieuspra -wiedliwione", "ponad 3 mies", "w tym nieuspra -wiedliwione" }, 92, idDzialu, false, szerokoscKolumny, "po upływie terminiu ustawowego"));

            kolumna_SprawyZakresuUbezpieczenSpolecznychDwieInstancje.Columns.Add(kolumna_SprawyZakresuUbezpieczenSpolecznychDwieInstancjeLiczbaSporzadzonychUzasadnien);

            #endregion liczba sporządzonych uzasadnień (wszystkie kategorie spraw)

            #region uzasadnienia wygłoszone

            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznychDwieInstancjeUzasadnieniaWygloszone = DevExpressXXL.podKolumna(new string[] { "ogółem", "w których wpłynął wniosek o transkrypcję" }, 100, idDzialu, false, szerokoscKolumny, "uzasadnienia wygłoszone *");
            kolumna_SprawyZakresuUbezpieczenSpolecznychDwieInstancje.Columns.Add(kolumna_SprawyZakresuUbezpieczenSpolecznychDwieInstancjeUzasadnieniaWygloszone);

            #endregion uzasadnienia wygłoszone

            #region Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent

            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznychDwieInstancjeProjektAsystenta = DevExpressXXL.podKolumna(new string[] { "razem", "w tym, w których projekt został zaakceptowany przez sędziego" }, 102, idDzialu, false, szerokoscKolumny, " Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent");
            kolumna_SprawyZakresuUbezpieczenSpolecznychDwieInstancje.Columns.Add(kolumna_SprawyZakresuUbezpieczenSpolecznychDwieInstancjeProjektAsystenta);

            #endregion Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent

            kolumna_SprawyZakresuUbezpieczenSpolecznych.Columns.Add(kolumna_SprawyZakresuUbezpieczenSpolecznychDwieInstancje);

            #endregion dwi instancje

            #region instancja I

            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaI = DevExpressXXL.GetBoundColumn("I instancja");

            #region liczba sporządzonych uzasadnień (wszystkie kategorie spraw)

            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaILiczbaSporzadzonychUzasadnien = DevExpressXXL.GetBoundColumn("liczba sporządzonych uzasadnień (wszystkie kategorie spraw)");

            kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaILiczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeli("łącznie", "d_104", idDzialu, "", false, szerokoscKolumny));
            kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaILiczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeli("w terminie ustawowym 14 dni", "d_105", idDzialu, "", false, szerokoscKolumny));
            kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaILiczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeli("razem po terminie ustawowym", "d_106", idDzialu, "", false, szerokoscKolumny));
            kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaILiczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeli("nieuspra- wiedliwione", "d_107", idDzialu, "", false, szerokoscKolumny));
            kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaILiczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.podKolumna(new string[] { "1-14 dni", "w tym nieuspra -wiedliwione", "15-30 dni", "w tym nieuspra -wiedliwione", "powyżej 1 do 3 mies", "w tym nieuspra -wiedliwione", "ponad 3 mies", "w tym nieuspra -wiedliwione" }, 108, idDzialu, false, szerokoscKolumny, "po upływie terminiu ustawowego"));

            kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaI.Columns.Add(kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaILiczbaSporzadzonychUzasadnien);

            #endregion liczba sporządzonych uzasadnień (wszystkie kategorie spraw)

            #region uzasadnienia wygłoszone

            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaIUzasadnieniaWygloszone = DevExpressXXL.podKolumna(new string[] { "ogółem", "w których wpłynął wniosek o transkrypcję" }, 116, idDzialu, false, szerokoscKolumny, "uzasadnienia wygłoszone *");
            kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaI.Columns.Add(kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaIUzasadnieniaWygloszone);

            #endregion uzasadnienia wygłoszone

            #region Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent

            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaIProjektAsystenta = DevExpressXXL.podKolumna(new string[] { "razem", "w tym, w których projekt został zaakceptowany przez sędziego" }, 118, idDzialu, false, szerokoscKolumny, " Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent");
            kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaI.Columns.Add(kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaIProjektAsystenta);

            #endregion Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent

            kolumna_SprawyZakresuUbezpieczenSpolecznych.Columns.Add(kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaI);

            #endregion instancja I

            #region instancja II

            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaII = DevExpressXXL.GetBoundColumn("II instancja");

            #region liczba sporządzonych uzasadnień (wszystkie kategorie spraw)

            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaIILiczbaSporzadzonychUzasadnien = DevExpressXXL.GetBoundColumn("liczba sporządzonych uzasadnień (wszystkie kategorie spraw)");

            kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaIILiczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeli("łącznie", "d_120", idDzialu, "", false, szerokoscKolumny));
            kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaIILiczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeli("w terminie ustawowym 14 dni", "d_121", idDzialu, "", false, szerokoscKolumny));
            kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaIILiczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeli("razem po terminie ustawowym", "d_122", idDzialu, "", false, szerokoscKolumny));
            kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaIILiczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeli("nieuspra- wiedliwione", "d_123", idDzialu, "", false, szerokoscKolumny));
            kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaIILiczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.podKolumna(new string[] { "1-14 dni", "w tym nieuspra -wiedliwione", "15-30 dni", "w tym nieuspra -wiedliwione", "powyżej 1 do 3 mies", "w tym nieuspra -wiedliwione", "ponad 3 mies", "w tym nieuspra -wiedliwione" }, 124, idDzialu, false, szerokoscKolumny, "po upływie terminiu ustawowego"));

            kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaII.Columns.Add(kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaIILiczbaSporzadzonychUzasadnien);

            #endregion liczba sporządzonych uzasadnień (wszystkie kategorie spraw)

            #region uzasadnienia wygłoszone

            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaIIUzasadnieniaWygloszone = DevExpressXXL.podKolumna(new string[] { "ogółem", "w których wpłynął wniosek o transkrypcję" }, 132, idDzialu, false, szerokoscKolumny, "uzasadnienia wygłoszone *");
            kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaII.Columns.Add(kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaIIUzasadnieniaWygloszone);

            #endregion uzasadnienia wygłoszone

            #region Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent

            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaIIProjektAsystenta = DevExpressXXL.podKolumna(new string[] { "razem", "w tym, w których projekt został zaakceptowany przez sędziego" }, 134, idDzialu, false, szerokoscKolumny, " Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent");
            kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaII.Columns.Add(kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaIIProjektAsystenta);

            #endregion Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent

            kolumna_SprawyZakresuUbezpieczenSpolecznych.Columns.Add(kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaII);

            #endregion instancja II

            #region Skargi na przewlekłość

            GridViewBandColumn zalatwiono01skargiNaPrzewleklosc = DevExpressXXL.GetBoundColumn("skargi na przewlekłość");
            zalatwiono01skargiNaPrzewleklosc.Columns.Add(DevExpressXXL.kolumnaDoTabeli("wpływ", "d_136", idDzialu, "", false, szerokoscKolumny));

            zalatwiono01skargiNaPrzewleklosc.Columns.Add(DevExpressXXL.podKolumna(new string[] { "ogółem", "uwzględniono" }, 137, idDzialu, false, szerokoscKolumny, "załatwiono"));
            zalatwiono01skargiNaPrzewleklosc.Columns.Add(DevExpressXXL.kolumnaDoTabeli("pozostałość", "d_139", idDzialu, "", false, szerokoscKolumny));
            kolumna_SprawyZakresuUbezpieczenSpolecznych.Columns.Add(zalatwiono01skargiNaPrzewleklosc);

            #endregion Skargi na przewlekłość

            kolumna_SprawyZakresuUbezpieczenSpolecznych.Columns.Add(DevExpressXXL.kolumnaDoTabeli("UWAGI", "d_140", idDzialu, "", false, szerokoscKolumny));

            ASPxGridView1.Columns.Add(kolumna_SprawyZakresuUbezpieczenSpolecznych);

            ASPxGridView1.Columns.Add(drugaczesc(idDzialu, szerokoscKolumny));

            ASPxGridView1.TotalSummary.Clear();
            ASPxGridView1.TotalSummary.Add(DevExpressXXL.komorkaSumujaca("Ogółem"));
            for (int i = 1; i < 214; i++)
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
            DataTable tabelka01 = DevExpressXXL.zLicznikiemKolumn(dr.konwertujNaPrzecinek(dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 2, Date1.Date, Date2.Date, 281, tenPlik)));

            Session["tabelka002"] = tabelka01;

            ASPxGridView2.DataSource = null;
            ASPxGridView2.DataSourceID = null;
            ASPxGridView2.AutoGenerateColumns = true;
            ASPxGridView2.DataSource = tabelka01;
            ASPxGridView2.DataBind();
            ASPxGridView2.KeyFieldName = "id_sedziego";
            ASPxGridView2.Columns.Clear();
            int szerokoscKolumny = 80;
            ASPxGridView2.Width = Panel1.Width;

            string idTabeli = "2";
            ASPxGridView2.Columns.Add(DevExpressXXL.kolumnaDoTabeli("L.p.", "id", idTabeli, "", true, 36));
            ASPxGridView2.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Imie i nazwisko", "Imienazwisko", idTabeli, "", true, 250));

            string[] teksty01 = new string[] { "Wydział ogółem", "GC", "GNs", "GNc", "GCo", "GCps", "WSC" };
            string[] teksty02 = new string[] { "Ogółem", "U", "Uo", "WSC sk.o stw. niezg. z pr." };
            string[] teksty03 = new string[] { "Ogółem", "Ua", "Uz", "WSC sk.o stw. niezg. z pr.", "WSC sk. Kasacyjna", "WSC sk.o stw. niezg. z pr. II inst.", "Wykaz S Skargi na post. sądowe" };

            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznych = DevExpressXXL.GetBoundColumn("Sprawy z zakresu ubezpieczeń społecznych ");

            kolumna_SprawyZakresuUbezpieczenSpolecznych.Columns.Add(sekcjaDuza("Wyznaczono", idTabeli, 1, szerokoscKolumny));
            kolumna_SprawyZakresuUbezpieczenSpolecznych.Columns.Add(sekcjaDuza("Załatwiono", idTabeli, 25, szerokoscKolumny));
            ASPxGridView2.Columns.Add(kolumna_SprawyZakresuUbezpieczenSpolecznych);

            GridViewBandColumn kolumna_SprawyZakresuPrawaPracy = DevExpressXXL.GetBoundColumn("Sprawy z zakresu prawa pracy");

            kolumna_SprawyZakresuPrawaPracy.Columns.Add(sekcjaDuza("Wyznaczono", idTabeli, 49, szerokoscKolumny));
            kolumna_SprawyZakresuPrawaPracy.Columns.Add(sekcjaDuza("Załatwiono", idTabeli, 73, szerokoscKolumny));
            ASPxGridView2.Columns.Add(kolumna_SprawyZakresuPrawaPracy);

            GridViewBandColumn kolumna_Koniec1 = DevExpressXXL.GetBoundColumn("Sprawy z zakresu ubezpieczeń społecznych");
            kolumna_Koniec1.Columns.Add(DevExpressXXL.podKolumna(new string[] { "na rozprawe", "na posie- dzenie" }, 101, idTabeli, false, szerokoscKolumny, "Kolumna kontrolna (wyznaczenia>=załatwień)"));
            ASPxGridView2.Columns.Add(kolumna_Koniec1);
            GridViewBandColumn kolumna_Koniec2 = DevExpressXXL.GetBoundColumn("Sprawy z zakresu prawa pracy");
            kolumna_Koniec2.Columns.Add(DevExpressXXL.podKolumna(new string[] { "na rozprawe", "na posie- dzenie" }, 103, idTabeli, false, szerokoscKolumny, "Kolumna kontrolna (wyznaczenia>=załatwień)"));
            ASPxGridView2.Columns.Add(kolumna_Koniec2);

            ASPxGridView2.TotalSummary.Clear();

            ASPxGridView2.TotalSummary.Add(DevExpressXXL.komorkaSumujaca("Ogółem", "Imienazwisko"));

            for (int i = 1; i < 104; i++)
            {
                ASPxGridView2.TotalSummary.Add(DevExpressXXL.komorkaSumujaca(i));
            }
        }

        private GridViewBandColumn drugaczesc(string idTabeli, int szerokoscKolumny)
        {
            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznych = DevExpressXXL.GetBoundColumn("Sprawy z zakresu prawa pracy");
            kolumna_SprawyZakresuUbezpieczenSpolecznych.Columns.Add(DevExpressXXL.kolumnaDoTabeli("zaległość z poprzedniego roku", "d_141", idTabeli, "", false, szerokoscKolumny));

            string[] teksty01 = new string[] { "Ogółem", "U", "Uo", "WSC skarga o stw. niezg. z pr." };
            string[] teksty02 = new string[] { "Ogółem", "Ua", "Uz", "Uo II inst", "WSC skarga kasacyjna", "WSC skarga o stw. niezg. z pr.II inst.", "I + II instancja łącznie" };
            string[] teksty03 = new string[] { "ogółem", "zakreślonych", "niezakreślonych" };
            string[] teksty04 = new string[] { "Ogółem", "do 3 m-cy", "pow. 3 do 6 m - cy", "pow. 6 do 12 m - cy", "pow. 12 m-cy do 2 lat", "pow. 2 do 3 lat", "pow. 3 do 5 lat", "pow. 5 do 8 lat", "pow. 8 lat" };
            string[] teksty05 = new string[] { "z terminem	", "bez terminu", "OGÓŁEM (wraz z publikacją orzeczeń)	" };

            #region wplyw

            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznychWplyw = DevExpressXXL.GetBoundColumn("Wpływ");
            kolumna_SprawyZakresuUbezpieczenSpolecznychWplyw.Columns.Add(DevExpressXXL.kolumnaDoTabeli("I + II instancja łącznie", "d_142", idTabeli, "", false, szerokoscKolumny));

            kolumna_SprawyZakresuUbezpieczenSpolecznychWplyw.Columns.Add(DevExpressXXL.podKolumna(teksty01, 143, idTabeli, false, szerokoscKolumny, "I instancja"));
            kolumna_SprawyZakresuUbezpieczenSpolecznychWplyw.Columns.Add(DevExpressXXL.podKolumna(teksty02, 147, idTabeli, false, szerokoscKolumny, "II instancja"));
            kolumna_SprawyZakresuUbezpieczenSpolecznych.Columns.Add(kolumna_SprawyZakresuUbezpieczenSpolecznychWplyw);

            #endregion wplyw

            #region ZAŁATWIENIA

            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznychZalatwienia = DevExpressXXL.GetBoundColumn("ZAŁATWIENIA");
            kolumna_SprawyZakresuUbezpieczenSpolecznychZalatwienia.Columns.Add(DevExpressXXL.kolumnaDoTabeli("I + II instancja łącznie", "d_154", idTabeli, "", false, szerokoscKolumny));

            kolumna_SprawyZakresuUbezpieczenSpolecznychZalatwienia.Columns.Add(DevExpressXXL.podKolumna(teksty01, 155, idTabeli, false, szerokoscKolumny, "I instancja"));
            kolumna_SprawyZakresuUbezpieczenSpolecznychZalatwienia.Columns.Add(DevExpressXXL.podKolumna(teksty02, 159, idTabeli, false, szerokoscKolumny, "II instancja"));
            kolumna_SprawyZakresuUbezpieczenSpolecznych.Columns.Add(kolumna_SprawyZakresuUbezpieczenSpolecznychZalatwienia);

            #endregion ZAŁATWIENIA

            #region sesje odbyte przez sędziego

            GridViewBandColumn sesjeSedziego = DevExpressXXL.GetBoundColumn("sesje odbyte przez sędziego ");

            GridViewBandColumn wszystkieSesjeSedziego = DevExpressXXL.GetBoundColumn("wszystkie sesje sędziego w wydziale ");
            wszystkieSesjeSedziego.Columns.Add(DevExpressXXL.kolumnaDoTabeli("ogółem", "d_166", idTabeli, "", false, szerokoscKolumny));
            wszystkieSesjeSedziego.Columns.Add(DevExpressXXL.podKolumna(new string[] { "rozprawy", "posiedzenia" }, 167, idTabeli, false, szerokoscKolumny, "z tego "));
            sesjeSedziego.Columns.Add(wszystkieSesjeSedziego);

            GridViewBandColumn naPotrzebyMSS = DevExpressXXL.GetBoundColumn("na potrzeby MS-S");
            naPotrzebyMSS.Columns.Add(DevExpressXXL.kolumnaDoTabeli("ogółem", "d_169", idTabeli, "", false, szerokoscKolumny));
            naPotrzebyMSS.Columns.Add(DevExpressXXL.podKolumna(new string[] { "rozprawy", "posiedzenia" }, 170, idTabeli, false, szerokoscKolumny, "z tego "));
            sesjeSedziego.Columns.Add(naPotrzebyMSS);

            kolumna_SprawyZakresuUbezpieczenSpolecznych.Columns.Add(sesjeSedziego);

            #endregion sesje odbyte przez sędziego

            kolumna_SprawyZakresuUbezpieczenSpolecznych.Columns.Add(DevExpressXXL.podKolumna(new string[] { "Ogółem I Instancja", "Ogółem II Instancja" }, 172, idTabeli, false, szerokoscKolumny, "Liczba odroczonych publikacji orzeczeń"));

            #region Liczba odroczonych spraw

            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznychLiczbaOdroczonychSpraw = DevExpressXXL.GetBoundColumn("Liczba odroczonych spraw");
            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznychLiczbaOdroczonychSprawInstancjaI = DevExpressXXL.podKolumna(teksty05, 174, idTabeli, false, szerokoscKolumny, "I instancja");
            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznychLiczbaOdroczonychSprawInstancjaII = DevExpressXXL.podKolumna(teksty05, 177, idTabeli, false, szerokoscKolumny, "II instancja");
            kolumna_SprawyZakresuUbezpieczenSpolecznychLiczbaOdroczonychSpraw.Columns.Add(kolumna_SprawyZakresuUbezpieczenSpolecznychLiczbaOdroczonychSprawInstancjaI);
            kolumna_SprawyZakresuUbezpieczenSpolecznychLiczbaOdroczonychSpraw.Columns.Add(kolumna_SprawyZakresuUbezpieczenSpolecznychLiczbaOdroczonychSprawInstancjaII);
            kolumna_SprawyZakresuUbezpieczenSpolecznych.Columns.Add(kolumna_SprawyZakresuUbezpieczenSpolecznychLiczbaOdroczonychSpraw);

            #endregion Liczba odroczonych spraw

            #region Pozostalosc

            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznychPozostalosc = DevExpressXXL.GetBoundColumn("POZOSTAŁOŚĆ na następny m-c");
            kolumna_SprawyZakresuUbezpieczenSpolecznychPozostalosc.Columns.Add(DevExpressXXL.kolumnaDoTabeli("I + II instancja łącznie", "d_180", idTabeli, "", false, szerokoscKolumny));

            kolumna_SprawyZakresuUbezpieczenSpolecznychPozostalosc.Columns.Add(DevExpressXXL.podKolumna(teksty01, 181, idTabeli, false, szerokoscKolumny, "I instancja"));
            kolumna_SprawyZakresuUbezpieczenSpolecznychPozostalosc.Columns.Add(DevExpressXXL.podKolumna(teksty02, 185, idTabeli, false, szerokoscKolumny, "II instancja"));
            kolumna_SprawyZakresuUbezpieczenSpolecznych.Columns.Add(kolumna_SprawyZakresuUbezpieczenSpolecznychPozostalosc);

            #endregion Pozostalosc

            #region stan spraw zawieszonych

            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznychstanSprawZawieszonych = DevExpressXXL.GetBoundColumn("stan spraw zawieszonych (wszystkie kategorie spraw)");
            kolumna_SprawyZakresuUbezpieczenSpolecznychstanSprawZawieszonych.Columns.Add(DevExpressXXL.podKolumna(teksty03, 192, idTabeli, false, szerokoscKolumny, "II instancja łącznie"));
            kolumna_SprawyZakresuUbezpieczenSpolecznychstanSprawZawieszonych.Columns.Add(DevExpressXXL.podKolumna(teksty03, 195, idTabeli, false, szerokoscKolumny, "I instancja"));
            kolumna_SprawyZakresuUbezpieczenSpolecznychstanSprawZawieszonych.Columns.Add(DevExpressXXL.podKolumna(teksty03, 198, idTabeli, false, szerokoscKolumny, "II instancja"));

            kolumna_SprawyZakresuUbezpieczenSpolecznych.Columns.Add(kolumna_SprawyZakresuUbezpieczenSpolecznychstanSprawZawieszonych);

            #endregion stan spraw zawieszonych

            #region pozostało spraw starych

            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznychPozostaloSprawStarych = DevExpressXXL.GetBoundColumn("pozostało spraw starych (wszystkie kategorie spraw)");
            kolumna_SprawyZakresuUbezpieczenSpolecznychPozostaloSprawStarych.Columns.Add(DevExpressXXL.podKolumna(teksty04, 201, idTabeli, false, szerokoscKolumny, "II instancja łącznie"));
            kolumna_SprawyZakresuUbezpieczenSpolecznychPozostaloSprawStarych.Columns.Add(DevExpressXXL.podKolumna(teksty04, 210, idTabeli, false, szerokoscKolumny, "I instancja"));
            kolumna_SprawyZakresuUbezpieczenSpolecznychPozostaloSprawStarych.Columns.Add(DevExpressXXL.podKolumna(teksty04, 219, idTabeli, false, szerokoscKolumny, "II instancja"));

            kolumna_SprawyZakresuUbezpieczenSpolecznych.Columns.Add(kolumna_SprawyZakresuUbezpieczenSpolecznychPozostaloSprawStarych);

            #endregion pozostało spraw starych

            #region dwi instancje

            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznychDwieInstancje = DevExpressXXL.GetBoundColumn("I + II instancja łącznie");

            #region liczba sporządzonych uzasadnień (wszystkie kategorie spraw)

            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznychDwieInstancjeLiczbaSporzadzonychUzasadnien = DevExpressXXL.GetBoundColumn("liczba sporządzonych uzasadnień (wszystkie kategorie spraw)");

            kolumna_SprawyZakresuUbezpieczenSpolecznychDwieInstancjeLiczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeli("łącznie", "d_228", idTabeli, "", false, szerokoscKolumny));
            kolumna_SprawyZakresuUbezpieczenSpolecznychDwieInstancjeLiczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeli("w terminie ustawowym 14 dni", "d_229", idTabeli, "", false, szerokoscKolumny));
            kolumna_SprawyZakresuUbezpieczenSpolecznychDwieInstancjeLiczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeli("razem po terminie ustawowym", "d_230", idTabeli, "", false, szerokoscKolumny));
            kolumna_SprawyZakresuUbezpieczenSpolecznychDwieInstancjeLiczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeli("nieuspra- wiedliwione", "d_231", idTabeli, "", false, szerokoscKolumny));
            kolumna_SprawyZakresuUbezpieczenSpolecznychDwieInstancjeLiczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.podKolumna(new string[] { "1-14 dni", "w tym nieuspra -wiedliwione", "15-30 dni", "w tym nieuspra -wiedliwione", "powyżej 1 do 3 mies", "w tym nieuspra -wiedliwione", "ponad 3 mies", "w tym nieuspra -wiedliwione" }, 232, idTabeli, false, szerokoscKolumny, "po upływie terminiu ustawowego"));

            kolumna_SprawyZakresuUbezpieczenSpolecznychDwieInstancje.Columns.Add(kolumna_SprawyZakresuUbezpieczenSpolecznychDwieInstancjeLiczbaSporzadzonychUzasadnien);

            #endregion liczba sporządzonych uzasadnień (wszystkie kategorie spraw)

            #region uzasadnienia wygłoszone

            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznychDwieInstancjeUzasadnieniaWygloszone = DevExpressXXL.podKolumna(new string[] { "ogółem", "w których wpłynął wniosek o transkrypcję" }, 240, idTabeli, false, szerokoscKolumny, "uzasadnienia wygłoszone *");
            kolumna_SprawyZakresuUbezpieczenSpolecznychDwieInstancje.Columns.Add(kolumna_SprawyZakresuUbezpieczenSpolecznychDwieInstancjeUzasadnieniaWygloszone);

            #endregion uzasadnienia wygłoszone

            #region Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent

            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznychDwieInstancjeProjektAsystenta = DevExpressXXL.podKolumna(new string[] { "razem", "w tym, w których projekt został zaakceptowany przez sędziego" }, 242, idTabeli, false, szerokoscKolumny, " Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent");
            kolumna_SprawyZakresuUbezpieczenSpolecznychDwieInstancje.Columns.Add(kolumna_SprawyZakresuUbezpieczenSpolecznychDwieInstancjeProjektAsystenta);

            #endregion Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent

            kolumna_SprawyZakresuUbezpieczenSpolecznych.Columns.Add(kolumna_SprawyZakresuUbezpieczenSpolecznychDwieInstancje);

            #endregion dwi instancje

            #region instancja I

            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaI = DevExpressXXL.GetBoundColumn("I instancja");

            #region liczba sporządzonych uzasadnień (wszystkie kategorie spraw)

            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaILiczbaSporzadzonychUzasadnien = DevExpressXXL.GetBoundColumn("liczba sporządzonych uzasadnień (wszystkie kategorie spraw)");

            kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaILiczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeli("łącznie", "d_244", idTabeli, "", false, szerokoscKolumny));
            kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaILiczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeli("w terminie ustawowym 14 dni", "d_245", idTabeli, "", false, szerokoscKolumny));
            kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaILiczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeli("razem po terminie ustawowym", "d_246", idTabeli, "", false, szerokoscKolumny));
            kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaILiczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeli("nieuspra- wiedliwione", "d_247", idTabeli, "", false, szerokoscKolumny));
            kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaILiczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.podKolumna(new string[] { "1-14 dni", "w tym nieuspra -wiedliwione", "15-30 dni", "w tym nieuspra -wiedliwione", "powyżej 1 do 3 mies", "w tym nieuspra -wiedliwione", "ponad 3 mies", "w tym nieuspra -wiedliwione" }, 248, idTabeli, false, szerokoscKolumny, "po upływie terminiu ustawowego"));

            kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaI.Columns.Add(kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaILiczbaSporzadzonychUzasadnien);

            #endregion liczba sporządzonych uzasadnień (wszystkie kategorie spraw)

            #region uzasadnienia wygłoszone

            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaIUzasadnieniaWygloszone = DevExpressXXL.podKolumna(new string[] { "ogółem", "w których wpłynął wniosek o transkrypcję" }, 256, idTabeli, false, szerokoscKolumny, "uzasadnienia wygłoszone *");
            kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaI.Columns.Add(kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaIUzasadnieniaWygloszone);

            #endregion uzasadnienia wygłoszone

            #region Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent

            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaIProjektAsystenta = DevExpressXXL.podKolumna(new string[] { "razem", "w tym, w których projekt został zaakceptowany przez sędziego" }, 258, idTabeli, false, szerokoscKolumny, " Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent");
            kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaI.Columns.Add(kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaIProjektAsystenta);

            #endregion Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent

            kolumna_SprawyZakresuUbezpieczenSpolecznych.Columns.Add(kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaI);

            #endregion instancja I

            #region instancja II

            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaII = DevExpressXXL.GetBoundColumn("II instancja");

            #region liczba sporządzonych uzasadnień (wszystkie kategorie spraw)

            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaIILiczbaSporzadzonychUzasadnien = DevExpressXXL.GetBoundColumn("liczba sporządzonych uzasadnień (wszystkie kategorie spraw)");

            kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaIILiczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeli("łącznie", "d_260", idTabeli, "gary", false, szerokoscKolumny));
            kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaIILiczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeli("w terminie ustawowym 14 dni", "d_261", idTabeli, "", false, szerokoscKolumny));
            kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaIILiczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeli("razem po terminie ustawowym", "d_262", idTabeli, "", false, szerokoscKolumny));
            kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaIILiczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeli("nieuspra- wiedliwione", "d_263", idTabeli, "", false, szerokoscKolumny));
            kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaIILiczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.podKolumna(new string[] { "1-14 dni", "w tym nieuspra -wiedliwione", "15-30 dni", "w tym nieuspra -wiedliwione", "powyżej 1 do 3 mies", "w tym nieuspra -wiedliwione", "ponad 3 mies", "w tym nieuspra -wiedliwione" }, 264, idTabeli, false, szerokoscKolumny, "po upływie terminiu ustawowego"));

            kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaII.Columns.Add(kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaIILiczbaSporzadzonychUzasadnien);

            #endregion liczba sporządzonych uzasadnień (wszystkie kategorie spraw)

            #region uzasadnienia wygłoszone

            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaIIUzasadnieniaWygloszone = DevExpressXXL.podKolumna(new string[] { "ogółem", "w których wpłynął wniosek o transkrypcję" }, 272, idTabeli, false, szerokoscKolumny, "uzasadnienia wygłoszone *");
            kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaII.Columns.Add(kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaIIUzasadnieniaWygloszone);

            #endregion uzasadnienia wygłoszone

            #region Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent

            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaIIProjektAsystenta = DevExpressXXL.podKolumna(new string[] { "razem", "w tym, w których projekt został zaakceptowany przez sędziego" }, 274, idTabeli, false, szerokoscKolumny, " Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent");
            kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaII.Columns.Add(kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaIIProjektAsystenta);

            #endregion Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent

            kolumna_SprawyZakresuUbezpieczenSpolecznych.Columns.Add(kolumna_SprawyZakresuUbezpieczenSpolecznychInstancjaII);

            #endregion instancja II

            #region Skargi na przewlekłość

            kolumna_SprawyZakresuUbezpieczenSpolecznych.Columns.Add(DevExpressXXL.SkargiNaPrzewleklosc(276, idTabeli, szerokoscKolumny));

            #endregion Skargi na przewlekłość

            kolumna_SprawyZakresuUbezpieczenSpolecznych.Columns.Add(DevExpressXXL.kolumnaDoTabeli("UWAGI", "d_280", idTabeli, "", false, szerokoscKolumny));
            return kolumna_SprawyZakresuUbezpieczenSpolecznych;
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

        protected void ASPxGridView2_SummaryDisplayText(object sender, ASPxGridViewSummaryDisplayTextEventArgs e)
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