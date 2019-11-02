﻿using System;
using System.Data;
using System.Text;
using System.Web.UI.WebControls;

namespace stat2018
{
    public partial class wizk : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();
        public XMLHeaders XMLHeaders = new XMLHeaders();

        private string path = string.Empty;
        private const string tenPlik = "wizk.aspx";
        public string tenPlikNazwa = "wizk";

        protected void Page_Load(object sender, EventArgs e)
        {
            string idWydzial =  Request.QueryString["w"];
            try
            {
                if (idWydzial == null)
                {
                    return;
                }
                Session["id_dzialu"] = idWydzial;
                bool dost = true;// cm.dostep(idWydzial, (string)Session["identyfikatorUzytkownika"]);
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
            tabela_9();
            tabela_10();
            tabela_11();
            tabela_12();
            tabela_13();
            tabela_14();
            makeLabels();
        }

        private void tabela_01(int idWydzialu, int idtabeli)
        {
            if (cl.debug(idWydzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 1");
            }

            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, idWydzialu.ToString(), idtabeli, 6, 1, tenPlik);
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

            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, idWydzialu.ToString(), idtabeli, 6, 1, tenPlik);
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
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 3");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2018(idDzialu, 3, Date1.Date, Date2.Date, 36, tenPlik);
            Session["tabelka003"] = tabelka01;
            tworztabelkeHTMLTabela3("tb3", idDzialu, 3, tabelka01);
        }

