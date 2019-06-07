﻿using System;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;

namespace stat2018
{
    public partial class mss11o : System.Web.UI.Page
    {
        public static string tenPlik = "mss11o.aspx";
        public Class1 cl = new Class1();
        public mss ms = new mss();
        public common cm = new common();
        public dataReaders dr = new dataReaders();
        public datyDoMSS datyMSS = new datyDoMSS();
        private DateTime dataPoczatkuOkresu = DateTime.Parse("1900-01-01");
        private DateTime dataKoncaOkresu = DateTime.Parse("1900-01-01");

        protected void Page_Load(object sender, EventArgs e)
        {
            string idWydzial = Request.QueryString["w"];
            if (idWydzial != null)
            {
                Session["id_dzialu"] = idWydzial;
                //cm.log.Info(tenPlik + ": id wydzialu=" + idWydzial);
            }
            else
            {
                return;
            }
            if (!IsPostBack)
            {
                //cm.log.Debug("otwarcie formularza: " + tenPlik);
                try
                {
                    // file read with version
                    var fileContents = System.IO.File.ReadAllText(Server.MapPath(@"~//version.txt"));
                    this.Title = "Statystyki " + fileContents.ToString().Trim();
                }
                catch
                {
                    Server.Transfer("default.aspx");
                }
            }
            CultureInfo newCulture = (CultureInfo)CultureInfo.CurrentCulture.Clone();
            newCulture.DateTimeFormat = CultureInfo.GetCultureInfo("PL").DateTimeFormat;
            System.Threading.Thread.CurrentThread.CurrentCulture = newCulture;
            System.Threading.Thread.CurrentThread.CurrentUICulture = newCulture;
            if (dataPoczatkuOkresu == DateTime.Parse("1900-01-01"))
            {
                Date1.Date = DateTime.Parse(datyMSS.DataPoczatkowa());
                cm.log.Info("MSS11o ustawienie daty początkowej: " + datyMSS.DataKoncowa());
                dataPoczatkuOkresu = DateTime.Parse(datyMSS.DataPoczatkowa());
                Date2.Date = DateTime.Parse(datyMSS.DataKoncowa());
                dataKoncaOkresu = DateTime.Parse(datyMSS.DataKoncowa());
                Session["ustawDate11o"] = "X";
            }
            Session["data_1"] = datyMSS.DataPoczatkowa();
            Session["data_2"] = datyMSS.DataKoncowa();
            odswierz();
        }// end of Page_Load

