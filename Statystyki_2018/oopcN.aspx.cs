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
    public partial class oopcN : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();
        public devExpressXXL DevExpressXXL = new devExpressXXL();
        private const string tenPlik = "oopc.aspx";
        private const string tenPlikNazwa = "oopc";
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
                cm.log.Info(tenPlik + ": id wydzialu=" + idWydzial);

                bool dost = cm.dostep(idWydzial, (string)Session["identyfikatorUzytkownika"]);
                if (!dost)
                {
                    Server.Transfer("default.aspx?info='Użytkownik " + (string)Session["identyfikatorUzytkownika"] + " nie praw do działu nr " + idWydzial + "'");
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
                infoLabel1.Visible = cl.debug(int.Parse((string)Session["id_dzialu"]));
            }
            catch
            {
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

                // pierwsza

                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], tabela, 103, 0, 8, true, true, false, false, false);

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
            DataTable tabelka01 = DevExpressXXL.zLicznikiemKolumn(dr.konwertujNaPrzecinek(dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 1, Date1.Date, Date2.Date, 109, tenPlik)));

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

            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("zaległość z roku 2018", "d_01", idDzialu, "", false, szerokoscKolumny));

            #region wplyw

            GridViewBandColumn wplyw = DevExpressXXL.podKolumna(new string[] { "Ogółem", "C", "Ns", "Wykaz N", "Nc", "Co" }, 2, idDzialu, false, szerokoscKolumny, "WPŁYW");
            GridViewBandColumn wplywWtym = DevExpressXXL.podKolumna(new string[] { "106", "118" }, 8, idDzialu, false, szerokoscKolumny, "w tym");
            wplyw.Columns.Add(wplywWtym);
            wplyw.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Cps", "d_10", idDzialu, "", false, szerokoscKolumny));
            wplyw.Columns.Add(DevExpressXXL.kolumnaDoTabeli("WSC", "d_11", idDzialu, "", false, szerokoscKolumny));

            ASPxGridView1.Columns.Add(wplyw);

            #endregion wplyw

            #region Wyznaczono

            GridViewBandColumn Wyznaczono_wplyw01 = DevExpressXXL.GetBoundColumn("Wyznaczono");
            Wyznaczono_wplyw01.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "na rozprawe", "na posie- dzenie" }, 12, idDzialu, false, szerokoscKolumny, "Ogółem"));
            Wyznaczono_wplyw01.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "na rozprawe", "na posie- dzenie" }, 14, idDzialu, false, szerokoscKolumny, "C"));
            Wyznaczono_wplyw01.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "na rozprawe", "na posie- dzenie" }, 16, idDzialu, false, szerokoscKolumny, "Ns"));
            Wyznaczono_wplyw01.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "na rozprawe", "na posie- dzenie" }, 18, idDzialu, false, szerokoscKolumny, "Nc"));
            Wyznaczono_wplyw01.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "na rozprawe", "na posie- dzenie" }, 20, idDzialu, false, szerokoscKolumny, "Co"));
            Wyznaczono_wplyw01.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "na rozprawe", "na posie- dzenie" }, 22, idDzialu, false, szerokoscKolumny, "Cps"));
            Wyznaczono_wplyw01.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "na rozprawe", "na posie- dzenie" }, 24, idDzialu, false, szerokoscKolumny, "WSC"));

            ASPxGridView1.Columns.Add(Wyznaczono_wplyw01);

            #endregion Wyznaczono

            #region Załatwiono

            GridViewBandColumn Zalatwiono_wplyw01 = DevExpressXXL.GetBoundColumn("Załatwiono");
            Zalatwiono_wplyw01.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "na rozprawe", "na posie- dzenie" }, 26, idDzialu, false, szerokoscKolumny, "Ogółem"));
            Zalatwiono_wplyw01.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "na rozprawe", "na posie- dzenie" }, 28, idDzialu, false, szerokoscKolumny, "c"));
            Zalatwiono_wplyw01.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "na rozprawe", "na posie- dzenie" }, 30, idDzialu, false, szerokoscKolumny, "Ns"));
            Zalatwiono_wplyw01.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "na rozprawe", "na posie- dzenie" }, 32, idDzialu, false, szerokoscKolumny, "Nc"));
            Zalatwiono_wplyw01.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "na rozprawe", "na posie- dzenie" }, 34, idDzialu, false, szerokoscKolumny, "Co"));
            Zalatwiono_wplyw01.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "na rozprawe", "na posie- dzenie" }, 36, idDzialu, false, szerokoscKolumny, "Cps"));
            Zalatwiono_wplyw01.Columns.Add(DevExpressXXL.podKolumna(new string[2] { "na rozprawe", "na posie- dzenie" }, 38, idDzialu, false, szerokoscKolumny, "WSC"));

            ASPxGridView1.Columns.Add(Zalatwiono_wplyw01);

            #endregion Załatwiono


            #region ZAŁATWIENIA

            GridViewBandColumn zalatwienia = DevExpressXXL.podKolumna(new string[] { "Ogółem", "C", "Ns", "Wykaz N", "Nc", "Co" }, 40, idDzialu, false, szerokoscKolumny, "ZAŁATWIENIA");
            GridViewBandColumn zalatwieniaWtym = DevExpressXXL.podKolumna(new string[] { "106", "118" }, 46, idDzialu, false, szerokoscKolumny, "w tym");
            zalatwienia.Columns.Add(zalatwieniaWtym);
            zalatwienia.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Cps", "d_48", idDzialu, "", false, szerokoscKolumny));
            zalatwienia.Columns.Add(DevExpressXXL.kolumnaDoTabeli("WSC", "d_49", idDzialu, "", false, szerokoscKolumny));

            ASPxGridView1.Columns.Add(zalatwienia);




            #endregion
            ASPxGridView1.Columns.Add(DevExpressXXL.sesjeSedziego(50, idDzialu, szerokoscKolumny));


            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(new string[] { "ogółem (wszystkie kategorie spraw)", "C","Ns" }, 56, idDzialu, false, szerokoscKolumny, "Liczba odroczonych publikacji orzeczeń"));
            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(new string[] { "z terminem", "bez wyznaczonego terminu", "OGÓŁEM (wraz z publikacją orzeczeń)" }, 59, idDzialu, false, szerokoscKolumny, "Liczba odroczonych spraw"));


            #region pozostalosc

            GridViewBandColumn pozostalosc = DevExpressXXL.podKolumna(new string[] { "Ogółem", "C", "Ns", "Wykaz N", "Nc", "Co" }, 62, idDzialu, false, szerokoscKolumny, "ZAŁATWIENIA");
            GridViewBandColumn pozostaloscWtym = DevExpressXXL.podKolumna(new string[] { "106", "118" }, 68, idDzialu, false, szerokoscKolumny, "w tym");
            pozostalosc.Columns.Add(pozostaloscWtym);
            pozostalosc.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Cps", "d_70", idDzialu, "", false, szerokoscKolumny));
            pozostalosc.Columns.Add(DevExpressXXL.kolumnaDoTabeli("WSC", "d_71", idDzialu, "", false, szerokoscKolumny));

            ASPxGridView1.Columns.Add(pozostalosc);
            #endregion

            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(new string[] { "Ogółem", "do 3 m-cy", "pow. 3 do 6 m - cy", "pow. 6 do 12 m - cy", "pow. 12 m-cy do 2 lat", "pow. 2 do 3 lat", "pow. 3 do 5 lat", "pow. 5 do 8 lat", "pow. 8 lat" }, 72, idDzialu, false, szerokoscKolumny, "pozostało spraw starych (wszystkie kategorie spraw) "));




            GridViewBandColumn liczbaSporzadzonychUzasadnien = DevExpressXXL.podKolumna(new string[] { "Łącznie", "w terminie ustawowym 14 dni", "razem po terminie ustawowym", "nie- usprawied- liwione" }, 81, idDzialu, false, szerokoscKolumny, "terminowość sporządzonych uzasadnień (wszystkie kategorie spraw)");

            GridViewBandColumn PoUplywie = (DevExpressXXL.podKolumna(new string[] { "1-14 dni", "w tym nieuspra -wiedliwione", "15-30 dni", "w tym nieuspra -wiedliwione", "powyżej 1 do 3 mies", "w tym nieuspra -wiedliwione", "ponad 3 mies", "w tym nieuspra -wiedliwione" }, 85, idDzialu, false, szerokoscKolumny, "po upływie terminiu ustawowego"));
            liczbaSporzadzonychUzasadnien.Columns.Add(PoUplywie);
            liczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Uzasadnienia wygłoszone", "d_93", idDzialu, "", false, szerokoscKolumny));
            liczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Liczba spraw do których wpłynął wniosek o transkrypcje uzasadnień wygłoszonych", "d_94", idDzialu, "", false, szerokoscKolumny));

            GridViewBandColumn liczbaSpraw = DevExpressXXL.podKolumna(new string[] { "razem", "w tym, w których projekt został zaakceptowany przez sędziego" }, 95, idDzialu, false, szerokoscKolumny, "Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent**");
            liczbaSporzadzonychUzasadnien.Columns.Add(liczbaSpraw);
            ASPxGridView1.Columns.Add(liczbaSporzadzonychUzasadnien);
            ASPxGridView1.Columns.Add(DevExpressXXL.SkargiNaPrzewleklosc(97, idDzialu, szerokoscKolumny));

            GridViewBandColumn mediacje = DevExpressXXL.GetBoundColumn("mediacje");
            GridViewBandColumn mediacjeWplyw = DevExpressXXL.GetBoundColumn("WPŁYW");
            mediacjeWplyw.Columns.Add(DevExpressXXL.kolumnaDoTabeli("liczba spraw w których strony skierowano do mediacji", "d_100", idDzialu, "", false, szerokoscKolumny));
            mediacje.Columns.Add(mediacjeWplyw);

            mediacje.Columns.Add(DevExpressXXL.podKolumna(new string[] { "liczba ugód zawartych przed mediatorem", "w tym zatwierdzono ugodę" }, 101, idDzialu, false, szerokoscKolumny, "ROZSTRZYGNIĘCIE"));
            ASPxGridView1.Columns.Add(mediacje);


            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(new string[] { "Ogółem", "zakreś- lonych", "nie zakreś- lonych" }, 103, idDzialu, false, szerokoscKolumny, "stan spraw zawieszonych (wszystkie kategorie spraw)"));
            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("UWAGI", "d_106", idDzialu, "", false, szerokoscKolumny));

            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(new string[] { "na rozprawe", "na posie- dzenie" }, 107, idDzialu, false, szerokoscKolumny, "Kolumna kontrolna (wyznaczenia>=załatwień)"));
            ASPxGridView1.TotalSummary.Clear();
            ASPxGridView1.TotalSummary.Add(DevExpressXXL.komorkaSumujaca("Ogółem"));
            for (int i = 1; i < 104; i++)
            {
                ASPxGridView1.TotalSummary.Add(DevExpressXXL.komorkaSumujaca(i));
            }
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