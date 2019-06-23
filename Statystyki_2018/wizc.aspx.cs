using System;
using System.Data;
using System.Text;
using System.Web.UI.WebControls;

namespace stat2018
{
    public partial class wizc : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();
        private string path = string.Empty;
        private const string tenPlik = "wizc.aspx";
        public string tenPlikNazwa = "wizc";
#pragma warning disable CS0414 // The field 'wizc.storid' is assigned but its value is never used
        private int storid = 0;
#pragma warning restore CS0414 // The field 'wizc.storid' is assigned but its value is never used
#pragma warning disable CS0414 // The field 'wizc.rowIndex' is assigned but its value is never used
        private int rowIndex = 1;
#pragma warning restore CS0414 // The field 'wizc.rowIndex' is assigned but its value is never used

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
                DateTime dTime = DateTime.Now;
                dTime = dTime.AddMonths(-1);
                if (Date1.Text.Length == 0) Date1.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-01");
                if (Date2.Text.Length == 0) Date2.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-" + DateTime.DaysInMonth(dTime.Year, dTime.Month).ToString("D2"));
                Session["data_1"] = Date1.Date.ToShortDateString();
                Session["data_2"] = Date2.Date.ToShortDateString();
            }
            catch
            { }
            odswiez();
            //  debug();
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
            int idWydzial = int.Parse((string)Session["id_dzialu"]);
            //odswiezenie danych
            tabela_01(idWydzial, 1);
            tabela_02(idWydzial, 2);

            tabela_3();
            tabela_4();
            tabela_5();
            tabela_6();
            tabela_7();
            tabela_8();
            //wizc_aspx

            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2018(idWydzial, 9, Date1.Date, Date2.Date, 36, tenPlik);
            Session["tabelka009"] = tabelka01;
            tworztabelkeHTML("K1", idWydzial, 9, tabelka01);

            DataTable tabelka02 = dr.generuj_dane_do_tabeli_sedziowskiej_2018(idWydzial, 10, Date1.Date, Date2.Date, 36, tenPlik);
            Session["tabelka010"] = tabelka02;
            tworztabelkeHTML2("K2", idWydzial, 10, tabelka02);

            DataTable tabelka03 = dr.generuj_dane_do_tabeli_sedziowskiej_2018(idWydzial, 11, Date1.Date, Date2.Date, 100, tenPlik);
            Session["tabelka011"] = tabelka03;
            tworztabelkeHTML3("K3", idWydzial, 11, tabelka03);
        }

        private void tabela_01(int idWydzialu, int idtabeli)
        {
            if (cl.debug(idWydzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 1");
            }

            DataTable tabelka01 = dr. generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, idWydzialu.ToString(), idtabeli, 6, 1, tenPlik);
            Session["tabelka001"] = tabelka01;
            try
            {
                tab_1_w01_c01.Text = tabelka01.Rows[0][1].ToString().Trim();
                tab_1_w02_c01.Text = tabelka01.Rows[1][1].ToString().Trim();
                tab_1_w03_c01.Text = tabelka01.Rows[2][1].ToString().Trim();
                tab_1_w04_c01.Text = tabelka01.Rows[3][1].ToString().Trim();
                tab_1_w05_c01.Text = tabelka01.Rows[4][1].ToString().Trim();
                tab_1_w06_c01.Text = tabelka01.Rows[5][1].ToString().Trim();
            }
            catch (Exception ex)
            {
                cm.log.Error("wizc : " + ex.Message);
            }
        }

        private void tabela_02(int idWydzialu, int idtabeli)
        {
            if (cl.debug(idWydzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 2");
            }

            DataTable tabelka01 = dr. generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, idWydzialu.ToString(), idtabeli, 6, 1, tenPlik);
            Session["tabelka002"] = tabelka01;
            try
            {
                tab_2_w01_c01.Text = tabelka01.Rows[0][1].ToString().Trim();
                tab_2_w02_c01.Text = tabelka01.Rows[1][1].ToString().Trim();
                tab_2_w03_c01.Text = tabelka01.Rows[2][1].ToString().Trim();
                tab_2_w04_c01.Text = tabelka01.Rows[3][1].ToString().Trim();
                tab_2_w05_c01.Text = tabelka01.Rows[4][1].ToString().Trim();
                tab_2_w06_c01.Text = tabelka01.Rows[5][1].ToString().Trim();
            }
            catch (Exception ex)
            {
                cm.log.Error("wizc : " + ex.Message);
             }
        }

        protected void tabela_3()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 3");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2018(int.Parse(idDzialu), 3, Date1.Date, Date2.Date, 15, tenPlik);
            Session["tabelka003"] = tabelka01;
            gwTabela3.DataSource = null;
            gwTabela3.DataSourceID = null;
            gwTabela3.DataSource = tabelka01;
            gwTabela3.DataBind();
        }

        protected void tabela_4()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 4");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2018(int.Parse(idDzialu), 4, Date1.Date, Date2.Date, 23, tenPlik);

            Session["tabelka004"] = tabelka01;
            gwTabela3_2.DataSource = null;
            gwTabela3_2.DataSourceID = null;
            gwTabela3_2.DataSource = tabelka01;
            gwTabela3_2.DataBind();
        }

        protected void tabela_5()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 5");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2018(int.Parse(idDzialu), 5, Date1.Date, Date2.Date, 23, tenPlik);

            Session["tabelka005"] = tabelka01;
            gwTabela3_3.DataSource = null;
            gwTabela3_3.DataSourceID = null;
            gwTabela3_3.DataSource = tabelka01;
            gwTabela3_3.DataBind();
        }

        protected void tabela_6()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 6");
            }

            DataTable tabelka01 = dr. generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 6, 2, 1, tenPlik);
            Session["tabelka006"] = tabelka01;
            pisztb("tab_6_", 2, 1, tabelka01);
        }

        protected void tabela_7()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 7");
            }

            DataTable tabelka01 = dr. generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 7, 6,27, tenPlik);
            Session["tabelka007"] = tabelka01;
            pisz("tab_7_", 2, 16, tabelka01);
               tab_7_w03_c01.Text = tabelka01.Rows[3][1].ToString().Trim();
               tab_7_w04_c01.Text = tabelka01.Rows[4][1].ToString().Trim();
               tab_7_w05_c01.Text = tabelka01.Rows[5][1].ToString().Trim();
        }

        protected void tabela_8()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 8");
            }

            DataTable tabelka01 = dr. generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 8, 8, 12, tenPlik);
            Session["tabelka008"] = tabelka01;
            pisz("tab_8_", 8, 12, tabelka01);
        }

        protected void tworzPlikExcell(object sender, EventArgs e)
        {
            //excell
        }

        protected void tab_1_w02_c01_dateInit(object sender, EventArgs e)
        {
            tab_1_w05_c01.Value = DateTime.Now;
        }

        protected void tab_2_w01_c01_dateInit(object sender, EventArgs e)
        {
            tab_2_w01_c01.Value = DateTime.Now;
        }

        protected void naglowekTabeli_gwTabela1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                string path = Server.MapPath("\\Template\\wizc_aspx.xlsx");
                DataTable dT = tb.naglowek(path, 3);
                tb.makeHeader(sn, dT, gwTabela3);
            }
        }

        protected void naglowekTabeli_gwTabela2(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                string path = Server.MapPath("\\Template\\wizc_aspx.xlsx");
                DataTable dT = tb.naglowek(path, 4);
                tb.makeHeader(sn, dT, gwTabela3_2);
            }
        }

        protected void naglowekTabeli_gwTabela3_3(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                string path = Server.MapPath("\\Template\\wizc_aspx.xlsx");
                DataTable dT = tb.naglowek(path, 5);
                tb.makeHeader(sn, dT, gwTabela3_3);
            }
        }

        protected void tworztabelkeHTML(string idKontrolki, int idWydzialu, int idtabeli, DataTable dane)
        {
            if (dane == null)
            {
                return;
            }

            Label tblControl = new Label { ID = idKontrolki };
            tblControl.Width = 1150;
           

            StringBuilder builder = new StringBuilder();
            builder.AppendLine("<table style='width: 1150px;'>");
            //header
            builder.AppendLine("<tr>");
            builder.AppendLine("<td class='borderAll center col_36' rowspan='3'>L.p.</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='3'>imię i nazwisko</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='3'>Funkcja</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='3'></td>");
            builder.AppendLine("<td class='borderAll center' rowspan='3'>pomoc asystenta</td>");
            builder.AppendLine("<td class='borderAll center' colspan='15'>kategoria spraw</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='3'>sprawdzenie(do usunięcia po sprawdzeniu) suma musi dać 100</td>	</tr><tr>");
            builder.AppendLine("<td class='borderAll center col_100'>ogółem</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2'>C</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2'>Cgg</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2'>Co</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2'>Cps</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2'>C- upr</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2'>Nc</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2'>Ns</td>	</tr><tr>");
            builder.AppendLine("<td class='borderAll center col_100'>Liczba</td>");
            builder.AppendLine("<td class='borderAll center col_50'>Liczba</td>");
            builder.AppendLine("<td class='borderAll center col_50'>%</td>");
            builder.AppendLine("<td class='borderAll center col_50'>Liczba</td>");
            builder.AppendLine("<td class='borderAll center col_50'>%</td>");
            builder.AppendLine("<td class='borderAll center col_50'>Liczba</td>");
            builder.AppendLine("<td class='borderAll center col_50'>%</td>");
            builder.AppendLine("<td class='borderAll center col_50'>Liczba</td>");
            builder.AppendLine("<td class='borderAll center col_50'>%</td>");
            builder.AppendLine("<td class='borderAll center col_50'>Liczba</td>");
            builder.AppendLine("<td class='borderAll center col_50'>%</td>");
            builder.AppendLine("<td class='borderAll center col_50'>Liczba</td>");
            builder.AppendLine("<td class='borderAll center col_50'>%</td>");
            builder.AppendLine("<td class='borderAll center col_50'>Liczba</td>");
            builder.AppendLine("<td class='borderAll center col_50'>%</td>	</tr>");

            //ilosc sedziów
            int licznik = 1;
            foreach (DataRow wierszZtabeli in dane.Rows)
            {
                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML(licznik.ToString(), 0, 2, "borderAll center col_36"));
                builder.Append(tb.komorkaHTML(wierszZtabeli["imie"].ToString() + " " + wierszZtabeli["nazwisko"].ToString(), 0, 2, "borderAll center col_100"));
                builder.Append(tb.komorkaHTML(wierszZtabeli["funkcja"].ToString(), 0, 2, "borderAll center col_100"));
                builder.Append(tb.komorkaHTML("Liczba / % spraw na dzień rozpoczęcia wizytacji albo na dzień zamknięcia referatu – dla sędziów przydzielonych do innych wydziałów przed tym dniem", 0, 0, "borderAll center col_100"));

                for (int i = 1; i < 18; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center col_50"));
                }
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML("Liczba / % spraw na dzień rozpoczęcia poprzedniej wizytacji albo na dzień utworzenia referatu –dla sędziów przydzielonych do wydziału po tym dniu", 0, 0, "borderAll center col_100"));
                for (int i = 19; i < 36; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center col_50"));
                }

                licznik++;
                builder.AppendLine("</tr>");
            }
            builder.Append("</table>");

            tblControl.Text = builder.ToString();
            tablePlaceHolder.Controls.Add(tblControl);
        }

        protected void tworztabelkeHTML2(string idKontrolki, int idWydzialu, int idtabeli, DataTable dane)
        {
            if (dane==null)
            {
                cm.log.Error(tenPlik + " Brak danych do tabeli dynamicznej HTML" );
                return;
            }
            var tblControl = new Label { ID = idKontrolki };
            tblControl.Width = 1150;

            StringBuilder builder = new StringBuilder();
            builder.AppendLine("<table style='width: 1150px;'>");
            //header
            builder.AppendLine("<tr>");
            builder.AppendLine("<td class='borderAll center col_36' rowspan='3'>L.p.</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='3'>imię i nazwisko</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='3'>Funkcja</td>");
            builder.AppendLine("<td class='borderAll center' rowspan='3'></td>");
            builder.AppendLine("<td class='borderAll center' colspan='15'>kategoria spraw</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='3'>sprawdzenie(do usunięcia po sprawdzeniu) suma musi dać 100</td>	</tr><tr>");
            builder.AppendLine("<td class='borderAll center col_100'>ogółem</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2'>C</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2'>Cgg</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2'>Co</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2'>Cps</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2'>C- upr</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2'>Nc</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2'>Ns</td>	</tr><tr>");
            builder.AppendLine("<td class='borderAll center col_100'>Liczba</td>");
            builder.AppendLine("<td class='borderAll center col_50'>Liczba</td>");
            builder.AppendLine("<td class='borderAll center col_50'>%</td>");
            builder.AppendLine("<td class='borderAll center col_50'>Liczba</td>");
            builder.AppendLine("<td class='borderAll center col_50'>%</td>");
            builder.AppendLine("<td class='borderAll center col_50'>Liczba</td>");
            builder.AppendLine("<td class='borderAll center col_50'>%</td>");
            builder.AppendLine("<td class='borderAll center col_50'>Liczba</td>");
            builder.AppendLine("<td class='borderAll center col_50'>%</td>");
            builder.AppendLine("<td class='borderAll center col_50'>Liczba</td>");
            builder.AppendLine("<td class='borderAll center col_50'>%</td>");
            builder.AppendLine("<td class='borderAll center col_50'>Liczba</td>");
            builder.AppendLine("<td class='borderAll center col_50'>%</td>");
            builder.AppendLine("<td class='borderAll center col_50'>Liczba</td>");
            builder.AppendLine("<td class='borderAll center col_50'>%</td>	</tr><tr>");

            //ilosc sedziów
            int licznik = 1;
            foreach (DataRow wierszZtabeli in dane.Rows)
            {
                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML(licznik.ToString(), 0, 2, "borderAll center col_36"));
                builder.Append(tb.komorkaHTML(wierszZtabeli["imie"].ToString() + " " + wierszZtabeli["nazwisko"].ToString(), 0, 2, "borderAll center col_100"));
                builder.Append(tb.komorkaHTML(wierszZtabeli["funkcja"].ToString(), 0, 2, "borderAll center col_100"));
                builder.Append(tb.komorkaHTML("Liczba / % spraw na dzień rozpoczęcia wizytacji albo na dzień zamknięcia referatu – dla sędziów przydzielonych do innych wydziałów przed tym dniem", 0, 0, "borderAll center col_100"));

                for (int i = 1; i < 17; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center col_50"));
                }
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML("Liczba / % spraw na dzień rozpoczęcia poprzedniej wizytacji albo na dzień utworzenia referatu –dla sędziów przydzielonych do wydziału po tym dniu", 0, 0, "borderAll center col_100"));
                for (int i = 18; i < 34; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center col_50"));
                }

                licznik++;
                builder.AppendLine("</tr>");
            }
            builder.Append("</table>");

            tblControl.Text = builder.ToString();
            tablePlaceHolder.Controls.Add(tblControl);
        }

        protected void tworztabelkeHTML3(string idKontrolki, int idWydzialu, int idtabeli, DataTable dane)
        {
            if (dane==null )
            {
                cm.log.Error(tenPlik + " Brak danych do tabeli dynamicznej HTML");
                return;
            }
            var tblControl = new Label { ID = idKontrolki };
            tblControl.Width = 1150;

            StringBuilder builder = new StringBuilder();
            builder.AppendLine("<table style='width: 1150px;'>");
            //header
            builder.AppendLine("<tr>");
            builder.AppendLine("<td class='borderAll center col_100'>imię i nazwisko</td>");
            builder.AppendLine("<td class='borderAll center col_100'>Funkcja</td>");
            builder.AppendLine("<td class='borderAll center col_100'>pomoc asystenta</td>");
            builder.AppendLine("<td class='borderAll center'>kategoria spraw</td>");
            builder.AppendLine("<td class='borderAll center'>rok</td>");
            builder.AppendLine("<td class='borderAll center'>wpływ	</td>");
            builder.AppendLine("<td class='borderAll center col_100'>załat- wienia</td>");
            builder.AppendLine("<td class='borderAll center col_100'>pozos- tałość</td>");
            builder.AppendLine("<td class='borderAll center col_100'>sprawy zawieszone</td>");
            builder.AppendLine("<td class='borderAll center col_100'>wpływ na sędziego według liczby sędziów i wakujących stanowisk sędziowskich w ramach limitu</td>");
            builder.AppendLine("<td class='borderAll center col_100'>załatwienia  na sędziego według liczby sędziów i wakujących stanowisk sędziowskich w ramach limitu</td>");
            builder.AppendLine("<td class='borderAll center col_100'>pozostałość na sędziego według liczby sędziów i wakujących stanowisk sędziowskich w ramach limitu</td>");
            builder.AppendLine("<td class='borderAll center col_100' >wpływ na sędziego według obsady średniookresowej (efektywnego czasu pracy)</td>");
            builder.AppendLine("<td class='borderAll center col_100' >załatwienia na sędziego według  obsady średnio- okresowej (efektywnego czasu pracy)</td>");
            builder.AppendLine("<td class='borderAll center col_100' >pozostałość na sędziego według obsady średnio- okresowej (wg limitu)</td>");
            builder.AppendLine("<td class='borderAll center col_100' >wskaźnik pozostałości</td>");
            builder.AppendLine("<td class='borderAll center col_100' >efektywny czas pracy</td>");
            builder.AppendLine("</tr>");

            //ilosc sedziów
        //    int licznik = 1;
            foreach (DataRow wierszZtabeli in dane.Rows)
            {
                builder.AppendLine("<tr>");

                builder.Append(tb.komorkaHTML(wierszZtabeli["imie"].ToString() + " " + wierszZtabeli["nazwisko"].ToString(), 0, 6, "borderAll center col_100"));
                builder.Append(tb.komorkaHTML(wierszZtabeli["funkcja"].ToString(), 0, 6, "borderAll center col_100"));
                builder.Append(tb.komorkaHTML("<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!2')\">" + wierszZtabeli["D_01"].ToString() + " </a>", 0, 6, "borderAll center col_100"));

                builder.Append(tb.komorkaHTML("C", 0, 0, "borderAll center col_100"));

                for (int i = 2; i < 15; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center col_50"));
                }
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");

                builder.Append(tb.komorkaHTML("Cgg", 0, 0, "borderAll center col_100"));
                for (int i = 16; i < 29; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center col_50"));
                }
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML("Co", 0, 0, "borderAll center col_100"));
                for (int i = 30; i < 43; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center col_50"));
                }
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML("Cps", 0, 0, "borderAll center col_100"));
                for (int i = 44; i < 57; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center col_50"));
                }
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML("Nc", 0, 0, "borderAll center col_100"));
                for (int i = 58; i < 71; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center col_50"));
                }
                builder.AppendLine("</tr>");

                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML("Ns", 0, 0, "borderAll center col_100"));
                for (int i = 72; i < 85; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center col_50"));
                }
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");
                builder.AppendLine(tb.komorkaHTML("RAZEM", 2, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!86!2')\">" + wierszZtabeli["D_86"].ToString() + " </a>", 3, 0, "borderAll center col_100"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!87!2')\">" + wierszZtabeli["D_87"].ToString() + " </a > ", 0, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!88!2')\">" + wierszZtabeli["D_88"].ToString() + " </a > ", 0, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!89!2')\">" + wierszZtabeli["D_89"].ToString() + " </a > ", 0, 0, "borderAll center col_50"));

                builder.AppendLine(tb.komorkaHTML("", 3, 2, "borderAll center col_150"));

                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!90!2')\">" + wierszZtabeli["D_90"].ToString() + " </a > ", 0, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!91!2')\">" + wierszZtabeli["D_91"].ToString() + " </a > ", 0, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!92!2')\">" + wierszZtabeli["D_92"].ToString() + " </a > ", 0, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!93!2')\">" + wierszZtabeli["D_93"].ToString() + " </a > ", 0, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!94!2')\">" + wierszZtabeli["D_94"].ToString() + " </a > ", 0, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!95!2')\">" + wierszZtabeli["D_95"].ToString() + " </a > ", 0, 0, "borderAll center col_50"));

                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");
                builder.AppendLine(tb.komorkaHTML("OGÓŁEM za okres oceny", 2, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!2!86')\">000 </a>", 3, 0, "borderAll center col_100"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!2!86')\">000 </a>", 0, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!2!86')\">000 </a>", 0, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!2!86')\">000 </a>", 0, 0, "borderAll center col_50"));

                //     builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja="+ wierszZtabeli["id_sedziego"].ToString() + "!"+idtabeli+"!2!86')\">000 </a>", 3, 2, "borderAll center col_150"));

                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!2!86')\">000 </a>", 0, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!2!86')\">000 </a>", 0, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!2!86')\">000 </a>", 0, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!2!86')\">000 </a>", 0, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!2!86')\">000 </a>", 0, 0, "borderAll center col_50"));
                builder.AppendLine(tb.komorkaHTML("<a Class =\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!2!86')\">000 </a>", 0, 0, "borderAll center col_50"));

                builder.AppendLine("</tr>");
                //licznik++;
            }
            //footer
            //   builder.AppendLine("</tr>");

            builder.Append("</table>");

            tblControl.Text = builder.ToString();
            tablePlaceHolder.Controls.Add(tblControl);
        }

        protected void pisz(string Template, int iloscWierszy, int iloscKolumn, DataTable dane)
        {
            for (int wiersz = 1; wiersz <= iloscWierszy; wiersz++)
            {
                for (int kolumna = 1; kolumna <= iloscKolumn; kolumna++)
                {
                    string controlName = Template + "w" + wiersz.ToString("D2") + "_c" + kolumna.ToString("D2");
                    Label tb = (Label)this.Master.FindControl("ContentPlaceHolder1").FindControl(controlName);
                    if (tb != null)
                    {
                        try
                        {
                            tb.Text = dane.Rows[wiersz - 1][kolumna].ToString().Trim();
                        }
                        catch
                        { }
                    }
                }
            }
        }// end of pisz

        protected void pisztb(string Template, int iloscWierszy, int iloscKolumn, DataTable dane)
        {
            for (int wiersz = 1; wiersz <= iloscWierszy; wiersz++)
            {
                for (int kolumna = 1; kolumna <= iloscKolumn; kolumna++)
                {
                    string controlName = Template + "w" + wiersz.ToString("D2") + "_c" + kolumna.ToString("D2");
                    TextBox tb = (TextBox)this.Master.FindControl("ContentPlaceHolder1").FindControl(controlName);
                    if (tb != null)
                    {
                        try
                        {
                            tb.Text = dane.Rows[wiersz - 1][kolumna].ToString().Trim();
                        }
                        catch
                        { }
                    }
                }
            }
        }// end of pisz

        protected void stopkaTabeli3(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka005"];
                tb.makeSumRow(table, e, 0);
            }
        }

        protected void stopkaTabeli2(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka004"];
                tb.makeSumRow(table, e, 0);
            }
        }

        protected void stopkaTabeli1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka003"];
                tb.makeSumRow(table, e, 0);
            }
        }
    }
}