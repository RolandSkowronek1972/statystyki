using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using OfficeOpenXml;

namespace stat2018
{
    public partial class oglc : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();
        const string tenPlik = "oglc.aspx";

        int storid = 0;
        int rowIndex = 1;



        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string idWydzial = Request.QueryString["w"];
                if (idWydzial != null)
                {
                    Session["id_dzialu"] = idWydzial;
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

                Session["data_1"] = Date1.Text.Trim();
                Session["data_2"] = Date2.Text.Trim();
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
                cm.log.Error(tenPlik + " Próba dostępu bez uprawnień - przekierowanie do strony logowania");
                 Server.Transfer("default.aspx");
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
            try
            {
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

                DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), (string)Session["id_dzialu"], 2, 20, 20, tenPlik);
                Session["tabelka001"] = tabelka01;
                //row 1
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 1");

                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 1, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text));
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 3");

                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 3, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text));
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 4");

                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 4, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text));
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 4");


                GridView1.DataBind();
                GridView3.DataBind();
                GridView4.DataBind();
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }

            // dopasowanie opisów
            makeLabels();



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

            dT_02.Rows.Add(new Object[] { "2", "C", "2", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "2", "Ns", "2", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "2", "Nc", "2", "1", "h", "120" });//
            dT_02.Rows.Add(new Object[] { "2", "Co", "2", "1", "h", "120" });//
            dT_02.Rows.Add(new Object[] { "2", "Cps", "2", "1", "h", "120" });//
            dT_02.Rows.Add(new Object[] { "2", "Cgg", "2", "1", "h", "120" });//
            dT_02.Rows.Add(new Object[] { "2", "N", "2", "1", "h", "120" });//;
            dT_02.Rows.Add(new Object[] { "2", "Razem", "2", "1", "h", "120" });//;


            dT_02.Rows.Add(new Object[] { "3", "L.p.", "1", "3", "h", "10" });//
            dT_02.Rows.Add(new Object[] { "3", "Nazwisko i imię Sędziego", "1", "3", "h", "130" });//
            dT_02.Rows.Add(new Object[] { "3", "Ilość rozpraw", "1", "3", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "3", "ZAŁATWIENIA Sprawy rodzinne i nieletnich", "16", "1", "h", "45" });//


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


            dT_03.Rows.Add(new Object[] { "2", "c", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Ns", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Nc", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Co", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Cps", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Cgg", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "N", "2", "1", "h" });


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

            dT_04.Rows.Add(new Object[] { "1", "L.p.", "1", "1", "h" });
            dT_04.Rows.Add(new Object[] { "1", "Imię i nazwisko referendarza", "1", "1", "h" });
            dT_04.Rows.Add(new Object[] { "1", "Przydział orzeczniczy", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "Liczba odbytych sesji", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "Liczba odbytych posiedzeń", "1", "1", "h" });
            dT_04.Rows.Add(new Object[] { "1", "Razem", "1", "1" });
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
             cl.makeHeader(sn, dT, GridView3);
            }
        }

        protected void GridView5_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_04"];
                cl.makeHeader(sn, dT, GridView4);
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
                    Label15.Text = "Referendarze - sesje w miesiącu " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";


                }
                else
                {
                    tabela2Label.Text = "Sprawozdanie z ruchu spraw w za okres od " + Date1.Text + " do  " + Date2.Text;
                    Label17.Text = "Wydajność sędziów orzekających w Wydziale za okres od" + Date1.Text + " do  " + Date2.Text;
                    //    Label2.Text = "Ewidencja spraw odroczonych za okres od " + Date1.Text + " do  " + Date2.Text;
                    Label15.Text = "Referendarze - sesje w okresie od " + Date1.Text + " do  " + Date2.Text;

                }
            }
            catch
            {  }

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            przemiel();
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "print2", "JavaScript: window.print();", true);
            // ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "print", "window.open('raport_01_print.aspx', '')", true);
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string path = Server.MapPath("Template") + "\\oglc.xlsx";
            FileInfo existingFile = new FileInfo(path);

            string download = Server.MapPath("Template") + @"\oglc";

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

                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], table, 19, 3, 8, false);

                //   MyWorksheet2.Cells[1, 3].Value = "Ruch spraw w referatach sędziów za okres od " + Date1.Text + " do " + Date2.Text;
                rowik = table.Rows.Count+1 ;
               
                // pod tabela z tebeli nr 2

                // obwodnia
              
                for (int row2 = rowik; row2 < rowik + 11; row2++)
                {
                    for (int i = 1; i < 21; i++)
                    {
                        MyWorksheet1.Cells[row2 + 7, i ].Style.ShrinkToFit = true;
                        MyWorksheet1.Cells[row2 + 7, i ].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                    }

                }
                //------------

                MyWorksheet1.Cells[rowik + 7, 3, rowik + 7, 4].Merge = true;
                MyWorksheet1.Cells[rowik + 7, 3].Value = "Zaległość z poprzedniego miesiąca";
                MyWorksheet1.Cells[rowik + 8, 3, rowik + 8, 4].Merge = true;
                MyWorksheet1.Cells[rowik + 8, 3].Value = "Wpływ";
                MyWorksheet1.Cells[rowik + 9, 3, rowik + 9, 4].Merge = true;
                MyWorksheet1.Cells[rowik + 9, 3].Value = "Wpływ";
                MyWorksheet1.Cells[rowik + 10, 3, rowik + 10, 4].Merge = true;
                MyWorksheet1.Cells[rowik + 10, 3].Value = "Załatwienia";
                MyWorksheet1.Cells[rowik + 11, 3, rowik + 11, 4].Merge = true;
                MyWorksheet1.Cells[rowik + 11, 3].Value = " Pozostało na następny miesiąc";
                MyWorksheet1.Cells[rowik + 12, 3, rowik + 17, 3].Merge = true;
                MyWorksheet1.Cells[rowik + 12, 3].Value = " Zaległość";
                MyWorksheet1.Cells[rowik + 12, 4, rowik + 12, 4].Merge = true;
                MyWorksheet1.Cells[rowik + 12, 4].Value = " 0-3 miesiący";
                MyWorksheet1.Cells[rowik + 13, 4, rowik + 13, 4].Merge = true;
                MyWorksheet1.Cells[rowik + 13, 4].Value = " 3-6 miesięcy";
                MyWorksheet1.Cells[rowik + 14, 4, rowik + 14, 4].Merge = true;
                MyWorksheet1.Cells[rowik + 14, 4].Value = " 6-12 miesięcy";

                MyWorksheet1.Cells[rowik + 15, 4, rowik + 15, 4].Merge = true;
                MyWorksheet1.Cells[rowik + 15, 4].Value = " 12-24 miesięcy (do 2 lat)";


                MyWorksheet1.Cells[rowik + 16, 4, rowik + 16, 4].Merge = true;
                MyWorksheet1.Cells[rowik + 16, 4].Value = " 36-60 miesięcy (3-5 lat)";

                MyWorksheet1.Cells[rowik + 17, 4, rowik + 17, 4].Merge = true;
                MyWorksheet1.Cells[rowik + 17, 4].Value = " Powyżej 60 miesięcy (powyżej 5 lat)";
                DataTable tabelka001 = (DataTable)Session["tabelka001"];



                // druga 


                ExcelWorksheet MyWorksheet2 = MyExcel.Workbook.Worksheets[2];

                DataView view2 = (DataView)tabela_3.Select(DataSourceSelectArguments.Empty);

                DataTable table2 = view2.ToTable();
                table2.Columns.Remove("ident");
                table2.Columns.Remove("id_sedziego");
                table2.Columns.Remove("stanowisko");
                table2.Columns.Remove("funkcja");

                MyWorksheet2 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[2], table2, 32, 1, 7, false,true);
                
             

                // czwarta 




                ExcelWorksheet MyWorksheet3 = MyExcel.Workbook.Worksheets[3];
                DataView view4 = (DataView)tabela_4.Select(DataSourceSelectArguments.Empty);
                DataTable table4 = view2.ToTable();
                table4.Columns.Remove("ident");
                table4.Columns.Remove("id_sedziego");
                table4.Columns.Remove("stanowisko");
                table4.Columns.Remove("funkcja");

                MyWorksheet3 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[3], table2, 5, 1, 6, true, true);
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

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
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
                DataTable table = ((DataView)tabela_4.Select(DataSourceSelectArguments.Empty)).ToTable();
                tb.makeSumRow(table, e);
            }
        }
        public DataTable makeSumRow(DataTable table, int ilKolumn)
        {
            DataTable wyjsciowa = new DataTable ();
            for (int i = 0; i < ilKolumn; i++)
            {
                wyjsciowa.Columns.Add("d_"+i.ToString ("D2"),typeof (double));

            }
            DataTable tabelka = tb.tabellaLiczbowa(table);
            object sumObject;
            DataRow wiersz=wyjsciowa.NewRow ();
            for (int i = 1; i < ilKolumn; i++)
            {
                try
                {
                    string idkolumny = "d_" + (i).ToString("D2");
                    sumObject = tabelka.Compute("Sum(" + idkolumny + ")", "");
                    wiersz[i] = double.Parse(sumObject.ToString());
                    

                    
                }
                catch (Exception ex)
                {
                    cm.log.Error("sumowanie w stopce : " + ex.Message);
                }

            }
            wyjsciowa.Rows.Add(wiersz);
            return wyjsciowa;
        }
        // podtabela



        public void AddNewRow(object sender, GridViewRowEventArgs e)
        {
            DataTable tabelka01 = (DataTable)Session["tabelka001"];


            GridView GridView1 = (GridView)sender;
            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);

            string idtabeli = "2";
            DataTable table = ((DataView)tabela_1.Select(DataSourceSelectArguments.Empty)).ToTable();
        
            DataTable cos = makeSumRow(table, 18);
    
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(cos, 18, 1, idtabeli, "ogółem",2, 1, "normal", "borderTopLeft col_60"));

            // nowy wiersz
            int idWiersza = 1;

            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "Zaległość z poprzedniego miesiąca", 3 , 1, "normal", "borderTopLeft col_60"));
        
            idWiersza = 2;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "Wpływ", 3, 1, "normal", "borderTopLeft col_60"));

            // nowy wiersz
            idWiersza = 3;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "Załatwienia", 3, 1, "normal", "borderTopLeft col_60"));

            // nowy wiersz
            idWiersza = 4;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "Pozostałość na następny miesiąc", 3, 1, "normal", "borderTopLeft col_60"));
            
            // nowy wiersz
            idWiersza = 5;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "Odroczono", 1, 1, "normal", "borderTopLeft col_60", "Zaległość", 7 , 2, "borderTopLeft col_60" ));
      
            // nowy wiersz
            idWiersza = 6;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "3-6 </br>miesięcy ", 1, 1, "normal", "borderTopLeft col_60"));

            // nowy wiersz
            idWiersza = 7;
           GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "6-12 </br>miesięcy ", 1, 1, "normal", "borderTopLeft col_60"));

            // nowy wiersz
            idWiersza = 8;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "12-24 </br>miesięcy</br> (do 2 lat)", 1, 1, "normal", "borderTopLeft col_60"));

            idWiersza = 9;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "24-36 </br>miesięcy </br>(2-3 lat))", 1, 1, "normal", "borderTopLeft col_60"));

            idWiersza = 10;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "36-60 </br>miesięcy </br>(3-5 lat)", 1, 1, "normal", "borderTopLeft col_60"));

           idWiersza = 11;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 17, idWiersza, idtabeli, "Powyżej </br>60 miesięcy </br>(powyżej</br> 5 lat)", 1, 1, "normal", "borderTopLeft col_60"));
            
        }

    }
}