using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace stat2018
{
    public partial class okrc : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();

        private const string tenPlik = "okrc.aspx";

        private int storid = 0;
        private int rowIndex = 1;

        protected void Page_Load(object sender, EventArgs e)
        {
            string idWydzial = Request.QueryString["w"];
            try
            {
                if (idWydzial == null)
                {
                    return;
                }
                bool dost = cm.dostep(idWydzial, (string)Session["identyfikatorUzytkownika"]);
                if (!dost)
                {
                    Server.Transfer("default.aspx?info='Użytkownik " + (string)Session["identyfikatorUzytkownika"] + " nie praw do działu nr " + idWydzial + "'");
                }
                else
                {
                    CultureInfo newCulture = (CultureInfo)CultureInfo.CurrentCulture.Clone();
                    newCulture.DateTimeFormat = CultureInfo.GetCultureInfo("PL").DateTimeFormat;
                    System.Threading.Thread.CurrentThread.CurrentCulture = newCulture;
                    System.Threading.Thread.CurrentThread.CurrentUICulture = newCulture;
                    DateTime dTime = DateTime.Now.AddMonths(-1); ;

                    if (Date1.Text.Length == 0)
                    {
                        Date1.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-01");
                    }

                    if (Date2.Text.Length == 0)
                    {
                        Date2.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-" + DateTime.DaysInMonth(dTime.Year, dTime.Month).ToString("D2"));
                    }

                    Session["id_dzialu"] = idWydzial;
                    Session["data_1"] = Date1.Date.ToShortDateString();
                    Session["data_2"] = Date2.Date.ToShortDateString();

                    if (!IsPostBack)
                    {
                        var fileContents = System.IO.File.ReadAllText(Server.MapPath(@"~//version.txt"));    // file read with version
                        this.Title = "Statystyki " + fileContents.ToString().Trim();
                        clearHedersSession();
                        makeHeader();
                        przemiel();
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

        protected void przemiel()
        {
            string idDzialu = (string)Session["id_dzialu"];
            string txt = string.Empty;
            try
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 2");

                DataTable tabelka02 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 2, 11, 22, tenPlik);
                Session["tabelka002"] = tabelka02;

                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 1");

                DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2018(int.Parse(idDzialu), 1, Date1.Date, Date2.Date, 23, tenPlik);
                Session["tabelka001"] = tabelka01;
                GridView1.DataSourceID = null;
                GridView1.DataSource = null;
                GridView1.DataSource = tabelka01;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }

            // dopasowanie opisów
            makeLabels();

            try
            {
                Label11.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel2.Visible = cl.debug(int.Parse(idDzialu));
            }
            catch
            {
                Label11.Visible = false;
                infoLabel2.Visible = false;
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
            dT_01.Rows.Add(new Object[] { "1", "Meryto-<br>ryczne", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Stare", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Meryto-<br>ryczne", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Stare", "1", "1" });

            dT_01.Rows.Add(new Object[] { "2", "Razem", "1", "2" });

            dT_01.Rows.Add(new Object[] { "2", "w tym", "2", "1" });
            dT_01.Rows.Add(new Object[] { "2", "Razem", "1", "2" });

            dT_01.Rows.Add(new Object[] { "2", "w tym", "2", "1" });

            dT_01.Rows.Add(new Object[] { "3", "Urlopy", "1", "3" });
            dT_01.Rows.Add(new Object[] { "3", "Zwol<br/>-nienia", "1", "3" });
            dT_01.Rows.Add(new Object[] { "3", "Razem", "1", "3" });
            dT_01.Rows.Add(new Object[] { "3", "w terminie ustawowym", "1", "3" });
            dT_01.Rows.Add(new Object[] { "3", "po upływie terminu ustawowego", "1", "3" });
            dT_01.Rows.Add(new Object[] { "3", "w tym nieuspra-<br/>wiedliwione", "1", "3" });

            dT_01.Rows.Add(new Object[] { "3", "C", "3", "1" });
            dT_01.Rows.Add(new Object[] { "3", "Cgg", "1", "3" });
            dT_01.Rows.Add(new Object[] { "3", "Ns", "3", "1" });
            dT_01.Rows.Add(new Object[] { "3", "N", "1", "3" });

            dT_01.Rows.Add(new Object[] { "3", "Nc", "1", "3" });
            dT_01.Rows.Add(new Object[] { "3", "Co", "1", "3" });
            dT_01.Rows.Add(new Object[] { "3", "Cps", "1", "3" });
            dT_01.Rows.Add(new Object[] { "3", "WSC", "1", "3" });
            dT_01.Rows.Add(new Object[] { "3", "Razem", "1", "3" });

            //4
            dT_01.Rows.Add(new Object[] { "4", "L.p.", "1", "4" });
            dT_01.Rows.Add(new Object[] { "4", "Funkcja", "1", "4" });
            dT_01.Rows.Add(new Object[] { "4", "Stanowisko", "1", "4" });

            dT_01.Rows.Add(new Object[] { "4", "Imie i nazwisko", "1", "4" });

            dT_01.Rows.Add(new Object[] { "4", "Liczba sesji", "1", "4" });
            dT_01.Rows.Add(new Object[] { "4", "Etat ", "1", "4" });
            dT_01.Rows.Add(new Object[] { "4", "Nieobecność", "2", "1" });
            dT_01.Rows.Add(new Object[] { "4", "Terminowość sporządzania uzasadnień ", "4", "1" });
            dT_01.Rows.Add(new Object[] { "4", "Uzasadnienia <br/>wygłoszone ", "1", "4" });
            dT_01.Rows.Add(new Object[] { "4", "ZAŁATWIENIA ", "13", "1" });
            dT_01.Rows.Add(new Object[] { "4", "Uwagi ", "1", "4" });

            Session["header_01"] = dT_01;

            #endregion tabela  1 (wierszowa)

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
            dT_02.Rows.Add(new Object[] { "3", "Dni rozpraw", "1", "3", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "3", "ZAŁATWIENIA Sprawy rodzinne i nieletnich", "16", "1", "h", "45" });//

            Session["header_02"] = dT_02;

            #endregion tabela  2 ()

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

            #endregion tabela  3 ()

            #region tabela  4 ()

            dT_04.Clear();

            dT_04.Rows.Add(new Object[] { "1", "L.p.", "1", "1", "h" });
            dT_04.Rows.Add(new Object[] { "1", "Imię i nazwisko referendarza", "1", "1", "h" });
            dT_04.Rows.Add(new Object[] { "1", "Przydział orzeczniczy", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "Liczba odbytych sesji", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "Liczba odbytych posiedzeń", "1", "1", "h" });
            dT_04.Rows.Add(new Object[] { "1", "Razem", "1", "1" });
            Session["header_04"] = dT_04;

            #endregion tabela  4 ()

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

            #endregion tabela  5 ()
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

                string strMonthName = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(Date2.Date.Month);
                int last_day = DateTime.DaysInMonth(Date2.Date.Year, Date2.Date.Month);
                if (((Date1.Date.Day == 1) && (Date2.Date.Day == last_day)) && ((Date1.Date.Month == Date2.Date.Month)))
                {
                    // cały miesiąc
                    tabela2Label.Text = "Sprawozdanie z ruchu spraw w za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                }
                else
                {
                    tabela2Label.Text = "Sprawozdanie z ruchu spraw w za okres od " + Date1.Text + " do  " + Date2.Text;
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
            string path = Server.MapPath("Template") + "\\okrc.xlsx";
            FileInfo existingFile = new FileInfo(path);

            string download = Server.MapPath("Template") + @"\okrc";

            FileInfo fNewFile = new FileInfo(download + "_.xlsx");

            // pierwsza tabelka

            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                // pierwsza

                int rowik = 0;
                ExcelWorksheet MyWorksheet1 = MyExcel.Workbook.Worksheets[1];

                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], (DataTable)Session["tabelka001"], 27, 0, 10, true, false, true, true, true);

                rowik = ((DataTable)Session["tabelka001"]).Rows.Count + 3;

                // pod tabela z tebeli nr 2

                // obwodnia

                for (int row2 = rowik; row2 < rowik + 10; row2++)
                {
                    for (int i = 1; i < 29; i++)
                    {
                        MyWorksheet1.Cells[row2 + 7, i].Style.ShrinkToFit = true;
                        MyWorksheet1.Cells[row2 + 7, i].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                    }
                }
                //------------
                MyWorksheet1.Cells[rowik + 7, 1, rowik + 16, 3].Merge = true;
                MyWorksheet1.Cells[rowik + 7, 1].Value = " Zaległość";
                MyWorksheet1.Cells[rowik + 7, 4, rowik + 7, 14].Merge = true;
                MyWorksheet1.Cells[rowik + 7, 4].Value = "Zaległość z poprzedniego miesiąca";
                MyWorksheet1.Cells[rowik + 8, 4, rowik + 8, 14].Merge = true;
                MyWorksheet1.Cells[rowik + 8, 4].Value = "Wpływ";
                MyWorksheet1.Cells[rowik + 9, 4, rowik + 9, 14].Merge = true;
                MyWorksheet1.Cells[rowik + 9, 4].Value = "Załatwienia";
                MyWorksheet1.Cells[rowik + 10, 4, rowik + 10, 14].Merge = true;
                MyWorksheet1.Cells[rowik + 10, 4].Value = "Pozostało na następny miesiąc";
                MyWorksheet1.Cells[rowik + 11, 4, rowik + 11, 14].Merge = true;
                MyWorksheet1.Cells[rowik + 11, 4].Value = "powyżej 3-6 m-cy";
                MyWorksheet1.Cells[rowik + 12, 4, rowik + 12, 14].Merge = true;
                MyWorksheet1.Cells[rowik + 12, 4].Value = "powyżej 6-12 m-cy";
                MyWorksheet1.Cells[rowik + 13, 4, rowik + 13, 14].Merge = true;
                MyWorksheet1.Cells[rowik + 13, 4].Value = "ponad 12 miesięcy";
                MyWorksheet1.Cells[rowik + 14, 4, rowik + 16, 5].Merge = true;
                MyWorksheet1.Cells[rowik + 14, 4].Value = "w tym ";

                MyWorksheet1.Cells[rowik + 14, 6, rowik + 14, 14].Merge = true;
                MyWorksheet1.Cells[rowik + 14, 6].Value = "zawieszone";

                MyWorksheet1.Cells[rowik + 15, 6, rowik + 15, 14].Merge = true;
                MyWorksheet1.Cells[rowik + 15, 6].Value = "powyżej 3 do 5 lat";

                MyWorksheet1.Cells[rowik + 16, 6, rowik + 16, 14].Merge = true;
                MyWorksheet1.Cells[rowik + 16, 6].Value = "ponad 5 letnie";

                DataTable tabelka001 = (DataTable)Session["tabelka002"];

                for (int i = 0; i < 10; i++)

                {
                    // druga mesge 3
                    MyWorksheet1.Cells[rowik + 7 + i, 15, rowik + 7 + i, 17].Merge = true;
                    MyWorksheet1.Cells[rowik + 7 + i, 15].Value = tabelka001.Rows[i][1].ToString();
                    // druga kolumna pojedynacza
                    MyWorksheet1.Cells[rowik + 7 + i, 18].Value =  tabelka001.Rows[i][2].ToString();
                    MyWorksheet1.Cells[rowik + 7 + i, 19, rowik + 7 + i, 21].Merge = true;
                    MyWorksheet1.Cells[rowik + 7 + i, 19].Value = tabelka001.Rows[i+1][3].ToString();
                }

                for (int i = 0; i < 10; i++)
                {
                    for (int j = 0; j < 7; j++)
                    {
                        try
                        {
                            MyWorksheet1.Cells[rowik + 7 + i, j + 22].Value = tabelka001.Rows[i][j + 4].ToString();
                        }
                        catch
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
            przemiel();
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "print2", "JavaScript: window.print();", true);
            makeLabels();
        }

        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader((DataTable)Session["header_01"], GridView1);
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

        // podtabela
        private GridViewRow wierszTabelia3(DataTable tabelka01, int idWiersza, string idtabeli, string tekst)
        {
            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
            NewTotalRow.Cells.Add(tb.cela(tekst, 1, 7, "borderTopLeft  "));

            NewTotalRow.Cells.Add(tb.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!2!1!3')\">" + tabelka01.Rows[idWiersza - 1][1].ToString().Trim() + "</a>", 1, 3, "borderTopLeft"));
            NewTotalRow.Cells.Add(tb.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!2!2!3')\">" + tabelka01.Rows[idWiersza - 1][2].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));

            /*
            for (int i = 1; i < 5; i++)
            {
                NewTotalRow.Cells.Add(tb.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!2!" + i.ToString().Trim() + "!3')\">" + tabelka01.Rows[idWiersza-1][i].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            }
            */
            NewTotalRow.Cells.Add(tb.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!2!3!3')\">" + tabelka01.Rows[idWiersza - 1][3].ToString().Trim() + "</a>", 1, 3, "borderTopLeft"));
            //   NewTotalRow.Cells.Add(tb.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!2!6!3')\">" + tabelka01.Rows[idWiersza - 1][6].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            //   NewTotalRow.Cells.Add(tb.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!2!7!3')\">" + tabelka01.Rows[idWiersza - 1][7].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            //  NewTotalRow.Cells.Add(tb.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!2!8!3')\">" + tabelka01.Rows[idWiersza - 1][8].ToString().Trim() + "</a>", 1, 2, "borderTopLeft"));

            for (int i = 4; i <= 9; i++)
            {
                NewTotalRow.Cells.Add(tb.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!2!" + i.ToString().Trim() + "!3')\">" + tabelka01.Rows[idWiersza - 1][i].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            }
            NewTotalRow.Cells.Add(tb.cela("<input id = \"Text1\" type = \"text\" />", 1, 1, "borderTopLeft"));
            return NewTotalRow;
        }

        private GridViewRow wierszTabeli3(DataTable tabelka01, int idWiersza, string idtabeli, string tekst)
        {
            // nowy wiersz

            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
            NewTotalRow.Cells.Add(tb.cela("w tym", 3, 3, "borderTopLeft col_260"));
            NewTotalRow.Cells.Add(tb.cela(tekst, 1, 7, "borderTopLeft  "));

            NewTotalRow.Cells.Add(tb.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!2!1!3')\">" + tabelka01.Rows[idWiersza - 1][1].ToString().Trim() + "</a>", 1, 3, "borderTopLeft"));
            NewTotalRow.Cells.Add(tb.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!2!2!3')\">" + tabelka01.Rows[idWiersza - 1][2].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));

            /*
            for (int i = 1; i < 5; i++)
            {
                NewTotalRow.Cells.Add(tb.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!2!" + i.ToString().Trim() + "!3')\">" + tabelka01.Rows[idWiersza-1][i].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            }
            */
            NewTotalRow.Cells.Add(tb.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!2!3!3')\">" + tabelka01.Rows[idWiersza - 1][3].ToString().Trim() + "</a>", 1, 3, "borderTopLeft"));
            //   NewTotalRow.Cells.Add(tb.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!2!6!3')\">" + tabelka01.Rows[idWiersza - 1][6].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            //   NewTotalRow.Cells.Add(tb.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!2!7!3')\">" + tabelka01.Rows[idWiersza - 1][7].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            //  NewTotalRow.Cells.Add(tb.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!2!8!3')\">" + tabelka01.Rows[idWiersza - 1][8].ToString().Trim() + "</a>", 1, 2, "borderTopLeft"));

            for (int i = 4; i <= 9; i++)
            {
                NewTotalRow.Cells.Add(tb.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!2!" + i.ToString().Trim() + "!3')\">" + tabelka01.Rows[idWiersza - 1][i].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            }
            NewTotalRow.Cells.Add(tb.cela("<input id = \"Text1\" type = \"text\" />", 1, 1, "borderTopLeft"));
            return NewTotalRow;
        }

        private GridViewRow wierszTabeli2(DataTable tabelka01, int idWiersza, string idtabeli, string tekst)
        {
            // nowy wiersz

            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
            NewTotalRow.Cells.Add(tb.cela("zaległość", 10, 3, "borderTopLeft col_260"));
            NewTotalRow.Cells.Add(tb.cela(tekst, 1, 10, "borderTopLeft  "));

            NewTotalRow.Cells.Add(tb.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!2!1!3')\">" + tabelka01.Rows[idWiersza - 1][1].ToString().Trim() + "</a>", 1, 3, "borderTopLeft"));
            NewTotalRow.Cells.Add(tb.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!2!2!3')\">" + tabelka01.Rows[idWiersza - 1][2].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));

            /*
            for (int i = 1; i < 5; i++)
            {
                NewTotalRow.Cells.Add(tb.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!2!" + i.ToString().Trim() + "!3')\">" + tabelka01.Rows[idWiersza-1][i].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            }
            */
            NewTotalRow.Cells.Add(tb.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!2!3!3')\">" + tabelka01.Rows[idWiersza - 1][3].ToString().Trim() + "</a>", 1, 3, "borderTopLeft"));
            //   NewTotalRow.Cells.Add(tb.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!2!6!3')\">" + tabelka01.Rows[idWiersza - 1][6].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            //   NewTotalRow.Cells.Add(tb.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!2!7!3')\">" + tabelka01.Rows[idWiersza - 1][7].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            //  NewTotalRow.Cells.Add(tb.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!2!8!3')\">" + tabelka01.Rows[idWiersza - 1][8].ToString().Trim() + "</a>", 1, 2, "borderTopLeft"));

            for (int i = 4; i <= 9; i++)
            {
                NewTotalRow.Cells.Add(tb.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!2!" + i.ToString().Trim() + "!3')\">" + tabelka01.Rows[idWiersza - 1][i].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            }
            NewTotalRow.Cells.Add(tb.cela("<input id = \"Text1\" type = \"text\" />", 1, 1, "borderTopLeft"));
            return NewTotalRow;
        }

        private GridViewRow wierszTabelia2(DataTable tabelka01, int idWiersza, string idtabeli, string tekst)
        {
            // nowy wiersz

            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
            NewTotalRow.Cells.Add(tb.cela(tekst, 1, 10, "borderTopLeft  "));

            NewTotalRow.Cells.Add(tb.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!2!1!3')\">" + tabelka01.Rows[idWiersza - 1][1].ToString().Trim() + "</a>", 1, 3, "borderTopLeft"));
            NewTotalRow.Cells.Add(tb.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!2!2!3')\">" + tabelka01.Rows[idWiersza - 1][2].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));

            /*
            for (int i = 1; i < 5; i++)
            {
                NewTotalRow.Cells.Add(tb.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!2!" + i.ToString().Trim() + "!3')\">" + tabelka01.Rows[idWiersza-1][i].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            }
            */
            NewTotalRow.Cells.Add(tb.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!2!3!3')\">" + tabelka01.Rows[idWiersza - 1][3].ToString().Trim() + "</a>", 1, 3, "borderTopLeft"));
            //   NewTotalRow.Cells.Add(tb.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!2!6!3')\">" + tabelka01.Rows[idWiersza - 1][6].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            //   NewTotalRow.Cells.Add(tb.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!2!7!3')\">" + tabelka01.Rows[idWiersza - 1][7].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            //  NewTotalRow.Cells.Add(tb.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!2!8!3')\">" + tabelka01.Rows[idWiersza - 1][8].ToString().Trim() + "</a>", 1, 2, "borderTopLeft"));

            for (int i = 4; i <= 9; i++)
            {
                NewTotalRow.Cells.Add(tb.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!2!" + i.ToString().Trim() + "!3')\">" + tabelka01.Rows[idWiersza - 1][i].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            }
            NewTotalRow.Cells.Add(tb.cela("<input id = \"Text1\" type = \"text\" />", 1, 1, "borderTopLeft"));
            return NewTotalRow;
        }

        public void AddNewRow(object sender, GridViewRowEventArgs e)
        {
            DataTable tabelka01 = (DataTable)Session["tabelka002"];

            GridView GridView1 = (GridView)sender;
            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);

            string idtabeli = "2";

            // nowy wiersz
            int idWiersza = 1;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli2(tabelka01, idWiersza, idtabeli, "zaległości z poprzedniego miesiąca"));

            idWiersza = 2;

            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabelia2(tabelka01, idWiersza, idtabeli, "wpływ"));

            // nowy wiersz
            idWiersza = 3;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabelia2(tabelka01, idWiersza, idtabeli, "załatwienia"));

            // nowy wiersz
            idWiersza = 4;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabelia2(tabelka01, idWiersza, idtabeli, "pozostałość na pozostały miesiąc"));

            // nowy wiersz
            idWiersza = 5;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabelia2(tabelka01, idWiersza, idtabeli, "powyżej 3-6 m-cy"));

            // nowy wiersz
            idWiersza = 6;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabelia2(tabelka01, idWiersza, idtabeli, "powyżej 6-12 m-cy"));
            // nowy wiersz
            idWiersza = 7;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabelia2(tabelka01, idWiersza, idtabeli, "ponad 12 miesięcy"));

            // nowy wiersz
            idWiersza = 8;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli3(tabelka01, idWiersza, idtabeli, "zawieszone"));

            idWiersza = 9;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabelia3(tabelka01, idWiersza, idtabeli, "powyżej 3 do 5 lat"));
            //wierszTabelia3
            idWiersza = 10;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabelia3(tabelka01, idWiersza, idtabeli, "ponad 5 letnie"));
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
        }
    }
}