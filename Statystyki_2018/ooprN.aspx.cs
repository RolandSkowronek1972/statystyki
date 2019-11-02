/*
Last Update:
    - version 1.191021
Creation date: 2019-10-25

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
        public devExpressXXL xxl = new devExpressXXL();

        private const string tenPlik = "aopc.aspx";
        private const string tenPlikNazwa = "aopc";
        private string path = "";
       

        protected void Page_Load(object sender, EventArgs e)
        {
            string idWydzial = "10";// Request.QueryString["w"];
            try
            {
                if (idWydzial == null) return;
                Session["id_dzialu"] = idWydzial;
                bool dost = true;// cm.dostep(idWydzial, (string)Session["identyfikatorUzytkownika"]);
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

                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], (DataTable)Session["tabelka001"], 149, 0, 9, true, false, false, false, false);

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
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 1, Date1.Date, Date2.Date, 150, tenPlik);
            Session["tabelka001"] = tabelka01;

            ASPxGridView1.DataSource = null;
            ASPxGridView1.DataSourceID = null;
            ASPxGridView1.AutoGenerateColumns = true;
            ASPxGridView1.DataSource = tabelka01;
            ASPxGridView1.DataBind();

            ASPxGridView1.Width = (Request.Browser.ScreenPixelsWidth) * 2 - 100;
            ASPxGridView1.KeyFieldName = "id_sedziego";

            ASPxGridView1.Columns.Clear();
            int szerokoscKolumny = 80;
            ASPxGridView1.Columns.Add(xxl.kolumnaDoTabeli("L.p.", "id", idDzialu, "", true, 36));
            ASPxGridView1.Columns.Add(xxl.kolumnaDoTabeli("Imie i nazwisko", "Imienazwisko", idDzialu, "", true, 250));
            //ASPxGridView1.Columns.Add(xxl.kolumnaDoTabeli("Nazwisko", "Nazwisko", idDzialu, "", true));
            GridViewBandColumn kolumna001 = xxl.GetBoundColumn("1");
            //  GridViewDataTextColumn kolumna_d01 = xxl.kolumnaDoTabeli("zaległość z roku 2018", "d_01", idDzialu, "", false, szerokoscKolumny);
            //  kolumna001.Columns.Add(kolumna_d01);

            ASPxGridView1.Columns.Add(xxl.kolumnaDoTabeli("zaległość z roku 2018", "d_01", idDzialu, "", false, szerokoscKolumny, true, 5));

            GridViewBandColumn wplyw = xxl.GetBoundColumn("Wpływ");
            wplyw.Columns.Add((xxl.kolumnaDoTabeli("Ogółem", "d_02", idDzialu, "", false, szerokoscKolumny, true, 4)));
            wplyw.Columns.Add((xxl.kolumnaDoTabeli("RC", "d_03", idDzialu, "", false, szerokoscKolumny, true, 4)));
            wplyw.Columns.Add((xxl.kolumnaDoTabeli("RNs", "d_04", idDzialu, "", false, szerokoscKolumny, true, 4)));
            wplyw.Columns.Add((xxl.kolumnaDoTabeli("Nsm", "d_05", idDzialu, "", false, szerokoscKolumny, true, 4)));
            wplyw.Columns.Add((xxl.kolumnaDoTabeli("RCo", "d_06", idDzialu, "", false, szerokoscKolumny, true, 4)));
            wplyw.Columns.Add((xxl.kolumnaDoTabeli("Nmo", "d_07", idDzialu, "", false, szerokoscKolumny, true, 4)));
            wplyw.Columns.Add((xxl.kolumnaDoTabeli("RCps", "d_08", idDzialu, "", false, szerokoscKolumny, true, 4)));
            wplyw.Columns.Add((xxl.kolumnaDoTabeli("Nkd", "d_09", idDzialu, "", false, szerokoscKolumny, true, 4)));
            ASPxGridView1.Columns.Add(wplyw);

            GridViewBandColumn Wyznaczono = xxl.GetBoundColumn("Wyznaczono");
            GridViewBandColumn WyznaczonoOgolemMS_S16_MS_S18 = xxl.GetBoundColumn("Ogółem MS-S16+MS-S18");
            WyznaczonoOgolemMS_S16_MS_S18.Columns.Add((xxl.kolumnaDoTabeli("na rozp-rawie", "d_10", idDzialu, "", false, szerokoscKolumny, true, 3)));
            WyznaczonoOgolemMS_S16_MS_S18.Columns.Add((xxl.kolumnaDoTabeli("na posie-dzenie", "d_11", idDzialu, "", false, szerokoscKolumny, true, 3)));
            Wyznaczono.Columns.Add(WyznaczonoOgolemMS_S16_MS_S18);

            GridViewBandColumn WyznaczonoRc = xxl.GetBoundColumn("RC");
            WyznaczonoRc.Columns.Add((xxl.kolumnaDoTabeli("na rozp-rawie", "d_12", idDzialu, "", false, szerokoscKolumny, true, 3)));
            WyznaczonoRc.Columns.Add((xxl.kolumnaDoTabeli("na posie-dzenie", "d_13", idDzialu, "", false, szerokoscKolumny, true, 3)));
            Wyznaczono.Columns.Add(WyznaczonoRc);

            ASPxGridView1.Columns.Add(Wyznaczono);
            GridViewBandColumn sesjeOdbytePrzezSedziego = xxl.GetBoundColumn("sesje odbyte przez sędziego");

            GridViewBandColumn sesjeOdbytePrzezSedziegoWszystkieSesje = xxl.GetBoundColumn("sesje odbyte przez sędziego");
            sesjeOdbytePrzezSedziegoWszystkieSesje.Columns.Add((xxl.kolumnaDoTabeli("ogółem", "d_50", idDzialu, "gray", false, szerokoscKolumny, true, 2)));
            GridViewBandColumn sesjeOdbytePrzezSedziegoWszystkieSesjezTego = xxl.GetBoundColumn("z tego");
            sesjeOdbytePrzezSedziegoWszystkieSesjezTego.Columns.Add((xxl.kolumnaDoTabeli("rozp-rawy", "d_51", idDzialu, "", false, szerokoscKolumny, true, 1)));
            sesjeOdbytePrzezSedziegoWszystkieSesjezTego.Columns.Add((xxl.kolumnaDoTabeli("posie-dzenia", "d_52", idDzialu, "", false, szerokoscKolumny, true, 1)));
            sesjeOdbytePrzezSedziegoWszystkieSesje.Columns.Add(sesjeOdbytePrzezSedziegoWszystkieSesjezTego);

            GridViewBandColumn sesjeOdbytePrzezSedziegoWszystkieSesjeOgólem = xxl.GetBoundColumn("sesje odbyte przez sędziego");
            sesjeOdbytePrzezSedziego.Columns.Add(sesjeOdbytePrzezSedziegoWszystkieSesje);

            ASPxGridView1.Columns.Add(sesjeOdbytePrzezSedziego);
            //  sesjeOdbytePrzezSedziego.Columns.Add();
            /*   GridViewDataTextColumn kolumna_d03 = xxl.kolumnaDoTabeli("ogółem", "d_03", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d04 = xxl.kolumnaDoTabeli("o <br/>rozwód", "d_04", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d05 = xxl.kolumnaDoTabeli("o separację", "d_05", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d06 = xxl.kolumnaDoTabeli("Ns ogółem", "d_06", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d07 = xxl.kolumnaDoTabeli("w tym <hl><br/>Ns separacje", "d_07", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d08 = xxl.kolumnaDoTabeli("Ns - rej", "d_08", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d09 = xxl.kolumnaDoTabeli("Nc", "d_09", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d10 = xxl.kolumnaDoTabeli("Co ogółem", "d_10", idDzialu, "gray", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d11 = xxl.kolumnaDoTabeli("Co (wnioski o zwoln. od kosztów sąd. i ustanow. pełnom. przed złożeniem pozwu", "d_11", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d12 = xxl.kolumnaDoTabeli("Co- nadawanie klauzuli wykonalności orzeczeniu sądu zagranicznego+ (skład 3-os)", "d_12", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d13 = xxl.kolumnaDoTabeli("Co (do spraw pr. zakończonych)", "d_13", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d14 = xxl.kolumnaDoTabeli("WSC", "d_14", idDzialu, "", false, szerokoscKolumny);

               GridViewBandColumn kolumna_wTym01 = new GridViewBandColumn();
               kolumna_wTym01.Caption = "w tym ";
               kolumna_wTym01.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_wTym01.Columns.Add(kolumna_d04);
               kolumna_wTym01.Columns.Add(kolumna_d05);

               GridViewBandColumn kolumna_wTym02 = new GridViewBandColumn();
               kolumna_wTym02.Caption = "w tym ";
               kolumna_wTym02.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;

               kolumna_wTym02.Columns.Add(kolumna_d11);
               kolumna_wTym02.Columns.Add(kolumna_d12);
               kolumna_wTym02.Columns.Add(kolumna_d13);

               GridViewBandColumn kolumna_C01 = new GridViewBandColumn();
               kolumna_C01.Caption = "C";
               kolumna_C01.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_C01.Columns.Add(kolumna_d03);
               kolumna_C01.Columns.Add(kolumna_wTym01);

               GridViewBandColumn kolumna_wplyw01 = new GridViewBandColumn();
               kolumna_wplyw01.Caption = "WPŁYW";
               kolumna_wplyw01.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_wplyw01.Columns.Add(kolumna_d02);
               kolumna_wplyw01.Columns.Add(kolumna_C01);
               kolumna_wplyw01.Columns.Add(kolumna_d06);
               kolumna_wplyw01.Columns.Add(kolumna_d08);
               kolumna_wplyw01.Columns.Add(kolumna_d09);
               kolumna_wplyw01.Columns.Add(kolumna_d10);
               kolumna_wplyw01.Columns.Add(kolumna_wTym02);
               kolumna_wplyw01.Columns.Add(kolumna_d14);

               ASPxGridView1.Columns.Add(kolumna_wplyw01);
               // koniec wplyw
               // wyznaczono

               GridViewDataTextColumn kolumna_d15 = xxl.kolumnaDoTabeli("na rozprawę", "d_15", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d16 = xxl.kolumnaDoTabeli("na posiedzenie", "d_16", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d17 = xxl.kolumnaDoTabeli("na rozprawę", "d_17", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d18 = xxl.kolumnaDoTabeli("na posiedzenie", "d_18", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d19 = xxl.kolumnaDoTabeli("na rozprawę", "d_19", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d20 = xxl.kolumnaDoTabeli("na posiedzenie", "d_20", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d21 = xxl.kolumnaDoTabeli("na rozprawę", "d_21", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d22 = xxl.kolumnaDoTabeli("na posiedzenie", "d_22", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d23 = xxl.kolumnaDoTabeli("na rozprawę", "d_23", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d24 = xxl.kolumnaDoTabeli("na posiedzenie", "d_24", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d25 = xxl.kolumnaDoTabeli("na rozprawę", "d_25", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d26 = xxl.kolumnaDoTabeli("na posiedzenie", "d_26", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d27 = xxl.kolumnaDoTabeli("na rozprawę", "d_27", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d28 = xxl.kolumnaDoTabeli("na posiedzenie", "d_28", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d29 = xxl.kolumnaDoTabeli("na rozprawę", "d_29", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d30 = xxl.kolumnaDoTabeli("na posiedzenie", "d_30", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d31 = xxl.kolumnaDoTabeli("na rozprawę", "d_31", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d32 = xxl.kolumnaDoTabeli("na posiedzenie", "d_32", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d33 = xxl.kolumnaDoTabeli("na rozprawę", "d_33", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d34 = xxl.kolumnaDoTabeli("na posiedzenie", "d_34", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d35 = xxl.kolumnaDoTabeli("na rozprawę", "d_35", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d36 = xxl.kolumnaDoTabeli("na posiedzenie", "d_36", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d37 = xxl.kolumnaDoTabeli("na rozprawę", "d_37", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d38 = xxl.kolumnaDoTabeli("na posiedzenie", "d_38", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d39 = xxl.kolumnaDoTabeli("na rozprawę", "d_39", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d40 = xxl.kolumnaDoTabeli("na posiedzenie", "d_40", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d41 = xxl.kolumnaDoTabeli("na rozprawę", "d_41", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d42 = xxl.kolumnaDoTabeli("na posiedzenie", "d_42", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d43 = xxl.kolumnaDoTabeli("na rozprawę", "d_43", idDzialu, "gray", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d44 = xxl.kolumnaDoTabeli("na posiedzenie", "d_44", idDzialu, "gray", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d45 = xxl.kolumnaDoTabeli("na rozprawę", "d_45", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d46 = xxl.kolumnaDoTabeli("na posiedzenie", "d_46", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d47 = xxl.kolumnaDoTabeli("na rozprawę", "d_47", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d48 = xxl.kolumnaDoTabeli("na posiedzenie", "d_48", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d49 = xxl.kolumnaDoTabeli("na rozprawę", "d_49", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d50 = xxl.kolumnaDoTabeli("na posiedzenie", "d_50", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d51 = xxl.kolumnaDoTabeli("na rozprawę", "d_51", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d52 = xxl.kolumnaDoTabeli("na posiedzenie", "d_52", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d53 = xxl.kolumnaDoTabeli("na rozprawę", "d_53", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d54 = xxl.kolumnaDoTabeli("na posiedzenie", "d_54", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d55 = xxl.kolumnaDoTabeli("na rozprawę", "d_55", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d56 = xxl.kolumnaDoTabeli("na posiedzenie", "d_56", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d57 = xxl.kolumnaDoTabeli("na rozprawę", "d_57", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d58 = xxl.kolumnaDoTabeli("na posiedzenie", "d_58", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d59 = xxl.kolumnaDoTabeli("na rozprawę", "d_59", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d60 = xxl.kolumnaDoTabeli("na posiedzenie", "d_60", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d61 = xxl.kolumnaDoTabeli("na rozprawę", "d_61", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d62 = xxl.kolumnaDoTabeli("na posiedzenie", "d_62", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d63 = xxl.kolumnaDoTabeli("na rozprawę", "d_63", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d64 = xxl.kolumnaDoTabeli("na posiedzenie", "d_64", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d65 = xxl.kolumnaDoTabeli("na rozprawę", "d_65", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d66 = xxl.kolumnaDoTabeli("na posiedzenie", "d_66", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d67 = xxl.kolumnaDoTabeli("na rozprawę", "d_67", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d68 = xxl.kolumnaDoTabeli("na posiedzenie", "d_68", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d69 = xxl.kolumnaDoTabeli("na rozprawę", "d_69", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d70 = xxl.kolumnaDoTabeli("na posiedzenie", "d_70", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d71 = xxl.kolumnaDoTabeli("Ogółem", "d_71", idDzialu, "gray", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d72 = xxl.kolumnaDoTabeli("ogółem", "d_72", idDzialu, "gray", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d73 = xxl.kolumnaDoTabeli("o rozwód", "d_73", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d74 = xxl.kolumnaDoTabeli("o separację", "d_74", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d75 = xxl.kolumnaDoTabeli("ogółem", "d_75", idDzialu, "gray", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d76 = xxl.kolumnaDoTabeli("o rozwód", "d_76", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d77 = xxl.kolumnaDoTabeli("o rozwód", "d_77", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d78 = xxl.kolumnaDoTabeli("o rozwód", "d_78", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d79 = xxl.kolumnaDoTabeli("o rozwód", "d_79", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d80 = xxl.kolumnaDoTabeli("Ns", "d_80", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d81 = xxl.kolumnaDoTabeli("Ns-rej", "d_81", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d82 = xxl.kolumnaDoTabeli("Nc", "d_82", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d83 = xxl.kolumnaDoTabeli("Co", "d_83", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d84 = xxl.kolumnaDoTabeli("WSC", "d_84", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d85 = xxl.kolumnaDoTabeli("Ogółem", "d_85", idDzialu, "gray", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d86 = xxl.kolumnaDoTabeli("Rozprawy", "d_86", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d87 = xxl.kolumnaDoTabeli("Posiedzenia", "d_87", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d88 = xxl.kolumnaDoTabeli("ogółem", "d_88", idDzialu, "gray", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d89 = xxl.kolumnaDoTabeli("Rozprawy", "d_89", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d90 = xxl.kolumnaDoTabeli("Posiedzenia", "d_90", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d91 = xxl.kolumnaDoTabeli("ogółem (wszystkie kategorie spraw)", "d_91", idDzialu, "gray", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d92 = xxl.kolumnaDoTabeli("C", "d_92", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d93 = xxl.kolumnaDoTabeli("Ns", "d_93", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d94 = xxl.kolumnaDoTabeli("z teminem", "d_94", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d95 = xxl.kolumnaDoTabeli("bez wyznaczonego terminu", "d_95", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d96 = xxl.kolumnaDoTabeli("OGÓŁEM (wraz z publikacją orzeczeń)", "d_96", idDzialu, "gray", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d97 = xxl.kolumnaDoTabeli("Ogółem", "d_97", idDzialu, "gray", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d98 = xxl.kolumnaDoTabeli("ogółem", "d_98", idDzialu, "gray", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d99 = xxl.kolumnaDoTabeli("o rozwód", "d_99", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d100 = xxl.kolumnaDoTabeli("o separację", "d_100", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d101 = xxl.kolumnaDoTabeli("ogółem", "d_101", idDzialu, "gray", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d102 = xxl.kolumnaDoTabeli("o rozwód", "d_102", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d103 = xxl.kolumnaDoTabeli("o separację", "d_103", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d104 = xxl.kolumnaDoTabeli("o rozwód", "d_104", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d105 = xxl.kolumnaDoTabeli("o separację", "d_105", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d106 = xxl.kolumnaDoTabeli("Ns", "d_106", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d107 = xxl.kolumnaDoTabeli("Ns-rej", "d_107", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d108 = xxl.kolumnaDoTabeli("Nc", "d_108", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d109 = xxl.kolumnaDoTabeli("Co", "d_109", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d110 = xxl.kolumnaDoTabeli("WSC", "d_110", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d111 = xxl.kolumnaDoTabeli("Ogółem", "d_111", idDzialu, "gray", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d112 = xxl.kolumnaDoTabeli("zakreślonych", "d_112", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d113 = xxl.kolumnaDoTabeli("niezakreślonych", "d_113", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d114 = xxl.kolumnaDoTabeli("Ogółem", "d_114", idDzialu, "gray", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d115 = xxl.kolumnaDoTabeli("do 3 mies.", "d_115", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d116 = xxl.kolumnaDoTabeli("pow. 3 do 6 m - cy", "d_116", idDzialu, "gray", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d117 = xxl.kolumnaDoTabeli("pow. 6 do 12 m - cy", "d_117", idDzialu, "gray", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d118 = xxl.kolumnaDoTabeli("pow. 12 m-cy do 2 lat", "d_118", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d119 = xxl.kolumnaDoTabeli("pow. 2 do 3 lat", "d_119", idDzialu, "", false, szerokoscKolumny);

               GridViewDataTextColumn kolumna_d_120 = xxl.kolumnaDoTabeli("pow. 3 do 5 lat", "d_120", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d_121 = xxl.kolumnaDoTabeli("pow. 5 do 8 lat", "d_121", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d_122 = xxl.kolumnaDoTabeli("pow. 8 lat", "d_122", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d_123 = xxl.kolumnaDoTabeli("łącznie", "d_123", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d_124 = xxl.kolumnaDoTabeli("w terminie ustawowym 14 dni", "d_124", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d_125 = xxl.kolumnaDoTabeli("razem po terminie ustawowym", "d_125", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d_126 = xxl.kolumnaDoTabeli("nie - usprawiedliwione", "d_126", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d_127 = xxl.kolumnaDoTabeli("1-14 dni", "d_127", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d_128 = xxl.kolumnaDoTabeli("w tym nie - usprawiedliwione", "d_128", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d_129 = xxl.kolumnaDoTabeli("15-30 dni", "d_129", idDzialu, "", false, szerokoscKolumny);

               GridViewDataTextColumn kolumna_d_130 = xxl.kolumnaDoTabeli("w tym nie - usprawiedliwione", "d_130", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d_131 = xxl.kolumnaDoTabeli("powyżej 1 do 3 mies.", "d_131", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d_132 = xxl.kolumnaDoTabeli("w tym nie - usprawiedliwione", "d_132", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d_133 = xxl.kolumnaDoTabeli("ponad 3 mies", "d_133", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d_134 = xxl.kolumnaDoTabeli("w tym nie - usprawiedliwione", "d_134", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d_135 = xxl.kolumnaDoTabeli("ogółem", "d_135", idDzialu, "gray", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d_136 = xxl.kolumnaDoTabeli("w których wpłynął wniosek o transkrypcję", "d_136", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d_137 = xxl.kolumnaDoTabeli("razem", "d_137", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d_138 = xxl.kolumnaDoTabeli(" w których projekt został zaakceptowany przez sędziego", "d_138", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d_139 = xxl.kolumnaDoTabeli("wpływ", "d_139", idDzialu, "", false, szerokoscKolumny);

               GridViewDataTextColumn kolumna_d_140 = xxl.kolumnaDoTabeli("ogółem", "d_140", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d_141 = xxl.kolumnaDoTabeli("uwzględniono", "d_141", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d_142 = xxl.kolumnaDoTabeli("pozostałość", "d_142", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d_143 = xxl.kolumnaDoTabeli("liczba spraw, w których strony skierowano do mediacji", "d_143", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d_144 = xxl.kolumnaDoTabeli("iczba ugód zawartych przed mediatorem", "d_144", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d_145 = xxl.kolumnaDoTabeli("ogółem", "d_145", idDzialu, "gray", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d_146 = xxl.kolumnaDoTabeli("w tym : w których wpłynął wniosek o transkrypcję", "d_146", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d_147 = xxl.kolumnaDoTabeli("razem", "d_147", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d_148 = xxl.kolumnaDoTabeli("w tym, w których projekt został zaakceptowany przez sędziego", "d_148", idDzialu, "", false, szerokoscKolumny);
               GridViewDataTextColumn kolumna_d_149 = xxl.kolumnaDoTabeli("wpływ", "d_149", idDzialu, "", false, szerokoscKolumny);

               GridViewBandColumn kolumna_wyznaczono_ogolem_01 = new GridViewBandColumn();
               kolumna_wyznaczono_ogolem_01.Caption = "ogółem ";
               kolumna_wyznaczono_ogolem_01.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_wyznaczono_ogolem_01.Columns.Add(kolumna_d15);
               kolumna_wyznaczono_ogolem_01.Columns.Add(kolumna_d16);

               GridViewBandColumn kolumna_wyznaczono_C01 = new GridViewBandColumn();
               kolumna_wyznaczono_C01.Caption = "C ";
               kolumna_wyznaczono_C01.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_wyznaczono_C01.Columns.Add(kolumna_d17);
               kolumna_wyznaczono_C01.Columns.Add(kolumna_d18);

               GridViewBandColumn kolumna_wyznaczono_oRozwod01 = new GridViewBandColumn { Caption = "o rozwód " };
               kolumna_wyznaczono_oRozwod01.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_wyznaczono_oRozwod01.Columns.Add(kolumna_d19);
               kolumna_wyznaczono_oRozwod01.Columns.Add(kolumna_d20);

               GridViewBandColumn kolumna_wyznaczono_oSeparacje01 = new GridViewBandColumn { Caption = "o separacje " };
               kolumna_wyznaczono_oSeparacje01.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_wyznaczono_oSeparacje01.Columns.Add(kolumna_d21);
               kolumna_wyznaczono_oSeparacje01.Columns.Add(kolumna_d22);

               GridViewBandColumn kolumna_wyznaczono_wTym01 = new GridViewBandColumn();
               kolumna_wyznaczono_wTym01.Caption = "w tym";
               kolumna_wyznaczono_wTym01.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_wyznaczono_wTym01.Columns.Add(kolumna_wyznaczono_oRozwod01);
               kolumna_wyznaczono_wTym01.Columns.Add(kolumna_wyznaczono_oSeparacje01);

               GridViewBandColumn kolumna_wyznaczono_RC01 = new GridViewBandColumn();
               kolumna_wyznaczono_RC01.Caption = "RC";
               kolumna_wyznaczono_RC01.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_wyznaczono_RC01.Columns.Add(kolumna_d23);
               kolumna_wyznaczono_RC01.Columns.Add(kolumna_d24);

               GridViewBandColumn kolumna_wyznaczono_oRozwod02 = new GridViewBandColumn { Caption = "o rozwód " };
               kolumna_wyznaczono_oRozwod02.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_wyznaczono_oRozwod02.Columns.Add(kolumna_d25);
               kolumna_wyznaczono_oRozwod02.Columns.Add(kolumna_d26);

               GridViewBandColumn kolumna_wyznaczono_oSeparacje02 = new GridViewBandColumn { Caption = "o separacje " };
               kolumna_wyznaczono_oSeparacje02.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_wyznaczono_oSeparacje02.Columns.Add(kolumna_d27);
               kolumna_wyznaczono_oSeparacje02.Columns.Add(kolumna_d28);

               GridViewBandColumn kolumna_wyznaczono_zTego01 = new GridViewBandColumn { Caption = "z tego " };
               kolumna_wyznaczono_zTego01.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_wyznaczono_zTego01.Columns.Add(kolumna_wyznaczono_oRozwod02);
               kolumna_wyznaczono_zTego01.Columns.Add(kolumna_wyznaczono_oSeparacje02);

               //---------------------------------------------------------------
               GridViewBandColumn kolumna_wyznaczono_oRozwod03 = new GridViewBandColumn { Caption = "o rozwód " };
               kolumna_wyznaczono_oRozwod03.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_wyznaczono_oRozwod03.Columns.Add(kolumna_d29);
               kolumna_wyznaczono_oRozwod03.Columns.Add(kolumna_d30);

               GridViewBandColumn kolumna_wyznaczono_oSeparacje03 = new GridViewBandColumn { Caption = "o separacje " };
               kolumna_wyznaczono_oSeparacje03.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_wyznaczono_oSeparacje03.Columns.Add(kolumna_d31);
               kolumna_wyznaczono_oSeparacje03.Columns.Add(kolumna_d32);

               GridViewBandColumn kolumna_wyznaczono_C_odData = new GridViewBandColumn { Caption = "C od 1.02.2018 r. " };
               kolumna_wyznaczono_C_odData.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_wyznaczono_C_odData.Columns.Add(kolumna_wyznaczono_oRozwod03);
               kolumna_wyznaczono_C_odData.Columns.Add(kolumna_wyznaczono_oSeparacje03);

               //---------------------------------------------------------------

               GridViewBandColumn kolumna_wyznaczono_NS = new GridViewBandColumn { Caption = "NS" };
               kolumna_wyznaczono_NS.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;

               kolumna_wyznaczono_NS.Columns.Add(kolumna_d33);
               kolumna_wyznaczono_NS.Columns.Add(kolumna_d34);

               //---------------------------------------------------------------

               GridViewBandColumn kolumna_wyznaczono_Ns_Rej = new GridViewBandColumn { Caption = "Ns-Rej" };
               kolumna_wyznaczono_Ns_Rej.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_wyznaczono_Ns_Rej.Columns.Add(kolumna_d35);
               kolumna_wyznaczono_Ns_Rej.Columns.Add(kolumna_d36);

               //---------------------------------------------------------------

               GridViewBandColumn kolumna_wyznaczono_C_NC = new GridViewBandColumn { Caption = "Nc" };
               kolumna_wyznaczono_C_NC.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_wyznaczono_C_NC.Columns.Add(kolumna_d37);
               kolumna_wyznaczono_C_NC.Columns.Add(kolumna_d38);

               //---------------------------------------------------------------

               GridViewBandColumn kolumna_wyznaczono_Co = new GridViewBandColumn { Caption = "Co  " };
               kolumna_wyznaczono_Co.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_wyznaczono_Co.Columns.Add(kolumna_d39);
               kolumna_wyznaczono_Co.Columns.Add(kolumna_d40);

               //---------------------------------------------------------------

               GridViewBandColumn kolumna_wyznaczono_WSC = new GridViewBandColumn { Caption = "WSC" };
               kolumna_wyznaczono_WSC.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_wyznaczono_WSC.Columns.Add(kolumna_d41);
               kolumna_wyznaczono_WSC.Columns.Add(kolumna_d42);

               //---------------------------------------------------------------

               GridViewBandColumn kolumna_wyznaczono = new GridViewBandColumn();
               kolumna_wyznaczono.Caption = "Wyznaczono";
               kolumna_wyznaczono.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_wyznaczono.Columns.Add(kolumna_wyznaczono_ogolem_01);
               kolumna_wyznaczono.Columns.Add(kolumna_wyznaczono_C01);
               kolumna_wyznaczono.Columns.Add(kolumna_wyznaczono_wTym01);
               kolumna_wyznaczono.Columns.Add(kolumna_wyznaczono_RC01);
               kolumna_wyznaczono.Columns.Add(kolumna_wyznaczono_zTego01);
               kolumna_wyznaczono.Columns.Add(kolumna_wyznaczono_C_odData);
               kolumna_wyznaczono.Columns.Add(kolumna_wyznaczono_NS);
               kolumna_wyznaczono.Columns.Add(kolumna_wyznaczono_Ns_Rej);
               kolumna_wyznaczono.Columns.Add(kolumna_wyznaczono_C_NC);
               kolumna_wyznaczono.Columns.Add(kolumna_wyznaczono_WSC);

               ASPxGridView1.Columns.Add(kolumna_wyznaczono);

               //Załatwiono
               GridViewBandColumn kolumna_Zalatwiono = new GridViewBandColumn();
               kolumna_Zalatwiono.Caption = "Załatwiono";
               kolumna_Zalatwiono.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;

               GridViewBandColumn kolumna_Zalatwiono_ogolem_01 = new GridViewBandColumn();
               kolumna_Zalatwiono_ogolem_01.Caption = "ogółem ";
               kolumna_Zalatwiono_ogolem_01.HeaderStyle.CssClass = "center gray";
               kolumna_Zalatwiono_ogolem_01.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_Zalatwiono_ogolem_01.Columns.Add(kolumna_d43);
               kolumna_Zalatwiono_ogolem_01.Columns.Add(kolumna_d44);

               GridViewBandColumn kolumna_Zalatwiono_C_01 = new GridViewBandColumn();
               kolumna_Zalatwiono_C_01.Caption = "C ";
               kolumna_Zalatwiono_C_01.HeaderStyle.CssClass = "center ";
               kolumna_Zalatwiono_C_01.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_Zalatwiono_C_01.Columns.Add(kolumna_d45);
               kolumna_Zalatwiono_C_01.Columns.Add(kolumna_d46);

               GridViewBandColumn kolumna_Zalatwiono_oRozwod01 = new GridViewBandColumn { Caption = "o rozwód " };
               kolumna_Zalatwiono_oRozwod01.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_Zalatwiono_oRozwod01.Columns.Add(kolumna_d47);
               kolumna_Zalatwiono_oRozwod01.Columns.Add(kolumna_d48);

               GridViewBandColumn kolumna_Zalatwiono_oSeparacje01 = new GridViewBandColumn { Caption = "o separacje " };
               kolumna_Zalatwiono_oSeparacje01.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_Zalatwiono_oSeparacje01.Columns.Add(kolumna_d49);
               kolumna_Zalatwiono_oSeparacje01.Columns.Add(kolumna_d50);

               GridViewBandColumn kolumna_Zalatwiono_wTym01 = new GridViewBandColumn { Caption = "w tym " };
               kolumna_Zalatwiono_wTym01.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_Zalatwiono_wTym01.Columns.Add(kolumna_Zalatwiono_oRozwod01);
               kolumna_Zalatwiono_wTym01.Columns.Add(kolumna_Zalatwiono_oSeparacje01);

               //---------------
               GridViewBandColumn kolumna_Zalatwiono_RC_01 = new GridViewBandColumn { Caption = "RC " };
               kolumna_Zalatwiono_RC_01.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_Zalatwiono_RC_01.Columns.Add(kolumna_d51);
               kolumna_Zalatwiono_RC_01.Columns.Add(kolumna_d52);

               //---------------
               GridViewBandColumn kolumna_Zalatwiono_oRozwod02 = new GridViewBandColumn { Caption = "o rozwód " };
               kolumna_Zalatwiono_oRozwod02.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_Zalatwiono_oRozwod02.Columns.Add(kolumna_d53);
               kolumna_Zalatwiono_oRozwod02.Columns.Add(kolumna_d54);

               GridViewBandColumn kolumna_Zalatwiono_oSeparacje02 = new GridViewBandColumn { Caption = "o separacje " };
               kolumna_Zalatwiono_oSeparacje02.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_Zalatwiono_oSeparacje02.Columns.Add(kolumna_d55);
               kolumna_Zalatwiono_oSeparacje02.Columns.Add(kolumna_d56);

               GridViewBandColumn kolumna_Zalatwiono_zTego = new GridViewBandColumn { Caption = "z tego " };
               kolumna_Zalatwiono_zTego.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_Zalatwiono_zTego.Columns.Add(kolumna_Zalatwiono_oRozwod02);
               kolumna_Zalatwiono_zTego.Columns.Add(kolumna_Zalatwiono_oSeparacje02);

               //---------------
               GridViewBandColumn kolumna_Zalatwiono_oRozwod03 = new GridViewBandColumn { Caption = "o rozwód " };
               kolumna_Zalatwiono_oRozwod03.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_Zalatwiono_oRozwod03.Columns.Add(kolumna_d57);
               kolumna_Zalatwiono_oRozwod03.Columns.Add(kolumna_d58);

               GridViewBandColumn kolumna_Zalatwiono_oSeparacje03 = new GridViewBandColumn { Caption = "o separacje " };
               kolumna_Zalatwiono_oSeparacje03.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_Zalatwiono_oSeparacje03.Columns.Add(kolumna_d59);
               kolumna_Zalatwiono_oSeparacje03.Columns.Add(kolumna_d60);

               GridViewBandColumn kolumna_Zalatwiono_CdoDaty = new GridViewBandColumn { Caption = "C od 1.02.2018 r. " };
               kolumna_Zalatwiono_CdoDaty.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_Zalatwiono_CdoDaty.Columns.Add(kolumna_Zalatwiono_oRozwod03);
               kolumna_Zalatwiono_CdoDaty.Columns.Add(kolumna_Zalatwiono_oSeparacje03);

               //---------------
               GridViewBandColumn kolumna_Zalatwiono_Ns_01 = new GridViewBandColumn { Caption = "Ns " };
               kolumna_Zalatwiono_Ns_01.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_Zalatwiono_Ns_01.Columns.Add(kolumna_d61);
               kolumna_Zalatwiono_Ns_01.Columns.Add(kolumna_d62);

               //---------------

               GridViewBandColumn kolumna_Zalatwiono_NsRej_01 = new GridViewBandColumn { Caption = "Ns-Rej " };
               kolumna_Zalatwiono_NsRej_01.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_Zalatwiono_NsRej_01.Columns.Add(kolumna_d63);
               kolumna_Zalatwiono_NsRej_01.Columns.Add(kolumna_d64);

               //---------------
               GridViewBandColumn kolumna_Zalatwiono_Nc_01 = new GridViewBandColumn { Caption = "Nc " };
               kolumna_Zalatwiono_Nc_01.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_Zalatwiono_Nc_01.Columns.Add(kolumna_d65);
               kolumna_Zalatwiono_Nc_01.Columns.Add(kolumna_d66);

               //---------------
               GridViewBandColumn kolumna_Zalatwiono_Co_01 = new GridViewBandColumn { Caption = "Co " };
               kolumna_Zalatwiono_Co_01.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_Zalatwiono_Co_01.Columns.Add(kolumna_d67);
               kolumna_Zalatwiono_Co_01.Columns.Add(kolumna_d68);

               //---------------
               GridViewBandColumn kolumna_Zalatwiono_WSC_01 = new GridViewBandColumn { Caption = "WSC " };
               kolumna_Zalatwiono_WSC_01.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_Zalatwiono_WSC_01.Columns.Add(kolumna_d69);
               kolumna_Zalatwiono_WSC_01.Columns.Add(kolumna_d70);

               //---------------

               kolumna_Zalatwiono.Columns.Add(kolumna_Zalatwiono_ogolem_01);
               kolumna_Zalatwiono.Columns.Add(kolumna_Zalatwiono_C_01);
               kolumna_Zalatwiono.Columns.Add(kolumna_Zalatwiono_wTym01);
               kolumna_Zalatwiono.Columns.Add(kolumna_Zalatwiono_RC_01);
               kolumna_Zalatwiono.Columns.Add(kolumna_Zalatwiono_zTego);
               kolumna_Zalatwiono.Columns.Add(kolumna_Zalatwiono_CdoDaty);
               kolumna_Zalatwiono.Columns.Add(kolumna_Zalatwiono_Ns_01);
               kolumna_Zalatwiono.Columns.Add(kolumna_Zalatwiono_NsRej_01);
               kolumna_Zalatwiono.Columns.Add(kolumna_Zalatwiono_Nc_01);
               kolumna_Zalatwiono.Columns.Add(kolumna_Zalatwiono_Co_01);
               kolumna_Zalatwiono.Columns.Add(kolumna_Zalatwiono_WSC_01);
               ASPxGridView1.Columns.Add(kolumna_Zalatwiono);

               #region Zalatwienia

               GridViewBandColumn kolumna_Zalatwienia = new GridViewBandColumn
               {
                   Caption = "Załatwienia"
               };
               kolumna_Zalatwienia.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;

               GridViewBandColumn kolumna_Zalatwienia_dodata1 = new GridViewBandColumn { Caption = "RC (do 31.01.2018)" };
               kolumna_Zalatwienia_dodata1.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_Zalatwienia_dodata1.Columns.Add(kolumna_d75);
               kolumna_Zalatwienia_dodata1.Columns.Add(kolumna_d76);
               kolumna_Zalatwienia_dodata1.Columns.Add(kolumna_d77);

               GridViewBandColumn kolumna_Zalatwienia_dodata2 = new GridViewBandColumn { Caption = "RC (od 1.02.2018)" };
               kolumna_Zalatwienia_dodata2.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_Zalatwienia_dodata2.Columns.Add(kolumna_d78);
               kolumna_Zalatwienia_dodata2.Columns.Add(kolumna_d79);

               GridViewBandColumn kolumna_Zalatwienia_C_01 = new GridViewBandColumn();
               kolumna_Zalatwienia_C_01.Caption = "C ";

               kolumna_Zalatwienia_C_01.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_Zalatwienia_C_01.Columns.Add(kolumna_d72);
               kolumna_Zalatwienia_C_01.Columns.Add(kolumna_d73);
               kolumna_Zalatwienia_C_01.Columns.Add(kolumna_d72);
               kolumna_Zalatwienia_C_01.Columns.Add(kolumna_d74);
               kolumna_Zalatwienia_C_01.Columns.Add(kolumna_Zalatwienia_dodata1);
               kolumna_Zalatwienia_C_01.Columns.Add(kolumna_Zalatwienia_dodata2);

               kolumna_Zalatwienia.Columns.Add(kolumna_d71);

               kolumna_Zalatwienia.Columns.Add(kolumna_Zalatwienia_C_01);
               kolumna_Zalatwienia.Columns.Add(kolumna_d80);
               kolumna_Zalatwienia.Columns.Add(kolumna_d81);
               kolumna_Zalatwienia.Columns.Add(kolumna_d82);
               kolumna_Zalatwienia.Columns.Add(kolumna_d83);
               kolumna_Zalatwienia.Columns.Add(kolumna_d84);

               ASPxGridView1.Columns.Add(kolumna_Zalatwienia);

               #endregion Zalatwienia

               #region sesja odbyte przez sedziego

               GridViewBandColumn kolumna_Sesje = new GridViewBandColumn();
               kolumna_Sesje.Caption = "sesje odbyte przez sędziego";
               kolumna_Sesje.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;

               GridViewBandColumn kolumna_Sesje_zTego_01 = new GridViewBandColumn();
               kolumna_Sesje_zTego_01.Caption = "z tego ";
               kolumna_Sesje_zTego_01.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_Sesje_zTego_01.Columns.Add(kolumna_d86);
               kolumna_Sesje_zTego_01.Columns.Add(kolumna_d87);

               GridViewBandColumn kolumna_Sesje_wszystkie_01 = new GridViewBandColumn();
               kolumna_Sesje_wszystkie_01.Caption = "wszystkie sesje sędziego w wydziale ";

               kolumna_Sesje_wszystkie_01.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_Sesje_wszystkie_01.Columns.Add(kolumna_d85);
               kolumna_Sesje_wszystkie_01.Columns.Add(kolumna_Sesje_zTego_01);

               GridViewBandColumn kolumna_Sesje_zTego_02 = new GridViewBandColumn();
               kolumna_Sesje_zTego_02.Caption = "z tego ";
               kolumna_Sesje_zTego_02.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_Sesje_zTego_02.Columns.Add(kolumna_d89);
               kolumna_Sesje_zTego_02.Columns.Add(kolumna_d90);

               GridViewBandColumn kolumna_Sesje_MSS_01 = new GridViewBandColumn();
               kolumna_Sesje_MSS_01.Caption = "na potrzeby MS-S ";

               kolumna_Sesje_MSS_01.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_Sesje_MSS_01.Columns.Add(kolumna_d88);
               kolumna_Sesje_MSS_01.Columns.Add(kolumna_Sesje_zTego_02);

               GridViewBandColumn kolumna_Sesje_C_01 = new GridViewBandColumn();
               kolumna_Zalatwienia_C_01.Caption = "C ";

               kolumna_Zalatwienia_C_01.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_Zalatwienia_C_01.Columns.Add(kolumna_d73);
               kolumna_Zalatwienia_C_01.Columns.Add(kolumna_d74);

               kolumna_Sesje.Columns.Add(kolumna_Sesje_wszystkie_01);
               kolumna_Sesje.Columns.Add(kolumna_Sesje_MSS_01);

               ASPxGridView1.Columns.Add(kolumna_Sesje);

               #endregion sesja odbyte przez sedziego

               #region Liczba odroczonych publikacji orzeczeń

               GridViewBandColumn kolumna_odroczonePublikacje1 = new GridViewBandColumn();
               kolumna_odroczonePublikacje1.Caption = "Liczba odroczonych publikacji orzeczeń ";
               kolumna_odroczonePublikacje1.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_odroczonePublikacje1.Columns.Add(kolumna_d91);
               kolumna_odroczonePublikacje1.Columns.Add(kolumna_d92);
               kolumna_odroczonePublikacje1.Columns.Add(kolumna_d93);

               ASPxGridView1.Columns.Add(kolumna_odroczonePublikacje1);

               #endregion Liczba odroczonych publikacji orzeczeń

               #region Liczba odroczonych spraw

               GridViewBandColumn kolumna_odroczoneSprawy = new GridViewBandColumn();
               kolumna_odroczoneSprawy.Caption = "Liczba odroczonych spraw";
               kolumna_odroczoneSprawy.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_odroczoneSprawy.Columns.Add(kolumna_d94);
               kolumna_odroczoneSprawy.Columns.Add(kolumna_d95);
               kolumna_odroczoneSprawy.Columns.Add(kolumna_d96);

               ASPxGridView1.Columns.Add(kolumna_odroczoneSprawy);

               #endregion Liczba odroczonych spraw

               #region POZOSTAŁOŚĆ na następny m-c

               GridViewBandColumn kolumna_pozostaloscNaNastepnyMiesiac = new GridViewBandColumn { Caption = "POZOSTAŁOŚĆ na następny m-c" };
               kolumna_pozostaloscNaNastepnyMiesiac.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;

               GridViewBandColumn kolumna_pozostaloscNaNastepnyMiesiac_dodata1 = new GridViewBandColumn { Caption = "RC (do 31.01.2018)" };
               kolumna_pozostaloscNaNastepnyMiesiac_dodata1.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_pozostaloscNaNastepnyMiesiac_dodata1.Columns.Add(kolumna_d101);
               kolumna_pozostaloscNaNastepnyMiesiac_dodata1.Columns.Add(kolumna_d102);
               kolumna_pozostaloscNaNastepnyMiesiac_dodata1.Columns.Add(kolumna_d103);

               GridViewBandColumn kolumna_pozostaloscNaNastepnyMiesiac_dodata2 = new GridViewBandColumn { Caption = "RC (od 1.02.2018)" };
               kolumna_pozostaloscNaNastepnyMiesiac_dodata2.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_pozostaloscNaNastepnyMiesiac_dodata2.Columns.Add(kolumna_d104);
               kolumna_pozostaloscNaNastepnyMiesiac_dodata2.Columns.Add(kolumna_d105);

               GridViewBandColumn kolumna_pozostaloscNaNastepnyMiesiac_C_01 = new GridViewBandColumn();
               kolumna_pozostaloscNaNastepnyMiesiac_C_01.Caption = "C ";

               kolumna_pozostaloscNaNastepnyMiesiac_C_01.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_pozostaloscNaNastepnyMiesiac_C_01.Columns.Add(kolumna_d98);
               kolumna_pozostaloscNaNastepnyMiesiac_C_01.Columns.Add(kolumna_d99);
               kolumna_pozostaloscNaNastepnyMiesiac_C_01.Columns.Add(kolumna_d100);

               kolumna_pozostaloscNaNastepnyMiesiac_C_01.Columns.Add(kolumna_pozostaloscNaNastepnyMiesiac_dodata1);
               kolumna_pozostaloscNaNastepnyMiesiac_C_01.Columns.Add(kolumna_pozostaloscNaNastepnyMiesiac_dodata2);

               kolumna_pozostaloscNaNastepnyMiesiac.Columns.Add(kolumna_d97);

               kolumna_pozostaloscNaNastepnyMiesiac.Columns.Add(kolumna_pozostaloscNaNastepnyMiesiac_C_01);
               kolumna_pozostaloscNaNastepnyMiesiac.Columns.Add(kolumna_d106);
               kolumna_pozostaloscNaNastepnyMiesiac.Columns.Add(kolumna_d107);
               kolumna_pozostaloscNaNastepnyMiesiac.Columns.Add(kolumna_d108);
               kolumna_pozostaloscNaNastepnyMiesiac.Columns.Add(kolumna_d109);
               kolumna_pozostaloscNaNastepnyMiesiac.Columns.Add(kolumna_d110);

               ASPxGridView1.Columns.Add(kolumna_pozostaloscNaNastepnyMiesiac);

               #endregion POZOSTAŁOŚĆ na następny m-c

               #region stan spraw zawieszonych (wszystkie kategorie spraw)

               GridViewBandColumn kolumna_stanSprawZawieszonych = new GridViewBandColumn { Caption = "stan spraw zawieszonych (wszystkie kategorie spraw) " };
               kolumna_stanSprawZawieszonych.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_stanSprawZawieszonych.Columns.Add(kolumna_d111);
               kolumna_stanSprawZawieszonych.Columns.Add(kolumna_d112);
               kolumna_stanSprawZawieszonych.Columns.Add(kolumna_d113);
               ASPxGridView1.Columns.Add(kolumna_stanSprawZawieszonych);

               #endregion stan spraw zawieszonych (wszystkie kategorie spraw)

               #region pozostało spraw starych (wszystkie kategorie spraw)

               GridViewBandColumn kolumna_pozostałoSprawStarych = new GridViewBandColumn { Caption = "pozostało spraw starych (wszystkie kategorie spraw) " };
               kolumna_pozostałoSprawStarych.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               kolumna_pozostałoSprawStarych.Columns.Add(kolumna_d114);
               kolumna_pozostałoSprawStarych.Columns.Add(kolumna_d115);
               kolumna_pozostałoSprawStarych.Columns.Add(kolumna_d116);
               kolumna_pozostałoSprawStarych.Columns.Add(kolumna_d117);
               kolumna_pozostałoSprawStarych.Columns.Add(kolumna_d118);
               kolumna_pozostałoSprawStarych.Columns.Add(kolumna_d119);
               kolumna_pozostałoSprawStarych.Columns.Add(kolumna_d_120);
               kolumna_pozostałoSprawStarych.Columns.Add(kolumna_d_121);
               kolumna_pozostałoSprawStarych.Columns.Add(kolumna_d_122);

               ASPxGridView1.Columns.Add(kolumna_pozostałoSprawStarych);

               #endregion pozostało spraw starych (wszystkie kategorie spraw)

               #region liczba sporządzonych uzasadnień (wszystkie kategorie spraw) liczbaSporzadzonychUzasadnienń (wszystkie kategorie spraw)

               GridViewBandColumn liczbaSporzadzonychUzasadnien = new GridViewBandColumn { Caption = "liczba sporządzonych uzasadnień (wszystkie kategorie spraw)" };
               liczbaSporzadzonychUzasadnien.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               liczbaSporzadzonychUzasadnien.HeaderStyle.Wrap = DevExpress.Utils.DefaultBoolean.True;

               liczbaSporzadzonychUzasadnien.Columns.Add(kolumna_d_123);
               liczbaSporzadzonychUzasadnien.Columns.Add(kolumna_d_124);
               liczbaSporzadzonychUzasadnien.Columns.Add(kolumna_d_125);
               liczbaSporzadzonychUzasadnien.Columns.Add(kolumna_d_126);
               //po upływie terminiu ustawowego
               GridViewBandColumn PoupływieTerminiuUstawowego = new GridViewBandColumn { Caption = " upływie terminiu ustawowego" };
               PoupływieTerminiuUstawowego.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               PoupływieTerminiuUstawowego.HeaderStyle.Wrap = DevExpress.Utils.DefaultBoolean.True;

               PoupływieTerminiuUstawowego.Columns.Add(kolumna_d_127);
               PoupływieTerminiuUstawowego.Columns.Add(kolumna_d_128);
               PoupływieTerminiuUstawowego.Columns.Add(kolumna_d_129);
               PoupływieTerminiuUstawowego.Columns.Add(kolumna_d_130);
               PoupływieTerminiuUstawowego.Columns.Add(kolumna_d_131);
               PoupływieTerminiuUstawowego.Columns.Add(kolumna_d_132);
               PoupływieTerminiuUstawowego.Columns.Add(kolumna_d_133);
               PoupływieTerminiuUstawowego.Columns.Add(kolumna_d_134);
               liczbaSporzadzonychUzasadnien.Columns.Add(PoupływieTerminiuUstawowego);
               ASPxGridView1.Columns.Add(liczbaSporzadzonychUzasadnien);

               #endregion liczba sporządzonych uzasadnień (wszystkie kategorie spraw) liczbaSporzadzonychUzasadnienń (wszystkie kategorie spraw)

               #region uzasadnienia wygłoszone  uzasadnieniaWygloszone

               GridViewBandColumn uzasadnieniaWygloszone = new GridViewBandColumn { Caption = " uzasadnienia wygłoszone *" };
               uzasadnieniaWygloszone.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               uzasadnieniaWygloszone.Columns.Add(kolumna_d_135);
               GridViewBandColumn uzasadnieniaWygloszoneWtym = new GridViewBandColumn { Caption = " w tym " };
               uzasadnieniaWygloszoneWtym.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               uzasadnieniaWygloszoneWtym.Columns.Add(kolumna_d_134);

               uzasadnieniaWygloszone.Columns.Add(uzasadnieniaWygloszoneWtym);
               ASPxGridView1.Columns.Add(uzasadnieniaWygloszone);

               #endregion uzasadnienia wygłoszone  uzasadnieniaWygloszone

               #region Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent

               GridViewBandColumn liczbaSpraw = xxl.GetBoundColumn("Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent");
               GridViewBandColumn liczbaSprawWtym = new GridViewBandColumn { Caption = "w tym" };
               liczbaSprawWtym.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               liczbaSprawWtym.Columns.Add(kolumna_d_137);
               liczbaSpraw.Columns.Add(liczbaSprawWtym);

               liczbaSpraw.Columns.Add(kolumna_d_138);
               ASPxGridView1.Columns.Add(liczbaSpraw);

               #endregion Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent

               #region skargi na przewlekłość skargiNaPrzewleklosc

               GridViewBandColumn skargiNaPrzewleklosc = new GridViewBandColumn { Caption = "skargi na przewlekłość" };
               skargiNaPrzewleklosc.HeaderStyle.Wrap = DevExpress.Utils.DefaultBoolean.True;
               skargiNaPrzewleklosc.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               skargiNaPrzewleklosc.Columns.Add(kolumna_d_139);

               GridViewBandColumn skargiNaPrzewlekloscrozpoznano = new GridViewBandColumn { Caption = "rozpoznano" };
               skargiNaPrzewlekloscrozpoznano.HeaderStyle.Wrap = DevExpress.Utils.DefaultBoolean.True;
               skargiNaPrzewlekloscrozpoznano.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
               skargiNaPrzewlekloscrozpoznano.Columns.Add(kolumna_d_140);
               skargiNaPrzewlekloscrozpoznano.Columns.Add(kolumna_d_141);
               skargiNaPrzewleklosc.Columns.Add(skargiNaPrzewlekloscrozpoznano);
               skargiNaPrzewleklosc.Columns.Add(kolumna_d_142);

               ASPxGridView1.Columns.Add(skargiNaPrzewleklosc);

               #endregion skargi na przewlekłość skargiNaPrzewleklosc

               #region mediacje

               GridViewBandColumn mediacje = xxl.GetBoundColumn("mediacje");
               GridViewBandColumn mediacjeWplyw = xxl.GetBoundColumn("wpływ");
               mediacjeWplyw.Columns.Add(kolumna_d_143);
               mediacje.Columns.Add(mediacjeWplyw);
               GridViewBandColumn mediacjerozstrzygniecie = xxl.GetBoundColumn("wpływ");

               mediacje.Columns.Add(kolumna_d_139);
               ASPxGridView1.Columns.Add(mediacje);

               #endregion mediacje

               ASPxGridView1.Columns.Add(kolumna_d_146);
               GridViewBandColumn kolumnaKontrolna = xxl.GetBoundColumn("Kolumna kontrolna (wyznaczenia>=załatwień)");
               kolumnaKontrolna.Columns.Add(kolumna_d_147);
               kolumnaKontrolna.Columns.Add(kolumna_d_148);
               ASPxGridView1.Columns.Add(kolumnaKontrolna);

               ASPxGridView1.TotalSummary.Clear();
               for (int i = 1; i < 149; i++)
               {
                   ASPxGridView1.TotalSummary.Add(xxl.komorkaSumujaca(i));
               }
               */
        }

        protected void Suma(object sender, DevExpress.Data.CustomSummaryEventArgs e)
        {
            ASPxSummaryItem sumItem = (ASPxSummaryItem)e.Item;
        }
    }
}