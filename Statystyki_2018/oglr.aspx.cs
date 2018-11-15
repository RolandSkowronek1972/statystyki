using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using OfficeOpenXml;


namespace stat2018
{
   
    public partial class oglr : System.Web.UI.Page
    {

        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tabela = new tabele();
        public dataReaders dr = new dataReaders();
        int storid = 0;
        int rowIndex = 1;

        public static string tenPlik = "oglr.aspx";

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

            cl.clear_maim_db();
            try
            {

                DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), (string)Session["id_dzialu"], 2, 20, 23, tenPlik);
                Session["tabelka001"] = tabelka01;
                cm.log.Info(tenPlik + " : Wygenerowano dal tabeli 2" + tabelka01.Rows.Count.ToString() + " wierszy");
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " : " + ex.Message);
            }

            try
            {
                txt = cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 1, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text));
                cm.log.Info(tenPlik + " : " + txt);
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " : " + ex.Message);
            }

            try
            {
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 4, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text));
                cm.log.Info(tenPlik + " : " + txt);
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " : " + ex.Message);
            }


          

            try
            {
                DataTable tabela3 = dr.generuj_dane_do_tabeli_sedziowskiej_2018(int.Parse(id_dzialu), 3, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 31, tenPlik);
                cm.log.Info(tenPlik + " : Wygenerowano dal tabeli 3" + tabela3.Rows.Count.ToString() + " wierszy");
                GridView3.DataSource = null;
                GridView3.DataSourceID = null;
                GridView3.DataSource = tabela3;
                GridView3.DataBind();
                Session["tabela3"] = tabela3;
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " : " + ex.Message);
            }

            // dopasowanie opisów
            try
            {
                makeLabels();

                GridView1.DataBind();
                GridView3.DataBind();
                GridView4.DataBind();
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " : " + ex.Message);
            }
            
            try
            {
                Label11.Visible = cl.debug(int.Parse(id_dzialu));
                infoLabel2.Visible = cl.debug(int.Parse(id_dzialu));
                infoLabel3.Visible = cl.debug(int.Parse(id_dzialu));
                infoLabel5.Visible = cl.debug(int.Parse(id_dzialu));
            }
            catch
            {
                Label11.Visible = false;
                infoLabel2.Visible = false;
                infoLabel3.Visible = false;

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


            dT_02.Rows.Add(new Object[] { "1", "", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "zaw", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "zaw", "1", "1", "h", "60" });//

            dT_02.Rows.Add(new Object[] { "1", "", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "zaw", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "zaw", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "zaw", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "zaw", "1", "1", "h", "60" });//

            dT_02.Rows.Add(new Object[] { "1", "", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "zaw", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "zaw", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "zaw", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "zaw", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "zaw", "1", "1", "h", "60" });//

            dT_02.Rows.Add(new Object[] { "2", "Nmo", "2", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "2", "Nkd", "2", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "2", "Nsm", "2", "1", "h", "120" });//
            dT_02.Rows.Add(new Object[] { "2", "Razem", "2", "1", "h", "120" });//;
            dT_02.Rows.Add(new Object[] { "2", "RC", "2", "1", "h", "120" });//
            dT_02.Rows.Add(new Object[] { "2", "RNc", "2", "1", "h", "120" });//
            dT_02.Rows.Add(new Object[] { "2", "RNs", "2", "1", "h", "120" });//
            dT_02.Rows.Add(new Object[] { "2", "RCo", "2", "1", "h", "120" });//;
            dT_02.Rows.Add(new Object[] { "2", "Cps", "2", "1", "h", "120" });//;

            dT_02.Rows.Add(new Object[] { "2", "Razem", "2", "1", "h", "120" });//;
            dT_02.Rows.Add(new Object[] { "2", "", "2", "1", "h", "120" });//;


            dT_02.Rows.Add(new Object[] { "3", "L.p.", "1", "3", "h", "10" });//
            dT_02.Rows.Add(new Object[] { "3", "Nazwisko i imię Sędziego", "1", "3", "h", "130" });//
            dT_02.Rows.Add(new Object[] { "3", "Dni rozpraw", "1", "3", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "3", "ZAŁATWIENIA Sprawy rodzinne i nieletnich", "22", "1", "h", "45" });//


            Session["header_02"] = dT_02;



            #endregion
            #region tabela  3 ()

            dT_03.Clear();



            dT_03.Rows.Add(new Object[] { "1", "Na rozprawach", "1", "1", "v" });
            dT_03.Rows.Add(new Object[] { "1", "Na posiedzeniach", "1", "1", "v" });


            dT_03.Rows.Add(new Object[] { "1", "Na rozprawach", "1", "1", "v" });
            dT_03.Rows.Add(new Object[] { "1", "Na posiedzeniach", "1", "1", "v" });


            dT_03.Rows.Add(new Object[] { "1", "Na rozprawach", "1", "1", "v" });
            dT_03.Rows.Add(new Object[] { "1", "Na posiedzeniach", "1", "1", "v" });


            dT_03.Rows.Add(new Object[] { "1", "Na rozprawach", "1", "1", "v" });
            dT_03.Rows.Add(new Object[] { "1", "Na posiedzeniach", "1", "1", "v" });



            dT_03.Rows.Add(new Object[] { "1", "Na rozprawach", "1", "1", "v" });
            dT_03.Rows.Add(new Object[] { "1", "Na posiedzeniach", "1", "1", "v" });


            dT_03.Rows.Add(new Object[] { "1", "Na rozprawach", "1", "1", "v" });
            dT_03.Rows.Add(new Object[] { "1", "Na posiedzeniach", "1", "1", "v" });


            dT_03.Rows.Add(new Object[] { "1", "Na rozprawach", "1", "1", "v" });
            dT_03.Rows.Add(new Object[] { "1", "Na posiedzeniach", "1", "1", "v" });


            dT_03.Rows.Add(new Object[] { "1", "Na rozprawach", "1", "1", "v" });
            dT_03.Rows.Add(new Object[] { "1", "Na posiedzeniach", "1", "1", "v" });




            dT_03.Rows.Add(new Object[] { "2", "Rozpraw", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Posiedzeń", "1", "2", "h" });

            dT_03.Rows.Add(new Object[] { "2", "Razem", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Na rozprawach", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Na posiedzeniach", "1", "2", "h" });

            //RC		RNs		Nsm		Rco		Nmo		RCps		Nkd	


            dT_03.Rows.Add(new Object[] { "2", "Rc", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "RNs", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Nsm", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Rco", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Nmo", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "RCps", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Nkd", "2", "1", "h" });


            dT_03.Rows.Add(new Object[] { "3", "L.p.", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Nazwisko i imię", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Pozostałość na początek okresu kontrolnego", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Wpływ", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Średni miesieczny wpływ ( w faktycznym czasie pracy)", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Efektywny czas pracy", "1", "3", "h" });

            dT_03.Rows.Add(new Object[] { "3", "Ilość sesji", "3", "1", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Ilość wyznaczonych spraw", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Ilość spraw odrocznych z rozpraw (bez publikacji!!!)", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Wskaźnik odroczeń", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Załatwienia", "14", "1", "h" });

            dT_03.Rows.Add(new Object[] { "3", "Razem", "2", "2", "h" });

            dT_03.Rows.Add(new Object[] { "3", "Średnio miesięcznie załatwienia w efektywnym czasie pracy", "1", "3", "h" });


            dT_03.Rows.Add(new Object[] { "3", "Pozostałość na koniec okresu kontrolnego", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Wielkrotna", "1", "3", "h" });


            Session["header_03"] = dT_03;

            #endregion



            #region tabela  4 ()

            dT_04.Clear();
            //Alk	Op	Opm	Nw


            dT_04.Rows.Add(new Object[] { "1", "Alk", "1", "1", "h" });
            dT_04.Rows.Add(new Object[] { "1", "Op", "1", "1", "h" });
            dT_04.Rows.Add(new Object[] { "1", "Opm", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "Nw", "1", "1" });

            dT_04.Rows.Add(new Object[] { "2", "L.p.", "1", "2", "h" });
            dT_04.Rows.Add(new Object[] { "2", "Sędzia", "1", "2", "h" });
            dT_04.Rows.Add(new Object[] { "2", "Liczba czynnych spraw na ostatni dzień okresu sprawozdawczego", "4", "1" });

            dT_04.Rows.Add(new Object[] { "2", "Razem", "1", "2" });

            dT_04.Rows.Add(new Object[] { "3", "Postępowanie wykonawcze", "7", "1", "h" });

            Session["header_04"] = dT_04;

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
            dT_05.Rows.Add(new Object[] { "1", "Wp", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "W", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "Razem", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "K", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "Kop", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "Ko", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "Wp", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "W", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "Razem", "1", "1", "h" });


            dT_05.Rows.Add(new Object[] { "2", "L.p.", "1", "2", "h" });
            dT_05.Rows.Add(new Object[] { "2", "Imie i nazwisko sędziego", "1", "2", "h" });
            dT_05.Rows.Add(new Object[] { "2", "Efektywny okres oczekiwania", "1", "2", "h" });
            dT_05.Rows.Add(new Object[] { "2", "Ilość sesji ", "3", "1", "H" });
            dT_05.Rows.Add(new Object[] { "2", "Ilość wyznaczonych ", "3", "1", "H" });


            dT_05.Rows.Add(new Object[] { "2", "Ilość przewr ", "2", "1", "H" });
            dT_05.Rows.Add(new Object[] { "2", "Załatwienia ", "6", "1", "H" });
            dT_05.Rows.Add(new Object[] { "2", "Średnio miesię- cznie ", "1", "2", "H" });
            dT_05.Rows.Add(new Object[] { "2", "Średnio miesię- cznie K", "1", "2", "H" });
            dT_05.Rows.Add(new Object[] { "2", "Stan referatów ", "8", "1", "H" });


            Session["header_05"] = dT_05;

            //  makeHeader6(sn, dT_05);

            #endregion

        }
        


        protected void GridView3_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_03"];
                tabela.makeHeader(sn, dT, GridView3);
            }
        }



        protected void GridView5_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_04"];
                tabela.makeHeader(sn, dT, GridView4);
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
                    tabela2Label.Text = "Sprawozdanie z ruchu spraw w za miesiąc " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    Label17.Text = "Wydajność sędziów orzekających w Wydziale za miesiąc " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    //Label2.Text= "Ewidencja spraw odroczonych  za miesiąc " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    Label15.Text = "Postępowanie wykonawcze w miesiącu " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";


                }
                else
                {
                    tabela2Label.Text = "Sprawozdanie z ruchu spraw w za okres od " + Date1.Text + " do  " + Date2.Text;
                    Label17.Text = "Wydajność sędziów orzekających w Wydziale za okres od " + Date1.Text + " do  " + Date2.Text;
                    //    Label2.Text = "Ewidencja spraw odroczonych za okres od " + Date1.Text + " do  " + Date2.Text;
                    Label15.Text = "Postępowanie wykonawcze w okresie od " + Date1.Text + " do  " + Date2.Text;

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
            string path = Server.MapPath("Template") + "\\oglr.xlsx";
            FileInfo existingFile = new FileInfo(path);

            string download = Server.MapPath("Template") + @"\oglr";

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


                //   MyWorksheet2.Cells[1, 3].Value = "Ruch spraw w referatach sędziów za okres od " + Date1.Text + " do " + Date2.Text;
                rowik = 1;
                foreach (DataRow dR in table.Rows)
                {
                    MyWorksheet1.Cells[rowik + 6, 3].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                    MyWorksheet1.Cells[rowik + 6, 3].Value = dR[1].ToString().Trim() + " " + dR[2].ToString().Trim();

                    for (int i = 3; i < 26; i++)
                    {
                        MyWorksheet1.Cells[rowik + 6, i + 1].Style.ShrinkToFit = true;
                        MyWorksheet1.Cells[rowik + 6, i + 1].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                        try
                        {
                            MyWorksheet1.Cells[rowik + 6, i + 1].Value = double.Parse(dR[i].ToString().Trim());
                        }
                        catch (Exception)
                        {
                            MyWorksheet1.Cells[rowik + 6, i + 1].Value = dR[i].ToString().Trim();
                        }
                    }
                    rowik++;
                }

                // pod tabela z tebeli nr 2

                // obwodnia

                for (int row2 = rowik; row2 < rowik + 11; row2++)
                {
                    for (int i = 1; i < 25; i++)
                    {
                        MyWorksheet1.Cells[row2 + 6, i + 2].Style.ShrinkToFit = true;
                        MyWorksheet1.Cells[row2 + 6, i + 2].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                    }
                }
                //------------

                MyWorksheet1.Cells[rowik + 6, 3, rowik + 6, 4].Merge = true;
                MyWorksheet1.Cells[rowik + 6, 3].Value = "Zaległość z poprzedniego miesiąca";
                MyWorksheet1.Cells[rowik + 7, 3, rowik + 7, 4].Merge = true;
                MyWorksheet1.Cells[rowik + 7, 3].Value = "Wpływ";
                MyWorksheet1.Cells[rowik + 8, 3, rowik + 8, 4].Merge = true;
                MyWorksheet1.Cells[rowik + 8, 3].Value = "Załatwienia";
                MyWorksheet1.Cells[rowik + 9, 3, rowik + 9, 4].Merge = true;
                MyWorksheet1.Cells[rowik + 9, 3].Value = "Pozostało na następny miesiąc";
                MyWorksheet1.Cells[rowik + 10, 3, rowik + 10, 4].Merge = true;
                MyWorksheet1.Cells[rowik + 10, 3].Value = "odroczono";
                MyWorksheet1.Cells[rowik + 11, 3, rowik + 16, 3].Merge = true;
                MyWorksheet1.Cells[rowik + 11, 3].Value = " Zaległość";
                MyWorksheet1.Cells[rowik + 11, 4].Value = " 3-6 miesięcy";
               //  MyWorksheet1.Cells[rowik + 14, 4, rowik + 14, 4].Merge = true;
                MyWorksheet1.Cells[rowik + 12, 4].Value = " 6-12 miesięcy";

                 //MyWorksheet1.Cells[rowik + 15, 4, rowik + 15, 5].Merge = true;
                MyWorksheet1.Cells[rowik + 13, 4].Value = " 12-24 miesięcy (do 2 lat)";

                MyWorksheet1.Cells[rowik + 14, 4].Value = " 24-35 miesięcy (do 2-3 lat)";
                //MyWorksheet1.Cells[rowik + 16, 4, rowik + 16, 5].Merge = true;
                MyWorksheet1.Cells[rowik + 15, 4].Value = " 36-60 miesięcy (3-5 lat)";

               // MyWorksheet1.Cells[rowik + 17, 4, rowik + 17, 5].Merge = true;
                MyWorksheet1.Cells[rowik + 16, 4].Value = " Powyżej 60 miesięcy (powyżej 5 lat)";
                DataTable tabelka001 = (DataTable)Session["tabelka001"];

                
                int ilWierszy = tabelka001.Rows.Count;
                int j = 0;
                foreach (DataRow dR in tabelka001.Rows)
                {
                    if (j < ilWierszy - 4)
                    {
                        for (int i = 2; i < 24; i++)
                        {
                            try
                            {
                                MyWorksheet1.Cells[rowik + 6, i + 3].Value = double.Parse(dR[i - 1].ToString().Trim());
                            }
                            catch
                            {
                                MyWorksheet1.Cells[rowik + 6, i + 3].Value = dR[i - 1].ToString().Trim();
                            }
                            MyWorksheet1.Cells[rowik + 6, i + 3].Style.ShrinkToFit = true;
                            MyWorksheet1.Cells[rowik + 6, i + 3].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                        }
                        rowik++;
                        j++;
                        if (j>10)
                        {
                            break;
                        }
                    }
                }



                // trzecia 


                ExcelWorksheet MyWorksheet2 = MyExcel.Workbook.Worksheets[2];

                DataTable table2 = (DataTable)Session["tabela3"];
                
                MyWorksheet2 = tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[2], table2, 31, 2, 7,false , false, false, false, false);
                
                // czwarta 

                DataView view4 = (DataView)tabela_4.Select(DataSourceSelectArguments.Empty);
                DataTable table4 = view4.ToTable();
            

                MyWorksheet2 = tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[3], table4, 6,0, 7, false, false, false, false, false);
             
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
                       cm.log.Error(tenPlik + " " + ex.Message );

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


        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_02"];
               tabela.makeHeader(sn, dT, GridView1);
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


        protected void makeSumRow(DataTable table, GridViewRowEventArgs e)
        {

            object sumObject;
            int ilKolumn = e.Row.Cells.Count;
            e.Row.Cells[1].Text = "Ogółem";
            for (int i = 1; i < e.Row.Cells.Count; i++)
            {
                try
                {
                    sumObject = table.Compute("Sum(" + "d_" + (i - 1).ToString("D2") + ")", "");
                    e.Row.Cells[i].Text = sumObject.ToString();
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
                makeSumRow(table, e);
            }
        }


        protected void GridView5_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = ((DataView)tabela_4.Select(DataSourceSelectArguments.Empty)).ToTable();
                makeSumRow(table, e);
            }
        }

        GridViewRow wierszTabeli1(int idWiersza, string idtabeli, string tekst)
        {
            // nowy wiersz tabelka001
            DataTable tabelka01 = (DataTable)Session["tabelka001"];
            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
            NewTotalRow.Cells.Add(tabela.cela(tekst, 1, 3, "borderTopLeft "));

            for (int i = 1; i < 23; i++)
            {
                try
                {
                    NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza + 1).ToString().Trim() + "!2!" + i.ToString().Trim() + "!3')\">" + tabelka01.Rows[idWiersza][i].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
                }
                catch (Exception ex)
                {
                    cm.log.Error(tenPlik + " " + ex.Message);
                }
            }
            return NewTotalRow;
        }

      
        GridViewRow wierszTabeli2(int idWiersza, string idtabeli, string tekst)
        {
            // nowy wiersz

            DataTable tabelka01 = (DataTable)Session["tabelka001"];
            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
            NewTotalRow.Cells.Add(tabela.cela("Zaległość", 7, 1, "borderTopLeft "));
            NewTotalRow.Cells.Add(tabela.cela(tekst, 1, 2, "borderTopLeft  "));
            for (int i = 1; i < 23; i++)
            {
                try
                {
                    string txt = tabelka01.Rows[idWiersza - 1][i].ToString().Trim();
                    NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza + 1).ToString().Trim() + "!2!" + i.ToString().Trim() + "!3')\">" + tabelka01.Rows[idWiersza][i].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
                }
                catch (Exception ex)
                {
                    cm.log.Error(tenPlik + " " + ex.Message);
                }
                
            }

            return NewTotalRow;


        }
        GridViewRow wierszTabeli3(int idWiersza, string idtabeli, string tekst)
        {
            // nowy wiersz

            DataTable tabelka01 = (DataTable)Session["tabelka001"];
            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
            NewTotalRow.Cells.Add(tabela.cela(tekst, 1, 2, "borderTopLeft  "));

            for (int i = 1; i < 23; i++)
            {
                NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza+1).ToString().Trim() + "!2!" + i.ToString().Trim() + "!3')\">" + tabelka01.Rows[idWiersza][i].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            }
            return NewTotalRow;
        }


        public void AddNewRow(object sender, GridViewRowEventArgs e)
        {
            GridView GridView1 = (GridView)sender;
            string idtabeli = "2";
           
            // nowy wiersz
            int idWiersza = 0;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli1(idWiersza, idtabeli, "Zaległość z poprzedniego miesiąca"));

            idWiersza = 1;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli1(idWiersza, idtabeli, "wpływ"));

            // nowy wiersz
            idWiersza = 2;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli1(idWiersza, idtabeli, "załatwienia"));

            // nowy wiersz
            idWiersza = 3;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli1(idWiersza, idtabeli, "pozostałość na następny miesiąc"));

            // nowy wiersz
            idWiersza = 4;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli1(idWiersza, idtabeli, "odroczono"));

            // nowy wiersz
            idWiersza = 5;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli2(idWiersza, idtabeli, "3-6 miesiący "));
            // nowy wiersz
            idWiersza = 6;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli3(idWiersza, idtabeli, "6-12 miesięcy "));

            // nowy wiersz
            idWiersza = 7;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli3(idWiersza, idtabeli, "12-24 miesięcy (do 2 lat) "));
            idWiersza = 8;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli3(idWiersza, idtabeli, "24-36 miesięcy (2-3 lat) "));
            idWiersza = 9;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli3(idWiersza, idtabeli, "36-60 miesięcy (3-5 lat) "));
            idWiersza = 10;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli3(idWiersza, idtabeli, "Powyżej 60 miesięcy (powyżej 5 lat) "));
        }
    }
}