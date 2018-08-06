using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using OfficeOpenXml;

namespace stat2018
{
    public partial class oglc2 : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tabela = new tabele();
        public dataReaders dr = new dataReaders();
        const string tenPlik = "oglc2.aspx";


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
            makeHeaders();
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
                    }
                }
                przemiel();
                makeLabels();
            }
            catch (Exception ex)
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
            Session["sesja"] = "s3030";
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
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 2");

                DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), (string)Session["id_dzialu"], 2,20,20,tenPlik);
                Session["tabelka001"] = tabelka01;

            }
            catch (Exception ex)
            {
                
            }
            try
            {

                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 1");
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 1, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text));


                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 3");

                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 3, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text));

                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 4");
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 4, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text));
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);

            }
            try
                {

                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 5");
                DataTable tabelka04 = dr.generuj_dane_do_tabeli_wierszy2018(DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), (string)Session["id_dzialu"], 5,20,20,tenPlik);
                Session["tabelka004"] = tabelka04;
                
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 6");
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 6, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text));

               
                tab_04_w01_c01.Text = tabelka04.Rows[0][1].ToString().Trim();
                tab_04_w01_c2.Text = tabelka04.Rows[0][2].ToString().Trim();
                tab_04_w01_c3.Text = tabelka04.Rows[0][3].ToString().Trim();
                tab_04_w01_c4.Text = tabelka04.Rows[0][4].ToString().Trim();
                tab_04_w01_c5.Text = tabelka04.Rows[0][5].ToString().Trim();
                tab_04_w01_c6.Text = tabelka04.Rows[0][6].ToString().Trim();
                tab_04_w01_c7.Text = tabelka04.Rows[0][7].ToString().Trim();
                

                // wypełnianie danych labeli
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " +ex.Message );
            }

            // dopasowanie opisów
            makeLabels();

            GridView1.DataBind();
            GridView2.DataBind();
            GridView3.DataBind();
           

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
        protected void makeHeaders()
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
            dT_01.Rows.Add(new Object[] { "1", "Cgg", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Ns", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Co", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Nc", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Cps", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "WSC", "1", "1" });
          

            dT_01.Rows.Add(new Object[] { "2", "L.p.", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "Referendarz sądowy", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "Pozostałość na </br>początek okresu</br> kontrolnego", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "Wpływ.", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "Średni miesięczny wpływ (w faktycznym czasie pracy)", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "Efektywny</br> czas</br> pracy ", "1", "2" });

            dT_01.Rows.Add(new Object[] { "2", "Ilość posiedzeń", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "Ilość wyznaczonych spraw", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "Załatwienia kończące postępowanie / niekończące postępowania", "7", "1" });
            dT_01.Rows.Add(new Object[] { "2", "Razem", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "Średnio miesięcznie razem", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "Pozostałości na koniec okresu kontrolnego", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "Wielokrotna", "1", "2" });

            dT_01.Rows.Add(new Object[] { "3", "Wydajność referendarzy sądowych orzekających w Wydziale ( w oreksach odpowiednio ja wyżej)", "19", "1" });

            Session["header_01"] = dT_01;

            #endregion


            #region tabela  2 ()

            dT_02.Clear();


            dT_02.Rows.Add(new Object[] { "1", "L.p.", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "Sędzia / referendarz", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "Od 3 do 5 lat", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "w tym zawieszone", "1", "1", "h", "60" });//

            dT_02.Rows.Add(new Object[] { "1", "Od 5 do 8 lat", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "w tym zawieszone", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "powyżej  8 lat", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "w tym zawieszone", "1", "1", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "1", "Razem", "1", "1", "h", "60" });//
            


            dT_02.Rows.Add(new Object[] { "2", "Ilość spraw cywilnych w których postępowanie toczy się powyżej 3 lat (na koniec września i marca kolejnych lat ):", "10", "1", "h" });
          


            Session["header_02"] = dT_02;



            #endregion
            #region tabela  3 ()

            dT_03.Clear();


            for (int i = 0; i < 7; i++)
            {
                dT_03.Rows.Add(new Object[] { "1", "wpływ", "1", "1", "v" });
                dT_03.Rows.Add(new Object[] { "1", "pozostałość", "1", "1", "v" });
            }
           


         

            dT_03.Rows.Add(new Object[] { "2", "L.p.", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Sędzia /referendarz", "1", "2", "h" });

           

            dT_03.Rows.Add(new Object[] { "2", "C", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Cgg", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Ns", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Co", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Nc", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Cps", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Wsc", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Razem", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Razem pozostałości", "1", "2", "h", "60" });//


            dT_03.Rows.Add(new Object[] { "3", "Wielkość i stan referatów ( przy czym wielkość odpowiada liczbie spraw, które wpłyneły do referatu w okresie objętym notatką, a stan liczbę pozostałości).", "19", "1", "h" });


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

            dT_05.Rows.Add(new Object[] { "1", "1-14 dni", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "w tym nieusprawidliwione", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "15-30 dni", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "w tym nieusprawidliwione", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "pow. 1 do 3 mies.", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "w tym nieusprawidliwione", "1", "1", "h" });

            dT_05.Rows.Add(new Object[] { "1", "ponad 3 mies.", "1", "1", "h" });
            dT_05.Rows.Add(new Object[] { "1", "w tym nieusprawidliwione", "1", "1", "h" });
            
            dT_05.Rows.Add(new Object[] { "2", "Ogółem ", "1", "2", "H" });
            dT_05.Rows.Add(new Object[] { "2", "w terminie ustawowym", "1", "2", "H" });
            dT_05.Rows.Add(new Object[] { "2", "po upływie terminu ustalonego (czyli 14dni+)", "8", "1", "H" });
           

            dT_05.Rows.Add(new Object[] { "3", "Sędzia/referendarz", "1", "3", "H" });
            dT_05.Rows.Add(new Object[] { "3", "liczba sporządzonych uzasadnień", "10", "1", "H" });

            dT_05.Rows.Add(new Object[] { "4", "L.p.", "1", "4", "H" });

            dT_05.Rows.Add(new Object[] { "4", "Terminowość sporządzania uzasadnień", "11", "1", "H" });
            //
            Session["header_05"] = dT_05;

         
            #endregion

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



        protected void GridView5_RowCreated(object sender, GridViewRowEventArgs e)
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
                    lbTabela2Title.Text = "Wydajność sędziów orzekających w Wydziale za miesiąc " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    //Label2.Text= "Ewidencja spraw odroczonych  za miesiąc " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    Label15.Text = "Referendarze - sesje w miesiącu " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";


                }
                else
                {
                    tabela2Label.Text = "Sprawozdanie z ruchu spraw w za okres od " + Date1.Text + " do  " + Date2.Text;
                    lbTabela2Title.Text = "Wydajność sędziów orzekających w Wydziale za okres od" + Date1.Text + " do  " + Date2.Text;
                    //    Label2.Text = "Ewidencja spraw odroczonych za okres od " + Date1.Text + " do  " + Date2.Text;
                    Label15.Text = "Referendarze - sesje w okresie od " + Date1.Text + " do  " + Date2.Text;

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
            string path = Server.MapPath("Template") + "\\oglc2.xlsx";
            FileInfo existingFile = new FileInfo(path);

            string download = Server.MapPath("Template") + @"\oglc2";

            FileInfo fNewFile = new FileInfo(download + "_.xlsx");

            // pierwsza tabelka
            DataView view1 = (DataView)tabela_1.Select(DataSourceSelectArguments.Empty);

            DataTable table = view1.ToTable();

            


            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                // pierwsza

                int rowik = 0;


                ExcelWorksheet MyWorksheet1 = MyExcel.Workbook.Worksheets[1];
                try
                {
                    table.Columns.Remove("id");
                    table.Columns.Remove("id_sedziego");
                    table.Columns.Remove("stanowisko");
                    table.Columns.Remove("funkcja");
                    table.Columns.Remove("id_tabeli");

                }
                catch (Exception)
                {

                }
                MyWorksheet1 = tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], table, 19, 1, 4, false);
                rowik = table.Rows.Count-3;
                MyWorksheet1.Cells[rowik + 7, 1, rowik + 7, 4].Merge = true;
                MyWorksheet1.Cells[rowik + 7, 1].Value = "Zaległość z poprzedniego miesiąca";
                MyWorksheet1.Cells[rowik + 8, 1, rowik + 8, 4].Merge = true;
                MyWorksheet1.Cells[rowik + 8, 1].Value = "Wpływ";
                MyWorksheet1.Cells[rowik + 9, 1, rowik + 9, 4].Merge = true;
                MyWorksheet1.Cells[rowik + 9, 1].Value = "Wpływ";
                MyWorksheet1.Cells[rowik + 10, 1, rowik + 10, 4].Merge = true;
                MyWorksheet1.Cells[rowik + 10, 1].Value = "Załatwienia";
                MyWorksheet1.Cells[rowik + 11, 1, rowik + 11, 4].Merge = true;
                MyWorksheet1.Cells[rowik + 11, 1].Value = " Pozostało na następny miesiąc";
                MyWorksheet1.Cells[rowik + 12, 1, rowik + 17, 4].Merge = true;
                MyWorksheet1.Cells[rowik + 12, 1].Value = " Zaległość";
                MyWorksheet1.Cells[rowik + 12, 2].Value = " 0-3 miesiący";
                MyWorksheet1.Cells[rowik + 13, 2].Value = " 3-6 miesięcy";
                MyWorksheet1.Cells[rowik + 14, 2].Value = " 6-12 miesięcy";

                MyWorksheet1.Cells[rowik + 15, 2].Value = " 12-24 miesięcy (do 2 lat)";
                MyWorksheet1.Cells[rowik + 16, 2].Value = " 36-60 miesięcy (3-5 lat)";

                MyWorksheet1.Cells[rowik + 17, 2].Value = " Powyżej 60 miesięcy (powyżej 5 lat)";
                DataTable tabelka001 = (DataTable)Session["tabelka001"];




                foreach (DataRow dR in tabelka001.Rows)
                {
                    for (int i = 2; i < 18; i++)
                    {


                        try
                        {
                            MyWorksheet1.Cells[rowik + 7, i + 3].Value = double.Parse(dR[i - 1].ToString().Trim());
                        }
                        catch
                        {

                            MyWorksheet1.Cells[rowik + 7, i + 3].Value = dR[i - 1].ToString().Trim();
                        }

                        MyWorksheet1.Cells[rowik + 7, i + 3].Style.ShrinkToFit = true;
                        MyWorksheet1.Cells[rowik + 7, i + 3].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);


                    }
                    rowik++;
                }



                // trzecia 


                ExcelWorksheet MyWorksheet2 = MyExcel.Workbook.Worksheets[2];

                DataView view2 = (DataView)tabela_2.Select(DataSourceSelectArguments.Empty);

                DataTable table2 = view2.ToTable();
                table2.Columns.Remove("ident");
                table2.Columns.Remove("id_sedziego");
                table2.Columns.Remove("stanowisko");
                table2.Columns.Remove("funkcja");

                MyWorksheet2 = tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[2], table2, 9, 1, 3, false);

              
                // czwarta 




                ExcelWorksheet MyWorksheet5 = MyExcel.Workbook.Worksheets[3];
                DataView view4 = (DataView)tabela_3.Select(DataSourceSelectArguments.Empty);
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
                    for (int i = 3; i < 26; i++)
                    {
                        MyWorksheet5.Cells[rowik + 2, i].Style.ShrinkToFit = true;
                        MyWorksheet5.Cells[rowik + 2, i].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                        try
                        {
                            MyWorksheet5.Cells[rowik + 2, i].Value = double.Parse(dR[i].ToString().Trim());
                        }
                        catch (Exception)
                        {
                            MyWorksheet5.Cells[rowik + 2, i].Value = dR[i].ToString().Trim();
                        }
                    }
                    rowik++;
                }
                MyWorksheet5.Cells[rowik + 2, 1].Value = "Razem";
                for (int i = 3; i < 26; i++)
                {
                    object sumObject;
                    string txt = "d_";
                    string digit = i.ToString("D2");
                    txt = txt + digit;
                    sumObject = null;

                    try
                    {
                        MyWorksheet5.Cells[rowik + 2, i].Value = double.Parse(sumObject.ToString());
                    }
                    catch (Exception)
                    {
                        try
                        {
                            MyWorksheet5.Cells[rowik + 2, i].Value = sumObject.ToString();
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
            
        }
        
        
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = ((DataView)tabela_1.Select(DataSourceSelectArguments.Empty)).ToTable();

                tabela.makeSumRow(table, e);

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
                DataTable table = ((DataView)tabela_2.Select(DataSourceSelectArguments.Empty)).ToTable();
                tabela.makeSumRow(table, e);
            }
        }


        protected void GridView5_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = ((DataView)tabela_3.Select(DataSourceSelectArguments.Empty)).ToTable();
                tabela.makeSumRow(table, e);
            }
        }

        protected void GridView4_SelectedIndexChanged(object sender, EventArgs e)
        {

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

        protected void GridView4_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = ((DataView)Tabela_4.Select(DataSourceSelectArguments.Empty)).ToTable();
                tabela.makeSumRow(table, e);
            }
        }

        protected void GridView4_RowCreated1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_05"];
                tabela.makeHeader(sn, dT, GridView4);
            }
        }

        protected void GridView4_RowDataBound1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = ((DataView)Tabela_4.Select(DataSourceSelectArguments.Empty)).ToTable();
                tabela.makeSumRow(table, e);
            }
        }
    
    
    }
}