        protected void odswierz()
        {
            string idWydzialu = "'" + (string)Session["id_dzialu"] + "'";
            id_dzialu.Text = (string)Session["txt_dzialu"];

            try
            {
                string idTabeli = string.Empty;
                string idWiersza = string.Empty;
                int idWydzialuNumerycznie = int.Parse((string)Session["id_dzialu"]);
                DataTable tabelaDanych = ms.generuj_dane_do_tabeli_mss2(idWydzialuNumerycznie, Date1.Date, Date2.Date, 21);
                //wypełnianie lebeli

                Label tblControl = new Label { ID = "kod01" };
                tblControl.Width = 1150;
                StringBuilder tabelaGlowna = new StringBuilder();
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("1", naglowekTabeliDzialu_1(), tabelaBocznaDzialu_1(), tabelaDanych, 1, 1, 1, 4, idWydzialuNumerycznie, false, "Ewidencja spraw z zakresu prawa pracy i ubezpieczeń społecznych – ogółem I i II instancja", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("1.1.1.1", naglowekTabeliDzialu_1_1_1_1(), tabelaBocznaDzialu_1_1_1_1(), tabelaDanych, 4, 42, 4, 16, idWydzialuNumerycznie, true, "Ewidencja spraw z zakresu ubezpieczeń społecznych – ogółem oraz I instancja", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("1.1.1.2", naglowekTabeliDzialu_1_1_1_2(), tabelaBocznaDzialu_1_1_1_2(), tabelaDanych, 4, 19, 2, 16, idWydzialuNumerycznie, true, "Ewidencja spraw z zakresu ubezpieczeń społecznych – II instancja", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("1.1.a", naglowekTabeliDzialu_1_1_a(), tabelaBocznaDzialu_1_1_a(), tabelaDanych, 1, 7, 2, 1, idWydzialuNumerycznie, false, "Ewidencja spraw z zakresu ubezpieczeń społecznych – II instancja", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("1.1.b", naglowekTabeliDzialu_1_1_b(), tabelaBocznaDzialu_1_1_b(), tabelaDanych, 1, 3, 1, 4, idWydzialuNumerycznie, false, "Zażalenia w ramach właściwości poziomej (dotyczy dz. 1.1.1.2, w. 2 i 15 lit. b)", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("1.1.c", naglowekTabeliDzialu_1_1_c(), tabelaBocznaDzialu_1_1_c(), tabelaDanych, 1, 9, 2, 1, idWydzialuNumerycznie, false, "W tym: (skarga kasacyjna) (dział 1.1.1.2. wiersz 17 kol. 3 lit. c)", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("1.1.d", naglowekTabeliDzialu_1_1_d(), tabelaBocznaDzialu_1_1_d(), tabelaDanych, 4, 10, 1, 15, idWydzialuNumerycznie, false, "Ewidencja spraw z zakresu ubezpieczeń społecznych – wg podmiotów", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("1.1.d", naglowekTabeliDzialu_1_1_d(), tabelaBocznaDzialu_1_1_d(), tabelaDanych, 4, 10, 1, 15, idWydzialuNumerycznie, false, "Ewidencja spraw z zakresu ubezpieczeń społecznych – wg podmiotów", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("1.1.2.1", naglowekTabeliDzialu_1_1_2_1(), tabelaBocznaDzialu_1_1_2_1(), tabelaDanych, 5, 84, 4, 15, idWydzialuNumerycznie, true, "Ewidencja spraw z zakresu prawa pracy –ogółem oraz I instancja", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("1.1.2.2", naglowekTabeliDzialu_1_1_2_2(), tabelaBocznaDzialu_1_1_2_2(), tabelaDanych, 5, 97, 7, 15, idWydzialuNumerycznie, true, "Dział 1.1.2.2 Ewidencja spraw z zakresu prawa pracy – II instancja", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("1.1.3.a", "Dział 1.1.3.a. Wpływ spraw (liczba), w których z roszczeniem wystąpiła większa grupa pracowników (co najmniej 10 pracowników) (Dział 1.1.2.1. wiersz 03 kol. 2 lit. a)", tabelaDanych, idWydzialuNumerycznie, tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("1.1.3.b", "Dział 1.1.3.b. Załatwiono spraw (liczba), w których z roszczeniem wystąpiła większa grupa pracowników (co najmniej 10 pracowników) (dział 1.1.2.1. wiersz 03 kol. 3 lit. b)", tabelaDanych, idWydzialuNumerycznie, tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("1.1.3.c", naglowekTabeliDzialu_1_1_3_c(), tabelaBocznaDzialu_1_1_3_c(), tabelaDanych, 2, 3, 2, 2, idWydzialuNumerycznie, true, "Ewidencja spraw z zakresu prawa pracy –ogółem oraz I instancja", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("1.1.3.d", naglowekTabeliDzialu_1_1_3_d(), tabelaBocznaDzialu_1_1_3_d(), tabelaDanych, 1, 7, 2, 1, idWydzialuNumerycznie, true, "Dział 1.1.3.d. W tym: (skargi o stwierdzenie niezgodności z prawem łącznie I i II instancja) (dział 1.1.2.1 w. 85 kol. 3 + dział 1.1.2.2 w. 96 kol. 3 lit. d)    ", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("1.1.3.e", naglowekTabeliDzialu_1_1_3_e(), tabelaBocznaDzialu_1_1_3_e(), tabelaDanych, 1, 3, 1, 4, idWydzialuNumerycznie, true, "W tym: (skargi o stwierdzenie niezgodności z prawem łącznie I i II instancja) (dział 1.1.2.1 w. 85 kol. 3 + dział 1.1.2.2 w. 96 kol. 3 lit. d)    ", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("1.1.3.f", naglowekTabeliDzialu_1_1_3_f(), tabelaBocznaDzialu_1_1_3_f(), tabelaDanych, 1, 9, 2, 1, idWydzialuNumerycznie, true, "W tym: (skargi kasacyjne)  (dział 1.1.2.2. wiersz 95 kol. 3 lit. f)", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("1.1.3.g", naglowekTabeliDzialu_1_1_3_g(), tabelaBocznaDzialu_1_1_3_g(), tabelaDanych, 2, 19, 4, 3, idWydzialuNumerycznie, true, "W tym: (skargi kasacyjne)  (dział 1.1.2.2. wiersz 95 kol. 3 lit. f)", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("1.1.3.h", naglowekTabeliDzialu_1_1_3_h(), tabelaBocznaDzialu_1_1_3_h(), tabelaDanych, 3, 1, 1, 5, idWydzialuNumerycznie, true, "W tym: (skargi kasacyjne)  (dział 1.1.2.2. wiersz 95 kol. 3 lit. f)", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("1.1.3.i", "Dział 1.1.3.i.  Liczba wyznaczonych ławników (osoby)", tabelaDanych, idWydzialuNumerycznie, tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("1.1.3.j", naglowekTabeliDzialu_1_1_3_j(), tabelaBocznaDzialu_1_1_3_j(), tabelaDanych, 1, 5, 2, 1, idWydzialuNumerycznie, true, "W tym: (skargi kasacyjne)  (dział 1.1.2.2. wiersz 95 kol. 3 lit. f)", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("1.1.4", naglowekTabeliDzialu_1_1_4(), tabelaBocznaDzialu_1_1_4(), tabelaDanych, 1, 4, 1, 3, idWydzialuNumerycznie, true, "Ustanowienie pełnomocnika z urzędu  ", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("1.1.5.a", naglowekTabeliDzialu_1_1_5_a(), tabelaBocznaDzialu_1_1_5_a(), tabelaDanych, 3, 29, 3, 16, idWydzialuNumerycznie, true, "Struktura wpływu spraw", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("1.1.5.b", naglowekTabeliDzialu_1_1_5_b(), tabelaBocznaDzialu_1_1_5_b(), tabelaDanych, 3, 31, 3, 16, idWydzialuNumerycznie, true, "Struktura załatwień spraw", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("1.2.1", naglowekTabeliDzialu_1_2_1(), tabelaBocznaDzialu_1_2_1(), tabelaDanych, 4, 18, 1, 40, idWydzialuNumerycznie, true, "Struktura załatwień spraw", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("1.2.2", naglowekTabeliDzialu_1_2_2(), tabelaBocznaDzialu_1_2_2(), tabelaDanych, 4, 56, 3, 40, idWydzialuNumerycznie, true, "Liczba sesji odbytych i załatwionych spraw ", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("1.3", naglowekTabeliDzialu_1_3(), tabelaBocznaDzialu_1_3(), tabelaDanych, 2, 5, 1, 10, idWydzialuNumerycznie, true, "Załatwienie spraw przez referendarzy", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("1.4", naglowekTabeliDzialu_1_4(), tabelaBocznaDzialu_1_4(), tabelaDanych, 3, 21, 3, 14, idWydzialuNumerycznie, true, "Terminowość sporządzania uzasadnień", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("2.1.1", naglowekTabeliDzialu_2_1_1(), tabelaBocznaDzialu_2_1_1(), tabelaDanych, 2, 9, 2, 11, idWydzialuNumerycznie, true, "Sprawy od dnia pierwotnego wpisu do repertorium  (łącznie z czasem trwania mediacji)", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("2.1.1.1", naglowekTabeliDzialu_2_1_1_1(), tabelaBocznaDzialu_2_1_1_1(), tabelaDanych, 2, 9, 2, 11, idWydzialuNumerycznie, true, "Sprawy od dnia pierwotnego wpisu do repertorium  (łącznie z czasem trwania mediacji)", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("2.1.1.1.a", naglowekTabeliDzialu_2_1_1_1_a(), tabelaBocznaDzialu_2_1_1_1_a(), tabelaDanych, 2, 9, 2, 11, idWydzialuNumerycznie, true, "Sprawy zawieszone nie zakreślone od dnia pierwotnego wpisu do repertorium (wykazane w dziale 2.1.1.) (łącznie z czasem trwania mediacji)", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("2.1.1.1.a.1", naglowekTabeliDzialu_2_1_1_1_a_1(), tabelaBocznaDzialu_2_1_1_1_a_1(), tabelaDanych, 2, 9, 2, 11, idWydzialuNumerycznie, true, "Sprawy zawieszone nie zakreślone od dnia pierwotnego wpisu do repertorium (wykazane w dziale 2.1.1.) (bez czasu trwania mediacji w sprawach wszczętych po 1 stycznia 2016r.)", tenPlik));
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("2.1.2.1", naglowekTabeliDzialu_2_1_2_1(), tabelaBocznaDzialu_2_1_2_1(), tabelaDanych, 2, 9, 2, 11, idWydzialuNumerycznie, true, "Liczba spraw zakreślonych w urządzeniu ewidencyjnym w wyniku zawieszenia postępowania (bez czasu trwania mediacji w sprawach wszczętych po 1 stycznia 2016r.)", tenPlik));





                tblControl.Text = tabelaGlowna.ToString();
                tablePlaceHolder.Controls.Add(tblControl);
            }
            catch (Exception ex)
            {
                cm.log.Error("MSS 11o Error: " + ex.Message);
            }
        }

        protected void LinkButton54_Click(object sender, EventArgs e)
        {
            odswierz();
        }

        protected void makeCSVFile(object sender, EventArgs e)
        {
            //tworzenie pliku csv
            try
            {
                string idSadu = idSad.Text.Trim();
                string idWydzialu = (string)Session["id_dzialu"];
                try
                {
                    int idWydzialN = int.Parse(idWydzialu);
                    idWydzialu = idWydzialN.ToString("D2");
                }
                catch (Exception)
                {
                    idWydzialu = string.Empty;
                }
                if (!string.IsNullOrEmpty(idWydzialu))
                {
                    DataTable tabela2 = cl.generuj_dane_do_tabeli_mss2(int.Parse((string)Session["id_dzialu"]), Date1.Date, Date2.Date, 21); //dane
                    var distinctRows = (from DataRow dRow in tabela2.Rows select dRow["idTabeli"]).Distinct(); //lista tabelek
                    DataTable listaTabelek = new DataTable();
                    listaTabelek.Columns.Add("tabela", typeof(string));
                    DataRow rowik = listaTabelek.NewRow();

                    foreach (var tabela in distinctRows)
                    {
                        rowik = listaTabelek.NewRow();
                        rowik[0] = tabela.ToString().Trim();
                        listaTabelek.Rows.Add(rowik);
                    }
                    var output = new StringBuilder();
                    //  output.AppendLine("Id formularza;Okres;Sąd;Wydział ;Dział;Wiersz;Kolumna;Liczba");

                    output = ms.raportTXT(listaTabelek, tabela2, idRaportu.Text.Trim(), idSad.Text);

                    Response.Clear();
                    Response.Buffer = true;
                    Response.ContentType = "application/text";
                    Response.AddHeader("Content-Disposition", "attachment;filename=" + idRaportu.Text.Trim() + ".csv");
                    Response.Output.Write(output);
                    //  Response.WriteFile(idRaportu + ".csv");
                    Response.Flush();
                    Response.End();
                }
            }
            catch
            { }
        }

        #region dane do tabeli

        private DataTable schematTabeli()
        {
            DataTable dT = new DataTable();
            dT.Columns.Clear();
            dT.Columns.Add("nrWiersza", typeof(int));
            dT.Columns.Add("nrKolumny", typeof(int));
            dT.Columns.Add("colspan", typeof(int));
            dT.Columns.Add("rowspan", typeof(int));
            dT.Columns.Add("style", typeof(string));
            dT.Columns.Add("text", typeof(string));

            //   var List<tabeleDoMSS> lista = new List <tabeleDoMSS>;
            return dT;
        }

        #region Dzial 1

        private DataTable naglowekTabeliDzialu_1()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 1, "center", "Wyszczególnienie " });
            dT.Rows.Add(new Object[] { 1, 3, 1, 1, "center", "Pozostało z ubiegłego roku  " });
            dT.Rows.Add(new Object[] { 1, 4, 1, 1, "center", "WPŁYNĘŁO razem" });
            dT.Rows.Add(new Object[] { 1, 5, 1, 1, "center", "ZAŁATWIONO razem" });
            dT.Rows.Add(new Object[] { 1, 6, 1, 1, "center", "Pozostało na okres następny" });

            return dT;
        }

        private DataTable tabelaBocznaDzialu_1()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 1, "wciecie borderAll", "Ogółem I i II instancja (dz. 1.1.1.1 w. 01 + dz. 1.1.2.1 w. 01)" });
            return dT;
        }

        #endregion Dzial 1

        #region dzial 1.1.1.1

        private DataTable naglowekTabeliDzialu_1_1_1_1()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 4, 4, "center", "SPRAWY WG REPERTORIÓW LUB WYKAZÓW  " });
            dT.Rows.Add(new Object[] { 1, 5, 1, 4, "center", "Pozostało z ubiegłego roku   " });
            dT.Rows.Add(new Object[] { 1, 6, 2, 1, "center", "WPŁYNĘŁO" });
            dT.Rows.Add(new Object[] { 1, 8, 10, 1, "center", "Załatwiono" });
            dT.Rows.Add(new Object[] { 1, 17, 2, 3, "center", "ODROCZONO" });
            dT.Rows.Add(new Object[] { 1, 19, 1, 4, "center", "Pozostało na okres następny " });
            //wiersz 2
            dT.Rows.Add(new Object[] { 2, 6, 1, 3, "center", "razem " });
            dT.Rows.Add(new Object[] { 2, 7, 1, 3, "center", "w tym odwołań od decyzji uprawnionego organu  " });
            dT.Rows.Add(new Object[] { 2, 8, 1, 3, "center", "razem " });
            dT.Rows.Add(new Object[] { 2, 9, 8, 1, "center", "w tym odwołań od decyzji uprawnionego organu  " });
            dT.Rows.Add(new Object[] { 2, 17, 1, 3, "center", "inne załatwienia " });
            //wiersz 3
            dT.Rows.Add(new Object[] { 3, 9, 4, 1, "center", "od decyzji uprawnionego organu " });
            dT.Rows.Add(new Object[] { 3, 13, 1, 2, "center", "w związku z niewydaniem decyzji zobowiązano uprawniony organ  do wydania decyzji w określonym terminie " });
            dT.Rows.Add(new Object[] { 3, 14, 1, 2, "center", "uchylono " });
            dT.Rows.Add(new Object[] { 3, 15, 2, 1, "center", "umorzono " });
            //  dT.Rows.Add(new Object[] { 3, 15, 1, 1, "center", "umorzono " });
            //wiersz 4
            dT.Rows.Add(new Object[] { 4, 9, 1, 1, "center", "oddalono " });
            dT.Rows.Add(new Object[] { 4, 10, 1, 1, "center", "zmieniono zaskarżoną decyzję w całości lub w części " });
            dT.Rows.Add(new Object[] { 4, 11, 1, 1, "center", "odrzucono " });
            dT.Rows.Add(new Object[] { 4, 12, 1, 1, "center", "uchylenie decyzji, przekazanie sprawy do rozpoznania uprawnionemu organowi, umorzenie postępowania  " });
            //   dT.Rows.Add(new Object[] { 4, 13, 1, 1, "center", "oddalono " });

            dT.Rows.Add(new Object[] { 4, 16, 1, 1, "center", "ogółem " });
            dT.Rows.Add(new Object[] { 4, 17, 1, 1, "center", "w tym w wyniku cofnięcia pozwu/wniosku/skargi " });
            dT.Rows.Add(new Object[] { 4, 19, 1, 1, "center", "ogółem " });
            dT.Rows.Add(new Object[] { 4, 20, 1, 1, "center", "w tym publikację orzeczenia " });

            return dT;
        }

        private DataTable tabelaBocznaDzialu_1_1_1_1()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 4, 1, "wciecie borderAll", "Ogółem I i II instancja (w.2 + dz.1.1.1.2. w. 1) kolumny odpowiednio (np. I inst. kol 4, II inst kol..3)" });
            dT.Rows.Add(new Object[] { 2, 1, 3, 1, "wciecie borderAll", "Ogółem I instancja (w. 03, 32, 42)" });
            dT.Rows.Add(new Object[] { 2, 4, 1, 1, "wciecie borderAll", "" });
            dT.Rows.Add(new Object[] { 3, 1, 3, 1, "wciecie borderAll", "U razem (w. 04 do 31 =dz. 1.1.d w.01)" });
            dT.Rows.Add(new Object[] { 3, 4, 1, 1, "wciecie borderAll", "-" });

            dT.Rows.Add(new Object[] { 4, 1, 1, 3, "wciecie borderAll", " prawo do" });
            dT.Rows.Add(new Object[] { 4, 2, 1, 1, "wciecie borderAll", "emerytury" });
            dT.Rows.Add(new Object[] { 4, 3, 1, 3, "wciecie borderAll", "z wyłączeniem rolników i służb mundurowych" });
            dT.Rows.Add(new Object[] { 4, 4, 1, 1, "wciecie borderAll", "501" });

            dT.Rows.Add(new Object[] { 5, 2, 1, 1, "wciecie borderAll", "renty z tytułu niezdolności do pracy " });
            dT.Rows.Add(new Object[] { 5, 4, 1, 1, "wciecie borderAll", "502" });

            dT.Rows.Add(new Object[] { 6, 2, 1, 1, "wciecie borderAll", "renty rolniczej" });
            dT.Rows.Add(new Object[] { 6, 4, 1, 1, "wciecie borderAll", "503" });

            dT.Rows.Add(new Object[] { 7, 1, 3, 1, "wciecie borderAll", "O rentę lub emeryturę żołnierzy zawodowych, funkcjonariuszy Policji, Agencji Bezpieczeń-stwa Wewnętrznego, Agencji Wywiadu, Służby Kontrwywiadu Wojskowego, Służby Wywiadu Wojskowego, Centralnego Biura Antykorupcyjnego, Biura Ochrony Rządu, Straży Granicznej, Służby Więziennej, Państwowej Straży Pożarnej oraz członków ich rodzin (z wyjątkiem rent znakowanych symbolem 507)" });
            dT.Rows.Add(new Object[] { 7, 4, 1, 1, "wciecie borderAll", "506" });
            dT.Rows.Add(new Object[] { 8, 1, 3, 1, "wciecie borderAll", "O rentę inwalidzką lub rodzinną z tytułu wypadków lub chorób pozostających w związku ze służba wojskową, w  Policji, Agencji Bezpieczeństwa Wewnętrznego, Agencji Wywiadu, Służby Kontrwywiadu Wojskowego, Służby Wywiadu Wojskowego, Centralnego Biura Antykorupcyjnego, Biura Ochrony Rządu, Straży Granicznej, Służby Więziennej, Państwowej Straży Pożarnej" });
            dT.Rows.Add(new Object[] { 8, 4, 1, 1, "wciecie borderAll", "507" });
            dT.Rows.Add(new Object[] { 9, 1, 3, 1, "wciecie borderAll", "O rentę z tytułu niezdolności do pracy przewidzianą dla inwalidów wojennych i wojskowych oraz ich rodzin" });
            dT.Rows.Add(new Object[] { 9, 4, 1, 1, "wciecie borderAll", "508" });

            dT.Rows.Add(new Object[] { 10, 3, 1, 1, "wciecie borderAll", "O prawo do" });
            dT.Rows.Add(new Object[] { 10, 2, 2, 1, "wciecie borderAll", "renty rolniczej z tytułu niezdolności do pracy" });
            dT.Rows.Add(new Object[] { 10, 4, 1, 1, "wciecie borderAll", "518" });

            dT.Rows.Add(new Object[] { 11, 2, 2, 1, "wciecie borderAll", "emerytury rolniczej" });
            dT.Rows.Add(new Object[] { 11, 4, 1, 1, "wciecie borderAll", "511p" });

            dT.Rows.Add(new Object[] { 12, 2, 2, 1, "wciecie borderAll", "renty rodzinnej z ubezpieczenia społecznego rolników" });
            dT.Rows.Add(new Object[] { 12, 4, 1, 1, "wciecie borderAll", "511n" });

            dT.Rows.Add(new Object[] { 13, 1, 3, 1, "wciecie borderAll", "O wysokość emerytury lub renty (z wy-łączeniem rolników i służb mundurowych)" });
            dT.Rows.Add(new Object[] { 13, 4, 1, 1, "wciecie borderAll", "512" });

            dT.Rows.Add(new Object[] { 14, 1, 3, 1, "wciecie borderAll", "O rentę rolniczą lub rodzinną z tytułu niezdolności do pracy powstałej wskutek wypadku przy pracy rolniczej lub rolniczej choroby zawodowej" });
            dT.Rows.Add(new Object[] { 14, 4, 1, 1, "wciecie borderAll", "513" });

            dT.Rows.Add(new Object[] { 15, 1, 3, 1, "wciecie borderAll", "O rentę szkoleniową" });
            dT.Rows.Add(new Object[] { 15, 4, 1, 1, "wciecie borderAll", "517" });

            dT.Rows.Add(new Object[] { 16, 1, 3, 1, "wciecie borderAll", "O rentę socjalną" });
            dT.Rows.Add(new Object[] { 16, 4, 1, 1, "wciecie borderAll", "505" });

            dT.Rows.Add(new Object[] { 17, 1, 3, 1, "wciecie borderAll", "Ustalenie istnienia bądź nieistnienia ubezpieczeń społecznych i ich zakresu lub o należności z tytułu składek na ubezpieczenia społeczne, Fundusz Pracy, Fundusz Gwarantowanych Świadczeń Pracowniczych, Fundusz Emerytur Pomostowych oraz na ubezpieczenie zdrowotne" });
            dT.Rows.Add(new Object[] { 17, 4, 1, 1, "wciecie borderAll", "557" });

            dT.Rows.Add(new Object[] { 18, 1, 3, 1, "wciecie borderAll", "Roszczenia ze stosunków prawnych między członkami otwartych funduszy emerytalnych a tymi funduszami lub ich organami" });
            dT.Rows.Add(new Object[] { 18, 4, 1, 1, "wciecie borderAll", "561" });

            dT.Rows.Add(new Object[] { 19, 1, 3, 1, "wciecie borderAll", "O emeryturę pomostową" });
            dT.Rows.Add(new Object[] { 19, 4, 1, 1, "wciecie borderAll", "557" });

            dT.Rows.Add(new Object[] { 20, 1, 3, 1, "wciecie borderAll", "O wysokość emerytury rolniczej, renty rolniczej z tytułu niezdolności do pracy i renty rodzinnej oraz emerytury i renty z ubezpieczenia społecznego rolników indywidualnych i członków ich rodzin" });
            dT.Rows.Add(new Object[] { 20, 4, 1, 1, "wciecie borderAll", "557" });

            dT.Rows.Add(new Object[] { 21, 1, 3, 1, "wciecie borderAll", "O wysokość emerytury i renty żołnierzy zawodowych, funkcjonariuszy Policji, Agencji Bezpieczeństwa Wewnętrznego, agencji Wywiadu, służby Kontrwywiadu Wojskowego, Służby Wywiadu Wojskowe-go, Centralnego Biura Antykorupcyjnego, Biura Ochrony Rządu, Straży Granicznej, Służby Więziennej, Państwowej Straży Pożarnej, inwalidów wojennych i wojsko-wych oraz członków ich rodzin" });
            dT.Rows.Add(new Object[] { 21, 4, 1, 1, "wciecie borderAll", "579" });

            dT.Rows.Add(new Object[] { 22, 1, 3, 1, "wciecie borderAll", "O nauczycielskie świadczenie kompensacyjne" });
            dT.Rows.Add(new Object[] { 22, 4, 1, 1, "wciecie borderAll", "580" });

            dT.Rows.Add(new Object[] { 23, 1, 3, 1, "wciecie borderAll", "Sprawy dotyczące odpowiedzialności osób trzecich i następców prawnych za składki na ubezpieczenia społeczne, FP (Fundusz Pracy), FGŚP (Fundusz Gwarantowanych Świadczeń Pracowniczych) i ubezpiecze-nie zdrowotne" });
            dT.Rows.Add(new Object[] { 23, 4, 1, 1, "wciecie borderAll", "581" });

            dT.Rows.Add(new Object[] { 24, 1, 3, 1, "wciecie borderAll", "O ustalenie kapitału początkowego" });
            dT.Rows.Add(new Object[] { 24, 4, 1, 1, "wciecie borderAll", "582" });

            dT.Rows.Add(new Object[] { 25, 1, 3, 1, "wciecie borderAll", "O świadczenie przedemerytalne" });
            dT.Rows.Add(new Object[] { 25, 4, 1, 1, "wciecie borderAll", "583" });

            dT.Rows.Add(new Object[] { 26, 1, 3, 1, "wciecie borderAll", "O wysokość zasiłku przedemerytalnego" });
            dT.Rows.Add(new Object[] { 26, 4, 1, 1, "wciecie borderAll", "584" });

            dT.Rows.Add(new Object[] { 27, 1, 3, 1, "wciecie borderAll", "O ekwiwalent pieniężny z tytułu prawa do bezpłatnego węgla" });
            dT.Rows.Add(new Object[] { 27, 4, 1, 1, "wciecie borderAll", "585" });

            dT.Rows.Add(new Object[] { 28, 1, 3, 1, "wciecie borderAll", "O inne dodatki wypłacane przez organ rentowy jeśli przedmiotem postępowania nie jest prawo do emerytury lub renty" });
            dT.Rows.Add(new Object[] { 28, 4, 1, 1, "wciecie borderAll", "586" });

            dT.Rows.Add(new Object[] { 29, 1, 3, 1, "wciecie borderAll", "O wydanie zaświadczenia w sprawie z zakresu ubezpieczeń społecznych" });
            dT.Rows.Add(new Object[] { 29, 4, 1, 1, "wciecie borderAll", "587" });

            dT.Rows.Add(new Object[] { 30, 1, 3, 1, "wciecie borderAll", "O wydanie pisemnej interpretacji przepisów prawnych" });
            dT.Rows.Add(new Object[] { 30, 4, 1, 1, "wciecie borderAll", "588" });

            dT.Rows.Add(new Object[] { 31, 1, 3, 1, "wciecie borderAll", "Inne bez symbolu i o symbolach niewymienionych" });
            dT.Rows.Add(new Object[] { 31, 4, 1, 1, "wciecie borderAll", "-" });

            dT.Rows.Add(new Object[] { 32, 1, 3, 1, "wciecie borderAll", "Uo razem (w. 33 do 41)" });
            dT.Rows.Add(new Object[] { 32, 4, 1, 1, "wciecie borderAll", "-" });

            dT.Rows.Add(new Object[] { 33, 1, 3, 1, "wciecie borderAll", "O nadanie klauzuli wykonalności" });
            dT.Rows.Add(new Object[] { 33, 4, 1, 1, "wciecie borderAll", "104" });

            dT.Rows.Add(new Object[] { 34, 1, 3, 1, "wciecie borderAll", "O zwolnienie od kosztów sądowych i i/lub ustanowienie radcy prawnego, adwokata" });
            dT.Rows.Add(new Object[] { 34, 4, 1, 1, "wciecie borderAll", "105" });

            dT.Rows.Add(new Object[] { 35, 1, 3, 1, "wciecie borderAll", "Uznanie orzeczenia sądu zagranicznego" });
            dT.Rows.Add(new Object[] { 35, 4, 1, 1, "wciecie borderAll", "107" });

            dT.Rows.Add(new Object[] { 36, 1, 3, 1, "wciecie borderAll", "O wyznaczenie sądu" });
            dT.Rows.Add(new Object[] { 36, 4, 1, 1, "wciecie borderAll", "108" });

            dT.Rows.Add(new Object[] { 37, 1, 3, 1, "wciecie borderAll", "O wyłączenie sędziego" });
            dT.Rows.Add(new Object[] { 37, 4, 1, 1, "wciecie borderAll", "109" });

            dT.Rows.Add(new Object[] { 38, 1, 3, 1, "wciecie borderAll", "O odtworzenie akt " });
            dT.Rows.Add(new Object[] { 38, 4, 1, 1, "wciecie borderAll", "111" });

            dT.Rows.Add(new Object[] { 39, 1, 3, 1, "wciecie borderAll", "O uznanie i stwierdzenie wykonalności wyroku sądu polubownego wydanego za granicą " });
            dT.Rows.Add(new Object[] { 39, 4, 1, 1, "wciecie borderAll", "117" });
            dT.Rows.Add(new Object[] { 40, 1, 3, 1, "wciecie borderAll", "Dotyczące pomocy sądowej " });
            dT.Rows.Add(new Object[] { 40, 4, 1, 1, "wciecie borderAll", "113" });
            dT.Rows.Add(new Object[] { 41, 1, 3, 1, "wciecie borderAll", "Inne bez symbolu i o symbolu wyżej niewymienionym " });
            dT.Rows.Add(new Object[] { 41, 4, 1, 1, "wciecie borderAll", "-" });
            dT.Rows.Add(new Object[] { 42, 1, 3, 1, "wciecie borderAll", "WSC (skarga o stwierdze-nie niezgodności z pra-wem) – I instancja" });
            dT.Rows.Add(new Object[] { 42, 4, 1, 1, "wciecie borderAll", "-" });

            return dT;
        }

        #endregion dzial 1.1.1.1

        #region dzial 1.1.1.2

        private DataTable naglowekTabeliDzialu_1_1_1_2()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 3, 4, "center", "SPRAWY WG REPERTORIÓW LUB WYKAZÓW  " });
            dT.Rows.Add(new Object[] { 1, 4, 1, 4, "center", "Pozostało z ubiegłego roku   " });
            dT.Rows.Add(new Object[] { 1, 5, 1, 4, "center", "WPŁYNĘŁO razem" });
            dT.Rows.Add(new Object[] { 1, 6, 10, 1, "center", "Załatwiono" });
            dT.Rows.Add(new Object[] { 1, 16, 2, 2, "center", "ODROCZONO" });
            dT.Rows.Add(new Object[] { 1, 18, 1, 4, "center", "Pozostało na okres następny " });
            //wiersz 2
            dT.Rows.Add(new Object[] { 2, 6, 1, 3, "center", "razem " });
            dT.Rows.Add(new Object[] { 2, 7, 9, 1, "center", "w tym" });
            //wiersz 3
            dT.Rows.Add(new Object[] { 3, 4, 1, 2, "center", "oddalono" });
            dT.Rows.Add(new Object[] { 3, 5, 1, 2, "center", "zmieniono" });
            dT.Rows.Add(new Object[] { 3, 6, 1, 2, "center", "uchylono lub uchylono i przekazano do sądu I instancji" });
            dT.Rows.Add(new Object[] { 3, 7, 1, 2, "center", "uchylono w trybie 477 14a kpc " });
            dT.Rows.Add(new Object[] { 3, 8, 1, 2, "center", "zwrócono " });
            dT.Rows.Add(new Object[] { 3, 9, 1, 2, "center", "odrzucono " });
            dT.Rows.Add(new Object[] { 3, 10, 2, 1, "center", "umorzono " });
            dT.Rows.Add(new Object[] { 3, 12, 1, 2, "center", "inne załatwienia " });
            dT.Rows.Add(new Object[] { 3, 13, 1, 2, "center", "ogółem " });
            dT.Rows.Add(new Object[] { 3, 14, 1, 2, "center", "w tym publikacje orzeczenia " });
            //wiersz 4
            dT.Rows.Add(new Object[] { 4, 9, 1, 1, "center", "ogółem " });

            dT.Rows.Add(new Object[] { 4, 10, 1, 1, "center", "w tym w wyniku cofnięcia pozwu/wniosku/skargi " });

            return dT;
        }

        private DataTable tabelaBocznaDzialu_1_1_1_2()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 2, 1, "wciecie borderAll", "Ogółem II instancja (w. 02, 15 do 19)" });
            dT.Rows.Add(new Object[] { 1, 3, 1, 1, "center borderAll", "-" });

            dT.Rows.Add(new Object[] { 2, 1, 2, 1, "wciecie borderAll", "Ua (apelacyjne) b) razem (w. 03 do 14)" });
            dT.Rows.Add(new Object[] { 2, 3, 1, 1, "center borderAll", "-" });

            dT.Rows.Add(new Object[] { 3, 1, 1, 2, "wciecie borderAll", "O jednorazowe odszkodowanie z tytułu" });
            dT.Rows.Add(new Object[] { 3, 2, 1, 1, "wciecie borderAll", "wypadku przy pracy rolniczej lub rolniczej choroby zawodowej" });
            dT.Rows.Add(new Object[] { 3, 3, 1, 1, "center borderAll", "514" });

            dT.Rows.Add(new Object[] { 4, 2, 1, 1, "wciecie borderAll", "wypadku przy pracy lub choroby zawodowej" });
            dT.Rows.Add(new Object[] { 4, 3, 1, 1, "center borderAll", "501" });

            dT.Rows.Add(new Object[] { 5, 1, 2, 1, "wciecie borderAll", "O zasiłek macierzyński" });
            dT.Rows.Add(new Object[] { 5, 4, 1, 1, "center borderAll", "569" });

            dT.Rows.Add(new Object[] { 6, 1, 2, 1, "wciecie borderAll", "Jednorazowe odszkodowania przysługujące w razie wypadków lub chorób pozostających w związku ze służbą wojskową, w Policji, Agencji Bezpieczeństwa Wewnętrznego, Agencji Wywiadu, Służby Kontrwywiadu Wojskowego, Służby Wywiadu Wojskowego, Centralnego Biura Antykorupcyjnego, Biura Ochrony Rządu, Straży Granicznej, Służbie Więziennej, Państwowej Straży Pożarnej" });
            dT.Rows.Add(new Object[] { 6, 4, 1, 1, "center borderAll", "559" });

            dT.Rows.Add(new Object[] { 7, 1, 2, 1, "wciecie borderAll", "Ustalenie niepełnosprawności" });
            dT.Rows.Add(new Object[] { 7, 4, 1, 1, "center borderAll", "560n" });
            dT.Rows.Add(new Object[] { 8, 1, 2, 1, "wciecie borderAll", "Ustalenie stopnia niepełnosprawności " });
            dT.Rows.Add(new Object[] { 8, 4, 1, 1, "center borderAll", "560" });
            dT.Rows.Add(new Object[] { 9, 1, 2, 1, "wciecie borderAll", "O zasiłek opiekuńczy" });
            dT.Rows.Add(new Object[] { 9, 4, 1, 1, "center borderAll", "552o" });
            dT.Rows.Add(new Object[] { 10, 1, 2, 1, "wciecie borderAll", "O zasiłek pogrzebowy" });
            dT.Rows.Add(new Object[] { 10, 4, 1, 1, "center borderAll", "554" });
            dT.Rows.Add(new Object[] { 11, 1, 2, 1, "wciecie borderAll", "O zasiłek wyrównawczy" });
            dT.Rows.Add(new Object[] { 11, 4, 1, 1, "center borderAll", "552w" });

            dT.Rows.Add(new Object[] { 12, 1, 2, 1, "wciecie borderAll", "O świadczenie rehabilitacyjne " });
            dT.Rows.Add(new Object[] { 12, 4, 1, 1, "center borderAll", "555" });
            dT.Rows.Add(new Object[] { 13, 1, 2, 1, "wciecie borderAll", "O zasiłek chorobowy " });
            dT.Rows.Add(new Object[] { 13, 4, 1, 1, "center borderAll", "576" });
            dT.Rows.Add(new Object[] { 14, 1, 2, 1, "wciecie borderAll", "Inne bez symbolu i o symbolach niewymienionych " });
            dT.Rows.Add(new Object[] { 14, 4, 1, 1, "center borderAll", "-" });
            dT.Rows.Add(new Object[] { 15, 1, 2, 1, "wciecie borderAll", "Uz (zażaleniowe) <sup>b)</sup>" });
            dT.Rows.Add(new Object[] { 15, 4, 1, 1, "center borderAll", "-" });
            dT.Rows.Add(new Object[] { 16, 1, 2, 1, "wciecie borderAll", "Uo II instancja" });
            dT.Rows.Add(new Object[] { 16, 4, 1, 1, "center borderAll", "-" });
            dT.Rows.Add(new Object[] { 17, 1, 2, 1, "wciecie borderAll", "WSC (skarga kasacyjna)" });
            dT.Rows.Add(new Object[] { 17, 4, 1, 1, "center borderAll", "-" });
            dT.Rows.Add(new Object[] { 18, 1, 2, 1, "wciecie borderAll", "WSC (skarga o stwierdzenie niezgodności z prawem) – II instancja" });
            dT.Rows.Add(new Object[] { 18, 4, 1, 1, "center borderAll", "-" });
            dT.Rows.Add(new Object[] { 19, 1, 2, 1, "wciecie borderAll", "Skarga na postępowanie sądowe  Wykaz S" });
            dT.Rows.Add(new Object[] { 19, 4, 1, 1, "center borderAll", "-" });
            return dT;
        }

        #endregion dzial 1.1.1.2

        #region dzial 1.1.2.2

        private DataTable naglowekTabeliDzialu_1_1_2_2()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 7, 5, "center", "SPRAWY Z REPERTORIUM" });
            //dT.Rows.Add(new Object[] { 1, 4, 1, 5, "center", "Symbol" });
            dT.Rows.Add(new Object[] { 1, 5, 1, 5, "center col_100", "Pozostało z ubiegłego roku" });
            dT.Rows.Add(new Object[] { 1, 6, 1, 5, "center", "Wpłynęło razem" });
            dT.Rows.Add(new Object[] { 1, 7, 10, 1, "center ", "Załatwiono" });
            dT.Rows.Add(new Object[] { 1, 17, 2, 2, "center col_100", "Odroczono" });
            dT.Rows.Add(new Object[] { 1, 18, 1, 5, "center col_100", "Pozostało na okres następny" });

            dT.Rows.Add(new Object[] { 2, 7, 1, 4, "center col_100", "Razem" });
            dT.Rows.Add(new Object[] { 2, 8, 9, 1, "center col_100", "z tego" });

            dT.Rows.Add(new Object[] { 3, 8, 1, 3, "center col_100", "uwzględniono w całości lub w części" });
            dT.Rows.Add(new Object[] { 3, 9, 1, 3, "center col_100", "oddalono" });
            dT.Rows.Add(new Object[] { 3, 10, 1, 3, "center col_100", "zwrócono" });
            dT.Rows.Add(new Object[] { 3, 11, 1, 3, "center col_100", "odrzucono" });
            dT.Rows.Add(new Object[] { 3, 12, 4, 1, "center col_100", "umorzono" });
            dT.Rows.Add(new Object[] { 3, 16, 1, 3, "center col_100", "Inne załatwienia" });

            dT.Rows.Add(new Object[] { 3, 17, 1, 3, "center col_100", "ogółem" });
            dT.Rows.Add(new Object[] { 3, 18, 1, 3, "center col_100", "w tym publikację orzeczenia" });

            dT.Rows.Add(new Object[] { 4, 12, 1, 2, "center col_100", "ogółem" });
            dT.Rows.Add(new Object[] { 4, 13, 3, 1, "center ", "w tym w wyniku" });

            dT.Rows.Add(new Object[] { 5, 13, 1, 1, "center col_100", "zawarcia ugody przed sądem" });
            dT.Rows.Add(new Object[] { 5, 14, 1, 1, "center col_100", "w tym w wyniku cofnięcia pozwu/wniosku/skargi" });
            dT.Rows.Add(new Object[] { 5, 15, 1, 1, "center col_100", "mediacji" });

            return dT;
        }

        private DataTable tabelaBocznaDzialu_1_1_2_2()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 6, 1, "wciecie borderAll", "Ogółem II instancja (wiersze 02+93 do 97)" });
            dT.Rows.Add(new Object[] { 1, 7, 1, 1, " center", "-" });
            dT.Rows.Add(new Object[] { 2, 1, 6, 1, "wciecie borderAll", "Rep. Pa (apelacyjne) (wiersz 03 ) <sup>e)</sup>" });
            dT.Rows.Add(new Object[] { 2, 7, 1, 1, " center", "-" });
            dT.Rows.Add(new Object[] { 3, 1, 6, 1, "wciecie borderAll", "Rep. P  – razem (wiersze 04, 05, 08 do 35, 38 do 92)" });
            dT.Rows.Add(new Object[] { 3, 7, 1, 1, " center", "-" });

            dT.Rows.Add(new Object[] { 4, 1, 2, 4, "wciecie ", "Związane z wypowiedzeniem umowy o pracę " });
            dT.Rows.Add(new Object[] { 4, 3, 3, 2, "wciecie ", "razem dotyczy" });
            dT.Rows.Add(new Object[] { 4, 6, 1, 1, " center", "kobiet" });
            dT.Rows.Add(new Object[] { 4, 7, 1, 1, " center", "401dk" });
            dT.Rows.Add(new Object[] { 5, 6, 1, 1, " center", "mężczyzn" });
            dT.Rows.Add(new Object[] { 5, 7, 1, 1, " center", "401m" });

            dT.Rows.Add(new Object[] { 6, 3, 3, 2, "wciecie ", "w tym pracownicy w okresie ciąży lub urlopu macierzyńskiego albo pracownikowi – ojcu wychowującemu dziecko w okresie korzystania z urlopu macierzyńskiego" });
            dT.Rows.Add(new Object[] { 6, 6, 1, 1, " center", "kobiet" });
            dT.Rows.Add(new Object[] { 6, 7, 1, 1, " center", "401cdk" });
            dT.Rows.Add(new Object[] { 7, 6, 1, 1, " center", "mężczyzn" });
            dT.Rows.Add(new Object[] { 7, 7, 1, 1, " center", "401cdm" });

            dT.Rows.Add(new Object[] { 8, 1, 1, 11, "wciecie ", "Dotyczące rozwiązania umowy o pracę " });
            dT.Rows.Add(new Object[] { 8, 3, 1, 10, "wciecie ", "bez  wypowiedzenia" });
            dT.Rows.Add(new Object[] { 8, 4, 3, 2, "wciecie ", "z winy pracownika dotyczy" });

            dT.Rows.Add(new Object[] { 8, 6, 1, 1, " center", "kobiet" });
            dT.Rows.Add(new Object[] { 8, 7, 1, 1, " center", "401dk" });
            dT.Rows.Add(new Object[] { 9, 6, 1, 1, " center", "mężczyzn" });
            dT.Rows.Add(new Object[] { 9, 7, 1, 1, " center", "401m" });

            dT.Rows.Add(new Object[] { 10, 3, 3, 2, "wciecie ", "bez winy pracownika dotyczy " });
            dT.Rows.Add(new Object[] { 10, 6, 1, 1, " center", "kobiet" });
            dT.Rows.Add(new Object[] { 10, 7, 1, 1, " center", "402bwdk" });
            dT.Rows.Add(new Object[] { 11, 6, 1, 1, " center", "mężczyzn" });
            dT.Rows.Add(new Object[] { 11, 7, 1, 1, " center", "402bwm" });

            dT.Rows.Add(new Object[] { 12, 3, 3, 2, "wciecie ", "przez pracownika z powodu szkodliwego wpływu pracy na zdrowie dotyczy " });
            dT.Rows.Add(new Object[] { 12, 5, 1, 1, " center", "kobiet" });
            dT.Rows.Add(new Object[] { 12, 6, 1, 1, " center", "402szkdk" });
            dT.Rows.Add(new Object[] { 13, 5, 1, 1, " center", "mężczyzn" });
            dT.Rows.Add(new Object[] { 13, 6, 1, 1, " center", "402szkm" });

            dT.Rows.Add(new Object[] { 14, 3, 1, 4, "wciecie ", "z powodu" });

            dT.Rows.Add(new Object[] { 14, 4, 2, 2, "wciecie ", "upadłości dotyczy " });
            dT.Rows.Add(new Object[] { 14, 5, 1, 1, " center", "kobiet" });
            dT.Rows.Add(new Object[] { 14, 6, 1, 1, " center", "402updk" });
            dT.Rows.Add(new Object[] { 15, 5, 1, 1, " center", "mężczyzn" });
            dT.Rows.Add(new Object[] { 15, 6, 1, 1, " center", "402upm" });
            dT.Rows.Add(new Object[] { 16, 4, 2, 2, "wciecie ", "likwidacji zakładu pracy dotyczy" });
            dT.Rows.Add(new Object[] { 16, 5, 1, 1, " center", "kobiet" });
            dT.Rows.Add(new Object[] { 16, 6, 1, 1, " center", "402likdk" });
            dT.Rows.Add(new Object[] { 17, 5, 1, 1, " center", "mężczyzn" });
            dT.Rows.Add(new Object[] { 17, 6, 1, 1, " center", "402likm" });
            dT.Rows.Add(new Object[] { 18, 2, 5, 1, "wciecie ", "z uwagi na ciężkie naruszenie podstawowych obowiązków przez pracodawcę" });
            dT.Rows.Add(new Object[] { 18, 6, 1, 1, " center", "402pr" });
            dT.Rows.Add(new Object[] { 19, 1, 5, 2, "wciecie ", "Związane z innym sposobem ustania stosunku pracy dotyczy " });
            dT.Rows.Add(new Object[] { 19, 5, 1, 1, " center", "kobiet" });
            dT.Rows.Add(new Object[] { 19, 6, 1, 1, " center", "404dk" });
            dT.Rows.Add(new Object[] { 20, 5, 1, 1, " center", "mężczyzn" });
            dT.Rows.Add(new Object[] { 20, 6, 1, 1, " center", "404m" });
            dT.Rows.Add(new Object[] { 21, 1, 6, 1, "wciecie borderAll", "O odszkodowanie z tytułu niewydania w terminie świadectwa pracy lub wydania niewłaściwego  świadectwa pracy" });
            dT.Rows.Add(new Object[] { 21, 7, 1, 1, " center", "-" });
            dT.Rows.Add(new Object[] { 22, 1, 6, 1, "wciecie borderAll", "O wydanie lub sprostowanie świadectwa pracy" });
            dT.Rows.Add(new Object[] { 22, 7, 1, 1, " center", "-" });

            dT.Rows.Add(new Object[] { 23, 1, 5, 2, "wciecie ", "O nawiązanie stosunku pracy i roszczenia o odszkodowanie za niezawarcie umowy przyrzeczonej dotyczy " });
            dT.Rows.Add(new Object[] { 23, 5, 1, 1, " center", "kobiet" });
            dT.Rows.Add(new Object[] { 23, 6, 1, 1, " center", "406dk" });
            dT.Rows.Add(new Object[] { 24, 5, 1, 1, " center", "mężczyzn" });
            dT.Rows.Add(new Object[] { 24, 6, 1, 1, " center", "406m" });

            dT.Rows.Add(new Object[] { 25, 1, 5, 2, "wciecie ", "Związane z wypowiedzeniem umownych warunków pracy i płacy dotyczy " });
            dT.Rows.Add(new Object[] { 25, 5, 1, 1, " center", "kobiet" });
            dT.Rows.Add(new Object[] { 25, 6, 1, 1, " center", "407dk" });
            dT.Rows.Add(new Object[] { 26, 5, 1, 1, " center", "mężczyzn" });
            dT.Rows.Add(new Object[] { 26, 6, 1, 1, " center", "407m" });

            dT.Rows.Add(new Object[] { 27, 1, 5, 2, "wciecie ", "O wynagrodzenie za pracę (z wyjątkiem objętych symbolami 401, 402, 404, 409 i 467) dotyczy " });
            dT.Rows.Add(new Object[] { 27, 5, 1, 1, " center", "kobiet" });
            dT.Rows.Add(new Object[] { 27, 6, 1, 1, " center", "408dk" });
            dT.Rows.Add(new Object[] { 28, 5, 1, 1, " center", "mężczyzn" });
            dT.Rows.Add(new Object[] { 28, 6, 1, 1, " center", "408m" });

            dT.Rows.Add(new Object[] { 29, 1, 6, 1, "wciecie borderAll", "O wynagrodzenie za pracę w godzinach nadliczbowych" });
            dT.Rows.Add(new Object[] { 29, 7, 1, 1, " center", "409" });

            dT.Rows.Add(new Object[] { 30, 1, 2, 5, "wciecie ", "O urlop " });
            dT.Rows.Add(new Object[] { 30, 3, 4, 1, "wciecie ", "wypoczynkowy lub ekwiwalent pieniężny za urlop" });
            dT.Rows.Add(new Object[] { 30, 6, 1, 1, " center", "408dk" });

            dT.Rows.Add(new Object[] { 31, 2, 3, 2, "wciecie ", "macierzyński" });
            dT.Rows.Add(new Object[] { 31, 5, 1, 1, " center", "kobiet" });
            dT.Rows.Add(new Object[] { 31, 6, 1, 1, " center", "410macdk" });
            dT.Rows.Add(new Object[] { 32, 5, 1, 1, " center", "mężczyzn" });
            dT.Rows.Add(new Object[] { 32, 6, 1, 1, " center", "410macdm" });

            dT.Rows.Add(new Object[] { 33, 2, 3, 2, "wciecie ", "wychowawczy" });
            dT.Rows.Add(new Object[] { 33, 5, 1, 1, " center", "kobiet" });
            dT.Rows.Add(new Object[] { 33, 6, 1, 1, " center", "410wychdk" });
            dT.Rows.Add(new Object[] { 34, 5, 1, 1, " center", "mężczyzn" });
            dT.Rows.Add(new Object[] { 34, 6, 1, 1, " center", "410wychdm" });

            dT.Rows.Add(new Object[] { 35, 1, 2, 3, "wciecie ", "Związane ze szczególną ochroną pracy kobiet" });
            dT.Rows.Add(new Object[] { 35, 3, 4, 1, "wciecie ", "razem" });
            dT.Rows.Add(new Object[] { 35, 6, 1, 1, " center", "411" });

            dT.Rows.Add(new Object[] { 36, 3, 1, 2, "wciecie ", "w tym" });
            dT.Rows.Add(new Object[] { 36, 4, 2, 1, "wciecie ", "w ciąży" });

            dT.Rows.Add(new Object[] { 36, 5, 1, 1, " center", "kobiet" });
            dT.Rows.Add(new Object[] { 36, 6, 1, 1, " center", "410macdk" });
            dT.Rows.Add(new Object[] { 36, 5, 1, 1, " center", "mężczyzn" });
            dT.Rows.Add(new Object[] { 36, 6, 1, 1, " center", "410macdm" });

            dT.Rows.Add(new Object[] { 37, 2, 2, 1, "wciecie ", "karmiących dziecko piersią w okresie czasu pracy" });
            dT.Rows.Add(new Object[] { 37, 5, 1, 1, " center", "kobiet" });
            dT.Rows.Add(new Object[] { 37, 6, 1, 1, " center", "410wychdk" });

            dT.Rows.Add(new Object[] { 38, 1, 6, 1, "wciecie borderAll", "Roszczenia dotyczące uprawnień pracowników związanych z rodzicielstwem /określone w dziale ósmym kp (z wyłączeniem spraw o symbolach 401c, 410mac, 410wych, 411c i 411p)" });
            dT.Rows.Add(new Object[] { 38, 7, 1, 1, " center", "482" });

            dT.Rows.Add(new Object[] { 39, 1, 6, 1, "wciecie borderAll", "Związane ze szczególną ochroną pracy młodocianych" });
            dT.Rows.Add(new Object[] { 39, 7, 1, 1, " center", "412" });
            dT.Rows.Add(new Object[] { 40, 1, 6, 1, "wciecie borderAll", "O świadczenia z tytułu czasowej niezdolności do pracy" });
            dT.Rows.Add(new Object[] { 40, 7, 1, 1, " center", "420" });

            dT.Rows.Add(new Object[] { 41, 1, 2, 5, "wciecie ", "O odprawę" });
            dT.Rows.Add(new Object[] { 41, 3, 4, 1, "wciecie ", "rentową" });
            dT.Rows.Add(new Object[] { 41, 6, 1, 1, " center", "421r" });

            dT.Rows.Add(new Object[] { 42, 3, 4, 1, "wciecie ", "emerytalną" });
            dT.Rows.Add(new Object[] { 42, 6, 1, 1, " center", "421em" });
            dT.Rows.Add(new Object[] { 43, 3, 4, 1, "wciecie ", "emerytalną" });
            dT.Rows.Add(new Object[] { 43, 6, 1, 1, " center", "421em" });
            dT.Rows.Add(new Object[] { 43, 3, 4, 1, "wciecie ", " pieniężną z tytułu rozwiązania stosunku pracy z przyczyn niedotyczących pracowników" });
            dT.Rows.Add(new Object[] { 43, 6, 1, 1, " center", "422" });

            dT.Rows.Add(new Object[] { 44, 1, 4, 1, "wciecie borderAll", "O nagrody jubileuszowe" });
            dT.Rows.Add(new Object[] { 44, 7, 1, 1, " center", "423" });

            dT.Rows.Add(new Object[] { 45, 1, 4, 1, "wciecie borderAll", "Dotyczące dochodzenia świadczeń z Funduszu Gwarantowanych Świadczeń Pra-cowniczych na podstawie ustawy z dnia 13 lipca 2006 r. o ochronie roszczeń pracow-niczych w razie niewypłacalności pracodawcy (Dz.U. z 2018 r. poz. 1433)" });
            dT.Rows.Add(new Object[] { 45, 7, 1, 1, " center", "430" });

            dT.Rows.Add(new Object[] { 46, 1, 6, 1, "wciecie borderAll", "Dotyczące powództwa związków zawodowych o zwrot funduszowi świadczeń socjalnych środków wydatkowanych niezgodnie z przepisami ustawy lub o przekazanie należnych środków na Fundusz – ustawa z 4 marca 1994 r. o zakładowym funduszu świadczeń socjalnych (Dz. U. z 2016 r. poz. 800 z późn. zm. )" });
            dT.Rows.Add(new Object[] { 46, 7, 1, 1, " center", "431" });
            dT.Rows.Add(new Object[] { 47, 1, 6, 1, "wciecie borderAll", "O uchylenie kary z tytułu odpowiedzialności porządkowej pracowników" });
            dT.Rows.Add(new Object[] { 47, 7, 1, 1, " center", "432" });
            dT.Rows.Add(new Object[] { 48, 1, 6, 1, "wciecie borderAll", "O uchylenie uchwały organu spółdzielni, w wypadku gdy treść uchwały dotyczy spółdzielczego stosunku pracy" });
            dT.Rows.Add(new Object[] { 48, 7, 1, 1, " center", "435" });
            dT.Rows.Add(new Object[] { 49, 1, 6, 1, "wciecie borderAll", "O roszczenia na tle spółdzielczej umowy o pracę" });
            dT.Rows.Add(new Object[] { 49, 7, 1, 1, " center", "439" });
            dT.Rows.Add(new Object[] { 50, 1, 6, 1, "wciecie borderAll", "O ustalenie istnienia stosunku pracy wnoszone przez inspektorów pracy" });
            dT.Rows.Add(new Object[] { 50, 7, 1, 1, " center", "440" });
            dT.Rows.Add(new Object[] { 51, 1, 6, 1, "wciecie borderAll", "O ustalenie istnienia stosunku pracy (z wyłączeniem spraw oznaczonych symbolem 440" });
            dT.Rows.Add(new Object[] { 51, 7, 1, 1, " center", "441" });
            dT.Rows.Add(new Object[] { 52, 1, 6, 1, "wciecie borderAll", "O odszkodowanie należne pracownikowi za okres obowiązywania zakazu konkurencji" });
            dT.Rows.Add(new Object[] { 52, 7, 1, 1, " center", "450" });
            dT.Rows.Add(new Object[] { 53, 1, 6, 1, "wciecie borderAll", "O odszkodowanie z tytułu wypadku przy pracy lub choroby zawodowej (nie dotyczy wypadku przy pracy w gospodarstwie rolnym)" });
            dT.Rows.Add(new Object[] { 53, 7, 1, 1, " center", "451" });
            dT.Rows.Add(new Object[] { 54, 1, 6, 1, "wciecie borderAll", "O ustalenie wypadku przy pracy lub choroby zawodowej" });
            dT.Rows.Add(new Object[] { 54, 7, 1, 1, " center", "452" });
            dT.Rows.Add(new Object[] { 55, 1, 6, 1, "wciecie borderAll", "Inne, pozostające w związku z wypadkiem lub chorobą zawodową" });
            dT.Rows.Add(new Object[] { 55, 7, 1, 1, " center", "455" });
            dT.Rows.Add(new Object[] { 56, 1, 6, 1, "wciecie borderAll", "O świadczenia dochodzone od pracodawcy na podstawie przepisów prawa cywilnego" });
            dT.Rows.Add(new Object[] { 56, 7, 1, 1, " center", "455c" });
            dT.Rows.Add(new Object[] { 57, 1, 6, 1, "wciecie borderAll", "Pozbawienie tytułu wykonawczego wykonalności (art. 840 kpc)" });
            dT.Rows.Add(new Object[] { 57, 7, 1, 1, " center", "456" });
            dT.Rows.Add(new Object[] { 58, 1, 6, 1, "wciecie borderAll", "Spory pracowników i byłych pracowników (także rolników i rybaków) o wydanie bezpłatnych akcji" });
            dT.Rows.Add(new Object[] { 58, 7, 1, 1, " center", "457" });

            dT.Rows.Add(new Object[] { 59, 1, 5, 2, "wciecie ", "O odszkodowanie z tytułu naruszenia zasad równego traktowania w zatrudnieniu dotyczy (art. 18<sup>3d</sup> kp)" });
            dT.Rows.Add(new Object[] { 59, 5, 1, 1, " center", "kobiet" });
            dT.Rows.Add(new Object[] { 59, 6, 1, 1, " center", "458dk" });
            dT.Rows.Add(new Object[] { 60, 5, 1, 1, " center", "mężczyzn" });
            dT.Rows.Add(new Object[] { 60, 6, 1, 1, " center", "458m" });

            dT.Rows.Add(new Object[] { 61, 1, 5, 2, "wciecie ", "O odszkodowanie w związku z  molestowaniem seksualnym, jako jedną z form dyskryminacji w miejscu pracy dotyczy (art.18<sup>3a</sup> § 6 kp w zw. z art. 18<sup>3d</sup> kp)" });
            dT.Rows.Add(new Object[] { 61, 5, 1, 1, " center", "kobiet" });
            dT.Rows.Add(new Object[] { 61, 6, 1, 1, " center", "459dk" });
            dT.Rows.Add(new Object[] { 62, 5, 1, 1, " center", "mężczyzn" });
            dT.Rows.Add(new Object[] { 62, 6, 1, 1, " center", "459dm" });
            dT.Rows.Add(new Object[] { 63, 1, 5, 2, "wciecie ", "O zadośćuczynienie w związku z mobbingiem dotyczy (art. 943§<sup>3</sup> kp)" });
            dT.Rows.Add(new Object[] { 63, 5, 1, 1, " center", "kobiet" });
            dT.Rows.Add(new Object[] { 63, 6, 1, 1, " center", "462dk" });
            dT.Rows.Add(new Object[] { 64, 5, 1, 1, " center", "mężczyzn" });
            dT.Rows.Add(new Object[] { 64, 6, 1, 1, " center", "462dm" });
            dT.Rows.Add(new Object[] { 65, 1, 5, 2, "wciecie ", "O odszkodowanie w związku z mobbingiem dotyczy (art. 943§<sup>4</sup> kp)" });
            dT.Rows.Add(new Object[] { 65, 5, 1, 1, " center", "kobiet" });
            dT.Rows.Add(new Object[] { 65, 6, 1, 1, " center", "463dk" });
            dT.Rows.Add(new Object[] { 66, 5, 1, 1, " center", "mężczyzn" });
            dT.Rows.Add(new Object[] { 66, 6, 1, 1, " center", "463dm" });
            dT.Rows.Add(new Object[] { 67, 1, 6, 1, "wciecie borderAll", "Dyskryminacja w zatrudnieniu (art. 11<sup>3</sup> kp)" });
            dT.Rows.Add(new Object[] { 67, 7, 1, 1, " center", "461" });

            dT.Rows.Add(new Object[] { 68, 1, 6, 1, "wciecie borderAll", "O ustalenie istnienia stosunku pracy nakładczej" });
            dT.Rows.Add(new Object[] { 68, 7, 1, 1, " center", "464" });

            dT.Rows.Add(new Object[] { 69, 1, 6, 1, "wciecie borderAll", "O ustalenie wykonywania pracy w szczególnych warunkach lub pracy o szczególnym charakterze" });
            dT.Rows.Add(new Object[] { 69, 7, 1, 1, " center", "465" });

            dT.Rows.Add(new Object[] { 70, 1, 6, 1, "wciecie borderAll", "Inne sprawy o ustalenie na podstawie art. 189 k.p.c. wynikające ze stosunku pracy" });
            dT.Rows.Add(new Object[] { 70, 7, 1, 1, " center", "465" });

            dT.Rows.Add(new Object[] { 71, 1, 6, 1, "wciecie borderAll", "O premię lub nagrodę, " });
            dT.Rows.Add(new Object[] { 71, 7, 1, 1, " center", "467" });
            dT.Rows.Add(new Object[] { 72, 1, 6, 1, "wciecie borderAll", "O odprawę pośmiertną" });
            dT.Rows.Add(new Object[] { 72, 7, 1, 1, " center", "468" });
            dT.Rows.Add(new Object[] { 73, 1, 6, 1, "wciecie borderAll", "O wydanie dokumentu związanego ze stosunkiem pracy, innego niż świadectwo pracy (np. Rp7, PIT)" });
            dT.Rows.Add(new Object[] { 73, 7, 1, 1, " center", "470" });
            dT.Rows.Add(new Object[] { 74, 1, 6, 1, "wciecie borderAll", "O dopuszczenie do pracy" });
            dT.Rows.Add(new Object[] { 74, 7, 1, 1, " center", "471" });
            dT.Rows.Add(new Object[] { 75, 1, 6, 1, "wciecie borderAll", "O diety i inne świadczenia związane z podróżą służbową" });
            dT.Rows.Add(new Object[] { 75, 7, 1, 1, " center", "472" });
            dT.Rows.Add(new Object[] { 76, 1, 6, 1, "wciecie borderAll", "O ekwiwalent za używanie własnej odzieży i obuwia roboczego oraz pranie odzieży roboczej " });
            dT.Rows.Add(new Object[] { 76, 7, 1, 1, " center", "473" });
            dT.Rows.Add(new Object[] { 77, 1, 6, 1, "wciecie borderAll", "O koszty używania przez pracownika prywatnego samochodu do celów służbowych" });
            dT.Rows.Add(new Object[] { 77, 7, 1, 1, " center", "474" });
            dT.Rows.Add(new Object[] { 78, 1, 6, 1, "wciecie borderAll", "O świadczenia z zakładowego funduszu świadczeń socjalnych" });
            dT.Rows.Add(new Object[] { 78, 7, 1, 1, " center", "475" });
            dT.Rows.Add(new Object[] { 79, 1, 6, 1, "wciecie borderAll", "O deputat węglowy (wydanie bezpłatnego węgla w naturze) lub o ekwiwalent pieniężny z tytułu prawa do bezpłatnego węgla" });
            dT.Rows.Add(new Object[] { 79, 7, 1, 1, " center", "477" });
            dT.Rows.Add(new Object[] { 80, 1, 6, 1, "wciecie borderAll", "O odprawę z tytułu nabycia prawa do świadczenia przedemerytalnego" });
            dT.Rows.Add(new Object[] { 80, 7, 1, 1, " center", "476" });
            dT.Rows.Add(new Object[] { 81, 1, 6, 1, "wciecie borderAll", "O inne, niż przewidziane wyżej, świadczenia wynikające z układów zbiorowych pracy" });
            dT.Rows.Add(new Object[] { 81, 7, 1, 1, " center", "478" });
            dT.Rows.Add(new Object[] { 82, 1, 6, 1, "wciecie borderAll", "O roszczenia związane z podnoszeniem kwalifikacji zawodowych pracowników" });
            dT.Rows.Add(new Object[] { 82, 7, 1, 1, " center", "479" });

            dT.Rows.Add(new Object[] { 83, 1, 1, 4, "wciecie borderAll", "O odszkodowanie" });
            dT.Rows.Add(new Object[] { 83, 2, 1, 2, "wciecie borderAll", "za mienie" });
            dT.Rows.Add(new Object[] { 83, 3, 4, 1, "wciecie borderAll", "nie powierzone" });
            dT.Rows.Add(new Object[] { 83, 7, 1, 1, " center", "415" });

            dT.Rows.Add(new Object[] { 84, 3, 4, 1, "wciecie borderAll", "powierzone łącznie ze sprawami z tytułu odpowiedzialności wspólnej " });
            dT.Rows.Add(new Object[] { 84, 7, 1, 1, " center", "416" });

            dT.Rows.Add(new Object[] { 85, 2, 5, 1, "wciecie borderAll", "przysługujące pracodawcy w razie nieuzasadnionego rozwiązania przez pracownika umowy o pracę bez wypowiedzenia" });
            dT.Rows.Add(new Object[] { 85, 7, 1, 1, " center", "417" });
            dT.Rows.Add(new Object[] { 86, 2, 5, 1, "wciecie borderAll", "z tytułu naruszenia przez pracownika zakazu konkurencji" });
            dT.Rows.Add(new Object[] { 86, 7, 1, 1, " center", "418" });

            dT.Rows.Add(new Object[] { 87, 1, 6, 1, "wciecie borderAll", "O świadczenia dochodzone od pracowników na podstawie przepisów prawa cywilnego" });
            dT.Rows.Add(new Object[] { 87, 7, 1, 1, " center", "414" });

            dT.Rows.Add(new Object[] { 88, 1, 6, 1, "wciecie borderAll", "O ustalenie nieistnienia stosunku pracy" });
            dT.Rows.Add(new Object[] { 88, 7, 1, 1, " center", "419" });
            dT.Rows.Add(new Object[] { 89, 1, 6, 1, "wciecie borderAll", "O ustalenie wykonywania pracy u innego pracodawcy w okresie urlopu bezpłatnego" });
            dT.Rows.Add(new Object[] { 89, 7, 1, 1, " center", "485" });
            dT.Rows.Add(new Object[] { 90, 1, 6, 1, "wciecie borderAll", "O zwrot mienia powierzonego" });
            dT.Rows.Add(new Object[] { 90, 7, 1, 1, " center", "486" });
            dT.Rows.Add(new Object[] { 91, 1, 6, 1, "wciecie borderAll", "O zwrot kosztów poniesionych przez pracodawcę w związku z podnoszeniem kwalifikacji zawodowych pracowników" });
            dT.Rows.Add(new Object[] { 91, 7, 1, 1, " center", "487" });
            dT.Rows.Add(new Object[] { 92, 1, 6, 1, "wciecie borderAll", "Inne bez symbolu i o symbolu wyżej niewymienionym" });
            dT.Rows.Add(new Object[] { 92, 7, 1, 1, " center", "-" });
            dT.Rows.Add(new Object[] { 93, 1, 6, 1, "wciecie borderAll", "Rep. Pz (zażaleniowe) " });
            dT.Rows.Add(new Object[] { 93, 7, 1, 1, " center", "-" });
            dT.Rows.Add(new Object[] { 94, 1, 6, 1, "wciecie borderAll", "Rep. Po – II instancja" });
            dT.Rows.Add(new Object[] { 94, 7, 1, 1, " center", "-" });
            dT.Rows.Add(new Object[] { 95, 1, 6, 1, "wciecie borderAll", "WSC  skarga kasacyjna" });
            dT.Rows.Add(new Object[] { 95, 7, 1, 1, " center", "-" });
            dT.Rows.Add(new Object[] { 96, 1, 6, 1, "wciecie borderAll", "WSC skarga o stwierdzenie niezgodności z prawem – II inst." });
            dT.Rows.Add(new Object[] { 96, 7, 1, 1, " center", "-" });
            dT.Rows.Add(new Object[] { 97, 1, 6, 1, "wciecie borderAll", "Skargi na postępowanie sądowe Wykaz S <sup>*)<sup>" });
            dT.Rows.Add(new Object[] { 97, 7, 1, 1, " center", "-" });

            return dT;
        }

        #endregion dzial 1.1.2.2

        #region dzial 1.1.a

        private DataTable naglowekTabeliDzialu_1_1_a()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 2, 1, "center", "SPRAWY WG REPERTORIÓW LUB WYKAZÓW  " });
            dT.Rows.Add(new Object[] { 1, 3, 1, 1, "center", "Liczba spraw" });
            return dT;
        }

        private DataTable tabelaBocznaDzialu_1_1_a()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 2, 1, "wciecie borderAll", "Przekazanych Sądowi Najwyższemu ze skargą o stwierdzenie niezgodności z prawem" });

