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

        protected void Page_Load(object sender, EventArgs e)
        {
            string idWydzial = "1"; //Request.QueryString["w"];
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
            if (Session["ustawDate15o"] == null)
            {
                Date1.Date = DateTime.Parse(datyMSS.DataPoczatkowa());
                Date2.Date = DateTime.Parse(datyMSS.DataKoncowa());
                Session["ustawDate15o"] = "X";
            }
            Session["data_1"] = Date1.Date.ToShortDateString();
            Session["data_2"] = Date1.Date.ToShortDateString();
            przemiel();
            makeLabels();
        }// end of Page_Load

        protected void pisz(string Template, int iloscWierszy, int iloscKolumn, DataTable dane, string idTabeli, string idWydzialu)
        {
            for (int wiersz = 1; wiersz <= iloscWierszy; wiersz++)
            {
                for (int kolumna = 1; kolumna <= iloscKolumn; kolumna++)
                {
                    string controlName = Template + "w" + wiersz.ToString("D2") + "_c" + kolumna.ToString("D2");
                    var cos = this.Master.FindControl("ContentPlaceHolder1");
                    Label tb = (Label)this.Master.FindControl("ContentPlaceHolder1").FindControl(controlName);
                    if (tb != null)
                    {
                        //string wartosc= dr.wyciagnijWartosc(dane, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza ='" + wiersz + "' and idkolumny='" + kolumna + "'", tenPlik);
                        tb.Text = dr.wyciagnijWartosc(dane, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza ='" + wiersz + "' and idkolumny='" + kolumna + "'", tenPlik);
                    }
                }
            }
        }// end of pisz

        protected void przemiel()
        {
            try
            {
                DateTime dTime = DateTime.Now;
                dTime = dTime.AddMonths(-1);
                if (Date1.Text.Length == 0)
                {
                    Date1.Text = dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-01";
                }
                if (Date2.Text.Length == 0)
                {
                    Date2.Text = dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-" + DateTime.DaysInMonth(dTime.Year, dTime.Month).ToString("D2");
                }

                Session["data_1"] = Date1.Text.Trim();
                Session["data_2"] = Date2.Text.Trim();
            }
            catch
            { }
            string idWydzialu = "'" + (string)Session["id_dzialu"] + "'";
            id_dzialu.Text = (string)Session["txt_dzialu"];
            string txt = string.Empty; //

            try
            {
                string idTabeli = string.Empty;
                string idWiersza = string.Empty;

                DataTable tabelaDanych = ms.generuj_dane_do_tabeli_mss2(int.Parse((string)Session["id_dzialu"]), Date1.Date, Date2.Date, 21);
                //wypełnianie lebeli

                Label tblControl = new Label { ID = "kod01" };
                tblControl.Width = 1150;
                //naglowekTabeliDzialu_1
                StringBuilder tabelaGlowna = new StringBuilder();
                tabelaGlowna.AppendLine(tworztabeleMSS("'1'", naglowekTabeliDzialu_1(), tabelaBocznaDzialu_1(), tabelaDanych, 1, 1, 1, 4,1,false, "Ewidencja spraw z zakresu prawa pracy i ubezpieczeń społecznych – ogółem I i II instancja"));
                tabelaGlowna.AppendLine(tworztabeleMSS("'1.1.a'", naglowekTabeliDzialu_1_1_1_1(), tabelaBocznaDzialu_1_1_1_1(), tabelaDanych, 1, 9, 2, 1,1,true, "Ewidencja spraw z zakresu ubezpieczeń społecznych – ogółem oraz I instancja"));

                tblControl.Text = tabelaGlowna.ToString();
                tablePlaceHolder.Controls.Add(tblControl);
            }
            catch (Exception ex)
            {
                cm.log.Error("MSS 11o Error: " + ex.Message);
            }

            // dopasowanie opisów
            makeLabels();

            Label11.Visible = false;
            try
            {
                Label11.Visible = ms.debug(int.Parse(idWydzialu));
            }
            catch
            { }

            Label11.Text = txt;
        }

        protected void makeLabels()
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

                id_dzialu.Text = (string)Session["txt_dzialu"];
                Label28.Text = cl.podajUzytkownika(User_id, domain);
                //Label29.Text = DateTime.Now.ToLongDateString();
                try
                {
                    Label30.Text = System.IO.File.ReadAllText(Server.MapPath(@"~//version.txt")).ToString().Trim();
                }
                catch
                { }

                string strMonthName = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(Date2.Date.Month);
                int last_day = DateTime.DaysInMonth(Date2.Date.Year, Date2.Date.Month);
                if (((Date1.Date.Day == 1) && (Date2.Date.Day == last_day)) && ((Date1.Date.Month == Date2.Date.Month)))
                {
                    // cały miesiąc
                    //       tabela1Label.Text = "Dział 1.1.1.a.1 Liczba spraw o umieszczenie w szpitalu psychiatrycznym bez zgody, w którym natąpiło przekroczenie terminu 14 dni od dnia wpływu wniosku lub zawiadomienia o przyjęciu do szpitala psychiatrycznego osoby chorej psychicznie lub z zaburzeniami psychicznymi wymaganego w celu odbycia rozprawy [art. 45 ust. 1 ustawy z dnia 19 sierpnia 1994 r. o ochronie zdrowia psychicznego (Dz. U. z 2016 r., poz. 546 )] za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //      tabela2Label.Text = "Dział 1.1.1.a.2. Liczba spraw o umieszczenie w szpitalu psychiatrycznym bez zgody, w których wydano zarządzenie o doprowadzeniu osoby pozostającej w szpitalu, a której postępowanie bezpośrednio dotyczy na rozprawę, stosownie do możliwości przewidzianej w przepisie art. 46 ust. 1a ustawy z dnia 19 sierpnia 1994 r. o ochronie zdrowia psychicznego (Dz. U. z 2016 r., poz. 546) za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //    tabela3Label.Text = "Dział 4.1. Terminowość postępowania międzyinstancyjnego w pierwszej instancji za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //     tabela4Label.Text = "Dział 2.2.a. Czas trwania postępowania sądowego od dnia pierwszej rejestracji do dnia uprawomocnienia się sprawy merytorycznie zakończonej (wyrokiem, orzeczeniem) w I instancji (łącznie z czasem trwania mediacji) za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";

                    //   tabela5Label.Text = "Dział 11.1. Terminowość postępowania międzyinstancyjnego  w pierwszej instancji za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //Informacje o ruchu sprawa za miesiąc: 

                    //Pozostało z ubieglego miesiąca
                }
                else
                {
                    // tabela1Label.Text = "Dział 1.1.1.a.1 Liczba spraw o umieszczenie w szpitalu psychiatrycznym bez zgody, w którym natąpiło przekroczenie terminu 14 dni od dnia wpływu wniosku lub zawiadomienia o przyjęciu do szpitala psychiatrycznego osoby chorej psychicznie wymaganego w celu odbycia rozprawy [art. 45 ust. 1 ustawy z dnia 19 sierpnia 1994 r. o ochronie zdrowia psychicznego (Dz. U. z 2016 r., poz. 546 )] za okres od:  " + Date1.Text + " do  " + Date2.Text;
                    //       tabela2Label.Text = "Dział 1.1.1.a.2. Liczba spraw o umieszczenie w szpitalu psychiatrycznym bez zgody, w których wydano zarządzenie o doprowadzeniu osoby pozostającej w szpitalu, a której postępowanie bezpośrednio dotyczy na rozprawę, stosownie do możliwości przewidzianej w przepisie art. 46 ust. 1a ustawy z dnia 19 sierpnia 1994 r. o ochronie zdrowia psychicznego (Dz. U. z 2016 r., poz. 546) za okres od " + Date1.Text + " do  " + Date2.Text;
                    //     tabela3Label.Text = "Dział 4.1. Terminowość postępowania międzyinstancyjnego w pierwszej instancji za okres od" + Date1.Text + " do  " + Date2.Text;

                    //   tabela4Label.Text = "Dział 2.2.a. Czas trwania postępowania sądowego od dnia pierwszej rejestracji do dnia uprawomocnienia się sprawy merytorycznie zakończonej (wyrokiem, orzeczeniem) w I instancji (łącznie z czasem trwania mediacji) za okres od " + Date1.Text + " do  " + Date2.Text;

                    // tabela5Label.Text = "Dział 11.1. Terminowość postępowania międzyinstancyjnego  w pierwszej instancji za okres od " + Date1.Text + " do  " + Date2.Text;
                }
            }
            catch
            {
            }
        }

        protected void LinkButton54_Click(object sender, EventArgs e)
        {
            przemiel();
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
                if ((j == 0)&&(!lp))
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
            //nrWiersza,nrKolumny",colspan""rowspan",style",text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 1, "center", "Wyszczególnienie " });
            dT.Rows.Add(new Object[] { 1, 2, 1, 1, "center", "L.p." });
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
                               //nrWiersza,nrKolumny",colspan""rowspan",style",text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 1, "wciecie borderAll", "Przekazanych Sądowi Najwyższemu ze skargą o stwierdzenie niezgodności z prawem " });
           
            return dT;
        }
        #endregion Dzial 1

        #region dzial 1.1.1.1

        private DataTable naglowekTabeliDzialu_1_1_1_1()
        {
            //nrWiersza,nrKolumny",colspan""rowspan",style",text"
            DataTable dT = schematTabeli();

            dT.Clear();

            dT.Rows.Add(new Object[] { 1, 1, 2, 1, "center", "Wyszczególnienie " });
            dT.Rows.Add(new Object[] { 1, 2, 1, 1, "center", "Liczby spraw" });

            return dT;
        }

        private DataTable tabelaBocznaDzialu_1_1_1_1()
        {
            //nrWiersza,nrKolumny",colspan""rowspan",style",text"
            DataTable dT = schematTabeli();

            dT.Clear();

            dT.Rows.Add(new Object[] { 1, 1, 2, 1, "wciecie borderAll", "Przekazanych Sądowi Najwyższemu ze skargą o stwierdzenie niezgodności z prawem " });
            dT.Rows.Add(new Object[] { 2, 1, 2, 1, "wciecie borderAll", "Przesłanych z Sądu Najwyższego w okresie sprawozdawczym (w.02 =w. 03 do 07)" });
            dT.Rows.Add(new Object[] { 3, 1, 1, 5, "wciecie borderAll", "w których Sąd Najwyższy" });
            dT.Rows.Add(new Object[] { 3, 2, 1, 1, "wciecie borderAll", "odmówił przyjęcia skargi (art.424 9 kpc)" });

            dT.Rows.Add(new Object[] { 4, 2, 1, 1, "wciecie borderAll", "odrzucił skargę (art.4248 kpc) " });
            dT.Rows.Add(new Object[] { 5, 2, 1, 1, "wciecie borderAll", "oddalił skargę  (art.42411 §1 kpc) " });
            dT.Rows.Add(new Object[] { 6, 2, 1, 1, "wciecie borderAll", "uwzględnił skargę (art.42411 §2 kpc)" });
            dT.Rows.Add(new Object[] { 7, 2, 1, 1, "wciecie borderAll", "załatwił w inny sposób" });
            return dT;
        }

        #endregion dzial 1.1.1.1

        #endregion dane do tabeli
    }
}