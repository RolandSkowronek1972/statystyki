using System;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;

namespace stat2018
{
    public partial class mss16r : System.Web.UI.Page
    {
        public static string tenPlik = "mss16r.aspx";
        public Class1 cl = new Class1();
        public mss ms = new mss();
        public common cm = new common();
        public dataReaders dr = new dataReaders();
        public datyDoMSS datyMSS = new datyDoMSS();

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
                Server.Transfer("default.aspx");
                return;
            }
            if (!IsPostBack)
            {
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
            if (Session["ustawDate16r"] == null)
            {
                Date1.Date = DateTime.Parse(datyMSS.DataPoczatkowa());
                Date2.Date = DateTime.Parse(datyMSS.DataKoncowa());
                Session["ustawDate16r"] = "X";
            }
            Session["data_1"] = datyMSS.DataPoczatkowa();
            Session["data_2"] = datyMSS.DataKoncowa();
            if (Date1.Text.Length == 0) Date1.Date = DateTime.Parse(datyMSS.DataPoczatkowa());
            if (Date2.Text.Length == 0) Date2.Date = DateTime.Parse(datyMSS.DataKoncowa());

            odswiez();
            makeLabels();
        }// end of Page_Load

        protected string tworztabeleMSS(string idTabeli, DataTable naglowek, DataTable tabelaPrzedIteracja, DataTable dane, int iloscWierszyNaglowka, int iloscWierszyTabeli, int iloscKolumnPrzedIteracja, int iloscKolumnPoIteracji, int idWydzialu, bool lp, string tekstNadTabela)
        {
            StringBuilder kodStony = new StringBuilder();
            string ciagWyjsciowy = string.Empty;
            kodStony.AppendLine("<table style='width:100%'>");
            //naglowek
            cm.log.Info("MSS 16r iloscWierszyNaglowka: " + iloscWierszyNaglowka.ToString());

            DataTable header = naglowek;
            try
            {
                for (int i = 1; i < iloscWierszyNaglowka + 1; i++)
                {
                    kodStony.AppendLine("<tr>");
                    cm.log.Info("MSS 16r naglowek: " + i.ToString());
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

                                kodStony.AppendLine("<td  class ='borderAll  " + sekcjaStyle + "'" + sekcjaColspan + sekcjaRowspan + ">" + tekst + "</td>");
                            }
                        }
                        catch (Exception ex)
                        {
                            cm.log.Error("MSS 16r LinqError: " + ex.Message);
                        }
                    }
                    kodStony.AppendLine("</tr>");
                }
                kodStony.AppendLine("<tr>");
            }
            catch (Exception ex)
            {
                cm.log.Error("MSS 16r tworzenie naglówka: " + ex.Message);
            }
            //rozdzielenie
            try
            {
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
            }
            catch (Exception ex)
            {
                cm.log.Error("MSS 16r Error: " + ex.Message);
            }

            //tabela główna
            try
            {
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
            }
            catch (Exception ex)
            {
                cm.log.Error("MSS 16r Error: " + ex.Message);
            }

            kodStony.AppendLine("</tr>");

            kodStony.AppendLine("<\table>");

            return kodStony.ToString();
        }

        protected void pisz(string Template, int iloscWierszy, int iloscKolumn, DataTable dane, string idTabeli, string idWydzialu)
        {
            for (int wiersz = 1; wiersz <= iloscWierszy; wiersz++)
            {
                for (int kolumna = 1; kolumna <= iloscKolumn; kolumna++)
                {
                    string controlName = Template + "w" + wiersz.ToString("D2") + "_c" + kolumna.ToString("D2");
                    Label tb = (Label)this.Master.FindControl("ContentPlaceHolder1").FindControl(controlName);
                    if (tb != null)
                    {
                        tb.Text = dr.wyciagnijWartosc(dane, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza ='" + wiersz + "' and idkolumny='" + kolumna + "'", tenPlik);
                    }
                }
            }
        }// end of pisz

        protected void odswiez()
        {
            string idWydzialu = "'" + (string)Session["id_dzialu"] + "'";
            int idWydzialuNumerycznie = int.Parse((string)Session["id_dzialu"]);
            id_dzialu.Text = (string)Session["txt_dzialu"];
            string txt = string.Empty; //

            try
            {
                cm.log.Info("mss16r start");
                string idTabeli = string.Empty;
                string idWiersza = string.Empty;

                DataTable tabela2 = ms.generuj_dane_do_tabeli_mss2(int.Parse((string)Session["id_dzialu"]), Date1.Date, Date2.Date, 21);

                string path = Server.MapPath("XMLHeaders") + "\\" + "MSS16r.xml";
                string[] numeryTabel00 = new string[] { "1", "1.1.1" };
                string[] numeryTabel01 = new string[] { "1.1.b", "1.1.c", "1.1.d", "1.1.e" };
                string[] numeryTabel02 = new string[] { "1.1.h", "1.1.i", "1.1.j" };
                string[] numeryTabel03 = new string[] { "1.1.2.a", "1.1.2.b", "1.2.1", "1.2.2", "1.3.1", "1.4", "2.1.1", "2.1.1.1", "2.1.1.a", "2.1.1.a.1", "2.1.2", "2.1.2.1", "2.2", "2.2.a", "2.2.1", "2.2.1.a", "2.3", "2.3.1", "3", "4.1", "4.2", "5", "5.1", "5.2", "6" };
                string[] numeryTabel05 = new string[] { "7.3" };
                //tablePlaceHolder01.Controls.Add(new Label { Text = ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1", tabelaDanych, tenPlik), Width = 1150, ID = "extraCode01" });
              ms.  TworzTabelizListy(numeryTabel00, tablePlaceHolder01, path, tabela2, idWydzialuNumerycznie,tenPlik);
              //  TworzTabelizListy(numeryTabel01, tablePlaceHolder02, path, tabelaDanych);
              //  TworzTabelizListy(numeryTabel02, tablePlaceHolder03, path, tabelaDanych);
             //   TworzTabelizListy(numeryTabel03, tablePlaceHolder04, path, tabelaDanych);
                //wypełnianie lebeli
                if (tabela2==null)
                {
                    cm.log.Error(tenPlik+" brak danych w tabeli");
                    return;
                }
                #region "tabela 1.1.1.a"

                //tab_111a_
                idTabeli = "'1.1.1.a'";
                idWiersza = "'1'";
                tab_111a_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza='1' and idkolumny='1'", tenPlik);
                idWiersza = "'2'";
                tab_111a_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza='2' and idkolumny='1'", tenPlik);

                #endregion "tabela 1.1.1.a"

                #region "tabela 1.1.1.a.1"

                idTabeli = "'1.1.1.a.1'";
                idWiersza = "'1'";
                //   tab_111a1_w01_col01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                #endregion "tabela 1.1.1.a.1"

                #region "tabela 1.1.a.1"

                pisz("tab_111a1_", 1, 6, tabela2, "'1.1.1.a.1'", idWydzialu);

                #endregion "tabela 1.1.a.1"

                #region "tabela 1.1.1.a.2"

                idTabeli = "'1.1.1.a.2'";
                idWiersza = "'1'";
                tab_111a2_w01_col01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                #endregion "tabela 1.1.1.a.2"

                #region "1.1.1.a.1";

                pisz("tab_111a1_", 1, 6, tabela2, "'1.1.1.a.1'", idWydzialu);

                #endregion "1.1.1.a.1";

                #region "tabela 1.1.1.b"

                idTabeli = "'1.1.1.b'";
                idWiersza = "'1'";
                tab_111b_w01_col01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                #endregion "tabela 1.1.1.b"

                #region "tabela 1.1.1.c"

                idTabeli = "'1.1.1.c'";
                idWiersza = "'1'";
                tab_111c_w01_col01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                #endregion "tabela 1.1.1.c"

                #region "1.1.1.d";

                pisz("tab_111d_", 17, 3, tabela2, "'1.1.1.d'", idWydzialu);

                #endregion "1.1.1.d";

                #region "1.1.1.e";

                pisz("tab_111e_", 9, 2, tabela2, "'1.1.1.e'", idWydzialu);

                #endregion "1.1.1.e";

                #region "1.1.1.f";

                idTabeli = "'1.1.1.f'";
                idWiersza = "'1'";
                tab_111f_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'2'";
                tab_111f_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'3'";
                tab_111f_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'4'";
                tab_111f_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'5'";
                tab_111f_w05_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'6'";
                tab_111f_w06_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                #endregion "1.1.1.f";

                #region "1.1.1.g";

                idTabeli = "'1.1.1.g'";
                idWiersza = "'1'";
                tab_111g_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_111g_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                idWiersza = "'2'";
                tab_111g_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_111g_w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                idWiersza = "'3'";
                tab_111g_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_111g_w03_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                idWiersza = "'4'";
                tab_111g_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_111g_w04_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                idWiersza = "'5'";
                tab_111g_w05_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_111g_w05_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                idWiersza = "'6'";
                tab_111g_w06_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_111g_w06_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                idWiersza = "'7'";
                tab_111g_w07_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_111g_w07_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                idWiersza = "'8'";
                tab_111g_w08_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_111g_w08_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                idWiersza = "'9'";
                tab_111g_w09_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_111g_w09_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                idWiersza = "'10'";
                tab_111g_w10_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_111g_w10_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                idWiersza = "'11'";
                tab_111g_w11_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_111g_w11_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                idWiersza = "'12'";
                tab_111g_w12_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_111g_w12_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                idWiersza = "'13'";
                tab_111g_w13_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_111g_w13_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);

                #endregion "1.1.1.g";

                #region "1.1.1.g";

                idTabeli = "'1.1.1.g.1'";
                idWiersza = "'1'";

                tab_111g1_w01_col01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'2'";
                tab_111g1_w02_col01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                #endregion "1.1.1.g";

                #region "tabela 1.1.1.h"

                idTabeli = "'1.1.1.h'";

                //wiersz 1
                tab_111h1_w01_col01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza ='1' and idkolumny='1'", tenPlik);

                #endregion "tabela 1.1.1.h"

                #region "tabela 1.1.1.i"

                //wiersz 1
                idTabeli = "'1.1.1.i'";
                tab_111i_w01_col01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza ='1' and idkolumny='1'", tenPlik);

                #endregion "tabela 1.1.1.i"

                #region "tabela 1.1.1.j"

                //wiersz 1
                idTabeli = "'1.1.1.j'";
                tab_111j_w01_col01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza ='1' and idkolumny='1'", tenPlik);

                #endregion "tabela 1.1.1.j"

                #region "1.1.2";

                idTabeli = "'1.1.2'";
                idWiersza = "'1'";
                tab_112_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_112_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_112_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_112_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_112_w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_112_w01_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                idWiersza = "'2'";
                tab_112_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_112_w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_112_w02_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_112_w02_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_112_w02_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_112_w02_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                idWiersza = "'3'";
                tab_112_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_112_w03_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_112_w03_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_112_w03_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_112_w03_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_112_w03_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);

                #endregion "1.1.2";

                #region "1.1.2.a";

                idTabeli = "'1.1.2.a'";
                idWiersza = "'1'";
                tab_112a_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_112a_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_112a_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_112a_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_112a_w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_112a_w01_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_112a_w01_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_112a_w01_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);

                #endregion "1.1.2.a";

                #region "'1.1.2.b'";

                idTabeli = "'1.1.2.b'";
                idWiersza = "'1'";

                tab_112b_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'2'";
                tab_112b_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'3'";
                tab_112b_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'4'";
                tab_112b_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'5'";
                tab_112b_w05_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'6'";
                tab_112b_w06_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'7'";
                tab_112b_w07_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'8'";
                tab_112b_w08_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'9'";
                tab_112b_w09_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'10'";
                tab_112b_w10_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'11'";
                tab_112b_w11_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'12'";
                tab_112b_w12_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'13'";
                tab_112b_w13_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'14'";
                tab_112b_w14_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'15'";
                tab_112b_w15_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'16'";
                tab_112b_w16_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'17'";
                tab_112b_w17_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'18'";
                tab_112b_w18_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'19'";
                tab_112b_w19_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'20'";
                tab_112b_w20_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'21'";
                tab_112b_w21_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'22'";
                tab_112b_w22_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'23'";
                tab_112b_w23_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'24'";
                tab_112b_w24_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                #endregion "'1.1.2.b'";

                #region "1.1.2.c";

                idTabeli = "'1.1.2.c'";
                idWiersza = "'1'";
                tab_112c_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_112c_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_112c_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                idWiersza = "'2'";
                tab_112c_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_112c_w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_112c_w02_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                idWiersza = "'3'";
                tab_112c_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_112c_w03_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_112c_w03_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                idWiersza = "'4'";
                tab_112c_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_112c_w04_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_112c_w04_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                idWiersza = "'5'";
                tab_112c_w05_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_112c_w05_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_112c_w05_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                idWiersza = "'6'";
                tab_112c_w06_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_112c_w06_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_112c_w06_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                idWiersza = "'7'";
                tab_112c_w07_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_112c_w07_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_112c_w07_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                idWiersza = "'8'";
                tab_112c_w08_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_112c_w08_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_112c_w08_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                idWiersza = "'9'";
                tab_112c_w09_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_112c_w09_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_112c_w09_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                idWiersza = "'10'";
                tab_112c_w10_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_112c_w10_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_112c_w10_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                idWiersza = "'11'";
                tab_112c_w11_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_112c_w11_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_112c_w11_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                idWiersza = "'12'";
                tab_112c_w12_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_112c_w12_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_112c_w12_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                idWiersza = "'13'";
                tab_112c_w13_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_112c_w13_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_112c_w13_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                idWiersza = "'14'";
                tab_112c_w14_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_112c_w14_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_112c_w14_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                idWiersza = "'15'";
                tab_112c_w15_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_112c_w15_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_112c_w15_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                idWiersza = "'16'";
                tab_112c_w16_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_112c_w16_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_112c_w16_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                idWiersza = "'17'";
                tab_112c_w17_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_112c_w17_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_112c_w17_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                idWiersza = "'18'";
                tab_112c_w18_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_112c_w18_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_112c_w18_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                idWiersza = "'19'";
                tab_112c_w19_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_112c_w19_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_112c_w19_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                idWiersza = "'20'";
                tab_112c_w20_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_112c_w20_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_112c_w20_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                idWiersza = "'21'";
                tab_112c_w21_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_112c_w21_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_112c_w21_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                idWiersza = "'22'";
                tab_112c_w22_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_112c_w22_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_112c_w22_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                idWiersza = "'23'";
                tab_112c_w23_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_112c_w23_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_112c_w23_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                idWiersza = "'24'";
                tab_112c_w24_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_112c_w24_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_112c_w24_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                idWiersza = "'25'";
                tab_112c_w25_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_112c_w25_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_112c_w25_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                idWiersza = "'26'";
                tab_112c_w26_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_112c_w26_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_112c_w26_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                idWiersza = "'27'";
                tab_112c_w27_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_112c_w27_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_112c_w27_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                idWiersza = "'28'";
                tab_112c_w28_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_112c_w28_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_112c_w28_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                idWiersza = "'29'";
                tab_112c_w29_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_112c_w29_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_112c_w29_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                idWiersza = "'30'";
                tab_112c_w30_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_112c_w30_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_112c_w30_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                idWiersza = "'31'";
                tab_112c_w31_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_112c_w31_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_112c_w31_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                idWiersza = "'32'";
                tab_112c_w32_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_112c_w32_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_112c_w32_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                idWiersza = "'33'";
                tab_112c_w33_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_112c_w33_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_112c_w33_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                idWiersza = "'34'";
                tab_112c_w34_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_112c_w34_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_112c_w34_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                idWiersza = "'35'";
                tab_112c_w35_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_112c_w35_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_112c_w35_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                idWiersza = "'36'";
                tab_112c_w36_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_112c_w36_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_112c_w36_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                idWiersza = "'37'";
                tab_112c_w37_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_112c_w37_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_112c_w37_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);

                #endregion "1.1.2.c";

                #region "1.1.3";

                pisz("tab_113_", 6, 1, tabela2, "'1.1.3'", idWydzialu);

                #endregion "1.1.3";

                #region "1.1.4";

                pisz("tab_1_1_4_", 3, 1, tabela2, "'1.1.4'", idWydzialu);

                #endregion "1.1.4";

                #region "1.1.5";

                pisz("tab_115_", 3, 1, tabela2, "'1.1.5'", idWydzialu);

                #endregion "1.1.5";

                #region "1.1.6";

                idWiersza = "'1'";
                pisz("tab_1_1_6_", 9, 1, tabela2, "'1.1.6'", idWydzialu);

                #endregion "1.1.6";

                #region "1.1.7";

                pisz("tab_1_1_7_", 14, 5, tabela2, "'1.1.7'", idWydzialu);

                #endregion "1.1.7";

                #region "1.1.7.a";
                pisz("tab_117a_", 5, 15, tabela2, "'1.1.7.a'", idWydzialu);

                #endregion "1.1.7.a";

                #region "1.1.7.b";

                pisz("tab_1_1_7_b_", 7, 12, tabela2, "'1.1.7.b'", idWydzialu);

                #endregion "1.1.7.b";

                #region "1.1.7.c";

                pisz("tab_117c_", 1, 5, tabela2, "'1.1.7.c'", idWydzialu);

                #endregion "1.1.7.c";

                #region "1.1.8";

                idTabeli = "'1.1.8'";
                idWiersza = "'1'";
                tab_1_1_1_8_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'2'";
                tab_1_1_1_8_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'3'";
                tab_1_1_1_8_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'4'";
                tab_1_1_1_8_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'5'";
                tab_1_1_1_8_w05_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'6'";
                tab_1_1_1_8_w06_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                #endregion "1.1.8";

                #region "1.1.9";
               
                pisz("tab_1_1_9_", 5, 5, tabela2, "'1.1.9'", idWydzialu);
                
                #endregion "1.1.9";

                #region "1.1.10";
               
                pisz("tab_1110_", 4, 3, tabela2, "'1.1.10'", idWydzialu);

                #endregion "1.1.10";

                #region "1.2.a";

                pisz("tab_12a_", 22, 7, tabela2, "'1.2.a'", idWydzialu);

                #endregion "1.2.a";

                #region "1.2.b";

                pisz("tab_12b_", 24, 7, tabela2, "'1.2.b'", idWydzialu);

                #endregion "1.2.b";

                #region "1.2.c";

                pisz("tab_12c_", 4, 3, tabela2, "'1.2.c'", idWydzialu);

                #endregion "1.2.c";

                #region "1.2.1"

                pisz("tab_121_", 10, 28, tabela2, "'1.2.1'", idWydzialu);

                #endregion "1.2.1"

                #region "1.2.2";

                Label tblControl = new Label { ID = "kod01" };
                tblControl.Width = 1150;
                StringBuilder tabelaGlowna = new StringBuilder();
                tabelaGlowna.Clear();
                tabelaGlowna.AppendLine(ms.tworztabeleMSS("1.2.2", naglowekTabeliDzialu_1_2_2(), tabelaBocznaDzialu_1_2_2(), tabela2, 3, 25,2 , 28, idWydzialuNumerycznie, false, "Liczba odbytych sesji i załatwionych spraw ", tenPlik));
                tblControl.Text = tabelaGlowna.ToString();
                tablePlaceHolder.Controls.Add(tblControl);

                #endregion "1.2.2";

                #region "1.3";
                //tab_1_3_
                idTabeli = "'1.3'";

                pisz("tab_1_3_", 3, 7, tabela2, "'1.3'", idWydzialu);


                #endregion "1.3";

                #region "1.4";

                idTabeli = "'1.4'";
                idWiersza = "'1'";
                tab_1_4_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_1_4_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_1_4_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_1_4_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_1_4_w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_1_4_w01_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_1_4_w01_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_1_4_w01_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_1_4_w01_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
                tab_1_4_w01_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
                tab_1_4_w01_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
                tab_1_4_w01_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);
                tab_1_4_w01_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'", tenPlik);
                tab_1_4_w01_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'", tenPlik);
                idWiersza = "'2'";
                tab_1_4_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_1_4_w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_1_4_w02_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_1_4_w02_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_1_4_w02_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_1_4_w02_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_1_4_w02_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_1_4_w02_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_1_4_w02_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
                tab_1_4_w02_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
                tab_1_4_w02_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
                tab_1_4_w02_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);
                tab_1_4_w02_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'", tenPlik);
                tab_1_4_w02_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'", tenPlik);
                idWiersza = "'3'";
                tab_1_4_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_1_4_w03_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_1_4_w03_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_1_4_w03_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_1_4_w03_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_1_4_w03_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_1_4_w03_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_1_4_w03_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_1_4_w03_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
                tab_1_4_w03_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
                tab_1_4_w03_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
                tab_1_4_w03_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);
                tab_1_4_w03_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'", tenPlik);
                tab_1_4_w03_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'", tenPlik);
                idWiersza = "'4'";
                tab_1_4_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_1_4_w04_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_1_4_w04_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_1_4_w04_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_1_4_w04_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_1_4_w04_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_1_4_w04_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_1_4_w04_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_1_4_w04_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
                tab_1_4_w04_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
                tab_1_4_w04_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
                tab_1_4_w04_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);
                tab_1_4_w04_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'", tenPlik);
                tab_1_4_w04_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'", tenPlik);
                idWiersza = "'5'";
                tab_1_4_w05_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_1_4_w05_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_1_4_w05_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_1_4_w05_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_1_4_w05_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_1_4_w05_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_1_4_w05_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_1_4_w05_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_1_4_w05_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
                tab_1_4_w05_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
                tab_1_4_w05_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
                tab_1_4_w05_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);
                tab_1_4_w05_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'", tenPlik);
                tab_1_4_w05_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'", tenPlik);

                #endregion "1.4";

                #region "2.1.1";

                idTabeli = "'2.1.1'";
                pisz("tab_2_1_1_", 5, 11, tabela2, "'2.1.1'", idWydzialu);

                #endregion "2.1.1";

                #region "2.1.1.1";

                idTabeli = "'2.1.1.1'";
                pisz("tab_2_1_1_1_", 5, 11, tabela2, "'2.1.1.1'", idWydzialu);

                #endregion "2.1.1.1";

                #region "2.1.1.a";

                idTabeli = "'2.1.1.a'";
                idWiersza = "'1'";
                tab_2_11_a_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_2_11_a_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_2_11_a_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_2_11_a_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_2_11_a_w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_2_11_a_w01_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_2_11_a_w01_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_2_11_a_w01_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_2_11_a_w01_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
                tab_2_11_a_w01_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
                tab_2_11_a_w01_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
                idWiersza = "'2'";
                tab_2_11_a_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_2_11_a_w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_2_11_a_w02_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_2_11_a_w02_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_2_11_a_w02_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_2_11_a_w02_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_2_11_a_w02_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_2_11_a_w02_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_2_11_a_w02_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
                tab_2_11_a_w02_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
                tab_2_11_a_w02_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
                idWiersza = "'3'";
                tab_2_11_a_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_2_11_a_w03_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_2_11_a_w03_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_2_11_a_w03_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_2_11_a_w03_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_2_11_a_w03_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_2_11_a_w03_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_2_11_a_w03_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_2_11_a_w03_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
                tab_2_11_a_w03_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
                tab_2_11_a_w03_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
                idWiersza = "'4'";
                tab_2_11_a_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_2_11_a_w04_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_2_11_a_w04_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_2_11_a_w04_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_2_11_a_w04_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_2_11_a_w04_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_2_11_a_w04_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_2_11_a_w04_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_2_11_a_w04_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
                tab_2_11_a_w04_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
                tab_2_11_a_w04_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
                idWiersza = "'5'";
                tab_2_11_a_w05_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_2_11_a_w05_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_2_11_a_w05_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_2_11_a_w05_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_2_11_a_w05_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_2_11_a_w05_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_2_11_a_w05_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_2_11_a_w05_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_2_11_a_w05_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
                tab_2_11_a_w05_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
                tab_2_11_a_w05_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);

                #endregion "2.1.1.a";

                #region "2.1.1.a";

                idTabeli = "'2.1.1.a.1'";

                #region "1.2.2";

                Label tblControl2 = new Label { ID = "kod02" };
                tblControl.Width = 1150;
                StringBuilder tabelaGlowna2 = new StringBuilder();
                tabelaGlowna2.AppendLine(ms.tworztabeleMSS("2.1.1.a.1", naglowekTabeliDzialu_2_1_1_a_1(), tabelaBocznaDzialu_2_1_1_a_1(), tabela2, 2, 5, 3, 11, idWydzialuNumerycznie, true, "Sprawy zawieszone nie zakreślone od dnia pierwotnego wpisu do repertorium (wykazane w dziale 2.1.1.) (bez czasu trwania mediacji w sprawach wszczętych po 1 stycznia 2016r.)", tenPlik));
                tabelaGlowna2.AppendLine(ms.tworztabeleMSS("2.1.2", naglowekTabeliDzialu_2_1_1_a_1(), tabelaBocznaDzialu_2_1_1_a_1(), tabela2, 2, 5, 3, 11, idWydzialuNumerycznie, true, "Liczba spraw zakreślonych w urządzeniu ewidencyjnym w wyniku zawieszenia postępowania (łącznie z czasem trwania mediacji)", tenPlik));
                tabelaGlowna2.AppendLine(ms.tworztabeleMSS("2.1.2.1", naglowekTabeliDzialu_2_1_1_a_1(), tabelaBocznaDzialu_2_1_1_a_1(), tabela2, 2, 5, 3, 11, idWydzialuNumerycznie, true, "Liczba spraw zakreślonych w urządzeniu ewidencyjnym w wyniku zawieszenia postępowania  (bez czasu trwania mediacji w sprawach wszczętych po 1 stycznia 2016r.)", tenPlik));

                tblControl2.Text = tabelaGlowna2.ToString();
                PlaceHolder2.Controls.Add(tblControl2);

                #endregion "1.2.2";

                #endregion "2.1.1.a";

                #region "2.1.2"

             //   pisz("tab_2_1_2_", 5, 11, tabela2, "'2.1.2'", idWydzialu);

                #endregion "2.1.2"

                #region "2.2";

                pisz("tab_2_2_", 4, 9, tabela2, "'2.2'", idWydzialu);

                #endregion "2.2";

                #region "tabel 2.2.a"

                //wiersz 1
                idTabeli = "'2.2.a'";
                idWiersza = "'1'";
                //tab_22a_w01_col01 to tab_22a_w01_col09

                tab_22a_w01_col01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_22a_w01_col02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_22a_w01_col03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_22a_w01_col04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_22a_w01_col05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_22a_w01_col06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_22a_w01_col07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_22a_w01_col08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_22a_w01_col09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);

                //wiersz 2
                idWiersza = "'2'";
                tab_22a_w02_col01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_22a_w02_col02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_22a_w02_col03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_22a_w02_col04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_22a_w02_col05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_22a_w02_col06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_22a_w02_col07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_22a_w02_col08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_22a_w02_col09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);

                //wiersz 3
                idWiersza = "'3'";
                tab_22a_w03_col01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_22a_w03_col02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_22a_w03_col03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_22a_w03_col04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_22a_w03_col05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_22a_w03_col06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_22a_w03_col07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_22a_w03_col08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_22a_w03_col09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);

                //wiersz 4
                idWiersza = "'4'";
                tab_22a_w04_col01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_22a_w04_col02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_22a_w04_col03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_22a_w04_col04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_22a_w04_col05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_22a_w04_col06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_22a_w04_col07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_22a_w04_col08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_22a_w04_col09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);

                #endregion "tabel 2.2.a"

                #region "tabel 2.2.1"

                //wiersz 1
                idTabeli = "'2.2.1'";
                idWiersza = "'1'";

                tab_2_2_1_w01_col01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_2_2_1_w01_col02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_2_2_1_w01_col03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_2_2_1_w01_col04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_2_2_1_w01_col05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_2_2_1_w01_col06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_2_2_1_w01_col07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_2_2_1_w01_col08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_2_2_1_w01_col09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);

                //wiersz 2
                idWiersza = "'2'";
                tab_2_2_1_w02_col01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_2_2_1_w02_col02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_2_2_1_w02_col03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_2_2_1_w02_col04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_2_2_1_w02_col05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_2_2_1_w02_col06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_2_2_1_w02_col07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_2_2_1_w02_col08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_2_2_1_w02_col09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);

                //wiersz 3
                idWiersza = "'3'";
                tab_2_2_1_w03_col01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_2_2_1_w03_col02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_2_2_1_w03_col03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_2_2_1_w03_col04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_2_2_1_w03_col05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_2_2_1_w03_col06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_2_2_1_w03_col07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_2_2_1_w03_col08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_2_2_1_w03_col09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);

                //wiersz 4
                idWiersza = "'4'";
                tab_2_2_1_w04_col01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_2_2_1_w04_col02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_2_2_1_w04_col03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_2_2_1_w04_col04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_2_2_1_w04_col05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_2_2_1_w04_col06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_2_2_1_w04_col07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_2_2_1_w04_col08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_2_2_1_w04_col09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);

                #endregion "tabel 2.2.1"

                #region "tabel 2.2.1.a"

                //wiersz 1
                idTabeli = "'2.2.1.a'";
                idWiersza = "'1'";

                tab_2_2_1_a_w01_col01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_2_2_1_a_w01_col02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_2_2_1_a_w01_col03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_2_2_1_a_w01_col04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_2_2_1_a_w01_col05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_2_2_1_a_w01_col06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_2_2_1_a_w01_col07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_2_2_1_a_w01_col08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_2_2_1_a_w01_col09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);

                //wiersz 2
                idWiersza = "'2'";
                tab_2_2_1_a_w02_col01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_2_2_1_a_w02_col02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_2_2_1_a_w02_col03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_2_2_1_a_w02_col04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_2_2_1_a_w02_col05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_2_2_1_a_w02_col06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_2_2_1_a_w02_col07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_2_2_1_a_w02_col08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_2_2_1_a_w02_col09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);

                //wiersz 3
                idWiersza = "'3'";
                tab_2_2_1_a_w03_col01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_2_2_1_a_w03_col02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_2_2_1_a_w03_col03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_2_2_1_a_w03_col04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_2_2_1_a_w03_col05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_2_2_1_a_w03_col06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_2_2_1_a_w03_col07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_2_2_1_a_w03_col08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_2_2_1_a_w03_col09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);

                //wiersz 4
                idWiersza = "'4'";
                tab_2_2_1_a_w04_col01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_2_2_1_a_w04_col02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_2_2_1_a_w04_col03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_2_2_1_a_w04_col04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_2_2_1_a_w04_col05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_2_2_1_a_w04_col06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_2_2_1_a_w04_col07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_2_2_1_a_w04_col08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_2_2_1_a_w04_col09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);

                #endregion "tabel 2.2.1.a"

                #region "2.3";

                idTabeli = "'2.3'";
                idWiersza = "'1'";
                tab_2_3_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_2_3_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_2_3_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_2_3_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_2_3_w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_2_3_w01_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_2_3_w01_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                idWiersza = "'2'";
                tab_2_3_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_2_3_w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_2_3_w02_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_2_3_w02_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_2_3_w02_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_2_3_w02_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_2_3_w02_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);

                #endregion "2.3";

                #region "2.3.1";

                idTabeli = "'2.3.1'";
                idWiersza = "'1'";
                tab_2_3_1_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_2_3_1_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_2_3_1_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_2_3_1_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_2_3_1_w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_2_3_1_w01_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_2_3_1_w01_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                idWiersza = "'2'";
                tab_2_3_1_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_2_3_1_w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_2_3_1_w02_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_2_3_1_w02_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_2_3_1_w02_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_2_3_1_w02_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_2_3_1_w02_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);

                #endregion "2.3.1";

                #region "3";

                idTabeli = "'3'";
                idWiersza = "'1'";
                tab_3_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_3_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_3_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_3_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_3_w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_3_w01_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_3_w01_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_3_w01_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                idWiersza = "'2'";
                tab_3_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_3_w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_3_w02_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_3_w02_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_3_w02_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_3_w02_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_3_w02_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_3_w02_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                idWiersza = "'3'";
                tab_3_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_3_w03_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_3_w03_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_3_w03_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_3_w03_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_3_w03_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_3_w03_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_3_w03_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                idWiersza = "'4'";
                tab_3_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_3_w04_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_3_w04_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_3_w04_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_3_w04_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_3_w04_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_3_w04_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_3_w04_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);

                #endregion "3";

                idTabeli = "'4'";
                idWiersza = "'1'";
                tab_4_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'2'";
                tab_4_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                #region "5";

                idTabeli = "'5'";
                idWiersza = "'1'";
                tab_5_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_5_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_5_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_5_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_5_w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_5_w01_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                idWiersza = "'2'";
                tab_5_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_5_w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_5_w02_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_5_w02_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_5_w02_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_5_w02_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                idWiersza = "'3'";
                tab_5_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_5_w03_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_5_w03_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_5_w03_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_5_w03_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_5_w03_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                idWiersza = "'4'";
                tab_5_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_5_w04_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_5_w04_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_5_w04_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_5_w04_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_5_w04_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                idWiersza = "'5'";
                tab_5_w05_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_5_w05_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_5_w05_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_5_w05_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_5_w05_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_5_w05_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                idWiersza = "'6'";
                tab_5_w06_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_5_w06_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_5_w06_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_5_w06_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_5_w06_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_5_w06_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                idWiersza = "'7'";
                tab_5_w07_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_5_w07_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_5_w07_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_5_w07_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_5_w07_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_5_w07_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);

                #endregion "5";

                #region "6.1.a";

                idTabeli = "'6.1.a'";
                idWiersza = "'1'";
                tab_6_1_a_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'2'";
                tab_6_1_a_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'3'";
                tab_6_1_a_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'4'";
                tab_6_1_a_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'5'";
                tab_6_1_a_w05_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'6'";
                tab_6_1_a_w06_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'7'";
                tab_6_1_a_w07_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'8'";
                tab_6_1_a_w08_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'9'";
                tab_6_1_a_w09_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'10'";
                tab_6_1_a_w10_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'11'";
                tab_6_1_a_w11_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'12'";
                tab_6_1_a_w12_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'13'";
                tab_6_1_a_w13_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'14'";
                tab_6_1_a_w14_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'15'";
                tab_6_1_a_w15_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'16'";
                tab_6_1_a_w16_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'17'";
                tab_6_1_a_w17_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'18'";
                tab_6_1_a_w18_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                #endregion "6.1.a";

                #region "6.1.b";

                idTabeli = "'6.1.b'";
                idWiersza = "'1'";
                tab_6_1_b_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_6_1_b_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                idWiersza = "'2'";
                tab_6_1_b_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_6_1_b_w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                idWiersza = "'3'";
                tab_6_1_b_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_6_1_b_w03_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                idWiersza = "'4'";
                tab_6_1_b_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_6_1_b_w04_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                idWiersza = "'5'";
                tab_6_1_b_w05_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_6_1_b_w05_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                idWiersza = "'6'";
                tab_6_1_b_w06_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_6_1_b_w06_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                idWiersza = "'7'";
                tab_6_1_b_w07_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_6_1_b_w07_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                idWiersza = "'8'";
                tab_6_1_b_w08_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_6_1_b_w08_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                idWiersza = "'9'";
                tab_6_1_b_w09_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_6_1_b_w09_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);

                #endregion "6.1.b";

                #region "6.2";

                idTabeli = "'6.2'";
                idWiersza = "'1'";
                tab_6_2_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_6_2_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_6_2_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_6_2_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_6_2_w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                idWiersza = "'2'";
                tab_6_2_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_6_2_w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_6_2_w02_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_6_2_w02_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_6_2_w02_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                idWiersza = "'3'";
                tab_6_2_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_6_2_w03_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_6_2_w03_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_6_2_w03_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_6_2_w03_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                idWiersza = "'4'";
                tab_6_2_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_6_2_w04_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_6_2_w04_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_6_2_w04_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_6_2_w04_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                idWiersza = "'5'";
                tab_6_2_w05_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_6_2_w05_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_6_2_w05_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_6_2_w05_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_6_2_w05_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                idWiersza = "'6'";
                tab_6_2_w06_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'7'";
                tab_6_2_w07_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'8'";
                tab_6_2_w08_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'9'";
                tab_6_2_w09_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'10'";
                tab_6_2_w10_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'11'";
                tab_6_2_w11_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                #endregion "6.2";

                #region "7";

                idTabeli = "'7'";
                idWiersza = "'1'";
                tab_7_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_7_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_7_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_7_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_7_w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_7_w01_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_7_w01_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_7_w01_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_7_w01_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
                tab_7_w01_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);

                #endregion "7";

                #region "8";

                idTabeli = "'8'";
                idWiersza = "'1'";
                tab_8_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_8_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_8_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_8_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_8_w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_8_w01_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_8_w01_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_8_w01_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_8_w01_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
                tab_8_w01_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
                tab_8_w01_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
                tab_8_w01_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);

                #endregion "8";

                #region "9";

                idTabeli = "'9'";
                idWiersza = "'1'";
                tab_9_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_9_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_9_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_9_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_9_w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_9_w01_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);

                #endregion "9";

                #region "10"

                //wiersz 1
                idTabeli = "'10'";
                idWiersza = "'1'";
                tab_10_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_10_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);

                #endregion "10"

                #region "tabela 11.1"

                //wiersz 1
                idTabeli = "'11.1'";
                idWiersza = "'1'";
                tab_111_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_111_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_111_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_111_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_111_w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_111_w01_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_111_w01_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);

                //wiersz 2
                idWiersza = "'2'";
                tab_111_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_111_w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_111_w02_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_111_w02_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_111_w02_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_111_w02_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_111_w02_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);

                #endregion "tabela 11.1"

                #region "tabel 11.2"

                //wiersz 1
                idTabeli = "'11.2'";
                idWiersza = "'1'";
                tab_11_2_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_11_2_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_11_2_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_11_2_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_11_2_w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_11_2_w01_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_11_2_w01_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);

                #endregion "tabel 11.2"

                #region "12";


                pisz("tab_12_", 29, 4, tabela2, "'12'", idWydzialu);


                #endregion "12";

                #region "13.1";

                Label tblControl3 = new Label { ID = "kod03" };
                tblControl3.Width = 1150;
                StringBuilder tabelaGlowna3 = new StringBuilder();
                tabelaGlowna3.AppendLine(ms.tworztabeleMSS("13.1", naglowekTabeliDzialu_13_1(), tabelaBocznaDzialu_13_1(), tabela2, 1, 1, 1, 32, idWydzialuNumerycznie, true, "Limity etatów i obsada Sądu (Wydziału)", tenPlik));
                tblControl3.Text = tabelaGlowna3.ToString();
                PlaceHolder3.Controls.Add(tblControl3);
                #endregion "13.1";
                #region "tabela 13.2"

                pisz("tab_13_2_", 4, 6, tabela2, "'13.2'", idWydzialu);

                #endregion "tabela 13.2"



                #region "tabel 14.1 "

                //wiersz 1
                idTabeli = "'14.1'";
                idWiersza = "'1'";
                tab_141_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_141_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_141_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_141_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);

                idWiersza = "'2'";
                tab_141_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_141_w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_141_w02_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_141_w02_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);

                idWiersza = "'3'";
                tab_141_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_141_w03_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_141_w03_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_141_w03_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);

                idWiersza = "'4'";
                tab_141_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_141_w04_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_141_w04_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_141_w04_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);

                idWiersza = "'5'";
                tab_141_w05_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_141_w05_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_141_w05_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_141_w05_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);

                idWiersza = "'6'";
                tab_141_w06_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_141_w06_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_141_w06_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_141_w06_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);

                #endregion "tabel 14.1 "

                #region "14.2"

                idTabeli = "'14.2'";
                pisz("tab_142_", 6, 8, tabela2, "'14.2'", idWydzialu);
              
                #endregion "14.2"

                #region "14.3"

                idTabeli = "'14.3'";
                pisz("tab_143_", 6, 8, tabela2, "'14.3'", idWydzialu);
               
                #endregion "14.3"

                #region 15.1

                idTabeli = "'15.1'";
                idWiersza = "'1'";
                tab_151_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                #endregion 15.1

                #region 15.2

                idTabeli = "'15.2'";
                idWiersza = "'1'";
                tab_152_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_152_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_152_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_152_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_152_w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_152_w01_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_152_w01_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_152_w01_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);

                #endregion 15.2

                #region 15.3

                idTabeli = "'15.3'";
                idWiersza = "'1'";
                tab_153_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_153_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_153_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_153_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_153_w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_153_w01_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_153_w01_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_153_w01_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);

                #endregion 15.3
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik+ " bład "+ ex.Message);
              
            }

            // dopasowanie opisów
            makeLabels();

            try
            {
                Label11.Visible = cl.debug(int.Parse(idWydzialu));
            }
            catch
            {
                Label11.Visible = false;
            }

            Label11.Text = txt;
        }

        private DataTable tabelaBocznaDzialu_1_1_5()
        {
            return tabelaBocznaDzialu_1_1_3();
        }

        private DataTable naglowekTabeliDzialu_1_1_5()
        {
            DataTable dT = schematTabeli();

            dT.Clear();
            //nrWiersza,nrKolumny",colspan""rowspan",style",text"
            dT.Rows.Add(new Object[] { 1, 1, 3, 1, "wciecie borderAll", "Zobowiązano rodziców (opiekuna) do" });
            dT.Rows.Add(new Object[] { 2, 1, 1, 2, "wciecie borderAll", "Poprawy określonych  warunków nieletniego" });
            dT.Rows.Add(new Object[] { 3, 1, 1, 2, "wciecie borderAll", "naprawienia szkody wyrządzonej przez nieletniego" });
            dT.Rows.Add(new Object[] { 4, 1, 3, 1, "wciecie borderAll", "inne" });

            return dT;
        }

        private DataTable tabelaBocznaDzialu_1_1_3()
        {
            DataTable dT = schematTabeli();
            try
            {
                dT.Clear();
                //nrWiersza,nrKolumny",colspan""rowspan",style",text"
                dT.Rows.Add(new Object[] { 1, 1, 1, 2, "wciecie borderAll", "Umieszczenie w schronisku dla nieletnich" });
                dT.Rows.Add(new Object[] { 2, 1, 1, 2, "wciecie borderAll", "Nadzór organizacji młodzieżowej, społecznej, zakładu pracy, osoby godnej zaufania" });
                dT.Rows.Add(new Object[] { 3, 1, 1, 2, "wciecie borderAll", "Nadzór kuratora" });
                dT.Rows.Add(new Object[] { 4, 1, 3, 1, "wciecie borderAll", "umieszczenie  w " });
                dT.Rows.Add(new Object[] { 4, 2, 1, 1, "wciecie borderAll", "zakładzie leczniczym " });
                dT.Rows.Add(new Object[] { 5, 2, 1, 1, "wciecie borderAll", "młodzieżowym ośrodku wychowawczym" });
                dT.Rows.Add(new Object[] { 6, 2, 1, 1, "wciecie borderAll", "domu pomocy społecznej" });
            }
            catch (Exception ex)
            {
                cm.log.Error("tabelaBocznaDzialu_1_1_3 " + ex.Message);
            }

            return dT;
        }

        private DataTable naglowekTabeliDzialu_1_1_3()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            try
            {
                dT.Clear();
                //nrWiersza,nrKolumny",colspan""rowspan",style",text"
                dT.Rows.Add(new Object[] { 1, 1, 1, 1, "center", "Wyszczególnienie " });
                dT.Rows.Add(new Object[] { 1, 2, 1, 1, "center", "L.p." });
                dT.Rows.Add(new Object[] { 1, 3, 1, 1, "center", "Liczba  " });
            }
            catch (Exception ex)
            {
                cm.log.Error("naglowekTabeliDzialu_1_1_3 " + ex.Message);
            }

            return dT;
        }
        /*
        private DataTable naglowekTabeliDzialu_1()
        {
            DataTable dT = schematTabeli();

            dT.Clear();
            //nrWiersza,nrKolumny",colspan""rowspan",style",text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 2, "wciecie borderAll", "Umieszczenie w schronisku dla nieletnich" });
            dT.Rows.Add(new Object[] { 2, 1, 1, 2, "wciecie borderAll", "Nadzór organizacji młodzieżowej, społecznej, zakładu pracy, osoby godnej zaufania" });
            dT.Rows.Add(new Object[] { 3, 1, 1, 2, "wciecie borderAll", "Nadzór kuratora" });
            dT.Rows.Add(new Object[] { 4, 1, 3, 1, "wciecie borderAll", "umieszczenie  w " });
            dT.Rows.Add(new Object[] { 4, 2, 1, 1, "wciecie borderAll", "zakładzie leczniczym " });
            dT.Rows.Add(new Object[] { 5, 2, 1, 1, "wciecie borderAll", "młodzieżowym ośrodku wychowawczym" });
            dT.Rows.Add(new Object[] { 6, 2, 1, 1, "wciecie borderAll", "domu pomocy społecznej" });

            return dT;
        }
        */
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
                Label29.Text = DateTime.Now.ToLongDateString();
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
                    //     tabela1Label.Text = "Dział 1.1.1.a.1 Liczba spraw o umieszczenie w szpitalu psychiatrycznym bez zgody, w którym natąpiło przekroczenie terminu 14 dni od dnia wpływu wniosku lub zawiadomienia o przyjęciu do szpitala psychiatrycznego osoby chorej psychicznie lub z zaburzeniami psychicznymi wymaganego w celu odbycia rozprawy [art. 45 ust. 1 ustawy z dnia 19 sierpnia 1994 r. o ochronie zdrowia psychicznego (Dz. U. z 2016 r., poz. 546 )] za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //      tabela2Label.Text = "Dział 1.1.1.a.2. Liczba spraw o umieszczenie w szpitalu psychiatrycznym bez zgody, w których wydano zarządzenie o doprowadzeniu osoby pozostającej w szpitalu, a której postępowanie bezpośrednio dotyczy na rozprawę, stosownie do możliwości przewidzianej w przepisie art. 46 ust. 1a ustawy z dnia 19 sierpnia 1994 r. o ochronie zdrowia psychicznego (Dz. U. z 2016 r., poz. 546) za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //    tabela3Label.Text = "Dział 4.1. Terminowość postępowania międzyinstancyjnego w pierwszej instancji za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    tabela4Label.Text = "Dział 2.2.a. Czas trwania postępowania sądowego od dnia pierwszej rejestracji do dnia uprawomocnienia się sprawy merytorycznie zakończonej (wyrokiem, orzeczeniem) w I instancji (łącznie z czasem trwania mediacji) za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";

                    tabela5Label.Text = "Dział 11.1. Terminowość postępowania międzyinstancyjnego  w pierwszej instancji za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //Informacje o ruchu sprawa za miesiąc: 

                    //Pozostało z ubieglego miesiąca
                }
                else
                {
                    //    tabela1Label.Text = "Dział 1.1.1.a.1 Liczba spraw o umieszczenie w szpitalu psychiatrycznym bez zgody, w którym natąpiło przekroczenie terminu 14 dni od dnia wpływu wniosku lub zawiadomienia o przyjęciu do szpitala psychiatrycznego osoby chorej psychicznie wymaganego w celu odbycia rozprawy [art. 45 ust. 1 ustawy z dnia 19 sierpnia 1994 r. o ochronie zdrowia psychicznego (Dz. U. z 2016 r., poz. 546 )] za okres od:  " + Date1.Text + " do  " + Date2.Text;

                    tabela4Label.Text = "Dział 2.2.a. Czas trwania postępowania sądowego od dnia pierwszej rejestracji do dnia uprawomocnienia się sprawy merytorycznie zakończonej (wyrokiem, orzeczeniem) w I instancji (łącznie z czasem trwania mediacji) za okres od " + Date1.Text + " do  " + Date2.Text;

                    tabela5Label.Text = "Dział 11.1. Terminowość postępowania międzyinstancyjnego  w pierwszej instancji za okres od " + Date1.Text + " do  " + Date2.Text;
                }
            }
            catch
            {
            }
        }

        protected void LinkButton54_Click(object sender, EventArgs e)
        {
            odswiez();
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
                    DataTable tabela2 = cl.generuj_dane_do_tabeli_mss2(int.Parse((string)Session["id_dzialu"]), Date1.Date, Date2.Date, 21,tenPlik); //dane
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
                    Response.Flush();
                    Response.End();
                }
            }
            catch
            {
            }
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

            return dT;
        }

        private DataTable naglowekTabeliDzialu_1_2_2()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 2, 3, "center", "SPRAWY według repertoriów i wykazów" });
            dT.Rows.Add(new Object[] { 1, 4, 1, 3, "center col_120", "Liczba odbytych sesji (rozprawy i posiedzenia)- wokandy" });
            dT.Rows.Add(new Object[] { 1, 5, 1, 3, "center col_120", "Liczba dni w których odbyto sesje -wokandy" });
            dT.Rows.Add(new Object[] { 1, 6, 1, 3, "center ", "Załatwienie<sup>1)<sup> ogółem (kol. 4, 16)" });
            dT.Rows.Add(new Object[] { 1, 7, 12, 1, "center ", "Liczba załatwionych spraw na rozprawie, dotyczy:" });
            dT.Rows.Add(new Object[] { 1, 19, 13, 1, "center ", "Liczba załatwionych spraw na posiedzeniach, dotyczy" });

            dT.Rows.Add(new Object[] { 2, 4, 1, 2, "center col_120", "Załatwienie razem (kol. 5, 6, 14, 15)" });
            dT.Rows.Add(new Object[] { 2, 5, 1, 2, "center col_120", "sędziów  SR z wyłączeniem sędziów funkcyjnych " });
            dT.Rows.Add(new Object[] { 2, 6, 1, 2, "center ", "sędziów funkcyjnych SR (kol. od 7 do 13)" });
            dT.Rows.Add(new Object[] { 2, 7, 7, 1, "center col_120", "z tego" });
            dT.Rows.Add(new Object[] { 2, 14, 1,2, "center col_120", "inni sędziowie SR" });
            dT.Rows.Add(new Object[] { 2, 15, 1, 2, "center col_120", "inni sędziowie" });

            dT.Rows.Add(new Object[] { 2, 16, 1, 2, "center col_120", "Załatwienie razem (kol. 17, 18, 26 do 28 )" });
            dT.Rows.Add(new Object[] { 2, 17, 1, 2, "center col_120", "sędziów SR z wyłączeniem sędziów funkcyjnych " });
            dT.Rows.Add(new Object[] { 2, 18, 1, 2, "center col_120", "sędziów funkcyjnych SR (suma kol. od 19 do 25)" });
            dT.Rows.Add(new Object[] { 2, 19, 7, 1, "center ", "z tego" });
            dT.Rows.Add(new Object[] { 2, 26, 1, 2, "center col_120", "inni sędziowie SR" });
            dT.Rows.Add(new Object[] { 2, 27, 1, 2, "center col_120", "inni sędziowie" });
            dT.Rows.Add(new Object[] { 2, 28, 1, 2, "center col_120", " referendarzy" });
            dT.Rows.Add(new Object[] { 3, 10, 1, 1, "center col_120", "prezesa" });
            dT.Rows.Add(new Object[] { 3, 11, 1, 1, "center col_120", "wiceprezesa" });
            dT.Rows.Add(new Object[] { 3, 12, 1, 1, "center col_120", "przewod-niczącego wydziału" });
            dT.Rows.Add(new Object[] { 3, 13, 1, 1, "center col_120", "zastępcę przewod-niczącego wydziału" });
            dT.Rows.Add(new Object[] { 3, 14, 1, 1, "center col_120", "kierownika sekcji" });
            dT.Rows.Add(new Object[] { 3, 15, 1, 1, "center col_120", "innych funkcyjnych tego sądu z tego pionu" });
            dT.Rows.Add(new Object[] { 3, 16, 1, 1, "center col_120", "innych funkcyjnych tego sądu z innych pionów" });

            dT.Rows.Add(new Object[] { 3, 24, 1, 1, "center col_120", "prezesa" });
            dT.Rows.Add(new Object[] { 3, 25, 1, 1, "center col_120", "wiceprezesa" });
            dT.Rows.Add(new Object[] { 3, 26, 1, 1, "center col_120", "przewod-niczącego wydziału" });
            dT.Rows.Add(new Object[] { 3, 27, 1, 1, "center col_120", "zastępcę przewod-niczącego wydziału" });
            dT.Rows.Add(new Object[] { 3, 28, 1, 1, "center col_120", "kierownika sekcji" });
            dT.Rows.Add(new Object[] { 3, 29, 1, 1, "center col_120", "innych funkcyjnych tego sądu z tego pionu" });
            dT.Rows.Add(new Object[] { 3, 30, 1, 1, "center col_120", "innych funkcyjnych tego sądu z innych pionów" });
            return dT;
        }

        private DataTable tabelaBocznaDzialu_1_2_2()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 2, 1, "wciecie borderAll", "OGÓŁEM (wiersze od 02 + 18 do 25)" });
            dT.Rows.Add(new Object[] { 2, 1, 2, 1, "wciecie borderAll", "RC" });
            dT.Rows.Add(new Object[] { 3, 1, 2, 1, "wciecie borderAll", "zwrot pozwu/wniosku/skargi (art. 130 kpc)" });
            dT.Rows.Add(new Object[] { 4, 1, 2, 1, "wciecie borderAll", "zwrot pozwu/wniosku/skargi (art. 130<sup>1</sup> kpc)" });
            dT.Rows.Add(new Object[] { 5, 1, 2, 1, "wciecie borderAll", "przekazanie do innych jednostek na podstawie art. 200§1 kpc " });
            dT.Rows.Add(new Object[] { 6, 1, 2, 1, "wciecie borderAll", "zakończono w trybie art. 339 kpc" });
            dT.Rows.Add(new Object[] { 7, 1, 2, 1, "wciecie borderAll", "zakończono w trybie art. 341 kpc" });
            dT.Rows.Add(new Object[] { 8, 1, 2, 1, "wciecie borderAll", "w wyniku zmian zarządzenia MS o biurowości" });

            dT.Rows.Add(new Object[] { 9, 1, 1, 2, "wciecie borderAll", "zmiany organizacyjne związane z utworzeniem lub likwidacją" });
            dT.Rows.Add(new Object[] { 9, 2, 1, 1, "wciecie borderAll", "wydziału (ów) / sekcji" });
            dT.Rows.Add(new Object[] { 10, 2, 1, 1, "wciecie borderAll", "sądu (ów)" });

            dT.Rows.Add(new Object[] { 11, 1, 1, 2, "wciecie borderAll", "w związku ze zmianą obszaru właściwości miejscowej" });
            dT.Rows.Add(new Object[] { 11, 2, 1, 1, "wciecie borderAll", "wydziału (ów) / sekcji" });
            dT.Rows.Add(new Object[] { 12, 2, 1, 1, "wciecie borderAll", "sądu (ów)" });

            dT.Rows.Add(new Object[] { 13, 1, 2, 1, "wciecie borderAll", "połączono do łącznego rozpoznania na podstawie art. 219 kpc" });
            dT.Rows.Add(new Object[] { 14, 1, 2, 1, "wciecie borderAll", "przekazanie do innego trybu na podstawie art. 201§1 i 2 kpc" });
            dT.Rows.Add(new Object[] { 15, 1, 2, 1, "wciecie borderAll", "zakreślono na podstawie art. 174 §1 pkt 1 kpc" });
            dT.Rows.Add(new Object[] { 16, 1, 2, 1, "wciecie borderAll", "odrzucono pozew/wniosek/skargę" });
            dT.Rows.Add(new Object[] { 17, 1, 2, 1, "wciecie borderAll", "inne formalne (z wiersza 39 dz. 1.2)" });
            dT.Rows.Add(new Object[] { 18, 1, 2, 1, "wciecie borderAll", "RNs" });
            dT.Rows.Add(new Object[] { 19, 1, 2, 1, "wciecie borderAll", "Nsm" });
            dT.Rows.Add(new Object[] { 20, 1, 2, 1, "wciecie borderAll", "RNc" });
            dT.Rows.Add(new Object[] { 21, 1, 2, 1, "wciecie borderAll", "RCo" });
            dT.Rows.Add(new Object[] { 22, 1, 2, 1, "wciecie borderAll", "Nmo" });
            dT.Rows.Add(new Object[] { 23, 1, 2, 1, "wciecie borderAll", "RCps" });
            dT.Rows.Add(new Object[] { 24, 1, 2, 1, "wciecie borderAll", "Nkd" });
            dT.Rows.Add(new Object[] { 25, 1, 2, 1, "wciecie borderAll", "Skarga o stwierdzenie niezgodności z prawem (WSC)" });

            return dT;
        }

        //2.1.1.a.1
        private DataTable naglowekTabeliDzialu_2_1_1_a_1()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 2, 2, "center", "SPRAWY według repertoriów i wykazów" });
            
            dT.Rows.Add(new Object[] { 1, 3, 11, 1, "center col_120", "Liczba spraw niezałatwionych pozostających od daty pierwszego wpływu do sądu" });
            dT.Rows.Add(new Object[] { 2, 4, 1, 1, "center col_120", "razem (kol. 2, 3)" });
            dT.Rows.Add(new Object[] { 2, 5, 1, 1, "center col_120", "do 3 miesięcy" });
            dT.Rows.Add(new Object[] { 2, 6, 1, 1, "center ", "suma powyżej 3 miesięcy (kol. od 4 do 6)" });
            dT.Rows.Add(new Object[] { 2, 7, 1, 1, "center col_120", "powyżej 3 do 6 miesięcy" });
            dT.Rows.Add(new Object[] { 2, 8, 1, 1, "center col_120", "powyżej 6 do 12 miesięcy" });
            dT.Rows.Add(new Object[] { 2, 9, 1, 1, "center col_120", "suma powyżej 12 miesięcy (kol. od 7 do 11)" });
            dT.Rows.Add(new Object[] { 2, 10, 1, 1, "center col_120", "powyżej 12 miesięcy do 2 lat" });
            dT.Rows.Add(new Object[] { 2, 11, 1, 1, "center col_120", "powyżej 2 do 3 lat" });
            dT.Rows.Add(new Object[] { 2, 12, 1, 1, "center col_120", "powyżej 3 do 5 lat" });
            dT.Rows.Add(new Object[] { 2, 13, 1, 1, "center col_120 ", "powyżej 5 do 8 lat" });
            dT.Rows.Add(new Object[] { 2, 14, 1, 1, "center col_120", "ponad 8 lat" });

            return dT;
        }

        private DataTable tabelaBocznaDzialu_2_1_1_a_1()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 2, 1, "wciecie borderAll", "OGÓŁEM " });
            dT.Rows.Add(new Object[] { 2, 1, 1, 4, "wciecie borderAll", "w tym" });

            
            dT.Rows.Add(new Object[] { 2, 2, 1, 1, "wciecie borderAll", "RC" });
         
            dT.Rows.Add(new Object[] { 3, 2, 1, 1, "wciecie borderAll", "RNs" });
            dT.Rows.Add(new Object[] { 4, 2, 1, 1, "wciecie borderAll", "Nsm" });
            
            dT.Rows.Add(new Object[] { 5, 2, 1, 1, "wciecie borderAll", "Nkd" });
           
            return dT;
        }

        //13.1
        private DataTable naglowekTabeliDzialu_13_1()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 1, "center", "Wyszczególnienie" });
            dT.Rows.Add(new Object[] { 1, 2, 1, 1, "center col_60", "Liczba sędziów  SR i wakujących stanowisk sędziowskich w ramach limitu  (na ostatni dzień okresu statystycznego)" });
            dT.Rows.Add(new Object[] { 1, 3, 1, 1, "center col_60", "Liczba sędziów SR  i wakujących stanowisk sędziowskich w ramach limitu  (w okresie statystycznym)" });
            dT.Rows.Add(new Object[] { 1, 4, 1, 1, "center col_60", "Obsada średniookresowa sędziowie SR z wyłączeniem sędziów funkcyjnych oraz delegowanych do pełnienia czynności w Ministerstwie Sprawiedliwości, KSSiP, a także delegowanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekający w pełnym lub niepełnym wymiarze w SO i delegowanych do pełnienia czynności orzeczniczych w pełnym lub niepełnym wymiarze w innym SR" });
            dT.Rows.Add(new Object[] { 1, 5, 1, 1, "center col_60", "Liczba sędziów SR z wyłączeniem sędziów funkcyjnych oraz delegowanych do pełnienia czynności w Ministerstwie Sprawiedliwości, KSSiP,a także delegowanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekających w pełnym lub niepełnym wymiarze w SO i delegowanych do pełnienia czynności orzeczniczych w pełnym lub niepełnym wymiarze w innym SR" });
            dT.Rows.Add(new Object[] { 1, 6, 1, 1, "center col_60", "Obsada średniookresowa sędziowie SA wykonujących czynności orzecznicze na mocy ustawy w SR" });
            dT.Rows.Add(new Object[] { 1, 7, 1, 1, "center col_60", "Liczba sędziów SA  wykonujących czynności orzecznicze na mocy ustawy w SR" });
            dT.Rows.Add(new Object[] { 1, 8, 1, 1, "center col_60", "Obsada średniookresowa sędziowie SO delegowanych do pełnienia czynności orzeczniczych w pełnym lub niepełnym wymiarze  w danym sądzie,  w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony  czy też wykonujących czynności orzecznicze na mocy ustawy" });
            dT.Rows.Add(new Object[] { 1, 9, 1, 1, "center col_60", "Liczba sędziów SO delegowanych do pełnienia czynności orzeczniczych w pełnym lub niepełnym wymiarze w danym sądzie w trybie art. 77 § 1 usp na czas określony lub nieokreślony czy też wykonujących czynności orzecznicze na mocy ustawy" });
            dT.Rows.Add(new Object[] { 1, 10, 1, 1, "center col_60", "Obsada sędziów danego SR delegowanych do pełnienia czynności orzeczniczych w pełnym wymiarze  w innym SR" });
            dT.Rows.Add(new Object[] { 1, 11, 1, 1, "center col_60", "Liczba sędziów  danego SR delegowanych do pełnienia czynności orzeczniczych w pełnym wymiarze w innym SR" });
            dT.Rows.Add(new Object[] { 1, 12, 1, 1, "center col_60", "Obsada sędziów danego SR delegowanych do pełnienia czynności orzeczniczych w niepełnym wymiarze czy też wykonujących czynności orzecznicze z mocy ustawy  w innym SR" });
            dT.Rows.Add(new Object[] { 1, 13, 1, 1, "center col_60 ", "Liczba sędziów  danego SR delegowanych do pełnienia czynności orzeczniczych w niepełnym wymiarze czy też wykonujących czynności orzecznicze z mocy ustawy  w innym SR" });
            dT.Rows.Add(new Object[] { 1, 14, 1, 1, "center col_60", "Obsada sędziów innego SR delegowanych do pełnienia  czynności orzeczniczych w pełnym lub niepełnym wymiarze czy też wykonujących czynności orzecznicze z mocy ustawy w danym SR" });
            dT.Rows.Add(new Object[] { 1, 15, 1, 1, "center col_60", "Liczba sędziów innego SR delegowanych do pełnienia czynności orzeczniczych w pełnym lub niepełnym wymiarze czy też wykonujących czynności orzecznicze z mocy ustawy  w  danym SR" });
            dT.Rows.Add(new Object[] { 1, 16, 1, 1, "center col_60", "Obsada średniookresowa (sędziowie  funkcyjni SR) - I wersja  " });
            dT.Rows.Add(new Object[] { 1, 17, 1, 1, "center col_60", "Obsada średniookresowa (sędziowie  funkcyjni SR) - II wersja  " });
            dT.Rows.Add(new Object[] { 1, 18, 1, 1, "center col_60", "Liczba sędziów SR - funkcyjnych  tego sądu w ramach limitu na ostatni dzień okresu statystycznego" });
            dT.Rows.Add(new Object[] { 1, 19, 1, 1, "center col_60", "Liczba sędziów SR - funkcyjnych  tego sądu w ramach limitu w okresie statystycznym" });
            dT.Rows.Add(new Object[] { 1, 20, 1, 1, "center col_60", "Obsada średniookresowa sędziów SR  w ramach limitu delegowanych do pełnienia czynności w Ministerstwie Sprawiedliwości" });
            dT.Rows.Add(new Object[] { 1, 21, 1, 1, "center col_60", "Liczba sędziów delegowanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony do pełnienia czynności w Ministerstwie Sprawiedliwości w ramach limitu " });
            dT.Rows.Add(new Object[] { 1, 22, 1, 1, "center col_60", "Obsada sędziów delegowanych do KSSiP w ramach limitu " });
            dT.Rows.Add(new Object[] { 1, 23, 1, 1, "center col_60", "Liczba sędziów delegowanych do KSSiP w ramach limitu" });
            dT.Rows.Add(new Object[] { 1, 24, 1, 1, "center col_60", "Obsada średniookresowa sędziów SR delegowanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekających w pełnym wymiarze w SO" });
            dT.Rows.Add(new Object[] { 1, 25, 1, 1, "center col_60", "Liczba sędziów SR delegowanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekających w pełnym wymiarze w SO" });
            dT.Rows.Add(new Object[] { 1, 26, 1, 1, "center col_60", "Obsada średniookresowa sędziów SR delegowanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekających w niepełnym wymiarze w SO" });
            dT.Rows.Add(new Object[] { 1, 27, 1, 1, "center col_60", "Liczba sędziów SR delegowanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekających w niepełnym wymiarze w SO" });
            dT.Rows.Add(new Object[] { 1, 28, 1, 1, "center col_60", "Obsada średniookresowa  sędziów delegowanych w trybie art. 77 § 8 i 9 usp do SO" });
            dT.Rows.Add(new Object[] { 1, 29, 1, 1, "center col_60", "Liczba sędziów delegowanych w trybie art. 77 § 8 i 9 usp do SO " });
            dT.Rows.Add(new Object[] { 1, 30, 1, 1, "center col_60", "Łączna liczba sesji w danym okresie statystycznym (rozprawy i posiedzenia) sędziów SR z wyłączeniem sędziów funkcyjnych, sędziów delegowanych do KSSiP oraz delegowanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekający w pełnym lub niepełnym wymiarze, czy też wykonujących czynności orzecznicze na mocy ustawy w SO i sędziów SR delegowanych do pełnienia czynności orzeczniczych do innego i z innego SR" });
            dT.Rows.Add(new Object[] { 1, 31, 1, 1, "center col_60", "Średniookresowa liczba sesji w danym okresie statystycznym (rozprawy i posiedzenia) jednego sędziego SR z wyłączeniem sędziów funkcyjnych, sędziów delegowanych do KSSiP oraz  delegowanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekający w pełnym lub niepełnym wymiarze, czy też wykonujących czynności orzecznicze na mocy ustawy w SO i sędziów SR delegowanych do pełnienia czynności orzeczniczych do innego i z innego SR" });
            dT.Rows.Add(new Object[] { 1, 32, 1, 1, "center col_60", "Liczba obsadzonych etatów (na ostatni dzień okresu statystycznego)" });
            dT.Rows.Add(new Object[] { 1, 33, 1, 1, "center col_60", "Liczba obsadzonych etatów (w okresie statystycznym)" });

            return dT;
        }

        private DataTable tabelaBocznaDzialu_13_1()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 1, "wciecie borderAll", "Sędziowie pionu rodzinnego " });

            return dT;
        }
    }
}