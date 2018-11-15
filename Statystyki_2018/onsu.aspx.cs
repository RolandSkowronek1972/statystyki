﻿using NPOI.HPSF;
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
    


    public partial class onsu : System.Web.UI.Page
    {

        public Class1 cl = new Class1();
        private HSSFWorkbook hssfworkbook;
        public common cm = new common();

        const string tenPlik = "onsu.aspx";
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

        protected void makeHeader()
        {

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

            DataTable dT_03 = new DataTable();
            dT_03.Columns.Clear();
            dT_03.Columns.Add("Column1", typeof(string));
            dT_03.Columns.Add("Column2", typeof(string));
            dT_03.Columns.Add("Column3", typeof(string));
            dT_03.Columns.Add("Column4", typeof(string));

            DataTable dT_04 = new DataTable();
            dT_04.Columns.Clear();
            dT_04.Columns.Add("Column1", typeof(string));
            dT_04.Columns.Add("Column2", typeof(string));
            dT_04.Columns.Add("Column3", typeof(string));
            dT_04.Columns.Add("Column4", typeof(string));

            DataTable dT_05 = new DataTable();
            dT_05.Columns.Clear();
            dT_05.Columns.Add("Column1", typeof(string));
            dT_05.Columns.Add("Column2", typeof(string));
            dT_05.Columns.Add("Column3", typeof(string));
            dT_05.Columns.Add("Column4", typeof(string));

            #region tabela  1 (wierszowa)



            System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();



            dT_01.Clear();
            dT_01.Rows.Add(new Object[] { "1", "GU bez ''of''", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "GU ''of''", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "GU Razem", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "GUp bez  '''of'", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "GUp ''of''", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "GN", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Gzd", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "GUo", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "GUn", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "GUz", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "GUk", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Łącznie", "1", "1" });
            dT_01.Rows.Add(new Object[] { "2", "Ruch spraw", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "sprawy wg. repertoriów lub wykazów", "13", "1" });
            Session["header_01"] = dT_01;

            #endregion
            #region tabela  2 ()

            dT_02.Clear();

            dT_02.Rows.Add(new Object[] { "1", "GU bez ''of''", "1", "1" });
            dT_02.Rows.Add(new Object[] { "1", "GU ''of''", "1", "1" });
            dT_02.Rows.Add(new Object[] { "1", "GU Razem", "1", "1" });
            dT_02.Rows.Add(new Object[] { "1", "GUp bez  '''of'", "1", "1" });
            dT_02.Rows.Add(new Object[] { "1", "GUp ''of''", "1", "1" });
            dT_02.Rows.Add(new Object[] { "1", "GN", "1", "1" });
            dT_02.Rows.Add(new Object[] { "1", "Gzd", "1", "1" });
            dT_02.Rows.Add(new Object[] { "1", "GUo", "1", "1" });
            dT_02.Rows.Add(new Object[] { "1", "GUn", "1", "1" });
            dT_02.Rows.Add(new Object[] { "1", "GUz", "1", "1" });
            dT_02.Rows.Add(new Object[] { "1", "GUk", "1", "1" });
            dT_02.Rows.Add(new Object[] { "1", "Łącznie", "1", "1" });
            dT_02.Rows.Add(new Object[] { "1", "W tym 3-6 miesięcy", "1", "1" });
            dT_02.Rows.Add(new Object[] { "1", "6-12 miesięcy", "1", "1" });
            dT_02.Rows.Add(new Object[] { "1", "Powyżej 12 miesięcy", "1", "1" });
            dT_02.Rows.Add(new Object[] { "1", "Powyżej 24 miesięcy", "1", "1" });
            dT_02.Rows.Add(new Object[] { "2", "L.p.", "1", "2" });
            dT_02.Rows.Add(new Object[] { "2", "Imię i Nazwisko", "1", "2" });
            dT_02.Rows.Add(new Object[] { "2", "Pozostało z ubiegłego miesiąca", "16", "1" });

            Session["header_02"] = dT_02;

            //  makeHeader1(sn, dT_02);
            #endregion
            #region tabela  3 ()

            dT_03.Clear();

            dT_03.Rows.Add(new Object[] { "1", "Za bieżący miesiąc", "1", "1" });
            dT_03.Rows.Add(new Object[] { "1", "Od początku roku do końca bieżącego miesiąca", "1", "1" });
            dT_03.Rows.Add(new Object[] { "2", "GU bez ,,of'", "1", "2" });
            dT_03.Rows.Add(new Object[] { "2", "GU ''of''", "1", "2" });
            dT_03.Rows.Add(new Object[] { "2", "GU Razem", "1", "2" });
            dT_03.Rows.Add(new Object[] { "2", "GUp bez  ''of''", "1", "2" });
            dT_03.Rows.Add(new Object[] { "2", "GUp ''of''", "1", "2" });
            dT_03.Rows.Add(new Object[] { "2", "GUp Razem", "1", "2" });

            dT_03.Rows.Add(new Object[] { "2", "GN", "1", "2" });
            dT_03.Rows.Add(new Object[] { "2", "Gzd", "1", "2" });
            dT_03.Rows.Add(new Object[] { "2", "GUo", "1", "2" });
            dT_03.Rows.Add(new Object[] { "2", "GUn", "1", "2" });
            dT_03.Rows.Add(new Object[] { "2", "GUz", "1", "2" });
            dT_03.Rows.Add(new Object[] { "2", "GUk", "1", "2" });

            dT_03.Rows.Add(new Object[] { "2", "Łącznie", "2", "1" });
            dT_03.Rows.Add(new Object[] { "3", "L.p.", "1", "3" });
            dT_03.Rows.Add(new Object[] { "3", "Imię i Nazwisko", "1", "3" });
            dT_03.Rows.Add(new Object[] { "3", "Wpływ", "14", "1" });


            Session["header_03"] = dT_03;

            #endregion

            #region tabela  4 ()

            dT_04.Clear();

            dT_04.Rows.Add(new Object[] { "1", "Za bieżący miesiąc", "1", "1" });
            dT_04.Rows.Add(new Object[] { "1", "Od początku roku do końca bieżącego miesiąca", "1", "1" });
            dT_04.Rows.Add(new Object[] { "2", "GU bez ,,of'", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "GU ''of''", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "GU Razem", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "GUp bez  ''of''", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "GUp ''of''", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "GUp Razem", "1", "2" });

            dT_04.Rows.Add(new Object[] { "2", "GN", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "Gzd", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "GUo", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "GUn", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "GUz", "1", "2" });
            dT_04.Rows.Add(new Object[] { "2", "GUk", "1", "2" });

            dT_04.Rows.Add(new Object[] { "2", "Łącznie", "2", "1" });
            dT_04.Rows.Add(new Object[] { "3", "L.p.", "1", "3" });
            dT_04.Rows.Add(new Object[] { "3", "Imię i Nazwisko", "1", "3" });
            dT_04.Rows.Add(new Object[] { "3", "Załatwienia", "14", "1" });

            Session["header_04"] = dT_04;


            #endregion

            #region tabela  5 ()

            dT_05.Clear();


            dT_05.Rows.Add(new Object[] { "1", "wyznaczonych ", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "odbytych", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "wyznaczonych ", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "odbytych", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "odroczonych", "1", "1" });


            dT_05.Rows.Add(new Object[] { "1", "wyznaczonych ", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "odbytych", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "wyznaczonych ", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "odbytych", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "odroczonych", "1", "1" });


            dT_05.Rows.Add(new Object[] { "1", "wyznaczonych ", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "odbytych", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "wyznaczonych ", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "odbytych", "1", "1" });
            dT_05.Rows.Add(new Object[] { "1", "odroczonych", "1", "1" });



            dT_05.Rows.Add(new Object[] { "2", "L.p.", "1", "2" });
            dT_05.Rows.Add(new Object[] { "2", "Sędzia", "1", "2" });

            dT_05.Rows.Add(new Object[] { "2", "Ilość wokand Łącznie", "2", "1" });
            dT_05.Rows.Add(new Object[] { "2", "Ilość spraw na wokandzie", "3", "1" });
            dT_05.Rows.Add(new Object[] { "2", "Procent odroczeń ", "1", "2" });

            dT_05.Rows.Add(new Object[] { "2", "Ilość wokand z rozpraw ", "2", "1" });
            dT_05.Rows.Add(new Object[] { "2", "Ilość spraw na wokandzie", "3", "1" });
            dT_05.Rows.Add(new Object[] { "2", "Procent odroczeń ", "1", "2" });

            dT_05.Rows.Add(new Object[] { "2", "Ilość wokand z posiedzeń  ", "2", "1" });
            dT_05.Rows.Add(new Object[] { "2", "Ilość spraw na wokandzie", "3", "1" });
            dT_05.Rows.Add(new Object[] { "2", "Procent odroczeń ", "1", "2" });



            Session["header_05"] = dT_05;


            #endregion

            #region tabela  6 ()

            DataTable dT_06 = new DataTable();
            dT_06.Columns.Clear();
            dT_06.Columns.Add("Column1", typeof(string));
            dT_06.Columns.Add("Column2", typeof(string));
            dT_06.Columns.Add("Column3", typeof(string));
            dT_06.Columns.Add("Column4", typeof(string));
            dT_06.Clear();

            dT_06.Rows.Add(new Object[] { "1", "Za bieżący miesiącZZZZZ", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "Od początku roku do końca bieżącego miesiąca", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "GU bez ''of''", "1", "2" });
            dT_06.Rows.Add(new Object[] { "1", "GU ''of''", "1", "2" });
            dT_06.Rows.Add(new Object[] { "1", "GU Razem", "1", "2" });
            dT_06.Rows.Add(new Object[] { "1", "GUp bez  ''of''", "1", "2" });
            dT_06.Rows.Add(new Object[] { "1", "GUp ''of''", "2" });
            dT_06.Rows.Add(new Object[] { "1", "GUp Razem", "1", "2" });
            dT_06.Rows.Add(new Object[] { "1", "GN", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "Gzd", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "GUo", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "GUn", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "GUz", "1", "1" });
            dT_06.Rows.Add(new Object[] { "1", "GUk", "1", "1" });

            dT_06.Rows.Add(new Object[] { "2", "L.p.", "1", "2" });
            dT_06.Rows.Add(new Object[] { "2", "Imię i Nazwisko", "1", "2" });
            dT_06.Rows.Add(new Object[] { "2", "Pozostało na następny miesiąc", "13", "1" });

            dT_06.Rows.Add(new Object[] { "2", "W tym 3-6 miesięcy", "1", "2" });
            dT_06.Rows.Add(new Object[] { "2", "6-12 miesięcy", "1", "2" });
            dT_06.Rows.Add(new Object[] { "2", "Powyżej 12 miesięcy", "1", "2" });
            dT_06.Rows.Add(new Object[] { "2", "Powyżej 24 miesięcy", "1", "2" });
            Session["header_06"] = dT_06;


            #endregion

            #region tabela  8 ()

            DataTable dT_08 = new DataTable();
            dT_08.Columns.Clear();
            dT_08.Columns.Add("Column1", typeof(string));
            dT_08.Columns.Add("Column2", typeof(string));
            dT_08.Columns.Add("Column3", typeof(string));
            dT_08.Columns.Add("Column4", typeof(string));
            dT_08.Clear();

            dT_08.Rows.Add(new Object[] { "1", "GU bez ''of''", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "GU ''of''", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "GU Razem", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "GUp bez  '''of'", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "GUp ''of''", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "GN", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "Gzd", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "GUo", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "GUn", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "GUz", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "GUk", "1", "1" });
            dT_08.Rows.Add(new Object[] { "1", "Łącznie", "1", "1" });
            dT_08.Rows.Add(new Object[] { "2", "Ruch spraw", "1", "2" });
            dT_08.Rows.Add(new Object[] { "2", "Struktura pozostałości (wydział ogółem – liczba spraw)", "13", "1" });

            //ILOŚĆ WOKAND ŁĄCZNIE
            Session["header_08"] = dT_08;

            #endregion

            #region tabela  10 ()

            DataTable dT_10 = new DataTable();

            dT_10.Columns.Clear();
            dT_10.Columns.Add("Column1", typeof(string));
            dT_10.Columns.Add("Column2", typeof(string));
            dT_10.Columns.Add("Column3", typeof(string));
            dT_10.Columns.Add("Column4", typeof(string));

            dT_10.Rows.Add(new Object[] { "1", "GU bez ''of''", "1", "1" });
            dT_10.Rows.Add(new Object[] { "1", "GU ''of''", "1", "1" });
            dT_10.Rows.Add(new Object[] { "1", "GU Razem", "1", "1" });
            dT_10.Rows.Add(new Object[] { "1", "GUp bez  '''of'", "1", "1" });
            dT_10.Rows.Add(new Object[] { "1", "GUp ''of''", "1", "1" });
            dT_10.Rows.Add(new Object[] { "1", "K razem", "1", "1" });
            dT_10.Rows.Add(new Object[] { "1", "Ko", "1", "1" });
            dT_10.Rows.Add(new Object[] { "1", "Kp", "1", "1" });
            dT_10.Rows.Add(new Object[] { "1", "Kop", "1", "1" });
            dT_10.Rows.Add(new Object[] { "1", "W", "1", "1" });
            dT_10.Rows.Add(new Object[] { "1", "Razem", "1", "1" });
            dT_10.Rows.Add(new Object[] { "1", "W tym 3-6 miesięcy", "1", "1" });
            dT_10.Rows.Add(new Object[] { "1", "6-12 miesięcy", "1", "1" });
            dT_10.Rows.Add(new Object[] { "1", "Powyżej 12 miesięcy", "1", "1" });
            dT_10.Rows.Add(new Object[] { "1", "Powyżej 24 miesięcy", "1", "1" });
            dT_10.Rows.Add(new Object[] { "2", "L.p.", "1", "2" });
            dT_10.Rows.Add(new Object[] { "2", "Imię i Nazwisko", "1", "2" });
            dT_10.Rows.Add(new Object[] { "2", "liczba spraw (w tym zawieszone)", "15", "1" });


            //ILOŚĆ WOKAND ŁĄCZNIE
            Session["header_10"] = dT_10;
            #endregion


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
            id_dzialu.Text = (string)Session["txt_dzialu"];
            string txt = string.Empty; //
            txt = "File name: <b>onsu.aspx</b></br>";
            txt = txt + "id działu=" + yyx + "</br>";


            cl.deleteRowTable();
            txt = txt + cl.generuj_dane_do_tabeli_wierszy(DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), yyx, 1);
            txt = txt + cl.generuj_dane_do_tabeli_wierszy(DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), yyx, 7);


            txt = txt + cl.clear_maim_db();
            try
            {
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 2, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text));

                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 3, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text));
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 4, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text));
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 5, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text));
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 6, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text));
                //	txt = txt + cl.uzupelnij_statusy();
            }
            catch
            {
            }
            txt = txt + cl.generuj_dane_do_tabeli_wierszy(DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), yyx, 6);
            GridView7.DataBind();
            // dopasowanie opisów
            makeLabels();
            GridView1.DataBind();
            GridView2.DataBind();
            GridView3.DataBind();
            GridView4.DataBind();
            try
            {
                Label11.Visible = cl.debug(int.Parse(yyx));
            }
            catch
            {
                Label11.Visible = false;
            }

            Label11.Text = txt;



        }

        #region "nagłowki tabel"

        TableCell HeaderCell_(string text, int columns, int rows)
        {
            TableCell HeaderCell = new TableCell();
            HeaderCell.Text = text;
            HeaderCell.ColumnSpan = columns;
            HeaderCell.RowSpan = rows;
            return HeaderCell;


        }

        GridViewRow Grw(object sender)
        {
            GridViewRow HeaderGridRow = null;
            GridView HeaderGrid = (GridView)sender;
            HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
            HeaderGridRow.Font.Size = 7;
            HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
            HeaderGridRow.VerticalAlign = VerticalAlign.Top;
            return HeaderGridRow;

        }

        protected void makeHeader1(System.Web.UI.WebControls.GridView sender, DataTable dT)
        {
            try
            {
                int row = 0;
                TableCell HeaderCell = new TableCell();
                GridViewRow HeaderGridRow = null;
                foreach (DataRow dR in dT.Rows)
                {
                    if (int.Parse(dR[0].ToString().Trim()) > row)
                    {
                        GridView HeaderGrid = (GridView)sender;
                        HeaderGridRow = Grw(sender);
                        row = int.Parse(dR[0].ToString().Trim());
                    }
                    HeaderGridRow.Cells.Add(HeaderCell_(dR[1].ToString().Trim(), int.Parse(dR[2].ToString().Trim()), int.Parse(dR[3].ToString().Trim())));
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                }
            }
            catch
            { } // end of try
        }

        protected void makeHeader2(System.Web.UI.WebControls.GridView sender, DataTable dT)
        {
            try
            {
                int row = 0;
                TableCell HeaderCell = new TableCell();
                GridViewRow HeaderGridRow = null;
                foreach (DataRow dR in dT.Rows)
                {
                    if (int.Parse(dR[0].ToString().Trim()) > row)
                    {
                        GridView HeaderGrid = (GridView)sender;
                        HeaderGridRow = Grw(sender);
                        row = int.Parse(dR[0].ToString().Trim());
                    }
                    HeaderGridRow.Cells.Add(HeaderCell_(dR[1].ToString().Trim(), int.Parse(dR[2].ToString().Trim()), int.Parse(dR[3].ToString().Trim())));
                    GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow);
                }
            }
            catch
            { } // end of try
        }

        protected void makeHeader3(System.Web.UI.WebControls.GridView sender, DataTable dT)
        {
            try
            {
                int row = 0;
                TableCell HeaderCell = new TableCell();
                GridViewRow HeaderGridRow = null;
                foreach (DataRow dR in dT.Rows)
                {
                    if (int.Parse(dR[0].ToString().Trim()) > row)
                    {
                        GridView HeaderGrid = (GridView)sender;
                        HeaderGridRow = Grw(sender);
                        row = int.Parse(dR[0].ToString().Trim());
                    }
                    HeaderGridRow.Cells.Add(HeaderCell_(dR[1].ToString().Trim(), int.Parse(dR[2].ToString().Trim()), int.Parse(dR[3].ToString().Trim())));
                    GridView3.Controls[0].Controls.AddAt(0, HeaderGridRow);
                }
            }
            catch
            { } // end of try
        }

        protected void makeHeader4(System.Web.UI.WebControls.GridView sender, DataTable dT)
        {
            try
            {
                int row = 0;
                TableCell HeaderCell = new TableCell();
                GridViewRow HeaderGridRow = null;
                foreach (DataRow dR in dT.Rows)
                {
                    if (int.Parse(dR[0].ToString().Trim()) > row)
                    {
                        GridView HeaderGrid = (GridView)sender;
                        HeaderGridRow = Grw(sender);
                        row = int.Parse(dR[0].ToString().Trim());
                    }
                    HeaderGridRow.Cells.Add(HeaderCell_(dR[1].ToString().Trim(), int.Parse(dR[2].ToString().Trim()), int.Parse(dR[3].ToString().Trim())));
                    GridView4.Controls[0].Controls.AddAt(0, HeaderGridRow);
                }
            }
            catch
            { } // end of try
        }

        protected void makeHeader6(System.Web.UI.WebControls.GridView sender, DataTable dT)
        {
            try
            {
                int row = 0;
                TableCell HeaderCell = new TableCell();
                GridViewRow HeaderGridRow = null;
                foreach (DataRow dR in dT.Rows)
                {
                    if (int.Parse(dR[0].ToString().Trim()) > row)
                    {
                        GridView HeaderGrid = (GridView)sender;
                        HeaderGridRow = Grw(sender);
                        row = int.Parse(dR[0].ToString().Trim());
                    }
                    HeaderGridRow.Cells.Add(HeaderCell_(dR[1].ToString().Trim(), int.Parse(dR[2].ToString().Trim()), int.Parse(dR[3].ToString().Trim())));
                    GridView6.Controls[0].Controls.AddAt(0, HeaderGridRow);
                }
            }
            catch
            { } // end of try
        }

        protected void makeHeader7(System.Web.UI.WebControls.GridView sender, DataTable dT)
        {
            try
            {
                int row = 0;
                TableCell HeaderCell = new TableCell();
                GridViewRow HeaderGridRow = null;
                foreach (DataRow dR in dT.Rows)
                {
                    if (int.Parse(dR[0].ToString().Trim()) > row)
                    {
                        GridView HeaderGrid = (GridView)sender;
                        HeaderGridRow = Grw(sender);
                        row = int.Parse(dR[0].ToString().Trim());
                    }
                    HeaderGridRow.Cells.Add(HeaderCell_(dR[1].ToString().Trim(), int.Parse(dR[2].ToString().Trim()), int.Parse(dR[3].ToString().Trim())));
                    GridView7.Controls[0].Controls.AddAt(0, HeaderGridRow);
                }
            }
            catch
            { } // end of try
        }
        protected void makeHeader8(System.Web.UI.WebControls.GridView sender, DataTable dT)
        {
            try
            {
                int row = 0;
                TableCell HeaderCell = new TableCell();
                GridViewRow HeaderGridRow = null;
                foreach (DataRow dR in dT.Rows)
                {
                    if (int.Parse(dR[0].ToString().Trim()) > row)
                    {
                        GridView HeaderGrid = (GridView)sender;
                        HeaderGridRow = Grw(sender);
                        row = int.Parse(dR[0].ToString().Trim());
                    }
                    HeaderGridRow.Cells.Add(HeaderCell_(dR[1].ToString().Trim(), int.Parse(dR[2].ToString().Trim()), int.Parse(dR[3].ToString().Trim())));
                    GridView8.Controls[0].Controls.AddAt(0, HeaderGridRow);
                }
            }
            catch
            { } // end of try
        }

        protected void GridView2_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_01"];
                makeHeader2(sn, dT);
            } // end of if
        }

        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_02"];
                makeHeader1(sn, dT);
            } // end of if
        }

        protected void GridView3_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_03"];
                makeHeader3(sn, dT);
            } // end of if
        }

        protected void GridView4_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_04"];
                makeHeader4(sn, dT);
            } // end of if
        }



        protected void GridView6_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_05"];
                makeHeader6(sn, dT);
            } // end of if
        }

        protected void GridView7_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_07"];
                makeHeader7(sn, dT);
            } // end of if
        }
        #endregion "nagłowki tabel"

        #region "obsługa oncommand  tabel z nazwiskami"

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Panel4.Visible = true;
            //Label8.Text = GridView1.SelectedDataKey[1].ToString() + " " + GridView1.SelectedDataKey[2].ToString();
            makeLabels();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Session["id_sedziego"] = null;
            Panel4.Visible = false;
            GridView1.Enabled = true;
            GridView2.Enabled = true;
            GridView3.Enabled = true;
            GridView4.Enabled = true;
            makeLabels();
        }

        protected void show(object sender, CommandEventArgs e)
        {
            Session["nr_tabeli"] = "2";
            Session["aa"] = e.CommandArgument.ToString();
            Session["bb"] = e.CommandName.ToString();
            podlacz("2", e.CommandArgument.ToString(), e.CommandName.ToString().Trim());
        }

        protected void show2(object sender, CommandEventArgs e)
        {
            Session["nr_tabeli"] = "2";
            Session["aa"] = e.CommandArgument.ToString();
            Session["bb"] = e.CommandName.ToString();
            podlacz("3", e.CommandArgument.ToString(), e.CommandName.ToString().Trim());

        }

        protected void show3(object sender, CommandEventArgs e)
        {
            Session["nr_tabeli"] = "3";
            Session["aa"] = e.CommandArgument.ToString();
            Session["bb"] = e.CommandName.ToString();
            podlacz("4", e.CommandArgument.ToString(), e.CommandName.ToString());
        }

        protected void podlacz(string id_tabeli, string id_sedziego, string id_kolumny)
        {
            int table_0 = 0;
            int table_1 = 0;
            int table_2 = 0;
            int table_3 = 0;
            try
            {
                table_0 = GridView2.Rows.Count * 25;
                table_1 = GridView1.Rows.Count * 25;
                table_2 = GridView3.Rows.Count * 25;
                table_3 = GridView4.Rows.Count * 25;
            }
            catch
            { }
            int pos = 0;
            switch (id_tabeli)
            {
                case "1": { pos = 350; }; break;
                case "2": { pos = 300 + table_0; ; }; break;
                case "3": { pos = 300 + table_0 + table_1; }; break;
                case "4": { pos = 300 + table_0 + table_1 + table_2; }; break;
                default:
                    break;
            }
            Panel5.Style["top"] = pos.ToString() + "px";

            try
            {
                int i = int.Parse(id_tabeli);

                id_tabeli = i.ToString();

            }
            catch
            { }

            Label21.Text = "";

            Label21.Text = cl.wyciagnij_sedziego(id_sedziego);


            Panel4.Visible = true;
            GridView1.Enabled = false;
            GridView2.Enabled = false;
            GridView3.Enabled = false;

            try
            {
                try
                {
                    if (Session["date_1"] == null) Session["date_1"] = DateTime.Parse(Date1.Text.Trim());
                }
                catch (Exception)
                { }
                try
                {
                    if (Session["date_2"] == null) Session["date_2"] = DateTime.Parse(Date2.Text.Trim());
                }
                catch (Exception)
                { }

                Session["id_tabeli"] = id_tabeli;
                Session["id_sedziego"] = id_sedziego;
                Session["id_kolumny"] = id_kolumny;

                string tt = (string)Session["id_dzialu"];



                GridView5.DataSource = null;
                GridView5.DataSourceID = null;
                GridView5.AutoGenerateColumns = true;

            }
            catch (Exception)
            {
            }
            try
            {
                DataSet dane = new DataSet();
                dane.Tables.Clear();
                string cs = cl.podajConnectionString(int.Parse((string)Session["id_dzialu"]));

                dane = cl.pod_tabela(cl.podajConnectionString(int.Parse((string)Session["id_dzialu"])), cl.podajKwerendePodgladu(int.Parse((string)Session["id_dzialu"]), 0, int.Parse(id_kolumny), int.Parse(id_tabeli)), Date1.Text.Trim(), Date2.Text.Trim(), (string)Session["id_sedziego"]);

                GridView5.DataSource = dane.Tables[0];
                GridView5.AutoGenerateColumns = true;

                GridView5.DataBind();
                px.Visible = true;
                GridView5.Visible = true;
                Label21.Text = Label21.Text + " " + cl.wyciagnij_tytul(id_tabeli, id_kolumny, (string)Session["id_dzialu"]);
                makeLabels();
            }
            catch
            {
                GridView5.DataSource = null;
                GridView5.DataSourceID = null;
                GridView5.Visible = false;
            }

            makeLabels();
            Panel4.Focus();
        }

        #endregion "obsługa oncommand  tabel z nazwiskami"

        protected void LinkButton1_Command(object sender, CommandEventArgs e)
        {
            // onClick na pierwsza tabele
            Session["id_tabeli"] = "1";
            string aa = e.CommandArgument.ToString();//id
            string bb = e.CommandName.ToString();//nr kolumny

            Session["aa"] = aa;
            Session["bb"] = bb;
            int i = 0;
            try
            {
                i = int.Parse(aa.Trim()) - 1;
            }
            catch (Exception)
            {


            }
            // tabela pierwsza
            Panel4.Visible = true;
            GridView2.Enabled = false;
            string id_dzialu = (string)Session["id_dzialu"];

            string cs = cl.podajConnectionString(int.Parse((string)Session["id_dzialu"]));
            string kw = cl.podajKwerendePodgladu(int.Parse((string)Session["id_dzialu"]), int.Parse(aa), int.Parse(bb), 1);

            GridView5.DataSource = null;
            GridView5.DataSourceID = null;
            Session["data_1"] = Date1.Text.Trim();
            Session["data_2"] = Date2.Text.Trim();
            try
            {
                Session["id_sedziego"] = (string)Session["id_sedziego"];
            }
            catch
            {

            }
            string yyx = (string)Session["id_dzialu"];

            try
            {
                DataSet dane = new DataSet();
                dane.Tables.Clear();
                dane = cl.pod_tabela(cs, kw, Date1.Text.Trim(), Date2.Text.Trim(), (string)Session["id_sedziego"]);
                //podtabela2.DataBind();
                GridView5.DataSource = dane.Tables[0];
                GridView5.AutoGenerateColumns = true;
                //GridView5.DataSourceObject = dane;
                GridView5.DataBind();
                px.Visible = true;
                GridView5.Visible = true;
            }
            catch
            {
                GridView5.DataSource = null;
                GridView5.DataSourceID = null;
                GridView5.Visible = false;
            }
            Label21.Text = "Informacje o ruchu spraw";
            // GridView5.DataBind();
            makeLabels();
            GridView3.DataBind();
            Label11.Visible = cl.debug(int.Parse(yyx));
            /*  Label11.Text = txt;*/
            Label3.Text = cl.nazwaSadu((string)Session["id_dzialu"]);
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
                    Label17.Text = "Wpływ za miesiąc " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    Label15.Text = "Załatwienia za miesiąc " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    //Stan referatów sędziów na koniec miesiąca
                    //Label15.Text = "Stan referatów sędziów na koniec miesiąca " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    //Informacje o ruchu sprawa za miesiąc: 
                    Label5.Text = "Informacje o ruchu sprawa za miesiąc:  " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    Label35.Text = "Pozostało na następny miesiąc w miesiącu:  " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    Label27.Text = "za miesiąc:  " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    Label19.Text = "Pozostało z ubieglego miesiąca w miesiącu:  " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    //Pozostało z ubieglego miesiąca
                }
                else
                {
                    Label17.Text = "Wpływ za okres od " + Date1.Text + " do  " + Date2.Text;
                    Label15.Text = "Załatwienia za okres od" + Date1.Text + " do  " + Date2.Text;
                    //Label15.Text = "Stan referatów sędziów za okres od " + Date1.Text + " do  " + Date2.Text;
                    Label5.Text = "Informacje o ruchu sprawa za okres od:  " + Date1.Text + " do  " + Date2.Text;
                    Label27.Text = "za okres od:  " + Date1.Text + " do  " + Date2.Text;
                    Label35.Text = "Pozostało na następny z okresu od:  " + Date1.Text + " do  " + Date2.Text;
                    Label19.Text = "Pozostało z ubieglego miesiąca w okresie od:   " + Date1.Text + " do  " + Date2.Text;
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

        protected void Button3_Click(object sender, EventArgs e)
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


            DataView view = (DataView)dane_do_tabeli_1.Select(DataSourceSelectArguments.Empty);

            DataTable table = view.ToTable();




            IRow row0 = sheet0.CreateRow(0);
            table.TableName = "Załatwienia";
            table.Columns.Remove("id_");

            row0.CreateCell(0).SetCellValue("Opis");
            row0.CreateCell(1).SetCellValue("Sprawy według repetoriów i wykazów");

            var crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 0, 0);
            sheet0.AddMergedRegion(crs);
            crs = new NPOI.SS.Util.CellRangeAddress(0, 0, 1, 8);
            sheet0.AddMergedRegion(crs);



            row0 = sheet0.CreateRow(1);

            row0.CreateCell(1).SetCellValue("GU bez ''of''");
            row0.CreateCell(2).SetCellValue("CG-G");
            row0.CreateCell(3).SetCellValue("GU ''of''");
            row0.CreateCell(4).SetCellValue("GU Razem");
            row0.CreateCell(5).SetCellValue("GUp bez  '''of'");
            row0.CreateCell(6).SetCellValue("GUp ''of''");

            row0.CreateCell(7).SetCellValue("WSC");
            row0.CreateCell(8).SetCellValue("Łącznie");

            int rol = 2;
            foreach (DataRow rowik in table.Rows)
            {
                row0 = sheet0.CreateRow(rol);
                for (int i = 0; i < 9; i++)
                {
                    try
                    {
                        int ji = int.Parse(rowik[i].ToString().Trim());
                        ICellStyle cellStyle = hssfworkbook.CreateCellStyle();
                        cellStyle.DataFormat = HSSFDataFormat.GetBuiltinFormat("0");
                        row0.CreateCell(i).SetCellValue(ji);
                        row0.Cells[i].CellStyle = cellStyle;
                    }
                    catch (Exception)
                    {
                        row0.CreateCell(i).SetCellValue(rowik[i].ToString().Trim());
                    }
                }
                rol++;
            }// end foreach

            // druga tabela
            view = (DataView)statystyki.Select(DataSourceSelectArguments.Empty);

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
            row2.CreateCell(7).SetCellValue("GU bez ''of''");
            row2.CreateCell(8).SetCellValue("C-GC");
            row2.CreateCell(9).SetCellValue("GU ''of''");
            row2.CreateCell(10).SetCellValue("GU Razem");
            row2.CreateCell(11).SetCellValue("GUp bez  '''of'");
            row2.CreateCell(12).SetCellValue("GUp ''of''");
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

            row2.CreateCell(5).SetCellValue("GU bez ''of''");
            row2.CreateCell(6).SetCellValue("C-GC");
            row2.CreateCell(7).SetCellValue("GU ''of''");
            row2.CreateCell(8).SetCellValue("GU Razem");
            row2.CreateCell(9).SetCellValue("GUp bez  '''of'");
            row2.CreateCell(10).SetCellValue("GUp ''of''");
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

            view = (DataView)tabela_4.Select(DataSourceSelectArguments.Empty);

            table = view.ToTable();

            table.Columns.Remove("ident");
            table.Columns.Remove("sesja");
            table.Columns.Remove("id_sedziego");
            //        table.Columns.Remove("id_tabeli");
            //       table.Columns.Remove("id_dzialu");
            table.Columns.Remove("d_09");
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

            ISheet sheet3 = hssfworkbook.CreateSheet("Stan referatów sędziów");

            row2 = sheet3.CreateRow(0);
            row2.CreateCell(0).SetCellValue("L.p.");
            row2.CreateCell(1).SetCellValue("Nazwisko");
            row2.CreateCell(2).SetCellValue("Imię");
            row2.CreateCell(3).SetCellValue("Funkcja");
            row2.CreateCell(4).SetCellValue("Stanowisko");

            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 0, 0);
            sheet3.AddMergedRegion(crs);
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 1, 1);
            sheet3.AddMergedRegion(crs);
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 2, 2);
            sheet3.AddMergedRegion(crs);
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 3, 3);
            sheet3.AddMergedRegion(crs);
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 4, 4);
            sheet3.AddMergedRegion(crs);

            row2.CreateCell(5).SetCellValue("Pozostało w referatach spraw kategorii");
            crs = new NPOI.SS.Util.CellRangeAddress(0, 0, 5, 12);
            sheet3.AddMergedRegion(crs);

            row2 = sheet3.CreateRow(1);

            row2.CreateCell(5).SetCellValue("GU bez ''of''");
            row2.CreateCell(6).SetCellValue("C-GC");
            row2.CreateCell(7).SetCellValue("GU ''of''");
            row2.CreateCell(8).SetCellValue("GU Razem");
            row2.CreateCell(9).SetCellValue("GUp bez  '''of'");
            row2.CreateCell(10).SetCellValue("GUp ''of''");
            row2.CreateCell(11).SetCellValue("WSC");
            row2.CreateCell(12).SetCellValue("Razem");
            // row2.CreateCell(12).SetCellValue("Odroczenia liczba spraw odroczonych");
            ro = 2;

            foreach (DataRow rowik in table.Rows)
            {
                row2 = sheet3.CreateRow(ro);
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
        }

        protected void LinkButton54_Click(object sender, EventArgs e)
        {
            przemiel();
        }

        protected void LinkButton55_Click(object sender, EventArgs e)
        {
            makeLabels();
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "print2", "JavaScript: window.print();", true);
            makeLabels();
        }


        protected void GridView8_RowCreated(object sender, GridViewRowEventArgs e)
        {

        }
    }
}