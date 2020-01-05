/*
Last Update:
    - version 1.181220
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
    public partial class ooprN : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();
        public devExpressXXL DevExpressXXL = new devExpressXXL();
        private const string tenPlik = "oopr.aspx";
        private const string tenPlikNazwa = "oopr";
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

            // pierwsza tabelka
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

                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], tabela, 39, 0, 8, true, true, false, false, false);

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
            DataTable tabelka01 = DevExpressXXL.zLicznikiemKolumn(dr.konwertujNaPrzecinek(dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 1, Date1.Date, Date2.Date, 111, tenPlik)));
            if (tabelka01 == null)
            {
                cm.log.Info(tenPlik + ": brak danych dla tabeli 1");
                return;
            }
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

            string[] teksty01 = new string[] { "Ogółem", "RC", "RNs", "Nsm", "RCo", "Nmo", "RCps", "Nkd" };
            string[] teksty02 = new string[] { "Ogółem (wszystkie kategorie spraw)", "RC", "RNs", "Nsm", "Kkd" };

            string[] teksty03 = new string[] { "Ogółem", "Ua", "Uz", "WSC sk.o stw. niezg. z pr.", "WSC sk. Kasacyjna", "WSC sk.o stw. niezg. z pr. II inst.", "Wykaz S Skargi na post. sądowe" };
            string[] teksty04 = new string[] { "z terminem", "bez wyznaczonego terminu", "OGÓŁEM (wraz z publikacją orzeczeń)	" };
            idDzialu = "1";
            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("L.p.", "id", idDzialu, "", true, 36));
            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Imie i nazwisko", "Imienazwisko", idDzialu, "", true, 250));

            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("zaległość z poprzedniego roku", "d_01", idDzialu, "", false, szerokoscKolumny));

            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(teksty01, 2, idDzialu, false, szerokoscKolumny, "WPŁYW"));

            ASPxGridView1.Columns.Add(DevExpressXXL.SekcjaDwiePodKolumny(teksty01, "Wyznaczono", 10, idDzialu, szerokoscKolumny));
            ASPxGridView1.Columns.Add(DevExpressXXL.SekcjaDwiePodKolumny(teksty01, "Załatwiono", 26, idDzialu, szerokoscKolumny));

            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(teksty01, 42, idDzialu, false, szerokoscKolumny, "ZAŁATWIENIA"));
            ASPxGridView1.Columns.Add(DevExpressXXL.sesjeSedziego(50, idDzialu, szerokoscKolumny));
            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Liczba dni, w których odbyły się sesje wyjazdowe (podajemy niezależnie - dla potrzeb informacyjnych)", "d_56", idDzialu, "", false, szerokoscKolumny));
            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Liczba wokand wykonawczych (wykazywana Dz. 1.1.9)", "d_57", idDzialu, "", false, szerokoscKolumny));

            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(teksty04, 58, idDzialu, false, szerokoscKolumny, "Liczba odroczonych publikacji wyroków/postanowień (Dz. 1.1.1. k.17)"));
            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(teksty01, 61, idDzialu, false, szerokoscKolumny, "POZOSTAŁOŚĆ na następny m-c"));
            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(new string[] { "Ogółem", "do 3 m-cy", "pow. 3 do 6 m - cy", "pow. 6 do 12 m - cy", "pow. 12 m-cy do 2 lat", "pow. 2 do 3 lat", "pow. 3 do 5 lat", "pow. 5 do 8 lat", "pow. 8 lat" }, 69, idDzialu, false, szerokoscKolumny, "pozostało spraw starych (wszystkie kategorie spraw) "));

            GridViewBandColumn liczbaSporzadzonychUzasadnien = DevExpressXXL.podKolumna(new string[] { "Łącznie", "w terminie ustawowym 14 dni", "razem po terminie ustawowym", "nie- usprawied- liwione" }, 78, idDzialu, false, szerokoscKolumny, "terminowość sporządzonych uzasadnień (wszystkie kategorie spraw)");

            GridViewBandColumn PoUplywie = (DevExpressXXL.podKolumna(new string[] { "1-14 dni", "w tym nieuspra -wiedliwione", "15-30 dni", "w tym nieuspra -wiedliwione", "powyżej 1 do 3 mies", "w tym nieuspra -wiedliwione", "ponad 3 mies", "w tym nieuspra -wiedliwione" }, 82, idDzialu, false, szerokoscKolumny, "po upływie terminiu ustawowego"));
            liczbaSporzadzonychUzasadnien.Columns.Add(PoUplywie);
            liczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Uzasadnienia wygłoszone", "d_90", idDzialu, "", false, szerokoscKolumny));
            liczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Liczba spraw do których wpłynął wniosek o transkrypcje uzasadnień wygłoszonych", "d_91", idDzialu, "", false, szerokoscKolumny));
            GridViewBandColumn liczbaSpraw = DevExpressXXL.podKolumna(new string[] { "razem", "w tym, w których projekt został zaakceptowany przez sędziego" }, 92, idDzialu, false, szerokoscKolumny, "Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent**");
            liczbaSporzadzonychUzasadnien.Columns.Add(liczbaSpraw);
            ASPxGridView1.Columns.Add(liczbaSporzadzonychUzasadnien);
            ASPxGridView1.Columns.Add(DevExpressXXL.SkargiNaPrzewleklosc(94, idDzialu, szerokoscKolumny));

            GridViewBandColumn mediacje = DevExpressXXL.GetBoundColumn("mediacje");
            GridViewBandColumn mediacjeWplyw = DevExpressXXL.GetBoundColumn("WPŁYW");
            mediacjeWplyw.Columns.Add(DevExpressXXL.kolumnaDoTabeli("liczba spraw w których strony skierowano do mediacji", "d_98", idDzialu, "", false, szerokoscKolumny));
            mediacje.Columns.Add(mediacjeWplyw);

            mediacje.Columns.Add(DevExpressXXL.podKolumna(new string[] { "liczba ugód zawartych przed mediatorem", "w tym zatwierdzono ugodę" }, 99, idDzialu, false, szerokoscKolumny, "ROZSTRZYGNIĘCIE"));
            ASPxGridView1.Columns.Add(mediacje);

            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(new string[] { "Ogółem", "zakreś- lonych", "nie zakreś- lonych" }, 101, idDzialu, false, szerokoscKolumny, "stan spraw zawieszonych (wszystkie kategorie spraw)"));
            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("UWAGI", "d_104", idDzialu, "", false, szerokoscKolumny));

            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(new string[] { "na rozprawe", "na posie- dzenie" }, 103, idDzialu, false, szerokoscKolumny, "Kolumna kontrolna (wyznaczenia>=załatwień)"));

            ASPxGridView1.TotalSummary.Clear();
            ASPxGridView1.TotalSummary.Add(DevExpressXXL.komorkaSumujaca("Ogółem"));
            for (int i = 1; i < 111; i++)
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