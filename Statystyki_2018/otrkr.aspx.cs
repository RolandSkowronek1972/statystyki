using NPOI.HPSF;
using NPOI.HSSF.UserModel;
using NPOI.SS.UserModel;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace stat2018
{
  

    public partial class otrkr : System.Web.UI.Page
    {

        public Class1 cl = new Class1();
        private HSSFWorkbook hssfworkbook;
        public common cm = new common();

        protected void Page_Load(object sender, EventArgs e)
        {
            string idWydzial = Request.QueryString["w"];
            if (idWydzial != null)
            {
                Session["id_dzialu"] = idWydzial;
            //    //cm.log.Info(tenPlik + ": id wydzialu=" + idWydzial);
            }
            else
            {
                return;
            }
            CultureInfo newCulture = (CultureInfo)CultureInfo.CurrentCulture.Clone();
            newCulture.DateTimeFormat = CultureInfo.GetCultureInfo("PL").DateTimeFormat;
            System.Threading.Thread.CurrentThread.CurrentCulture = newCulture;
            System.Threading.Thread.CurrentThread.CurrentUICulture = newCulture;
            DateTime dTime = DateTime.Now.AddMonths(-1); ;

            if (Date1.Text.Length == 0) Date1.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-01");
            if (Date2.Text.Length == 0) Date2.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-" + DateTime.DaysInMonth(dTime.Year, dTime.Month).ToString("D2"));

            Session["data_1"] = Date1.Date.ToShortDateString();
            Session["data_2"] = Date2.Date.ToShortDateString();
            clearHedersSession();
            makeHeader();
            try
            {
                string user = (string)Session["userIdNum"];
                string dzial = (string)Session["id_dzialu"];
                bool dost = cm.dostep(dzial, user);
                if (!dost)
                {
                    Server.Transfer("default.aspx");
                }
                else
                {
                    if (!IsPostBack)
                    {
                        var fileContents = System.IO.File.ReadAllText(Server.MapPath(@"~//version.txt"));    // file read with version
                        this.Title = "Statystyki " + fileContents.ToString().Trim();
                        odswiez();
                        makeLabels();
                    }
                }
            }
            catch 
            {
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

        protected void odswiez()
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
            id_dzialu.Text = (string)Session["txt_dzialu"];
            string txt = string.Empty; //

            txt = txt + cl.clear_maim_db();
            try
            {
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 2, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text));

                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 3, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text));
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 4, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text));

            }
            catch
            {
            }
            // dopasowanie opisów
            makeLabels();
            GridView1.DataBind();
            GridView2.DataBind();
            GridView3.DataBind();



            try
            {
                Label11.Visible = cl.debug(int.Parse(yyx));
            }
            catch
            {
                Label11.Visible = false;
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
            //  makeHeader2(sn, dT_01);
            #endregion


            #region tabela  2 ()

            dT_02.Clear();

            dT_02.Rows.Add(new Object[] { "1", "6-12 m-cy", "1", "1", "v" });//
            dT_02.Rows.Add(new Object[] { "1", "pow 12 m-cy", "1", "1", "v" });//
            dT_02.Rows.Add(new Object[] { "1", "rozprawy", "1", "1", "v" });//
            dT_02.Rows.Add(new Object[] { "1", "posiedzenia", "1", "1", "v" });//
            dT_02.Rows.Add(new Object[] { "1", "rozwody", "1", "1", "v" });//
            dT_02.Rows.Add(new Object[] { "1", "separacje", "1", "1", "v" });//
            dT_02.Rows.Add(new Object[] { "1", "pozostałe", "1", "1", "v" });//
            dT_02.Rows.Add(new Object[] { "1", "separacje", "1", "1", "v" });//
            dT_02.Rows.Add(new Object[] { "1", "inne", "1", "1", "v" });//
            dT_02.Rows.Add(new Object[] { "1", "rozwody", "1", "1", "v" });//
            dT_02.Rows.Add(new Object[] { "1", "separacje", "1", "1", "v" });//
            dT_02.Rows.Add(new Object[] { "1", "pozostałe", "1", "1", "v" });//
            dT_02.Rows.Add(new Object[] { "1", "separacje", "1", "1", "v" });//
            dT_02.Rows.Add(new Object[] { "1", "inne", "1", "1", "v" });//


            dT_02.Rows.Add(new Object[] { "2", "ogółem", "1", "2", "v" });//
            dT_02.Rows.Add(new Object[] { "2", "W tym spraw starych", "2", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "2", "C", "3", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "2", "Ns", "2", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "2", "Co", "1", "2", "h" });//
            dT_02.Rows.Add(new Object[] { "2", "CG-G", "1", "2", "h" });//
            dT_02.Rows.Add(new Object[] { "2", "Ns-Rej", "1", "2", "h" });//
            dT_02.Rows.Add(new Object[] { "2", "RAZEM (r.6.11)", "1", "2", "v" });//
            dT_02.Rows.Add(new Object[] { "2", "Ogółem odroczono spraw", "1", "2", "v" });//
            dT_02.Rows.Add(new Object[] { "2", "% odroczeń", "1", "2", "v" });//
            dT_02.Rows.Add(new Object[] { "2", "w tym ilość odroczeń publikacji orzeczeń", "1", "2", "v" });//
            dT_02.Rows.Add(new Object[] { "2", "C", "3", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "2", "Ns", "2", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "2", "Nc", "1", "2", "h" });//
            dT_02.Rows.Add(new Object[] { "2", "Co", "1", "2", "h" });//
            dT_02.Rows.Add(new Object[] { "2", "CG-G", "1", "2", "h" });//;
            dT_02.Rows.Add(new Object[] { "2", "Ns-Rej", "1", "2", "h" });//
            dT_02.Rows.Add(new Object[] { "2", "WSC", "1", "2", "h" });//
            dT_02.Rows.Add(new Object[] { "2", "RAZEM (r.16.23)", "1", "2", "v" });//
            dT_02.Rows.Add(new Object[] { "3", "L.p.", "1", "3", "h" });//
            dT_02.Rows.Add(new Object[] { "3", "Imię i Nazwisko", "1", "3", "h" });//
            dT_02.Rows.Add(new Object[] { "3", "Ilość spraw <br/>w referacie <br/>(na koniec okresu stat.)", "3", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "3", "Liczba wyznaczonych sesji - wokandy", "2", "2", "h" });//
            dT_02.Rows.Add(new Object[] { "3", "Liczba wyznaczonych spraw na rozprawę", "9", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "3", "Ilość odroczeń", "3", "1", "h" });//

            dT_02.Rows.Add(new Object[] { "3", "Liczba wyznaczonych spraw na posiedzenie", "11", "1", "h" });//
            dT_02.Rows.Add(new Object[] { "3", "Wyznaczono spraw ogólem", "1", "3", "h" });//




            Session["header_02"] = dT_02;
            //  makeHeader1(sn, dT_02);


            #endregion
            #region tabela  3 ()

            dT_03.Clear();

            dT_03.Rows.Add(new Object[] { "1", "rozprawy", "1", "1", "v" });
            dT_03.Rows.Add(new Object[] { "1", "posiedzenia", "1", "1", "v" });
            dT_03.Rows.Add(new Object[] { "1", "rozwody", "1", "1", "v" });
            dT_03.Rows.Add(new Object[] { "1", "separacje", "1", "1", "v" });
            dT_03.Rows.Add(new Object[] { "1", "pozostałe", "1", "1", "v" });
            dT_03.Rows.Add(new Object[] { "1", "separacje", "1", "1", "v" });
            dT_03.Rows.Add(new Object[] { "1", "inne", "1", "1", "v" });
            dT_03.Rows.Add(new Object[] { "1", "rozwody", "1", "1", "v" });
            dT_03.Rows.Add(new Object[] { "1", "separacje", "1", "1", "v" });
            dT_03.Rows.Add(new Object[] { "1", "pozostałe", "1", "1", "v" });
            dT_03.Rows.Add(new Object[] { "1", "separacje", "1", "1", "v" });
            dT_03.Rows.Add(new Object[] { "1", "inne", "1", "1", "v" });


            dT_03.Rows.Add(new Object[] { "2", "C", "3", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Ns", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Co", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "1", "CG-G", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "1", "Ns-Rej.", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "1", "RAZEM (r.3-8)", "1", "2", "v" });

            dT_03.Rows.Add(new Object[] { "2", "C", "3", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Ns", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Co", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Nc", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "CG-G", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Ns-Rej.", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "WSC", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "RAZEM (r.3-8)", "1", "2", "v" });



            dT_03.Rows.Add(new Object[] { "3", "L.p.", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Imię i Nazwisko", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Liczba odbytych sesji - wokandy", "2", "2", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Liczba załatwionych spraw na rozprawie", "9", "1", "h" });
            dT_03.Rows.Add(new Object[] { "3", "wyrok, postan., kończ. postę.", "1", "3", "v" });
            dT_03.Rows.Add(new Object[] { "3", "wyroki zaoczne", "1", "3", "v" });
            dT_03.Rows.Add(new Object[] { "3", "ugody", "1", "3", "v" });
            dT_03.Rows.Add(new Object[] { "3", "inne", "1", "3", "v" });
            dT_03.Rows.Add(new Object[] { "3", "Liczba załatwionych spraw na posiedzeniach", "11", "1", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Załatwiono spraw ogółem (r.9+22)", "1", "3", "v" });






            Session["header_03"] = dT_03;
            //  makeHeader3(sn, dT_03);
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

            dT_04.Rows.Add(new Object[] { "2", "ilość sporządzonych uzasadnień ogółem", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "w  terminie ustawowym", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "po upływie terminu ustawowego", "12", "1" });



            dT_04.Rows.Add(new Object[] { "3", "L.p.", "1", "3" });
            dT_04.Rows.Add(new Object[] { "3", "Nazwisko i imię sędziego", "1", "3" });
            dT_04.Rows.Add(new Object[] { "3", "Terminowość sporządzania uzasadnień", "14", "1" });
            dT_04.Rows.Add(new Object[] { "3", "Uzasadnienie wygłoszone art. 328 par. 1 kpc", "1", "3" });
            dT_04.Rows.Add(new Object[] { "3", "Liczba wniosków o trankrypcje uzasadnień wygłoszonych w trybie art.. 328 par. 1 kpc", "1", "3", "v" });
            dT_04.Rows.Add(new Object[] { "3", "zaległe uzasadnienia nie sporządzone mimo upływu terminu", "4", "2", "h" });
            dT_04.Rows.Add(new Object[] { "3", "liczba spraw, w których niewniesiono środka zaskażenia ", "2", "2", "h" });
            dT_04.Rows.Add(new Object[] { "3", "liczba dni nieobecności w pracy (zwolnienia, urlopy…) ", "1", "3", "h" });

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

        protected void grvMergeHeader_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                GridView HeaderGrid = (GridView)sender;
                GridViewRow HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
                HeaderGridRow.Font.Size = 7;
                HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
                HeaderGridRow.VerticalAlign = VerticalAlign.Top;
                TableCell HeaderCell = new TableCell();

                HeaderCell = new TableCell();
                HeaderCell.Text = "Opmk";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Nwk";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Alk";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Razem";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Opmk";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Nwk";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Alk";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Razem";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Nwo";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Op, Opk- <br/>(wykonano z ubr)";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "– udział w<br/> spotkaniach";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Razem";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);




                HeaderCell = new TableCell();
                HeaderCell.Text = "Nadzory <br/> własne";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Nadzory <br/>powierz.";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Sprawy<br/>Inne";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                ////  drugi wiersz

                HeaderGrid = (GridView)sender;
                HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
                HeaderGridRow.Font.Size = 7;
                HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
                HeaderGridRow.VerticalAlign = VerticalAlign.Top;

                HeaderCell = new TableCell();
                HeaderCell.Text = "L.p.";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);



                HeaderCell = new TableCell();
                HeaderCell.Text = "Imię i nazwisko";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Nadzory własne od 15 do 25 (standardy)";
                HeaderCell.ColumnSpan = 4;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Nadzory powierzone od 20 do 40(standardy)";
                HeaderCell.ColumnSpan = 4;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Razem nadzory";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 2;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Inne sprawy do 50 (standardy)";
                HeaderCell.ColumnSpan = 4;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Łączna ilość spraw do 100 (standardy)";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "w tym własnych do 50 (standardy)";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Sprawy zawieszone (w tym)";
                HeaderCell.ColumnSpan = 3;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


            }
        }

        protected void GridView3_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {


                GridView HeaderGrid = (GridView)sender;
                GridViewRow HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
                HeaderGridRow.Font.Size = 7;
                HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
                HeaderGridRow.VerticalAlign = VerticalAlign.Top;
                TableCell HeaderCell = new TableCell();


                HeaderCell = new TableCell();
                HeaderCell.Text = "Nkd";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView3.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "o rozwód lub sep.";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView3.Controls[0].Controls.AddAt(0, HeaderGridRow);
                // drugi wiersz


                HeaderGrid = (GridView)sender;
                HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
                HeaderGridRow.Font.Size = 7;
                HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
                HeaderGridRow.VerticalAlign = VerticalAlign.Top;
                HeaderCell = new TableCell();


                HeaderCell = new TableCell();
                HeaderCell.Text = "Ogółem we wszystkich fazach postępowania";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView3.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Ogółem w postępowaniu rozpoznawczym";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView3.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "W tym";
                HeaderCell.ColumnSpan = 2;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView3.Controls[0].Controls.AddAt(0, HeaderGridRow);


                HeaderCell = new TableCell();
                HeaderCell.Text = "w postępowaniu wykonawczym";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView3.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Wywiady kontrolne";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView3.Controls[0].Controls.AddAt(0, HeaderGridRow);



                ////  trzeci wiersz

                HeaderGrid = (GridView)sender;
                HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
                HeaderGridRow.Font.Size = 7;
                HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
                HeaderGridRow.VerticalAlign = VerticalAlign.Top;

                HeaderCell = new TableCell();
                HeaderCell.Text = "L.p.";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView3.Controls[0].Controls.AddAt(0, HeaderGridRow);



                HeaderCell = new TableCell();
                HeaderCell.Text = "Imię i nazwisko kuratora";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView3.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Wywiady";
                HeaderCell.ColumnSpan = 6;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView3.Controls[0].Controls.AddAt(0, HeaderGridRow);


            }
        }


        protected void GridView2_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {


                GridView HeaderGrid = (GridView)sender;
                GridViewRow HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
                HeaderGridRow.Font.Size = 7;
                HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
                HeaderGridRow.VerticalAlign = VerticalAlign.Top;
                TableCell HeaderCell = new TableCell();


                HeaderCell = new TableCell();
                HeaderCell.Text = "Nkd";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "o rozwód lub sep.";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow);
                // drugi wiersz


                HeaderGrid = (GridView)sender;
                HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
                HeaderGridRow.Font.Size = 7;
                HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
                HeaderGridRow.VerticalAlign = VerticalAlign.Top;
                HeaderCell = new TableCell();


                HeaderCell = new TableCell();
                HeaderCell.Text = "Ogółem we wszystkich fazach postępowania";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Ogółem w postępowaniu rozpoznawczym";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "W tym";
                HeaderCell.ColumnSpan = 2;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow);


                HeaderCell = new TableCell();
                HeaderCell.Text = "w postępowaniu wykonawczym";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Wywiady kontrolne";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow);



                ////  trzeci wiersz

                HeaderGrid = (GridView)sender;
                HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
                HeaderGridRow.Font.Size = 7;
                HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
                HeaderGridRow.VerticalAlign = VerticalAlign.Top;

                HeaderCell = new TableCell();
                HeaderCell.Text = "L.p.";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow);



                HeaderCell = new TableCell();
                HeaderCell.Text = "Imię i nazwisko kuratora";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Wywiady";
                HeaderCell.ColumnSpan = 6;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow);


            }
        }

        #endregion "nagłowki tabel"

        #region "obsługa oncommand  tabel z nazwiskami"





        #endregion "obsługa oncommand  tabel z nazwiskami"


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

                Label29.Text = DateTime.Now.ToLongDateString();
                try
                {
                    Label30.Text = System.IO.File.ReadAllText(Server.MapPath(@"~//version.txt")).ToString().Trim();
                }
                catch
                { }
                Label28.Text = cl.podajUzytkownika(User_id, domain);

                string strMonthName = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(DateTime.Parse(Date2.Text).Month);
                int last_day = DateTime.DaysInMonth(DateTime.Parse(Date2.Text).Year, DateTime.Parse(Date2.Text).Month);
                if ((DateTime.Parse (Date1.Text).Day == 1) && (DateTime.Parse(Date2.Text).Day == last_day) && (DateTime.Parse (Date1.Text).Month == DateTime.Parse(Date2.Text).Month))
                {
                    // cały miesiąc
                    Label17.Text = "Obciążenia kuratorów wywiadami zleconymi za miesiąc " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.  (Obliczenia wg daty wpływu)";
                    Label19.Text = "Obciążenia kuratorów zawodowych wg. standardów. Stan na dzień :" + DateTime.Parse(Date2.Text).ToLongDateString();
                    //Stan referatów sędziów na koniec miesiąca
                    Label27.Text = "za miesiąc:  " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    Label2.Text = "Obciążenia kuratorów wywiadami zleconymi za miesiąc " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.  (Obliczenia wg daty zamknięcia)";


                }
                else
                {
                    Label17.Text = "Obciążenia kuratorów wywiadami zleconymi za okres od " + Date1.Text + " do  " + Date2.Text + " roku.  (Obliczenia wg daty wpływu)";
                    Label19.Text = "Obciążenia kuratorów zawodowych wg. standardów. Stan na dzień :" + DateTime.Parse(Date2.Text).ToLongDateString();
                    Label27.Text = "za okres od:  " + Date1.Text + " do  " + Date2.Text;
                    Label2.Text = "Obciążenia kuratorów wywiadami zleconymi za okres od " + Date1.Text + " do  " + Date2.Text + " roku.  (Obliczenia wg daty zamknięcia)";



                }
            }
            catch
            {

            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "print2", "JavaScript: window.print();", true);
            // ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "print", "window.open('raport_01_print.aspx', '')", true);
        }

        protected void tworzPlikExcel(object sender, EventArgs e)
        {

            // execel begin
            string filename = "statystykiWydzialCywilny.xls";
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", string.Format("attachment;filename={0}", filename));

            Response.Clear();

            InitializeWorkbook();
            generate_my_data();
            Response.BinaryWrite(WriteToStream().GetBuffer());

            Response.End();
        }




        private void InitializeWorkbook()
        {
            hssfworkbook = new HSSFWorkbook();

            SummaryInformation si = PropertySetFactory.CreateSummaryInformation();
            si.Subject = "";
            si.Title = "statystyki";
            hssfworkbook.SummaryInformation = si;
        }



        private MemoryStream WriteToStream()
        {
            //Write the stream data of workbook to the root directory
            MemoryStream file = new MemoryStream();

            hssfworkbook.Write(file);
            return file;
        }

        private void generate_my_data()
        {
            ISheet sheet0 = hssfworkbook.CreateSheet("Ruch spraw");


            //	DataView view = (DataView)dane_do_tabeli_1.Select(DataSourceSelectArguments.Empty);

            //	DataTable table = view.ToTable();




            IRow row0 = sheet0.CreateRow(0);
            //	table.TableName = "Załatwienia";
            //	table.Columns.Remove("id_");

            row0.CreateCell(0).SetCellValue("Opis");
            row0.CreateCell(1).SetCellValue("Sprawy według repetoriów i wykazów");

            var crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 0, 0);
            sheet0.AddMergedRegion(crs);
            crs = new NPOI.SS.Util.CellRangeAddress(0, 0, 1, 8);
            sheet0.AddMergedRegion(crs);



            row0 = sheet0.CreateRow(1);

            row0.CreateCell(1).SetCellValue("C");
            row0.CreateCell(2).SetCellValue("CG-G");
            row0.CreateCell(3).SetCellValue("Ns");
            row0.CreateCell(4).SetCellValue("Nc");
            row0.CreateCell(5).SetCellValue("Co");
            row0.CreateCell(6).SetCellValue("Cps");

            row0.CreateCell(7).SetCellValue("WSC");
            row0.CreateCell(8).SetCellValue("Łącznie");

          
            // druga tabela
            DataView view = (DataView)statystyki.Select(DataSourceSelectArguments.Empty);
            DataTable table = view.ToTable();
            table = view.ToTable();

            table = view.ToTable();
            table.TableName = "Załatwienia";
            table.Columns.Remove("ident");
            table.Columns.Remove("sesja");
            table.Columns.Remove("id_sedziego");
            table.Columns.Remove("id_tabeli");
            table.Columns.Remove("id_dzialu");
            //table.Columns.Remove("d_13");
            table.Columns.Remove("d_14");
            table.Columns.Remove("d_15");
            table.Columns.Remove("d_16");
            table.Columns.Remove("d_17");
            table.Columns.Remove("d_18");
            table.Columns.Remove("d_19");
            table.Columns.Remove("d_20");
            table.Columns.Remove("d_21");
            table.Columns.Remove("d_22");
            //
            //robienie
            int ro = 2;

            //-----------------

            IDataFormat format = hssfworkbook.CreateDataFormat();

            //-----------------

            ISheet sheet1 = hssfworkbook.CreateSheet("Załatwienia");

            IRow row2 = sheet1.CreateRow(0);
            row2.CreateCell(0).SetCellValue("L.p.");
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 0, 0);
            sheet1.AddMergedRegion(crs);

            row2.CreateCell(1).SetCellValue("Nazwisko");
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 1, 1);
            sheet1.AddMergedRegion(crs);

            row2.CreateCell(2).SetCellValue("Imię");
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 2, 2);
            sheet1.AddMergedRegion(crs);

            row2.CreateCell(3).SetCellValue("Funkcja");
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 3, 3);
            sheet1.AddMergedRegion(crs);

            row2.CreateCell(4).SetCellValue("Stanowisko");
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 4, 4);
            sheet1.AddMergedRegion(crs);

            row2.CreateCell(5).SetCellValue("Liczba sesji");
            crs = new NPOI.SS.Util.CellRangeAddress(0, 0, 5, 6);

            sheet1.AddMergedRegion(crs);

            row2.CreateCell(7).SetCellValue("Załatwienia");
            crs = new NPOI.SS.Util.CellRangeAddress(0, 0, 7, 14);
            sheet1.AddMergedRegion(crs);

            row2.CreateCell(15).SetCellValue("Il. sporządzonych uzasadnień");
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 15, 15);
            sheet1.AddMergedRegion(crs);

            row2.CreateCell(16).SetCellValue("Nieobecności");
            crs = new NPOI.SS.Util.CellRangeAddress(0, 0, 16, 17);
            sheet1.AddMergedRegion(crs);

            row2 = sheet1.CreateRow(1);

            row2.CreateCell(5).SetCellValue("rozprawy");
            row2.CreateCell(6).SetCellValue("posiedzenia");
            row2.CreateCell(7).SetCellValue("C");
            row2.CreateCell(8).SetCellValue("C-GC");
            row2.CreateCell(9).SetCellValue("Ns");
            row2.CreateCell(10).SetCellValue("Nc");
            row2.CreateCell(11).SetCellValue("Co");
            row2.CreateCell(12).SetCellValue("Cps");
            row2.CreateCell(13).SetCellValue("WSC");
            row2.CreateCell(14).SetCellValue("Razem");
            row2.CreateCell(16).SetCellValue("Urlopy");
            row2.CreateCell(17).SetCellValue("Zwolnienia");

            foreach (DataRow rowik in table.Rows)
            {
                row2 = sheet1.CreateRow(ro);
                for (int i = 0; i < rowik.ItemArray.Length; i++)
                {
                    try
                    {
                        int ji = int.Parse(rowik[i].ToString().Trim());
                        ICellStyle cellStyle = hssfworkbook.CreateCellStyle();
                        cellStyle.DataFormat = HSSFDataFormat.GetBuiltinFormat("0");
                        row2.CreateCell(i).SetCellValue(ji);
                        row2.Cells[i].CellStyle = cellStyle;
                    }
                    catch (Exception)
                    {
                        row2.CreateCell(i).SetCellValue(rowik[i].ToString().Trim());
                    }
                }
                ro++;
            }// end foreach
             // trzeci sheet

            view = (DataView)tabela_3.Select(DataSourceSelectArguments.Empty);

            table = view.ToTable();

            table.Columns.Remove("ident");
            table.Columns.Remove("sesja");
            table.Columns.Remove("id_sedziego");
            table.Columns.Remove("id_tabeli");
            table.Columns.Remove("id_dzialu");
            table.Columns.Remove("d_10");
            table.Columns.Remove("d_11");
            table.Columns.Remove("d_12");
            table.Columns.Remove("d_13");
            table.Columns.Remove("d_14");
            table.Columns.Remove("d_15");
            table.Columns.Remove("d_16");
            table.Columns.Remove("d_17");
            table.Columns.Remove("d_18");
            table.Columns.Remove("d_19");
            table.Columns.Remove("d_20");
            table.Columns.Remove("d_21");
            table.Columns.Remove("d_22");

            sheet1.AutoSizeColumn(0, true);
            sheet1.AutoSizeColumn(1, true);

            ISheet sheet2 = hssfworkbook.CreateSheet("Wyznaczenia");

            row2 = sheet2.CreateRow(0);
            row2.CreateCell(0).SetCellValue("L.p.");
            row2.CreateCell(1).SetCellValue("Nazwisko");
            row2.CreateCell(2).SetCellValue("Imię");
            row2.CreateCell(3).SetCellValue("Funkcja");
            row2.CreateCell(4).SetCellValue("Stanowisko");

            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 0, 0);
            sheet2.AddMergedRegion(crs);
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 1, 1);
            sheet2.AddMergedRegion(crs);
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 2, 2);
            sheet2.AddMergedRegion(crs);
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 3, 3);
            sheet2.AddMergedRegion(crs);
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 4, 4);
            sheet2.AddMergedRegion(crs);

            row2.CreateCell(5).SetCellValue("Wyznaczenia");
            crs = new NPOI.SS.Util.CellRangeAddress(0, 0, 5, 12);
            sheet2.AddMergedRegion(crs);

            row2 = sheet2.CreateRow(1);

            row2.CreateCell(5).SetCellValue("C");
            row2.CreateCell(6).SetCellValue("C-GC");
            row2.CreateCell(7).SetCellValue("Ns");
            row2.CreateCell(8).SetCellValue("Nc");
            row2.CreateCell(9).SetCellValue("Co");
            row2.CreateCell(10).SetCellValue("Cps");
            row2.CreateCell(11).SetCellValue("WSC");
            row2.CreateCell(12).SetCellValue("Razem");
            row2.CreateCell(13).SetCellValue("Odroczenia liczba spraw odroczonych");
            ro = 2;

            foreach (DataRow rowik in table.Rows)
            {
                row2 = sheet2.CreateRow(ro);
                for (int i = 0; i < rowik.ItemArray.Length; i++)
                {
                    try
                    {
                        int ji = int.Parse(rowik[i].ToString().Trim());
                        ICellStyle cellStyle = hssfworkbook.CreateCellStyle();
                        cellStyle.DataFormat = HSSFDataFormat.GetBuiltinFormat("0");
                        row2.CreateCell(i).SetCellValue(ji);
                        row2.Cells[i].CellStyle = cellStyle;
                    }
                    catch (Exception)
                    {
                        row2.CreateCell(i).SetCellValue(rowik[i].ToString().Trim());
                    }
                }
                ro++;
            }// end foreach

            // czwarty sheet


        }

        protected void LinkButton54_Click(object sender, EventArgs e)
        {
            odswiez();
        }

        protected void LinkButton55_Click(object sender, EventArgs e)
        {
            makeLabels();
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "print2", "JavaScript: window.print();", true);
            makeLabels();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {

                DataView view = (DataView)statystyki.Select(DataSourceSelectArguments.Empty);

                DataTable table = view.ToTable();
                object sumObject;
                e.Row.Cells[1].Text = "Razem";
                for (int i = 1; i < 21; i++)
                {
                    string txt = "d_";
                    string digit = i.ToString("D2");
                    txt = txt + digit;
                    sumObject = table.Compute("Sum(" + txt + ")", "");
                    try
                    {
                        e.Row.Cells[1 + i].Text = sumObject.ToString();
                    }
                    catch (Exception)
                    { }

                }

            }
        }

        protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)

            {


                DataView view = (DataView)tabela_3.Select(DataSourceSelectArguments.Empty);

                DataTable table = view.ToTable();
                object sumObject;
                e.Row.Cells[1].Text = "Razem";
                for (int i = 1; i < 21; i++)
                {
                    string txt = "d_";
                    string digit = i.ToString("D2");
                    txt = txt + digit;
                    sumObject = table.Compute("Sum(" + txt + ")", "");
                    try
                    {
                        e.Row.Cells[1 + i].Text = sumObject.ToString();
                    }
                    catch (Exception)
                    {


                    }

                }

            }
        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)

            {


                DataView view = (DataView)tabela4.Select(DataSourceSelectArguments.Empty);

                DataTable table = view.ToTable();
                object sumObject;
                e.Row.Cells[1].Text = "Razem";
                for (int i = 1; i < 15; i++)
                {
                    string txt = "d_";
                    string digit = i.ToString("D2");
                    txt = txt + digit;
                    sumObject = table.Compute("Sum(" + txt + ")", "");
                    try
                    {
                        e.Row.Cells[1 + i].Text = sumObject.ToString();
                    }
                    catch (Exception)
                    {


                    }

                }

            }
        }
    }
}