        protected void tabela_4()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 4");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idDzialu, 3, Date1.Date, Date2.Date, 160, tenPlik);
            Session["tabelka003"] = tabelka01;
            tworztabelkeHTMLTabela4("tb4", idDzialu, 3, tabelka01);
        }

        protected void tabela_5()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 5");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idDzialu, 5, Date1.Date, Date2.Date, 160, tenPlik);

            Session["tabelka005"] = tabelka01;
            tworztabelkeHTMLTabela5("tb5", idDzialu, 5, tabelka01);
        }

        protected void tabela_6()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 6");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idDzialu, 6, Date1.Date, Date2.Date, 160, tenPlik);

            Session["tabelka006"] = tabelka01;
            tworztabelkeHTMLTabela6("tb6", idDzialu, 6, tabelka01);
        }

        protected void tabela_7()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 7");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idDzialu, 7, Date1.Date, Date2.Date, 160, tenPlik);

            Session["tabelka007"] = tabelka01;
            tworztabelkeHTMLTabela7("tb7", idDzialu, 7, tabelka01);
        }

        protected void tabela_8()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 8");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, idDzialu.ToString (), 8, 8, 40, tenPlik);
            if (tabelka01==null)
            {
                cm.log.Error(tenPlik + " Brak danych dla tabeli 8!");
                return;
            }
            //  wiersz 1
            try
            {
                tab_8_w01_c01.Text = tabelka01.Rows[0][1].ToString().Trim();
                tab_8_w01_c02.Text = tabelka01.Rows[0][2].ToString().Trim();
                tab_8_w01_c03.Text = tabelka01.Rows[0][3].ToString().Trim();
                tab_8_w01_c04.Text = tabelka01.Rows[0][4].ToString().Trim();
                tab_8_w01_c05.Text = tabelka01.Rows[0][5].ToString().Trim();
                tab_8_w01_c06.Text = tabelka01.Rows[0][6].ToString().Trim();
                tab_8_w01_c07.Text = tabelka01.Rows[0][7].ToString().Trim();
                tab_8_w01_c08.Text = tabelka01.Rows[0][8].ToString().Trim();
                tab_8_w01_c09.Text = tabelka01.Rows[0][9].ToString().Trim();
                tab_8_w01_c10.Text = tabelka01.Rows[0][10].ToString().Trim();
                tab_8_w01_c11.Text = tabelka01.Rows[0][11].ToString().Trim();
                tab_8_w01_c12.Text = tabelka01.Rows[0][12].ToString().Trim();
                tab_8_w01_c13.Text = tabelka01.Rows[0][13].ToString().Trim();
                tab_8_w01_c14.Text = tabelka01.Rows[0][14].ToString().Trim();
                tab_8_w01_c15.Text = tabelka01.Rows[0][15].ToString().Trim();
                //  wiersz 2
                tab_8_w02_c01.Text = tabelka01.Rows[1][1].ToString().Trim();
                tab_8_w02_c02.Text = tabelka01.Rows[1][2].ToString().Trim();
                tab_8_w02_c03.Text = tabelka01.Rows[1][3].ToString().Trim();
                tab_8_w02_c04.Text = tabelka01.Rows[1][4].ToString().Trim();
                tab_8_w02_c05.Text = tabelka01.Rows[1][5].ToString().Trim();
                tab_8_w02_c06.Text = tabelka01.Rows[1][6].ToString().Trim();
                tab_8_w02_c07.Text = tabelka01.Rows[1][7].ToString().Trim();
                tab_8_w02_c08.Text = tabelka01.Rows[1][8].ToString().Trim();
                tab_8_w02_c09.Text = tabelka01.Rows[1][9].ToString().Trim();
                tab_8_w02_c10.Text = tabelka01.Rows[1][10].ToString().Trim();
                tab_8_w02_c11.Text = tabelka01.Rows[1][11].ToString().Trim();
                tab_8_w02_c12.Text = tabelka01.Rows[1][12].ToString().Trim();
                tab_8_w02_c13.Text = tabelka01.Rows[1][13].ToString().Trim();
                tab_8_w02_c14.Text = tabelka01.Rows[1][14].ToString().Trim();
                tab_8_w02_c15.Text = tabelka01.Rows[1][15].ToString().Trim();
                //  wiersz 3
                tab_8_w03_c01.Text = tabelka01.Rows[2][1].ToString().Trim();
                tab_8_w03_c02.Text = tabelka01.Rows[2][2].ToString().Trim();
                tab_8_w03_c03.Text = tabelka01.Rows[2][3].ToString().Trim();
                tab_8_w03_c04.Text = tabelka01.Rows[2][4].ToString().Trim();
                tab_8_w03_c05.Text = tabelka01.Rows[2][5].ToString().Trim();
                tab_8_w03_c06.Text = tabelka01.Rows[2][6].ToString().Trim();
                tab_8_w03_c07.Text = tabelka01.Rows[2][7].ToString().Trim();
                tab_8_w03_c08.Text = tabelka01.Rows[2][8].ToString().Trim();
                tab_8_w03_c09.Text = tabelka01.Rows[2][9].ToString().Trim();
                tab_8_w03_c10.Text = tabelka01.Rows[2][10].ToString().Trim();
                tab_8_w03_c11.Text = tabelka01.Rows[2][11].ToString().Trim();
                tab_8_w03_c12.Text = tabelka01.Rows[2][12].ToString().Trim();
                tab_8_w03_c13.Text = tabelka01.Rows[2][13].ToString().Trim();
                tab_8_w03_c14.Text = tabelka01.Rows[2][14].ToString().Trim();
                tab_8_w03_c15.Text = tabelka01.Rows[2][15].ToString().Trim();
                //  wiersz 4
                tab_8_w04_c01.Text = tabelka01.Rows[3][1].ToString().Trim();
                tab_8_w04_c02.Text = tabelka01.Rows[3][2].ToString().Trim();
                tab_8_w04_c03.Text = tabelka01.Rows[3][3].ToString().Trim();
                tab_8_w04_c04.Text = tabelka01.Rows[3][4].ToString().Trim();
                tab_8_w04_c05.Text = tabelka01.Rows[3][5].ToString().Trim();
                tab_8_w04_c06.Text = tabelka01.Rows[3][6].ToString().Trim();
                tab_8_w04_c07.Text = tabelka01.Rows[3][7].ToString().Trim();
                tab_8_w04_c08.Text = tabelka01.Rows[3][8].ToString().Trim();
                tab_8_w04_c09.Text = tabelka01.Rows[3][9].ToString().Trim();
                tab_8_w04_c10.Text = tabelka01.Rows[3][10].ToString().Trim();
                tab_8_w04_c11.Text = tabelka01.Rows[3][11].ToString().Trim();
                tab_8_w04_c12.Text = tabelka01.Rows[3][12].ToString().Trim();
                tab_8_w04_c13.Text = tabelka01.Rows[3][13].ToString().Trim();
                tab_8_w04_c14.Text = tabelka01.Rows[3][14].ToString().Trim();
                tab_8_w04_c15.Text = tabelka01.Rows[3][15].ToString().Trim();
            }
            catch 
            {

            }
           
        }

        protected void tabela_9()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 9");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, idDzialu.ToString(), 9, 3, 2, tenPlik);
            if (tabelka01 == null)
            {
                cm.log.Error(tenPlik + " Brak danych dla tabeli 8!");
                return;
            }
            //  wiersz 1
            tab_9_w01_c01.Text = tabelka01.Rows[0][1].ToString().Trim();
            //  wiersz 2
            tab_9_w02_c01.Text = tabelka01.Rows[1][1].ToString().Trim();
            //  wiersz 3
            tab_9_w03_c01.Text = tabelka01.Rows[2][1].ToString().Trim();
        }

        protected void tabela_10()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 10");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, idDzialu.ToString(), 10, 8, 40, tenPlik);
            if (tabelka01 == null)
            {
                cm.log.Error(tenPlik + " Brak danych dla tabeli 10!");
                return;
            }
            //  wiersz 1
            tab_10_w01_c01.Text = tabelka01.Rows[0][1].ToString().Trim();
            tab_10_w01_c02.Text = tabelka01.Rows[0][2].ToString().Trim();
            tab_10_w01_c03.Text = tabelka01.Rows[0][3].ToString().Trim();
            tab_10_w01_c04.Text = tabelka01.Rows[0][4].ToString().Trim();
            tab_10_w01_c05.Text = tabelka01.Rows[0][5].ToString().Trim();
            tab_10_w01_c06.Text = tabelka01.Rows[0][6].ToString().Trim();
            tab_10_w01_c07.Text = tabelka01.Rows[0][7].ToString().Trim();
            tab_10_w01_c08.Text = tabelka01.Rows[0][8].ToString().Trim();
            tab_10_w01_c09.Text = tabelka01.Rows[0][9].ToString().Trim();
            tab_10_w01_c10.Text = tabelka01.Rows[0][10].ToString().Trim();
            tab_10_w01_c11.Text = tabelka01.Rows[0][11].ToString().Trim();
            tab_10_w01_c12.Text = tabelka01.Rows[0][12].ToString().Trim();
            tab_10_w01_c13.Text = tabelka01.Rows[0][13].ToString().Trim();
            tab_10_w01_c14.Text = tabelka01.Rows[0][14].ToString().Trim();
            tab_10_w01_c15.Text = tabelka01.Rows[0][15].ToString().Trim();
            tab_10_w01_c16.Text = tabelka01.Rows[0][16].ToString().Trim();
            tab_10_w01_c17.Text = tabelka01.Rows[0][17].ToString().Trim();
            tab_10_w01_c18.Text = tabelka01.Rows[0][18].ToString().Trim();
            tab_10_w01_c19.Text = tabelka01.Rows[0][19].ToString().Trim();
            tab_10_w01_c20.Text = tabelka01.Rows[0][20].ToString().Trim();
            tab_10_w01_c21.Text = tabelka01.Rows[0][21].ToString().Trim();
            tab_10_w01_c22.Text = tabelka01.Rows[0][22].ToString().Trim();
            tab_10_w01_c23.Text = tabelka01.Rows[0][23].ToString().Trim();
            tab_10_w01_c24.Text = tabelka01.Rows[0][24].ToString().Trim();
            tab_10_w01_c25.Text = tabelka01.Rows[0][25].ToString().Trim();
            tab_10_w01_c26.Text = tabelka01.Rows[0][26].ToString().Trim();
            tab_10_w01_c27.Text = tabelka01.Rows[0][27].ToString().Trim();
            tab_10_w01_c28.Text = tabelka01.Rows[0][28].ToString().Trim();
            tab_10_w01_c29.Text = tabelka01.Rows[0][29].ToString().Trim();
            tab_10_w01_c30.Text = tabelka01.Rows[0][30].ToString().Trim();
            tab_10_w01_c31.Text = tabelka01.Rows[0][31].ToString().Trim();
            tab_10_w01_c32.Text = tabelka01.Rows[0][32].ToString().Trim();
            tab_10_w01_c33.Text = tabelka01.Rows[0][33].ToString().Trim();
            tab_10_w01_c34.Text = tabelka01.Rows[0][34].ToString().Trim();
            tab_10_w01_c35.Text = tabelka01.Rows[0][35].ToString().Trim();
            tab_10_w01_c36.Text = tabelka01.Rows[0][36].ToString().Trim();
            //  wiersz 2
            tab_10_w02_c01.Text = tabelka01.Rows[1][1].ToString().Trim();
            tab_10_w02_c02.Text = tabelka01.Rows[1][2].ToString().Trim();
            tab_10_w02_c03.Text = tabelka01.Rows[1][3].ToString().Trim();
            tab_10_w02_c04.Text = tabelka01.Rows[1][4].ToString().Trim();
            tab_10_w02_c05.Text = tabelka01.Rows[1][5].ToString().Trim();
            tab_10_w02_c06.Text = tabelka01.Rows[1][6].ToString().Trim();
            tab_10_w02_c07.Text = tabelka01.Rows[1][7].ToString().Trim();
            tab_10_w02_c08.Text = tabelka01.Rows[1][8].ToString().Trim();
            tab_10_w02_c09.Text = tabelka01.Rows[1][9].ToString().Trim();
            tab_10_w02_c10.Text = tabelka01.Rows[1][10].ToString().Trim();
            tab_10_w02_c11.Text = tabelka01.Rows[1][11].ToString().Trim();
            tab_10_w02_c12.Text = tabelka01.Rows[1][12].ToString().Trim();
            tab_10_w02_c13.Text = tabelka01.Rows[1][13].ToString().Trim();
            tab_10_w02_c14.Text = tabelka01.Rows[1][14].ToString().Trim();
            tab_10_w02_c15.Text = tabelka01.Rows[1][15].ToString().Trim();
            tab_10_w02_c16.Text = tabelka01.Rows[1][16].ToString().Trim();
            tab_10_w02_c17.Text = tabelka01.Rows[1][17].ToString().Trim();
            tab_10_w02_c18.Text = tabelka01.Rows[1][18].ToString().Trim();
            tab_10_w02_c19.Text = tabelka01.Rows[1][19].ToString().Trim();
            tab_10_w02_c20.Text = tabelka01.Rows[1][20].ToString().Trim();
            tab_10_w02_c21.Text = tabelka01.Rows[1][21].ToString().Trim();
            tab_10_w02_c22.Text = tabelka01.Rows[1][22].ToString().Trim();
            tab_10_w02_c23.Text = tabelka01.Rows[1][23].ToString().Trim();
            tab_10_w02_c24.Text = tabelka01.Rows[1][24].ToString().Trim();
            tab_10_w02_c25.Text = tabelka01.Rows[1][25].ToString().Trim();
            tab_10_w02_c26.Text = tabelka01.Rows[1][26].ToString().Trim();
            tab_10_w02_c27.Text = tabelka01.Rows[1][27].ToString().Trim();
            tab_10_w02_c28.Text = tabelka01.Rows[1][28].ToString().Trim();
            tab_10_w02_c29.Text = tabelka01.Rows[1][29].ToString().Trim();
            tab_10_w02_c30.Text = tabelka01.Rows[1][30].ToString().Trim();
            tab_10_w02_c31.Text = tabelka01.Rows[1][31].ToString().Trim();
            tab_10_w02_c32.Text = tabelka01.Rows[1][32].ToString().Trim();
            tab_10_w02_c33.Text = tabelka01.Rows[1][33].ToString().Trim();
            tab_10_w02_c34.Text = tabelka01.Rows[1][34].ToString().Trim();
            tab_10_w02_c35.Text = tabelka01.Rows[1][35].ToString().Trim();
            tab_10_w02_c36.Text = tabelka01.Rows[1][36].ToString().Trim();
            //  wiersz 3
            tab_10_w03_c01.Text = tabelka01.Rows[2][1].ToString().Trim();
            tab_10_w03_c02.Text = tabelka01.Rows[2][2].ToString().Trim();
            tab_10_w03_c03.Text = tabelka01.Rows[2][3].ToString().Trim();
            tab_10_w03_c04.Text = tabelka01.Rows[2][4].ToString().Trim();
            tab_10_w03_c05.Text = tabelka01.Rows[2][5].ToString().Trim();
            tab_10_w03_c06.Text = tabelka01.Rows[2][6].ToString().Trim();
            tab_10_w03_c07.Text = tabelka01.Rows[2][7].ToString().Trim();
            tab_10_w03_c08.Text = tabelka01.Rows[2][8].ToString().Trim();
            tab_10_w03_c09.Text = tabelka01.Rows[2][9].ToString().Trim();
            tab_10_w03_c10.Text = tabelka01.Rows[2][10].ToString().Trim();
            tab_10_w03_c11.Text = tabelka01.Rows[2][11].ToString().Trim();
            tab_10_w03_c12.Text = tabelka01.Rows[2][12].ToString().Trim();
            tab_10_w03_c13.Text = tabelka01.Rows[2][13].ToString().Trim();
            tab_10_w03_c14.Text = tabelka01.Rows[2][14].ToString().Trim();
            tab_10_w03_c15.Text = tabelka01.Rows[2][15].ToString().Trim();
            tab_10_w03_c16.Text = tabelka01.Rows[2][16].ToString().Trim();
            tab_10_w03_c17.Text = tabelka01.Rows[2][17].ToString().Trim();
            tab_10_w03_c18.Text = tabelka01.Rows[2][18].ToString().Trim();
            tab_10_w03_c19.Text = tabelka01.Rows[2][19].ToString().Trim();
            tab_10_w03_c20.Text = tabelka01.Rows[2][20].ToString().Trim();
            tab_10_w03_c21.Text = tabelka01.Rows[2][21].ToString().Trim();
            tab_10_w03_c22.Text = tabelka01.Rows[2][22].ToString().Trim();
            tab_10_w03_c23.Text = tabelka01.Rows[2][23].ToString().Trim();
            tab_10_w03_c24.Text = tabelka01.Rows[2][24].ToString().Trim();
            tab_10_w03_c25.Text = tabelka01.Rows[2][25].ToString().Trim();
            tab_10_w03_c26.Text = tabelka01.Rows[2][26].ToString().Trim();
            tab_10_w03_c27.Text = tabelka01.Rows[2][27].ToString().Trim();
            tab_10_w03_c28.Text = tabelka01.Rows[2][28].ToString().Trim();
            tab_10_w03_c29.Text = tabelka01.Rows[2][29].ToString().Trim();
            tab_10_w03_c30.Text = tabelka01.Rows[2][30].ToString().Trim();
            tab_10_w03_c31.Text = tabelka01.Rows[2][31].ToString().Trim();
            tab_10_w03_c32.Text = tabelka01.Rows[2][32].ToString().Trim();
            tab_10_w03_c33.Text = tabelka01.Rows[2][33].ToString().Trim();
            tab_10_w03_c34.Text = tabelka01.Rows[2][34].ToString().Trim();
            tab_10_w03_c35.Text = tabelka01.Rows[2][35].ToString().Trim();
            tab_10_w03_c36.Text = tabelka01.Rows[2][36].ToString().Trim();
            //  wiersz 4
            tab_10_w04_c01.Text = tabelka01.Rows[3][1].ToString().Trim();
            tab_10_w04_c02.Text = tabelka01.Rows[3][2].ToString().Trim();
            tab_10_w04_c03.Text = tabelka01.Rows[3][3].ToString().Trim();
            tab_10_w04_c04.Text = tabelka01.Rows[3][4].ToString().Trim();
            tab_10_w04_c05.Text = tabelka01.Rows[3][5].ToString().Trim();
            tab_10_w04_c06.Text = tabelka01.Rows[3][6].ToString().Trim();
            tab_10_w04_c07.Text = tabelka01.Rows[3][7].ToString().Trim();
            tab_10_w04_c08.Text = tabelka01.Rows[3][8].ToString().Trim();
            tab_10_w04_c09.Text = tabelka01.Rows[3][9].ToString().Trim();
            tab_10_w04_c10.Text = tabelka01.Rows[3][10].ToString().Trim();
            tab_10_w04_c11.Text = tabelka01.Rows[3][11].ToString().Trim();
            tab_10_w04_c12.Text = tabelka01.Rows[3][12].ToString().Trim();
            tab_10_w04_c13.Text = tabelka01.Rows[3][13].ToString().Trim();
            tab_10_w04_c14.Text = tabelka01.Rows[3][14].ToString().Trim();
            tab_10_w04_c15.Text = tabelka01.Rows[3][15].ToString().Trim();
            tab_10_w04_c16.Text = tabelka01.Rows[3][16].ToString().Trim();
            tab_10_w04_c17.Text = tabelka01.Rows[3][17].ToString().Trim();
            tab_10_w04_c18.Text = tabelka01.Rows[3][18].ToString().Trim();
            tab_10_w04_c19.Text = tabelka01.Rows[3][19].ToString().Trim();
            tab_10_w04_c20.Text = tabelka01.Rows[3][20].ToString().Trim();
            tab_10_w04_c21.Text = tabelka01.Rows[3][21].ToString().Trim();
            tab_10_w04_c22.Text = tabelka01.Rows[3][22].ToString().Trim();
            tab_10_w04_c23.Text = tabelka01.Rows[3][23].ToString().Trim();
            tab_10_w04_c24.Text = tabelka01.Rows[3][24].ToString().Trim();
            tab_10_w04_c25.Text = tabelka01.Rows[3][25].ToString().Trim();
            tab_10_w04_c26.Text = tabelka01.Rows[3][26].ToString().Trim();
            tab_10_w04_c27.Text = tabelka01.Rows[3][27].ToString().Trim();
            tab_10_w04_c28.Text = tabelka01.Rows[3][28].ToString().Trim();
            tab_10_w04_c29.Text = tabelka01.Rows[3][29].ToString().Trim();
            tab_10_w04_c30.Text = tabelka01.Rows[3][30].ToString().Trim();
            tab_10_w04_c31.Text = tabelka01.Rows[3][31].ToString().Trim();
            tab_10_w04_c32.Text = tabelka01.Rows[3][32].ToString().Trim();
            tab_10_w04_c33.Text = tabelka01.Rows[3][33].ToString().Trim();
            tab_10_w04_c34.Text = tabelka01.Rows[3][34].ToString().Trim();
            tab_10_w04_c35.Text = tabelka01.Rows[3][35].ToString().Trim();
            tab_10_w04_c36.Text = tabelka01.Rows[3][36].ToString().Trim();
            //  wiersz 5
            tab_10_w05_c01.Text = tabelka01.Rows[4][1].ToString().Trim();
            tab_10_w05_c02.Text = tabelka01.Rows[4][2].ToString().Trim();
            tab_10_w05_c03.Text = tabelka01.Rows[4][3].ToString().Trim();
            tab_10_w05_c04.Text = tabelka01.Rows[4][4].ToString().Trim();
            tab_10_w05_c05.Text = tabelka01.Rows[4][5].ToString().Trim();
            tab_10_w05_c06.Text = tabelka01.Rows[4][6].ToString().Trim();
            tab_10_w05_c07.Text = tabelka01.Rows[4][7].ToString().Trim();
            tab_10_w05_c08.Text = tabelka01.Rows[4][8].ToString().Trim();
            tab_10_w05_c09.Text = tabelka01.Rows[4][9].ToString().Trim();
            tab_10_w05_c10.Text = tabelka01.Rows[4][10].ToString().Trim();
            tab_10_w05_c11.Text = tabelka01.Rows[4][11].ToString().Trim();
            tab_10_w05_c12.Text = tabelka01.Rows[4][12].ToString().Trim();
            tab_10_w05_c13.Text = tabelka01.Rows[4][13].ToString().Trim();
            tab_10_w05_c14.Text = tabelka01.Rows[4][14].ToString().Trim();
            tab_10_w05_c15.Text = tabelka01.Rows[4][15].ToString().Trim();
            tab_10_w05_c16.Text = tabelka01.Rows[4][16].ToString().Trim();
            tab_10_w05_c17.Text = tabelka01.Rows[4][17].ToString().Trim();
            tab_10_w05_c18.Text = tabelka01.Rows[4][18].ToString().Trim();
            tab_10_w05_c19.Text = tabelka01.Rows[4][19].ToString().Trim();
            tab_10_w05_c20.Text = tabelka01.Rows[4][20].ToString().Trim();
            tab_10_w05_c21.Text = tabelka01.Rows[4][21].ToString().Trim();
            tab_10_w05_c22.Text = tabelka01.Rows[4][22].ToString().Trim();
            tab_10_w05_c23.Text = tabelka01.Rows[4][23].ToString().Trim();
            tab_10_w05_c24.Text = tabelka01.Rows[4][24].ToString().Trim();
            tab_10_w05_c25.Text = tabelka01.Rows[4][25].ToString().Trim();
            tab_10_w05_c26.Text = tabelka01.Rows[4][26].ToString().Trim();
            tab_10_w05_c27.Text = tabelka01.Rows[4][27].ToString().Trim();
            tab_10_w05_c28.Text = tabelka01.Rows[4][28].ToString().Trim();
            tab_10_w05_c29.Text = tabelka01.Rows[4][29].ToString().Trim();
            tab_10_w05_c30.Text = tabelka01.Rows[4][30].ToString().Trim();
            tab_10_w05_c31.Text = tabelka01.Rows[4][31].ToString().Trim();
            tab_10_w05_c32.Text = tabelka01.Rows[4][32].ToString().Trim();
            tab_10_w05_c33.Text = tabelka01.Rows[4][33].ToString().Trim();
            tab_10_w05_c34.Text = tabelka01.Rows[4][34].ToString().Trim();
            tab_10_w05_c35.Text = tabelka01.Rows[4][35].ToString().Trim();
            tab_10_w05_c36.Text = tabelka01.Rows[4][36].ToString().Trim();
            //  wiersz 6
            tab_10_w06_c01.Text = tabelka01.Rows[5][1].ToString().Trim();
            tab_10_w06_c02.Text = tabelka01.Rows[5][2].ToString().Trim();
            tab_10_w06_c03.Text = tabelka01.Rows[5][3].ToString().Trim();
            tab_10_w06_c04.Text = tabelka01.Rows[5][4].ToString().Trim();
            tab_10_w06_c05.Text = tabelka01.Rows[5][5].ToString().Trim();
            tab_10_w06_c06.Text = tabelka01.Rows[5][6].ToString().Trim();
            tab_10_w06_c07.Text = tabelka01.Rows[5][7].ToString().Trim();
            tab_10_w06_c08.Text = tabelka01.Rows[5][8].ToString().Trim();
            tab_10_w06_c09.Text = tabelka01.Rows[5][9].ToString().Trim();
            tab_10_w06_c10.Text = tabelka01.Rows[5][10].ToString().Trim();
            tab_10_w06_c11.Text = tabelka01.Rows[5][11].ToString().Trim();
            tab_10_w06_c12.Text = tabelka01.Rows[5][12].ToString().Trim();
            tab_10_w06_c13.Text = tabelka01.Rows[5][13].ToString().Trim();
            tab_10_w06_c14.Text = tabelka01.Rows[5][14].ToString().Trim();
            tab_10_w06_c15.Text = tabelka01.Rows[5][15].ToString().Trim();
            tab_10_w06_c16.Text = tabelka01.Rows[5][16].ToString().Trim();
            tab_10_w06_c17.Text = tabelka01.Rows[5][17].ToString().Trim();
            tab_10_w06_c18.Text = tabelka01.Rows[5][18].ToString().Trim();
            tab_10_w06_c19.Text = tabelka01.Rows[5][19].ToString().Trim();
            tab_10_w06_c20.Text = tabelka01.Rows[5][20].ToString().Trim();
            tab_10_w06_c21.Text = tabelka01.Rows[5][21].ToString().Trim();
            tab_10_w06_c22.Text = tabelka01.Rows[5][22].ToString().Trim();
            tab_10_w06_c23.Text = tabelka01.Rows[5][23].ToString().Trim();
            tab_10_w06_c24.Text = tabelka01.Rows[5][24].ToString().Trim();
            tab_10_w06_c25.Text = tabelka01.Rows[5][25].ToString().Trim();
            tab_10_w06_c26.Text = tabelka01.Rows[5][26].ToString().Trim();
            tab_10_w06_c27.Text = tabelka01.Rows[5][27].ToString().Trim();
            tab_10_w06_c28.Text = tabelka01.Rows[5][28].ToString().Trim();
            tab_10_w06_c29.Text = tabelka01.Rows[5][29].ToString().Trim();
            tab_10_w06_c30.Text = tabelka01.Rows[5][30].ToString().Trim();
            tab_10_w06_c31.Text = tabelka01.Rows[5][31].ToString().Trim();
            tab_10_w06_c32.Text = tabelka01.Rows[5][32].ToString().Trim();
            tab_10_w06_c33.Text = tabelka01.Rows[5][33].ToString().Trim();
            tab_10_w06_c34.Text = tabelka01.Rows[5][34].ToString().Trim();
            tab_10_w06_c35.Text = tabelka01.Rows[5][35].ToString().Trim();
            tab_10_w06_c36.Text = tabelka01.Rows[5][36].ToString().Trim();
            //  wiersz 7
            tab_10_w07_c01.Text = tabelka01.Rows[6][1].ToString().Trim();
            tab_10_w07_c02.Text = tabelka01.Rows[6][2].ToString().Trim();
            tab_10_w07_c03.Text = tabelka01.Rows[6][3].ToString().Trim();
            tab_10_w07_c04.Text = tabelka01.Rows[6][4].ToString().Trim();
            tab_10_w07_c05.Text = tabelka01.Rows[6][5].ToString().Trim();
            tab_10_w07_c06.Text = tabelka01.Rows[6][6].ToString().Trim();
            tab_10_w07_c07.Text = tabelka01.Rows[6][7].ToString().Trim();
            tab_10_w07_c08.Text = tabelka01.Rows[6][8].ToString().Trim();
            tab_10_w07_c09.Text = tabelka01.Rows[6][9].ToString().Trim();
            tab_10_w07_c10.Text = tabelka01.Rows[6][10].ToString().Trim();
            tab_10_w07_c11.Text = tabelka01.Rows[6][11].ToString().Trim();
            tab_10_w07_c12.Text = tabelka01.Rows[6][12].ToString().Trim();
            tab_10_w07_c13.Text = tabelka01.Rows[6][13].ToString().Trim();
            tab_10_w07_c14.Text = tabelka01.Rows[6][14].ToString().Trim();
            tab_10_w07_c15.Text = tabelka01.Rows[6][15].ToString().Trim();
            tab_10_w07_c16.Text = tabelka01.Rows[6][16].ToString().Trim();
            tab_10_w07_c17.Text = tabelka01.Rows[6][17].ToString().Trim();
            tab_10_w07_c18.Text = tabelka01.Rows[6][18].ToString().Trim();
            tab_10_w07_c19.Text = tabelka01.Rows[6][19].ToString().Trim();
            tab_10_w07_c20.Text = tabelka01.Rows[6][20].ToString().Trim();
            tab_10_w07_c21.Text = tabelka01.Rows[6][21].ToString().Trim();
            tab_10_w07_c22.Text = tabelka01.Rows[6][22].ToString().Trim();
            tab_10_w07_c23.Text = tabelka01.Rows[6][23].ToString().Trim();
            tab_10_w07_c24.Text = tabelka01.Rows[6][24].ToString().Trim();
            tab_10_w07_c25.Text = tabelka01.Rows[6][25].ToString().Trim();
            tab_10_w07_c26.Text = tabelka01.Rows[6][26].ToString().Trim();
            tab_10_w07_c27.Text = tabelka01.Rows[6][27].ToString().Trim();
            tab_10_w07_c28.Text = tabelka01.Rows[6][28].ToString().Trim();
            tab_10_w07_c29.Text = tabelka01.Rows[6][29].ToString().Trim();
            tab_10_w07_c30.Text = tabelka01.Rows[6][30].ToString().Trim();
            tab_10_w07_c31.Text = tabelka01.Rows[6][31].ToString().Trim();
            tab_10_w07_c32.Text = tabelka01.Rows[6][32].ToString().Trim();
            tab_10_w07_c33.Text = tabelka01.Rows[6][33].ToString().Trim();
            tab_10_w07_c34.Text = tabelka01.Rows[6][34].ToString().Trim();
            tab_10_w07_c35.Text = tabelka01.Rows[6][35].ToString().Trim();
            tab_10_w07_c36.Text = tabelka01.Rows[6][36].ToString().Trim();
            //  wiersz 8
            tab_10_w08_c01.Text = tabelka01.Rows[7][1].ToString().Trim();
            tab_10_w08_c02.Text = tabelka01.Rows[7][2].ToString().Trim();
            tab_10_w08_c03.Text = tabelka01.Rows[7][3].ToString().Trim();
            tab_10_w08_c04.Text = tabelka01.Rows[7][4].ToString().Trim();
            tab_10_w08_c05.Text = tabelka01.Rows[7][5].ToString().Trim();
            tab_10_w08_c06.Text = tabelka01.Rows[7][6].ToString().Trim();
            tab_10_w08_c07.Text = tabelka01.Rows[7][7].ToString().Trim();
            tab_10_w08_c08.Text = tabelka01.Rows[7][8].ToString().Trim();
            tab_10_w08_c09.Text = tabelka01.Rows[7][9].ToString().Trim();
            tab_10_w08_c10.Text = tabelka01.Rows[7][10].ToString().Trim();
            tab_10_w08_c11.Text = tabelka01.Rows[7][11].ToString().Trim();
            tab_10_w08_c12.Text = tabelka01.Rows[7][12].ToString().Trim();
        }

        protected void tabela_11()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 11");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idDzialu, 11, Date1.Date, Date2.Date, 160, tenPlik);
            if (tabelka01 == null)
            {
                cm.log.Error(tenPlik + " Brak danych dla tabeli 11!");
                return;
            }
            Session["tabelka011"] = tabelka01;
            tworztabelkeHTMLTabela11("tb11", idDzialu, 11, tabelka01);
        }
        protected void tabela_12()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 12");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idDzialu, 12, Date1.Date, Date2.Date, 160, tenPlik);
            if (tabelka01 == null)
            {
                cm.log.Error(tenPlik + " Brak danych dla tabeli 12!");
                return;
            }
            Session["tabelka012"] = tabelka01;
            tworztabelkeHTMLTabela12("tb12", idDzialu, 12, tabelka01);
        }
        protected void tabela_13()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 13");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(idDzialu, 13, Date1.Date, Date2.Date, 460, tenPlik);
            if (tabelka01 == null)
            {
                cm.log.Error(tenPlik + " Brak danych dla tabeli 13!");
                return;
            }
            Session["tabelka013"] = tabelka01;
            tworztabelkeHTMLTabela13("tb13", idDzialu, 13, tabelka01);
        }
        protected void tabela_14()
        {
            int idDzialu = int.Parse((string)Session["id_dzialu"]);
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 10");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, idDzialu.ToString(), 14, 23, 16, tenPlik);
            if (tabelka01 == null)
            {
                cm.log.Error(tenPlik + " Brak danych dla tabeli 14!");
                return;
            }
            //  wiersz 1
            tab_14_w01_c01.Text = tabelka01.Rows[0][1].ToString().Trim();
            tab_14_w01_c02.Text = tabelka01.Rows[0][2].ToString().Trim();
            tab_14_w01_c03.Text = tabelka01.Rows[0][3].ToString().Trim();
            tab_14_w01_c04.Text = tabelka01.Rows[0][4].ToString().Trim();
            tab_14_w01_c05.Text = tabelka01.Rows[0][5].ToString().Trim();
            tab_14_w01_c06.Text = tabelka01.Rows[0][6].ToString().Trim();
            tab_14_w01_c07.Text = tabelka01.Rows[0][7].ToString().Trim();
            tab_14_w01_c08.Text = tabelka01.Rows[0][8].ToString().Trim();
            tab_14_w01_c09.Text = tabelka01.Rows[0][9].ToString().Trim();
            tab_14_w01_c10.Text = tabelka01.Rows[0][10].ToString().Trim();
            tab_14_w01_c11.Text = tabelka01.Rows[0][11].ToString().Trim();
            tab_14_w01_c12.Text = tabelka01.Rows[0][12].ToString().Trim();
            tab_14_w01_c13.Text = tabelka01.Rows[0][13].ToString().Trim();
          
            //  wiersz 2
            tab_14_w02_c01.Text = tabelka01.Rows[1][1].ToString().Trim();
            tab_14_w02_c02.Text = tabelka01.Rows[1][2].ToString().Trim();
            tab_14_w02_c03.Text = tabelka01.Rows[1][3].ToString().Trim();
            tab_14_w02_c04.Text = tabelka01.Rows[1][4].ToString().Trim();
            tab_14_w02_c05.Text = tabelka01.Rows[1][5].ToString().Trim();
            tab_14_w02_c06.Text = tabelka01.Rows[1][6].ToString().Trim();
            tab_14_w02_c07.Text = tabelka01.Rows[1][7].ToString().Trim();
            tab_14_w02_c08.Text = tabelka01.Rows[1][8].ToString().Trim();
            tab_14_w02_c09.Text = tabelka01.Rows[1][9].ToString().Trim();
            tab_14_w02_c10.Text = tabelka01.Rows[1][10].ToString().Trim();
            tab_14_w02_c11.Text = tabelka01.Rows[1][11].ToString().Trim();
            tab_14_w02_c12.Text = tabelka01.Rows[1][12].ToString().Trim();
            tab_14_w02_c13.Text = tabelka01.Rows[1][13].ToString().Trim();
            //  wiersz 3
            tab_14_w03_c01.Text = tabelka01.Rows[2][1].ToString().Trim();
            tab_14_w03_c02.Text = tabelka01.Rows[2][2].ToString().Trim();
            tab_14_w03_c03.Text = tabelka01.Rows[2][3].ToString().Trim();
            tab_14_w03_c04.Text = tabelka01.Rows[2][4].ToString().Trim();
            tab_14_w03_c05.Text = tabelka01.Rows[2][5].ToString().Trim();
            tab_14_w03_c06.Text = tabelka01.Rows[2][6].ToString().Trim();
            tab_14_w03_c07.Text = tabelka01.Rows[2][7].ToString().Trim();
            tab_14_w03_c08.Text = tabelka01.Rows[2][8].ToString().Trim();
            tab_14_w03_c09.Text = tabelka01.Rows[2][9].ToString().Trim();
            tab_14_w03_c10.Text = tabelka01.Rows[2][10].ToString().Trim();
            tab_14_w03_c11.Text = tabelka01.Rows[2][11].ToString().Trim();
            tab_14_w03_c12.Text = tabelka01.Rows[2][12].ToString().Trim();
            tab_14_w03_c13.Text = tabelka01.Rows[2][13].ToString().Trim();
               //  wiersz 4
            tab_14_w04_c01.Text = tabelka01.Rows[3][1].ToString().Trim();
            tab_14_w04_c02.Text = tabelka01.Rows[3][2].ToString().Trim();
            tab_14_w04_c03.Text = tabelka01.Rows[3][3].ToString().Trim();
            tab_14_w04_c04.Text = tabelka01.Rows[3][4].ToString().Trim();
            tab_14_w04_c05.Text = tabelka01.Rows[3][5].ToString().Trim();
            tab_14_w04_c06.Text = tabelka01.Rows[3][6].ToString().Trim();
            tab_14_w04_c07.Text = tabelka01.Rows[3][7].ToString().Trim();
            tab_14_w04_c08.Text = tabelka01.Rows[3][8].ToString().Trim();
            tab_14_w04_c09.Text = tabelka01.Rows[3][9].ToString().Trim();
            tab_14_w04_c10.Text = tabelka01.Rows[3][10].ToString().Trim();
            tab_14_w04_c11.Text = tabelka01.Rows[3][11].ToString().Trim();
            tab_14_w04_c12.Text = tabelka01.Rows[3][12].ToString().Trim();
            tab_14_w04_c13.Text = tabelka01.Rows[3][13].ToString().Trim();
             //  wiersz 5
            tab_14_w05_c01.Text = tabelka01.Rows[4][1].ToString().Trim();
            tab_14_w05_c02.Text = tabelka01.Rows[4][2].ToString().Trim();
            tab_14_w05_c03.Text = tabelka01.Rows[4][3].ToString().Trim();
            tab_14_w05_c04.Text = tabelka01.Rows[4][4].ToString().Trim();
            tab_14_w05_c05.Text = tabelka01.Rows[4][5].ToString().Trim();
            tab_14_w05_c06.Text = tabelka01.Rows[4][6].ToString().Trim();
            tab_14_w05_c07.Text = tabelka01.Rows[4][7].ToString().Trim();
            tab_14_w05_c08.Text = tabelka01.Rows[4][8].ToString().Trim();
            tab_14_w05_c09.Text = tabelka01.Rows[4][9].ToString().Trim();
            tab_14_w05_c10.Text = tabelka01.Rows[4][10].ToString().Trim();
            tab_14_w05_c11.Text = tabelka01.Rows[4][11].ToString().Trim();
            tab_14_w05_c12.Text = tabelka01.Rows[4][12].ToString().Trim();
            tab_14_w05_c13.Text = tabelka01.Rows[4][13].ToString().Trim();
             //  wiersz 6
            tab_14_w06_c01.Text = tabelka01.Rows[5][1].ToString().Trim();
            tab_14_w06_c02.Text = tabelka01.Rows[5][2].ToString().Trim();
            tab_14_w06_c03.Text = tabelka01.Rows[5][3].ToString().Trim();
            tab_14_w06_c04.Text = tabelka01.Rows[5][4].ToString().Trim();
            tab_14_w06_c05.Text = tabelka01.Rows[5][5].ToString().Trim();
            tab_14_w06_c06.Text = tabelka01.Rows[5][6].ToString().Trim();
            tab_14_w06_c07.Text = tabelka01.Rows[5][7].ToString().Trim();
            tab_14_w06_c08.Text = tabelka01.Rows[5][8].ToString().Trim();
            tab_14_w06_c09.Text = tabelka01.Rows[5][9].ToString().Trim();
            tab_14_w06_c10.Text = tabelka01.Rows[5][10].ToString().Trim();
            tab_14_w06_c11.Text = tabelka01.Rows[5][11].ToString().Trim();
            tab_14_w06_c12.Text = tabelka01.Rows[5][12].ToString().Trim();
            tab_14_w06_c13.Text = tabelka01.Rows[5][13].ToString().Trim();
              //  wiersz 7
            tab_14_w07_c01.Text = tabelka01.Rows[6][1].ToString().Trim();
            tab_14_w07_c02.Text = tabelka01.Rows[6][2].ToString().Trim();
            tab_14_w07_c03.Text = tabelka01.Rows[6][3].ToString().Trim();
            tab_14_w07_c04.Text = tabelka01.Rows[6][4].ToString().Trim();
            tab_14_w07_c05.Text = tabelka01.Rows[6][5].ToString().Trim();
            tab_14_w07_c06.Text = tabelka01.Rows[6][6].ToString().Trim();
            tab_14_w07_c07.Text = tabelka01.Rows[6][7].ToString().Trim();
            tab_14_w07_c08.Text = tabelka01.Rows[6][8].ToString().Trim();
            tab_14_w07_c09.Text = tabelka01.Rows[6][9].ToString().Trim();
            tab_14_w07_c10.Text = tabelka01.Rows[6][10].ToString().Trim();
            tab_14_w07_c11.Text = tabelka01.Rows[6][11].ToString().Trim();
            tab_14_w07_c12.Text = tabelka01.Rows[6][12].ToString().Trim();
            tab_14_w07_c13.Text = tabelka01.Rows[6][13].ToString().Trim();
             //  wiersz 8
            tab_14_w08_c01.Text = tabelka01.Rows[7][1].ToString().Trim();
            tab_14_w08_c02.Text = tabelka01.Rows[7][2].ToString().Trim();
            tab_14_w08_c03.Text = tabelka01.Rows[7][3].ToString().Trim();
            tab_14_w08_c04.Text = tabelka01.Rows[7][4].ToString().Trim();
            tab_14_w08_c05.Text = tabelka01.Rows[7][5].ToString().Trim();
            tab_14_w08_c06.Text = tabelka01.Rows[7][6].ToString().Trim();
            tab_14_w08_c07.Text = tabelka01.Rows[7][7].ToString().Trim();
            tab_14_w08_c08.Text = tabelka01.Rows[7][8].ToString().Trim();
            tab_14_w08_c09.Text = tabelka01.Rows[7][9].ToString().Trim();
            tab_14_w08_c10.Text = tabelka01.Rows[7][10].ToString().Trim();
            tab_14_w08_c11.Text = tabelka01.Rows[7][11].ToString().Trim();
            tab_14_w08_c12.Text = tabelka01.Rows[7][12].ToString().Trim();
            tab_14_w08_c13.Text = tabelka01.Rows[7][13].ToString().Trim();
              //  wiersz 9
            tab_14_w09_c01.Text = tabelka01.Rows[8][1].ToString().Trim();
            tab_14_w09_c02.Text = tabelka01.Rows[8][2].ToString().Trim();
            tab_14_w09_c03.Text = tabelka01.Rows[8][3].ToString().Trim();
            tab_14_w09_c04.Text = tabelka01.Rows[8][4].ToString().Trim();
            tab_14_w09_c05.Text = tabelka01.Rows[8][5].ToString().Trim();
            tab_14_w09_c06.Text = tabelka01.Rows[8][6].ToString().Trim();
            tab_14_w09_c07.Text = tabelka01.Rows[8][7].ToString().Trim();
            tab_14_w09_c08.Text = tabelka01.Rows[8][8].ToString().Trim();
            tab_14_w09_c09.Text = tabelka01.Rows[8][9].ToString().Trim();
            tab_14_w09_c10.Text = tabelka01.Rows[8][10].ToString().Trim();
            tab_14_w09_c11.Text = tabelka01.Rows[8][11].ToString().Trim();
            tab_14_w09_c12.Text = tabelka01.Rows[8][12].ToString().Trim();
            tab_14_w09_c13.Text = tabelka01.Rows[8][13].ToString().Trim();
            //  wiersz 10
            tab_14_w10_c01.Text = tabelka01.Rows[9][1].ToString().Trim();
            tab_14_w10_c02.Text = tabelka01.Rows[9][2].ToString().Trim();
            tab_14_w10_c03.Text = tabelka01.Rows[9][3].ToString().Trim();
            tab_14_w10_c04.Text = tabelka01.Rows[9][4].ToString().Trim();
            tab_14_w10_c05.Text = tabelka01.Rows[9][5].ToString().Trim();
            tab_14_w10_c06.Text = tabelka01.Rows[9][6].ToString().Trim();
            tab_14_w10_c07.Text = tabelka01.Rows[9][7].ToString().Trim();
            tab_14_w10_c08.Text = tabelka01.Rows[9][8].ToString().Trim();
            tab_14_w10_c09.Text = tabelka01.Rows[9][9].ToString().Trim();
            tab_14_w10_c10.Text = tabelka01.Rows[9][10].ToString().Trim();
            tab_14_w10_c11.Text = tabelka01.Rows[9][11].ToString().Trim();
            tab_14_w10_c12.Text = tabelka01.Rows[9][12].ToString().Trim();
            tab_14_w10_c13.Text = tabelka01.Rows[9][13].ToString().Trim();
            //  wiersz 11
            tab_14_w11_c01.Text = tabelka01.Rows[10][1].ToString().Trim();
            tab_14_w11_c02.Text = tabelka01.Rows[10][2].ToString().Trim();
            tab_14_w11_c03.Text = tabelka01.Rows[10][3].ToString().Trim();
            tab_14_w11_c04.Text = tabelka01.Rows[10][4].ToString().Trim();
            tab_14_w11_c05.Text = tabelka01.Rows[10][5].ToString().Trim();
            tab_14_w11_c06.Text = tabelka01.Rows[10][6].ToString().Trim();
            tab_14_w11_c07.Text = tabelka01.Rows[10][7].ToString().Trim();
            tab_14_w11_c08.Text = tabelka01.Rows[10][8].ToString().Trim();
            tab_14_w11_c09.Text = tabelka01.Rows[10][9].ToString().Trim();
            tab_14_w11_c10.Text = tabelka01.Rows[10][10].ToString().Trim();
            tab_14_w11_c11.Text = tabelka01.Rows[10][11].ToString().Trim();
            tab_14_w11_c12.Text = tabelka01.Rows[10][12].ToString().Trim();
            tab_14_w11_c13.Text = tabelka01.Rows[10][13].ToString().Trim();
            //  wiersz 12
            tab_14_w12_c01.Text = tabelka01.Rows[11][1].ToString().Trim();
            tab_14_w12_c02.Text = tabelka01.Rows[11][2].ToString().Trim();
            tab_14_w12_c03.Text = tabelka01.Rows[11][3].ToString().Trim();
            tab_14_w12_c04.Text = tabelka01.Rows[11][4].ToString().Trim();
            tab_14_w12_c05.Text = tabelka01.Rows[11][5].ToString().Trim();
            tab_14_w12_c06.Text = tabelka01.Rows[11][6].ToString().Trim();
            tab_14_w12_c07.Text = tabelka01.Rows[11][7].ToString().Trim();
            tab_14_w12_c08.Text = tabelka01.Rows[11][8].ToString().Trim();
            tab_14_w12_c09.Text = tabelka01.Rows[11][9].ToString().Trim();
            tab_14_w12_c10.Text = tabelka01.Rows[11][10].ToString().Trim();
            tab_14_w12_c11.Text = tabelka01.Rows[11][11].ToString().Trim();
            tab_14_w12_c12.Text = tabelka01.Rows[11][12].ToString().Trim();
            tab_14_w12_c13.Text = tabelka01.Rows[11][13].ToString().Trim();
            //  wiersz 13
            tab_14_w13_c01.Text = tabelka01.Rows[12][1].ToString().Trim();
            tab_14_w13_c02.Text = tabelka01.Rows[12][2].ToString().Trim();
            tab_14_w13_c03.Text = tabelka01.Rows[12][3].ToString().Trim();
            tab_14_w13_c04.Text = tabelka01.Rows[12][4].ToString().Trim();
            tab_14_w13_c05.Text = tabelka01.Rows[12][5].ToString().Trim();
            tab_14_w13_c06.Text = tabelka01.Rows[12][6].ToString().Trim();
            tab_14_w13_c07.Text = tabelka01.Rows[12][7].ToString().Trim();
            tab_14_w13_c08.Text = tabelka01.Rows[12][8].ToString().Trim();
            tab_14_w13_c09.Text = tabelka01.Rows[12][9].ToString().Trim();
            tab_14_w13_c10.Text = tabelka01.Rows[12][10].ToString().Trim();
            tab_14_w13_c11.Text = tabelka01.Rows[12][11].ToString().Trim();
            tab_14_w13_c12.Text = tabelka01.Rows[12][12].ToString().Trim();
            tab_14_w13_c13.Text = tabelka01.Rows[12][13].ToString().Trim();
            //  wiersz 14
            tab_14_w14_c01.Text = tabelka01.Rows[13][1].ToString().Trim();
            tab_14_w14_c02.Text = tabelka01.Rows[13][2].ToString().Trim();
            tab_14_w14_c03.Text = tabelka01.Rows[13][3].ToString().Trim();
            tab_14_w14_c04.Text = tabelka01.Rows[13][4].ToString().Trim();
            tab_14_w14_c05.Text = tabelka01.Rows[13][5].ToString().Trim();
            tab_14_w14_c06.Text = tabelka01.Rows[13][6].ToString().Trim();
            tab_14_w14_c07.Text = tabelka01.Rows[13][7].ToString().Trim();
            tab_14_w14_c08.Text = tabelka01.Rows[13][8].ToString().Trim();
            tab_14_w14_c09.Text = tabelka01.Rows[13][9].ToString().Trim();
            tab_14_w14_c10.Text = tabelka01.Rows[13][10].ToString().Trim();
            tab_14_w14_c11.Text = tabelka01.Rows[13][11].ToString().Trim();
            tab_14_w14_c12.Text = tabelka01.Rows[13][12].ToString().Trim();
            tab_14_w14_c13.Text = tabelka01.Rows[13][13].ToString().Trim();
            //  wiersz 15
            tab_14_w15_c01.Text = tabelka01.Rows[14][1].ToString().Trim();
            tab_14_w15_c02.Text = tabelka01.Rows[14][2].ToString().Trim();
            tab_14_w15_c03.Text = tabelka01.Rows[14][3].ToString().Trim();
            tab_14_w15_c04.Text = tabelka01.Rows[14][4].ToString().Trim();
            tab_14_w15_c05.Text = tabelka01.Rows[14][5].ToString().Trim();
            tab_14_w15_c06.Text = tabelka01.Rows[14][6].ToString().Trim();
            tab_14_w15_c07.Text = tabelka01.Rows[14][7].ToString().Trim();
            tab_14_w15_c08.Text = tabelka01.Rows[14][8].ToString().Trim();
            tab_14_w15_c09.Text = tabelka01.Rows[14][9].ToString().Trim();
            tab_14_w15_c10.Text = tabelka01.Rows[14][10].ToString().Trim();
            tab_14_w15_c11.Text = tabelka01.Rows[14][11].ToString().Trim();
            tab_14_w15_c12.Text = tabelka01.Rows[14][12].ToString().Trim();
            tab_14_w15_c13.Text = tabelka01.Rows[14][13].ToString().Trim();
            //  wiersz 16
            tab_14_w16_c01.Text = tabelka01.Rows[15][1].ToString().Trim();
            tab_14_w16_c02.Text = tabelka01.Rows[15][2].ToString().Trim();
            tab_14_w16_c03.Text = tabelka01.Rows[15][3].ToString().Trim();
            tab_14_w16_c04.Text = tabelka01.Rows[15][4].ToString().Trim();
            tab_14_w16_c05.Text = tabelka01.Rows[15][5].ToString().Trim();
            tab_14_w16_c06.Text = tabelka01.Rows[15][6].ToString().Trim();
            tab_14_w16_c07.Text = tabelka01.Rows[15][7].ToString().Trim();
            tab_14_w16_c08.Text = tabelka01.Rows[15][8].ToString().Trim();
            tab_14_w16_c09.Text = tabelka01.Rows[15][9].ToString().Trim();
            tab_14_w16_c10.Text = tabelka01.Rows[15][10].ToString().Trim();
            tab_14_w16_c11.Text = tabelka01.Rows[15][11].ToString().Trim();
            tab_14_w16_c12.Text = tabelka01.Rows[15][12].ToString().Trim();
            tab_14_w16_c13.Text = tabelka01.Rows[15][13].ToString().Trim();
            //  wiersz 17
            tab_14_w17_c01.Text = tabelka01.Rows[16][1].ToString().Trim();
            tab_14_w17_c02.Text = tabelka01.Rows[16][2].ToString().Trim();
            tab_14_w17_c03.Text = tabelka01.Rows[16][3].ToString().Trim();
            tab_14_w17_c04.Text = tabelka01.Rows[16][4].ToString().Trim();
            tab_14_w17_c05.Text = tabelka01.Rows[16][5].ToString().Trim();
            tab_14_w17_c06.Text = tabelka01.Rows[16][6].ToString().Trim();
            tab_14_w17_c07.Text = tabelka01.Rows[16][7].ToString().Trim();
            tab_14_w17_c08.Text = tabelka01.Rows[16][8].ToString().Trim();
            tab_14_w17_c09.Text = tabelka01.Rows[16][9].ToString().Trim();
            tab_14_w17_c10.Text = tabelka01.Rows[16][10].ToString().Trim();
            tab_14_w17_c11.Text = tabelka01.Rows[16][11].ToString().Trim();
            tab_14_w17_c12.Text = tabelka01.Rows[16][12].ToString().Trim();
            tab_14_w17_c13.Text = tabelka01.Rows[16][13].ToString().Trim();
            //  wiersz 18
            tab_14_w18_c01.Text = tabelka01.Rows[17][1].ToString().Trim();
            tab_14_w18_c02.Text = tabelka01.Rows[17][2].ToString().Trim();
            tab_14_w18_c03.Text = tabelka01.Rows[17][3].ToString().Trim();
            tab_14_w18_c04.Text = tabelka01.Rows[17][4].ToString().Trim();
            tab_14_w18_c05.Text = tabelka01.Rows[17][5].ToString().Trim();
            tab_14_w18_c06.Text = tabelka01.Rows[17][6].ToString().Trim();
            tab_14_w18_c07.Text = tabelka01.Rows[17][7].ToString().Trim();
            tab_14_w18_c08.Text = tabelka01.Rows[17][8].ToString().Trim();
            tab_14_w18_c09.Text = tabelka01.Rows[17][9].ToString().Trim();
            tab_14_w18_c10.Text = tabelka01.Rows[17][10].ToString().Trim();
            tab_14_w18_c11.Text = tabelka01.Rows[17][11].ToString().Trim();
            tab_14_w18_c12.Text = tabelka01.Rows[17][12].ToString().Trim();
            tab_14_w18_c13.Text = tabelka01.Rows[17][13].ToString().Trim();
            //  wiersz 19
            tab_14_w19_c01.Text = tabelka01.Rows[18][1].ToString().Trim();
            tab_14_w19_c02.Text = tabelka01.Rows[18][2].ToString().Trim();
            tab_14_w19_c03.Text = tabelka01.Rows[18][3].ToString().Trim();
            tab_14_w19_c04.Text = tabelka01.Rows[18][4].ToString().Trim();
            tab_14_w19_c05.Text = tabelka01.Rows[18][5].ToString().Trim();
            tab_14_w19_c06.Text = tabelka01.Rows[18][6].ToString().Trim();
            tab_14_w19_c07.Text = tabelka01.Rows[18][7].ToString().Trim();
            tab_14_w19_c08.Text = tabelka01.Rows[18][8].ToString().Trim();
            tab_14_w19_c09.Text = tabelka01.Rows[18][9].ToString().Trim();
            tab_14_w19_c10.Text = tabelka01.Rows[18][10].ToString().Trim();
            tab_14_w19_c11.Text = tabelka01.Rows[18][11].ToString().Trim();
            tab_14_w19_c12.Text = tabelka01.Rows[18][12].ToString().Trim();
            tab_14_w19_c13.Text = tabelka01.Rows[18][13].ToString().Trim();
            //  wiersz 20
            tab_14_w20_c01.Text = tabelka01.Rows[19][1].ToString().Trim();
            tab_14_w20_c02.Text = tabelka01.Rows[19][2].ToString().Trim();
            tab_14_w20_c03.Text = tabelka01.Rows[19][3].ToString().Trim();
            tab_14_w20_c04.Text = tabelka01.Rows[19][4].ToString().Trim();
            tab_14_w20_c05.Text = tabelka01.Rows[19][5].ToString().Trim();
            tab_14_w20_c06.Text = tabelka01.Rows[19][6].ToString().Trim();
            tab_14_w20_c07.Text = tabelka01.Rows[19][7].ToString().Trim();
            tab_14_w20_c08.Text = tabelka01.Rows[19][8].ToString().Trim();
            tab_14_w20_c09.Text = tabelka01.Rows[19][9].ToString().Trim();
            tab_14_w20_c10.Text = tabelka01.Rows[19][10].ToString().Trim();
            tab_14_w20_c11.Text = tabelka01.Rows[19][11].ToString().Trim();
            tab_14_w20_c12.Text = tabelka01.Rows[19][12].ToString().Trim();
            tab_14_w20_c13.Text = tabelka01.Rows[19][13].ToString().Trim();
            //  wiersz 21
            tab_14_w21_c01.Text = tabelka01.Rows[20][1].ToString().Trim();
            tab_14_w21_c02.Text = tabelka01.Rows[20][2].ToString().Trim();
            tab_14_w21_c03.Text = tabelka01.Rows[20][3].ToString().Trim();
            tab_14_w21_c04.Text = tabelka01.Rows[20][4].ToString().Trim();
            tab_14_w21_c05.Text = tabelka01.Rows[20][5].ToString().Trim();
            tab_14_w21_c06.Text = tabelka01.Rows[20][6].ToString().Trim();
            tab_14_w21_c07.Text = tabelka01.Rows[20][7].ToString().Trim();
            tab_14_w21_c08.Text = tabelka01.Rows[20][8].ToString().Trim();
            tab_14_w21_c09.Text = tabelka01.Rows[20][9].ToString().Trim();
            tab_14_w21_c10.Text = tabelka01.Rows[20][10].ToString().Trim();
            tab_14_w21_c11.Text = tabelka01.Rows[20][11].ToString().Trim();
            tab_14_w21_c12.Text = tabelka01.Rows[20][12].ToString().Trim();
            tab_14_w21_c13.Text = tabelka01.Rows[20][13].ToString().Trim();
            //  wiersz 22
            tab_14_w22_c01.Text = tabelka01.Rows[21][1].ToString().Trim();
            tab_14_w22_c02.Text = tabelka01.Rows[21][2].ToString().Trim();
            tab_14_w22_c03.Text = tabelka01.Rows[21][3].ToString().Trim();
            tab_14_w22_c04.Text = tabelka01.Rows[21][4].ToString().Trim();
            tab_14_w22_c05.Text = tabelka01.Rows[21][5].ToString().Trim();
            tab_14_w22_c06.Text = tabelka01.Rows[21][6].ToString().Trim();
            tab_14_w22_c07.Text = tabelka01.Rows[21][7].ToString().Trim();
            tab_14_w22_c08.Text = tabelka01.Rows[21][8].ToString().Trim();
            tab_14_w22_c09.Text = tabelka01.Rows[21][9].ToString().Trim();
            tab_14_w22_c10.Text = tabelka01.Rows[21][10].ToString().Trim();
            tab_14_w22_c11.Text = tabelka01.Rows[21][11].ToString().Trim();
            tab_14_w22_c12.Text = tabelka01.Rows[21][12].ToString().Trim();
            tab_14_w22_c13.Text = tabelka01.Rows[21][13].ToString().Trim();
 

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

        protected void tworztabelkeHTMLTabela3(string idKontrolki, int idWydzialu, int idtabeli, DataTable dane)
        {
            if (dane == null)
            {
                return;
            }

            StringBuilder builder = new StringBuilder();
            builder.AppendLine("<table style='width: 1150px;'>");
            //header
            builder.AppendLine("<tr>");
            builder.AppendLine("<td class='borderAll center col_36' rowspan='2'>L.p.</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='2'>imię i nazwisko</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='2'>okres pracy w wydziale</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='2'>pełniona funkcja</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='2'>okres pełnienia funkcji</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='2'>wymiar czasu pracy w wydziale wg podziału czynności</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='2'>efektywny czas pracy (w miesiącach) </td>");
            builder.AppendLine("<td class='borderAll center' colspan='6'>Wyznaczone sesje (jawne/niejawne)</td>");
            builder.AppendLine("	</tr>");
            builder.AppendLine("<td class='borderAll center col_100'>Liczba wyznaczonych sesji na rozprawy</td>");
            builder.AppendLine("<td class='borderAll center col_100' >Liczba wyznaczonych sesji na posiedzaniach </td>");
            builder.AppendLine("<td class='borderAll center col_100' >Liczba sesji jawnych i niejawnych OGÓŁEM</td>");
            builder.AppendLine("<td class='borderAll center col_100' >średnia liczba sesji OGÓŁEM miesięcznie w efektywnym czasie pracy</td>");
            builder.AppendLine("<td class='borderAll center col_100' >średnia liczba sesji jawnych miesięcznie w efektywnym czasie pracy</td>");
            builder.AppendLine("<td class='borderAll center col_100' >średnia liczba sesji niejawnych  miesięcznie w efektywnym czasie pracy</td>");
            builder.AppendLine("	</tr>");

            //ilosc sedziów
            int licznik = 1;
            foreach (DataRow wierszZtabeli in dane.Rows)
            {
                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML(licznik.ToString(), 0, 3, "borderAll center col_36"));
                builder.Append(tb.komorkaHTML(wierszZtabeli["imie"].ToString() + " " + wierszZtabeli["nazwisko"].ToString(), 0, 3, "borderAll center col_100"));

                for (int i = 1; i < 12; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center col_50"));
                }
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");
                for (int i = 12; i < 23; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center col_50"));
                }
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");
                for (int i = 23; i < 34; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center col_50"));
                }

                licznik++;
                builder.AppendLine("</tr>");
            }
            builder.Append("</table>");

            builder.Append("</div>");

            Label tblControl = new Label();
            tblControl.Text = builder.ToString();
            PlaceHolderTB3.Controls.Add(tblControl);

            PlaceHolderTB3.Dispose();
        }

        protected void tworztabelkeHTMLTabela4(string idKontrolki, int idWydzialu, int idtabeli, DataTable dane)
        {
            if (dane == null)
            {
                return;
            }

            StringBuilder builder = new StringBuilder();
            builder.AppendLine("<table style='width: 1150px;'>");
            //header
            builder.AppendLine("<tr>");
            builder.AppendLine("<td class='borderAll center col_36' >L.p.</td>");
            builder.AppendLine("<td class='borderAll center col_100' >imię i nazwisko</td>");
            builder.AppendLine("<td class='borderAll center col_100' >okres pracy w wydziale</td>");
            builder.AppendLine("<td class='borderAll center col_100' >pełniona funkcja</td>");
            builder.AppendLine("<td class='borderAll center col_100' >okres pełnienia funkcji</td>");
            builder.AppendLine("<td class='borderAll center col_100' >wymiar czasu pracy w wydziale wg podziału czynności</td>");
            builder.AppendLine("<td class='borderAll center col_100' >średnia liczba sesji miesięcznie w efektywnym czasie pracy </td>");

            builder.AppendLine("	</tr>");

            //ilosc sedziów
            int licznik = 1;
            foreach (DataRow wierszZtabeli in dane.Rows)
            {
                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML(licznik.ToString(), 0, 3, "borderAll center col_36"));
                builder.Append(tb.komorkaHTML(wierszZtabeli["imie"].ToString() + " " + wierszZtabeli["nazwisko"].ToString(), 0, 3, "borderAll center col_100"));

                for (int i = 1; i < 6; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center col_50"));
                }
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");
                for (int i = 6; i < 11; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center col_50"));
                }
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");
                for (int i = 11; i < 16; i++)
                {
                    string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                    builder.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center col_50"));
                }

                licznik++;
                builder.AppendLine("</tr>");
            }
            builder.Append("</table>");

            builder.Append("</div>");

            Label tblControl = new Label();
            tblControl.Text = builder.ToString();
            PlaceHolderTB4.Controls.Add(tblControl);

            PlaceHolderTB3.Dispose();
        }

        protected void tworztabelkeHTMLTabela5(string idKontrolki, int idWydzialu, int idtabeli, DataTable dane)
        {
            if (dane == null)
            {
                return;
            }

            StringBuilder builder = new StringBuilder();
            builder.AppendLine("<table style='width: 1150px;'>");
            //header
            builder.AppendLine("<tr>");
            builder.AppendLine("<td class='borderAll center col_36' rowspan='2'>L.p.</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='2'>imię i nazwisko</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='2' >okres pracy w wydziale</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='2' >pełniona funkcja</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='2' >okres pełnienia funkcji</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='2' >wymiar czasu pracy w wydziale wg podziału czynności</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='2' >efektywny czas pracy (w miesiącach) </td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='6' >Wyznaczone sesje (jawne/niejawne) </td>");
            builder.AppendLine("</tr>");
            builder.AppendLine("<tr>");
            builder.AppendLine("<td class='borderAll center col_100' >Liczba wyznaczonych sesji jawnych</td>");
            builder.AppendLine("<td class='borderAll center col_100' >Liczba wyznaczonych sesji niejawnych</td>");
            builder.AppendLine("<td class='borderAll center col_100' >Liczba sesji jawnych i niejawnych OGÓŁEM</td>");
            builder.AppendLine("<td class='borderAll center col_100' >średnia liczba sesji OGÓŁEM miesięcznie w efektywnym czasie pracy</td>");
            builder.AppendLine("<td class='borderAll center col_100' >średnia liczba sesji jawnych miesięcznie w efektywnym czasie pracy</td>");
            builder.AppendLine("<td class='borderAll center col_100' >średnia liczba sesji niejawnych  miesięcznie w efektywnym czasie pracy</td>");
            builder.AppendLine("	</tr>");

            //ilosc sedziów
            int licznik = 1;
            foreach (DataRow wierszZtabeli in dane.Rows)
            {
                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML(licznik.ToString(), 0, 4, "borderAll center col_36"));
                builder.Append(tb.komorkaHTML(wierszZtabeli["imie"].ToString() + " " + wierszZtabeli["nazwisko"].ToString(), 0, 4, "borderAll center col_100"));

                builder.Append(tworzSekcje(1, 12, 36, wierszZtabeli, idtabeli.ToString()));
                licznik++;
                builder.AppendLine("</tr>");
            }
            builder.Append("</table>");

            Label tblControl = new Label { Text = builder.ToString() };
            PlaceHolderTB5.Controls.Add(tblControl);

            PlaceHolderTB5.Dispose();
        }

        protected void tworztabelkeHTMLTabela6(string idKontrolki, int idWydzialu, int idtabeli, DataTable dane)
        {
            if (dane == null)
            {
                return;
            }

            StringBuilder builder = new StringBuilder();
            builder.AppendLine("<table style='width: 1150px;'>");
            //header
            builder.AppendLine("<tr>");
            builder.AppendLine("<td class='borderAll center col_36' rowspan='1'>L.p.</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='1'>imię i nazwisko</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='1' >okres pracy w wydziale</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='1' >pełniona funkcja</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='1' >okres pełnienia funkcji</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='1' >wymiar czasu pracy w wydziale wg podziału czynności</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='1' >efektywny czas pracy (w miesiącach) </td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='1' >średnia liczba sesji  miesięcznie w efektywnym czasie pracy</td>");
            builder.AppendLine("</tr>");

            //ilosc sedziów
            int licznik = 1;
            foreach (DataRow wierszZtabeli in dane.Rows)
            {
                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML(licznik.ToString(), 0, 4, "borderAll center col_36"));
                builder.Append(tb.komorkaHTML(wierszZtabeli["imie"].ToString() + " " + wierszZtabeli["nazwisko"].ToString(), 0, 4, "borderAll center col_100"));

                builder.Append(tworzSekcje(1, 7, 21, wierszZtabeli, idtabeli.ToString()));
                licznik++;
                builder.AppendLine("</tr>");
            }
            builder.Append("</table>");

            Label tblControl = new Label { Text = builder.ToString() };
            PlaceHolderTB6.Controls.Add(tblControl);

            PlaceHolderTB6.Dispose();
        }

        protected void tworztabelkeHTMLTabela7(string idKontrolki, int idWydzialu, int idtabeli, DataTable dane)
        {
            if (dane == null)
            {
                return;
            }

            StringBuilder builder = new StringBuilder();
            builder.AppendLine("<table style='width: 1150px;'>");
            //header
            builder.AppendLine("<tr>");
            builder.AppendLine("<td class='borderAll center col_36' rowspan='1'>L.p.</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='1'>imię i nazwisko</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='1' >okres pracy w wydziale</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='1' >pełniona funkcja</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='1' >wymiar czasu pracy w wydziale wg zakresu czynności</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='1' >liczba sędziów, z którymi asystent współpracuje</td>");
            builder.AppendLine("</tr>");

            //ilosc sedziów
            int licznik = 1;
            foreach (DataRow wierszZtabeli in dane.Rows)
            {
                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML(licznik.ToString(), 0, 4, "borderAll center col_36"));
                builder.Append(tb.komorkaHTML(wierszZtabeli["imie"].ToString() + " " + wierszZtabeli["nazwisko"].ToString(), 0, 4, "borderAll center col_100"));

                builder.Append(tworzSekcje(1, 5, 15, wierszZtabeli, idtabeli.ToString()));
                licznik++;
                builder.AppendLine("</tr>");
            }
            builder.Append("</table>");

            Label tblControl = new Label { Text = builder.ToString() };
            PlaceHolderTB7.Controls.Add(tblControl);

            PlaceHolderTB7.Dispose();
        }

        protected void tworztabelkeHTMLTabela11(string idKontrolki, int idWydzialu, int idtabeli, DataTable dane)
        {
            if (dane == null)
            {
                return;
            }

            StringBuilder builder = new StringBuilder();
            builder.AppendLine("<table style='width: 1150px;'>");
            //header
            builder.AppendLine("<tr>");
            builder.AppendLine("<td class='borderAll center col_36' rowspan='3'>L.p.</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='3'>imię i nazwisko</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='3' >funkcja</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='3' >pomoc asystenta</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='3' ></td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='15' >kategoria spraw</td>");
            builder.AppendLine("</tr>");
            builder.AppendLine("<tr>");
            builder.AppendLine("<td class='borderAll center col_100' >ogółem</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2'>K</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2'>Kp</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2' >Ko</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2' >W</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2' >Kop</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2' ></td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2' ></td>");
            builder.AppendLine("</tr>");
            builder.AppendLine("<tr>");
            builder.AppendLine("<td class='borderAll center col_100' >liczba</td>");
            for (int i = 0; i < 7; i++)
            {
                builder.AppendLine("<td class='borderAll center col_100' >liczba</td>");
                builder.AppendLine("<td class='borderAll center col_100' >%</td>");
            }

            builder.AppendLine("</tr>");
            //ilosc sedziów
            int licznik = 1;
            foreach (DataRow wierszZtabeli in dane.Rows)
            {
                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML(licznik.ToString(), 0, 3, "borderAll center col_36"));
                builder.Append(tb.komorkaHTML(wierszZtabeli["imie"].ToString() + " " + wierszZtabeli["nazwisko"].ToString(), 0, 3, "borderAll center col_100"));
                builder.Append(tb.komorkaHTML(wierszZtabeli["d_01"].ToString(), 0, 3, "borderAll center col_100"));
                builder.Append(tb.komorkaHTML(wierszZtabeli["d_02"].ToString(), 0, 3, "borderAll center col_100"));

                builder.Append(tworzSekcje(3, 17, 36, wierszZtabeli, idtabeli.ToString()));
                licznik++;
                builder.AppendLine("</tr>");
            }
            builder.Append("</table>");

            Label tblControl = new Label { Text = builder.ToString() };
            PlaceHolderTB11.Controls.Add(tblControl);
            PlaceHolderTB11.Dispose();
        }

        protected void tworztabelkeHTMLTabela12(string idKontrolki, int idWydzialu, int idtabeli, DataTable dane)
        {
            if (dane == null)
            {
                return;
            }

            StringBuilder builder = new StringBuilder();
            builder.AppendLine("<table style='width: 1150px;'>");
            //header
            builder.AppendLine("<tr>");
            builder.AppendLine("<td class='borderAll center col_36' rowspan='3'>L.p.</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='3'>imię i nazwisko</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='3' >funkcja</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='3' >pomoc asystenta</td>");
            builder.AppendLine("<td class='borderAll center col_100' rowspan='3' ></td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='15' >kategoria spraw</td>");
            builder.AppendLine("</tr>");
            builder.AppendLine("<tr>");
            builder.AppendLine("<td class='borderAll center col_100' >ogółem</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2'>C</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2'>Cgg</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2' >Co</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2' >Cps</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2' >C-upr</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2' >Nc</td>");
            builder.AppendLine("<td class='borderAll center col_100' colspan='2' >Ns</td>");
            builder.AppendLine("</tr>");
            builder.AppendLine("<tr>");
            builder.AppendLine("<td class='borderAll center col_100' >liczba</td>");
            for (int i = 0; i < 7; i++)
            {
                builder.AppendLine("<td class='borderAll center col_100' >liczba</td>");
                builder.AppendLine("<td class='borderAll center col_100' >%</td>");
            }

            builder.AppendLine("</tr>");
            //ilosc sedziów
            int licznik = 1;
            foreach (DataRow wierszZtabeli in dane.Rows)
            {
                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML(licznik.ToString(), 0, 3, "borderAll center col_36"));
                builder.Append(tb.komorkaHTML(wierszZtabeli["imie"].ToString() + " " + wierszZtabeli["nazwisko"].ToString(), 0, 3, "borderAll center col_100"));
                builder.Append(tb.komorkaHTML(wierszZtabeli["d_01"].ToString(), 0, 3, "borderAll center col_100"));
                builder.Append(tb.komorkaHTML(wierszZtabeli["d_02"].ToString(), 0, 3, "borderAll center col_100"));

                builder.Append(tworzSekcje(3, 17, 36, wierszZtabeli, idtabeli.ToString()));
                licznik++;
                builder.AppendLine("</tr>");
            }
            builder.Append("</table>");

            Label tblControl = new Label { Text = builder.ToString() };
            PlaceHolderTB12.Controls.Add(tblControl);
            PlaceHolderTB12.Dispose();
        }

        protected void tworztabelkeHTMLTabela13(string idKontrolki, int idWydzialu, int idtabeli, DataTable dane)
        {
            if (dane == null)
            {
                return;
            }

            StringBuilder builder = new StringBuilder();
            builder.AppendLine("<table style='width: 1150px;'>");
            //header
            string path = Server.MapPath("XMLHeaders") + "\\wizk_1_13.xml";
            builder.AppendLine(XMLHeaders. getHeaderFromXML(path,  tenPlik));
            builder.AppendLine("</tr>");
            //ilosc sedziów
            int licznik = 1;
            foreach (DataRow wierszZtabeli in dane.Rows)
            {
                builder.AppendLine("<tr>");
                builder.Append(tb.komorkaHTML(licznik.ToString(), 0, 24, "borderAll center col_36"));
                builder.Append(tb.komorkaHTML(wierszZtabeli["imie"].ToString() + " " + wierszZtabeli["nazwisko"].ToString(), 0, 24, "borderAll center col_100"));
                builder.Append(tb.komorkaHTML(wierszZtabeli["id_sedziego"].ToString(), 0, 24, "borderAll center col_100"));
                builder.Append(tb.komorkaHTML(wierszZtabeli["d_02"].ToString(), 0, 24, "borderAll center col_100"));
                builder.Append(tb.komorkaHTML("K", 0, 4, "borderAll center col_100"));
                builder.Append(tworzSekcje(1, 14, 41, wierszZtabeli, idtabeli.ToString(),1));
                builder.Append(tb.komorkaHTML("Kp", 0, 4, "borderAll center col_100"));
                builder.Append(tworzSekcje(1, 14, 41, wierszZtabeli, idtabeli.ToString(),40));
                builder.Append(tb.komorkaHTML("Ko", 0, 4, "borderAll center col_100"));
                builder.Append(tworzSekcje(1, 14, 41, wierszZtabeli, idtabeli.ToString(),79));
                builder.Append(tb.komorkaHTML("W", 0, 4, "borderAll center col_100"));
                builder.Append(tworzSekcje(1, 14, 41, wierszZtabeli, idtabeli.ToString(), 1));
                builder.Append(tb.komorkaHTML("Kop", 0, 4, "borderAll center col_100"));
                builder.Append(tworzSekcje(1, 14, 41, wierszZtabeli, idtabeli.ToString(), 1));
                builder.Append(tb.komorkaHTML("", 0, 4, "borderAll center col_100"));
                builder.Append(tworzSekcje(1, 14, 41, wierszZtabeli, idtabeli.ToString(), 1));
                licznik++;
                builder.AppendLine("</tr>");
            }
            builder.AppendLine("<tr>");
            builder.AppendLine(tb.komorkaHTML("Razem", 2, 4, "borderAll center col_100 gray"));
            for (int i = 0; i < 3; i++)
            {
                builder.Append(tb.komorkaHTML("sa"+i.ToString()  , 3, 1, "borderAll center col_100 gray"));
  
                for (int j = 0; j < 13; j++)
                {
                 

                     if ((j<5)^(j>7))
                    {
                        builder.Append(tb.komorkaHTML("s" + j.ToString(), 0, 0, "borderAll center col_100 gray"));
                    }
                    else
                    {
                        builder.Append(tb.komorkaHTML("", 0, 0, "borderAll center col_100"));
                      
                    }
                   

                }
                builder.AppendLine("</tr>");
                builder.AppendLine("<tr>");
            }
           

            builder.AppendLine("</tr>");

            builder.Append("</table>");
            
            Label tblControl = new Label { Text = builder.ToString() };
            PlaceHolderTB13.Controls.Add(tblControl);
            PlaceHolderTB13.Dispose();
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
                Label3.Text = cl.nazwaSadu((string)Session["id_dzialu"]);

                Label28.Text = cl.podajUzytkownika(User_id, domain);
                Label29.Text = DateTime.Now.ToLongDateString();
                try
                {
                    Label30.Text = System.IO.File.ReadAllText(Server.MapPath(@"~//version.txt")).ToString().Trim();
                }
                catch
                { }
            }
            catch
            {
            }
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

        // private metodes

        private string tworzPodSekcje(int poczatek, int koniec, DataRow wierszZtabeli, string idtabeli,int indexPoczatkowy)
        {
            StringBuilder result = new StringBuilder();
            result.AppendLine("<tr>");
            for (int i = poczatek; i < koniec; i++)
            {
                string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + (i+ indexPoczatkowy).ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                result.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center col_50"));
            }
            result.AppendLine("</tr>");
            return result.ToString();
        }

        private string tworzSekcje(int poczatek, int koniec, DataRow wierszZtabeli, string idtabeli)
        {
            StringBuilder result = new StringBuilder();
            result.AppendLine("<tr>");
            for (int i = poczatek; i < koniec; i++)
            {
                string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i .ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                result.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center col_50"));
            }
            result.AppendLine("</tr>");
            return result.ToString();
        }
        private string tworzPodSekcje(int poczatek, int koniec, DataRow wierszZtabeli, string idtabeli)
        {
            StringBuilder result = new StringBuilder();
            result.AppendLine("<tr>");
            for (int i = poczatek; i < koniec; i++)
            {
                string txt = "<a Class=\"normal\" href=\"javascript: openPopup('popup.aspx?sesja=" + wierszZtabeli["id_sedziego"].ToString() + "!" + idtabeli + "!" + i.ToString() + "!2')\">" + wierszZtabeli["D_" + i.ToString("D2")].ToString() + " </a>";
                result.AppendLine(tb.komorkaHTML(txt, 0, 0, "borderAll center col_50"));
            }
            result.AppendLine("</tr>");
            return result.ToString();
        }

        private string tworzSekcje(int poczatek, int dlugoscLinii, int koniec, DataRow wierszZtabeli, string idtabeli)
        {
            StringBuilder result = new StringBuilder();
            int ilosc = dlugoscLinii;
            for (int i = poczatek; i < koniec; i++)
            {
                if (i == dlugoscLinii)
                {
                    result.AppendLine(tworzPodSekcje(i - ilosc + 1, dlugoscLinii, wierszZtabeli, idtabeli));
                    dlugoscLinii = dlugoscLinii + ilosc - 1;
                }
            }

            return result.ToString();
        }

        private string tworzSekcje(int poczatek, int dlugoscLinii, int koniec, DataRow wierszZtabeli, string idtabeli,int indexPoczatkowy)
        {
            StringBuilder result = new StringBuilder();
            int ilosc = dlugoscLinii;
            for (int i = poczatek; i < koniec; i++)
            {
                if (i == dlugoscLinii)
                {
                    result.AppendLine(tworzPodSekcje(i - ilosc + 1, dlugoscLinii, wierszZtabeli, idtabeli, indexPoczatkowy));
                    dlugoscLinii = dlugoscLinii + ilosc - 1;
                }
            }

            return result.ToString();
        }
    }
}