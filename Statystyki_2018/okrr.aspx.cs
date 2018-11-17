using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using OfficeOpenXml;

namespace stat2018
{
    public partial class okrr : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public pdfTables pdfT = new pdfTables();
        public common cm = new common();
        public tabele tabela = new tabele();
        public dataReaders dr = new dataReaders();
        public static string tenPlik = "okrr.aspx";
        protected bool flaga = false;

        int storid = 0;
        int rowIndex = 1;

        protected void Page_Load(object sender, EventArgs e)
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
            cm.log.Debug("otwarcie formularza: " + tenPlik);
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
                cm.log.Error(tenPlik + " " + ex.Message);

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
            string yyx = (string)Session["id_dzialu"];
            id_dzialu.Text = (string)Session["txt_dzialu"];
            string txt = string.Empty; //
            cl.deleteRowTable();

            txt = txt + cl.clear_maim_db();
            try
            {

                DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), (string)Session["id_dzialu"], 2, 20, 20, tenPlik);
                Session["tabelka001"] = tabelka01;
            

                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 1");
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 1, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text));
               
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 3");
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 3, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text));
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 4");
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 4, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text));
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 5");
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 5, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text));
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 7");
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 7, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text));
                cl.uzupelnij_statusy();
            }
            catch (Exception ex)
            {
                txt = txt + ex.Message + Environment.NewLine;
            }

            // dopasowanie opisów
            makeLabels();

            GridView1.DataBind();
            GridView6.DataBind();
            GridView3.DataBind();
            GridView4.DataBind();
         

            txt = txt + "GridView1 liczba wierszy: " + GridView1.Rows.Count.ToString() + Environment.NewLine;

            try
            {
                Label11.Visible = cl.debug(int.Parse(yyx));
                infoLabel2.Visible = cl.debug(int.Parse(yyx));
                infoLabel3.Visible = cl.debug(int.Parse(yyx));
                infoLabel4.Visible = cl.debug(int.Parse(yyx));
               

            }
            catch
            {
                Label11.Visible = false;
                infoLabel2.Visible = false;
                infoLabel3.Visible = false;
                infoLabel4.Visible = false;
              
            }

            Label11.Text = txt;
            Label3.Text = cl.nazwaSadu((string)Session["id_dzialu"]);


        }


        #region "nagłowki tabel"
        protected void makeHeader()
        {

            System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();

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


            #region tabela  1 


           

           

            dT_01.Clear();
        

           
         



            dT_01.Rows.Add(new Object[] { "1", "Symbol 003o", "1", "1", "h" });
            dT_01.Rows.Add(new Object[] { "1", "Wyrok", "1", "1", "h" });
            dT_01.Rows.Add(new Object[] { "1", "Ugoda", "1", "1", "h" });
             dT_01.Rows.Add(new Object[] { "2", "", "1", "2", "h" });
            dT_01.Rows.Add(new Object[] { "2", "w tym w sprawach karnych", "1", "2", "h" });

            dT_01.Rows.Add(new Object[] { "2", "Urlopy", "1", "2", "h" });
            dT_01.Rows.Add(new Object[] { "2", "Zwolnienia", "1", "2", "h" });

            dT_01.Rows.Add(new Object[] { "2", "Razem", "1", "2", "h" });
            dT_01.Rows.Add(new Object[] { "2", "w tym", "3", "1", "h" });
            dT_01.Rows.Add(new Object[] { "2", "dane wykazane co do spraw (sygnatur)", "4", "2", "h" });




            dT_01.Rows.Add(new Object[] { "3", "Razem", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "w terminie ustawowym", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "Po upływie terminu ustawowego", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "w tym nieuspra- wiedliwione", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "Nkd", "1", "3", "h" });

            dT_01.Rows.Add(new Object[] { "3", "RC", "4", "1", "h" });

            dT_01.Rows.Add(new Object[] { "3", "RNs", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "RNc", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "Nsm", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "RCo", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "RCps", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "Nmo", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "WSC", "1", "3", "h" });


            dT_01.Rows.Add(new Object[] { "4", "L.p.", "1", "4", "h" });
            dT_01.Rows.Add(new Object[] { "4", "Funkcja", "1", "4", "h" });
            dT_01.Rows.Add(new Object[] { "4", "Imię i Nazwisko / Stanowisko", "1", "4", "h" });
            dT_01.Rows.Add(new Object[] { "4", "Ilość wokand rozpoznanych", "1", "4", "h" });
            dT_01.Rows.Add(new Object[] { "4", "Sprawy wyznaczone ogółem", "2", "2" });
            dT_01.Rows.Add(new Object[] { "4", "Etat", "1", "4", "h" });
            dT_01.Rows.Add(new Object[] { "4", "Etat orzecz- niczy", "1", "4", "h" });
            dT_01.Rows.Add(new Object[] { "4", "Terminowość sporządzania orzeczeń", "4", "1", "h" });
            dT_01.Rows.Add(new Object[] { "4", "Uzasadnienia wygłoszone", "1", "4", "h" });
            dT_01.Rows.Add(new Object[] { "4", "Oddalono lub utrzymano w mocy apelacje / zażalenia", "1", "4", "h" });
            dT_01.Rows.Add(new Object[] { "4", "Nieobecności", "2", "2", "h" });
            dT_01.Rows.Add(new Object[] { "4", "Załatwienia", "12", "1", "h" });
            dT_01.Rows.Add(new Object[] { "4", "Razem", "1", "4", "h" });
            dT_01.Rows.Add(new Object[] { "4", "Alk", "1", "2", "h" });
            dT_01.Rows.Add(new Object[] { "4", "Op", "1", "2", "h" });
            dT_01.Rows.Add(new Object[] { "4", "Opm", "1", "2", "h" });
            dT_01.Rows.Add(new Object[] { "4", "Nw", "1", "2", "h" });
            dT_01.Rows.Add(new Object[] { "4", "Uwagi", "1", "4", "h" });


            Session["header_01"] = dT_01;
            //  makeHeader2(sn, dT_01);
            #endregion


            #region tabela  2 ()

            dT_02.Clear();

            dT_02.Rows.Add(new Object[] { "1", "Opm", "1", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "1", "Op", "1", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "1", "Nw", "1", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "1", "Alk", "1", "1", "h" });//
          

            dT_02.Rows.Add(new Object[] { "2", "Ilość posiedzeń wykonawczych", "1", "2", "h" });//
            dT_02.Rows.Add(new Object[] { "2", "Ilość spraw wyznaczonych", "4", "1", "h" });//
         
            dT_02.Rows.Add(new Object[] { "3", "L.p.", "1", "3", "h" });//
            dT_02.Rows.Add(new Object[] { "3", "Funkcja", "1", "3", "h" });//
            dT_02.Rows.Add(new Object[] { "3", "Stanowisko", "1", "3", "h" });//
            dT_02.Rows.Add(new Object[] { "3", "Imię", "1", "3", "h" });//
            dT_02.Rows.Add(new Object[] { "3", "Nazwisko", "1", "3", "h" });//
            dT_02.Rows.Add(new Object[] { "3", "Postępowanie wykonawcze", "5", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "3", "Uwagi", "1", "3", "h" });//




            Session["header_02"] = dT_02;
         

            #endregion
            #region tabela  3 ()

            dT_03.Clear();
            for (int i = 0; i < 8; i++)
            {
                dT_03.Rows.Add(new Object[] { "1", "R", "1", "1", "h" });
                dT_03.Rows.Add(new Object[] { "1", "P", "1", "1", "h" });
            }
          

            dT_03.Rows.Add(new Object[] { "2", "RC", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "RNs", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Rsm", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "1", "Nkd", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "Nmo", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "RCo", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "RCps", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "RC w tym", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "RNs", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Rsm", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "1", "Nkd", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "Nmo", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "RCo", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "RCps", "2", "1", "h" });
            


            dT_03.Rows.Add(new Object[] { "3", "L.p.", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Sędzia", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Ilość spraw wyznaczonych w postępowaniu rozpoznawczym", "11", "1", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Razem wyzna- czonych", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Ilość spraw załatwionych w postępowaniu rozpoznawczym", "11", "1", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Razem załatwionych", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Ilość spraw odroczonych", "1", "3", "h" });
          



            Session["header_03"] = dT_03;
            //  makeHeader3(sn, dT_03);
            #endregion



            #region tabela  4 ()

            dT_04.Clear();
            for (int i = 0; i < 2; i++)
            {


                dT_04.Rows.Add(new Object[] { "1", "RC", "1", "1", "h" });
                dT_04.Rows.Add(new Object[] { "1", "RNs", "1", "1", "h" });
                dT_04.Rows.Add(new Object[] { "1", "Nsm", "1", "1" });
                dT_04.Rows.Add(new Object[] { "1", "Nkd", "1", "1" });

                dT_04.Rows.Add(new Object[] { "1", "Nmo", "1", "1" });
                dT_04.Rows.Add(new Object[] { "1", "RCo", "1", "1", "h" });
                dT_04.Rows.Add(new Object[] { "1", "RCps", "1", "1" });
            }

            dT_04.Rows.Add(new Object[] { "2", "L.p.", "1", "2","h" });
            dT_04.Rows.Add(new Object[] { "2", "Nazwisko i imię sędziego", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "Ilość spraw wyznaczonych na pos. niejawnym", "7", "1" });
            dT_04.Rows.Add(new Object[] { "2", "Razem wyznaczonych", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "Ilość spraw załatwionych na pos. niejawnym", "7", "1", "h" });
            dT_04.Rows.Add(new Object[] { "2", "Razem Załatwionych", "1", "2", "h" });
         
            Session["header_04"] = dT_04;

            //  makeHeader6(sn, dT_05);

            #endregion

            #region tabela  5 ()

            dT_05.Clear();

            dT_05.Rows.Add(new Object[] { "1", "C", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "Ns", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "Co", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "Nc", "1", "1" });

            dT_05.Rows.Add(new Object[] { "1", "Ns-Rej.", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "Razem", "1", "1" });

            dT_05.Rows.Add(new Object[] { "2", "L.p.", "1", "2" });
            dT_05.Rows.Add(new Object[] { "2", "Imie i nazwisko sędziego", "1", "2" });
            dT_05.Rows.Add(new Object[] { "2", "Liczba załatwionych spraw od początku roku ", "6", "1" });


            Session["header_05"] = dT_05;

            //  makeHeader6(sn, dT_05);

            #endregion

            #region tabela  6 ()

            DataTable dT_06 = new DataTable();
            dT_06.Columns.Clear();
            dT_06.Columns.Add("Column1", typeof(string));
            dT_06.Columns.Add("Column2", typeof(string));
            dT_06.Columns.Add("Column3", typeof(string));
            dT_06.Columns.Add("Column4", typeof(string));
            dT_06.Clear();

            dT_06.Rows.Add(new Object[] { "1", "do 3 miesięcy", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "suma powyżej 3 miesięcy", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "powyżej 3 do 6 miesięcy", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "powyżej 6 do 12 miesięcy", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "suma powyżej 12 miesięcy", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "powyżej 12 miesięcy do 2 lat", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "powyżej 2 do 3 lat", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "suma powyżej 3 lat", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "powyżej 3 do 5 lat", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "powyżej 5 do 8 lat", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "ponad 8 lat", "1", "1" });

            dT_06.Rows.Add(new Object[] { "2", "Opis.", "1", "2" });

            dT_06.Rows.Add(new Object[] { "2", "Struktura pozostałości  -   liczba spraw  ( w tym zawieszone) ", "11", "1" });
            Session["header_06"] = dT_06;
            Session["header_07"] = dT_06;

            //     makeHeader7(sn, dT_06);
            #endregion

            #region tabela  8 ()

            DataTable dT_08 = new DataTable();
            dT_08.Columns.Clear();
            dT_08.Columns.Add("Column1", typeof(string));
            dT_08.Columns.Add("Column2", typeof(string));
            dT_08.Columns.Add("Column3", typeof(string));
            dT_08.Columns.Add("Column4", typeof(string));
            dT_08.Clear();

            dT_08.Rows.Add(new Object[] { "1", "C", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "Ns", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "Nsm", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "Co", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "Nmo", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "Cps", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "Nkd", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "Łącznie", "1", "1" });
            dT_08.Rows.Add(new Object[] { "2", "L.p.", "1", "2" });
            dT_08.Rows.Add(new Object[] { "2", "Imię i Nazwisko", "1", "2" });
            dT_08.Rows.Add(new Object[] { "2", "Pozostało z na następny miesiąc", "8", "1" });

            dT_08.Rows.Add(new Object[] { "2", "W tym 3-6 miesięcy", "1", "2" });
            dT_08.Rows.Add(new Object[] { "2", "6-12 miesięcy", "1", "2" });
            dT_08.Rows.Add(new Object[] { "2", "Powyżej 12 miesięcy", "1", "2" });
            dT_08.Rows.Add(new Object[] { "2", "Powyżej 24 miesięcy", "1", "2" });

            //ILOŚĆ WOKAND ŁĄCZNIE
            Session["header_08"] = dT_08;
            //  makeHeader8(sn, dT_08);
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

        protected void GridView4_RowCreated(object sender, GridViewRowEventArgs e)
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


                id_dzialu.Text = (string)Session["txt_dzialu"];
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
                    lbtabela1.Text = "Informacja statystyczna z ruchu spraw za miesiąc:  " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    lbTabela2.Text = "Wydajność pracy sędziów na posiedzeniu wykonawczym za miesiąc " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    lbTabela3.Text = "Obciążenie i wydajność pracy sędziów - ROZPRAWA I POS. JAWNE (na sesjach) za miesiąc " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    lbTabela4.Text = "Obciążenie i wydajność pracy sędziów – POSIEDZENIU NIEJAWNYM za miesiąc " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                }
                else
                {
                    lbtabela1.Text = "Informacja statystyczna z ruchu spraw za okres od:  " + Date1.Text + " do  " + Date2.Text;
                    lbTabela2.Text = "Wydajność pracy sędziów na posiedzeniu wykonawczym za okres od " + Date1.Text + " do  " + Date2.Text;
                    lbTabela3.Text = "Obciążenie i wydajność pracy sędziów - ROZPRAWA I POS. JAWNE (na sesjach) za okres od" + Date1.Text + " do  " + Date2.Text;
                    lbTabela4.Text = "Obciążenie i wydajność pracy sędziów – POSIEDZENIU NIEJAWNYM za" + Date1.Text + " do  " + Date2.Text;
                    //     Label15.Text = "Załatwienia za okres od " + Date1.Text + " do  " + Date2.Text;
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
            string path = Server.MapPath("Template") + "\\akrr.xlsx";
            FileInfo existingFile = new FileInfo(path);

            string download = Server.MapPath("Template") + @"\akac";

            FileInfo fNewFile = new FileInfo(download + "_.xlsx");

            // pierwsza tabelka

            DataTable tabelka001 = (DataTable)Session["tabelka001"];


            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                // pierwsza
                ExcelWorksheet MyWorksheet = MyExcel.Workbook.Worksheets[1];

                MyWorksheet.Cells[4, 3].Value = "Informacja statystyczna z ruchu spraw cywilnych za okres od " + Date1.Text + " do " + Date2.Text;
                int rowik = 10;
                foreach (DataRow dR in tabelka001.Rows)
                {
                    for (int i = 1; i < 22; i++)
                    {
                        if (i == 15)
                        {
                            i = i + 1;
                        }
                        if (rowik <= 22)
                        {
                            try
                            {
                                MyWorksheet.Cells[rowik + 3, i + 3].Value = double.Parse(dR[i - 1].ToString().Trim());
                            }
                            catch
                            {

                                MyWorksheet.Cells[rowik + 3, i + 3].Value = dR[i - 1].ToString().Trim();
                            }

                            MyWorksheet.Cells[rowik + 3, i + 3].Style.ShrinkToFit = true;
                            MyWorksheet.Cells[rowik + 3, i + 3].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                        }

                    }
                    rowik++;
                }


                for (int i = 1; i < 22; i++)
                {
                    if (i == 15)
                    {
                        i = i + 1;
                    }
                    object sumObject;
                    string txt = "d";
                    string digit = i.ToString("D2");
                    txt = txt + digit;
                    sumObject = tabelka001.Compute("Sum(" + txt + ")", "");



                    MyWorksheet.Cells[26, i + 3].Value = sumObject.ToString();
                    MyWorksheet.Cells[26, i + 3].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                }



                // druga 
                ExcelWorksheet MyWorksheet2 = MyExcel.Workbook.Worksheets[2];
                DataView view = (DataView)tabela_2.Select(DataSourceSelectArguments.Empty);
                DataTable table = view.ToTable();
                table.Columns.Remove("ident");
                table.Columns.Remove("id_sedziego");
                table.Columns.Remove("stanowisko");
                table.Columns.Remove("funkcja");


                //   MyWorksheet2.Cells[1, 3].Value = "Ruch spraw w referatach sędziów za okres od " + Date1.Text + " do " + Date2.Text;
                rowik = 1;
                foreach (DataRow dR in table.Rows)
                {
                    MyWorksheet2.Cells[rowik + 7, 2].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                    MyWorksheet2.Cells[rowik + 7, 2].Value = rowik.ToString();
                    MyWorksheet2.Cells[rowik + 7, 3].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                    MyWorksheet2.Cells[rowik + 7, 3].Value = dR[1].ToString().Trim() + " " + dR[2].ToString().Trim();

                    for (int i = 3; i < 32; i++)
                    {
                        MyWorksheet2.Cells[rowik + 7, i + 1].Style.ShrinkToFit = true;
                        MyWorksheet2.Cells[rowik + 7, i + 1].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                        try
                        {
                            MyWorksheet2.Cells[rowik + 7, i + 1].Value = double.Parse(dR[i].ToString().Trim());
                        }
                        catch (Exception)
                        {
                            MyWorksheet2.Cells[rowik + 7, i + 1].Value = dR[i].ToString().Trim();
                        }
                    }
                    rowik++;
                }
                MyWorksheet2.Cells[rowik + 7, 2].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                MyWorksheet2.Cells[rowik + 7, 3].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                MyWorksheet2.Cells[rowik + 7, 3].Value = "Razem";

                for (int i = 1; i < 30; i++)
                {
                    object sumObject;
                    string txt = "d_";
                    string digit = i.ToString("D2");
                    txt = txt + digit;
                    sumObject = table.Compute("Sum(" + txt + ")", "");
                    MyWorksheet2.Cells[rowik + 7, i + 3].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                    try
                    {
                        MyWorksheet2.Cells[rowik + 7, i + 3].Value = double.Parse(sumObject.ToString());

                    }
                    catch (Exception)
                    {
                        MyWorksheet2.Cells[rowik + 7, i + 3].Value = sumObject.ToString();

                    }

                }

                // trzecia 


                ExcelWorksheet MyWorksheet3 = MyExcel.Workbook.Worksheets[3];

                DataView view2 = (DataView)tabela_3.Select(DataSourceSelectArguments.Empty);

                DataTable table2 = view2.ToTable();
                table2.Columns.Remove("ident");
                table2.Columns.Remove("id_sedziego");
                table2.Columns.Remove("stanowisko");
                table2.Columns.Remove("funkcja");


                rowik = 2;
                foreach (DataRow dR in table2.Rows)
                {
                    MyWorksheet3.Cells[rowik + 7, 2].Value = (rowik - 1).ToString();
                    MyWorksheet3.Cells[rowik + 7, 2].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                    MyWorksheet3.Cells[rowik + 7, 3].Value = dR[1].ToString().Trim();
                    MyWorksheet3.Cells[rowik + 7, 3].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                    MyWorksheet3.Cells[rowik + 7, 4].Value = dR[2].ToString().Trim();
                    MyWorksheet3.Cells[rowik + 7, 4].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                    for (int i = 3; i < 30; i++)
                    {
                        MyWorksheet3.Cells[rowik + 7, i + 2].Style.ShrinkToFit = true;
                        MyWorksheet3.Cells[rowik + 7, i + 2].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                        try
                        {
                            MyWorksheet3.Cells[rowik + 7, i + 2].Value = double.Parse(dR[i].ToString().Trim());
                        }
                        catch
                        {
                            MyWorksheet3.Cells[rowik + 7, i + 2].Value = dR[i].ToString().Trim();
                        }
                    }
                    rowik++;
                }
                MyWorksheet3.Cells[rowik + 7, 3].Value = "Razem";
                MyWorksheet3.Cells[rowik + 7, 2].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                MyWorksheet3.Cells[rowik + 7, 3].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                for (int i = 3; i < 29; i++)
                {
                    object sumObject;
                    string txt = "d_";
                    string digit = i.ToString("D2");
                    txt = txt + digit;

                    sumObject = table2.Compute("Sum(" + txt + ")", "");

                    try
                    {

                        MyWorksheet3.Cells[rowik + 7, i + 2].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                        MyWorksheet3.Cells[rowik + 7, i + 2].Value = double.Parse(sumObject.ToString());
                    }
                    catch (Exception)
                    {

                        MyWorksheet3.Cells[rowik + 7, i + 2].Value = sumObject.ToString();
                    }

                }


                // czwarta 


                ExcelWorksheet MyWorksheet4 = MyExcel.Workbook.Worksheets[4];

                DataView view3 = (DataView)tabela_4.Select(DataSourceSelectArguments.Empty);

                DataTable table3 = view2.ToTable();
                table3.Columns.Remove("ident");
                table3.Columns.Remove("id_sedziego");
                table3.Columns.Remove("stanowisko");
                table3.Columns.Remove("funkcja");


                rowik = 1;
                foreach (DataRow dR in table3.Rows)
                {


                    MyWorksheet4.Cells[rowik + 6, 1].Value = rowik.ToString();
                    MyWorksheet4.Cells[rowik + 6, 2].Value = dR[1].ToString().Trim() + " " + dR[2].ToString().Trim();
                    MyWorksheet4.Cells[rowik + 6, 1].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                    MyWorksheet4.Cells[rowik + 6, 2].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                    for (int i = 3; i < 26; i++)
                    {
                        MyWorksheet4.Cells[rowik + 6, i].Style.ShrinkToFit = true;
                        MyWorksheet4.Cells[rowik + 6, i].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                        try
                        {
                            MyWorksheet4.Cells[rowik + 6, i].Value = double.Parse(dR[i].ToString().Trim());
                        }
                        catch (Exception)
                        {

                            MyWorksheet4.Cells[rowik + 6, i].Value = dR[i].ToString().Trim();
                        }


                    }
                    rowik++;
                }
                MyWorksheet4.Cells[rowik + 6, 2].Value = "Razem";
                for (int i = 3; i < 26; i++)
                {
                    object sumObject;
                    string txt = "d_";
                    string digit = i.ToString("D2");
                    txt = txt + digit;
                    sumObject = table3.Compute("Sum(" + txt + ")", "");
                    MyWorksheet4.Cells[rowik + 6, 2].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                    MyWorksheet4.Cells[rowik + 6, 1].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                    MyWorksheet4.Cells[rowik + 6, i].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                    try
                    {
                        MyWorksheet4.Cells[rowik + 6, i].Value = double.Parse(sumObject.ToString());
                    }
                    catch (Exception)
                    {
                        MyWorksheet4.Cells[rowik + 6, i].Value = sumObject.ToString();
                    }

                }
                
                rowik = 1;
              
              


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
               tabela. makeHeader(sn, dT, GridView1);
            }
        }


    
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

           
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                storid = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "id").ToString());
              
                if (!flaga)
                {
                    e.Row.Cells[29].ColumnSpan = 4;
                 //   e.Row.Cells[31].RowSpan = GridView1.Rows.Count ;
                  //  flaga = true;
                }
                
            }
           
        }


        protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = ((DataView)tabela_3.Select(DataSourceSelectArguments.Empty)).ToTable();
                tabela.makeSumRow(table, e);
            }
        }

        protected void GridView4_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = ((DataView)tabela_4.Select(DataSourceSelectArguments.Empty)).ToTable();
                tabela.makeSumRow(table, e);
            }
        }

          
        protected void GridView6_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_01"];
                tabela.makeHeader(sn, dT, GridView6);
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


        GridViewRow wierszTabeli(int idWiersza,string idtabeli,string tekst)
        {
            // nowy wiersz
          
            DataTable tabelka01 = (DataTable)Session["tabelka001"];
            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
            NewTotalRow.Cells.Add(tabela.cela(tekst, 1, 14, "borderTopLeft "));
            NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza + 1).ToString().Trim() + "!2!1!3')\">" + tabelka01.Rows[idWiersza][1].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza + 1).ToString().Trim() + "!2!2!3')\">" + tabelka01.Rows[idWiersza][2].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza + 1).ToString().Trim() + "!2!3!3')\">" + tabelka01.Rows[idWiersza][3].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            for (int i = 4; i < 16; i++)
            {
                NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza + 1).ToString().Trim() + "!2!" + i.ToString() + "!3')\">" + tabelka01.Rows[idWiersza][i].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            }
            NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza + 1).ToString().Trim() + "!2!1!3')\">" + tabelka01.Rows[idWiersza][17].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            
            return NewTotalRow;
           

        }
        GridViewRow wierszTabeli1(int idWiersza, string idtabeli, string tekst)
        {
            // nowy wiersz
            
            DataTable tabelka01 = (DataTable)Session["tabelka001"];
            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
            NewTotalRow.Cells.Add(tabela.cela(tekst, 1, 14, "borderTopLeft "));

            NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza + 1).ToString().Trim() + "!2!1!3')\">" + tabelka01.Rows[idWiersza][1].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza + 1).ToString().Trim() + "!2!2!3')\">" + tabelka01.Rows[idWiersza][2].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza + 1).ToString().Trim() + "!2!3!3')\">" + tabelka01.Rows[idWiersza][3].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            for (int i = 4; i < 12; i++)
            {
                NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza + 1).ToString().Trim() + "!2!" + i.ToString() + "!3')\">" + tabelka01.Rows[idWiersza][i].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            }
            NewTotalRow.Cells.Add(tabela.cela("", 7, 4, "borderTopLeft gray"));
            NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza + 1).ToString().Trim() + "!2!1!3')\">" + tabelka01.Rows[idWiersza][17].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            return NewTotalRow;


        }

        GridViewRow wierszTabeli11(int idWiersza, string idtabeli, string tekst)
        {
            // nowy wiersz

            DataTable tabelka01 = (DataTable)Session["tabelka001"];
            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
            NewTotalRow.Cells.Add(tabela.cela(tekst, 1, 14, "borderTopLeft "));
            NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza + 1).ToString().Trim() + "!2!1!3')\">" + tabelka01.Rows[idWiersza][1].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza + 1).ToString().Trim() + "!2!2!3')\">" + tabelka01.Rows[idWiersza][2].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza + 1).ToString().Trim() + "!2!3!3')\">" + tabelka01.Rows[idWiersza][3].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            for (int i = 4; i < 12; i++)
            {
                NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza + 1).ToString().Trim() + "!2!" + i.ToString() + "!3')\">" + tabelka01.Rows[idWiersza][i].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            }

            NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza + 1).ToString().Trim() + "!2!1!3')\">" + tabelka01.Rows[idWiersza][17].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            return NewTotalRow;


        }
        GridViewRow wierszTabeli2(int idWiersza, string idtabeli, string tekst)
        {
            // nowy wiersz

            DataTable tabelka01 = (DataTable)Session["tabelka001"];
            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
            NewTotalRow.Cells.Add(tabela.cela("w tym", 4, 1, "borderTopLeft gray"));
            NewTotalRow.Cells.Add(tabela.cela(tekst, 1, 13, "borderTopLeft  "));
            NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza + 1).ToString().Trim() + "!2!1!3')\">" + tabelka01.Rows[idWiersza][1].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza + 1).ToString().Trim() + "!2!2!3')\">" + tabelka01.Rows[idWiersza][2].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza + 1).ToString().Trim() + "!2!3!3')\">" + tabelka01.Rows[idWiersza][3].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            for (int i = 4; i < 12; i++)
            {
                NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza + 1).ToString().Trim() + "!2!" + i.ToString() + "!3')\">" + tabelka01.Rows[idWiersza][i].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));

            }
            NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza + 1).ToString().Trim() + "!2!1!3')\">" + tabelka01.Rows[idWiersza][17].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            return NewTotalRow;


        }
        GridViewRow wierszTabeli3(int idWiersza, string idtabeli, string tekst)
        {
            // nowy wiersz

            DataTable tabelka01 = (DataTable)Session["tabelka001"];
            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
           
            NewTotalRow.Cells.Add(tabela.cela(tekst, 1, 13, "borderTopLeft"));
            NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza + 1).ToString().Trim() + "!2!1!3')\">" + tabelka01.Rows[idWiersza][1].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza + 1).ToString().Trim() + "!2!2!3')\">" + tabelka01.Rows[idWiersza][2].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza + 1).ToString().Trim() + "!2!3!3')\">" + tabelka01.Rows[idWiersza][3].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            for (int i = 4; i < 12; i++)
            {
                NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza + 1).ToString().Trim() + "!2!" + i.ToString() + "!3')\">" + tabelka01.Rows[idWiersza][i].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            }
            NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza + 1).ToString().Trim() + "!2!1!3')\">" + tabelka01.Rows[idWiersza][17].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            return NewTotalRow;


        }

     
        public void AddNewRow(object sender, GridViewRowEventArgs e)
        {
            GridView GridView1 = (GridView)sender;
            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
           
            string idtabeli = "2";
            TableCell HeaderCell = tabela.cela("Razem",11,2, "borderTopLeft");
            HeaderCell.BackColor = System.Drawing.Color.LightGray;
            NewTotalRow.Cells.Add(HeaderCell);

           
            NewTotalRow.Cells.Add(tabela.cela("Zaległości z poprzedniego miesiąca", 1, 14, "borderTopLeft"));
            DataTable tabelka01 = (DataTable)Session["tabelka001"];

            int idWiersza = 0;

            NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza + 1).ToString().Trim() + "!2!1!3')\">" + tabelka01.Rows[idWiersza][1].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza + 1).ToString().Trim() + "!2!2!3')\">" + tabelka01.Rows[idWiersza][2].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza + 1).ToString().Trim() + "!2!3!3')\">" + tabelka01.Rows[idWiersza][3].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));

            NewTotalRow.Cells.Add(tabela.cela("",11, 2, "borderTopLeft doubleXcross gray"));

            for (int i = 4; i < 16; i++)
            {
                NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza + 1).ToString().Trim() + "!2!" + i.ToString() + "!3')\">" + tabelka01.Rows[idWiersza][i].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));

            }
            NewTotalRow.Cells.Add(tabela.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + (idWiersza + 1).ToString().Trim() + "!2!1!3')\">" + tabelka01.Rows[idWiersza][17].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));

            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, NewTotalRow);

            // nowy wiersz
           
            idWiersza = 1;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli(1, idtabeli, "wpływ"));


            // nowy wiersz
            idWiersza = 2;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli(2, idtabeli, "załatwienia"));

            // nowy wiersz
            idWiersza = 3;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli(3, idtabeli, "pozostałość na następny miesiąc"));

            // nowy wiersz
            idWiersza = 4;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli1(4, idtabeli, "powyżej 3 do 6 miesięcy"));

            // nowy wiersz
            idWiersza = 5;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli11(idWiersza, idtabeli, "powyżej 6 do 12 miesięcy"));

            // nowy wiersz
            idWiersza = 6;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli11(idWiersza, idtabeli, "powyżej 12 miesięcy"));

            // nowy wiersz
            idWiersza = 7;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli2(idWiersza, idtabeli, "powyżej 12 miesięcy - 2 lat"));
            // nowy wiersz
            idWiersza = 8;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli3(idWiersza, idtabeli, "powyżej 2 lat - 3 lat"));

            // nowy wiersz
            idWiersza = 9;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli3(idWiersza, idtabeli, "powyżej 3 lat - 5 lat"));

            // nowy wiersz
            idWiersza = 10;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli3(idWiersza, idtabeli, "ponad 5 lat"));


        }

        protected void GridView1_RowDataBound1(object sender, GridViewRowEventArgs e)
        {
            //   robienie sumy
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = ((DataView)tabela_2.Select(DataSourceSelectArguments.Empty)).ToTable();
                tabela.makeSumRow(table, e,4);
            }

        }
    }
}