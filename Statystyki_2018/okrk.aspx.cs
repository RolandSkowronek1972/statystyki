using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using OfficeOpenXml;


namespace stat2018
{
   
    public partial class okrk : System.Web.UI.Page
    {

        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tabela = new tabele();
        public dataReaders dr = new dataReaders();

        int storid = 0;
        int rowIndex = 1;

        public static string tenPlik = "okrk.aspx";

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
            string yyx = (string)Session["id_dzialu"];
            string txt = string.Empty; //
            cl.deleteRowTable();

            txt = txt + cl.clear_maim_db();
            try
            {

                DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), (string)Session["id_dzialu"], 2, 20, 20, tenPlik);
                Session["tabelka001"] = tabelka01;
                //row 1

                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 1, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text));
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 3, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text));
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 4, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text));

                cl.uzupelnij_statusy();
            }
            catch (Exception ex)
            {
                txt = txt + ex.Message + Environment.NewLine;
            }
            try
            {
                cm.log.Info(tenPlik + ": wczytywanie danych do tabeli 5");
             DataTable   tabelkaGW5 = dr.generuj_dane_do_tabeli_sedziowskiej_2018(int.Parse((string)Session["id_dzialu"]), 5, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text),10, tenPlik);
                Session["tabelkaGW005"] = tabelkaGW5;
                GridView5.DataSource = null;
                GridView5.DataSourceID = null;
                GridView5.DataSource = tabelkaGW5;
                GridView5.DataBind();

            }
            catch (Exception ex)
            {

                cm.log.Error(tenPlik + " : " + ex.Message);

            }

            // dopasowanie opisów
            makeLabels();

            GridView1.DataBind();
            GridView3.DataBind();
            GridView4.DataBind();


            txt = txt + "GridView1 liczba wierszy: " + GridView1.Rows.Count.ToString() + Environment.NewLine;

            try
            {
                Label11.Visible = cl.debug(int.Parse(yyx));
                infoLabel2.Visible = cl.debug(int.Parse(yyx));
                infoLabel3.Visible = cl.debug(int.Parse(yyx));

                infoLabel5.Visible = cl.debug(int.Parse(yyx));

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

            dT_01.Rows.Add(new Object[] { "1", "rozprzwy", "1", "1", "h", "60" });//
            dT_01.Rows.Add(new Object[] { "1", "posiedzenia", "1", "1", "h", "60" });//
            dT_01.Rows.Add(new Object[] { "1", "rozprzwy", "1", "1", "h", "60" });//
            dT_01.Rows.Add(new Object[] { "1", "posiedzenia", "1", "1", "h", "60" });//


            dT_01.Rows.Add(new Object[] { "2", "Urlopy", "1", "2", "h" });//
            dT_01.Rows.Add(new Object[] { "2", "Zwolnienia", "1", "2", "h" });//
            dT_01.Rows.Add(new Object[] { "2", "Razem", "1", "2", "h", "120" });//;
            dT_01.Rows.Add(new Object[] { "2", "w terminie ustawowym", "1", "2", "h", "120" });//
            dT_01.Rows.Add(new Object[] { "2", "po upływie teminu ustawowego", "1", "2", "h", "120" });//
            dT_01.Rows.Add(new Object[] { "2", "w tym nieuspra- <br/>wiedliwione", "1", "2", "h", "120" });//
            dT_01.Rows.Add(new Object[] { "2", "K", "2", "1", "h", "120" });//;
            dT_01.Rows.Add(new Object[] { "2", "Ko", "1", "2", "h", "120" });//;

            dT_01.Rows.Add(new Object[] { "2", "Kp", "1", "2", "h", "120" });//;
            dT_01.Rows.Add(new Object[] { "2", "Kop", "1", "2", "h", "120" });//;
            dT_01.Rows.Add(new Object[] { "2", "W", "2", "1", "h", "120" });//;
            dT_01.Rows.Add(new Object[] { "2", "Razem sprawy K+W", "1", "2", "h", "120" });//;
            dT_01.Rows.Add(new Object[] { "2", "Razem", "1", "2", "h", "120" });//;


            dT_01.Rows.Add(new Object[] { "3", "L.p.", "1", "3", "h", "10" });
            dT_01.Rows.Add(new Object[] { "3", "Funkcja.", "1", "3", "h", "10" });
            dT_01.Rows.Add(new Object[] { "3", "Nazwisko i imię Sędziego", "1", "3", "h", "130" });//
            dT_01.Rows.Add(new Object[] { "3", "Liczba sesji", "1", "3", "h", "60" });
            dT_01.Rows.Add(new Object[] { "3", "Etat", "1", "3", "h", "60" });
            dT_01.Rows.Add(new Object[] { "3", "Nieobecności", "2", "1", "h", "45" });
            dT_01.Rows.Add(new Object[] { "3", "Terminowość sporządzania uzasadnień", "4", "1", "h" });
            dT_01.Rows.Add(new Object[] { "3", "Uzasadnienia wygłoszone", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "ZAŁATWIENIA", "9", "1", "h", "45" });
            dT_01.Rows.Add(new Object[] { "3", "UWAGI", "1", "3", "h", "45" });
            




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


            dT_03.Rows.Add(new Object[] { "1", "Rozprawy", "1", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "Posiedzeni", "1", "1", "h" });


            dT_03.Rows.Add(new Object[] { "1", "Rozprawy", "1", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "Posiedzeni", "1", "1", "h" });




            dT_03.Rows.Add(new Object[] { "2", "K", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Ko", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Kp", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Kop", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "W", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Razem sprawy K+W", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Razem", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "K", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Ko", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Kp", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Kop", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "W", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Razem sprawy K+W", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Razem", "1", "2", "h" });


            dT_03.Rows.Add(new Object[] { "3", "L.p.", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Stanowisko.", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Nazwisko i imię", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Wyznaczenia", "9", "1", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Stan referatów ( pozostałość na sędziego)", "7", "1", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Średni miesieczny wpływ ( w faktycznym czasie pracy)", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Uwagi", "1", "3", "h" });


            Session["header_03"] = dT_03;

            #endregion



            #region tabela  4 ()

            dT_04.Clear();
            //Alk	Op	Opm	Nw

            
            dT_04.Rows.Add(new Object[] { "1", "poprzednich okresów", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "bieżącego m-ca", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "Liczba", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "%", "1", "1" });

            dT_04.Rows.Add(new Object[] { "2", "z", "1", "1", "h" });
            dT_04.Rows.Add(new Object[] { "2", "z", "1", "1", "h" });


            dT_04.Rows.Add(new Object[] { "2", "Wyrok", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "Wyrok zaoczny", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "Postanowienie", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "zaw.", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "Inne", "1", "2" });


           // dT_04.Rows.Add(new Object[] { "2", "Razem", "1", "2" });

            dT_04.Rows.Add(new Object[] { "3", "Wyznaczonych", "1", "3", "h" });
            dT_04.Rows.Add(new Object[] { "3", "Załatwionych", "2", "1", "h" });
            dT_04.Rows.Add(new Object[] { "3", "Odroczonych (liczba % w stosunku do wyznaczon.)", "2", "2", "h" });

            dT_04.Rows.Add(new Object[] { "3", "Inne", "5", "1", "h" });
            

            dT_04.Rows.Add(new Object[] { "4", "L.p.", "1", "4", "h" });
            dT_04.Rows.Add(new Object[] { "4", "Sędzia", "1", "4", "h" });
            dT_04.Rows.Add(new Object[] { "4", "Ilość spraw", "10", "1", "h" });
            Session["header_04"] = dT_04;

            #endregion

            #region tabela  5 ()

            dT_05.Clear();

            dT_05.Rows.Add(new Object[] { "1", "Dyzur areszt.", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "Urlop", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "L4 (opieka nad dzieckiem)", "1", "1", "h" });


            dT_05.Rows.Add(new Object[] { "2", "L.p.", "1", "2", "h" });
            dT_05.Rows.Add(new Object[] { "2", "Imie i nazwisko sędziego", "1", "2", "h" });
            dT_05.Rows.Add(new Object[] { "2", "Ilosc wokand wynikających z zakresu czynności", "1", "2", "h" });
            dT_05.Rows.Add(new Object[] { "2", "Ilość wokand ", "1", "2", "H" });
            dT_05.Rows.Add(new Object[] { "2", "czas sesyjny Spraw merytorycznych", "1", "2", "H" });


            dT_05.Rows.Add(new Object[] { "2", "Przzyczyna nie wyznaczania wokand (w dniach)", "3", "1", "H" });


            Session["header_05"] = dT_05;


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
                    tabela1Label.Text = "Sprawozdanie z ruchu spraw w za miesiąc " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    tabela3Label.Text = "Wydajność sędziów orzekających w Wydziale za miesiąc " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    //Label2.Text= "Ewidencja spraw odroczonych  za miesiąc " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    Tabela4label.Text = "Postępowanie wykonawcze w miesiącu " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";


                }
                else
                {
                    tabela1Label.Text = "Sprawozdanie z ruchu spraw w za okres od " + Date1.Text + " do  " + Date2.Text;
                    tabela3Label.Text = "Wydajność sędziów orzekających w Wydziale za okres od" + Date1.Text + " do  " + Date2.Text;
                    //    Label2.Text = "Ewidencja spraw odroczonych za okres od " + Date1.Text + " do  " + Date2.Text;
                    Tabela4label.Text = "Postępowanie wykonawcze w okresie od " + Date1.Text + " do  " + Date2.Text;

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
            string path = Server.MapPath("Template") + "\\okrk.xlsx";
            FileInfo existingFile = new FileInfo(path);

            string download = Server.MapPath("Template") + @"\okrk";

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
                 MyWorksheet1 = tabela . tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], table, 19,  0,  9,true,false,true,true,true);

                rowik = table.Rows.Count + 3;
                //------------
                MyWorksheet1.Cells[rowik + 6, 1, rowik + 17, 3].Merge = true;
                MyWorksheet1.Cells[rowik + 6, 1].Value = "RAZEM";
                MyWorksheet1.Cells[rowik + 6,1].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
            
            MyWorksheet1.Cells[rowik + 6, 4, rowik + 6, 14].Merge = true;
                MyWorksheet1.Cells[rowik + 6, 4].Value = "Zaległość z poprzedniego miesiąca";
                MyWorksheet1.Cells[rowik + 6, 4].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                MyWorksheet1.Cells[rowik + 7, 4, rowik + 7, 14].Merge = true;
                    MyWorksheet1.Cells[rowik + 7, 4].Value = "Wpływ";
                MyWorksheet1.Cells[rowik + 7, 4].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                MyWorksheet1.Cells[rowik + 8, 4, rowik + 8, 14].Merge = true;
                    MyWorksheet1.Cells[rowik + 8, 4].Value = "Załatwienia";
                MyWorksheet1.Cells[rowik + 8, 4].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                MyWorksheet1.Cells[rowik + 9, 4, rowik + 9, 14].Merge = true;
                    MyWorksheet1.Cells[rowik + 9, 4].Value = "Pozostało na następny miesiąc";
                MyWorksheet1.Cells[rowik + 9, 4].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                MyWorksheet1.Cells[rowik + 10, 4, rowik + 10, 14].Merge = true;
                    MyWorksheet1.Cells[rowik + 10, 4].Value = "powyżej 3 - 6 miesięcy";
                MyWorksheet1.Cells[rowik + 10, 4].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                MyWorksheet1.Cells[rowik + 11, 4, rowik + 11, 14].Merge = true;

                    MyWorksheet1.Cells[rowik + 11, 4].Value = " powyżej 6 - 12 miesięcy";
                MyWorksheet1.Cells[rowik + 11, 4].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                MyWorksheet1.Cells[rowik + 12, 4, rowik + 12, 14].Merge = true;
                MyWorksheet1.Cells[rowik + 12, 4].Value = " ponad 12 miesięcy";
                MyWorksheet1.Cells[rowik + 12, 4].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                MyWorksheet1.Cells[rowik + 13, 4, rowik + 17, 6].Merge = true;
                MyWorksheet1.Cells[rowik + 13, 4].Value = " w tym";
                MyWorksheet1.Cells[rowik + 13, 7, rowik + 13, 14].Merge = true;
                MyWorksheet1.Cells[rowik + 13, 7].Value = "powyżej 12 miesiecy  - 2 lat";
                MyWorksheet1.Cells[rowik + 13, 4].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                MyWorksheet1.Cells[rowik + 13, 7].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                MyWorksheet1.Cells[rowik + 14, 7, rowik + 14, 14].Merge = true;
                MyWorksheet1.Cells[rowik + 14, 7].Value = "powyżej 2 lat - do 3 lat";
                MyWorksheet1.Cells[rowik + 14, 7].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                MyWorksheet1.Cells[rowik + 15, 7, rowik + 15, 14].Merge = true;
                MyWorksheet1.Cells[rowik + 15, 7].Value = "powyżej 3 lat - do 5 lat";
                MyWorksheet1.Cells[rowik + 15, 7].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                MyWorksheet1.Cells[rowik + 16, 7, rowik + 16, 14].Merge = true;
                MyWorksheet1.Cells[rowik + 16, 7].Value = "powyżej 5 lat - do 8 lat";
                MyWorksheet1.Cells[rowik + 16, 7].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);


                MyWorksheet1.Cells[rowik + 17, 7, rowik + 17, 14].Merge = true;
                MyWorksheet1.Cells[rowik + 17, 7].Value = "ponad 8 lat";
                MyWorksheet1.Cells[rowik + 17, 7].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                DataTable tabelka001 = (DataTable)Session["tabelka001"];


                    int ilWierszy = tabelka001.Rows.Count;
                    int j = 0;
                    foreach (DataRow dR in tabelka001.Rows)
                    {
                        if (j < ilWierszy - 4)
                        {
                        MyWorksheet1.Cells[rowik + 6, 15, rowik + 6, 16].Merge = true;

                        try
                        {
                            MyWorksheet1.Cells[rowik + 6,  15].Value = double.Parse(dR[1].ToString().Trim());
                        }
                        catch
                        {
                            MyWorksheet1.Cells[rowik + 6, 15].Value = dR[1].ToString().Trim();
                        }
                        MyWorksheet1.Cells[rowik + 6,  15].Style.ShrinkToFit = true;
                        MyWorksheet1.Cells[rowik + 6,  15].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);


                        for (int i = 2; i < 5; i++)
                            {
                                try
                                {
                                    MyWorksheet1.Cells[rowik + 6, i + 15].Value = double.Parse(dR[i ].ToString().Trim());
                                }
                                catch
                                {
                                    MyWorksheet1.Cells[rowik + 6, i + 15].Value = dR[i ].ToString().Trim();
                                }
                                MyWorksheet1.Cells[rowik + 6, i + 15].Style.ShrinkToFit = true;
                                MyWorksheet1.Cells[rowik + 6, i + 15].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                            }
                        // kolejna podwojna
                        MyWorksheet1.Cells[rowik + 6, 20, rowik + 6, 21].Merge = true;

                        try
                        {
                            MyWorksheet1.Cells[rowik + 6, 20].Value = double.Parse(dR[5].ToString().Trim());
                        }
                        catch
                        {
                            MyWorksheet1.Cells[rowik + 6, 20].Value = dR[5].ToString().Trim();
                        }
                        MyWorksheet1.Cells[rowik + 6, 20].Style.ShrinkToFit = true;
                        MyWorksheet1.Cells[rowik + 6, 20].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                        // pojedyncze
                        for (int i = 6; i < 8; i++)
                        {
                            try
                            {
                                MyWorksheet1.Cells[rowik + 6, i + 16].Value = double.Parse(dR[i].ToString().Trim());
                            }
                            catch
                            {
                                MyWorksheet1.Cells[rowik + 6, i + 16].Value = dR[i].ToString().Trim();
                            }
                            MyWorksheet1.Cells[rowik + 6, i + 16].Style.ShrinkToFit = true;
                            MyWorksheet1.Cells[rowik + 6, i + 16].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                        }



                        rowik++;
                            j++;
                        if (j>11)
                        {
                            break;
                        }
                    }
                    }


        
                // trzecia 


                ExcelWorksheet MyWorksheet2 = MyExcel.Workbook.Worksheets[2];

                DataView view2 = (DataView)tabela_3.Select(DataSourceSelectArguments.Empty);

                DataTable table2 = view2.ToTable();

                MyWorksheet2 = tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[2], table2, 17, 0, 9, true,false,true,true,true);


             
                // czwarta 

                DataView view4 = (DataView)tabela_4.Select(DataSourceSelectArguments.Empty);
                DataTable table4 = view4.ToTable();
                table4.Columns.Remove("ident");
                table4.Columns.Remove("id_sedziego");
                table4.Columns.Remove("stanowisko");
                table4.Columns.Remove("funkcja");

                MyWorksheet2 = tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[3], table4, 12, 1, 5, false);
                // piąta 

                
                DataTable table5 =(DataTable)Session["tabelkaGW005"];
                
                
                MyWorksheet2 = tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[4], table5, 7, 0, 4, true,false,false,false,false);


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
                DataTable dT = (DataTable)Session["header_01"];
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

        GridViewRow wierszTabeli(int idWiersza, string idtabeli, string tekst)
        {
            // nowy wiersz

            DataTable tabelka01 = (DataTable)Session["tabelka001"];
            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
            NewTotalRow.Cells.Add(tabela.cela("Razem", 12, 3, "borderTopLeft "));
            NewTotalRow.Cells.Add(tabela.cela(tekst, 1, 9, "borderTopLeft  "));
            //podwojna komorka pod K
            NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza).ToString().Trim() + "!" + idtabeli.ToString() + "!1!3')\">" + tabelka01.Rows[idWiersza-1][1].ToString().Trim() + "</a>", 1, 2, "borderTopLeft")); //trzy pojedyncze
            //trzy pojedyncze
            for (int i = 2; i < 5; i++)
            {
                NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza).ToString().Trim() + "!" + idtabeli.ToString() + "!" + i.ToString().Trim() + "!3')\">" + tabelka01.Rows[idWiersza-1][i].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            }
            //podwojna komorka pod w
            NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza).ToString().Trim() + "!" + idtabeli.ToString() + "!6!3')\">" + tabelka01.Rows[idWiersza-1][6].ToString().Trim() + "</a>", 1, 2, "borderTopLeft")); //trzy pojedyncze
            //trzy pojedyncze
            for (int i = 6; i < 9; i++)
            {
                NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza).ToString().Trim() + "!" + idtabeli.ToString() + "!" + i.ToString().Trim() + "!3')\">" + tabelka01.Rows[idWiersza-1][i].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            }


            return NewTotalRow;


        }


        GridViewRow wierszTabeli1(int idWiersza, string idtabeli, string tekst)
        {

            DataTable tabelka01 = (DataTable)Session["tabelka001"];
            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
            // nowy wiersz
            NewTotalRow.Cells.Add(tabela.cela(tekst, 1, 9, "borderTopLeft  "));
            //podwojna komorka pod K
            NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza).ToString().Trim() + "!" + idtabeli.ToString() + "!1!3')\">" + tabelka01.Rows[idWiersza][1].ToString().Trim() + "</a>", 1, 2, "borderTopLeft")); //trzy pojedyncze
            //trzy pojedyncze
            for (int i = 2; i < 5; i++)
            {
                NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza).ToString().Trim() + "!" + idtabeli.ToString() + "!" + i.ToString().Trim() + "!3')\">" + tabelka01.Rows[idWiersza-1][i].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            }
            //podwojna komorka pod w
            NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza).ToString().Trim() + "!" + idtabeli.ToString() + "!5!3')\">" + tabelka01.Rows[idWiersza][5].ToString().Trim() + "</a>", 1, 2, "borderTopLeft")); //trzy pojedyncze
            //trzy pojedyncze
            for (int i = 6; i < 9; i++)
            {
                NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza).ToString().Trim() + "!" + idtabeli.ToString() + "!" + i.ToString().Trim() + "!3')\">" + tabelka01.Rows[idWiersza-1][i].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            }


            return NewTotalRow;
            
        }

      
        GridViewRow wierszTabeli2(int idWiersza, string idtabeli, string tekst)
        {
            // nowy wiersz

            DataTable tabelka01 = (DataTable)Session["tabelka001"];
            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
            NewTotalRow.Cells.Add(tabela.cela("w tym", 5, 2, "borderTopLeft "));
            NewTotalRow.Cells.Add(tabela.cela(tekst, 1, 7, "borderTopLeft  "));
            //podwojna komorka pod K
            NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza).ToString().Trim() + "!" + idtabeli.ToString() + "!1!3')\">" + tabelka01.Rows[idWiersza][1].ToString().Trim() + "</a>", 1, 2, "borderTopLeft")); //trzy pojedyncze
            //trzy pojedyncze
            for (int i = 2; i < 5; i++)
            {
                NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza).ToString().Trim() + "!" + idtabeli.ToString() + "!" + i.ToString().Trim() + "!3')\">" + tabelka01.Rows[idWiersza - 1][i].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            }
            //podwojna komorka pod w
            NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza).ToString().Trim() + "!" + idtabeli.ToString() + "!5!3')\">" + tabelka01.Rows[idWiersza][5].ToString().Trim() + "</a>", 1, 2, "borderTopLeft")); //trzy pojedyncze
            //trzy pojedyncze
            for (int i = 6; i < 9; i++)
            {
                NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza).ToString().Trim() + "!" + idtabeli.ToString() + "!" + i.ToString().Trim() + "!3')\">" + tabelka01.Rows[idWiersza - 1][i].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            }

            return NewTotalRow;


        }
        GridViewRow wierszTabeli3(int idWiersza, string idtabeli, string tekst)
        {
            // nowy wiersz

            DataTable tabelka01 = (DataTable)Session["tabelka001"];
            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
            NewTotalRow.Cells.Add(tabela.cela(tekst, 1, 7, "borderTopLeft  "));
            NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza).ToString().Trim() + "!" + idtabeli.ToString() + "!1!3')\">" + tabelka01.Rows[idWiersza][1].ToString().Trim() + "</a>", 1, 2, "borderTopLeft")); //trzy pojedyncze
            //trzy pojedyncze
            for (int i = 2; i < 5; i++)
            {
                NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza).ToString().Trim() + "!" + idtabeli.ToString() + "!" + i.ToString().Trim() + "!3')\">" + tabelka01.Rows[idWiersza - 1][i].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            }
            //podwojna komorka pod w
            NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza).ToString().Trim() + "!" + idtabeli.ToString() + "!5!3')\">" + tabelka01.Rows[idWiersza][5].ToString().Trim() + "</a>", 1, 2, "borderTopLeft")); //trzy pojedyncze
            //trzy pojedyncze
            for (int i = 6; i < 9; i++)
            {
                NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza).ToString().Trim() + "!" + idtabeli.ToString() + "!" + i.ToString().Trim() + "!3')\">" + tabelka01.Rows[idWiersza - 1][i].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            }
            return NewTotalRow;
        }


        public void AddNewRow(object sender, GridViewRowEventArgs e)
        {
            GridView GridView1 = (GridView)sender;
            string idtabeli = "2";
            DataTable tabelka01 = (DataTable)Session["tabelka001"];

            // nowy wiersz
            int idWiersza = 1;
            
             GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli(idWiersza, idtabeli, "Zaległość z poprzedniego miesiąca"));

            idWiersza = 2;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli1(idWiersza, idtabeli, "wpływ"));

            // nowy wiersz
            idWiersza = 3;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli1(idWiersza, idtabeli, "załatwienia"));

            // nowy wiersz
            idWiersza = 4;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli1(idWiersza, idtabeli, "pozostałość na następny miesiąc"));

            // nowy wiersz
            idWiersza = 5;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli1(idWiersza, idtabeli, "powyżej 3-6 m-cy"));

            // nowy wiersz
            idWiersza = 6;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli1(idWiersza, idtabeli, "powyżej 6-12 m-cy"));
            // nowy wiersz
            idWiersza = 7;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli1(idWiersza, idtabeli, "ponad 12 miesięcy "));

            // nowy wiersz
            idWiersza = 8;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli2(idWiersza, idtabeli, "powyżej 12 miesięcy - do 2 lat"));

            // nowy wiersz
            idWiersza = 9;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli3(idWiersza, idtabeli, "powyżej 2 lat - do 3 lat"));
            idWiersza = 10;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli3(idWiersza, idtabeli, "powyżej 3 lat - do 5 lat"));
            idWiersza = 11;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli3(idWiersza, idtabeli, "powyżej 5 lat - do 8 lat"));
            idWiersza = 12;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli3(idWiersza, idtabeli, "powyżej 8 lat"));
        }

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void NaglowekTabeli5(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_05"];
                tabela.makeHeader(sn, dT, GridView5);
            }

        }

        protected void stopkaTabeli5(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = ((DataView)Tabela_5.Select(DataSourceSelectArguments.Empty)).ToTable();
                makeSumRow(table, e);
            }

        }
    }
}