            dT.Rows.Add(new Object[] { 2, 1, 2, 1, "wciecie borderAll", "Przesłanych z Sądu Najwyższego w okresie sprawozdawczym (w.02 =w. 03 do 07)" });

            dT.Rows.Add(new Object[] { 3, 1, 1, 5, "wciecie borderAll", "w których Sąd Najwyższy" });
            dT.Rows.Add(new Object[] { 3, 2, 1, 1, "wciecie borderAll", "odmówił przyjęcia skargi (art.424<sup>9</sup> kpc)" });
            dT.Rows.Add(new Object[] { 4, 2, 1, 1, "wciecie borderAll", "odrzucił  skargę (art.424<sup>8</sup> kpc)" });
            dT.Rows.Add(new Object[] { 5, 2, 1, 1, "wciecie borderAll", "oddalił  skargę (art.424<sup>11</sup> §1 kpc)" });
            dT.Rows.Add(new Object[] { 6, 2, 1, 1, "wciecie borderAll", "uwzględnił skargę (art.424<sup>11</sup> §2 kpc)" });
            dT.Rows.Add(new Object[] { 7, 2, 1, 1, "wciecie borderAll", "załatwił w inny sposób" });

            return dT;
        }

        #endregion dzial 1.1.a

        #region dzial 1.1.b

        private DataTable naglowekTabeliDzialu_1_1_b()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 1, "center", "Zażalenia rozpoznane w trybie art. 394<sup>2</sup>§1 kpc  w sprawach:" });
            dT.Rows.Add(new Object[] { 1, 2, 1, 1, "center col_100", "Pozostało z ubiegłego roku" });
            dT.Rows.Add(new Object[] { 1, 3, 1, 1, "center col_100", "Wpłynęło" });
            dT.Rows.Add(new Object[] { 1, 4, 1, 1, "center col_100", "Załatwiono" });
            dT.Rows.Add(new Object[] { 1, 5, 1, 1, "center col_100", "Pozostało na okres następny" });

            return dT;
        }

        private DataTable tabelaBocznaDzialu_1_1_b()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 1, "wciecie borderAll", "Razem (w. 02+03)" });

            dT.Rows.Add(new Object[] { 2, 1, 1, 1, "wciecie borderAll", "Ua" });
            dT.Rows.Add(new Object[] { 3, 1, 1, 1, "wciecie borderAll", "Uz" });
            return dT;
        }

        #endregion dzial 1.1.b

        #region dzial 1.1.c

        private DataTable naglowekTabeliDzialu_1_1_c()
        {
            return naglowekTabeliDzialu_1_1_a();
        }

        private DataTable tabelaBocznaDzialu_1_1_c()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 2, 1, "wciecie borderAll", "Przekazanych Sądowi Najwyższemu ze skargą o stwierdzenie niezgodności z prawem" });

            dT.Rows.Add(new Object[] { 2, 1, 2, 1, "wciecie borderAll", "Przesłanych z Sądu Najwyższego w okresie sprawozdawczym (w.02 =w. 03 do 07)" });

            dT.Rows.Add(new Object[] { 3, 1, 1, 7, "wciecie borderAll", "w których Sąd Najwyższy" });
            dT.Rows.Add(new Object[] { 3, 2, 1, 1, "wciecie borderAll", "odmówił przyjęcia skargi (art.424<sup>9</sup> kpc)" });
            dT.Rows.Add(new Object[] { 4, 2, 1, 1, "wciecie borderAll", "odrzucił  skargę (art.398<sup>8</sup> §3 kpc)" });
            dT.Rows.Add(new Object[] { 5, 2, 1, 1, "wciecie borderAll", "oddalił  skargę (art.398<sup>14</sup> kpc)" });
            dT.Rows.Add(new Object[] { 6, 2, 1, 1, "wciecie borderAll", "uwzględnił skargę (art.424<sup>11</sup> §2 kpc)" });
            dT.Rows.Add(new Object[] { 7, 2, 1, 1, "wciecie borderAll", "uchylił orzeczenie i przekazał sprawę sądowi I lub II instancji do ponownego rozpoznania (art.398<sup>15</sup> kpc)" });
            dT.Rows.Add(new Object[] { 8, 2, 1, 1, "wciecie borderAll", "uchylił wydane orzeczenie i odrzucił pozew (art.398<sup>19</sup> kpc)" });
            dT.Rows.Add(new Object[] { 9, 2, 1, 1, "wciecie borderAll", "załatwił w inny sposób" });

            return dT;
        }

        #endregion dzial 1.1.c

        #region dzial 1.1.d

        private DataTable naglowekTabeliDzialu_1_1_d()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 4, "center", "SPRAWY Z REPERTORIUM" });
            dT.Rows.Add(new Object[] { 1, 3, 1, 4, "center col_100", "Pozostało z ubiegłego roku" });
            dT.Rows.Add(new Object[] { 1, 4, 2, 1, "center", "Wpłynęło" });
            dT.Rows.Add(new Object[] { 1, 5, 10, 1, "center ", "Załatwiono" });
            dT.Rows.Add(new Object[] { 1, 15, 1, 4, "center col_100", "Odroczono" });
            dT.Rows.Add(new Object[] { 1, 16, 1, 4, "center col_100", "Pozostało na okres następny" });

            dT.Rows.Add(new Object[] { 2, 3, 1, 3, "center col_100", "Razem" });
            dT.Rows.Add(new Object[] { 2, 4, 1, 3, "center col_100", "w tym odwołań od decyzji uprawnionego organu" });
            dT.Rows.Add(new Object[] { 2, 5, 1, 3, "center col_100", "Razem" });
            dT.Rows.Add(new Object[] { 2, 6, 8, 1, "center col_100", "w tym sposób załatwienia odwołań" });
            dT.Rows.Add(new Object[] { 2, 14, 1, 3, "center col_100", "Inne załatwienia" });

            dT.Rows.Add(new Object[] { 3, 7, 4, 1, "center", "od decyzji uprawnionego organu" });
            dT.Rows.Add(new Object[] { 3, 11, 1, 2, "center col_100", "w związku z niewydaniem decyzji zobowiązano uprawniony organ do wydania decyzji w określonym terminie" });
            dT.Rows.Add(new Object[] { 3, 12, 1, 2, "center col_100", "uchylono" });
            dT.Rows.Add(new Object[] { 3, 13, 2, 1, "center col_100", "umorzono" });

            dT.Rows.Add(new Object[] { 4, 7, 1, 1, "center col_100", "oddalono" });
            dT.Rows.Add(new Object[] { 4, 8, 1, 1, "center col_100", "zmieniono zaskarżoną decyzję w całości lub w części" });
            dT.Rows.Add(new Object[] { 4, 9, 1, 1, "center col_100", "odrzucono" });
            dT.Rows.Add(new Object[] { 4, 10, 1, 1, "center col_100", "uchylenie decyzji, przekazanie sprawy do rozpozna - nia uprawnionemu organowi, umorzenie postępowania" });
            dT.Rows.Add(new Object[] { 4, 13, 1, 1, "center col_100", "ogółem" });
            dT.Rows.Add(new Object[] { 4, 14, 1, 1, "center col_100", "w tym w wyniku cofnięcia pozwu/wniosku/skargi" });
            return dT;
        }

        private DataTable tabelaBocznaDzialu_1_1_d()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 1, "wciecie borderAll", "Sprawy w sądzie I instancji U razem (w. 2 do 9) = dz.1.1.1.1 w. 03" });
            dT.Rows.Add(new Object[] { 2, 1, 1, 1, "wciecie borderAll", "Oddział Zakładu Ubezpieczeń Społecznych" });
            dT.Rows.Add(new Object[] { 3, 1, 1, 1, "wciecie borderAll", "Wojskowy organ emerytalny" });
            dT.Rows.Add(new Object[] { 4, 1, 1, 1, "wciecie borderAll", "Zakład Emerytalno-Rentowy MSWiA" });
            dT.Rows.Add(new Object[] { 5, 1, 1, 1, "wciecie borderAll", "Organ emerytalny Służby Więzienne" });
            dT.Rows.Add(new Object[] { 6, 1, 1, 1, "wciecie borderAll", "Zakład Ubezpieczeń Społecznych (świadczenia osób zamieszkałych za granicą)" });
            dT.Rows.Add(new Object[] { 7, 1, 1, 1, "wciecie borderAll", "Kasa Rolniczego Ubezpieczenia Społecznego" });
            dT.Rows.Add(new Object[] { 8, 1, 1, 1, "wciecie borderAll", "Narodowy Fundusz Zdrowia" });
            dT.Rows.Add(new Object[] { 9, 1, 1, 1, "wciecie borderAll", "inne" });
            dT.Rows.Add(new Object[] { 10, 1, 1, 1, "wciecie borderAll", "Z liczby razem (w. 1) sprawy wszczęte na skutek nie wydania decyzji przez organ emerytalno-rentowy we właściwym terminie („Skarga na milczenie”)" });

            return dT;
        }

        #endregion dzial 1.1.d

        #region dzial 1.1.2.1

        private DataTable naglowekTabeliDzialu_1_1_2_1()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 4, 5, "center", "SPRAWY Z REPERTORIUM" });
            //dT.Rows.Add(new Object[] { 1, 4, 1, 5, "center", "Symbol" });
            dT.Rows.Add(new Object[] { 1, 5, 1, 5, "center col_100", "Pozostało z ubiegłego roku" });
            dT.Rows.Add(new Object[] { 1, 6, 1, 5, "center", "Wpłynęło razem" });
            dT.Rows.Add(new Object[] { 1, 7, 10, 1, "center ", "Załatwiono" });
            dT.Rows.Add(new Object[] { 1, 17, 2, 2, "center col_100", "Odroczono" });
            dT.Rows.Add(new Object[] { 1, 18, 1, 5, "center col_100", "Pozostało na okres następny" });

            dT.Rows.Add(new Object[] { 2, 7, 1, 4, "center col_100", "Razem" });
            dT.Rows.Add(new Object[] { 2, 8, 9, 1, "center col_100", "z tego" });

            dT.Rows.Add(new Object[] { 3, 8, 1, 3, "center col_100", "uwzględniono w całości lub w części" });
            dT.Rows.Add(new Object[] { 3, 9, 1, 3, "center col_100", "oddalono" });
            dT.Rows.Add(new Object[] { 3, 10, 1, 3, "center col_100", "zwrócono" });
            dT.Rows.Add(new Object[] { 3, 11, 1, 3, "center col_100", "odrzucono" });
            dT.Rows.Add(new Object[] { 3, 12, 4, 1, "center col_100", "umorzono" });
            dT.Rows.Add(new Object[] { 3, 16, 1, 3, "center col_100", "Inne załatwienia" });

            dT.Rows.Add(new Object[] { 3, 17, 1, 3, "center col_100", "ogółem" });
            dT.Rows.Add(new Object[] { 3, 18, 1, 3, "center col_100", "w tym publikację orzeczenia" });

            dT.Rows.Add(new Object[] { 4, 12, 1, 2, "center col_100", "ogółem" });
            dT.Rows.Add(new Object[] { 4, 13, 3, 1, "center ", "w tym w wyniku" });

            dT.Rows.Add(new Object[] { 5, 13, 1, 1, "center col_100", "zawarcia ugody przed sądem" });
            dT.Rows.Add(new Object[] { 5, 14, 1, 1, "center col_100", "w tym w wyniku cofnięcia pozwu/wniosku/skargi" });
            dT.Rows.Add(new Object[] { 5, 15, 1, 1, "center col_100", "mediacji" });

            return dT;
        }

        private DataTable tabelaBocznaDzialu_1_1_2_1()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 3, 1, "wciecie borderAll", "OGÓŁEM  I i II instancja (wiersze 02+dz. 1.1.2.2. w. 01)" });
            dT.Rows.Add(new Object[] { 1, 4, 1, 1, " center", "-" });
            dT.Rows.Add(new Object[] { 2, 1, 3, 1, "wciecie borderAll", "Ogółem I instancja( w. 02=w. 03+69+70+84+85)" });
            dT.Rows.Add(new Object[] { 2, 4, 1, 1, " center", "-" });
            dT.Rows.Add(new Object[] { 3, 1, 3, 1, "wciecie borderAll", "rep. P – razem (wiersze 04 do 15, 18 do 68)" });
            dT.Rows.Add(new Object[] { 3, 4, 1, 1, " center", "-" });
            dT.Rows.Add(new Object[] { 4, 1, 3, 1, "wciecie borderAll", "Związane z innym sposobem ustania stosunku pracy" });
            dT.Rows.Add(new Object[] { 4, 4, 1, 1, " center", "404" });

            dT.Rows.Add(new Object[] { 5, 1, 2, 2, "wciecie borderAll", "O nawiązanie stosunku pracy i roszczenia o odszkodowanie za niezawarcie umowy przyrzeczonej dotyczy " });
            dT.Rows.Add(new Object[] { 5, 3, 1, 1, "wciecie ", "kobiet" });
            dT.Rows.Add(new Object[] { 5, 4, 1, 1, " center", "406dk" });
            dT.Rows.Add(new Object[] { 6, 3, 1, 1, "wciecie ", "mężczyzn" });
            dT.Rows.Add(new Object[] { 6, 4, 1, 1, " center", "406m" });
            dT.Rows.Add(new Object[] { 7, 1, 2, 2, "wciecie borderAll", "O wynagrodzenie za pracę (z wyjątkiem objętych symbolami 401, 402, 404, 409 i 467)  dotyczy " });
            dT.Rows.Add(new Object[] { 7, 3, 1, 1, "wciecie ", "kobiet" });
            dT.Rows.Add(new Object[] { 7, 4, 1, 1, " center", "406dk" });
            dT.Rows.Add(new Object[] { 8, 3, 1, 1, "wciecie ", "mężczyzn" });
            dT.Rows.Add(new Object[] { 8, 4, 1, 1, " center", "406m" });
            dT.Rows.Add(new Object[] { 9, 1, 3, 1, "wciecie borderAll", "O wynagrodzenie za pracę w godzinach nadliczbowych" });
            dT.Rows.Add(new Object[] { 9, 4, 1, 1, " center", "404" });

            dT.Rows.Add(new Object[] { 10, 1, 1, 5, "wciecie ", "O urlop" });
            dT.Rows.Add(new Object[] { 10, 2, 2, 1, "wciecie ", "wypoczynkowy lub ekwiwalent pieniężny za urlop" });
            dT.Rows.Add(new Object[] { 10, 4, 1, 1, " center", "410" });
            dT.Rows.Add(new Object[] { 11, 2, 1, 2, "wciecie ", "Macierzyński" });
            dT.Rows.Add(new Object[] { 11, 3, 1, 1, " center", "kobiet" });
            dT.Rows.Add(new Object[] { 11, 4, 1, 1, " center", "410macdk" });

            dT.Rows.Add(new Object[] { 12, 3, 1, 1, " center", "mężczyzn" });
            dT.Rows.Add(new Object[] { 12, 4, 1, 1, " center", "410macdm" });

            dT.Rows.Add(new Object[] { 13, 2, 1, 2, "wciecie ", "wychowawczy" });
            dT.Rows.Add(new Object[] { 13, 3, 1, 1, " center", "kobiet" });
            dT.Rows.Add(new Object[] { 13, 4, 1, 1, " center", "410wychdk" });

            dT.Rows.Add(new Object[] { 14, 3, 1, 1, " center", "mężczyzn" });
            dT.Rows.Add(new Object[] { 14, 4, 1, 1, " center", "410wychdm" });

            dT.Rows.Add(new Object[] { 15, 1, 1, 3, "wciecie ", "Związane ze szczególną ochroną pracy kobiet" });
            dT.Rows.Add(new Object[] { 15, 2, 2, 1, "wciecie ", "razem" });
            dT.Rows.Add(new Object[] { 15, 4, 1, 1, " center", "411" });
            dT.Rows.Add(new Object[] { 16, 2, 1, 2, "wciecie ", "w tym" });
            dT.Rows.Add(new Object[] { 16, 3, 1, 1, " center", "w ciąży" });
            dT.Rows.Add(new Object[] { 16, 4, 1, 1, " center", "411c" });

            dT.Rows.Add(new Object[] { 17, 3, 1, 1, " center", "karmiących dziecko piersią w okresie czasu pracy" });
            dT.Rows.Add(new Object[] { 17, 4, 1, 1, " center", "411p" });

            dT.Rows.Add(new Object[] { 18, 1, 3, 1, "wciecie borderAll", "Roszczenia dotyczące uprawnień pracowników związanych z rodzicielstwem /określone w dziale ósmym Kodeksu pracy (z wyłączeniem spraw o symbolach 401c, 410mac, 410wych, 411c i 411p)" });
            dT.Rows.Add(new Object[] { 18, 4, 1, 1, " center", "482" });
            dT.Rows.Add(new Object[] { 19, 1, 3, 1, "wciecie borderAll", "Związane ze szczególną ochroną pracy młodocianych" });
            dT.Rows.Add(new Object[] { 19, 4, 1, 1, " center", "412" });
            dT.Rows.Add(new Object[] { 20, 1, 3, 1, "wciecie borderAll", "O świadczenia z tytułu czasowej niezdolności do pracy" });
            dT.Rows.Add(new Object[] { 20, 4, 1, 1, " center", "420" });

            dT.Rows.Add(new Object[] { 21, 1, 2, 3, "wciecie borderAll", "O odprawę" });
            dT.Rows.Add(new Object[] { 21, 3, 1, 1, "wciecie borderAll", "Rentową" });
            dT.Rows.Add(new Object[] { 21, 4, 1, 1, " center", "421r" });

            dT.Rows.Add(new Object[] { 22, 3, 1, 1, "wciecie borderAll", "Emerytalną" });
            dT.Rows.Add(new Object[] { 22, 4, 1, 1, " center", "421em" });

            dT.Rows.Add(new Object[] { 23, 3, 1, 1, "wciecie borderAll", "pieniężną z tytułu rozwiązania stosunku pracy z przyczyn niedotyczących pracowników" });
            dT.Rows.Add(new Object[] { 23, 4, 1, 1, " center", "422" });

            dT.Rows.Add(new Object[] { 24, 1, 3, 1, "wciecie borderAll", "O nagrody jubileuszowe" });
            dT.Rows.Add(new Object[] { 24, 4, 1, 1, " center", "423" });
            dT.Rows.Add(new Object[] { 25, 1, 3, 1, "wciecie borderAll", "Dotyczące dochodzenia świadczeń z Funduszu Gwarantowanych Świadczeń Pracowniczych na podstawie ustawy z dnia 13 lipca 2006 r. o ochronie roszczeń pracowniczych w razie niewypłacalności pracodawcy (Dz.U. z 2018 r. poz. 1433)" });
            dT.Rows.Add(new Object[] { 25, 4, 1, 1, " center", "430" });

            dT.Rows.Add(new Object[] { 26, 1, 3, 1, "wciecie borderAll", "Dotyczące powództwa związków zawodowych o zwrot funduszowi świadczeń socjalnych środków wydatkowanych niezgodnie z przepisami ustawy lub o przekazanie należnych środków na fundusz – ustawa z 4 marca 1994 r. o zakładowym funduszu świadczeń socjalnych (Dz.U. z 2017 r. poz. 2191 ze zm.)" });
            dT.Rows.Add(new Object[] { 26, 4, 1, 1, " center", "431" });
            dT.Rows.Add(new Object[] { 27, 1, 3, 1, "wciecie borderAll", "O uchylenie uchwały organu spółdzielni, w wypadku gdy treść uchwały dotyczy spółdzielczego stosunku pracy" });
            dT.Rows.Add(new Object[] { 27, 4, 1, 1, " center", "435" });
            dT.Rows.Add(new Object[] { 28, 1, 3, 1, "wciecie borderAll", "O roszczenia na tle spółdzielczej umowy o pracę" });
            dT.Rows.Add(new Object[] { 28, 4, 1, 1, " center", "439" });

            dT.Rows.Add(new Object[] { 29, 1, 3, 1, "wciecie borderAll", "O odszkodowanie należne pracownikowi za okres obowiązywania zakazu konkurencji" });
            dT.Rows.Add(new Object[] { 29, 4, 1, 1, " center", "450" });
            dT.Rows.Add(new Object[] { 30, 1, 3, 1, "wciecie borderAll", "O odszkodowanie z tytułu wypadku przy pracy lub choroby zawodowej (nie dotyczy wypadku przy pracy w gospodarstwie rolnym)" });
            dT.Rows.Add(new Object[] { 30, 4, 1, 1, " center", "451" });
            dT.Rows.Add(new Object[] { 31, 1, 3, 1, "wciecie borderAll", "O ustalenie wypadku przy pracy lub choroby zawodowej" });
            dT.Rows.Add(new Object[] { 31, 4, 1, 1, " center", "452" });
            dT.Rows.Add(new Object[] { 32, 1, 3, 1, "wciecie borderAll", "Inne, pozostające w związku z wypadkiem lub chorobą zawodową" });
            dT.Rows.Add(new Object[] { 32, 4, 1, 1, " center", "455" });
            dT.Rows.Add(new Object[] { 33, 1, 3, 1, "wciecie borderAll", "O świadczenia dochodzone od pracodawcy na podstawie przepisów prawa cywilnego" });
            dT.Rows.Add(new Object[] { 33, 4, 1, 1, " center", "455c" });
            dT.Rows.Add(new Object[] { 34, 1, 3, 1, "wciecie borderAll", "Pozbawienie tytułu wykonawczego wykonalności (art. 840 kpc)" });
            dT.Rows.Add(new Object[] { 34, 4, 1, 1, " center", "456" });
            dT.Rows.Add(new Object[] { 35, 1, 3, 1, "wciecie borderAll", "Spory pracowników i byłych pracowników (także rolników i rybaków) o wydanie bezpłatnych akcji" });
            dT.Rows.Add(new Object[] { 35, 4, 1, 1, " center", "457" });

            dT.Rows.Add(new Object[] { 36, 1, 2, 2, "wciecie borderAll", "O odszkodowanie z tytułu naruszenia zasady równego traktowania w zatrudnieniu dotyczy (art. 183<sup>d</sup> kp)" });
            dT.Rows.Add(new Object[] { 36, 3, 1, 1, "wciecie borderAll", "kobiet" });
            dT.Rows.Add(new Object[] { 36, 4, 1, 1, " center", "458dk" });
            dT.Rows.Add(new Object[] { 37, 1, 2, 1, "wciecie borderAll", "mężczyzn" });
            dT.Rows.Add(new Object[] { 37, 4, 1, 1, " center", "458m" });

            dT.Rows.Add(new Object[] { 38, 1, 2, 2, "wciecie borderAll", "O odszkodowanie w związku z  molestowaniem seksualnym, jako jedną z form dyskryminacji w miejscu pracy (art.183<sup>a</sup>§ 6 kp w zw. z art. 183<sup>d</sup> kp)" });
            dT.Rows.Add(new Object[] { 38, 3, 1, 1, "wciecie borderAll", "kobiet" });
            dT.Rows.Add(new Object[] { 38, 4, 1, 1, " center", "459dk" });
            dT.Rows.Add(new Object[] { 39, 1, 2, 1, "wciecie borderAll", "mężczyzn" });
            dT.Rows.Add(new Object[] { 39, 4, 1, 1, " center", "459dm" });

            dT.Rows.Add(new Object[] { 40, 1, 2, 2, "wciecie borderAll", "O zadośćuczynienie w związku z mobbingiem (art. 94<sup>3</sup>§3 kp) " });
            dT.Rows.Add(new Object[] { 40, 1, 3, 1, "wciecie borderAll", "kobiet" });
            dT.Rows.Add(new Object[] { 40, 4, 1, 1, " center", "462dk" });
            dT.Rows.Add(new Object[] { 41, 1, 2, 1, "wciecie borderAll", "mężczyzn" });
            dT.Rows.Add(new Object[] { 41, 4, 1, 1, " center", "462dm" });

            dT.Rows.Add(new Object[] { 42, 1, 2, 2, "wciecie borderAll", "O odszkodowanie  w związku z mobbingiem (art. 94<sup>3</sup>§3 kp) " });
            dT.Rows.Add(new Object[] { 42, 1, 3, 1, "wciecie borderAll", "kobiet" });
            dT.Rows.Add(new Object[] { 42, 4, 1, 1, " center", "463dk" });
            dT.Rows.Add(new Object[] { 43, 1, 2, 1, "wciecie borderAll", "mężczyzn" });
            dT.Rows.Add(new Object[] { 43, 4, 1, 1, " center", "463dm" });

            dT.Rows.Add(new Object[] { 44, 1, 3, 1, "wciecie borderAll", "Dyskryminacja w zatrudnieniu (art. 113 kp)" });
            dT.Rows.Add(new Object[] { 44, 4, 1, 1, " center", "461" });

            dT.Rows.Add(new Object[] { 45, 1, 3, 1, "wciecie borderAll", "O roszczenia niemajątkowe wynikające z naruszenia dóbr osobistych pracownika" });
            dT.Rows.Add(new Object[] { 45, 4, 1, 1, " center", "480" });
            dT.Rows.Add(new Object[] { 46, 1, 3, 1, "wciecie borderAll", "O ustalenie wykonywania pracy w szczególnych warunkach lub pracy o szczególnym charakterze" });
            dT.Rows.Add(new Object[] { 46, 4, 1, 1, " center", "485" });
            dT.Rows.Add(new Object[] { 47, 1, 3, 1, "wciecie borderAll", "Inne sprawy o ustalenie na podstawie art. 189 kpc wynikające ze stosunku pracy" });
            dT.Rows.Add(new Object[] { 47, 4, 1, 1, " center", "466" });
            dT.Rows.Add(new Object[] { 48, 1, 3, 1, "wciecie borderAll", "O odprawę pośmiertną" });
            dT.Rows.Add(new Object[] { 48, 4, 1, 1, " center", "468" });
            dT.Rows.Add(new Object[] { 49, 1, 3, 1, "wciecie borderAll", "O premię lub nagrodę" });
            dT.Rows.Add(new Object[] { 49, 4, 1, 1, " center", "439" });
            dT.Rows.Add(new Object[] { 50, 1, 3, 1, "wciecie borderAll", "O wydanie dokumentu związanego ze stosunkiem pracy, innego niż świadectwo pracy (np. Rp7, PIT)" });
            dT.Rows.Add(new Object[] { 50, 4, 1, 1, " center", "470" });
            dT.Rows.Add(new Object[] { 51, 1, 3, 1, "wciecie borderAll", "O diety i inne świadczenia związane z podróżą służbową, " });
            dT.Rows.Add(new Object[] { 51, 4, 1, 1, " center", "472" });
            dT.Rows.Add(new Object[] { 52, 1, 3, 1, "wciecie borderAll", "O ekwiwalent za używanie własnej odzieży i obuwia roboczego oraz pranie odzieży roboczej" });
            dT.Rows.Add(new Object[] { 52, 4, 1, 1, " center", "473" });
            dT.Rows.Add(new Object[] { 53, 1, 3, 1, "wciecie borderAll", "O świadczenia z zakładowego funduszu świadczeń socjalnych" });
            dT.Rows.Add(new Object[] { 53, 4, 1, 1, " center", "475" });
            dT.Rows.Add(new Object[] { 54, 1, 3, 1, "wciecie borderAll", "O jednorazową odprawę warunkową z tytułu nabycia prawa do świadczenia przedemerytalnego" });
            dT.Rows.Add(new Object[] { 54, 4, 1, 1, " center", "476" });
            dT.Rows.Add(new Object[] { 55, 1, 3, 1, "wciecie borderAll", "O deputat węglowy (wydanie bezpłatnego węgla w naturze) lub o ekwiwalent pieniężny z tytułu prawa do bezpłatnego węgla" });
            dT.Rows.Add(new Object[] { 55, 4, 1, 1, " center", "477" });
            dT.Rows.Add(new Object[] { 56, 1, 3, 1, "wciecie borderAll", "O koszty używania przez pracownika prywatnego samochodu do celów służbowych" });
            dT.Rows.Add(new Object[] { 56, 4, 1, 1, " center", "474" });
            dT.Rows.Add(new Object[] { 57, 1, 3, 1, "wciecie borderAll", "O inne, niż przewidziane wyżej, świadczenia wynikające z układów zbiorowych pracy lub porozumień zbiorowych (pakietów socjalnych)" });
            dT.Rows.Add(new Object[] { 57, 4, 1, 1, " center", "478" });
            dT.Rows.Add(new Object[] { 58, 1, 3, 1, "wciecie borderAll", "O roszczenia związane z podnoszeniem kwalifikacji zawodowych pracowników" });
            dT.Rows.Add(new Object[] { 58, 4, 1, 1, " center", "479" });
            dT.Rows.Add(new Object[] { 59, 1, 1, 4, "wciecie borderAll", "O odszkodowanie" });
            dT.Rows.Add(new Object[] { 59, 2, 1, 2, "wciecie borderAll", "za mienie" });
            dT.Rows.Add(new Object[] { 59, 3, 1, 1, "wciecie borderAll", "nie powierzone" });
            dT.Rows.Add(new Object[] { 59, 4, 1, 1, " center", "415" });
            dT.Rows.Add(new Object[] { 60, 3, 1, 1, "wciecie borderAll", "powierzone łącznie ze sprawami z tytułu odpowiedzialności wspólnej " });
            dT.Rows.Add(new Object[] { 60, 4, 1, 1, " center", "416" });
            dT.Rows.Add(new Object[] { 61, 2, 2, 1, "wciecie borderAll", "przysługujące pracodawcy w razie nieuzasadnionego rozwiązania przez pracownika umowy o pracę bez wypowiedzenia" });
            dT.Rows.Add(new Object[] { 61, 4, 1, 1, " center", "417" });
            dT.Rows.Add(new Object[] { 62, 2, 2, 1, "wciecie borderAll", "z tytułu naruszenia przez pracownika zakazu konkurencji" });
            dT.Rows.Add(new Object[] { 62, 4, 1, 1, " center", "417" });

            dT.Rows.Add(new Object[] { 63, 1, 3, 1, "wciecie borderAll", "O świadczenia dochodzone od pracowników na podstawie przepisów prawa cywilnego" });
            dT.Rows.Add(new Object[] { 63, 4, 1, 1, " center", "414" });
            dT.Rows.Add(new Object[] { 64, 1, 3, 1, "wciecie borderAll", "O ustalenie wykonywania pracy u innego pracodawcy w okresie urlopu bezpłatnego" });
            dT.Rows.Add(new Object[] { 64, 4, 1, 1, " center", "485" });
            dT.Rows.Add(new Object[] { 65, 1, 3, 1, "wciecie borderAll", "O zwrot mienia powierzonego" });
            dT.Rows.Add(new Object[] { 65, 4, 1, 1, " center", "486" });
            dT.Rows.Add(new Object[] { 66, 1, 3, 1, "wciecie borderAll", "O zwrot kosztów poniesionych przez pracodawcę w związku z podnoszeniem kwalifikacji zawodowych pracowników" });
            dT.Rows.Add(new Object[] { 66, 4, 1, 1, " center", "487" });
            dT.Rows.Add(new Object[] { 67, 1, 3, 1, "wciecie borderAll", "O roszczenia niemajątkowe wynikające z naruszenia dóbr osobistych pracodawcy" });
            dT.Rows.Add(new Object[] { 67, 4, 1, 1, " center", "488" });
            dT.Rows.Add(new Object[] { 68, 1, 3, 1, "wciecie borderAll", "Inne bez symbolu i o symbolu wyżej niewymienionym" });
            dT.Rows.Add(new Object[] { 68, 4, 1, 1, " center", "-" });
            dT.Rows.Add(new Object[] { 69, 1, 3, 1, "wciecie borderAll", "Rep. Np (nakazowe, upominawcze i europejskie postępowanie nakazowe)" });
            dT.Rows.Add(new Object[] { 69, 4, 1, 1, " center", "-" });
            dT.Rows.Add(new Object[] { 70, 1, 3, 1, "wciecie borderAll", "Rep. Po -  (wiersz  71 do 83)" });
            dT.Rows.Add(new Object[] { 70, 4, 1, 1, " center", "-" });

            dT.Rows.Add(new Object[] { 71, 1, 3, 1, "wciecie borderAll", "O nadanie klauzuli wykonalności" });
            dT.Rows.Add(new Object[] { 71, 4, 1, 1, " center", "104" });
            dT.Rows.Add(new Object[] { 72, 1, 3, 1, "wciecie borderAll", "O zwolnienie od kosztów sądowych i/lub ustanowienie radcy prawnego, adwokata" });
            dT.Rows.Add(new Object[] { 72, 4, 1, 1, " center", "105" });
            dT.Rows.Add(new Object[] { 73, 1, 3, 1, "wciecie borderAll", "Uznanie orzeczenia sądu zagranicznego" });
            dT.Rows.Add(new Object[] { 73, 4, 1, 1, " center", "107" });
            dT.Rows.Add(new Object[] { 74, 1, 3, 1, "wciecie borderAll", "O wyznaczenie sądu" });
            dT.Rows.Add(new Object[] { 74, 4, 1, 1, " center", "108" });
            dT.Rows.Add(new Object[] { 75, 1, 3, 1, "wciecie borderAll", "O wyłączenie sędziego" });
            dT.Rows.Add(new Object[] { 75, 4, 1, 1, " center", "109" });
            dT.Rows.Add(new Object[] { 76, 1, 3, 1, "wciecie borderAll", "O odtworzenie akt " });
            dT.Rows.Add(new Object[] { 76, 4, 1, 1, " center", "111" });
            dT.Rows.Add(new Object[] { 77, 1, 3, 1, "wciecie borderAll", "O uznanie i stwierdzenie wykonalności wyroku sądu polubownego wydanego za granicą " });
            dT.Rows.Add(new Object[] { 77, 4, 1, 1, " center", "113" });
            dT.Rows.Add(new Object[] { 78, 1, 3, 1, "wciecie borderAll", "Dotyczące pomocy sądowej" });
            dT.Rows.Add(new Object[] { 78, 4, 1, 1, " center", "135" });
            dT.Rows.Add(new Object[] { 79, 1, 3, 1, "wciecie borderAll", "O zabezpieczenie roszczenia przed wszczęciem postępowania" });
            dT.Rows.Add(new Object[] { 79, 4, 1, 1, " center", "136" });
            dT.Rows.Add(new Object[] { 80, 1, 3, 1, "wciecie borderAll", "O zabezpieczenie dowodu przed wszczęciem postępowania" });
            dT.Rows.Add(new Object[] { 80, 4, 1, 1, " center", "138a" });
            dT.Rows.Add(new Object[] { 81, 1, 3, 1, "wciecie borderAll", "W sprawie odmowy rejestracji ponadzakładowego układu zbiorowego pracy " });
            dT.Rows.Add(new Object[] { 81, 4, 1, 1, " center", "114a" });
            dT.Rows.Add(new Object[] { 82, 1, 3, 1, "wciecie borderAll", "Inne bez symbolu i o symbolu wyżej niewymienionym" });
            dT.Rows.Add(new Object[] { 82, 4, 1, 1, " center", "-" });
            dT.Rows.Add(new Object[] { 83, 1, 3, 1, "wciecie borderAll", "Wykaz Kas-z wnioski o rozstrzygnięcie sporu zakładowego przez kolegium arbitrażu społecznego" });
            dT.Rows.Add(new Object[] { 83, 4, 1, 1, " center", "-" });
            dT.Rows.Add(new Object[] { 84, 1, 3, 1, "wciecie borderAll", "WSC skarga o stwierdzenie niezgodności z prawem – I inst." });
            dT.Rows.Add(new Object[] { 84, 4, 1, 1, " center", "-" });

            return dT;
        }

        #endregion dzial 1.1.2.1

        #region dzial 1.1.3.c

        private DataTable naglowekTabeliDzialu_1_1_3_c()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 2, 2, "center", "Wyszczególnienie" });
            dT.Rows.Add(new Object[] { 1, 3, 2, 1, "center ", "Liczby spraw" });
            dT.Rows.Add(new Object[] { 2, 3, 1, 1, "center col_100", "P" });
            dT.Rows.Add(new Object[] { 2, 4, 1, 1, "center col_100", "Np" });
            return dT;
        }

        private DataTable tabelaBocznaDzialu_1_1_3_c()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 3, "wciecie borderAll", "Wydano nakaz zapłaty" });
            dT.Rows.Add(new Object[] { 1, 2, 1, 1, "wciecie", "w postępowaniu nakazowym" });
            dT.Rows.Add(new Object[] { 2, 2, 1, 1, "wciecie", "w postępowaniu upominawczym" });
            dT.Rows.Add(new Object[] { 3, 2, 1, 1, "wciecie", "w europejskim postępowaniu nakazowym" });

            return dT;
        }

        #endregion dzial 1.1.3.c

        #region dzial 1.1.3.d

        private DataTable naglowekTabeliDzialu_1_1_3_d()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 2, 1, "center", "Liczba spraw:" });
            dT.Rows.Add(new Object[] { 1, 3, 1, 1, "center ", "Liczby spraw" });

            return dT;
        }

        private DataTable tabelaBocznaDzialu_1_1_3_d()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 2, 1, "wciecie borderAll", "Przekazanych Sądowi Najwyższemu ze skargą o stwierdzenie niezgodności z prawem" });
            dT.Rows.Add(new Object[] { 2, 1, 2, 1, "wciecie borderAll", "Przesłanych z Sądu Najwyższego w okresie sprawozdawczym (w.02 =w. 03 do 07)" });
            dT.Rows.Add(new Object[] { 3, 1, 1, 5, "wciecie borderAll", "w którychSąd Najwyższy" });
            dT.Rows.Add(new Object[] { 3, 2, 1, 1, "wciecie", "odmówił przyjęcia skargi (art.424<sup>9</sup> kpc)" });
            dT.Rows.Add(new Object[] { 4, 2, 1, 1, "wciecie", "odrzucił skargę (art.424<sup>8</sup> kpc) " });
            dT.Rows.Add(new Object[] { 5, 2, 1, 1, "wciecie", "oddalił skargę  (art.424<sup>11</sup> §1 kpc)" });
            dT.Rows.Add(new Object[] { 6, 2, 1, 1, "wciecie", "uwzględnił skargę   (art.424<sup>11</sup> §2 kpc)" });
            dT.Rows.Add(new Object[] { 7, 2, 1, 1, "wciecie", "załatwił w inny sposób" });

            return dT;
        }

        #endregion dzial 1.1.3.d

        #region dzial 1.1.3.e

        private DataTable naglowekTabeliDzialu_1_1_3_e()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 1, "center", "Zażalenia rozpoznane w trybie art. 3942§1 kpc  w sprawach:" });
            dT.Rows.Add(new Object[] { 1, 2, 1, 1, "center col_120", "Pozostało z ubiegłego roku" });
            dT.Rows.Add(new Object[] { 1, 3, 1, 1, "center col_120", "Wpłynęło" });
            dT.Rows.Add(new Object[] { 1, 4, 1, 1, "center col_120", "Załatwiono" });
            dT.Rows.Add(new Object[] { 1, 5, 1, 1, "center col_120", "Pozostało na okres następny" });

            return dT;
        }

        private DataTable tabelaBocznaDzialu_1_1_3_e()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 1, "wciecie borderAll", "Razem (w. 02+03)" });
            dT.Rows.Add(new Object[] { 2, 1, 1, 1, "wciecie borderAll", "Pa" });
            dT.Rows.Add(new Object[] { 3, 1, 1, 1, "wciecie borderAll", "Pz" });

            return dT;
        }

        #endregion dzial 1.1.3.e

        #region dzial 1.1.3.f

        private DataTable naglowekTabeliDzialu_1_1_3_f()
        {
            return naglowekTabeliDzialu_1_1_3_d();
        }

        private DataTable tabelaBocznaDzialu_1_1_3_f()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 2, 1, "wciecie borderAll", "Przekazanych Sądowi Najwyższemu ze skargą kasacyjną w okresie sprawozdawczym" });
            dT.Rows.Add(new Object[] { 2, 1, 2, 1, "wciecie borderAll", "Przesłanych z Sądu Najwyższego w okresie sprawozdawczym (w. 02 = w. 03 do 09)" });
            dT.Rows.Add(new Object[] { 3, 1, 1, 7, "wciecie borderAll", "w którychSąd Najwyższy" });
            dT.Rows.Add(new Object[] { 3, 2, 1, 1, "wciecie", "odmówił skargę" });
            dT.Rows.Add(new Object[] { 4, 2, 1, 1, "wciecie", "odmówił przyjęcia skargi do rozpoznania (art. 398<sup>9</sup> kpc) " });
            dT.Rows.Add(new Object[] { 5, 2, 1, 1, "wciecie", "oddalił skargę  (art.389<sup>14</sup>  kpc)" });
            dT.Rows.Add(new Object[] { 6, 2, 1, 1, "wciecie", "uwzględnił skargę poprzez zmianę orzeczenia (art.398<sup>16</sup> kpc)" });
            dT.Rows.Add(new Object[] { 7, 2, 1, 1, "wciecie", "uchylił orzeczenie i przekazał sprawę sądowi I lub II instancji do ponownego rozpoznania (art.398<sup>15</sup> kpc)" });
            dT.Rows.Add(new Object[] { 8, 2, 1, 1, "wciecie", "uchylił wydane orzeczenie i odrzucił pozew (art.398<sup>19</sup> kpc)" });
            dT.Rows.Add(new Object[] { 9, 2, 1, 1, "wciecie", "załatwił w inny sposób" });

            return dT;
        }

        #endregion dzial 1.1.3.f

        #region dzial 1.1.3.g

        private DataTable naglowekTabeliDzialu_1_1_3_g()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 4, 2, "center", "Sądowe" });
            dT.Rows.Add(new Object[] { 1, 2, 3, 1, "center col_120", "Sprawy" });

            dT.Rows.Add(new Object[] { 2, 3, 1, 1, "center col_120", "razem" });
            dT.Rows.Add(new Object[] { 2, 4, 1, 1, "center col_120", "w I instancji" });
            dT.Rows.Add(new Object[] { 2, 5, 1, 1, "center col_120", "w II instancji" });

            return dT;
        }

        private DataTable tabelaBocznaDzialu_1_1_3_g()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 5, "wciecie borderAll", "Wpływ" });
            dT.Rows.Add(new Object[] { 1, 2, 1, 5, "wciecie borderAll", "Liczba" });
            dT.Rows.Add(new Object[] { 1, 3, 1, 3, "wciecie borderAll", "spraw w których" });
            dT.Rows.Add(new Object[] { 1, 4, 1, 1, "wciecie borderAll", "przeprowadzono spotkanie informacyjne (art. 183 <sup>8</sup> § 4 kpc)" });
            dT.Rows.Add(new Object[] { 2, 4, 1, 1, "wciecie borderAll", "strony skierowano do mediacji po udziale w spotkaniu informacyjnym" });
            dT.Rows.Add(new Object[] { 3, 4, 1, 1, "wciecie borderAll", "strony skierowano do mediacji na podstawie postanowienia sądu (art. 18<sup>3<sup> 8 § 1 kpc)" });
            dT.Rows.Add(new Object[] { 4, 3, 2, 1, "wciecie borderAll", "mediacji ogółem (w jednej sprawie może być więcej niż jedna mediacja)" });
            dT.Rows.Add(new Object[] { 5, 3, 2, 1, "wciecie borderAll", "protokołów złożonych przez mediatorów po podjęciu mediacji przez strony (art. 183 <sup>13<sup> § 2 kpc)" });

            dT.Rows.Add(new Object[] { 6, 1, 1, 8, "wciecie borderAll", "Rozstrzygnięcie przed" });
            dT.Rows.Add(new Object[] { 6, 2, 1, 3, "wciecie borderAll", "mediatorem" });
            dT.Rows.Add(new Object[] { 6, 3, 1, 3, "wciecie borderAll", "w sprawach skierowanych w trybie (art. 183<sub> 8</sub> § 1 kpc) -  liczba   " });
            dT.Rows.Add(new Object[] { 6, 4, 1, 1, "wciecie borderAll", "ugód zawartych przed mediatorem" });
            dT.Rows.Add(new Object[] { 7, 4, 1, 1, "wciecie borderAll", "spraw, w których nie zawarto ugody przed mediatorem" });
            dT.Rows.Add(new Object[] { 8, 4, 1, 1, "wciecie borderAll", "spraw, w których postępowanie mediacyjne  przed mediatorem zakończyło się w inny sposób niż wykazany w w . 06 i 07" });
            dT.Rows.Add(new Object[] { 9, 2, 1, 3, "wciecie borderAll", "sądem" });
            dT.Rows.Add(new Object[] { 9, 3, 2, 1, "wciecie borderAll", "zatwierdzono ugodę (liczba spraw w których sąd zatwierdził ugodę lecz nie umorzył postępowania)" });
            dT.Rows.Add(new Object[] { 10, 3, 2, 1, "wciecie borderAll", "w tym nadano klauzulę wykonalności w trybie art. 183<sup>14</sup>§2 kpc" });
            dT.Rows.Add(new Object[] { 11, 3, 2, 1, "wciecie borderAll", "zatwierdzono ugodę i umorzono postępowanie (art. 183 <sup>14</sup> § 1 i 2 kpc)" });
            dT.Rows.Add(new Object[] { 12, 3, 3, 1, "wciecie borderAll", "    w tym nadano klauzulę wykonalności w trybie art. 183<sup>14</sup>§2 kpc " });
            dT.Rows.Add(new Object[] { 13, 3, 3, 1, "wciecie borderAll", "odmówiono  zatwierdzenia ugody w trybie (art. 183<sup>14</sup> § 3 kpc)" });
            dT.Rows.Add(new Object[] { 14, 1, 2, 2, "wciecie borderAll", "wpływ" });
            dT.Rows.Add(new Object[] { 14, 3, 2, 1, "wciecie borderAll", "liczba wniosków o zatwierdzenie ugody złożonych przez stronę" });
            dT.Rows.Add(new Object[] { 15, 3, 2, 1, "wciecie borderAll", "liczba protokołów złożonych przez mediatorów po podjęciu mediacji przez strony, zawierających ugody (art. 183 <sup>13</sup> § 1 kpc)" });
            dT.Rows.Add(new Object[] { 16, 1, 2, 3, "wciecie borderAll", "Rozstrzygnięcie" });
            dT.Rows.Add(new Object[] { 16, 3, 2, 1, "wciecie borderAll", "zatwierdzono ugodę" });
            dT.Rows.Add(new Object[] { 17, 3, 2, 1, "wciecie borderAll", "nadano klauzulę wykonalności (art. 183 <sup>14</sup> § 2 kpc)" });
            dT.Rows.Add(new Object[] { 18, 3, 2, 1, "wciecie borderAll", "odmówiono  zatwierdzenia ugody w trybie (art. 183<sup>13</sup> § 3 kpc)" });

            return dT;
        }

        #endregion dzial 1.1.3.g

        #region dzial 1.1.3.h

        private DataTable naglowekTabeliDzialu_1_1_3_h()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 3, "center", "Wyszczególnienie" });
            dT.Rows.Add(new Object[] { 1, 2, 1, 3, "center ", "Liczba zakończonych spraw  (rubr. 2+4)" });
            dT.Rows.Add(new Object[] { 1, 3, 4, 1, "center ", "W tym liczba zakończonych spraw  w składzie" });

            dT.Rows.Add(new Object[] { 2, 3, 2, 1, "center ", "3 sędziów" });
            dT.Rows.Add(new Object[] { 2, 5, 2, 1, "center ", "1 sędzia" });

            dT.Rows.Add(new Object[] { 3, 3, 1, 1, "center col_120", "Ogółem" });
            dT.Rows.Add(new Object[] { 3, 4, 1, 1, "center col_120", "w tym załatwionych przez sędziów SO" });
            dT.Rows.Add(new Object[] { 3, 5, 1, 1, "center col_120", "Ogółem" });
            dT.Rows.Add(new Object[] { 3, 6, 1, 1, "center col_120", "w tym załatwionych przez sędziów SO" });

            return dT;
        }

        private DataTable tabelaBocznaDzialu_1_1_3_h()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 1, "wciecie borderAll", "Rep. Pa" });

            return dT;
        }

        #endregion dzial 1.1.3.h

        #region dzial 1.1.3.j

        private DataTable naglowekTabeliDzialu_1_1_3_j()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 2, 1, "center", "Wyszczególnienie" });
            dT.Rows.Add(new Object[] { 1, 3, 1, 1, "center col_120", "Lizba spraw" });

            return dT;
        }

        private DataTable tabelaBocznaDzialu_1_1_3_j()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 2, 1, "wciecie borderAll", "Wpłynęło " });
            dT.Rows.Add(new Object[] { 2, 1, 2, 1, "wciecie borderAll", "Załatwiono " });
            dT.Rows.Add(new Object[] { 3, 1, 1, 2, "wciecie borderAll", "w tym" });
            dT.Rows.Add(new Object[] { 3, 2, 1, 1, "wciecie borderAll", "uwzględniono w całości lub w części" });
            dT.Rows.Add(new Object[] { 4, 2, 1, 1, "wciecie borderAll", "oddalono" });
            dT.Rows.Add(new Object[] { 5, 1, 2, 1, "wciecie borderAll", "Pozostało " });

            return dT;
        }

        #endregion dzial 1.1.3.j

        #region dzial 1.1.4

        private DataTable naglowekTabeliDzialu_1_1_4()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 1, "center", "Repertorium lub wykaz" });
            dT.Rows.Add(new Object[] { 1, 3, 1, 1, "center col_120", "Liczba spraw w których doszło do ustanowienia pełnomocnika z urzędu (radca prawny, adwokat)" });
            dT.Rows.Add(new Object[] { 1, 4, 1, 1, "center col_120", "Liczba ustanowionych pełnomocników z urzędu (radca prawny, adwokat)" });
            dT.Rows.Add(new Object[] { 1, 5, 1, 1, "center col_120", "W tym liczba wyznaczonych pełnomocników w wyniku zwolnienia poprzedniego " });
            return dT;
        }

        private DataTable tabelaBocznaDzialu_1_1_4()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 1, "wciecie borderAll", "U " });
            dT.Rows.Add(new Object[] { 2, 1, 1, 1, "wciecie borderAll", "Ua " });
            dT.Rows.Add(new Object[] { 3, 1, 1, 1, "wciecie borderAll", "P" });
            dT.Rows.Add(new Object[] { 4, 1, 1, 1, "wciecie borderAll", "Pa" });

            return dT;
        }

        #endregion dzial 1.1.4

        #region dzial 1.1.5.a

        private DataTable naglowekTabeliDzialu_1_1_5_a()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 3, 3, "center", "Wyszczególnienie" });
            dT.Rows.Add(new Object[] { 1, 4, 1, 3, "center col_120", "Ogółem (kol. .2 + 9)" });
            dT.Rows.Add(new Object[] { 1, 7, 7, 1, "center ", "Sprawy ubezpieczeniowe" });
            dT.Rows.Add(new Object[] { 1, 11, 8, 1, "center ", "Sprawy pracownicze" });

            dT.Rows.Add(new Object[] { 2, 4, 1, 2, "center col_120", "ogółem I i II instancja" });
            dT.Rows.Add(new Object[] { 2, 5, 1, 2, "center col_120", "ogółem I instancja" });
            dT.Rows.Add(new Object[] { 2, 6, 2, 1, "center ", "w tym" });
            dT.Rows.Add(new Object[] { 2, 8, 1, 2, "center col_120", "ogółem II instancja" });
            dT.Rows.Add(new Object[] { 2, 9, 2, 1, "center ", "w tym" });
            dT.Rows.Add(new Object[] { 2, 11, 1, 2, "center col_120", "ogółem I instancja" });
            dT.Rows.Add(new Object[] { 2, 12, 1, 2, "center col_120", "ogółem II instancja" });
            dT.Rows.Add(new Object[] { 2, 13, 3, 1, "center ", "w tym" });
            dT.Rows.Add(new Object[] { 2, 16, 1, 2, "center col_120", "ogółem II instancja" });
            dT.Rows.Add(new Object[] { 2, 17, 2, 1, "center ", "w tym" });

            dT.Rows.Add(new Object[] { 3, 6, 1, 1, "center col_120", "U" });
            dT.Rows.Add(new Object[] { 3, 7, 1, 1, "center col_120", "Uo" });

            dT.Rows.Add(new Object[] { 3, 9, 1, 1, "center col_120", "Ua" });
            dT.Rows.Add(new Object[] { 3, 10, 1, 1, "center col_120", "Uz" });

            dT.Rows.Add(new Object[] { 3, 13, 1, 1, "center col_120", "P" });
            dT.Rows.Add(new Object[] { 3, 14, 1, 1, "center col_120", "Np" });
            dT.Rows.Add(new Object[] { 3, 15, 1, 1, "center col_120", "Po" });

            dT.Rows.Add(new Object[] { 3, 17, 1, 1, "center col_120", "P" });
            dT.Rows.Add(new Object[] { 3, 18, 1, 1, "center col_120", "Pz" });

            return dT;
        }

        private DataTable tabelaBocznaDzialu_1_1_5_a()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 3, 1, "wciecie borderAll", "Pozostało z ubiegłego roku (w.01 = dz.1.1.1.1. kol.1 i dz. 1.1.2.1. kol.1 odpowiednie wiersze) " });
            dT.Rows.Add(new Object[] { 2, 1, 3, 1, "wciecie borderAll", "Wpłynęło ogółem (w.02 = dz.1.1.1.1 kol. 2 i dz. 1.1.2.1. kol. 2 odpowiednie wiersze = w.03+29)" });
            dT.Rows.Add(new Object[] { 3, 1, 1, 26, "wciecie borderAll", "W tym ponownie wpisane" });
            dT.Rows.Add(new Object[] { 3, 2, 2, 1, "wciecie borderAll", "razem (w.03 = w. od 04 do 14 i od 16 do 28)" });
            dT.Rows.Add(new Object[] { 4, 2, 2, 1, "wciecie borderAll", "zwrot pozwu/odwołania/ wniosku" });
            dT.Rows.Add(new Object[] { 5, 2, 2, 1, "wciecie borderAll", "przekazanie z innych jednostek na podstawie art. 200§1 kpc ( z wyjątkiem zmian organizacyjnych)" });
            dT.Rows.Add(new Object[] { 6, 2, 2, 1, "wciecie borderAll", "wyłączenie sprawy do odrębnego rozpoznania – poprzednio połączonej na podstawie art. 219 kpc" });
            dT.Rows.Add(new Object[] { 7, 2, 2, 1, "wciecie borderAll", "wyłączenie roszczenia do odrębnego rozpoznania" });
            dT.Rows.Add(new Object[] { 8, 2, 2, 1, "wciecie borderAll", "sprawy zawieszone zakreślone, które podjęto" });
            dT.Rows.Add(new Object[] { 9, 2, 2, 1, "wciecie borderAll", "wpisane na podstawie art. 486 kpc i art. 498§2 kpc" });
            dT.Rows.Add(new Object[] { 10, 2, 2, 1, "wciecie borderAll", "wpisane na podstawie art. 495§1 kpc" });
            dT.Rows.Add(new Object[] { 11, 2, 2, 1, "wciecie borderAll", "wpisane na podstawie art. 505§1 kpc" });
            dT.Rows.Add(new Object[] { 12, 2, 2, 1, "wciecie borderAll", "przekazano sprawy w ramach sądu pomiędzy wydziałami tego samego pionu" });
            dT.Rows.Add(new Object[] { 13, 2, 2, 1, "wciecie borderAll", "przekazano sprawy w ramach sądu pomiędzy wydziałami różnych pionów" });
            dT.Rows.Add(new Object[] { 14, 2, 2, 1, "wciecie borderAll", "przekazane przez SR Lublin-Zachód (e-sąd) " });
            dT.Rows.Add(new Object[] { 15, 2, 2, 1, "wciecie borderAll", "w tym przekazane na podstawie art. 50533 §1 kpc" });
            dT.Rows.Add(new Object[] { 16, 2, 2, 1, "wciecie borderAll", "po uchyleniu orzeczenia i przekazaniu sprawy do ponownego rozpoznania " });
            dT.Rows.Add(new Object[] { 17, 2, 2, 1, "wciecie borderAll", "wpisane w wyniku przywrócenia terminu do wniesienia środka zaskarżenia" });
            dT.Rows.Add(new Object[] { 18, 2, 2, 1, "wciecie borderAll", "w wyniku zmian zarządzenia MS o biurowości" });

            dT.Rows.Add(new Object[] { 19, 2, 1, 2, "wciecie borderAll", "zmiany organizacyjne związane z utworzeniem lub likwidacją" });
            dT.Rows.Add(new Object[] { 19, 3, 1, 1, "wciecie borderAll", "wydziału (ów) / sekcji" });
            dT.Rows.Add(new Object[] { 20, 3, 1, 1, "wciecie borderAll", "sądu (ów)" });

            dT.Rows.Add(new Object[] { 21, 2, 1, 2, "wciecie borderAll", "w związku ze zmianą obszaru właściwości miejscowej" });
            dT.Rows.Add(new Object[] { 21, 3, 1, 1, "wciecie borderAll", "wydziału (ów) / sekcji" });
            dT.Rows.Add(new Object[] { 22, 3, 1, 1, "wciecie borderAll", "sądu (ów)" });

            dT.Rows.Add(new Object[] { 23, 2, 2, 1, "wciecie borderAll", "wpisane w wyniku zmiany trybu lub rodzaju postępowania (art. 201 § 1 i 2 kpc)" });
            dT.Rows.Add(new Object[] { 24, 2, 2, 1, "wciecie borderAll", "dokonano omyłkowego wpisu" });

            dT.Rows.Add(new Object[] { 25, 2, 1, 2, "wciecie borderAll", "wpływ spraw" });
            dT.Rows.Add(new Object[] { 25, 3, 1, 1, "wciecie borderAll", "w związku z funkcjonowaniem § 43 Regulaminu" });
            dT.Rows.Add(new Object[] { 26, 3, 1, 1, "wciecie borderAll", "w związku ze wspólnym wpływem §54 ust.2 Regulaminu" });

            dT.Rows.Add(new Object[] { 27, 2, 2, 1, "wciecie borderAll", "w wyniku uchylonych nakazów zapłaty na podstawie art. 502<sup>1</sup> kpc, art. 492<sup>1</sup> kpc" });
            dT.Rows.Add(new Object[] { 28, 2, 2, 1, "wciecie borderAll", "inne" });
            dT.Rows.Add(new Object[] { 29, 1, 3, 1, "wciecie borderAll", "Wpływ pozostałych spraw" });

            return dT;
        }

        #endregion dzial 1.1.5.a

        #region dzial 1.1.5.b

        private DataTable naglowekTabeliDzialu_1_1_5_b()
        {
            return naglowekTabeliDzialu_1_1_5_a();
        }

        private DataTable tabelaBocznaDzialu_1_1_5_b()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 3, 1, "wciecie borderAll", "Załatwiono ogółem (w.01 = dz.1.1.1.1 kol.4 i dz. 1.1.2.1. kol. 3 odpowiednie wiersze = w.02+30)" });
            dT.Rows.Add(new Object[] { 2, 1, 1, 28, "wciecie borderAll", "W tym szczególne rodzaje załatwień" });
            dT.Rows.Add(new Object[] { 2, 2, 2, 1, "wciecie borderAll", "razem (w.02 = w.03 do 29)" });
            dT.Rows.Add(new Object[] { 3, 2, 2, 1, "wciecie borderAll", "zwrot pozwu/odwołania/ wniosku/akt" });
            dT.Rows.Add(new Object[] { 4, 2, 2, 1, "wciecie borderAll", "przekazanie do innych jednostek na podstawie art. 200§1,461 kpc (z wyjątkiem zmian organizacyjnych)" });
            dT.Rows.Add(new Object[] { 5, 2, 2, 1, "wciecie borderAll", "zakończono w trybie art. 339 kpc" });
            dT.Rows.Add(new Object[] { 6, 2, 2, 1, "wciecie borderAll", "zakończono w trybie art. 341 kpc" });
            dT.Rows.Add(new Object[] { 7, 2, 2, 1, "wciecie borderAll", "zakreślono na podstawie art. 486  kpc" });
            dT.Rows.Add(new Object[] { 8, 2, 2, 1, "wciecie borderAll", "zakreślono na podstawie art. 498 §2 kpc" });
            dT.Rows.Add(new Object[] { 9, 2, 2, 1, "wciecie borderAll", "w wyniku zmian zarządzenia MS o biurowości" });
            dT.Rows.Add(new Object[] { 10, 2, 2, 1, "wciecie borderAll", "w wyniku przekazania sprawy w ramach sądu pomiędzy wydziałami tego samego pionu" });
            dT.Rows.Add(new Object[] { 11, 2, 2, 1, "wciecie borderAll", "w wyniku przekazania sprawy w ramach sądu pomiędzy wydziałami różnych pionów" });

            dT.Rows.Add(new Object[] { 12, 2, 1, 2, "wciecie borderAll", "zmiany organizacyjne związane z utworzeniem lub likwidacją" });
            dT.Rows.Add(new Object[] { 12, 3, 1, 1, "wciecie borderAll", "wydziału (ów) / sekcji" });
            dT.Rows.Add(new Object[] { 13, 3, 1, 1, "wciecie borderAll", "sądu (ów)" });

            dT.Rows.Add(new Object[] { 14, 2, 1, 2, "wciecie borderAll", "w związku ze zmianą obszaru właściwości miejscowej" });
            dT.Rows.Add(new Object[] { 14, 3, 1, 1, "wciecie borderAll", "wydziału (ów) / sekcji" });
            dT.Rows.Add(new Object[] { 15, 3, 1, 1, "wciecie borderAll", "sądu (ów)" });
            dT.Rows.Add(new Object[] { 16, 2, 2, 1, "wciecie borderAll", "połączono do wspólnego rozpoznania na podstawie art. 219 kpc" });
            dT.Rows.Add(new Object[] { 17, 2, 2, 1, "wciecie borderAll", "zakreślone w wyniku zmiany trybu lub rodzaju postępowania (art. 201 § 1 i 2 kpc)" });
            dT.Rows.Add(new Object[] { 18, 2, 1, 2, "wciecie borderAll", "zakreślono na podstawie art. 174 §1" });
            dT.Rows.Add(new Object[] { 18, 3, 1, 1, "wciecie borderAll", "pkt 1 kpc" });
            dT.Rows.Add(new Object[] { 19, 3, 1, 1, "wciecie borderAll", "pkt 4 kpc" });
            dT.Rows.Add(new Object[] { 20, 2, 2, 1, "wciecie borderAll", "zakreślenie omyłkowych wpisów" });
            dT.Rows.Add(new Object[] { 21, 2, 2, 1, "wciecie borderAll", "odrzucono pozew / wniosek / skargę /apelację / zażalenie" });
            dT.Rows.Add(new Object[] { 22, 2, 2, 1, "wciecie borderAll", "umorzenie na skutek cofnięcia pozwu, wniosku (wykazujemy I i II instancję), środka odwoławczego lub, skargi przed sądem  II instancji" });

            dT.Rows.Add(new Object[] { 23, 2, 2, 1, "wciecie borderAll", "w trybie § 110 ust. 3 zarządzenia Ministra Sprawiedliwości z dnia 12 grudnia 2003 r. w sprawie organizacji i zakresu działania sekretariatów sądowych oraz innych działów administracji sądowej (Dz. Urz. Min. Sprawiedl. Nr 5 poz. 22, z późn. zm.)" });
            dT.Rows.Add(new Object[] { 24, 2, 2, 1, "wciecie borderAll", "umorzenie na podstawie art. 505<sup>37</sup> §1 kpc" });
            dT.Rows.Add(new Object[] { 25, 2, 2, 1, "wciecie borderAll", "zakończono w trybie art.148<sup>1</sup> §1 kpc" });
            dT.Rows.Add(new Object[] { 26, 2, 2, 1, "wciecie borderAll", "wydano nakaz zapłaty" });

            dT.Rows.Add(new Object[] { 27, 2, 1, 2, "wciecie borderAll", "zakreślenie spraw" });
            dT.Rows.Add(new Object[] { 27, 3, 1, 1, "wciecie borderAll", "w związku z funkcjonowaniem § 43 Regulaminu" });
            dT.Rows.Add(new Object[] { 28, 3, 1, 1, "wciecie borderAll", "w związku ze wspólnym wpływem §54 ust.2 Regulaminu" });
            dT.Rows.Add(new Object[] { 29, 2, 2, 1, "wciecie borderAll", "inne" });

            dT.Rows.Add(new Object[] { 30, 1, 3, 1, "wciecie borderAll", "Załatwienie pozostałych spraw" });
            dT.Rows.Add(new Object[] { 31, 1, 3, 1, "wciecie borderAll", "Pozostało na okres następny (w.31 = dz.1.1.1.1 kol.16 i dz. 1.1.2.1. kol. 15 odpowiednie wiersze)" });

            return dT;
        }

        #endregion dzial 1.1.5.b

        #region dzial 1.2.1

        private DataTable naglowekTabeliDzialu_1_2_1()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 4, "center", "SPRAWY według repertoriów i wykazów" });
            dT.Rows.Add(new Object[] { 1, 2, 1, 4, "center col_120", "Liczba sesji (rozprawy i posiedzenia) - wokandy" });
            dT.Rows.Add(new Object[] { 1, 3, 1, 4, "center col_120", "Suma wyznaczonych spraw (suma kol. 4 i 22,)" });
            dT.Rows.Add(new Object[] { 1, 4, 1, 4, "center col_120", "Łączna liczba dni na które wyznaczono sesje-wokandy" });
            dT.Rows.Add(new Object[] { 1, 5, 1, 4, "center col_120", "Razem wyznaczonych na rozprawę sędziów (suma kol. 5,17, 21)" });
            dT.Rows.Add(new Object[] { 1, 6, 17, 1, "center ", "Liczba wyznaczonych spraw na rozprawę, dotyczy:" });
            dT.Rows.Add(new Object[] { 1, 23, 1, 4, "center col_120", "Razem wyznaczonych na posiedzenie sędziów i referendarze(suma kol.23,35,39,40)" });
            dT.Rows.Add(new Object[] { 1, 24, 18, 1, "center ", "Liczba wyznaczonych spraw na posiedzenia, dotyczy:" });
            dT.Rows.Add(new Object[] { 2, 6, 12, 1, "center col_120", "Sędziowie SO" });
            dT.Rows.Add(new Object[] { 2, 18, 1, 3, "center col_120", "Razem wyznaczonych na rozprawę sędziowie SR (suma kol. 18,19,20)" });
            dT.Rows.Add(new Object[] { 2, 19, 3, 1, "center ", "Sędziowie SR" });
            dT.Rows.Add(new Object[] { 2, 22, 1, 3, "center col_120", "inni sędziowie" });
            dT.Rows.Add(new Object[] { 2, 24, 12, 1, "center col_120", "Sędziowie SO" });
            dT.Rows.Add(new Object[] { 2, 36, 1, 3, "center col_120", "Razem wyznaczonych na  posiedzenie sędziowie SR (suma kol. 36,37,38)" });
            dT.Rows.Add(new Object[] { 2, 37, 3, 1, "center ", "Sędziowie SR" });
            dT.Rows.Add(new Object[] { 2, 38, 1, 3, "center col_120", "inni sędziowie" });
            dT.Rows.Add(new Object[] { 2, 39, 1, 3, "center col_120", "referendarze" });

            dT.Rows.Add(new Object[] { 3, 6, 1, 2, "center col_120", "Razem wyznaczonych spraw na rozprawę sędziowie SO (suma kol.6,7,16)" });
            dT.Rows.Add(new Object[] { 3, 7, 1, 2, "center col_120", "sędziów SO z wyłączeniem sędziów funkcyjnych" });
            dT.Rows.Add(new Object[] { 3, 8, 1, 2, "center col_120", "sędziów funkcyjnych SO (suma kol. od 8 do 15)" });
            dT.Rows.Add(new Object[] { 3, 9, 8, 1, "center col_120", "z tego" });
            dT.Rows.Add(new Object[] { 3, 17, 1, 2, "center col_120", "inni" });

            dT.Rows.Add(new Object[] { 3, 19, 1, 2, "center col_120", "sędziów SR delegowanych w trybie art. 77 §1 usp na czas nieokreślony lub na czas określony, orzekających w pełnym wymiarze" });
            dT.Rows.Add(new Object[] { 3, 20, 1, 2, "center col_120", "sędziów SR delegowanych w trybie art. 77 §1 usp na czas nieokreślony lub na czas określony, orzekających w niepełnym wymiarze" });
            dT.Rows.Add(new Object[] { 3, 21, 1, 2, "center col_120", "sędziów SR delegowanych w trybie art. 77 § 9 usp	" });
            dT.Rows.Add(new Object[] { 3, 23, 1, 2, "center col_120", "Razem wyznaczonych  spraw na posiedzenie sędziowie SO (suma kol.24,25,34)" });
            dT.Rows.Add(new Object[] { 3, 24, 1, 2, "center col_120", "sędziów SO z wyłączeniem sędziów funkcyjnych" });
            dT.Rows.Add(new Object[] { 3, 25, 1, 2, "center col_120", "sędziów funkcyjnych SO (suma kol. od 26 do 33)" });
            dT.Rows.Add(new Object[] { 3, 27, 8, 1, "center col_120", "z tego" });
            dT.Rows.Add(new Object[] { 3, 35, 1, 2, "center col_120", "inni" });

            dT.Rows.Add(new Object[] { 3, 37, 1, 2, "center col_120", "sędziów SR delegowanych w trybie art. 77 §1 usp na czas nieokreślony lub na czas określony, orzekających w pełnym wymiarze" });
            dT.Rows.Add(new Object[] { 3, 38, 1, 2, "center col_120", "sędziów SR delegowanych w trybie art. 77 §1 usp na czas nieokreślony lub na czas określony, orzekających w niepełnym wymiarze" });
            dT.Rows.Add(new Object[] { 3, 39, 1, 2, "center col_120", "sędziów SR delegowanych w trybie art. 77 § 9 usp" });

            dT.Rows.Add(new Object[] { 4, 9, 1, 1, "center col_120", "prezesa" });
            dT.Rows.Add(new Object[] { 4, 10, 1, 1, "center col_120", "wiceprezesa" });
            dT.Rows.Add(new Object[] { 4, 11, 1, 1, "center col_120", "przewodniczącego wydziału" });
            dT.Rows.Add(new Object[] { 4, 12, 1, 1, "center col_120", "zastępcę przewodniczącego wydziału" });
            dT.Rows.Add(new Object[] { 4, 13, 1, 1, "center col_120", "kierownika sekcji" });
            dT.Rows.Add(new Object[] { 4, 14, 1, 1, "center col_120", "wizytatorów" });
            dT.Rows.Add(new Object[] { 4, 15, 1, 1, "center col_120", "innych funkcyjnych tego sądu z tego pionu" });
            dT.Rows.Add(new Object[] { 4, 16, 1, 1, "center col_120", "innych funkcyjnych tego sądu z innych pionów" });

            dT.Rows.Add(new Object[] { 4, 27, 1, 1, "center col_120", "prezesa" });
            dT.Rows.Add(new Object[] { 4, 28, 1, 1, "center col_120", "wiceprezesa" });
            dT.Rows.Add(new Object[] { 4, 29, 1, 1, "center col_120", "przewodniczącego wydziału" });
            dT.Rows.Add(new Object[] { 4, 30, 1, 1, "center col_120", "zastępcę przewodniczącego wydziału" });
            dT.Rows.Add(new Object[] { 4, 31, 1, 1, "center col_120", "kierownika sekcji" });
            dT.Rows.Add(new Object[] { 4, 32, 1, 1, "center col_120", "wizytatorów" });
            dT.Rows.Add(new Object[] { 4, 33, 1, 1, "center col_120", "innych funkcyjnych tego sądu z tego pionu" });
            dT.Rows.Add(new Object[] { 4, 34, 1, 1, "center col_120", "innych funkcyjnych tego sądu z innych pionów" });

            return dT;
        }

        private DataTable tabelaBocznaDzialu_1_2_1()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 1, "wciecie borderAll", "Ogółem sprawy z zakresu ubezpieczeń społecznych (wiersze 02 do 08)" });
            dT.Rows.Add(new Object[] { 2, 1, 1, 1, "wciecie borderAll", "U" });
            dT.Rows.Add(new Object[] { 3, 1, 1, 1, "wciecie borderAll", "Ua" });
            dT.Rows.Add(new Object[] { 4, 1, 1, 1, "wciecie borderAll", "Uz" });
            dT.Rows.Add(new Object[] { 5, 1, 1, 1, "wciecie borderAll", "Uo" });
            dT.Rows.Add(new Object[] { 6, 1, 1, 1, "wciecie borderAll", "WSC (skarga kasacyjna)" });
            dT.Rows.Add(new Object[] { 7, 1, 1, 1, "wciecie borderAll", "WSC (skarga o stwierdzenie niezgodności z prawem)" });
            dT.Rows.Add(new Object[] { 8, 1, 1, 1, "wciecie borderAll", "Skarga na postępowanie sądowe Wykaz S*)" });
            dT.Rows.Add(new Object[] { 9, 1, 1, 1, "wciecie borderAll", "Ogółem sprawy z zakresu prawa pracy (w. 10 do 18)" });
            dT.Rows.Add(new Object[] { 10, 1, 1, 1, "wciecie borderAll", "P" });
            dT.Rows.Add(new Object[] { 11, 1, 1, 1, "wciecie borderAll", "Nb" });
            dT.Rows.Add(new Object[] { 12, 1, 1, 1, "wciecie borderAll", "Po" });
            dT.Rows.Add(new Object[] { 13, 1, 1, 1, "wciecie borderAll", "Pa apelacyjne" });
            dT.Rows.Add(new Object[] { 14, 1, 1, 1, "wciecie borderAll", "Pz zażaleniowe" });
            dT.Rows.Add(new Object[] { 15, 1, 1, 1, "wciecie borderAll", "WSC skarga kasacyjna" });
            dT.Rows.Add(new Object[] { 16, 1, 1, 1, "wciecie borderAll", "Wykaz Kas-z wnioski o rozstrzygnięcie sporu zakładowego przez kolegium arbitrażu społecznego" });
            dT.Rows.Add(new Object[] { 17, 1, 1, 1, "wciecie borderAll", "WSC skarga o stwierdzenie niezgodności z prawem" });
            dT.Rows.Add(new Object[] { 18, 1, 1, 1, "wciecie borderAll", "Skargi na postępowanie sądowe (wykaz S) *)" });

            return dT;
        }

        #endregion dzial 1.2.1

        #region dzial 1.2.2

        private DataTable naglowekTabeliDzialu_1_2_2()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 3, 4, "center", "SPRAWY według repertoriów i wykazów" });
            dT.Rows.Add(new Object[] { 1, 2, 1, 4, "center col_120", "Liczba odbytych sesji (rozprawy i posiedzenia) - wokandy" });
            dT.Rows.Add(new Object[] { 1, 3, 1, 4, "center col_120", "Łączna liczba dni w których odbyto sesje-wokandy" });
            dT.Rows.Add(new Object[] { 1, 4, 1, 4, "center col_120", "Załatwienie1) ogółem (suma kol. 4, 22)" });
            dT.Rows.Add(new Object[] { 1, 6, 18, 1, "center ", "Liczba wyznaczonych spraw na rozprawę, dotyczy:" });
            dT.Rows.Add(new Object[] { 1, 24, 19, 1, "center ", "Liczba wyznaczonych spraw na posiedzenia, dotyczy:" });

            dT.Rows.Add(new Object[] { 2, 5, 1, 3, "center col_120", "Załatwienie razem (suma kol. 5, 17, 21)" });
            dT.Rows.Add(new Object[] { 2, 6, 12, 1, "center col_120", "Sędziowie SO" });
            dT.Rows.Add(new Object[] { 2, 18, 1, 3, "center col_120", "Razem załatwionych spraw na rozprawie sędziowie SR (suma kol.18,19,20)" });
            dT.Rows.Add(new Object[] { 2, 19, 3, 1, "center ", "Sędziowie SR" });
            dT.Rows.Add(new Object[] { 2, 22, 1, 3, "center col_120", "inni sędziowie" });
            dT.Rows.Add(new Object[] { 2, 25, 1, 3, "center col_120", "Załatwienie razem (suma kol. 23, 35, 39, 40)" });
            dT.Rows.Add(new Object[] { 2, 26, 1, 3, "center col_120", "Razem załatwionych spraw na posiedzeniu sędziowie SO (suma kol.24,25,34)" });
            dT.Rows.Add(new Object[] { 2, 24, 10, 1, "center col_120", "Sędziowie SO" });
            dT.Rows.Add(new Object[] { 2, 36, 1, 3, "center col_120", "Razem załatwionych spraw na posiedzeniu sędziowie SR (suma kol.36,37,38)" });
            dT.Rows.Add(new Object[] { 2, 37, 3, 1, "center ", "Sędziowie SR" });
            dT.Rows.Add(new Object[] { 2, 38, 1, 3, "center col_120", "inni sędziowie" });
            dT.Rows.Add(new Object[] { 2, 39, 1, 3, "center col_120", "referendarze" });

            dT.Rows.Add(new Object[] { 3, 6, 1, 2, "center col_120", "Razem załatwionych spraw na rozprawie sędziowie SO (suma kol.6,7,16)" });
            dT.Rows.Add(new Object[] { 3, 7, 1, 2, "center col_120", "sędziów SO z wyłączeniem sędziów funkcyjnych " });
            dT.Rows.Add(new Object[] { 3, 8, 1, 2, "center col_120", "sędziów funkcyjnych SO (suma kol. od 8 do 15)" });
            dT.Rows.Add(new Object[] { 3, 9, 8, 1, "center col_120", "z tego" });
            dT.Rows.Add(new Object[] { 3, 17, 1, 2, "center col_120", "inni" });
            dT.Rows.Add(new Object[] { 3, 19, 1, 2, "center col_120", "sędziów SR delegowanych w trybie art. 77 §1 usp na czas nieokreślony lub na czas określony, orzekających w pełnym wymiarze" });
            dT.Rows.Add(new Object[] { 3, 20, 1, 2, "center col_120", "sędziów SR delegowanych w trybie art. 77 §1 usp na czas nieokreślony lub na czas określony, orzekających w niepełnym wymiarze" });
            dT.Rows.Add(new Object[] { 3, 21, 1, 2, "center col_120", "sędziów SR delegowanych w trybie art. 77 § 9 usp" });
            dT.Rows.Add(new Object[] { 3, 26, 8, 1, "center col_120", "z tego" });
            dT.Rows.Add(new Object[] { 3, 35, 1, 2, "center col_120", "inni" });
            dT.Rows.Add(new Object[] { 3, 37, 1, 2, "center col_120", "sędziów SR delegowanych w trybie art. 77 §1 usp" });
            dT.Rows.Add(new Object[] { 3, 38, 1, 2, "center col_120", "sędziów SR delegowanych w trybie art. 77 §1 usp " });
            dT.Rows.Add(new Object[] { 3, 39, 1, 2, "center col_120", "na czas nieokreślony lub na czas określony, orzekających w niepełnym wymiarze" });
            dT.Rows.Add(new Object[] { 3, 40, 1, 2, "center col_120", " sędziów SR delegowanych w trybie art. 77 § 9 usp" });

            dT.Rows.Add(new Object[] { 4, 9, 1, 1, "center col_120", "prezesa" });
            dT.Rows.Add(new Object[] { 4, 10, 1, 1, "center col_120", "wiceprezesa" });
            dT.Rows.Add(new Object[] { 4, 11, 1, 1, "center col_120", "przewodniczącego wydziału" });
            dT.Rows.Add(new Object[] { 4, 12, 1, 1, "center col_120", "zastępcę przewodniczącego wydziału" });
            dT.Rows.Add(new Object[] { 4, 13, 1, 1, "center col_120", "kierownika sekcji" });
            dT.Rows.Add(new Object[] { 4, 14, 1, 1, "center col_120", "wizytatorów" });
            dT.Rows.Add(new Object[] { 4, 15, 1, 1, "center col_120", "innych funkcyjnych tego sądu z tego pionu" });
            dT.Rows.Add(new Object[] { 4, 16, 1, 1, "center col_120", "innych funkcyjnych tego sądu z innych pionów" });

            dT.Rows.Add(new Object[] { 4, 27, 1, 1, "center col_120", "prezesa" });
            dT.Rows.Add(new Object[] { 4, 28, 1, 1, "center col_120", "wiceprezesa" });
            dT.Rows.Add(new Object[] { 4, 29, 1, 1, "center col_120", "przewodniczącego wydziału" });
            dT.Rows.Add(new Object[] { 4, 30, 1, 1, "center col_120", "zastępcę przewodniczącego wydziału" });
            dT.Rows.Add(new Object[] { 4, 31, 1, 1, "center col_120", "kierownika sekcji" });
            dT.Rows.Add(new Object[] { 4, 32, 1, 1, "center col_120", "wizytatorów" });
            dT.Rows.Add(new Object[] { 4, 33, 1, 1, "center col_120", "innych funkcyjnych tego sądu z tego pionu" });
            dT.Rows.Add(new Object[] { 4, 34, 1, 1, "center col_120", "innych funkcyjnych tego sądu z innych pionów" });
            return dT;
        }

        private DataTable tabelaBocznaDzialu_1_2_2()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 3, 1, "wciecie borderAll", "Ogółem sprawy z zakresu ubezpieczeń społecznych (wiersze 02, 21 do 26)" });
            dT.Rows.Add(new Object[] { 2, 1, 3, 1, "wciecie borderAll", "U" });
            dT.Rows.Add(new Object[] { 3, 1, 1, 18, "wciecie borderAll", "w tym" });
            dT.Rows.Add(new Object[] { 3, 2, 2, 1, "wciecie borderAll", "Zwrot pozwu" });

            dT.Rows.Add(new Object[] { 4, 2, 2, 1, "wciecie borderAll", "przekazanie do innych jednostek na podstawie art. 200§1 kpc (z wyjątkiem zmian organizacyjnych)" });
            dT.Rows.Add(new Object[] { 5, 2, 2, 1, "wciecie borderAll", "zakończono w trybie art. 339 kpc" });
            dT.Rows.Add(new Object[] { 6, 2, 2, 1, "wciecie borderAll", "zakończono w trybie art. 341 kpc" });
            dT.Rows.Add(new Object[] { 7, 2, 2, 1, "wciecie borderAll", "w wyniku zmian zarządzenia MS o biurowości" });
            dT.Rows.Add(new Object[] { 8, 2, 2, 1, "wciecie borderAll", "w wyniku przekazania sprawy w ramach sądu pomiędzy wydziałami tego samego pionu" });
            dT.Rows.Add(new Object[] { 9, 2, 2, 1, "wciecie borderAll", "w wyniku przekazania sprawy w ramach sądu pomiędzy wydziałami różnych pionów" });
            dT.Rows.Add(new Object[] { 10, 2, 1, 2, "wciecie borderAll", "zmiany organizacyjne związane z utworzeniem lub likwidacją" });
            dT.Rows.Add(new Object[] { 10, 3, 1, 1, "wciecie borderAll", "wydziału(łów)/ sekcji" });
            dT.Rows.Add(new Object[] { 11, 3, 1, 1, "wciecie borderAll", "sądu (dów)" });
            dT.Rows.Add(new Object[] { 12, 2, 1, 2, "wciecie borderAll", "w wyniku zmiany obszaru właściwości miejscowej" });
            dT.Rows.Add(new Object[] { 12, 3, 1, 1, "wciecie borderAll", "wydziału(łów)/ sekcji" });
            dT.Rows.Add(new Object[] { 13, 3, 1, 1, "wciecie borderAll", "sądu (dów)" });

            dT.Rows.Add(new Object[] { 14, 2, 2, 1, "wciecie borderAll", "połączono do wspólnego rozpoznania na podstawie art. 219 kpc" });

            dT.Rows.Add(new Object[] { 15, 2, 2, 1, "wciecie borderAll", "zakreślono na podstawie art. 174 §1 pkt 1 kpc" });
            dT.Rows.Add(new Object[] { 16, 2, 2, 1, "wciecie borderAll", "zakreślono na podstawie art. 174 §1 pkt 4 kpc" });
            dT.Rows.Add(new Object[] { 17, 2, 2, 1, "wciecie borderAll", "zakreślenie omyłkowych wpisów" });
            dT.Rows.Add(new Object[] { 18, 2, 2, 1, "wciecie borderAll", "odrzucono pozew" });
            dT.Rows.Add(new Object[] { 19, 2, 2, 1, "wciecie borderAll", "umorzono na podstawie art. 50537§1 kpc" });
            dT.Rows.Add(new Object[] { 20, 2, 2, 1, "wciecie borderAll", "inne" });
            dT.Rows.Add(new Object[] { 21, 1, 3, 1, "wciecie borderAll", "Ua" });
            dT.Rows.Add(new Object[] { 22, 1, 3, 1, "wciecie borderAll", "Uz" });
            dT.Rows.Add(new Object[] { 23, 1, 3, 1, "wciecie borderAll", "Uo" });
            dT.Rows.Add(new Object[] { 24, 1, 3, 1, "wciecie borderAll", "WSC (skarga kasacyjna)" });

            dT.Rows.Add(new Object[] { 25, 1, 3, 1, "wciecie borderAll", "WSC (skarga o stwierdzenie niezgodności z prawem)" });
            dT.Rows.Add(new Object[] { 26, 1, 3, 1, "wciecie borderAll", "Skarga na postępowanie sądowe (Wykaz S)*)" });
            dT.Rows.Add(new Object[] { 27, 1, 3, 1, "wciecie borderAll", "Ogółem sprawy z zakresu prawa pracy (suma wierszy 28, 49 do 56)" });
            dT.Rows.Add(new Object[] { 28, 1, 3, 1, "wciecie borderAll", "P" });
            dT.Rows.Add(new Object[] { 29, 1, 1, 20, "wciecie borderAll", " " });
            dT.Rows.Add(new Object[] { 29, 2, 2, 1, "wciecie borderAll", "zwrot pozwu" });
            dT.Rows.Add(new Object[] { 30, 1, 2, 1, "wciecie borderAll", "przekazane do innych jednostek na podstawie art. 200§1 kpc (z wyjątkiem zmian organizacyjnych)" });
            dT.Rows.Add(new Object[] { 31, 1, 2, 1, "wciecie borderAll", "zakończono w trybie art. 339 kpc" });
            dT.Rows.Add(new Object[] { 32, 1, 2, 1, "wciecie borderAll", "zakończono w trybie art. 341 kpc" });
            dT.Rows.Add(new Object[] { 33, 1, 2, 1, "wciecie borderAll", "w wyniku zmian zarządzenia MS o biurowości" });
            dT.Rows.Add(new Object[] { 34, 1, 2, 1, "wciecie borderAll", "w wyniku przekazania sprawy w ramach sądu pomiędzy wydziałami tego samego pionu" });
            dT.Rows.Add(new Object[] { 35, 1, 2, 1, "wciecie borderAll", "w wyniku przekazania sprawy w ramach sądu pomiędzy wydziałami różnych pionów" });
            dT.Rows.Add(new Object[] { 36, 2, 1, 2, "wciecie borderAll", "zmiany organizacyjne związane z utworzeniem lub likwidacją" });
            dT.Rows.Add(new Object[] { 36, 3, 1, 1, "wciecie borderAll", "wydziału(łów)/ sekcji" });
            dT.Rows.Add(new Object[] { 37, 3, 1, 1, "wciecie borderAll", "sądu (dów)" });
            dT.Rows.Add(new Object[] { 38, 2, 1, 2, "wciecie borderAll", "w wyniku zmiany obszaru właściwości miejscowej" });
            dT.Rows.Add(new Object[] { 38, 3, 1, 1, "wciecie borderAll", "wydziału(łów)/ sekcji" });
            dT.Rows.Add(new Object[] { 39, 3, 1, 1, "wciecie borderAll", "sądu (dów)" });
            dT.Rows.Add(new Object[] { 40, 1, 2, 1, "wciecie borderAll", "połączono do wspólnego rozpoznania na podstawie art. 219 kpc" });
            dT.Rows.Add(new Object[] { 41, 1, 2, 1, "wciecie borderAll", "zakreślone w wyniku zmiany trybu lub rodzaju postępowania (art. 201 § 1 i 2 kpc)" });
            dT.Rows.Add(new Object[] { 42, 2, 1, 2, "wciecie borderAll", "zakreślono na podstawie art. 174 §1" });
            dT.Rows.Add(new Object[] { 42, 3, 1, 1, "wciecie borderAll", "pkt 1 kpc" });
            dT.Rows.Add(new Object[] { 43, 3, 1, 1, "wciecie borderAll", "pkt 4 kpc)" });
            dT.Rows.Add(new Object[] { 44, 1, 2, 1, "wciecie borderAll", "zakreślenie omyłkowych wpisów" });
            dT.Rows.Add(new Object[] { 45, 1, 2, 1, "wciecie borderAll", "odrzucono pozew" });
            dT.Rows.Add(new Object[] { 46, 1, 2, 1, "wciecie borderAll", "umorzono na podstawie art. 505<sup>37</sup>§1 kpc" });
            dT.Rows.Add(new Object[] { 47, 1, 2, 1, "wciecie borderAll", "wydano nakaz zapłaty" });
            dT.Rows.Add(new Object[] { 48, 1, 2, 1, "wciecie borderAll", "inne" });
            dT.Rows.Add(new Object[] { 49, 1, 3, 1, "wciecie borderAll", "Np" });
            dT.Rows.Add(new Object[] { 50, 1, 3, 1, "wciecie borderAll", "Po" });
            dT.Rows.Add(new Object[] { 51, 1, 3, 1, "wciecie borderAll", "Pa apelacyjne" });
            dT.Rows.Add(new Object[] { 52, 1, 3, 1, "wciecie borderAll", "Pz zażaleniowe" });
            dT.Rows.Add(new Object[] { 53, 1, 3, 1, "wciecie borderAll", "WSC skarga kasacyjna" });
            dT.Rows.Add(new Object[] { 54, 1, 3, 1, "wciecie borderAll", "Wykaz Kas-z wnioski o rozstrzygnięcie sporu zakładowego przez kolegium arbitrażu społecznego" });
            dT.Rows.Add(new Object[] { 55, 1, 3, 1, "wciecie borderAll", "WSC skarga o stwierdzenie niezgodności z prawem" });
            dT.Rows.Add(new Object[] { 56, 1, 3, 1, "wciecie borderAll", "Skargi na postępowanie sądowe (Wykaz S)*)" });
            return dT;
        }

        #endregion dzial 1.2.2

        #region dzial 1.3

        private DataTable naglowekTabeliDzialu_1_3()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 2, "center", "Wyszczególnienie" });
            dT.Rows.Add(new Object[] { 1, 3, 1, 2, "center col_120", "ogółem zakresu  ubezpieczeń i pracy (kol2+6)" });
            dT.Rows.Add(new Object[] { 1, 4, 9, 1, "center col_120", "Liczba spraw załatwionych przez referendarzy" });

            dT.Rows.Add(new Object[] { 2, 4, 1, 1, "center col_120", "Ogółem sprawy z zakresu ubezpieczeń(kol.2=od 3 do 5" });
            dT.Rows.Add(new Object[] { 2, 5, 1, 1, "center col_120", "Rep U" });
            dT.Rows.Add(new Object[] { 2, 6, 1, 1, "center col_120", "Rer Uo" });
            dT.Rows.Add(new Object[] { 2, 7, 1, 1, "center col_120", "inne" });
            dT.Rows.Add(new Object[] { 2, 8, 1, 1, "center col_120", "Ogółem sprawy z zakresu prawa pracy (kol.6= od 7 do 10)" });
            dT.Rows.Add(new Object[] { 2, 9, 1, 1, "center col_120", "Rep P" });
            dT.Rows.Add(new Object[] { 2, 10, 1, 1, "center col_120", "Rer Np" });
            dT.Rows.Add(new Object[] { 2, 11, 1, 1, "center col_120", "Rer Po" });

            dT.Rows.Add(new Object[] { 2, 12, 1, 1, "center col_120", "inne" });
            return dT;

        }

        private DataTable tabelaBocznaDzialu_1_3()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 1, "wciecie borderAll", "W przedmiocie zwolnienia od kosztów sądowych i/lub ustanowienia adwokata lub radcy prawnego" });
            dT.Rows.Add(new Object[] { 2, 1, 1, 1, "wciecie borderAll", "Zwrot pism po bezskutecznym upływie terminu do ich uzupełnienia i opłacenia " });
            dT.Rows.Add(new Object[] { 3, 1, 1, 1, "wciecie borderAll", "Wydawanie nakazów zapłaty w postępowaniu upominawczym" });
            dT.Rows.Add(new Object[] { 4, 1, 1, 1, "wciecie borderAll", "O nadanie klauzuli wykonalności" });

            dT.Rows.Add(new Object[] { 4, 1, 1, 1, "wciecie borderAll", "Inne" });
            return dT;
        }

        #endregion dzial 1.3

        #region dzial 1.4

        private DataTable naglowekTabeliDzialu_1_4()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 3, 3, "center", "RODZAJE SRPAW wg repertoriów i wykazów" });
            dT.Rows.Add(new Object[] { 1, 5, 10, 1, "center ", "Terminowość sporządzania uzasadnień" });
            dT.Rows.Add(new Object[] { 1, 6, 1, 3, "center col_120", "Uzasadnienia wygłoszone (art.328 § 1<sup>1</sup> kpc)" });
            dT.Rows.Add(new Object[] { 1, 7, 1, 3, "center col_120", "Liczba spraw do których wpłynął wniosek o transkrypcję uzasadnień wygłoszonych w trybie art.328 § 11 kpc" });
            dT.Rows.Add(new Object[] { 1, 8, 2, 1, "center col_120", "Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent" });

            dT.Rows.Add(new Object[] { 2, 5, 1, 2, "center col_120", "razem(kol.2+3+5+7+9)" });
            dT.Rows.Add(new Object[] { 2, 6, 1, 2, "center col_120", "w terminie ustawowym" });
            dT.Rows.Add(new Object[] { 2, 7, 8, 1, "center ", "po upływie terminu ustawowego 1)" });
            dT.Rows.Add(new Object[] { 2, 17, 1, 2, "center col_120", "Razem" });
            dT.Rows.Add(new Object[] { 2, 18, 1, 2, "center col_120", "w tym, w których projekt został zaakceptowany przez sędziego" });

            dT.Rows.Add(new Object[] { 3, 3, 1, 1, "center col_120", "1 – 14 dni" });
            dT.Rows.Add(new Object[] { 3, 4, 1, 1, "center col_120", "w tym nieuspra-wiedliwione" });
            dT.Rows.Add(new Object[] { 3, 5, 1, 1, "center col_120", "15 – 30 dni" });
            dT.Rows.Add(new Object[] { 3, 6, 1, 1, "center col_120", "w tym nieuspra-wiedliwione" });
            dT.Rows.Add(new Object[] { 3, 7, 1, 1, "center col_120", "pow. 1 do 3 mies" });
            dT.Rows.Add(new Object[] { 3, 8, 1, 1, "center col_120", "w tym nieuspra-wiedliwione" });
            dT.Rows.Add(new Object[] { 3, 9, 1, 1, "center col_120", "ponad 3 mies." });
            dT.Rows.Add(new Object[] { 3, 10, 1, 1, "center col_120", "w tym nieuspra-wiedliwione" });

            return dT;

        }

        private DataTable tabelaBocznaDzialu_1_4()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 3, 1, "wciecie borderAll", "OGÓŁEM (w. od 02 do 07 = w.08+15)" });
            dT.Rows.Add(new Object[] { 2, 1, 2, 2, "wciecie borderAll", "I instancja" });
            dT.Rows.Add(new Object[] { 2, 3, 1, 1, "wciecie borderAll", "U  (w.09+16)" });
            dT.Rows.Add(new Object[] { 3, 3, 1, 1, "wciecie borderAll", "P  (w.10+17)" });

            dT.Rows.Add(new Object[] { 4, 1, 2, 4, "wciecie borderAll", "II instancja" });
            dT.Rows.Add(new Object[] { 4, 3, 1, 1, "wciecie borderAll", "Ua   (w.11+18)" });
            dT.Rows.Add(new Object[] { 5, 3, 1, 1, "wciecie borderAll", "Uz   (w.12+19)" });
            dT.Rows.Add(new Object[] { 6, 3, 1, 1, "wciecie borderAll", "Pa   (w.13+20)" });
            dT.Rows.Add(new Object[] { 7, 3, 1, 1, "wciecie borderAll", "Pz   (w.14+21)" });
            dT.Rows.Add(new Object[] { 8, 1, 1, 7, "wciecie borderAll", "Sędziowie SO" });
            dT.Rows.Add(new Object[] { 8, 2, 2, 1, "wciecie borderAll", "ogółem (w. od 9 do 14)" });
            dT.Rows.Add(new Object[] { 9, 2, 1, 2, "wciecie borderAll", "I instancja" });
            dT.Rows.Add(new Object[] { 9, 3, 1, 1, "wciecie borderAll", "U" });
            dT.Rows.Add(new Object[] { 10, 3, 1, 1, "wciecie borderAll", "p" });
            dT.Rows.Add(new Object[] { 11, 2, 1, 4, "wciecie borderAll", "I instancja" });
            dT.Rows.Add(new Object[] { 11, 3, 1, 1, "wciecie borderAll", "Ua" });
            dT.Rows.Add(new Object[] { 12, 3, 1, 1, "wciecie borderAll", "Uz" });
            dT.Rows.Add(new Object[] { 13, 3, 1, 1, "wciecie borderAll", "Pa" });
            dT.Rows.Add(new Object[] { 14, 3, 1, 1, "wciecie borderAll", "Pz" });
            dT.Rows.Add(new Object[] { 15, 1, 1, 7, "wciecie borderAll", "Sędziowie SR delegowani do SO" });
            dT.Rows.Add(new Object[] { 15, 2, 2, 1, "wciecie borderAll", "ogółem (w. od 16 do 21)" });
            dT.Rows.Add(new Object[] { 16, 2, 1, 2, "wciecie borderAll", "I instancja" });
            dT.Rows.Add(new Object[] { 16, 3, 1, 1, "wciecie borderAll", "U" });
            dT.Rows.Add(new Object[] { 17, 3, 1, 1, "wciecie borderAll", "p" });
            dT.Rows.Add(new Object[] { 18, 2, 1, 4, "wciecie borderAll", "II instancja" });
            dT.Rows.Add(new Object[] { 18, 3, 1, 1, "wciecie borderAll", "Ua" });
            dT.Rows.Add(new Object[] { 19, 3, 1, 1, "wciecie borderAll", "Uz" });
            dT.Rows.Add(new Object[] { 20, 3, 1, 1, "wciecie borderAll", "Pa" });
            dT.Rows.Add(new Object[] { 21, 3, 1, 1, "wciecie borderAll", "Pz" });




            dT.Rows.Add(new Object[] { 4, 1, 1, 1, "wciecie borderAll", "Inne" });
            return dT;
        }

        #endregion dzial 1.4

        #region dzial 2.1.1

        private DataTable naglowekTabeliDzialu_2_1_1()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 2, 2, "center", "SPRAWY wg repertoriów / wykazów" });
            dT.Rows.Add(new Object[] { 1, 5, 11, 1, "center ", "Liczba spraw niezałatwionych pozostających od daty pierwszego wpływu do sądu" });

            dT.Rows.Add(new Object[] { 2, 3, 1, 1, "center col_120", "razem (kol.2+3)" });
            dT.Rows.Add(new Object[] { 2, 4, 1, 1, "center col_120", "do 3 miesięcy" });
            dT.Rows.Add(new Object[] { 2, 5, 1, 1, "center col_120", "Suma powyżej 3 miesięcy (kol. od 4 do 6)" });

            dT.Rows.Add(new Object[] { 2, 6, 1, 1, "center col_120", "powyżej 3 do 6" });
            dT.Rows.Add(new Object[] { 2, 7, 1, 1, "center col_120", "powyżej 6 do 12 miesięcy" });
            dT.Rows.Add(new Object[] { 2, 8, 1, 1, "center col_120", "suma powyżej 12 miesięcy (kol. od 7 do 11)" });
            dT.Rows.Add(new Object[] { 2, 9, 1, 1, "center col_120", "powyżej 12 miesięcy  do 2 lat" });
            dT.Rows.Add(new Object[] { 2, 10, 1, 1, "center col_120", "powyżej 2 do 3 lat" });
            dT.Rows.Add(new Object[] { 2, 11, 1, 1, "center col_120", "powyżej 3 do 5 lat" });
            dT.Rows.Add(new Object[] { 2, 12, 1, 1, "center col_120", "powyżej 5 do 8 lat" });
            dT.Rows.Add(new Object[] { 2, 13, 1, 1, "center col_120", "ponad 8 lat" });
            return dT;

        }

        private DataTable tabelaBocznaDzialu_2_1_1()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 2, 1, "wciecie borderAll", "OGÓŁEM " });
            dT.Rows.Add(new Object[] { 2, 1, 1, 8, "wciecie borderAll", "w tym" });
            dT.Rows.Add(new Object[] { 2, 2, 1, 1, "wciecie borderAll", "U  " });
            dT.Rows.Add(new Object[] { 3, 2, 1, 1, "wciecie borderAll", "U apelacyjne" });
            dT.Rows.Add(new Object[] { 4, 2, 1, 1, "wciecie borderAll", "Uz (zażaleniowe)" });
            dT.Rows.Add(new Object[] { 5, 2, 1, 1, "wciecie borderAll", "Uo" });
            dT.Rows.Add(new Object[] { 6, 2, 1, 1, "wciecie borderAll", "P" });
            dT.Rows.Add(new Object[] { 7, 2, 1, 1, "wciecie borderAll", "Np" });
            dT.Rows.Add(new Object[] { 8, 2, 1, 1, "wciecie borderAll", "Pa (apelacyjne)" });
            dT.Rows.Add(new Object[] { 9, 2, 1, 1, "wciecie borderAll", "Pz (zażaleniowe)" });
            return dT;
        }

        #endregion dzial 2.2.1
        #region dzial 2.1.1.1

        private DataTable naglowekTabeliDzialu_2_1_1_1()
        {

            return naglowekTabeliDzialu_2_1_1();

        }

        private DataTable tabelaBocznaDzialu_2_1_1_1()
        {

            return tabelaBocznaDzialu_2_1_1();
        }

        #endregion dzial 2.2.1.1
        #region dzial 2.1.1.a

        private DataTable naglowekTabeliDzialu_2_1_1_1_a()
        {

            return naglowekTabeliDzialu_2_1_1();

        }

        private DataTable tabelaBocznaDzialu_2_1_1_1_a()
        {

            return tabelaBocznaDzialu_2_1_1();
        }

        #endregion dzial 2.2.1.1
        #region dzial 2.1.1.a.1

        private DataTable naglowekTabeliDzialu_2_1_1_1_a_1()
        {

            return naglowekTabeliDzialu_2_1_1();

        }

        private DataTable tabelaBocznaDzialu_2_1_1_1_a_1()
        {

            return tabelaBocznaDzialu_2_1_1();
        }

        #endregion dzial 2.2.1.1.a.1
        #region dzial 2.1.2.1

        private DataTable naglowekTabeliDzialu_2_1_2_1()
        {

            return naglowekTabeliDzialu_2_1_1();

        }

        private DataTable tabelaBocznaDzialu_2_1_2_1()
        {

            return tabelaBocznaDzialu_2_1_1();
        }

        #endregion dzial 2.1.2




        #endregion dane do tabeli
    }
}