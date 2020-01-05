/*
Last Update:
    - version 1.191210
Creation date: 2019-12-16

*/

using DevExpress.Web;
using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;

namespace stat2018
{
    public partial class aopk2N : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();
        public devExpressXXL DevExpressXXL = new devExpressXXL();
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

                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], tabela, 106, 0, 8, true, true, false, false, false);

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
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 5");
            }

            DataTable tabelka01 = DevExpressXXL.zLicznikiemKolumn(dr.konwertujNaPrzecinek(dr.generuj_dane_do_tabeli_sedziowskiej_2018(int.Parse(idDzialu), 5, Date1.Date, Date2.Date, 105, tenPlik)));
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
            string idTabeli = "5";
            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("L.p.", "id", idTabeli, "", true, 36));
            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Imie i nazwisko", "Imienazwisko", idTabeli, "", true, 250));

            GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznych = DevExpressXXL.GetBoundColumn("Sprawy z zakresu ubezpieczeń społecznych ");
            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("zaległość z poprzedniego roku", "d_01", idTabeli, "", false, szerokoscKolumny));

            string[] teksty01 = new string[] { "Ogółem", "Ka", "w tym W", "Kz", "w tym W", "Ko", "WKK", "WSU" };
            string[] teksty02 = new string[] { "Ogółem", "Ka", "Kz", "Ko", "WKK", "WSU", "Wykaz S" };
            string[] teksty03 = new string[] { "Ogółem", "GC", "GNs", "GNc", "GCo", "Ga", "Gz", "WSC", "S" };
            string[] teksty04 = new string[] { "Ogółem", "do 3 m-cy", "pow. 3 do 6 m - cy", "pow. 6 do 12 m - cy", "pow. 12 m-cy do 2 lat", "pow. 2 do 3 lat", "pow. 3 do 5 lat", "pow. 5 do 8 lat", "pow. 8 lat" };

            GridViewBandColumn Wplyw = DevExpressXXL.GetBoundColumn("Wpływ");
            Wplyw.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Ogółem", "d_02", idTabeli, "", false, szerokoscKolumny));
            Wplyw.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Ka", "d_03", idTabeli, "", false, szerokoscKolumny));
            Wplyw.Columns.Add(DevExpressXXL.kolumnaDoTabeli("w tym W", "d_04", idTabeli, "", false, szerokoscKolumny));

            Wplyw.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Kz", "d_05", idTabeli, "", false, szerokoscKolumny));
            Wplyw.Columns.Add(DevExpressXXL.kolumnaDoTabeli("w tym W", "d_06", idTabeli, "", false, szerokoscKolumny));

            Wplyw.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Ko", "d_07", idTabeli, "", false, szerokoscKolumny));
            Wplyw.Columns.Add(DevExpressXXL.kolumnaDoTabeli("WKK", "d_08", idTabeli, "", false, szerokoscKolumny));
            Wplyw.Columns.Add(DevExpressXXL.kolumnaDoTabeli("WSU", "d_09", idTabeli, "", false, szerokoscKolumny));
            Wplyw.Columns.Add(DevExpressXXL.podKolumna(new string[] { "sądowe", "prokuratorskie" }, 10, idTabeli, false, szerokoscKolumny, "Wykaz S skargi na postępowanie"));

            ASPxGridView1.Columns.Add(Wplyw);

            ASPxGridView1.Columns.Add(sekcjaZpodwojnymiPodkolumnami("Wyznaczono", 17, idTabeli, szerokoscKolumny));
            ASPxGridView1.Columns.Add(sekcjaZpodwojnymiPodkolumnami("Załatwiono", 26, idTabeli, szerokoscKolumny));

            GridViewBandColumn ZALATWIENIA = DevExpressXXL.GetBoundColumn("ZAŁATWIENIA");
            ZALATWIENIA.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Ogółem", "d_40", idTabeli, "", false, szerokoscKolumny));
            ZALATWIENIA.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Ka", "d_41", idTabeli, "", false, szerokoscKolumny));
            ZALATWIENIA.Columns.Add(DevExpressXXL.kolumnaDoTabeli("w tym W", "d_42", idTabeli, "", false, szerokoscKolumny));

            ZALATWIENIA.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Kz", "d_43", idTabeli, "", false, szerokoscKolumny));
            ZALATWIENIA.Columns.Add(DevExpressXXL.kolumnaDoTabeli("w tym W", "d_44", idTabeli, "", false, szerokoscKolumny));

            ZALATWIENIA.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Ko", "d_45", idTabeli, "", false, szerokoscKolumny));
            ZALATWIENIA.Columns.Add(DevExpressXXL.kolumnaDoTabeli("WKK", "d_46", idTabeli, "", false, szerokoscKolumny));
            ZALATWIENIA.Columns.Add(DevExpressXXL.kolumnaDoTabeli("WSU", "d_47", idTabeli, "", false, szerokoscKolumny));
            ZALATWIENIA.Columns.Add(DevExpressXXL.podKolumna(new string[] { "sądowe", "prokuratorskie" }, 48, idTabeli, false, szerokoscKolumny, "Wykaz S skargi na postępowanie"));

            ASPxGridView1.Columns.Add(ZALATWIENIA);
            ASPxGridView1.Columns.Add(DevExpressXXL.sesjeSedziego(51, idTabeli, szerokoscKolumny));

            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Liczba odroczonych publikacji orzeczeń (rep. Ka)", "d_57", idTabeli, "", false, szerokoscKolumny));

            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(new string[] { "z terminem", "bez terminu", "OGÓŁEM (wraz z publikacją orzeczeń)" }, 58, idTabeli, false, szerokoscKolumny, "Liczba odroczonych spraw"));

            GridViewBandColumn Pozostalosc = DevExpressXXL.GetBoundColumn("POZOSTAŁOŚĆ na następny m-c");
            Pozostalosc.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Ogółem", "d_61", idTabeli, "", false, szerokoscKolumny));
            Pozostalosc.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Ka", "d_62", idTabeli, "", false, szerokoscKolumny));
            Pozostalosc.Columns.Add(DevExpressXXL.kolumnaDoTabeli("w tym W", "d_63", idTabeli, "", false, szerokoscKolumny));

            Pozostalosc.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Kz", "d_64", idTabeli, "", false, szerokoscKolumny));
            Pozostalosc.Columns.Add(DevExpressXXL.kolumnaDoTabeli("w tym W", "d_65", idTabeli, "", false, szerokoscKolumny));

            Pozostalosc.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Ko", "d_66", idTabeli, "", false, szerokoscKolumny));
            Pozostalosc.Columns.Add(DevExpressXXL.kolumnaDoTabeli("WKK", "d_67", idTabeli, "", false, szerokoscKolumny));
            Pozostalosc.Columns.Add(DevExpressXXL.kolumnaDoTabeli("WSU", "d_68", idTabeli, "", false, szerokoscKolumny));
            Pozostalosc.Columns.Add(DevExpressXXL.podKolumna(new string[] { "sądowe", "prokuratorskie" }, 69, idTabeli, false, szerokoscKolumny, "Wykaz S skargi na postępowanie"));

            ASPxGridView1.Columns.Add(Pozostalosc);
            ASPxGridView1.Columns.Add(dwieInstancje("stan spraw zawieszonych (wszystkie kategorie spraw)", 71, idTabeli, szerokoscKolumny, new string[] { "ogółem", "zakreślonych", "nie zakreślonych" }));
            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(teksty04, 74, idTabeli, false, szerokoscKolumny, "pozostało spraw starych"));

            GridViewBandColumn kolumna_liczbaSporzadzonychUzasadnien = DevExpressXXL.GetBoundColumn("liczba sporządzonych uzasadnień (wszystkie kategorie spraw)");

            GridViewBandColumn kolumna_poUplywieTerminiuUstawowego = DevExpressXXL.GetBoundColumn("po upływie terminiu ustawowego");

            kolumna_poUplywieTerminiuUstawowego.Columns.Add(DevExpressXXL.kolumnaDoTabeli("1-14 dni", "d_87", idTabeli, "", false, szerokoscKolumny));
            kolumna_poUplywieTerminiuUstawowego.Columns.Add(DevExpressXXL.kolumnaDoTabeli("w tym nieuspra- wiedliwione", "d_88", idTabeli, "", false, szerokoscKolumny));
            kolumna_poUplywieTerminiuUstawowego.Columns.Add(DevExpressXXL.kolumnaDoTabeli("15-30 dni", "d_89", idTabeli, "", false, szerokoscKolumny));
            kolumna_poUplywieTerminiuUstawowego.Columns.Add(DevExpressXXL.kolumnaDoTabeli("w tym nieuspra- wiedliwione", "d_90", idTabeli, "", false, szerokoscKolumny));
            kolumna_poUplywieTerminiuUstawowego.Columns.Add(DevExpressXXL.kolumnaDoTabeli("powyżej 1 do 3 mies.", "d_91", idTabeli, "", false, szerokoscKolumny));
            kolumna_poUplywieTerminiuUstawowego.Columns.Add(DevExpressXXL.kolumnaDoTabeli("w tym nieuspra- wiedliwione", "d_92", idTabeli, "", false, szerokoscKolumny));
            kolumna_poUplywieTerminiuUstawowego.Columns.Add(DevExpressXXL.kolumnaDoTabeli("ponad 3 mies.	", "d_93", idTabeli, "", false, szerokoscKolumny));
            kolumna_poUplywieTerminiuUstawowego.Columns.Add(DevExpressXXL.kolumnaDoTabeli("w tym nieuspra- wiedliwione", "d_94", idTabeli, "", false, szerokoscKolumny));

            kolumna_liczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeli("łącznie", "d_83", idTabeli, "", false, szerokoscKolumny));
            kolumna_liczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeli("w terminie ustawowym 14 dni", "d_84", idTabeli, "", false, szerokoscKolumny));
            kolumna_liczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeli("razem po terminie ustawowym", "d_85", idTabeli, "", false, szerokoscKolumny));
            kolumna_liczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeli("nieusprawiedliw", "d_86", idTabeli, "", false, szerokoscKolumny));
            kolumna_liczbaSporzadzonychUzasadnien.Columns.Add(kolumna_poUplywieTerminiuUstawowego);
            ASPxGridView1.Columns.Add(kolumna_liczbaSporzadzonychUzasadnien);

            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(new string[] { "Ogółem", "w tym  w których wpłynął wniosek o transkrypcję" }, 95, idTabeli, false, szerokoscKolumny, "uzasadnienia wygłoszone *"));
            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(new string[] { "Razem", "w tym, w których projekt został zaakceptowany przez sędziego" }, 97, idTabeli, false, szerokoscKolumny, "iczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent"));

            ASPxGridView1.Columns.Add(DevExpressXXL.SkargiNaPrzewleklosc(99, idTabeli, szerokoscKolumny));
            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Uwagi", "d_103", idTabeli, "", false, szerokoscKolumny));
            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(new string[] { "na rozprawie", "na posiedzeniu" }, 104, idTabeli, false, szerokoscKolumny, "Kolumna kontrolna (wyznaczenia>=załatwień)"));

            ASPxGridView1.TotalSummary.Clear();
            ASPxGridView1.TotalSummary.Add(DevExpressXXL.komorkaSumujaca("Ogółem"));
            for (int i = 1; i < 105; i++)
            {
                ASPxGridView1.TotalSummary.Add(DevExpressXXL.komorkaSumujaca(i));
            }
        }

        protected void tabela_2()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 5");
            }

            DataTable tabelka01 = dr.konwertujNaPrzecinek(dr.generuj_dane_do_tabeli_z_miesiacami(Date1.Date, Date2.Date, idDzialu, 2, 115, tenPlik));
            Session["tabelka002"] = tabelka01;
            ASPxGridView2.DataSource = null;
            ASPxGridView2.DataSourceID = null;
            ASPxGridView2.DataSource = tabelka01;
            ASPxGridView2.DataBind();

            ASPxGridView2.KeyFieldName = "miesiac";
            ASPxGridView2.Columns.Clear();
            int szerokoscKolumny = 80;
            ASPxGridView2.Width = Panel1.Width;
            string idTabeli = "2";
   //         GridViewBandColumn kolumna_SprawyZakresuUbezpieczenSpolecznych = DevExpressXXL.GetBoundColumn("Sprawy z zakresu ubezpieczeń społecznych ");
            ASPxGridView2.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("Miesiąc", "miesiac", idDzialu, "", true, 250));

            ASPxGridView2.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("zaległość z poprzedniego roku", "d_01", idTabeli, "", false, szerokoscKolumny));

            string[] teksty01 = new string[] { "Ogółem", "Ka", "w tym W", "Kz", "w tym W", "Ko", "WKK", "WSU" };
            string[] teksty02 = new string[] { "Ogółem", "Ka", "Kz", "Ko", "WKK", "WSU", "Wykaz S" };
            string[] teksty03 = new string[] { "Ogółem", "GC", "GNs", "GNc", "GCo", "Ga", "Gz", "WSC", "S" };
            string[] teksty04 = new string[] { "Ogółem", "do 3 m-cy", "pow. 3 do 6 m - cy", "pow. 6 do 12 m - cy", "pow. 12 m-cy do 2 lat", "pow. 2 do 3 lat", "pow. 3 do 5 lat", "pow. 5 do 8 lat", "pow. 8 lat" };

            GridViewBandColumn Wplyw = DevExpressXXL.GetBoundColumn("Wpływ");
            Wplyw.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("Ogółem", "d_02", idTabeli, "", false, szerokoscKolumny));
            Wplyw.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("Ka", "d_03", idTabeli, "", false, szerokoscKolumny));
            Wplyw.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("w tym W", "d_04", idTabeli, "", false, szerokoscKolumny));

            Wplyw.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("Kz", "d_05", idTabeli, "", false, szerokoscKolumny));
            Wplyw.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("w tym W", "d_06", idTabeli, "", false, szerokoscKolumny));

            Wplyw.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("Ko", "d_07", idTabeli, "", false, szerokoscKolumny));
            Wplyw.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("WKK", "d_08", idTabeli, "", false, szerokoscKolumny));
            Wplyw.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("WSU", "d_09", idTabeli, "", false, szerokoscKolumny));
            Wplyw.Columns.Add(DevExpressXXL.podKolumnaMiesieczna(new string[] { "sądowe", "prokuratorskie" }, 10, idTabeli, false, szerokoscKolumny, "Wykaz S skargi na postępowanie"));

            ASPxGridView2.Columns.Add(Wplyw);

            ASPxGridView2.Columns.Add(sekcjaZpodwojnymiPodkolumnami("Wyznaczono", 17, idTabeli, szerokoscKolumny));
            ASPxGridView2.Columns.Add(sekcjaZpodwojnymiPodkolumnami("Załatwiono", 26, idTabeli, szerokoscKolumny));

            GridViewBandColumn ZALATWIENIA = DevExpressXXL.GetBoundColumn("ZAŁATWIENIA");
            ZALATWIENIA.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("Ogółem", "d_40", idTabeli, "", false, szerokoscKolumny));
            ZALATWIENIA.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("Ka", "d_41", idTabeli, "", false, szerokoscKolumny));
            ZALATWIENIA.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("w tym W", "d_42", idTabeli, "", false, szerokoscKolumny));

            ZALATWIENIA.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("Kz", "d_43", idTabeli, "", false, szerokoscKolumny));
            ZALATWIENIA.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("w tym W", "d_44", idTabeli, "", false, szerokoscKolumny));

            ZALATWIENIA.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("Ko", "d_45", idTabeli, "", false, szerokoscKolumny));
            ZALATWIENIA.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("WKK", "d_46", idTabeli, "", false, szerokoscKolumny));
            ZALATWIENIA.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("WSU", "d_47", idTabeli, "", false, szerokoscKolumny));
            ZALATWIENIA.Columns.Add(DevExpressXXL.podKolumnaMiesieczna(new string[] { "sądowe", "prokuratorskie" }, 48, idTabeli, false, szerokoscKolumny, "Wykaz S skargi na postępowanie"));

            ASPxGridView2.Columns.Add(ZALATWIENIA);
            ASPxGridView2.Columns.Add(DevExpressXXL.sesjeSedziego(51, idTabeli, szerokoscKolumny));

            ASPxGridView2.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("Liczba odroczonych publikacji orzeczeń (rep. Ka)", "d_57", idTabeli, "", false, szerokoscKolumny));

            ASPxGridView2.Columns.Add(DevExpressXXL.podKolumnaMiesieczna(new string[] { "z terminem", "bez terminu", "OGÓŁEM (wraz z publikacją orzeczeń)" }, 58, idTabeli, false, szerokoscKolumny, "Liczba odroczonych spraw"));

            GridViewBandColumn Pozostalosc = DevExpressXXL.GetBoundColumn("POZOSTAŁOŚĆ na następny m-c");
            Pozostalosc.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("Ogółem", "d_61", idTabeli, "", false, szerokoscKolumny));
            Pozostalosc.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("Ka", "d_62", idTabeli, "", false, szerokoscKolumny));
            Pozostalosc.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("w tym W", "d_63", idTabeli, "", false, szerokoscKolumny));

            Pozostalosc.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("Kz", "d_64", idTabeli, "", false, szerokoscKolumny));
            Pozostalosc.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("w tym W", "d_65", idTabeli, "", false, szerokoscKolumny));

            Pozostalosc.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("Ko", "d_66", idTabeli, "", false, szerokoscKolumny));
            Pozostalosc.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("WKK", "d_67", idTabeli, "", false, szerokoscKolumny));
            Pozostalosc.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("WSU", "d_68", idTabeli, "", false, szerokoscKolumny));
            Pozostalosc.Columns.Add(DevExpressXXL.podKolumnaMiesieczna(new string[] { "sądowe", "prokuratorskie" }, 69, idTabeli, false, szerokoscKolumny, "Wykaz S skargi na postępowanie"));

            ASPxGridView2.Columns.Add(Pozostalosc);
            ASPxGridView2.Columns.Add(dwieInstancje("stan spraw zawieszonych (wszystkie kategorie spraw)", 71, idTabeli, szerokoscKolumny, new string[] { "ogółem", "zakreślonych", "nie zakreślonych" }));
            ASPxGridView2.Columns.Add(DevExpressXXL.podKolumnaMiesieczna(teksty04, 74, idTabeli, false, szerokoscKolumny, "pozostało spraw starych"));

            GridViewBandColumn kolumna_liczbaSporzadzonychUzasadnien = DevExpressXXL.GetBoundColumn("liczba sporządzonych uzasadnień (wszystkie kategorie spraw)");

            GridViewBandColumn kolumna_poUplywieTerminiuUstawowego = DevExpressXXL.GetBoundColumn("po upływie terminiu ustawowego");

            kolumna_poUplywieTerminiuUstawowego.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("1-14 dni", "d_87", idTabeli, "", false, szerokoscKolumny));
            kolumna_poUplywieTerminiuUstawowego.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("w tym nieuspra- wiedliwione", "d_88", idTabeli, "", false, szerokoscKolumny));
            kolumna_poUplywieTerminiuUstawowego.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("15-30 dni", "d_89", idTabeli, "", false, szerokoscKolumny));
            kolumna_poUplywieTerminiuUstawowego.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("w tym nieuspra- wiedliwione", "d_90", idTabeli, "", false, szerokoscKolumny));
            kolumna_poUplywieTerminiuUstawowego.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("powyżej 1 do 3 mies.", "d_91", idTabeli, "", false, szerokoscKolumny));
            kolumna_poUplywieTerminiuUstawowego.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("w tym nieuspra- wiedliwione", "d_92", idTabeli, "", false, szerokoscKolumny));
            kolumna_poUplywieTerminiuUstawowego.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("ponad 3 mies.	", "d_93", idTabeli, "", false, szerokoscKolumny));
            kolumna_poUplywieTerminiuUstawowego.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("w tym nieuspra- wiedliwione", "d_94", idTabeli, "", false, szerokoscKolumny));

            kolumna_liczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("łącznie", "d_83", idTabeli, "", false, szerokoscKolumny));
            kolumna_liczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("w terminie ustawowym 14 dni", "d_84", idTabeli, "", false, szerokoscKolumny));
            kolumna_liczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("razem po terminie ustawowym", "d_85", idTabeli, "", false, szerokoscKolumny));
            kolumna_liczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("nieusprawiedliw", "d_86", idTabeli, "", false, szerokoscKolumny));
            kolumna_liczbaSporzadzonychUzasadnien.Columns.Add(kolumna_poUplywieTerminiuUstawowego);
            ASPxGridView2.Columns.Add(kolumna_liczbaSporzadzonychUzasadnien);

            ASPxGridView2.Columns.Add(DevExpressXXL.podKolumnaMiesieczna(new string[] { "Ogółem", "w tym  w których wpłynął wniosek o transkrypcję" }, 95, idTabeli, false, szerokoscKolumny, "uzasadnienia wygłoszone *"));
            ASPxGridView2.Columns.Add(DevExpressXXL.podKolumnaMiesieczna(new string[] { "Razem", "w tym, w których projekt został zaakceptowany przez sędziego" }, 97, idTabeli, false, szerokoscKolumny, "iczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent"));

            ASPxGridView2.Columns.Add(DevExpressXXL.SkargiNaPrzewleklosc(99, idTabeli, szerokoscKolumny));
            ASPxGridView2.Columns.Add(DevExpressXXL.kolumnaDoTabeliMiesiecznej("Uwagi", "d_103", idTabeli, "", false, szerokoscKolumny));
            ASPxGridView2.Columns.Add(DevExpressXXL.podKolumnaMiesieczna(new string[] { "na rozprawie", "na posiedzeniu" }, 104, idTabeli, false, szerokoscKolumny, "Kolumna kontrolna (wyznaczenia>=załatwień)"));

            ASPxGridView2.TotalSummary.Clear();
            ASPxGridView2.TotalSummary.Add(DevExpressXXL.komorkaSumujaca("Ogółem"));
            for (int i = 1; i < 105; i++)
            {
                ASPxGridView2.TotalSummary.Add(DevExpressXXL.komorkaSumujaca(i));
            }
        }

        private GridViewColumn dwieInstancje(string Opis, int przesuniecie, string idTabeli, int szerokoscKolumny, string[] teksty)
        {
            GridViewBandColumn kolumna = DevExpressXXL.GetBoundColumn(Opis);
            kolumna.Columns.Add(DevExpressXXL.podKolumna(teksty, przesuniecie, idTabeli, false, szerokoscKolumny, "I instancja"));
            kolumna.Columns.Add(DevExpressXXL.podKolumna(teksty, teksty.Length + przesuniecie, idTabeli, false, szerokoscKolumny, "II instancja"));
            return kolumna;
        }

        protected void Suma(object sender, DevExpress.Data.CustomSummaryEventArgs e)
        {
            ASPxSummaryItem sumItem = (ASPxSummaryItem)e.Item;
        }

        private GridViewBandColumn sekcjaZpodwojnymiPodkolumnami(string Opis, int przesuniecie, string idTabeli, int szerokoscKolumny)
        {
            string[] teksty01 = new string[] { "Ogółem", "Ka", "Kz", "Ko", "WKK", "WSU", "Wykaz S" };
            GridViewBandColumn kolumna = (DevExpressXXL.SekcjaDwiePodKolumny(teksty01, Opis, przesuniecie, idTabeli, szerokoscKolumny));

            return kolumna;
        }

        private GridViewBandColumn sekcjaMniejsza(string Opis, int przesuniecie, string idTabeli, int szerokoscKolumny)

        {
            string[] teksty01 = new string[] { "Ogółem", "GC", "GNs", "GNc", "GCo", "WSC skarga o stw. niezg. z pr.s", "Wykaz U" };
            string[] teksty02 = new string[] { "Ogółem", "Ga", "Gz", "GCo-II inst.", "WSC skarga kasacyjna", "WSC skarga o stw. niezg. z pr. II inst.", "Skargi na post. sądowe" };

            GridViewBandColumn kolumna = DevExpressXXL.GetBoundColumn(Opis);
            kolumna.Columns.Add(DevExpressXXL.kolumnaDoTabeli("I + II instancja łącznie", "d_" + przesuniecie.ToString("D2"), idTabeli, "", false, szerokoscKolumny));
            kolumna.Columns.Add(DevExpressXXL.podKolumna(teksty01, przesuniecie + 1, idTabeli, false, szerokoscKolumny, "I instancja"));
            kolumna.Columns.Add(DevExpressXXL.podKolumna(teksty02, przesuniecie + 8, idTabeli, false, szerokoscKolumny, "II instancja"));
            return kolumna;
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

        protected void ASPxGridView2_SummaryDisplayText(object sender, ASPxGridViewSummaryDisplayTextEventArgs e)
        {
            try
            {
                if (e.Item.FieldName.Contains("d_"))
                {
                    double value = double.Parse(e.Value.ToString());
                    string field = e.Item.FieldName.Replace("d_", "");
                 //   value = value - double.Parse(field);
                    e.Text = value.ToString();
                }
            }
            catch
            {
            }
        }
    }
}