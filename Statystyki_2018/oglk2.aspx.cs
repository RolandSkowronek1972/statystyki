using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using OfficeOpenXml;

namespace stat2018
{
    public partial class oglk2 : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
   //     public pdfTables pdfT = new pdfTables();
        public common cm = new common();
        public tabele tabela = new tabele();
        public dataReaders dr = new dataReaders();

        public static string tenPlik = "oglk2.aspx";

        protected void Page_Load(object sender, EventArgs e)
        {
            string idWydzial = Request.QueryString["w"];
            if (idWydzial != null)
            {
                Session["id_dzialu"] = idWydzial;
                cm.log.Info(tenPlik + ": id wydzialu=" + idWydzial);
            }
            else
            {
                return;
            }
            DateTime dTime = DateTime.Now;
            dTime = dTime.AddMonths(-1);

            if (Date1.Date.Year == 1)
            {
                Date1.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-01");
            }
            if (Date2.Date.Year == 1)
            {
                Date2.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-" + DateTime.DaysInMonth(dTime.Year, dTime.Month).ToString("D2"));
            }
            Session["data_1"] = Date1.Text;
            Session["data_2"] = Date2.Text;
            clearHedersSession();
            makeHeader();
            try
            {
               
                string user = (string)Session["identyfikatorUzytkownika"];
                string dzial = (string)Session["id_dzialu"];
                bool dost = cm.dostep(dzial, user);
                if (!dost)
                {
                    Server.Transfer("default.aspx?info='Użytkownik " + user + " nie praw do działu nr " + dzial + "'");
                }
                else
                {
                    if (!IsPostBack)
                    {
                        var fileContents = System.IO.File.ReadAllText(Server.MapPath(@"~//version.txt"));    // file read with version
                        this.Title = "Statystyki " + fileContents.ToString().Trim();
                        przemiel();
                        makeLabels();
                    }
                }
            }
            catch (Exception ex)
            {
                  cm.log.Error(tenPlik + " " + ex.Message );
            }
        }// end of Page_Load

        protected void clearHedersSession()
        {
            Session["header_01"] = null;
            Session["header_02"] = null;
            Session["header_03"] = null;
            Session["header_04"] = null;
            Session["header_05"] = null;
            Session["header_06"] = null;
            Session["header_07"] = null;
            Session["header_08"] = null;
        }




