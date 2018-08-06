﻿using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using OfficeOpenXml;


namespace stat2018
{
    using System;
   
    public partial class oglk : System.Web.UI.Page
    {

        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr= new dataReaders ();
        int storid = 0;
        int rowIndex = 1;
        const string tenPlik = "oglk.aspx";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
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
                if (Date1.Text.Length == 0)
                {
                    Date1.Text = dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-01";
                    Date1.Date = DateTime.Parse(Date1.Text);
                }
                if (Date2.Text.Length == 0)
                {
                    Date2.Text = dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-" + DateTime.DaysInMonth(dTime.Year, dTime.Month).ToString("D2");
                    Date2.Date = DateTime.Parse(Date2.Text);
                }

            }
            catch
            { }
            Session["data_1"] = Date1.Text;
            Session["data_2"] = Date2.Text;
            clearHedersSession();
            makeHeader();
            try
            {
                string user = (string)Session["userIdNum"];
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
                // Server.Transfer("default.aspx");
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
            string yyx = (string)Session["id_dzialu"];
            //id_dzialu.Text = (string)Session["txt_dzialu"];
            string txt = string.Empty; //
            cl.deleteRowTable();

            txt = txt + cl.clear_maim_db();
            try
            {
                cm.log.Info(tenPlik+ "ładowanie danych do tabeli 2");
                DataTable tabelka01 = dr .generuj_dane_do_tabeli_wierszy2018(DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), (string)Session["id_dzialu"], 2,20,20,tenPlik);
                Session["tabelka001"] = tabelka01;

                cm.log.Info(tenPlik + "ładowanie danych do tabeli 1");
                 string info = dr.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 1, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text),tenPlik);
                cm.log.Info(tenPlik + "Koniec ładowania danych do tabeli 1 "+ info);
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }


            try
            {
                cm.log.Info(tenPlik + "ładowanie danych do tabeli 3");
                txt = txt + dr.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 3, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text),tenPlik);

            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }


            try
            {
                cm.log.Info(tenPlik + "ładowanie danych do tabeli 5");
                txt = txt + dr.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 5, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text),tenPlik);

            }
            catch (Exception ex)
            {

                cm.log.Error(tenPlik + " " + ex.Message);
            }


            try
            {
                cm.log.Info(tenPlik + "ładowanie danych do tabeli ");

            }
            catch (Exception ex)
            {

                cm.log.Error(tenPlik + " " + ex.Message);
            }


            try
            {

                
                DataTable tabelka04 = dr.generuj_dane_do_tabeli_wierszy2018(DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text),  ((string)Session["id_dzialu"]),4,10,2,tenPlik);
                Session["tabelka004"] = tabelka04;

              
                // wypełnianie danych labeli
                tab_4_w01_c01.Text = tabelka04.Rows[0][1].ToString().Trim();
                tab_4_w01_c02.Text = tabelka04.Rows[0][2].ToString().Trim();

                tab_4_w02_c01.Text = tabelka04.Rows[1][1].ToString().Trim();
                tab_4_w02_c02.Text = tabelka04.Rows[1][2].ToString().Trim();

                tab_4_w03_c01.Text = tabelka04.Rows[2][1].ToString().Trim();
                tab_4_w03_c02.Text = tabelka04.Rows[2][2].ToString().Trim();

                tab_4_w04_c01.Text = tabelka04.Rows[3][1].ToString().Trim();
                tab_4_w04_c02.Text = tabelka04.Rows[3][2].ToString().Trim();

                tab_4_w05_c01.Text = tabelka04.Rows[4][1].ToString().Trim();
                tab_4_w05_c02.Text = tabelka04.Rows[4][2].ToString().Trim();

                tab_4_w06_c01.Text = tabelka04.Rows[5][1].ToString().Trim();
                tab_4_w06_c02.Text = tabelka04.Rows[5][2].ToString().Trim();

                tab_4_w07_c01.Text = tabelka04.Rows[6][1].ToString().Trim();
                tab_4_w07_c02.Text = tabelka04.Rows[6][2].ToString().Trim();

                tab_4_w08_c01.Text = tabelka04.Rows[7][1].ToString().Trim();
                tab_4_w08_c02.Text = tabelka04.Rows[7][2].ToString().Trim();

                tab_4_w09_c01.Text = tabelka04.Rows[8][1].ToString().Trim();
                tab_4_w09_c02.Text = tabelka04.Rows[8][2].ToString().Trim();

                tab_4_w10_c01.Text = tabelka04.Rows[9][1].ToString().Trim();
                tab_4_w10_c02.Text = tabelka04.Rows[9][2].ToString().Trim();



            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }

            // dopasowanie opisów
            makeLabels();

            GridView1.DataBind();
            GridView3.DataBind();
            GridView5.DataBind();


            txt = txt + "GridView1 liczba wierszy: " + GridView1.Rows.Count.ToString() + Environment.NewLine;
            
            try
            {
                Label11.Visible = cl.debug(int.Parse(yyx));
                infoLabel2.Visible = cl.debug(int.Parse(yyx));
                infoLabel3.Visible = cl.debug(int.Parse(yyx));
                infoLabel4.Visible = cl.debug(int.Parse(yyx));
                infoLabel5.Visible = cl.debug(int.Parse(yyx));

            }
            catch
            {
                Label11.Visible = false;
                infoLabel2.Visible = false;
                infoLabel3.Visible = false;
                infoLabel4.Visible = false;
                infoLabel5.Visible = false;
            }

            Label11.Text = txt;
            Label3.Text = cl.nazwaSadu((string)Session["id_dzialu"]);


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
            dT_01.Columns.Add("Column6", typeof(string));

            DataTable dT_02 = new DataTable();
            dT_02.Columns.Clear();
            dT_02.Columns.Add("Column1", typeof(string));
            dT_02.Columns.Add("Column2", typeof(string));
            dT_02.Columns.Add("Column3", typeof(string));
            dT_02.Columns.Add("Column4", typeof(string));
            dT_02.Columns.Add("Column5", typeof(string));
            dT_02.Columns.Add("Column6", typeof(string));
            DataTable dT_03 = new DataTable();
            dT_03.Columns.Clear();
            dT_03.Columns.Add("Column1", typeof(string));
            dT_03.Columns.Add("Column2", typeof(string));
            dT_03.Columns.Add("Column3", typeof(string));
            dT_03.Columns.Add("Column4", typeof(string));
            dT_03.Columns.Add("Column5", typeof(string));
            dT_03.Columns.Add("Column6", typeof(string));
            DataTable dT_04 = new DataTable();
            dT_04.Columns.Clear();
            dT_04.Columns.Add("Column1", typeof(string));
            dT_04.Columns.Add("Column2", typeof(string));
            dT_04.Columns.Add("Column3", typeof(string));
            dT_04.Columns.Add("Column4", typeof(string));
            dT_04.Columns.Add("Column5", typeof(string));
            dT_04.Columns.Add("Column6", typeof(string));

            DataTable dT_05 = new DataTable();
            dT_05.Columns.Clear();
            dT_05.Columns.Add("Column1", typeof(string));
            dT_05.Columns.Add("Column2", typeof(string));
            dT_05.Columns.Add("Column3", typeof(string));
            dT_05.Columns.Add("Column4", typeof(string));
            dT_05.Columns.Add("Column5", typeof(string));
            dT_05.Columns.Add("Column6", typeof(string));

            DataTable dT_06 = new DataTable();
            dT_06.Columns.Clear();
            dT_06.Columns.Add("Column1", typeof(string));
            dT_06.Columns.Add("Column2", typeof(string));
            dT_06.Columns.Add("Column3", typeof(string));
            dT_06.Columns.Add("Column4", typeof(string));
            dT_06.Columns.Add("Column5", typeof(string));
            dT_06.Columns.Add("Column6", typeof(string));

            dT_01.Clear();
            dT_01.Rows.Add(new Object[] { "1", "C", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Ns", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Nsm", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Co", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Nmo", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Cps", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Nkd", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Łącznie", "1", "1" });
            dT_01.Rows.Add(new Object[] { "2", "Ruch spraw", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "sprawy wg. repertoriów lub wykazów", "8", "1" });
            Session["header_01"] = dT_01;

            #endregion


            #region tabela  2 ()

            dT_02.Clear();

            dT_02.Rows.Add(new Object[] { "1", "1", "2", "1", "h", "165" });//
            dT_02.Rows.Add(new Object[] { "1", "2", "1", "1", "h", "130" });//
            dT_02.Rows.Add(new Object[] { "1", "3", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "4", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "5", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "6", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "7", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "8", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "9", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "10", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "11", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "12", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "13", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "14", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "15", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "16", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "17", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "18", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "19", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "20", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "1", "21", "1", "1", "h", "45" });//



            dT_02.Rows.Add(new Object[] { "2", "pub- liczne", "1", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "2", "prywatki", "1", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "2", "wyrokiem", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "2", "nakazem", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "2", "inne", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "2", "Ko", "1", "1", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "2", "1Ko", "1", "1", "h", "45" });//;



            dT_02.Rows.Add(new Object[] { "3", "K", "1", "2", "h", "10" });//
            dT_02.Rows.Add(new Object[] { "3", "z tego  ", "2", "1", "h", "90" });//
            dT_02.Rows.Add(new Object[] { "3", "załawione", "3", "1", "h", "135" });//
            dT_02.Rows.Add(new Object[] { "3", "Ko", "1", "2", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "3", "z tego", "2", "1", "h", "90" });//
            dT_02.Rows.Add(new Object[] { "3", "Kp", "1", "2", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "3", "W", "1", "2", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "3", "w tym zała- twione na podst. art.. 93 kpw (NK)", "1", "2", "h", "45" });//

            dT_02.Rows.Add(new Object[] { "4", "Dni rozp- rawy", "1", "3", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "4", "Dni posie- dzeń", "1", "3", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "4", "Sprawy Karne", "10", "1", "h", "450" });//
            dT_02.Rows.Add(new Object[] { "4", "Sprawy Wykrocze- niowe", "2", "1", "h", "90" });//
            dT_02.Rows.Add(new Object[] { "4", "Kop", "1", "3", "h", "45" });//
            dT_02.Rows.Add(new Object[] { "4", "Sprawy karne i wykro- cze- niowe", "1", "3", "h", "45" });//


            dT_02.Rows.Add(new Object[] { "5", "L.p.", "1", "4", "h", "35" });

            dT_02.Rows.Add(new Object[] { "5", "Sędzia", "1", "4", "h", "130" });//Choroby I urlopy w dniach roboczych
            dT_02.Rows.Add(new Object[] { "5", "Choroby i urlopy w dniach roboczych", "1", "4", "h", "130" });//

            dT_02.Rows.Add(new Object[] { "5", "Ilość sesji", "2", "1", "h", "90" });
            dT_02.Rows.Add(new Object[] { "5", "Ilość spraw skier. na wokandy", "1", "4", "h", "45" });// 

            dT_02.Rows.Add(new Object[] { "5", "Załatwienia", "14", "1", "h", "45" });// 
            dT_02.Rows.Add(new Object[] { "5", "Med", "1", "4", "h", "45" });
            dT_02.Rows.Add(new Object[] { "5", "Sprawy zawie- szone", "1", "4", "h", "45" });
            Session["header_02"] = dT_02;



            #endregion
            #region tabela  3 ()

            dT_03.Clear();



            dT_03.Rows.Add(new Object[] { "1", "K", "1", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "Ko", "1", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "Kp", "1", "1", "h" });

            dT_03.Rows.Add(new Object[] { "1", "W   ", "1", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "Kop", "1", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "Ogółem", "1", "1", "h" });

            dT_03.Rows.Add(new Object[] { "2", "L.p.", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Nazwisko i imię", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Wpływ do repertorium/wykazu", "6", "1", "h" });





            Session["header_03"] = dT_03;

            #endregion



            #region tabela  4 ()

            dT_04.Clear();

            dT_04.Rows.Add(new Object[] { "1", "1-14 dni", "1", "1", "v" });
            dT_04.Rows.Add(new Object[] { "1", "%", "1", "1", "v" });
            dT_04.Rows.Add(new Object[] { "1", "w tym nieuspra-<br/>wiedliwione", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "15-30 dni", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "%", "1", "1", "v" });
            dT_04.Rows.Add(new Object[] { "1", "w tym nieuspra-<br/>wiedliwione", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "pow. 1 do 3 mies.", "1", "1", "v" });
            dT_04.Rows.Add(new Object[] { "1", "%", "1", "1", "v" });
            dT_04.Rows.Add(new Object[] { "1", "w tym nieuspra-<br/>wiedliwione", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "ponad 3 mies.", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "%", "1", "1", "v" });
            dT_04.Rows.Add(new Object[] { "1", "w tym nieuspra-<br/>wiedliwione", "1", "1" });


            dT_04.Rows.Add(new Object[] { "1", "1-14 dni", "1", "1", "v" });

            dT_04.Rows.Add(new Object[] { "1", "15-30 dni", "1", "1" });

            dT_04.Rows.Add(new Object[] { "1", "pow. 1 do 3 mies.", "1", "1", "v" });

            dT_04.Rows.Add(new Object[] { "1", "ponad 3 mies.", "1", "1" });

            dT_04.Rows.Add(new Object[] { "1", "L", "1", "1", "v" });
            dT_04.Rows.Add(new Object[] { "1", "%", "1", "1" });

            #endregion

            #region tabela  5 ()

            dT_05.Clear();

            dT_05.Rows.Add(new Object[] { "1", "R", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "P", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "razem", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "razem", "1", "1", "h" });

            dT_05.Rows.Add(new Object[] { "1", "K", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "W", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "K", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "W", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "K", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "W", "1", "1", "h" });

            dT_05.Rows.Add(new Object[] { "1", "K", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "Kop", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "Ko", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "Kp", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "W", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "Razem", "1", "1", "h" });


            dT_05.Rows.Add(new Object[] { "2", "L.p.", "1", "2", "h" });
            dT_05.Rows.Add(new Object[] { "2", "Imie i nazwisko sędziego", "1", "2", "h" });
            dT_05.Rows.Add(new Object[] { "2", "Efektywny okres oczekiwania", "1", "2", "h" });
            dT_05.Rows.Add(new Object[] { "2", "Ilość sesji ", "3", "1", "H" });
            dT_05.Rows.Add(new Object[] { "2", "Ilość wyznaczonych ", "3", "1", "H" });
            dT_05.Rows.Add(new Object[] { "2", "Ilość odroczeń ", "2", "1", "H" });

            dT_05.Rows.Add(new Object[] { "2", "Ilość przewr ", "2", "1", "H" });
            dT_05.Rows.Add(new Object[] { "2", "Załatwienia ", "6", "1", "H" });
            dT_05.Rows.Add(new Object[] { "2", "Średnio miesię- cznie ", "1", "2", "H" });
            dT_05.Rows.Add(new Object[] { "2", "Średnio miesię- cznie K", "1", "2", "H" });
         //   dT_05.Rows.Add(new Object[] { "2", "Stan referatów ", "6", "1", "H" });


            Session["header_05"] = dT_05;


            dT_06.Clear();
            dT_06.Rows.Add(new Object[] { "1", "K", "1", "1", "h" });
            dT_06.Rows.Add(new Object[] { "1", "Ko", "1", "1", "h" });
            dT_06.Rows.Add(new Object[] { "1", "Kop", "1", "1", "h" });
            dT_06.Rows.Add(new Object[] { "1", "Kp", "1", "1", "h" });
            dT_06.Rows.Add(new Object[] { "1", "W", "1", "1", "h" });
            dT_06.Rows.Add(new Object[] { "1", "Razem", "1", "1", "h" });
            

            dT_06.Rows.Add(new Object[] { "2", "L.p.", "1", "2", "h" });
            dT_06.Rows.Add(new Object[] { "2", "Imie i nazwisko sędziego", "1", "2", "h" });
            dT_06.Rows.Add(new Object[] { "2", "Stan referatów ", "6", "1", "H" });


            Session["header_06"] = dT_06;
            #endregion


        }

        protected void GridView3_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_03"];
                cl.makeHeader(sn, dT, GridView3);
            }
        }



        protected void GridView5_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_05"];
                cl.makeHeader(sn, dT, GridView5);
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
                Label3.Text = cl.nazwaSadu((string)Session["id_dzialu"]);


                //	id_dzialu.Text = (string)Session["txt_dzialu"];
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
                    tabela2Label.Text = "Informacja z ruchu spraw za miesiąc " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    Label17.Text = "Informacja z wpływu spraw za miesiąc " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    Label2.Text = "Ewidencja spraw odroczonych  za miesiąc " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    //     Label15.Text = "Załatwienia na koniec miesiąca " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";


                }
                else
                {
                    tabela2Label.Text = "Informacja z ruchu spraw za okres od " + Date1.Text + " do  " + Date2.Text;
                    Label17.Text = "Informacja z wpływu spraw za okres od" + Date1.Text + " do  " + Date2.Text;
                    Label2.Text = "Ewidencja spraw odroczonych za okres od " + Date1.Text + " do  " + Date2.Text;
                    //    Label15.Text = "Załatwienia za okres od " + Date1.Text + " do  " + Date2.Text;

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
            string path = Server.MapPath("Template") + "\\oglk.xlsx";
            FileInfo existingFile = new FileInfo(path);

            string download = Server.MapPath("Template") + @"\oglk";

            FileInfo fNewFile = new FileInfo(download + "_.xlsx");

            // pierwsza tabelka




            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                // pierwsza

                int rowik = 0;


                ExcelWorksheet MyWorksheet1 = MyExcel.Workbook.Worksheets[1];
                DataView view = (DataView)tabela_1.Select(DataSourceSelectArguments.Empty);
                DataTable table = view.ToTable();
                table.Columns.Remove("ident");
                table.Columns.Remove("id_sedziego");
                table.Columns.Remove("stanowisko");
                table.Columns.Remove("funkcja");


                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], table, 21, 0, 7, false,false,false,false,false);
                // pod tabela z tebeli nr 2

                // obwodnia
              rowik=  table.Rows.Count;
                for (int row2 = rowik; row2 < rowik + 11; row2++)
                {


                    for (int i = 1; i < 22; i++)
                    {
                        MyWorksheet1.Cells[row2 + 7, i].Style.ShrinkToFit = true;
                        MyWorksheet1.Cells[row2 + 7, i].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                    }

                }
                //------------

                MyWorksheet1.Cells[rowik + 7, 1, rowik + 7, 5].Merge = true;
                MyWorksheet1.Cells[rowik + 7, 1].Value = "Zaległość z poprzedniego miesiąca";
                MyWorksheet1.Cells[rowik + 8, 1, rowik + 8, 5].Merge = true;
                MyWorksheet1.Cells[rowik + 8, 1].Value = "Wpływ";
                MyWorksheet1.Cells[rowik + 9, 1, rowik + 9, 5].Merge = true;
                MyWorksheet1.Cells[rowik + 9, 1].Value = "Wpływ";
                MyWorksheet1.Cells[rowik + 10, 1, rowik + 10, 5].Merge = true;
                MyWorksheet1.Cells[rowik + 10, 1].Value = "Załatwienia";
                MyWorksheet1.Cells[rowik + 11, 1, rowik + 11, 5].Merge = true;
                MyWorksheet1.Cells[rowik + 11, 1].Value = " Pozostało na następny miesiąc";
                MyWorksheet1.Cells[rowik + 12, 1, rowik + 17, 1].Merge = true;
                MyWorksheet1.Cells[rowik + 12, 1].Value = " Zaległość";

                MyWorksheet1.Cells[rowik + 12,2, rowik + 12, 5].Merge = true;
                MyWorksheet1.Cells[rowik + 12, 2].Value = " 0-3 miesiący";
                MyWorksheet1.Cells[rowik + 13,2, rowik + 13, 5].Merge = true;
                MyWorksheet1.Cells[rowik + 13, 2].Value = " 3-6 miesięcy";
                MyWorksheet1.Cells[rowik + 14,2, rowik + 14, 5].Merge = true;
                MyWorksheet1.Cells[rowik + 14, 2].Value = " 6-12 miesięcy";

                MyWorksheet1.Cells[rowik + 15,2, rowik + 15, 5].Merge = true;
                MyWorksheet1.Cells[rowik + 15, 2].Value = " 12-24 miesięcy (do 2 lat)";


                MyWorksheet1.Cells[rowik + 16,2, rowik + 16, 5].Merge = true;
                MyWorksheet1.Cells[rowik + 16, 2].Value = " 36-60 miesięcy (3-5 lat)";

                MyWorksheet1.Cells[rowik + 17,2, rowik + 17, 5].Merge = true;
                MyWorksheet1.Cells[rowik + 17, 2].Value = " Powyżej 60 miesięcy (powyżej 5 lat)";
                DataTable tabelka001 = (DataTable)Session["tabelka001"];


                int ilWierszy = tabelka001.Rows.Count;
                int j = 0;

                foreach (DataRow dR in tabelka001.Rows)
                {
                    if (j <= ilWierszy - 10)
                    {
                        for (int i = 2; i < 18; i++)
                        {
                            try
                            {
                                MyWorksheet1.Cells[rowik + 7, i + 4].Value = double.Parse(dR[i - 1].ToString().Trim());
                            }
                            catch
                            {

                                MyWorksheet1.Cells[rowik + 7, i + 4].Value = dR[i - 1].ToString().Trim();
                            }
                        }
                        j++;
                    }
                    rowik++;
                }



                // trzecia 


                ExcelWorksheet MyWorksheet2 = MyExcel.Workbook.Worksheets[2];

                DataView view2 = (DataView)tabela_3.Select(DataSourceSelectArguments.Empty);

                DataTable table2 = view2.ToTable();
                table2.Columns.Remove("ident");
                table2.Columns.Remove("id_sedziego");
                table2.Columns.Remove("stanowisko");
                table2.Columns.Remove("funkcja");


                rowik = 2;
                foreach (DataRow dR in table2.Rows)
                {

                    MyWorksheet2.Cells[rowik + 3, 1].Value = dR[1].ToString().Trim() + " " + dR[2].ToString().Trim(); ;
                    MyWorksheet2.Cells[rowik + 3, 1].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                    for (int i = 3; i < 9; i++)
                    {
                        MyWorksheet2.Cells[rowik + 3, i - 1].Style.ShrinkToFit = true;
                        MyWorksheet2.Cells[rowik + 3, i - 1].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                        try
                        {
                            MyWorksheet2.Cells[rowik + 3, i - 1].Value = double.Parse(dR[i].ToString().Trim());
                        }
                        catch
                        {
                            MyWorksheet2.Cells[rowik + 3, i - 1].Value = dR[i].ToString().Trim();
                        }
                    }
                    rowik++;
                }
                MyWorksheet2.Cells[rowik + 3, 1].Value = "Razem";
                MyWorksheet2.Cells[rowik + 3, 1].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);


                for (int i = 3; i < 9; i++)
                {
                    object sumObject;
                    string txt = "d_";
                    string digit = i.ToString("D2");
                    txt = txt + digit;

                    sumObject = table2.Compute("Sum(" + txt + ")", "");

                    try
                    {

                        MyWorksheet2.Cells[rowik + 3, i - 1].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                        MyWorksheet2.Cells[rowik + 3, i - 1].Value = double.Parse(sumObject.ToString());
                    }
                    catch (Exception)
                    {

                        MyWorksheet2.Cells[rowik + 3, i - 1].Value = sumObject.ToString();
                    }

                }

                // czwarta 

                ExcelWorksheet MyWorksheet4 = MyExcel.Workbook.Worksheets[3];
                MyWorksheet4.Cells[1, 1].Value = "Ewidencja spraw odroczonych  ";
               
                DataTable czwarta = (DataTable)Session["tabelka004"];
                for (int ii = 0; ii < 2; ii++)
                {
                    for (int jj = 0; jj < 10; jj++)
                    {
                        try
                        {
                            MyWorksheet4.Cells[3 + jj, 4 + ii].Value = czwarta.Rows[ii][jj+1].ToString();
                        }
                        catch (Exception)
                        { }
                    }
                }

                // piąta

                ExcelWorksheet MyWorksheet5 = MyExcel.Workbook.Worksheets[4];
                DataView view4 = (DataView)tabela_5.Select(DataSourceSelectArguments.Empty);
                DataTable table4 = view2.ToTable();
                table4.Columns.Remove("ident");
                table4.Columns.Remove("id_sedziego");
                table4.Columns.Remove("stanowisko");
                table4.Columns.Remove("funkcja");


                rowik = 1;
                foreach (DataRow dR in table4.Rows)
                {
                    MyWorksheet5.Cells[rowik + 2, 1].Value = dR[1].ToString().Trim() + " " + dR[2].ToString().Trim();
                    MyWorksheet5.Cells[rowik + 2, 1].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                    for (int i = 3; i < 28; i++)
                    {
                        MyWorksheet5.Cells[rowik + 2, i - 1].Style.ShrinkToFit = true;
                        MyWorksheet5.Cells[rowik + 2, i - 1].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                        try
                        {
                            MyWorksheet5.Cells[rowik + 2, i - 1].Value = double.Parse(dR[i].ToString().Trim());
                        }
                        catch (Exception)
                        {
                            MyWorksheet5.Cells[rowik + 2, i - 1].Value = dR[i].ToString().Trim();
                        }
                    }
                    rowik++;
                }
                MyWorksheet5.Cells[rowik + 2, 1].Value = "Razem";
                for (int i = 3; i < 28; i++)
                {
                    object sumObject;
                    string txt = "d_";
                    string digit = i.ToString("D2");
                    txt = txt + digit;
                    sumObject = null;

                    try
                    {
                        MyWorksheet5.Cells[rowik + 2, i - 1].Value = double.Parse(sumObject.ToString());
                    }
                    catch (Exception)
                    {
                        try
                        {
                            MyWorksheet5.Cells[rowik + 2, i - 1].Value = sumObject.ToString();
                        }
                        catch (Exception)
                        { }
                    }
                }

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
                    //  Label31.Text = Label31.Text + "Save Error massage " + ex.Message + "<br/>";

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
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "print2", "JavaScript: window.print();window.PrintPreview();", true);
            makeLabels();
        }
       
        
        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_02"];
                cl.makeHeader(sn, dT, GridView1);
            }
            else
            {
                if ((storid > 0) && (DataBinder.Eval(e.Row.DataItem, "id") == null))
                {
                    rowIndex = 0;
                    AddNewRow(sender, e);
                }
            }
        }

        protected void GridView6_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_06"];
                cl.makeHeader(sn, dT, GridView6);
            }
        }

       

        protected void makeSumRow(DataTable table, GridViewRowEventArgs e,int przesunięcie)
        {

            object sumObject;
            int ilKolumn = e.Row.Cells.Count;
            e.Row.Cells[1].Text = "Ogółem";
            for (int i = 1; i < e.Row.Cells.Count- przesunięcie; i++)
            {
                try
                {
                    sumObject = table.Compute("Sum(" + "d_" + (i - 1).ToString("D2") + ")", "");
                    e.Row.Cells[i+ przesunięcie].Text = sumObject.ToString();
                }
                catch (Exception)
                { }

            }

        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = ((DataView)tabela_1.Select(DataSourceSelectArguments.Empty)).ToTable();
                tb.makeSumRow(table, e);
            }
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                storid = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "id").ToString());
            }
        }


        protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = ((DataView)tabela_3.Select(DataSourceSelectArguments.Empty)).ToTable();
                tb.makeSumRow(table, e);
            }
        }


        protected void GridView5_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = ((DataView)tabela_5.Select(DataSourceSelectArguments.Empty)).ToTable();
                tb.makeSumRow(table, e,1);
            }
        }

        //podtabela

        protected void GridView6_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = ((DataView)Tabela_6.Select(DataSourceSelectArguments.Empty)).ToTable();
                tb.makeSumRow(table, e);
            }
        }

        GridViewRow wierszTabeli(DataTable dane, int iloscKolumn, int idWiersza, string idtabeli, string tekst, int colSpan, int rowSpan, string CssStyleDlaTekstu, string cssStyleDlaTabeli,string drugiText,int colSpanDrugi,int rowSpanDrugi, string cssStyleDrugi)
        {
            // nowy wiersz

            DataTable tabelka01 = (DataTable)Session["tabelka001"];
            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
            NewTotalRow.Cells.Add(tb.cela(drugiText , 7,2, "borderTopLeft "));

            NewTotalRow.Cells.Add(tb.cela(tekst, colSpan, rowSpan,cssStyleDlaTabeli));
            for (int i = 1; i < 17; i++)
            {
                NewTotalRow.Cells.Add(tb. cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!" + idtabeli.ToString().Trim() + "!" + i.ToString().Trim() + "!3')\">" + dane.Rows[idWiersza - 1][i].ToString().Trim() + "</a>", 1, 1, cssStyleDlaTabeli));
            }

            return NewTotalRow;


        }


        public void AddNewRow(object sender, GridViewRowEventArgs e)
        {
            GridView GridView1 = (GridView)sender;
            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
            string idtabeli = "2";
            DataTable tabelka01 = (DataTable)Session["tabelka001"];

            int idWiersza = 1;

            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "Zaległość z poprzedniego miesiąca",6, 1, "borderTopLeft col_180", "borderTopLeft col_60"));

            idWiersza = 2;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "Wpływ",6, 1, "borderTopLeft col_180", "borderTopLeft col_60"));

            // nowy wiersz
            idWiersza = 3;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "Załatwienie",6, 1, "borderTopLeft col_180", "borderTopLeft col_60"));

            // nowy wiersz
            idWiersza = 4;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "pozostałość na następny miesiąc",6, 1, "borderTopLeft col_180", "borderTopLeft col_60"));

            // nowy wiersz
            idWiersza = 5;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "0-3 miesiący ", 4, 1, "borderTopLeft col_180", "borderTopLeft col_60", "w tym", 7, 2, "borderTopLeft"));
       //     GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli2(idWiersza, idtabeli, "0-3 miesiący "));
            // nowy wiersz
            idWiersza = 6;
            
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "3-6 miesięcy",4, 1, "borderTopLeft col_180", "borderTopLeft col_60"));

            // nowy wiersz
            idWiersza = 7;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "6-12 miesięcy ", 4, 1, "borderTopLeft col_180", "borderTopLeft col_60"));

            // nowy wiersz
            idWiersza = 8;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "12-24 miesięcy</br> (do 2 lat)", 4, 1, "borderTopLeft col_180", "borderTopLeft col_60"));

            idWiersza = 9;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "24-36 miesięcy </br>(2-3 lat))", 4, 1, "borderTopLeft col_180", "borderTopLeft col_60"));

            idWiersza = 10;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "36-60 miesięcy </br>(3-5 lat)", 4, 1, "borderTopLeft col_180", "borderTopLeft col_60"));

            idWiersza = 11;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "Powyżej 60 miesięcy </br>(powyżej</br> 5 lat)", 4, 1, "borderTopLeft col_180", "borderTopLeft col_60"));

        }

    }
}