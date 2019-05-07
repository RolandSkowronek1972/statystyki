using System;
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
                tabelaGlowna.AppendLine(tworztabeleMSS("1", naglowekTabeliDzialu_1(), tabelaBocznaDzialu_1(), tabelaDanych, 1, 1, 1, 4, idWydzialuNumerycznie, false, "Ewidencja spraw z zakresu prawa pracy i ubezpieczeń społecznych – ogółem I i II instancja"));
                tabelaGlowna.AppendLine(tworztabeleMSS("1.1.1.1", naglowekTabeliDzialu_1_1_1_1(), tabelaBocznaDzialu_1_1_1_1(), tabelaDanych, 4, 42, 4, 16, idWydzialuNumerycznie, true, "Ewidencja spraw z zakresu ubezpieczeń społecznych – ogółem oraz I instancja"));
                tabelaGlowna.AppendLine(tworztabeleMSS("1.1.1.2", naglowekTabeliDzialu_1_1_1_2(), tabelaBocznaDzialu_1_1_1_2(), tabelaDanych, 4, 19, 2, 16, idWydzialuNumerycznie, true, "Ewidencja spraw z zakresu ubezpieczeń społecznych – II instancja"));
                tabelaGlowna.AppendLine(tworztabeleMSS("1.1.a", naglowekTabeliDzialu_1_1_a(), tabelaBocznaDzialu_1_1_a(), tabelaDanych, 1, 7, 2, 1, idWydzialuNumerycznie, false, "Ewidencja spraw z zakresu ubezpieczeń społecznych – II instancja"));
                tabelaGlowna.AppendLine(tworztabeleMSS("1.1.b", naglowekTabeliDzialu_1_1_b(), tabelaBocznaDzialu_1_1_b(), tabelaDanych, 1, 3, 1, 4, idWydzialuNumerycznie, false, "Zażalenia w ramach właściwości poziomej (dotyczy dz. 1.1.1.2, w. 2 i 15 lit. b)"));
                tabelaGlowna.AppendLine(tworztabeleMSS("1.1.c", naglowekTabeliDzialu_1_1_c(), tabelaBocznaDzialu_1_1_c(), tabelaDanych, 1, 9, 2, 1, idWydzialuNumerycznie, false, "W tym: (skarga kasacyjna) (dział 1.1.1.2. wiersz 17 kol. 3 lit. c)"));
                tabelaGlowna.AppendLine(tworztabeleMSS("1.1.d", naglowekTabeliDzialu_1_1_d(), tabelaBocznaDzialu_1_1_d(), tabelaDanych, 4, 10, 1, 15, idWydzialuNumerycznie, false, "Ewidencja spraw z zakresu ubezpieczeń społecznych – wg podmiotów"));
                tabelaGlowna.AppendLine(tworztabeleMSS("1.1.d", naglowekTabeliDzialu_1_1_d(), tabelaBocznaDzialu_1_1_d(), tabelaDanych, 4, 10, 1, 15, idWydzialuNumerycznie, false, "Ewidencja spraw z zakresu ubezpieczeń społecznych – wg podmiotów"));
                tabelaGlowna.AppendLine(tworztabeleMSS("1.1.2.1", naglowekTabeliDzialu_1_1_2_1(), tabelaBocznaDzialu_1_1_2_1(), tabelaDanych, 5, 85, 4, 15, idWydzialuNumerycznie, true, "Ewidencja spraw z zakresu prawa pracy –ogółem oraz I instancja"));


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

        protected string tworztabeleMSS(string idTabeli, DataTable naglowek, DataTable tabelaPrzedIteracja, DataTable dane, int iloscWierszyNaglowka, int iloscWierszyTabeli, int iloscKolumnPrzedIteracja, int iloscKolumnPoIteracji, int idWydzialu, bool lp, string tekstNadTabela)
        {
            StringBuilder kodStony = new StringBuilder();
            string ciagWyjsciowy = string.Empty;
            kodStony.AppendLine("<table style='width:100%'>");
            //naglowek
            DataTable header = naglowek;

            for (int i = 1; i < iloscWierszyNaglowka + 1; i++)
            {
                kodStony.AppendLine("<tr>");

                for (int j = 1; j < iloscKolumnPrzedIteracja + iloscKolumnPoIteracji + 1; j++)
                {
                    try
                    {
                        DataRow wiersz = wyciagnijWartosc(naglowek, " nrWiersza ='" + i.ToString() + "' and nrKolumny='" + j.ToString() + "'");
                        if (wiersz != null)
                        {
                            int colspan = int.Parse(wiersz["colspan"].ToString().Trim());
                            int rowspan = int.Parse(wiersz["rowspan"].ToString().Trim());

                            string style = wiersz["style"].ToString().Trim();
                            string tekst = wiersz["text"].ToString().Trim();
                            string sekcjaRowspan = string.Empty;
                            string sekcjaColspan = string.Empty;
                            string sekcjaStyle = string.Empty;

                            if (colspan > 0)
                            {
                                sekcjaColspan = "colspan ='" + colspan.ToString() + "' ";
                            }
                            if (rowspan > 0)
                            {
                                sekcjaRowspan = "rowspan ='" + rowspan.ToString() + "' ";
                            }
                            if (!string.IsNullOrEmpty(style))
                            {
                                sekcjaStyle = " " + style + " ";
                            }
                            //    if ((j == 1)&&(!lp))
                            //    {
                            //        sekcjaColspan = "colspan ='" + (colspan+1).ToString() + "' ";
                            //    }
                            kodStony.AppendLine("<td  class ='borderAll  " + sekcjaStyle + "'" + sekcjaColspan + sekcjaRowspan + ">" + tekst + "</td>");
                        }
                        //
                    }
                    catch (Exception ex)
                    {
                        cm.log.Error("MSS 11o LinqError: " + ex.Message);
                    }
                }
                kodStony.AppendLine("</tr>");
            }
            kodStony.AppendLine("<tr>");

            //rozdzielenie
            for (int j = 0; j < iloscKolumnPoIteracji + 1; j++)
            {
                if ((j == 0) && (!lp))
                {
                    kodStony.AppendLine("<td  class='borderAll center' colspan='" + (iloscKolumnPrzedIteracja + 1) + "'>" + j.ToString() + "</td>");
                }
                else
                {
                    kodStony.AppendLine("<td  class='borderAll center' >" + j.ToString() + "</td>");
                }
            }
            //tabela główna
            for (int i = 1; i < iloscWierszyTabeli + 1; i++)
            {
                kodStony.AppendLine("<tr>");

                for (int j = 1; j < iloscKolumnPrzedIteracja + 1; j++)
                {
                    try
                    {
                        DataRow wiersz = wyciagnijWartosc(tabelaPrzedIteracja, " nrWiersza ='" + i.ToString() + "' and nrKolumny='" + j.ToString() + "'");
                        if (wiersz != null)
                        {
                            int colspan = int.Parse(wiersz["colspan"].ToString().Trim());
                            int rowspan = int.Parse(wiersz["rowspan"].ToString().Trim());

                            string style = wiersz["style"].ToString().Trim();
                            string tekst = wiersz["text"].ToString().Trim();
                            string sekcjaRowspan = string.Empty;
                            string sekcjaColspan = string.Empty;
                            string sekcjaStyle = string.Empty;

                            if (colspan > 0)
                            {
                                sekcjaColspan = "colspan ='" + colspan.ToString() + "' ";
                            }
                            if (rowspan > 0)
                            {
                                sekcjaRowspan = "rowspan ='" + rowspan.ToString() + "' ";
                            }
                            if (!string.IsNullOrEmpty(style))
                            {
                                sekcjaStyle = " " + style + " ";
                            }
                            kodStony.AppendLine("<td  class ='borderAll  " + sekcjaStyle + "'" + sekcjaColspan + sekcjaRowspan + ">" + tekst + "</td>");
                        }
                    }
                    catch (Exception ex)
                    {
                        cm.log.Error("MSS 11o LinqError: " + ex.Message);
                    }
                }
                kodStony.AppendLine("<td class='center borderAll col_26'>" + i.ToString() + "</td>");
                for (int j = 1; j < iloscKolumnPoIteracji + 1; j++)
                {
                    //     DataRow wiersz = wyciagnijWartosc(naglowek, " nrWiersza ='" + i.ToString() + "' and nrKolumny='" + j.ToString() + "'");
                    string txt = dr.wyciagnijWartosc(dane, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza ='" + i.ToString() + "' and idkolumny='" + j.ToString() + "'", tenPlik);
                    string txt2 = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + i.ToString().ToString() + "!" + idTabeli + "!" + j.ToString() + "!2')\">" + txt + " </a>";
                    kodStony.AppendLine("<td class='center borderAll'>" + txt2 + "</td>");
                }
                kodStony.AppendLine("</tr>");
            }
            kodStony.AppendLine("</tr>");

            kodStony.AppendLine("<\table>");

            return kodStony.ToString();
        }

        private DataRow wyciagnijWartosc(DataTable ddT, string selectString)
        {
            DataRow result = null;
            try
            {
                DataRow[] foundRows;
                foundRows = ddT.Select(selectString);
                if (foundRows.Count() != 0)
                {
                    DataRow dr = foundRows[0];
                    result = dr;
                }
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " - wyciagnij wartosc -  " + ex.Message);
            }
            return result;
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
            dT.Rows.Add(new Object[] { 36, 1, 3, 1, "wciecie borderAll", "kobiet" });
            dT.Rows.Add(new Object[] { 36, 4, 1, 1, " center", "458dk" });
            dT.Rows.Add(new Object[] { 37, 1, 3, 1, "wciecie borderAll", "mężczyzn" });
            dT.Rows.Add(new Object[] { 37, 4, 1, 1, " center", "458m" });

            dT.Rows.Add(new Object[] { 38, 1, 2, 2, "wciecie borderAll", "O odszkodowanie w związku z  molestowaniem seksualnym, jako jedną z form dyskryminacji w miejscu pracy (art.183<sup>a</sup>§ 6 kp w zw. z art. 183<sup>d</sup> kp)" });
            dT.Rows.Add(new Object[] { 38, 1, 3, 1, "wciecie borderAll", "kobiet" });
            dT.Rows.Add(new Object[] { 38, 4, 1, 1, " center", "459dk" });
            dT.Rows.Add(new Object[] { 39, 1, 3, 1, "wciecie borderAll", "mężczyzn" });
            dT.Rows.Add(new Object[] { 39, 4, 1, 1, " center", "459dm" });

            dT.Rows.Add(new Object[] { 40, 1, 2, 2, "wciecie borderAll", "O zadośćuczynienie w związku z mobbingiem (art. 94<sup>3</sup>§3 kp) " });
            dT.Rows.Add(new Object[] { 40, 1, 3, 1, "wciecie borderAll", "kobiet" });
            dT.Rows.Add(new Object[] { 40, 4, 1, 1, " center", "462dk" });
            dT.Rows.Add(new Object[] { 41, 1, 3, 1, "wciecie borderAll", "mężczyzn" });
            dT.Rows.Add(new Object[] { 41, 4, 1, 1, " center", "462dm" });

            dT.Rows.Add(new Object[] { 42, 1, 2, 2, "wciecie borderAll", "O odszkodowanie  w związku z mobbingiem (art. 94<sup>3</sup>§3 kp) " });
            dT.Rows.Add(new Object[] { 42, 1, 3, 1, "wciecie borderAll", "kobiet" });
            dT.Rows.Add(new Object[] { 42, 4, 1, 1, " center", "463dk" });
            dT.Rows.Add(new Object[] { 43, 1, 3, 1, "wciecie borderAll", "mężczyzn" });
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
            dT.Rows.Add(new Object[] { 72, 4, 1, 1, " center", "104" });
            dT.Rows.Add(new Object[] { 73, 1, 3, 1, "wciecie borderAll", "O zwolnienie od kosztów sądowych i/lub ustanowienie radcy prawnego, adwokata" });
            dT.Rows.Add(new Object[] { 73, 4, 1, 1, " center", "105" });
            dT.Rows.Add(new Object[] { 74, 1, 3, 1, "wciecie borderAll", "Uznanie orzeczenia sądu zagranicznego" });
            dT.Rows.Add(new Object[] { 74, 4, 1, 1, " center", "107" });
            dT.Rows.Add(new Object[] { 75, 1, 3, 1, "wciecie borderAll", "O wyznaczenie sądu" });
            dT.Rows.Add(new Object[] { 75, 4, 1, 1, " center", "108" });
            dT.Rows.Add(new Object[] { 76, 1, 3, 1, "wciecie borderAll", "O wyłączenie sędziego" });
            dT.Rows.Add(new Object[] { 76, 4, 1, 1, " center", "109" });
            dT.Rows.Add(new Object[] { 77, 1, 3, 1, "wciecie borderAll", "O odtworzenie akt " });
            dT.Rows.Add(new Object[] { 77, 4, 1, 1, " center", "111" });
            dT.Rows.Add(new Object[] { 78, 1, 3, 1, "wciecie borderAll", "O uznanie i stwierdzenie wykonalności wyroku sądu polubownego wydanego za granicą " });
            dT.Rows.Add(new Object[] { 78, 4, 1, 1, " center", "113" });
            dT.Rows.Add(new Object[] { 79, 1, 3, 1, "wciecie borderAll", "Dotyczące pomocy sądowej" });
            dT.Rows.Add(new Object[] { 79, 4, 1, 1, " center", "135" });
            dT.Rows.Add(new Object[] { 80, 1, 3, 1, "wciecie borderAll", "O zabezpieczenie roszczenia przed wszczęciem postępowania" });
            dT.Rows.Add(new Object[] { 80, 4, 1, 1, " center", "136" });
            dT.Rows.Add(new Object[] { 81, 1, 3, 1, "wciecie borderAll", "O zabezpieczenie dowodu przed wszczęciem postępowania" });
            dT.Rows.Add(new Object[] { 81, 4, 1, 1, " center", "138a" });

            dT.Rows.Add(new Object[] { 82, 1, 3, 1, "wciecie borderAll", "W sprawie odmowy rejestracji ponadzakładowego układu zbiorowego pracy " });
            dT.Rows.Add(new Object[] { 82, 4, 1, 1, " center", "114a" });

            dT.Rows.Add(new Object[] { 83, 1, 3, 1, "wciecie borderAll", "Inne bez symbolu i o symbolu wyżej niewymienionym" });
            dT.Rows.Add(new Object[] { 83, 4, 1, 1, " center", "-" });
            dT.Rows.Add(new Object[] { 84, 1, 3, 1, "wciecie borderAll", "Wykaz Kas-z wnioski o rozstrzygnięcie sporu zakładowego przez kolegium arbitrażu społecznego" });
            dT.Rows.Add(new Object[] { 84, 4, 1, 1, " center", "-" });
            dT.Rows.Add(new Object[] { 85, 1, 3, 1, "wciecie borderAll", "WSC skarga o stwierdzenie niezgodności z prawem – I inst." });
            dT.Rows.Add(new Object[] { 85, 4, 1, 1, " center", "-" });

            return dT;
        }

        #endregion dzial 1.1.2.1

        #endregion dane do tabeli
    }
}