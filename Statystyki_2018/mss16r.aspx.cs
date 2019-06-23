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
            przemiel();
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

        protected void przemiel()
        {
            string idWydzialu = "'" + (string)Session["id_dzialu"] + "'";
            id_dzialu.Text = (string)Session["txt_dzialu"];
            string txt = string.Empty; //

            try
            {
                cm.log.Info("mss16r start");
                string idTabeli = string.Empty;
                string idWiersza = string.Empty;

                DataTable tabela2 = ms.generuj_dane_do_tabeli_mss2(int.Parse((string)Session["id_dzialu"]), Date1.Date, Date2.Date, 21);
                //wypełnianie lebeli

                #region "tabela 1.1.1.a"
                //tab_111a_
                idTabeli = "'1.1.1.a'";
                idWiersza = "'1'";
                tab_111a_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                idWiersza = "'2'";
                tab_111a_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                #endregion "tabela 1.1.a.2"

                #region "tabela 1.1.1.a.1"

                idTabeli = "'1.1.1.a.1'";
                idWiersza = "'1'";
                tab_111a1_w01_col01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                #endregion "tabela 1.1.a.1"

                
                #region "tabela 1.1.a.1"

                pisz("tab_111a1_",1 , 6, tabela2, "'1.1.1.a.1'", idWydzialu);
                #endregion "tabela 1.1.a.1"


                #region "tabela 1.1.a.2"
/*
                #region "tabela 1.1.1.a"

                pisz("tab_111a_", 1, 6, tabela2, "'1.1.1.a'", idWydzialu);
                #endregion "tabela 1.1.1.a"
                */

                #region "tabela 1.1.1.a.2"

                idTabeli = "'1.1.1.a.2'";
                idWiersza = "'1'";
                tab_111a2_w01_col01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);

                #endregion "tabela 1.1.a.2"
               
                #region "1.1.1.a.1";
                pisz("tab_111a1_", 1, 6, tabela2, "'1.1.1.a.1'", idWydzialu);
                #endregion ;

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
                //1.1.3

                #region "1.1.3";
                pisz("tab_113_", 6, 1, tabela2, "'1.1.3'", idWydzialu);
                #endregion ;


                #region "1.1.4";
               
                pisz("tab_1_1_4_", 3, 1, tabela2, "'1.1.4'", idWydzialu);
                #endregion "1.1.4";
                #region "1.1.5";
                pisz("tab_115_", 3, 1, tabela2, "'1.1.5'", idWydzialu);
                #endregion ;


                #region "1.1.6";

                idWiersza = "'1'";
                pisz("tab_1_1_6_", 9, 1, tabela2, "'1.1.6'", idWydzialu);
             
                #endregion "1.1.6";

                #region "1.1.7";

                pisz("tab_1_1_7_", 14,5, tabela2, "'1.1.7'", idWydzialu);
                #endregion "1.1.7";


                #region "1.1.7.a";
                pisz("tab_1_1_7_a_", 5,14, tabela2, "'1.1.7.a'", idWydzialu);
                #endregion "1.1.7.a";

                #region "1.1.7.b";
                pisz("tab_1_1_7_b_", 7, 12, tabela2, "'1.1.7.b'", idWydzialu);
                #endregion "1.1.7.b";


                #region "1.1.7.c";
                pisz("tab_117c_", 1, 5, tabela2, "'1.1.7.c'", idWydzialu);
                #endregion ;

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

                idTabeli = "'1.1.9'";
                idWiersza = "'1'";
                tab_1_1_9_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_1_1_9_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_1_1_9_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_1_1_9_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_1_1_9_w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                idWiersza = "'2'";
                tab_1_1_9_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_1_1_9_w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_1_1_9_w02_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_1_1_9_w02_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_1_1_9_w02_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                idWiersza = "'3'";
                tab_1_1_9_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_1_1_9_w03_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_1_1_9_w03_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_1_1_9_w03_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_1_1_9_w03_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                idWiersza = "'4'";
                tab_1_1_9_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_1_1_9_w04_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_1_1_9_w04_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_1_1_9_w04_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_1_1_9_w04_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                idWiersza = "'5'";
                tab_1_1_9_w05_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_1_1_9_w05_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_1_1_9_w05_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_1_1_9_w05_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_1_1_9_w05_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);

                #endregion "1.1.9";

             
                #region "1.2.a";
                pisz("tab_12a_", 22, 7, tabela2, "'1.2.a'", idWydzialu);
                #endregion ;
                #region "1.2.b";
                pisz("tab_12b_", 24, 7, tabela2, "'1.2.b'", idWydzialu);
                #endregion ;

                #region "1.2.c";
                pisz("tab_12c_", 4, 3, tabela2, "'1.2.c'", idWydzialu);
                #endregion ;



                #region "1.2.1"
                pisz("tab_121_", 10, 28, tabela2, "'1.2.1'", idWydzialu);
                #endregion

               

                #region "1.2.2";

                idTabeli = "'1.2.2'";
                idWiersza = "'1'";
                tab_1_2_2_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_1_2_2_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_1_2_2_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_1_2_2_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_1_2_2_w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_1_2_2_w01_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_1_2_2_w01_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_1_2_2_w01_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_1_2_2_w01_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
                tab_1_2_2_w01_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
                tab_1_2_2_w01_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
                tab_1_2_2_w01_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);
                tab_1_2_2_w01_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'", tenPlik);
                tab_1_2_2_w01_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'", tenPlik);
                tab_1_2_2_w01_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'", tenPlik);
                tab_1_2_2_w01_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'", tenPlik);
                tab_1_2_2_w01_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'", tenPlik);
                tab_1_2_2_w01_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'", tenPlik);
                tab_1_2_2_w01_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'", tenPlik);
                tab_1_2_2_w01_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'", tenPlik);
                tab_1_2_2_w01_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'", tenPlik);
                tab_1_2_2_w01_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'", tenPlik);
                tab_1_2_2_w01_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'", tenPlik);
                tab_1_2_2_w01_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'", tenPlik);
                tab_1_2_2_w01_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'", tenPlik);
                tab_1_2_2_w01_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'", tenPlik);
                idWiersza = "'2'";
                tab_1_2_2_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_1_2_2_w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_1_2_2_w02_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_1_2_2_w02_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_1_2_2_w02_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_1_2_2_w02_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_1_2_2_w02_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_1_2_2_w02_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_1_2_2_w02_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
                tab_1_2_2_w02_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
                tab_1_2_2_w02_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
                tab_1_2_2_w02_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);
                tab_1_2_2_w02_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'", tenPlik);
                tab_1_2_2_w02_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'", tenPlik);
                tab_1_2_2_w02_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'", tenPlik);
                tab_1_2_2_w02_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'", tenPlik);
                tab_1_2_2_w02_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'", tenPlik);
                tab_1_2_2_w02_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'", tenPlik);
                tab_1_2_2_w02_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'", tenPlik);
                tab_1_2_2_w02_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'", tenPlik);
                tab_1_2_2_w02_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'", tenPlik);
                tab_1_2_2_w02_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'", tenPlik);
                tab_1_2_2_w02_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'", tenPlik);
                tab_1_2_2_w02_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'", tenPlik);
                tab_1_2_2_w02_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'", tenPlik);
                tab_1_2_2_w02_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'", tenPlik);
                idWiersza = "'3'";
                tab_1_2_2_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_1_2_2_w03_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_1_2_2_w03_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_1_2_2_w03_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_1_2_2_w03_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_1_2_2_w03_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_1_2_2_w03_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_1_2_2_w03_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_1_2_2_w03_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
                tab_1_2_2_w03_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
                tab_1_2_2_w03_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
                tab_1_2_2_w03_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);
                tab_1_2_2_w03_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'", tenPlik);
                tab_1_2_2_w03_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'", tenPlik);
                tab_1_2_2_w03_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'", tenPlik);
                tab_1_2_2_w03_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'", tenPlik);
                tab_1_2_2_w03_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'", tenPlik);
                tab_1_2_2_w03_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'", tenPlik);
                tab_1_2_2_w03_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'", tenPlik);
                tab_1_2_2_w03_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'", tenPlik);
                tab_1_2_2_w03_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'", tenPlik);
                tab_1_2_2_w03_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'", tenPlik);
                tab_1_2_2_w03_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'", tenPlik);
                tab_1_2_2_w03_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'", tenPlik);
                tab_1_2_2_w03_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'", tenPlik);
                tab_1_2_2_w03_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'", tenPlik);
                idWiersza = "'4'";
                tab_1_2_2_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_1_2_2_w04_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_1_2_2_w04_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_1_2_2_w04_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_1_2_2_w04_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_1_2_2_w04_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_1_2_2_w04_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_1_2_2_w04_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_1_2_2_w04_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
                tab_1_2_2_w04_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
                tab_1_2_2_w04_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
                tab_1_2_2_w04_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);
                tab_1_2_2_w04_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'", tenPlik);
                tab_1_2_2_w04_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'", tenPlik);
                tab_1_2_2_w04_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'", tenPlik);
                tab_1_2_2_w04_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'", tenPlik);
                tab_1_2_2_w04_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'", tenPlik);
                tab_1_2_2_w04_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'", tenPlik);
                tab_1_2_2_w04_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'", tenPlik);
                tab_1_2_2_w04_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'", tenPlik);
                tab_1_2_2_w04_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'", tenPlik);
                tab_1_2_2_w04_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'", tenPlik);
                tab_1_2_2_w04_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'", tenPlik);
                tab_1_2_2_w04_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'", tenPlik);
                tab_1_2_2_w04_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'", tenPlik);
                tab_1_2_2_w04_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'", tenPlik);
                idWiersza = "'5'";
                tab_1_2_2_w05_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_1_2_2_w05_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_1_2_2_w05_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_1_2_2_w05_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_1_2_2_w05_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_1_2_2_w05_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_1_2_2_w05_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_1_2_2_w05_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_1_2_2_w05_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
                tab_1_2_2_w05_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
                tab_1_2_2_w05_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
                tab_1_2_2_w05_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);
                tab_1_2_2_w05_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'", tenPlik);
                tab_1_2_2_w05_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'", tenPlik);
                tab_1_2_2_w05_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'", tenPlik);
                tab_1_2_2_w05_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'", tenPlik);
                tab_1_2_2_w05_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'", tenPlik);
                tab_1_2_2_w05_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'", tenPlik);
                tab_1_2_2_w05_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'", tenPlik);
                tab_1_2_2_w05_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'", tenPlik);
                tab_1_2_2_w05_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'", tenPlik);
                tab_1_2_2_w05_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'", tenPlik);
                tab_1_2_2_w05_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'", tenPlik);
                tab_1_2_2_w05_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'", tenPlik);
                tab_1_2_2_w05_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'", tenPlik);
                tab_1_2_2_w05_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'", tenPlik);
                idWiersza = "'6'";
                tab_1_2_2_w06_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_1_2_2_w06_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_1_2_2_w06_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_1_2_2_w06_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_1_2_2_w06_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_1_2_2_w06_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_1_2_2_w06_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_1_2_2_w06_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_1_2_2_w06_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
                tab_1_2_2_w06_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
                tab_1_2_2_w06_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
                tab_1_2_2_w06_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);
                tab_1_2_2_w06_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'", tenPlik);
                tab_1_2_2_w06_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'", tenPlik);
                tab_1_2_2_w06_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'", tenPlik);
                tab_1_2_2_w06_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'", tenPlik);
                tab_1_2_2_w06_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'", tenPlik);
                tab_1_2_2_w06_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'", tenPlik);
                tab_1_2_2_w06_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'", tenPlik);
                tab_1_2_2_w06_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'", tenPlik);
                tab_1_2_2_w06_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'", tenPlik);
                tab_1_2_2_w06_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'", tenPlik);
                tab_1_2_2_w06_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'", tenPlik);
                tab_1_2_2_w06_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'", tenPlik);
                tab_1_2_2_w06_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'", tenPlik);
                tab_1_2_2_w06_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'", tenPlik);
                idWiersza = "'7'";
                tab_1_2_2_w07_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_1_2_2_w07_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_1_2_2_w07_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_1_2_2_w07_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_1_2_2_w07_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_1_2_2_w07_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_1_2_2_w07_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_1_2_2_w07_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_1_2_2_w07_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
                tab_1_2_2_w07_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
                tab_1_2_2_w07_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
                tab_1_2_2_w07_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);
                tab_1_2_2_w07_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'", tenPlik);
                tab_1_2_2_w07_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'", tenPlik);
                tab_1_2_2_w07_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'", tenPlik);
                tab_1_2_2_w07_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'", tenPlik);
                tab_1_2_2_w07_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'", tenPlik);
                tab_1_2_2_w07_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'", tenPlik);
                tab_1_2_2_w07_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'", tenPlik);
                tab_1_2_2_w07_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'", tenPlik);
                tab_1_2_2_w07_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'", tenPlik);
                tab_1_2_2_w07_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'", tenPlik);
                tab_1_2_2_w07_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'", tenPlik);
                tab_1_2_2_w07_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'", tenPlik);
                tab_1_2_2_w07_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'", tenPlik);
                tab_1_2_2_w07_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'", tenPlik);
                idWiersza = "'8'";
                tab_1_2_2_w08_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_1_2_2_w08_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_1_2_2_w08_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_1_2_2_w08_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_1_2_2_w08_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_1_2_2_w08_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_1_2_2_w08_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_1_2_2_w08_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_1_2_2_w08_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
                tab_1_2_2_w08_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
                tab_1_2_2_w08_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
                tab_1_2_2_w08_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);
                tab_1_2_2_w08_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'", tenPlik);
                tab_1_2_2_w08_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'", tenPlik);
                tab_1_2_2_w08_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'", tenPlik);
                tab_1_2_2_w08_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'", tenPlik);
                tab_1_2_2_w08_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'", tenPlik);
                tab_1_2_2_w08_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'", tenPlik);
                tab_1_2_2_w08_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'", tenPlik);
                tab_1_2_2_w08_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'", tenPlik);
                tab_1_2_2_w08_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'", tenPlik);
                tab_1_2_2_w08_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'", tenPlik);
                tab_1_2_2_w08_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'", tenPlik);
                tab_1_2_2_w08_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'", tenPlik);
                tab_1_2_2_w08_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'", tenPlik);
                tab_1_2_2_w08_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'", tenPlik);
                idWiersza = "'9'";
                tab_1_2_2_w09_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_1_2_2_w09_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_1_2_2_w09_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_1_2_2_w09_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_1_2_2_w09_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_1_2_2_w09_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_1_2_2_w09_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_1_2_2_w09_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_1_2_2_w09_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
                tab_1_2_2_w09_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
                tab_1_2_2_w09_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
                tab_1_2_2_w09_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);
                tab_1_2_2_w09_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'", tenPlik);
                tab_1_2_2_w09_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'", tenPlik);
                tab_1_2_2_w09_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'", tenPlik);
                tab_1_2_2_w09_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'", tenPlik);
                tab_1_2_2_w09_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'", tenPlik);
                tab_1_2_2_w09_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'", tenPlik);
                tab_1_2_2_w09_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'", tenPlik);
                tab_1_2_2_w09_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'", tenPlik);
                tab_1_2_2_w09_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'", tenPlik);
                tab_1_2_2_w09_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'", tenPlik);
                tab_1_2_2_w09_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'", tenPlik);
                tab_1_2_2_w09_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'", tenPlik);
                tab_1_2_2_w09_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'", tenPlik);
                tab_1_2_2_w09_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'", tenPlik);
                idWiersza = "'10'";
                tab_1_2_2_w10_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_1_2_2_w10_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_1_2_2_w10_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_1_2_2_w10_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_1_2_2_w10_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_1_2_2_w10_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_1_2_2_w10_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_1_2_2_w10_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_1_2_2_w10_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
                tab_1_2_2_w10_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
                tab_1_2_2_w10_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
                tab_1_2_2_w10_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);
                tab_1_2_2_w10_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'", tenPlik);
                tab_1_2_2_w10_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'", tenPlik);
                tab_1_2_2_w10_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'", tenPlik);
                tab_1_2_2_w10_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'", tenPlik);
                tab_1_2_2_w10_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'", tenPlik);
                tab_1_2_2_w10_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'", tenPlik);
                tab_1_2_2_w10_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'", tenPlik);
                tab_1_2_2_w10_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'", tenPlik);
                tab_1_2_2_w10_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'", tenPlik);
                tab_1_2_2_w10_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'", tenPlik);
                tab_1_2_2_w10_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'", tenPlik);
                tab_1_2_2_w10_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'", tenPlik);
                tab_1_2_2_w10_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'", tenPlik);
                tab_1_2_2_w10_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'", tenPlik);
                idWiersza = "'11'";
                tab_1_2_2_w11_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_1_2_2_w11_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_1_2_2_w11_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_1_2_2_w11_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_1_2_2_w11_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_1_2_2_w11_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_1_2_2_w11_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_1_2_2_w11_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_1_2_2_w11_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
                tab_1_2_2_w11_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
                tab_1_2_2_w11_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
                tab_1_2_2_w11_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);
                tab_1_2_2_w11_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'", tenPlik);
                tab_1_2_2_w11_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'", tenPlik);
                tab_1_2_2_w11_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'", tenPlik);
                tab_1_2_2_w11_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'", tenPlik);
                tab_1_2_2_w11_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'", tenPlik);
                tab_1_2_2_w11_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'", tenPlik);
                tab_1_2_2_w11_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'", tenPlik);
                tab_1_2_2_w11_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'", tenPlik);
                tab_1_2_2_w11_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'", tenPlik);
                tab_1_2_2_w11_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'", tenPlik);
                tab_1_2_2_w11_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'", tenPlik);
                tab_1_2_2_w11_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'", tenPlik);
                tab_1_2_2_w11_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'", tenPlik);
                tab_1_2_2_w11_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'", tenPlik);
                idWiersza = "'12'";
                tab_1_2_2_w12_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_1_2_2_w12_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_1_2_2_w12_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_1_2_2_w12_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_1_2_2_w12_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_1_2_2_w12_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_1_2_2_w12_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_1_2_2_w12_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_1_2_2_w12_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
                tab_1_2_2_w12_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
                tab_1_2_2_w12_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
                tab_1_2_2_w12_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);
                tab_1_2_2_w12_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'", tenPlik);
                tab_1_2_2_w12_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'", tenPlik);
                tab_1_2_2_w12_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'", tenPlik);
                tab_1_2_2_w12_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'", tenPlik);
                tab_1_2_2_w12_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'", tenPlik);
                tab_1_2_2_w12_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'", tenPlik);
                tab_1_2_2_w12_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'", tenPlik);
                tab_1_2_2_w12_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'", tenPlik);
                tab_1_2_2_w12_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'", tenPlik);
                tab_1_2_2_w12_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'", tenPlik);
                tab_1_2_2_w12_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'", tenPlik);
                tab_1_2_2_w12_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'", tenPlik);
                tab_1_2_2_w12_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'", tenPlik);
                tab_1_2_2_w12_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'", tenPlik);
                idWiersza = "'13'";
                tab_1_2_2_w13_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_1_2_2_w13_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_1_2_2_w13_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_1_2_2_w13_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_1_2_2_w13_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_1_2_2_w13_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_1_2_2_w13_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_1_2_2_w13_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_1_2_2_w13_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
                tab_1_2_2_w13_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
                tab_1_2_2_w13_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
                tab_1_2_2_w13_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);
                tab_1_2_2_w13_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'", tenPlik);
                tab_1_2_2_w13_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'", tenPlik);
                tab_1_2_2_w13_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'", tenPlik);
                tab_1_2_2_w13_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'", tenPlik);
                tab_1_2_2_w13_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'", tenPlik);
                tab_1_2_2_w13_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'", tenPlik);
                tab_1_2_2_w13_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'", tenPlik);
                tab_1_2_2_w13_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'", tenPlik);
                tab_1_2_2_w13_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'", tenPlik);
                tab_1_2_2_w13_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'", tenPlik);
                tab_1_2_2_w13_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'", tenPlik);
                tab_1_2_2_w13_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'", tenPlik);
                tab_1_2_2_w13_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'", tenPlik);
                tab_1_2_2_w13_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'", tenPlik);
                idWiersza = "'14'";
                tab_1_2_2_w14_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_1_2_2_w14_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_1_2_2_w14_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_1_2_2_w14_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_1_2_2_w14_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_1_2_2_w14_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_1_2_2_w14_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_1_2_2_w14_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_1_2_2_w14_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
                tab_1_2_2_w14_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
                tab_1_2_2_w14_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
                tab_1_2_2_w14_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);
                tab_1_2_2_w14_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'", tenPlik);
                tab_1_2_2_w14_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'", tenPlik);
                tab_1_2_2_w14_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'", tenPlik);
                tab_1_2_2_w14_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'", tenPlik);
                tab_1_2_2_w14_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'", tenPlik);
                tab_1_2_2_w14_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'", tenPlik);
                tab_1_2_2_w14_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'", tenPlik);
                tab_1_2_2_w14_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'", tenPlik);
                tab_1_2_2_w14_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'", tenPlik);
                tab_1_2_2_w14_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'", tenPlik);
                tab_1_2_2_w14_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'", tenPlik);
                tab_1_2_2_w14_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'", tenPlik);
                tab_1_2_2_w14_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'", tenPlik);
                tab_1_2_2_w14_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'", tenPlik);
                idWiersza = "'15'";
                tab_1_2_2_w15_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_1_2_2_w15_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_1_2_2_w15_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_1_2_2_w15_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_1_2_2_w15_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_1_2_2_w15_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_1_2_2_w15_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_1_2_2_w15_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_1_2_2_w15_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
                tab_1_2_2_w15_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
                tab_1_2_2_w15_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
                tab_1_2_2_w15_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);
                tab_1_2_2_w15_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'", tenPlik);
                tab_1_2_2_w15_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'", tenPlik);
                tab_1_2_2_w15_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'", tenPlik);
                tab_1_2_2_w15_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'", tenPlik);
                tab_1_2_2_w15_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'", tenPlik);
                tab_1_2_2_w15_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'", tenPlik);
                tab_1_2_2_w15_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'", tenPlik);
                tab_1_2_2_w15_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'", tenPlik);
                tab_1_2_2_w15_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'", tenPlik);
                tab_1_2_2_w15_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'", tenPlik);
                tab_1_2_2_w15_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'", tenPlik);
                tab_1_2_2_w15_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'", tenPlik);
                tab_1_2_2_w15_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'", tenPlik);
                tab_1_2_2_w15_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'", tenPlik);
                idWiersza = "'16'";
                tab_1_2_2_w16_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_1_2_2_w16_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_1_2_2_w16_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_1_2_2_w16_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_1_2_2_w16_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_1_2_2_w16_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_1_2_2_w16_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_1_2_2_w16_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_1_2_2_w16_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
                tab_1_2_2_w16_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
                tab_1_2_2_w16_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
                tab_1_2_2_w16_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);
                tab_1_2_2_w16_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'", tenPlik);
                tab_1_2_2_w16_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'", tenPlik);
                tab_1_2_2_w16_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'", tenPlik);
                tab_1_2_2_w16_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'", tenPlik);
                tab_1_2_2_w16_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'", tenPlik);
                tab_1_2_2_w16_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'", tenPlik);
                tab_1_2_2_w16_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'", tenPlik);
                tab_1_2_2_w16_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'", tenPlik);
                tab_1_2_2_w16_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'", tenPlik);
                tab_1_2_2_w16_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'", tenPlik);
                tab_1_2_2_w16_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'", tenPlik);
                tab_1_2_2_w16_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'", tenPlik);
                tab_1_2_2_w16_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'", tenPlik);
                tab_1_2_2_w16_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'", tenPlik);
                idWiersza = "'17'";
                tab_1_2_2_w17_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_1_2_2_w17_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_1_2_2_w17_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_1_2_2_w17_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_1_2_2_w17_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_1_2_2_w17_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_1_2_2_w17_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_1_2_2_w17_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_1_2_2_w17_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
                tab_1_2_2_w17_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
                tab_1_2_2_w17_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
                tab_1_2_2_w17_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);
                tab_1_2_2_w17_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'", tenPlik);
                tab_1_2_2_w17_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'", tenPlik);
                tab_1_2_2_w17_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'", tenPlik);
                tab_1_2_2_w17_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'", tenPlik);
                tab_1_2_2_w17_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'", tenPlik);
                tab_1_2_2_w17_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'", tenPlik);
                tab_1_2_2_w17_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'", tenPlik);
                tab_1_2_2_w17_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'", tenPlik);
                tab_1_2_2_w17_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'", tenPlik);
                tab_1_2_2_w17_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'", tenPlik);
                tab_1_2_2_w17_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'", tenPlik);
                tab_1_2_2_w17_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'", tenPlik);
                tab_1_2_2_w17_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'", tenPlik);
                tab_1_2_2_w17_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'", tenPlik);
                idWiersza = "'18'";
                tab_1_2_2_w18_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_1_2_2_w18_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_1_2_2_w18_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_1_2_2_w18_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_1_2_2_w18_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_1_2_2_w18_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_1_2_2_w18_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_1_2_2_w18_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_1_2_2_w18_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
                tab_1_2_2_w18_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
                tab_1_2_2_w18_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
                tab_1_2_2_w18_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);
                tab_1_2_2_w18_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'", tenPlik);
                tab_1_2_2_w18_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'", tenPlik);
                tab_1_2_2_w18_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'", tenPlik);
                tab_1_2_2_w18_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'", tenPlik);
                tab_1_2_2_w18_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'", tenPlik);
                tab_1_2_2_w18_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'", tenPlik);
                tab_1_2_2_w18_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'", tenPlik);
                tab_1_2_2_w18_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'", tenPlik);
                tab_1_2_2_w18_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'", tenPlik);
                tab_1_2_2_w18_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'", tenPlik);
                tab_1_2_2_w18_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'", tenPlik);
                tab_1_2_2_w18_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'", tenPlik);
                tab_1_2_2_w18_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'", tenPlik);
                tab_1_2_2_w18_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'", tenPlik);
                idWiersza = "'19'";
                tab_1_2_2_w19_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_1_2_2_w19_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_1_2_2_w19_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_1_2_2_w19_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_1_2_2_w19_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_1_2_2_w19_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_1_2_2_w19_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_1_2_2_w19_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_1_2_2_w19_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
                tab_1_2_2_w19_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
                tab_1_2_2_w19_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
                tab_1_2_2_w19_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);
                tab_1_2_2_w19_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'", tenPlik);
                tab_1_2_2_w19_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'", tenPlik);
                tab_1_2_2_w19_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'", tenPlik);
                tab_1_2_2_w19_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'", tenPlik);
                tab_1_2_2_w19_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'", tenPlik);
                tab_1_2_2_w19_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'", tenPlik);
                tab_1_2_2_w19_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'", tenPlik);
                tab_1_2_2_w19_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'", tenPlik);
                tab_1_2_2_w19_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'", tenPlik);
                tab_1_2_2_w19_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'", tenPlik);
                tab_1_2_2_w19_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'", tenPlik);
                tab_1_2_2_w19_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'", tenPlik);
                tab_1_2_2_w19_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'", tenPlik);
                tab_1_2_2_w19_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'", tenPlik);
                idWiersza = "'20'";
                tab_1_2_2_w20_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_1_2_2_w20_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_1_2_2_w20_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_1_2_2_w20_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_1_2_2_w20_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_1_2_2_w20_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_1_2_2_w20_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_1_2_2_w20_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_1_2_2_w20_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
                tab_1_2_2_w20_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
                tab_1_2_2_w20_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
                tab_1_2_2_w20_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);
                tab_1_2_2_w20_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'", tenPlik);
                tab_1_2_2_w20_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'", tenPlik);
                tab_1_2_2_w20_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'", tenPlik);
                tab_1_2_2_w20_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'", tenPlik);
                tab_1_2_2_w20_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'", tenPlik);
                tab_1_2_2_w20_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'", tenPlik);
                tab_1_2_2_w20_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'", tenPlik);
                tab_1_2_2_w20_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'", tenPlik);
                tab_1_2_2_w20_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'", tenPlik);
                tab_1_2_2_w20_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'", tenPlik);
                tab_1_2_2_w20_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'", tenPlik);
                tab_1_2_2_w20_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'", tenPlik);
                tab_1_2_2_w20_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'", tenPlik);
                tab_1_2_2_w20_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'", tenPlik);
                idWiersza = "'21'";
                tab_1_2_2_w21_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_1_2_2_w21_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_1_2_2_w21_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_1_2_2_w21_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_1_2_2_w21_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_1_2_2_w21_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_1_2_2_w21_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_1_2_2_w21_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_1_2_2_w21_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
                tab_1_2_2_w21_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
                tab_1_2_2_w21_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
                tab_1_2_2_w21_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);
                tab_1_2_2_w21_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'", tenPlik);
                tab_1_2_2_w21_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'", tenPlik);
                tab_1_2_2_w21_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'", tenPlik);
                tab_1_2_2_w21_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'", tenPlik);
                tab_1_2_2_w21_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'", tenPlik);
                tab_1_2_2_w21_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'", tenPlik);
                tab_1_2_2_w21_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'", tenPlik);
                tab_1_2_2_w21_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'", tenPlik);
                tab_1_2_2_w21_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'", tenPlik);
                tab_1_2_2_w21_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'", tenPlik);
                tab_1_2_2_w21_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'", tenPlik);
                tab_1_2_2_w21_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'", tenPlik);
                tab_1_2_2_w21_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'", tenPlik);
                tab_1_2_2_w21_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'", tenPlik);
                idWiersza = "'22'";
                tab_1_2_2_w22_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_1_2_2_w22_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_1_2_2_w22_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_1_2_2_w22_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_1_2_2_w22_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_1_2_2_w22_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_1_2_2_w22_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_1_2_2_w22_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_1_2_2_w22_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
                tab_1_2_2_w22_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
                tab_1_2_2_w22_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
                tab_1_2_2_w22_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);
                tab_1_2_2_w22_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'", tenPlik);
                tab_1_2_2_w22_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'", tenPlik);
                tab_1_2_2_w22_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'", tenPlik);
                tab_1_2_2_w22_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'", tenPlik);
                tab_1_2_2_w22_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'", tenPlik);
                tab_1_2_2_w22_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'", tenPlik);
                tab_1_2_2_w22_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'", tenPlik);
                tab_1_2_2_w22_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'", tenPlik);
                tab_1_2_2_w22_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'", tenPlik);
                tab_1_2_2_w22_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'", tenPlik);
                tab_1_2_2_w22_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'", tenPlik);
                tab_1_2_2_w22_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'", tenPlik);
                tab_1_2_2_w22_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'", tenPlik);
                tab_1_2_2_w22_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'", tenPlik);
                idWiersza = "'23'";
                tab_1_2_2_w23_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_1_2_2_w23_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_1_2_2_w23_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_1_2_2_w23_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_1_2_2_w23_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_1_2_2_w23_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_1_2_2_w23_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_1_2_2_w23_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_1_2_2_w23_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
                tab_1_2_2_w23_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
                tab_1_2_2_w23_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
                tab_1_2_2_w23_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);
                tab_1_2_2_w23_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'", tenPlik);
                tab_1_2_2_w23_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'", tenPlik);
                tab_1_2_2_w23_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'", tenPlik);
                tab_1_2_2_w23_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'", tenPlik);
                tab_1_2_2_w23_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'", tenPlik);
                tab_1_2_2_w23_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'", tenPlik);
                tab_1_2_2_w23_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'", tenPlik);
                tab_1_2_2_w23_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'", tenPlik);
                tab_1_2_2_w23_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'", tenPlik);
                tab_1_2_2_w23_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'", tenPlik);
                tab_1_2_2_w23_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'", tenPlik);
                tab_1_2_2_w23_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'", tenPlik);
                tab_1_2_2_w23_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'", tenPlik);
                tab_1_2_2_w23_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'", tenPlik);
                idWiersza = "'24'";
                tab_1_2_2_w24_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_1_2_2_w24_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_1_2_2_w24_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_1_2_2_w24_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_1_2_2_w24_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_1_2_2_w24_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_1_2_2_w24_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_1_2_2_w24_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_1_2_2_w24_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
                tab_1_2_2_w24_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
                tab_1_2_2_w24_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
                tab_1_2_2_w24_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);
                tab_1_2_2_w24_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'", tenPlik);
                tab_1_2_2_w24_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'", tenPlik);
                tab_1_2_2_w24_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'", tenPlik);
                tab_1_2_2_w24_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'", tenPlik);
                tab_1_2_2_w24_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'", tenPlik);
                tab_1_2_2_w24_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'", tenPlik);
                tab_1_2_2_w24_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'", tenPlik);
                tab_1_2_2_w24_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'", tenPlik);
                tab_1_2_2_w24_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'", tenPlik);
                tab_1_2_2_w24_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'", tenPlik);
                tab_1_2_2_w24_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'", tenPlik);
                tab_1_2_2_w24_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'", tenPlik);
                tab_1_2_2_w24_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'", tenPlik);
                tab_1_2_2_w24_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'", tenPlik);
                idWiersza = "'25'";
                tab_1_2_2_w25_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_1_2_2_w25_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_1_2_2_w25_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_1_2_2_w25_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_1_2_2_w25_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_1_2_2_w25_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_1_2_2_w25_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_1_2_2_w25_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_1_2_2_w25_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
                tab_1_2_2_w25_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'", tenPlik);
                tab_1_2_2_w25_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'", tenPlik);
                tab_1_2_2_w25_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'", tenPlik);
                tab_1_2_2_w25_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'", tenPlik);
                tab_1_2_2_w25_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'", tenPlik);
                tab_1_2_2_w25_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'", tenPlik);
                tab_1_2_2_w25_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'", tenPlik);
                tab_1_2_2_w25_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'", tenPlik);
                tab_1_2_2_w25_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'", tenPlik);
                tab_1_2_2_w25_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'", tenPlik);
                tab_1_2_2_w25_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'", tenPlik);
                tab_1_2_2_w25_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'", tenPlik);
                tab_1_2_2_w25_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'", tenPlik);
                tab_1_2_2_w25_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'", tenPlik);
                tab_1_2_2_w25_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'", tenPlik);
                tab_1_2_2_w25_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'", tenPlik);
                tab_1_2_2_w25_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'", tenPlik);

                #endregion "1.2.2";

                #region "1.3";

                idTabeli = "'1.3'";
                idWiersza = "'1'";
                tab_1_3_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_1_3_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_1_3_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_1_3_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_1_3_w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_1_3_w01_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_1_3_w01_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                idWiersza = "'2'";
                tab_1_3_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_1_3_w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_1_3_w02_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_1_3_w02_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_1_3_w02_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_1_3_w02_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_1_3_w02_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                idWiersza = "'3'";
                tab_1_3_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_1_3_w03_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_1_3_w03_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_1_3_w03_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_1_3_w03_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_1_3_w03_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_1_3_w03_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);

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
                //tab_2_1_1_1_

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

                #region "2.1.2"
                pisz("tab_2_1_2_",5,11, tabela2, "'2.1.2'", idWydzialu);
                #endregion

              

                #region "2.2";

                idTabeli = "'2.2'";
                idWiersza = "'1'";
                tab_2_2_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_2_2_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_2_2_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_2_2_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_2_2_w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_2_2_w01_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_2_2_w01_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_2_2_w01_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_2_2_w01_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
                idWiersza = "'2'";
                tab_2_2_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_2_2_w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_2_2_w02_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_2_2_w02_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_2_2_w02_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_2_2_w02_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_2_2_w02_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_2_2_w02_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_2_2_w02_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
                idWiersza = "'3'";
                tab_2_2_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_2_2_w03_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_2_2_w03_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_2_2_w03_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_2_2_w03_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_2_2_w03_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_2_2_w03_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_2_2_w03_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_2_2_w03_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);
                idWiersza = "'4'";
                tab_2_2_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_2_2_w04_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_2_2_w04_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_2_2_w04_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_2_2_w04_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_2_2_w04_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_2_2_w04_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_2_2_w04_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                tab_2_2_w04_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'", tenPlik);

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

                idTabeli = "'12'";
                idWiersza = "'1'";
                tab_12__w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_12__w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_12__w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_12__w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                idWiersza = "'2'";
                tab_12__w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_12__w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_12__w02_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_12__w02_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                idWiersza = "'3'";
                tab_12__w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_12__w03_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_12__w03_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_12__w03_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                idWiersza = "'4'";
                tab_12__w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_12__w04_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_12__w04_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_12__w04_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                idWiersza = "'5'";
                tab_12__w05_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_12__w05_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_12__w05_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_12__w05_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                idWiersza = "'6'";
                tab_12__w06_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_12__w06_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_12__w06_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_12__w06_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                idWiersza = "'7'";
                tab_12__w07_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_12__w07_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_12__w07_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_12__w07_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                idWiersza = "'8'";
                tab_12__w08_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_12__w08_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_12__w08_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_12__w08_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                idWiersza = "'9'";
                tab_12__w09_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_12__w09_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_12__w09_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_12__w09_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                idWiersza = "'10'";
                tab_12__w10_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_12__w10_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_12__w10_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_12__w10_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                idWiersza = "'11'";
                tab_12__w11_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_12__w11_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_12__w11_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_12__w11_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                idWiersza = "'12'";
                tab_12__w12_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_12__w12_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_12__w12_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_12__w12_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                idWiersza = "'13'";
                tab_12__w13_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_12__w13_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_12__w13_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_12__w13_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                idWiersza = "'14'";
                tab_12__w14_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_12__w14_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_12__w14_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_12__w14_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                idWiersza = "'15'";
                tab_12__w15_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_12__w15_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_12__w15_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_12__w15_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                idWiersza = "'16'";
                tab_12__w16_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_12__w16_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_12__w16_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_12__w16_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                idWiersza = "'17'";
                tab_12__w17_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_12__w17_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_12__w17_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_12__w17_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                idWiersza = "'18'";
                tab_12__w18_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_12__w18_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_12__w18_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_12__w18_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                idWiersza = "'19'";
                tab_12__w19_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_12__w19_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_12__w19_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_12__w19_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                idWiersza = "'20'";
                tab_12__w20_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_12__w20_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_12__w20_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_12__w20_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                idWiersza = "'21'";
                tab_12__w21_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_12__w21_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_12__w21_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_12__w21_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                idWiersza = "'22'";
                tab_12__w22_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_12__w22_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_12__w22_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_12__w22_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                idWiersza = "'23'";
                tab_12__w23_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_12__w23_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_12__w23_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_12__w23_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                idWiersza = "'24'";
                tab_12__w24_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_12__w24_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_12__w24_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_12__w24_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                idWiersza = "'25'";
                tab_12__w25_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_12__w25_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_12__w25_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_12__w25_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                idWiersza = "'26'";
                tab_12__w26_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_12__w26_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_12__w26_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_12__w26_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                idWiersza = "'27'";
                tab_12__w27_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_12__w27_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_12__w27_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_12__w27_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                idWiersza = "'28'";
                tab_12__w28_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_12__w28_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_12__w28_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_12__w28_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);

                #endregion "12";

                #region "13.2";

                idTabeli = "'13.2'";
                idWiersza = "'1'";
                tab_13_2__w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_13_2__w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_13_2__w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_13_2__w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_13_2__w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_13_2__w01_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                idWiersza = "'2'";
                tab_13_2__w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_13_2__w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_13_2__w02_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_13_2__w02_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_13_2__w02_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_13_2__w02_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                idWiersza = "'3'";
                tab_13_2__w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_13_2__w03_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_13_2__w03_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_13_2__w03_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_13_2__w03_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_13_2__w03_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                idWiersza = "'4'";
                tab_13_2__w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_13_2__w04_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_13_2__w04_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_13_2__w04_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_13_2__w04_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_13_2__w04_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);

                #endregion "13.2";

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

                //wiersz 1
                idWiersza = "'1'";
                tab_142_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_142_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_142_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_142_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_142_w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_142_w01_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_142_w01_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_142_w01_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);

                //wiersz 2
                idWiersza = "'2'";
                tab_142_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_142_w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_142_w02_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_142_w02_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_142_w02_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_142_w02_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_142_w02_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_142_w02_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);

                //wiersz 3
                idWiersza = "'3'";
                tab_142_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_142_w03_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_142_w03_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_142_w03_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_142_w03_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_142_w03_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_142_w03_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_142_w03_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                //wiersz 4
                idWiersza = "'4'";
                tab_142_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_142_w04_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_142_w04_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_142_w04_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_142_w04_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_142_w04_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_142_w04_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_142_w04_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                //wiersz 5
                idWiersza = "'5'";
                tab_142_w05_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_142_w05_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_142_w05_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_142_w05_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_142_w05_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_142_w05_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_142_w05_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_142_w05_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                //wiersz 6
                idWiersza = "'6'";
                tab_142_w06_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_142_w06_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_142_w06_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_142_w06_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_142_w06_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_142_w06_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_142_w06_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_142_w06_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);

                #endregion "14.2"

                #region "14.3"

                idTabeli = "'14.3'";

                //wiersz 1
                idWiersza = "'1'";
                tab_143_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_143_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_143_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_143_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_143_w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_143_w01_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_143_w01_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_143_w01_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);

                //wiersz 2
                idWiersza = "'2'";
                tab_143_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_143_w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_143_w02_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_143_w02_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_143_w02_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_143_w02_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_143_w02_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_143_w02_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);

                //wiersz 3
                idWiersza = "'3'";
                tab_143_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_143_w03_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_143_w03_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_143_w03_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_143_w03_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_143_w03_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_143_w03_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_143_w03_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                //wiersz 4
                idWiersza = "'4'";
                tab_143_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_143_w04_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_143_w04_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_143_w04_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_143_w04_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_143_w04_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_143_w04_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_143_w04_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                //wiersz 5
                idWiersza = "'5'";
                tab_143_w05_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_143_w05_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_143_w05_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_143_w05_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_143_w05_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_143_w05_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_143_w05_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_143_w05_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);
                //wiersz 6
                idWiersza = "'6'";
                tab_143_w06_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'", tenPlik);
                tab_143_w06_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'", tenPlik);
                tab_143_w06_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'", tenPlik);
                tab_143_w06_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'", tenPlik);
                tab_143_w06_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'", tenPlik);
                tab_143_w06_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'", tenPlik);
                tab_143_w06_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'", tenPlik);
                tab_143_w06_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'", tenPlik);

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
                #endregion 
            }
            catch
            { }

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
                    tabela1Label.Text = "Dział 1.1.1.a.1 Liczba spraw o umieszczenie w szpitalu psychiatrycznym bez zgody, w którym natąpiło przekroczenie terminu 14 dni od dnia wpływu wniosku lub zawiadomienia o przyjęciu do szpitala psychiatrycznego osoby chorej psychicznie lub z zaburzeniami psychicznymi wymaganego w celu odbycia rozprawy [art. 45 ust. 1 ustawy z dnia 19 sierpnia 1994 r. o ochronie zdrowia psychicznego (Dz. U. z 2016 r., poz. 546 )] za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //      tabela2Label.Text = "Dział 1.1.1.a.2. Liczba spraw o umieszczenie w szpitalu psychiatrycznym bez zgody, w których wydano zarządzenie o doprowadzeniu osoby pozostającej w szpitalu, a której postępowanie bezpośrednio dotyczy na rozprawę, stosownie do możliwości przewidzianej w przepisie art. 46 ust. 1a ustawy z dnia 19 sierpnia 1994 r. o ochronie zdrowia psychicznego (Dz. U. z 2016 r., poz. 546) za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //    tabela3Label.Text = "Dział 4.1. Terminowość postępowania międzyinstancyjnego w pierwszej instancji za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    tabela4Label.Text = "Dział 2.2.a. Czas trwania postępowania sądowego od dnia pierwszej rejestracji do dnia uprawomocnienia się sprawy merytorycznie zakończonej (wyrokiem, orzeczeniem) w I instancji (łącznie z czasem trwania mediacji) za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";

                    tabela5Label.Text = "Dział 11.1. Terminowość postępowania międzyinstancyjnego  w pierwszej instancji za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //Informacje o ruchu sprawa za miesiąc: 

                    //Pozostało z ubieglego miesiąca
                }
                else
                {
                    tabela1Label.Text = "Dział 1.1.1.a.1 Liczba spraw o umieszczenie w szpitalu psychiatrycznym bez zgody, w którym natąpiło przekroczenie terminu 14 dni od dnia wpływu wniosku lub zawiadomienia o przyjęciu do szpitala psychiatrycznego osoby chorej psychicznie wymaganego w celu odbycia rozprawy [art. 45 ust. 1 ustawy z dnia 19 sierpnia 1994 r. o ochronie zdrowia psychicznego (Dz. U. z 2016 r., poz. 546 )] za okres od:  " + Date1.Text + " do  " + Date2.Text;
  
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

    }
}