        protected void przemiel()
        {
            Session["sesja"] = "s3030";
            try
            {
                DateTime dTime = DateTime.Now;
                dTime = dTime.AddMonths(-1);
                string data = Date1.Date.ToString();
               
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
            string id_dzialu = (string)Session["id_dzialu"];
            string txt = string.Empty; 
         
            txt = txt + cl.clear_maim_db();
            //tabela 1
            try
            {
                DataTable Tabela1 = dr.generuj_dane_do_tabeli_sedziowskiej_2018(int.Parse(id_dzialu), 1, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 10, tenPlik);
                Session["tabelka001"] = Tabela1;
                GridView1.DataSource = null;
                GridView1.DataSourceID = null;
                GridView1.DataSource = Tabela1;
                GridView1.DataBind();
                

            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik +" " +ex.Message);   
            }
            //tabela 2
            try
            {
                DataTable Tabela2 = dr.generuj_dane_do_tabeli_sedziowskiej_2018(int.Parse(id_dzialu), 2, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 4, tenPlik);
                Session["tabelka002"] = Tabela2;
                GridView2.DataSource = null;
                GridView2.DataSourceID = null;
                GridView2.DataSource = Tabela2;
                GridView2.DataBind();
               
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }
            //
            try
            {
                DataTable Tabela3 = dr.generuj_dane_do_tabeli_sedziowskiej_2018(int.Parse(id_dzialu), 3, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 8, tenPlik);
                Session["tabelka003"] = Tabela3;
                GridView3.DataSource = null;
                GridView3.DataSourceID = null;
                GridView3.DataSource = Tabela3;
                GridView3.DataBind();
                
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }

            // czwarta
            try
            {
                DataTable Tabela4 = dr.generuj_dane_do_tabeli_wierszy2018( DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text),id_dzialu ,4,1, 6, tenPlik);
                Session["tabelka004"] = Tabela4;
                tab_04_w01_c01.Text= Tabela4 .Rows[0][1].ToString().Trim();
                tab_04_w01_c02.Text = Tabela4.Rows[0][2].ToString().Trim();
                tab_04_w01_c03.Text = Tabela4.Rows[0][3].ToString().Trim();
                tab_04_w01_c04.Text = Tabela4.Rows[0][4].ToString().Trim();
                tab_04_w01_c05.Text = Tabela4.Rows[0][5].ToString().Trim();

            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }
            // czwarta
            try
            {
                DataTable Tabela4 = dr.generuj_dane_do_tabeli_wierszy2018(DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), id_dzialu, 5, 1, 8, tenPlik);
                Session["tabelka005"] = Tabela4;
                tab_05_w01_c01.Text = Tabela4.Rows[0][1].ToString().Trim();
                tab_05_w01_c02.Text = Tabela4.Rows[0][2].ToString().Trim();
                tab_05_w01_c03.Text = Tabela4.Rows[0][3].ToString().Trim();
                tab_05_w01_c04.Text = Tabela4.Rows[0][4].ToString().Trim();
                tab_05_w01_c05.Text = Tabela4.Rows[0][5].ToString().Trim();
                tab_05_w01_c06.Text = Tabela4.Rows[0][6].ToString().Trim();
                tab_05_w01_c07.Text = Tabela4.Rows[0][7].ToString().Trim();
                tab_05_w01_c08.Text = Tabela4.Rows[0][8].ToString().Trim();
                
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }

            // szósta
            try
            {
                DataTable Tabela6 = dr.generuj_dane_do_tabeli_sedziowskiej_2018(int.Parse(id_dzialu), 6, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 8, tenPlik);
                Session["tabelka006"] = Tabela6;
                GridView6.DataSource = null;
                GridView6.DataSourceID = null;
                GridView6.DataSource = Tabela6;
                GridView6.DataBind();

            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }


            // siódma
            try
            {
                DataTable Tabela4 = dr.generuj_dane_do_tabeli_wierszy2018(DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), id_dzialu, 7,4, 1,  tenPlik);
                Session["tabelka007"] = Tabela4;
                tab_07_w01_c01.Text = Tabela4.Rows[0][1].ToString().Trim();
                tab_07_w02_c01.Text = Tabela4.Rows[1][1].ToString().Trim();
                tab_07_w03_c01.Text = Tabela4.Rows[2][1].ToString().Trim();
                tab_07_w04_c01.Text = Tabela4.Rows[3][1].ToString().Trim();

                tab_07_w01_c02.Text = Tabela4.Rows[0][2].ToString().Trim();
                tab_07_w02_c02.Text = Tabela4.Rows[1][2].ToString().Trim();
                tab_07_w03_c02.Text = Tabela4.Rows[2][2].ToString().Trim();
                tab_07_w04_c02.Text = Tabela4.Rows[3][2].ToString().Trim();

            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }

            // ósma
            try
            {
                DataTable Tabela4 = dr.generuj_dane_do_tabeli_wierszy2018(DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), id_dzialu, 8, 4, 3, tenPlik);
                Session["tabelka003"] = Tabela4;
                tab_08_w01_c01.Text = Tabela4.Rows[0][1].ToString().Trim();
                tab_08_w01_c02.Text = Tabela4.Rows[0][2].ToString().Trim();
                tab_08_w01_c03.Text = Tabela4.Rows[0][3].ToString().Trim();
                //wiersz 2
                tab_08_w02_c01.Text = Tabela4.Rows[1][1].ToString().Trim();
                tab_08_w02_c02.Text = Tabela4.Rows[1][2].ToString().Trim();
                tab_08_w02_c03.Text = Tabela4.Rows[1][3].ToString().Trim();
                //wiersz 3
                tab_08_w03_c01.Text = Tabela4.Rows[2][1].ToString().Trim();
                tab_08_w03_c02.Text = Tabela4.Rows[2][2].ToString().Trim();
                tab_08_w03_c03.Text = Tabela4.Rows[2][3].ToString().Trim();
                //wiersz 4
                tab_08_w04_c01.Text = Tabela4.Rows[3][1].ToString().Trim();
                tab_08_w04_c02.Text = Tabela4.Rows[3][2].ToString().Trim();
                tab_08_w04_c03.Text = Tabela4.Rows[3][3].ToString().Trim();

            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }

            // dziewiąta
            try
            {
                DataTable Tabela4 = new DataTable();
                Tabela4 = dr.generuj_dane_do_tabeli_wierszy2018(DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), id_dzialu, 9, 3, 4, tenPlik);
                Session["tabelka003"] = Tabela4;
                tab_09_w01_c01.Text = Tabela4.Rows[0][1].ToString().Trim();
                tab_09_w01_c02.Text = Tabela4.Rows[0][2].ToString().Trim();
                
                //wiersz 2
                tab_09_w02_c01.Text = Tabela4.Rows[1][1].ToString().Trim();
                tab_09_w02_c02.Text = Tabela4.Rows[1][2].ToString().Trim();
                //wiersz 3
                tab_09_w03_c01.Text = Tabela4.Rows[2][1].ToString().Trim();
                tab_09_w03_c02.Text = Tabela4.Rows[2][2].ToString().Trim();
                
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }

            // dziesiata
            try
            {
                DataTable Tabela4 = dr.generuj_dane_do_tabeli_wierszy2018(DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), id_dzialu, 10, 12, 8, tenPlik);
                Session["tabelka010"] = Tabela4;
                tab_10_w01_c01.Text = Tabela4.Rows[0][1].ToString().Trim();
                tab_10_w01_c02.Text = Tabela4.Rows[0][2].ToString().Trim();
                tab_10_w01_c03.Text = Tabela4.Rows[0][3].ToString().Trim();
                tab_10_w01_c04.Text = Tabela4.Rows[0][4].ToString().Trim();
                tab_10_w01_c05.Text = Tabela4.Rows[0][5].ToString().Trim();
                tab_10_w01_c06.Text = Tabela4.Rows[0][6].ToString().Trim();
                //wiersz 2
                tab_10_w02_c01.Text = Tabela4.Rows[1][1].ToString().Trim();
                tab_10_w02_c02.Text = Tabela4.Rows[1][2].ToString().Trim();
                tab_10_w02_c03.Text = Tabela4.Rows[1][3].ToString().Trim();
                tab_10_w02_c04.Text = Tabela4.Rows[1][4].ToString().Trim();
                tab_10_w02_c05.Text = Tabela4.Rows[1][5].ToString().Trim();
                tab_10_w02_c06.Text = Tabela4.Rows[1][6].ToString().Trim();
                //wiersz 3
                tab_10_w03_c01.Text = Tabela4.Rows[2][1].ToString().Trim();
                tab_10_w03_c02.Text = Tabela4.Rows[2][2].ToString().Trim();
                tab_10_w03_c03.Text = Tabela4.Rows[2][3].ToString().Trim();
                tab_10_w03_c04.Text = Tabela4.Rows[2][4].ToString().Trim();
                tab_10_w03_c05.Text = Tabela4.Rows[2][5].ToString().Trim();
                tab_10_w03_c06.Text = Tabela4.Rows[2][6].ToString().Trim();
                //wiersz 4
                tab_10_w04_c01.Text = Tabela4.Rows[3][1].ToString().Trim();
                tab_10_w04_c02.Text = Tabela4.Rows[3][2].ToString().Trim();
                tab_10_w04_c03.Text = Tabela4.Rows[3][3].ToString().Trim();
                tab_10_w04_c04.Text = Tabela4.Rows[3][4].ToString().Trim();
                tab_10_w04_c05.Text = Tabela4.Rows[3][5].ToString().Trim();
                tab_10_w04_c06.Text = Tabela4.Rows[3][6].ToString().Trim();

                //wiersz 5
                tab_10_w05_c01.Text = Tabela4.Rows[4][1].ToString().Trim();
                tab_10_w05_c02.Text = Tabela4.Rows[4][2].ToString().Trim();
                tab_10_w05_c03.Text = Tabela4.Rows[4][3].ToString().Trim();
                tab_10_w05_c04.Text = Tabela4.Rows[4][4].ToString().Trim();
                tab_10_w05_c05.Text = Tabela4.Rows[4][5].ToString().Trim();
                tab_10_w05_c06.Text = Tabela4.Rows[4][6].ToString().Trim();

                //wiersz 6
                tab_10_w06_c01.Text = Tabela4.Rows[5][1].ToString().Trim();
                tab_10_w06_c02.Text = Tabela4.Rows[5][2].ToString().Trim();
                tab_10_w06_c03.Text = Tabela4.Rows[5][3].ToString().Trim();
                tab_10_w06_c04.Text = Tabela4.Rows[5][4].ToString().Trim();
                tab_10_w06_c05.Text = Tabela4.Rows[5][5].ToString().Trim();
                tab_10_w06_c06.Text = Tabela4.Rows[5][6].ToString().Trim();
                //wiersz 7
                tab_10_w07_c01.Text = Tabela4.Rows[6][1].ToString().Trim();
                tab_10_w07_c02.Text = Tabela4.Rows[6][2].ToString().Trim();
                tab_10_w07_c03.Text = Tabela4.Rows[6][3].ToString().Trim();
                tab_10_w07_c04.Text = Tabela4.Rows[6][4].ToString().Trim();
                tab_10_w07_c05.Text = Tabela4.Rows[6][5].ToString().Trim();
                tab_10_w07_c06.Text = Tabela4.Rows[6][6].ToString().Trim();
                //wiersz 8
                tab_10_w08_c01.Text = Tabela4.Rows[7][1].ToString().Trim();
                tab_10_w08_c02.Text = Tabela4.Rows[7][2].ToString().Trim();
                tab_10_w08_c03.Text = Tabela4.Rows[7][3].ToString().Trim();
                tab_10_w08_c04.Text = Tabela4.Rows[7][4].ToString().Trim();
                tab_10_w08_c05.Text = Tabela4.Rows[7][5].ToString().Trim();
                tab_10_w08_c06.Text = Tabela4.Rows[7][6].ToString().Trim();
                //wiersz 9
                tab_10_w09_c01.Text = Tabela4.Rows[8][1].ToString().Trim();
                tab_10_w09_c02.Text = Tabela4.Rows[8][2].ToString().Trim();
                tab_10_w09_c03.Text = Tabela4.Rows[8][3].ToString().Trim();
                tab_10_w09_c04.Text = Tabela4.Rows[8][4].ToString().Trim();
                tab_10_w09_c05.Text = Tabela4.Rows[8][5].ToString().Trim();
                tab_10_w09_c06.Text = Tabela4.Rows[8][6].ToString().Trim();
                //wiersz 10
                tab_10_w10_c01.Text = Tabela4.Rows[9][1].ToString().Trim();
                tab_10_w10_c02.Text = Tabela4.Rows[9][2].ToString().Trim();
                tab_10_w10_c03.Text = Tabela4.Rows[9][3].ToString().Trim();
                tab_10_w10_c04.Text = Tabela4.Rows[9][4].ToString().Trim();
                tab_10_w10_c05.Text = Tabela4.Rows[9][5].ToString().Trim();
                tab_10_w10_c06.Text = Tabela4.Rows[9][6].ToString().Trim();
                //wiersz 11
                tab_10_w11_c01.Text = Tabela4.Rows[10][1].ToString().Trim();
                tab_10_w11_c02.Text = Tabela4.Rows[10][2].ToString().Trim();
                tab_10_w11_c03.Text = Tabela4.Rows[10][3].ToString().Trim();
                tab_10_w11_c04.Text = Tabela4.Rows[10][4].ToString().Trim();
                tab_10_w11_c05.Text = Tabela4.Rows[10][5].ToString().Trim();
                tab_10_w11_c06.Text = Tabela4.Rows[10][6].ToString().Trim();
                //wiersz 12
                tab_10_w12_c01.Text = Tabela4.Rows[11][1].ToString().Trim();
                tab_10_w12_c02.Text = Tabela4.Rows[11][2].ToString().Trim();
                tab_10_w12_c03.Text = Tabela4.Rows[11][3].ToString().Trim();
                tab_10_w12_c04.Text = Tabela4.Rows[11][4].ToString().Trim();
                tab_10_w12_c05.Text = Tabela4.Rows[11][5].ToString().Trim();
                tab_10_w12_c06.Text = Tabela4.Rows[11][6].ToString().Trim();
                //wiersz 13
                tab_10_w13_c01.Text = Tabela4.Rows[12][1].ToString().Trim();
                tab_10_w13_c02.Text = Tabela4.Rows[12][2].ToString().Trim();
                tab_10_w13_c03.Text = Tabela4.Rows[12][3].ToString().Trim();
                tab_10_w13_c04.Text = Tabela4.Rows[12][4].ToString().Trim();
                tab_10_w13_c05.Text = Tabela4.Rows[12][5].ToString().Trim();
                tab_10_w13_c06.Text = Tabela4.Rows[12][6].ToString().Trim();
                //wiersz 14
                tab_10_w14_c01.Text = Tabela4.Rows[13][1].ToString().Trim();
                tab_10_w14_c02.Text = Tabela4.Rows[13][2].ToString().Trim();
                tab_10_w14_c03.Text = Tabela4.Rows[13][3].ToString().Trim();
                tab_10_w14_c04.Text = Tabela4.Rows[13][4].ToString().Trim();
                tab_10_w14_c05.Text = Tabela4.Rows[13][5].ToString().Trim();
                tab_10_w14_c06.Text = Tabela4.Rows[13][6].ToString().Trim();
                //wiersz 15
                tab_10_w15_c01.Text = Tabela4.Rows[14][1].ToString().Trim();
                tab_10_w15_c02.Text = Tabela4.Rows[14][2].ToString().Trim();
                tab_10_w15_c03.Text = Tabela4.Rows[14][3].ToString().Trim();
                tab_10_w15_c04.Text = Tabela4.Rows[14][4].ToString().Trim();
                tab_10_w15_c05.Text = Tabela4.Rows[14][5].ToString().Trim();
                tab_10_w15_c06.Text = Tabela4.Rows[14][6].ToString().Trim();
                //wiersz 16
                tab_10_w16_c01.Text = Tabela4.Rows[15][1].ToString().Trim();
                tab_10_w16_c02.Text = Tabela4.Rows[15][2].ToString().Trim();
                tab_10_w16_c03.Text = Tabela4.Rows[15][3].ToString().Trim();
                tab_10_w16_c04.Text = Tabela4.Rows[15][4].ToString().Trim();
                tab_10_w16_c05.Text = Tabela4.Rows[15][5].ToString().Trim();
                tab_10_w16_c06.Text = Tabela4.Rows[15][6].ToString().Trim();
                //wiersz 17
                tab_10_w17_c01.Text = Tabela4.Rows[15][1].ToString().Trim();
                tab_10_w17_c02.Text = Tabela4.Rows[15][2].ToString().Trim();
                tab_10_w17_c03.Text = Tabela4.Rows[15][3].ToString().Trim();
                tab_10_w17_c04.Text = Tabela4.Rows[15][4].ToString().Trim();
                tab_10_w17_c05.Text = Tabela4.Rows[15][5].ToString().Trim();
                tab_10_w17_c06.Text = Tabela4.Rows[15][6].ToString().Trim();

            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }

            // jedenasta
            try
            {
                DataTable Tabela4 = dr.generuj_dane_do_tabeli_wierszy2018(DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), id_dzialu, 11, 12, 8, tenPlik);
                Session["tabelka011"] = Tabela4;
                tab_11_w01_c01.Text = Tabela4.Rows[0][1].ToString().Trim();
                tab_11_w01_c02.Text = Tabela4.Rows[0][2].ToString().Trim();
                tab_11_w01_c03.Text = Tabela4.Rows[0][3].ToString().Trim();
                tab_11_w01_c04.Text = Tabela4.Rows[0][4].ToString().Trim();
                tab_11_w01_c05.Text = Tabela4.Rows[0][5].ToString().Trim();
                tab_11_w01_c06.Text = Tabela4.Rows[0][6].ToString().Trim();
                //wiersz 2
                tab_11_w02_c01.Text = Tabela4.Rows[1][1].ToString().Trim();
                tab_11_w02_c02.Text = Tabela4.Rows[1][2].ToString().Trim();
                tab_11_w02_c03.Text = Tabela4.Rows[1][3].ToString().Trim();
                tab_11_w02_c04.Text = Tabela4.Rows[1][4].ToString().Trim();
                tab_11_w02_c05.Text = Tabela4.Rows[1][5].ToString().Trim();
                tab_11_w02_c06.Text = Tabela4.Rows[1][6].ToString().Trim();
                //wiersz 3
                tab_11_w03_c01.Text = Tabela4.Rows[2][1].ToString().Trim();
                tab_11_w03_c02.Text = Tabela4.Rows[2][2].ToString().Trim();
                tab_11_w03_c03.Text = Tabela4.Rows[2][3].ToString().Trim();
                tab_11_w03_c04.Text = Tabela4.Rows[2][4].ToString().Trim();
                tab_11_w03_c05.Text = Tabela4.Rows[2][5].ToString().Trim();
                tab_11_w03_c06.Text = Tabela4.Rows[2][6].ToString().Trim();
                //wiersz 4
                tab_11_w04_c01.Text = Tabela4.Rows[3][1].ToString().Trim();
                tab_11_w04_c02.Text = Tabela4.Rows[3][2].ToString().Trim();
                tab_11_w04_c03.Text = Tabela4.Rows[3][3].ToString().Trim();
                tab_11_w04_c04.Text = Tabela4.Rows[3][4].ToString().Trim();
                tab_11_w04_c05.Text = Tabela4.Rows[3][5].ToString().Trim();
                tab_11_w04_c06.Text = Tabela4.Rows[3][6].ToString().Trim();

                //wiersz 5
                tab_11_w05_c01.Text = Tabela4.Rows[4][1].ToString().Trim();
                tab_11_w05_c02.Text = Tabela4.Rows[4][2].ToString().Trim();
                tab_11_w05_c03.Text = Tabela4.Rows[4][3].ToString().Trim();
                tab_11_w05_c04.Text = Tabela4.Rows[4][4].ToString().Trim();
                tab_11_w05_c05.Text = Tabela4.Rows[4][5].ToString().Trim();
                tab_11_w05_c06.Text = Tabela4.Rows[4][6].ToString().Trim();

           
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }

            // dwunasta
            try
            {
                DataTable Tabela4 = dr.generuj_dane_do_tabeli_wierszy2018(DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), id_dzialu, 12,4,2, tenPlik);
                Session["tabelka012"] = Tabela4;
                tab_12_w01_c01.Text = Tabela4.Rows[0][1].ToString().Trim();
                tab_12_w01_c02.Text = Tabela4.Rows[0][2].ToString().Trim();
                //wiersz 2
                tab_12_w02_c01.Text = Tabela4.Rows[1][1].ToString().Trim();
                tab_12_w02_c02.Text = Tabela4.Rows[1][2].ToString().Trim();
                //wiersz 3
                tab_12_w03_c01.Text = Tabela4.Rows[2][1].ToString().Trim();
                tab_12_w03_c02.Text = Tabela4.Rows[2][2].ToString().Trim();
                //wiersz 4
                tab_12_w04_c01.Text = Tabela4.Rows[3][1].ToString().Trim();
                tab_12_w04_c02.Text = Tabela4.Rows[3][2].ToString().Trim();
        

            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }


            // trzynasta
            try
            {
                DataTable Tabela4 = dr.generuj_dane_do_tabeli_wierszy2018(DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), id_dzialu, 13, 12, 10, tenPlik);
                Session["tabelka011"] = Tabela4;
                tab_13_w01_c01.Text = Tabela4.Rows[0][1].ToString().Trim();
                tab_13_w01_c02.Text = Tabela4.Rows[0][2].ToString().Trim();
                tab_13_w01_c03.Text = Tabela4.Rows[0][3].ToString().Trim();
                tab_13_w01_c04.Text = Tabela4.Rows[0][4].ToString().Trim();
                tab_13_w01_c05.Text = Tabela4.Rows[0][5].ToString().Trim();
                tab_13_w01_c06.Text = Tabela4.Rows[0][6].ToString().Trim();
                tab_13_w01_c07.Text = Tabela4.Rows[0][7].ToString().Trim();
                tab_13_w01_c08.Text = Tabela4.Rows[0][8].ToString().Trim();
                tab_13_w01_c09.Text = Tabela4.Rows[0][9].ToString().Trim();

                //wiersz 2
                tab_13_w02_c01.Text = Tabela4.Rows[1][1].ToString().Trim();
                tab_13_w02_c02.Text = Tabela4.Rows[1][2].ToString().Trim();
                tab_13_w02_c03.Text = Tabela4.Rows[1][3].ToString().Trim();
                tab_13_w02_c04.Text = Tabela4.Rows[1][4].ToString().Trim();
                tab_13_w02_c05.Text = Tabela4.Rows[1][5].ToString().Trim();
                tab_13_w02_c06.Text = Tabela4.Rows[1][6].ToString().Trim();
                tab_13_w02_c07.Text = Tabela4.Rows[1][7].ToString().Trim();
                tab_13_w03_c08.Text = Tabela4.Rows[1][8].ToString().Trim();
                tab_13_w04_c09.Text = Tabela4.Rows[1][9].ToString().Trim();

                //wiersz 3
                tab_13_w03_c01.Text = Tabela4.Rows[2][1].ToString().Trim();
                tab_13_w03_c02.Text = Tabela4.Rows[2][2].ToString().Trim();
                tab_13_w03_c03.Text = Tabela4.Rows[2][3].ToString().Trim();
                tab_13_w03_c04.Text = Tabela4.Rows[2][4].ToString().Trim();
                tab_13_w03_c05.Text = Tabela4.Rows[2][5].ToString().Trim();
                tab_13_w03_c06.Text = Tabela4.Rows[2][6].ToString().Trim();
                tab_13_w03_c07.Text = Tabela4.Rows[2][7].ToString().Trim();
                tab_13_w03_c08.Text = Tabela4.Rows[2][8].ToString().Trim();
                tab_13_w03_c09.Text = Tabela4.Rows[2][9].ToString().Trim();

                //wiersz 4
                tab_13_w04_c01.Text = Tabela4.Rows[3][1].ToString().Trim();
                tab_13_w04_c02.Text = Tabela4.Rows[3][2].ToString().Trim();
                tab_13_w04_c03.Text = Tabela4.Rows[3][3].ToString().Trim();
                tab_13_w04_c04.Text = Tabela4.Rows[3][4].ToString().Trim();
                tab_13_w04_c05.Text = Tabela4.Rows[3][5].ToString().Trim();
                tab_13_w04_c06.Text = Tabela4.Rows[3][6].ToString().Trim();
                tab_13_w04_c07.Text = Tabela4.Rows[3][7].ToString().Trim();
                tab_13_w04_c08.Text = Tabela4.Rows[3][8].ToString().Trim();
                tab_13_w04_c09.Text = Tabela4.Rows[3][9].ToString().Trim();

                //wiersz 5
                tab_13_w05_c01.Text = Tabela4.Rows[4][1].ToString().Trim();
                tab_13_w05_c02.Text = Tabela4.Rows[4][2].ToString().Trim();
                tab_13_w05_c03.Text = Tabela4.Rows[4][3].ToString().Trim();
                tab_13_w05_c04.Text = Tabela4.Rows[4][4].ToString().Trim();
                tab_13_w05_c05.Text = Tabela4.Rows[4][5].ToString().Trim();
                tab_13_w05_c06.Text = Tabela4.Rows[4][6].ToString().Trim();
                tab_13_w05_c07.Text = Tabela4.Rows[4][7].ToString().Trim();
                tab_13_w05_c08.Text = Tabela4.Rows[4][8].ToString().Trim();
                tab_13_w05_c09.Text = Tabela4.Rows[4][9].ToString().Trim();
                //wiersz 6
                tab_13_w06_c01.Text = Tabela4.Rows[5][1].ToString().Trim();
                tab_13_w06_c02.Text = Tabela4.Rows[5][2].ToString().Trim();
                tab_13_w06_c03.Text = Tabela4.Rows[5][3].ToString().Trim();
                tab_13_w06_c04.Text = Tabela4.Rows[5][4].ToString().Trim();
                tab_13_w06_c05.Text = Tabela4.Rows[5][5].ToString().Trim();
                tab_13_w06_c06.Text = Tabela4.Rows[5][6].ToString().Trim();
                tab_13_w06_c07.Text = Tabela4.Rows[5][7].ToString().Trim();
                tab_13_w06_c08.Text = Tabela4.Rows[5][8].ToString().Trim();
                tab_13_w06_c09.Text = Tabela4.Rows[5][9].ToString().Trim();

                //wiersz 7
                tab_13_w07_c01.Text = Tabela4.Rows[6][1].ToString().Trim();
                tab_13_w07_c02.Text = Tabela4.Rows[6][2].ToString().Trim();
                tab_13_w07_c03.Text = Tabela4.Rows[6][3].ToString().Trim();
                tab_13_w07_c04.Text = Tabela4.Rows[6][4].ToString().Trim();
                tab_13_w07_c05.Text = Tabela4.Rows[6][5].ToString().Trim();
                tab_13_w07_c06.Text = Tabela4.Rows[6][6].ToString().Trim();
                tab_13_w07_c07.Text = Tabela4.Rows[6][7].ToString().Trim();
                tab_13_w07_c08.Text = Tabela4.Rows[6][8].ToString().Trim();
                tab_13_w07_c09.Text = Tabela4.Rows[6][9].ToString().Trim();

                //wiersz 8
                tab_13_w08_c01.Text = Tabela4.Rows[7][1].ToString().Trim();
                tab_13_w08_c02.Text = Tabela4.Rows[7][2].ToString().Trim();
                tab_13_w08_c03.Text = Tabela4.Rows[7][3].ToString().Trim();
                tab_13_w08_c04.Text = Tabela4.Rows[7][4].ToString().Trim();
                tab_13_w08_c05.Text = Tabela4.Rows[7][5].ToString().Trim();
                tab_13_w08_c06.Text = Tabela4.Rows[7][6].ToString().Trim();
                tab_13_w08_c07.Text = Tabela4.Rows[7][7].ToString().Trim();
                tab_13_w08_c08.Text = Tabela4.Rows[7][8].ToString().Trim();
                tab_13_w08_c09.Text = Tabela4.Rows[7][9].ToString().Trim();

                //wiersz 9
                tab_13_w09_c01.Text = Tabela4.Rows[8][1].ToString().Trim();
                tab_13_w09_c02.Text = Tabela4.Rows[8][2].ToString().Trim();
                tab_13_w09_c03.Text = Tabela4.Rows[8][3].ToString().Trim();
                tab_13_w09_c04.Text = Tabela4.Rows[8][4].ToString().Trim();
                tab_13_w09_c05.Text = Tabela4.Rows[8][5].ToString().Trim();
                tab_13_w09_c06.Text = Tabela4.Rows[8][6].ToString().Trim();
                tab_13_w09_c07.Text = Tabela4.Rows[8][7].ToString().Trim();
                tab_13_w09_c08.Text = Tabela4.Rows[8][8].ToString().Trim();
                tab_13_w09_c09.Text = Tabela4.Rows[8][9].ToString().Trim();

                //wiersz 10
                tab_13_w10_c01.Text = Tabela4.Rows[9][1].ToString().Trim();
                tab_13_w10_c02.Text = Tabela4.Rows[9][2].ToString().Trim();
                tab_13_w10_c03.Text = Tabela4.Rows[9][3].ToString().Trim();
                tab_13_w10_c04.Text = Tabela4.Rows[9][4].ToString().Trim();
                tab_13_w10_c05.Text = Tabela4.Rows[9][5].ToString().Trim();
                tab_13_w10_c06.Text = Tabela4.Rows[9][6].ToString().Trim();
                tab_13_w10_c07.Text = Tabela4.Rows[9][7].ToString().Trim();
                tab_13_w10_c08.Text = Tabela4.Rows[9][8].ToString().Trim();
                tab_13_w10_c09.Text = Tabela4.Rows[9][9].ToString().Trim();


                //wiersz 11
                tab_13_w11_c01.Text = Tabela4.Rows[10][1].ToString().Trim();
                tab_13_w11_c02.Text = Tabela4.Rows[10][2].ToString().Trim();
                tab_13_w11_c03.Text = Tabela4.Rows[10][3].ToString().Trim();
                tab_13_w11_c04.Text = Tabela4.Rows[10][4].ToString().Trim();
                tab_13_w11_c05.Text = Tabela4.Rows[10][5].ToString().Trim();
                tab_13_w11_c06.Text = Tabela4.Rows[10][6].ToString().Trim();
                tab_13_w11_c07.Text = Tabela4.Rows[10][7].ToString().Trim();
                tab_13_w11_c08.Text = Tabela4.Rows[10][8].ToString().Trim();
                tab_13_w11_c09.Text = Tabela4.Rows[10][9].ToString().Trim();


            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }


            // dopasowanie opisów
            makeLabels();
            try
            {
                Label11.Visible = cl.debug(int.Parse(id_dzialu));
                infoLabel1.Visible = cl.debug(int.Parse(id_dzialu));
                infoLabel2.Visible = cl.debug(int.Parse(id_dzialu));
                infoLabel3.Visible = cl.debug(int.Parse(id_dzialu));
                infoLabel4.Visible = cl.debug(int.Parse(id_dzialu));
                infoLabel5.Visible = cl.debug(int.Parse(id_dzialu));
                infoLabel6.Visible = cl.debug(int.Parse(id_dzialu));
                infoLabel7.Visible = cl.debug(int.Parse(id_dzialu));
                infoLabel8.Visible = cl.debug(int.Parse(id_dzialu));
                infoLabel9.Visible = cl.debug(int.Parse(id_dzialu));
                infoLabel10.Visible = cl.debug(int.Parse(id_dzialu));
                infoLabel11.Visible = cl.debug(int.Parse(id_dzialu));
                infoLabel12.Visible = cl.debug(int.Parse(id_dzialu));
                infoLabel13.Visible = cl.debug(int.Parse(id_dzialu));
            }
            catch
            {
                Label11.Visible = false;
                infoLabel1.Visible = false;
                infoLabel2.Visible = false;
                infoLabel3.Visible = false;

                infoLabel4.Visible = false;
                infoLabel5.Visible = false;
                infoLabel6.Visible = false;
                infoLabel7.Visible = false;
                infoLabel8.Visible = false;
                infoLabel9.Visible = false;
                infoLabel10.Visible = false;
                infoLabel11.Visible = false;
                infoLabel12.Visible = false;
                infoLabel13.Visible = false;
            }

            Label11.Text = txt;

        }


        #region "nagłowki tabel"
        protected void makeHeader()
        {

            System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();



            #region tabela  1 (wierszowa)


            DataTable dT_01 = new DataTable();
            dT_01.Columns.Clear();
            dT_01.Columns.Add("Column1", typeof(string));
            dT_01.Columns.Add("Column2", typeof(string));
            dT_01.Columns.Add("Column3", typeof(string));
            dT_01.Columns.Add("Column4", typeof(string));
            dT_01.Columns.Add("Column5", typeof(string));

            DataTable dT_02 = new DataTable();
            dT_02.Columns.Clear();
            dT_02.Columns.Add("Column1", typeof(string));
            dT_02.Columns.Add("Column2", typeof(string));
            dT_02.Columns.Add("Column3", typeof(string));
            dT_02.Columns.Add("Column4", typeof(string));
            dT_02.Columns.Add("Column5", typeof(string));

            DataTable dT_03 = new DataTable();
            dT_03.Columns.Clear();
            dT_03.Columns.Add("Column1", typeof(string));
            dT_03.Columns.Add("Column2", typeof(string));
            dT_03.Columns.Add("Column3", typeof(string));
            dT_03.Columns.Add("Column4", typeof(string));
            dT_03.Columns.Add("Column5", typeof(string));

            DataTable dT_04 = new DataTable();
            dT_04.Columns.Clear();
            dT_04.Columns.Add("Column1", typeof(string));
            dT_04.Columns.Add("Column2", typeof(string));
            dT_04.Columns.Add("Column3", typeof(string));
            dT_04.Columns.Add("Column4", typeof(string));
            dT_04.Columns.Add("Column5", typeof(string));
            DataTable dT_05 = new DataTable();
            dT_05.Columns.Clear();
            dT_05.Columns.Add("Column1", typeof(string));
            dT_05.Columns.Add("Column2", typeof(string));
            dT_05.Columns.Add("Column3", typeof(string));
            dT_05.Columns.Add("Column4", typeof(string));
            dT_05.Columns.Add("Column5", typeof(string));

            DataTable dT_06 = new DataTable();
            dT_06.Columns.Clear();
            dT_06.Columns.Add("Column1", typeof(string));
            dT_06.Columns.Add("Column2", typeof(string));
            dT_06.Columns.Add("Column3", typeof(string));
            dT_06.Columns.Add("Column4", typeof(string));
            dT_06.Columns.Add("Column5", typeof(string));

            dT_01.Clear();
            dT_01.Rows.Add(new Object[] { "1", "L.p.", "1", "1", "h" });
            dT_01.Rows.Add(new Object[] { "1", "Imię i Nazwisko", "1", "1", "h" });
            dT_01.Rows.Add(new Object[] { "1", "Od 3 do 5 lat", "1", "1", "h" });
            dT_01.Rows.Add(new Object[] { "1", "W tym zawieszone", "1", "1", "h" });
            dT_01.Rows.Add(new Object[] { "1", "Od 5 do 8 lat", "1", "1", "h" });
            dT_01.Rows.Add(new Object[] { "1", "W tym zawieszone", "1", "1", "h" });
            dT_01.Rows.Add(new Object[] { "1", "Pow. 8 lat", "1", "1", "h" });
            dT_01.Rows.Add(new Object[] { "1", "W tym zawieszone", "1", "1", "h" });
            dT_01.Rows.Add(new Object[] { "1", "razem", "1", "1", "h" });
            Session["header_01"] = dT_01;
            
            #endregion


            #region tabela  2 ()

            dT_02.Clear();
            
            dT_02.Rows.Add(new Object[] { "1", "L.p.", "1", "1", "h" });
            dT_02.Rows.Add(new Object[] { "1", "Sędzia", "1", "1", "h" });
            dT_02.Rows.Add(new Object[] { "1", "Pow. jednego roku", "1", "1", "h" });
       
            Session["header_02"] = dT_02;
           

            #endregion
            #region tabela  3 ()

            dT_03.Clear();
            dT_03.Rows.Add(new Object[] { "1", "L.p.", "1", "1", "h" });

            dT_03.Rows.Add(new Object[] { "1", "Sędzia", "1", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "Areszt powyżej 12 miesięcy", "1", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "Areszt powyżej 24  miesięcy", "1", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "Razem", "1", "1", "h" });
         
            Session["header_03"] = dT_03;
          
            #endregion



            #region tabela  4 ()

            dT_04.Clear();

            dT_04.Rows.Add(new Object[] { "1", "L.p.", "1", "1", "h" });
            dT_04.Rows.Add(new Object[] { "1", "Sędzia", "1", "1", "v" });
            dT_04.Rows.Add(new Object[] { "1", "Areszt powyżej 12 miesięcy", "1", "1","h" });
            dT_04.Rows.Add(new Object[] { "1", "Areszt powyżej 24 miesięcy", "1", "1","h" });
            dT_04.Rows.Add(new Object[] { "1", "Razem", "1", "1", "h" });
            Session["header_04"] = dT_04;


            #endregion

            #region tabela  6 ()

            dT_06.Clear();

            dT_06.Rows.Add(new Object[] { "1", "K", "1", "1", "h" });
            dT_06.Rows.Add(new Object[] { "1", "Ko", "1", "1", "h" });
            dT_06.Rows.Add(new Object[] { "1", "Kp", "1", "1", "h" });
            dT_06.Rows.Add(new Object[] { "1", "W", "1", "1", "h" });
            dT_06.Rows.Add(new Object[] { "1", "Kop", "1", "1", "h" });
            dT_06.Rows.Add(new Object[] { "1", "Ogółem", "1", "1", "h" });

            dT_06.Rows.Add(new Object[] { "2", "L.p.", "1", "2", "h" });
            dT_06.Rows.Add(new Object[] { "2", "Nazwisko i imie sędziego", "1", "2", "h" });
            dT_06.Rows.Add(new Object[] { "2", "Wpływ do repozytorium/Wykazu", "6", "1", "h" });
            Session["header_06"] = dT_06;


            #endregion
        }


        protected void GridView2_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_01"];
               tabela. makeHeader(sn, dT, GridView2);
            }
        }



        protected void GridView3_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_02"];
                tabela.makeHeader(sn, dT, GridView2);
            }
        }

        protected void GridView4_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_03"];
                tabela.makeHeader(sn, dT, GridView3);
            }
        }

        #endregion "nagłowki tabel"

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
                Label28.Text = cl.podajUzytkownika(User_id, domain);
                Label29.Text = DateTime.Now.ToLongDateString();
                try
                {
                    Label30.Text = System.IO.File.ReadAllText(Server.MapPath(@"~//version.txt")).ToString().Trim();
                }
                catch
                { }


                string strMonthName = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(DateTime.Parse(Date2.Text).Month);
                int last_day = DateTime.DaysInMonth(DateTime.Parse(Date2.Text).Year, DateTime.Parse(Date2.Text).Month);
                if (((DateTime.Parse(Date1.Text).Day == 1) && (DateTime.Parse(Date2.Text).Day == last_day)) && ((DateTime.Parse(Date1.Text).Month == DateTime.Parse(Date2.Text).Month)))
                {
                    // cały miesiąc
                    lbTabela1.Text = "Ilość spraw karnych, w których postępowanie toczy się powyżej 3 lat za miesiąc " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    lbTabela2.Text = "Ilość spraw wykroczeniowych „W”, w których postępowanie toczy się powyżej 1 roku za miesiąc " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    lbTabela3.Text = "Sprawy aresztowe na koniec miesiąca " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    lbTabela4.Text = "Wykaz mediacji na koniec miesiąca " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    lbTabela5.Text = "Informacja dot. pracy biegłych sądowych (WAB) na koniec miesiąca " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    lbTabela6.Text = "Informacja z wpływu spraw na koniec miesiąca " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    lbTabela7.Text = "Sparwy zawieszone na koniec miesiąca " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    lbTabela8.Text = "Ilość spraw Kp dot. przesłuchania trybie art. 185 a-d kpk na koniec miesiąca " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    lbTabela9.Text = "Ewidencja spraw odroczonych  na koniec miesiąca " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    lbTabela10.Text = "TABELA 1- NALEŻNOŚCI SĄDOWE I ZALEGŁOŚCI WE WPŁYWACH DO BUDŻETU SKARBU PAŃSTWA  na koniec miesiąca " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    lbTabela11.Text = "TABELA 2 - ILOŚĆ (KWOTA) KIEROWANYCH SPRAW DO EGZEKUCJI KOMORNICZYCH na koniec miesiąca " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    lbTabela12.Text = "TABELA 3 - ILOŚĆ OSÓB (SPRAW PROBACYJNYCH na koniec miesiąca " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    lbTabela13.Text = "INFORMACJA O REALIZACJI NALEŻNOŚCI na koniec miesiąca " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";

                }
                else
                {
                    lbTabela1.Text = "Ilość spraw karnych, w których postępowanie toczy się powyżej 3 lat za okres od " + Date1.Text + " do  " + Date2.Text;
                    lbTabela2.Text = "Ilość spraw wykroczeniowych „W”, w których postępowanie toczy się powyżej 1 roku: za okres od" + Date1.Text + " do  " + Date2.Text;
                    lbTabela3.Text = "Sprawy aresztowe za okres od " + Date1.Text + " do  " + Date2.Text;
                    lbTabela4.Text = "Wykaz mediacji na koniec miesiąca " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    lbTabela5.Text = "Informacja dot. pracy biegłych sądowych (WAB) na koniec miesiąca " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    lbTabela6.Text = "Informacja z wpływu spraw na koniec miesiąca " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    lbTabela7.Text = "Sparwy zawieszone na koniec miesiąca " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    lbTabela8.Text = "Ilość spraw Kp dot. przesłuchania trybie art. 185 a-d kpk na koniec miesiąca " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    lbTabela9.Text = "Ewidencja spraw odroczonych  na koniec miesiąca " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    lbTabela10.Text = "TABELA 1- NALEŻNOŚCI SĄDOWE I ZALEGŁOŚCI WE WPŁYWACH DO BUDŻETU SKARBU PAŃSTWA  na koniec miesiąca " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    lbTabela11.Text = "TABELA 2 - ILOŚĆ (KWOTA) KIEROWANYCH SPRAW DO EGZEKUCJI KOMORNICZYCH na koniec miesiąca " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    lbTabela12.Text = "TABELA 3 - ILOŚĆ OSÓB (SPRAW PROBACYJNYCH na koniec miesiąca " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    lbTabela13.Text = "INFORMACJA O REALIZACJI NALEŻNOŚCI na koniec miesiąca " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";

                }
            }
            catch
            {

            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            przemiel();
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "print2", "JavaScript: window.print();", true);
            // ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "print", "window.open('raport_01_print.aspx', '')", true);
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string path = Server.MapPath("Template") + "\\oglk2.xlsx";
            FileInfo existingFile = new FileInfo(path);

            string download = Server.MapPath("Template") + @"\oglk2";

            FileInfo fNewFile = new FileInfo(download + "_.xlsx");

            // pierwsza tabelka

            DataTable tabelka001 = (DataTable)Session["tabelka001"];


            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                // pierwsza
               
                ExcelWorksheet MyWorksheet1 = MyExcel.Workbook.Worksheets[1];

                DataTable table = (DataTable)Session["tabelka001"];
                table.Columns.Remove("id");
                table.Columns.Remove("id_sedziego");
                table.Columns.Remove("stanowisko");
                table.Columns.Remove("funkcja");
                try
                {
                    table.Columns.Remove("Id_tabeli");

                }
                catch
                {
                }

                int rowik = 1;
                int przesuniecieX = -1;
                foreach (DataRow dR in table.Rows)
                {
                   
                    MyWorksheet1.Cells[rowik + 2, 1].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                    MyWorksheet1.Cells[rowik + 2, 1].Value = dR[1].ToString().Trim() + " " + dR[2].ToString().Trim();

                    for (int i = 3; i < 10; i++)
                    {
                        MyWorksheet1.Cells[rowik + 2, i+ przesuniecieX].Style.ShrinkToFit = true;
                        MyWorksheet1.Cells[rowik + 2, i+ przesuniecieX].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                        try
                        {
                            MyWorksheet1.Cells[rowik + 2, i+ przesuniecieX].Value = double.Parse(dR[i].ToString().Trim());
                        }
                        catch (Exception)
                        {
                            MyWorksheet1.Cells[rowik + 2, i+ przesuniecieX].Value = dR[i].ToString().Trim();
                        }
                    }
                    rowik++;
                }
                MyWorksheet1.Cells[rowik + 2, 1].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                
                MyWorksheet1.Cells[rowik + 2, 1].Value = "Razem";
                DataTable tabelka = tabela.tabellaLiczbowa(table);

                for (int i = 1; i < 8; i++)
                {
                    object sumObject;
                    string txt = "d_";
                    string digit = i.ToString("D2");
                    txt = txt + digit;
                    sumObject = tabelka.Compute("Sum(" + txt + ")", "");
                    MyWorksheet1.Cells[rowik + 2, i + 1].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                    try
                    {
                        MyWorksheet1.Cells[rowik + 2, i + 1].Value = double.Parse(sumObject.ToString());

                    }
                    catch (Exception)
                    {
                        MyWorksheet1.Cells[rowik + 7, i + 3].Value = sumObject.ToString();

                    }

                }

                // druga 


                ExcelWorksheet MyWorksheet3 = MyExcel.Workbook.Worksheets[2];

                DataTable table2 = (DataTable)Session["tabelka002"];
                table2.Columns.Remove("id");
                table2.Columns.Remove("id_sedziego");
                table2.Columns.Remove("stanowisko");
                table2.Columns.Remove("funkcja");
                try
                {
                    table2.Columns.Remove("Id_tabeli");

                }
                catch
                {
                }


                rowik = 2;
                przesuniecieX = -1;
                foreach (DataRow dR in table2.Rows)
                {
                    MyWorksheet3.Cells[rowik , 1].Value = dR[1].ToString().Trim()+" "+ dR[2].ToString().Trim();
                    MyWorksheet3.Cells[rowik , 1].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                     for (int i = 3; i < 4; i++)
                    {
                        MyWorksheet3.Cells[rowik , i + przesuniecieX].Style.ShrinkToFit = true;
                        MyWorksheet3.Cells[rowik , i + przesuniecieX].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                        try
                        {
                            MyWorksheet3.Cells[rowik , i + przesuniecieX].Value = double.Parse(dR[i].ToString().Trim());
                        }
                        catch
                        {
                            MyWorksheet3.Cells[rowik , i + przesuniecieX].Value = dR[i].ToString().Trim();
                        }
                    }
                    rowik++;
                }
                MyWorksheet3.Cells[rowik , 1].Value = "Razem";
                MyWorksheet3.Cells[rowik , 1].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                DataTable tabelka2 = tabela.tabellaLiczbowa(table2);

                for (int i = 3; i < 4; i++)
                {
                    object sumObject;
                    string txt = "d_";
                    string digit = i.ToString("D2");
                    txt = txt + digit;

                    sumObject = tabelka2.Compute("Sum(" + txt + ")", "");

                    try
                    {

                        MyWorksheet3.Cells[rowik , i + przesuniecieX].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                        MyWorksheet3.Cells[rowik , i + przesuniecieX].Value = double.Parse(sumObject.ToString());
                    }
                    catch (Exception)
                    {

                        MyWorksheet3.Cells[rowik , i + przesuniecieX].Value = sumObject.ToString();
                    }

                }


                // trzecia 


                ExcelWorksheet MyWorksheet4 = MyExcel.Workbook.Worksheets[3];

                DataTable table3 = (DataTable)Session["tabelka003"];
                try
                {
                    table3.Columns.Remove("id");
                    table3.Columns.Remove("id_sedziego");
                    table3.Columns.Remove("stanowisko");
                    table3.Columns.Remove("funkcja");
                    table3.Columns.Remove("Id_tabeli");
                }
                catch (Exception)
                {

                 
                }
                //traeci
                
                table = (DataTable)Session["tabelkaGW003"];
                try
                {
                    table3.Columns.Remove("id");
                    table3.Columns.Remove("id_sedziego");
                    table3.Columns.Remove("stanowisko");
                    table3.Columns.Remove("funkcja");
                    table3.Columns.Remove("Id_tabeli");
                }
                catch (Exception)
                {


                }

                MyWorksheet3 = tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[3], table, 12, 1, 5, false);

                rowik = 3;
                przesuniecieX = -3;
            
            
    
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

            przemiel();
        }


        protected void LinkButton54_Click(object sender, EventArgs e)
        {
            przemiel();
        }

        protected void LinkButton55_Click(object sender, EventArgs e)
        {
            makeLabels();
            przemiel();
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "print2", "JavaScript: window.print();", true);
            makeLabels();
        }


        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka001"];
                tabela.makeSumRow(table, e);
            }

        }


        protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka002"];
                tabela.makeSumRow(table, e);
            }
        }

        protected void GridView4_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka003"];
                tabela.makeSumRow(table, e);
            }
        }

      

        protected void naglowekTabeli1a(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_01"];
                tabela.makeHeader(sn, dT, GridView1);
            }
        }

        protected void naglowekTabeli6(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_06"];
                tabela.makeHeader(sn, dT, GridView6);
            }
        }

        protected void stopkaTabeli6(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka006"];
                tabela.makeSumRow(table, e,1);
            }
        }
    }
}