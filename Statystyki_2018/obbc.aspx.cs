/*
Last Update:
    - version 1.181121
Creation date: 2018-11-21

*/
using System;
using System.Data;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using OfficeOpenXml;

namespace stat2018
{
    public partial class obbc : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();

        const string tenPlik = "obbc.aspx";

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
            odswiez();
        }

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
            dT_01.Columns.Add("exl1", typeof(int));
            dT_01.Columns.Add("exl2", typeof(int));
            dT_01.Columns.Add("exl3", typeof(int));
            dT_01.Columns.Add("exl4", typeof(int));
            DataTable dT_02 = new DataTable();
            dT_02.Columns.Clear();
            dT_02.Columns.Add("Column1", typeof(string));
            dT_02.Columns.Add("Column2", typeof(string));
            dT_02.Columns.Add("Column3", typeof(string));
            dT_02.Columns.Add("Column4", typeof(string));
            dT_02.Columns.Add("exl1", typeof(int));
            dT_02.Columns.Add("exl2", typeof(int));
            dT_02.Columns.Add("exl3", typeof(int));
            dT_02.Columns.Add("exl4", typeof(int));
            DataTable dT_03 = new DataTable();
            dT_03.Columns.Clear();
            dT_03.Columns.Add("Column1", typeof(string));
            dT_03.Columns.Add("Column2", typeof(string));
            dT_03.Columns.Add("Column3", typeof(string));
            dT_03.Columns.Add("Column4", typeof(string));
            dT_03.Columns.Add("exl1", typeof(int));
            dT_03.Columns.Add("exl2", typeof(int));
            dT_03.Columns.Add("exl3", typeof(int));
            dT_03.Columns.Add("exl4", typeof(int));
            DataTable dT_04 = new DataTable();
            dT_04.Columns.Clear();
            dT_04.Columns.Add("Column1", typeof(string));
            dT_04.Columns.Add("Column2", typeof(string));
            dT_04.Columns.Add("Column3", typeof(string));
            dT_04.Columns.Add("Column4", typeof(string));

         
            #region tabela  1 



            System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();



            dT_01.Clear();
              

            dT_01.Rows.Add(new Object[] { "1", "Rozprawy", "1", "1", 0, 0, 1, 1 });
            dT_01.Rows.Add(new Object[] { "1", "Posiedzenia Jawne", "1", "1", 0, 0, 2, 2 });
            dT_01.Rows.Add(new Object[] { "1", "Posiedzenia Niejawne", "1", "1", 0, 0, 3, 3 });
            dT_01.Rows.Add(new Object[] { "1", "Oględziny", "1", "1", 0, 0, 4, 4 });
            dT_01.Rows.Add(new Object[] { "1", "C", "1", "1", 0, 0, 5, 5 });
            dT_01.Rows.Add(new Object[] { "1", "Ns", "1", "1", 0, 0, 6, 6 });
            dT_01.Rows.Add(new Object[] { "1", "Nc", "1", "1", 0, 0, 7, 7 });
            dT_01.Rows.Add(new Object[] { "1", "Co", "1", "1", 0, 0, 8, 8 });
            dT_01.Rows.Add(new Object[] { "1", "Cps", "1", "1", 0, 0, 9, 9 });
            dT_01.Rows.Add(new Object[] { "1", "N", "1", "1", 0, 1, 10, 11 });
            dT_01.Rows.Add(new Object[] { "1", "Razem", "1", "1", 0, 1, 12, 12 });
            

            dT_01.Rows.Add(new Object[] { "2", "Nazwisko i imię sędziego", "1", "2", 0, 1, 0, 0 });
            dT_01.Rows.Add(new Object[] { "2", "Ilość dni rozpraw", "4", "1", 0, 0, 1, 13 });
            dT_01.Rows.Add(new Object[] { "2", "Załatwiono / Sprawy", "7", "1", 0, 0, 1, 13 });

            Session["header_01"] = dT_01;
           
            #endregion
            #region tabela  3 ()

            dT_03.Clear();

            
            dT_03.Rows.Add(new Object[] { "1", "Wyznaczonych", "1", "1" });
            dT_03.Rows.Add(new Object[] { "1", "odroczonych", "1", "1" });

            dT_03.Rows.Add(new Object[] { "2", "Sędzia", "1", "2" });
            dT_03.Rows.Add(new Object[] { "2", "Ilość spraw", "2", "1" });
            dT_03.Rows.Add(new Object[] { "2", "% Odroczonych", "1", "2" });
        

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
            //makeHeader4(sn, dT_04);

            #endregion

          

        }


        protected void Odswiez(object sender, EventArgs e)
        {
            odswiez();
        }
        protected void odswiez()
        {
            makeHeader();
            //odswiezenie danych
            tabela1();
          
            tabela3();
            tabela4();
            tabela5();
            debug();

        }

        private void debug()
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
                Label28.Text = cl.podajUzytkownika(User_id, domain);
                Label29.Text = DateTime.Now.ToLongDateString();
                Label30.Text = System.IO.File.ReadAllText(Server.MapPath(@"~//version.txt")).ToString().Trim();
              
            }
            catch
            {  }
            try
            {
                string idDzialu = (string)Session["id_dzialu"];
                infoLabel1.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel3.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel4.Visible = cl.debug(int.Parse(idDzialu));

                infoLabel2.Visible = cl.debug(int.Parse(idDzialu));

            }
            catch
            {

                infoLabel3.Visible = false;
                infoLabel1.Visible = false;
                infoLabel4.Visible = false;
                infoLabel2.Visible = false;



            }
        }

        DataTable tabela_2()
        {
            //dane do tabeli sumującej po tabelą nr 1
            DataTable tabelka01 = new DataTable();
            try
            {

                tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), (string)Session["id_dzialu"], 2, 8, 8, tenPlik);
                Session["tabelka002"] = tabelka01;
                //row 1

            }
            catch (Exception ex)
            {
                cm.makeLog("error", tenPlik + " " + ex.Message, cl.debug(int.Parse((string)Session["id_dzialu"])));
            }
            return tabelka01;
        }
        protected void tabela3()
        {
            if (Session["id_dzialu"] == null)
            {
                return;
            }

            try
            {

                DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), (string)Session["id_dzialu"], 3, 20, 20, tenPlik);
                Session["tabelka003"] = tabelka01;
                //row 1
                tab_7_w01_c01.Text = tabelka01.Rows[0][1].ToString().Trim();
                tab_7_w01_c02.Text = tabelka01.Rows[0][2].ToString().Trim();
                tab_7_w01_c03.Text = tabelka01.Rows[0][3].ToString().Trim();
                tab_7_w01_c04.Text = tabelka01.Rows[0][4].ToString().Trim();
                tab_7_w01_c05.Text = tabelka01.Rows[0][5].ToString().Trim();
                tab_7_w01_c06.Text = tabelka01.Rows[0][6].ToString().Trim();

                //row 2
                tab_7_w02_c01.Text = tabelka01.Rows[1][1].ToString().Trim();
                tab_7_w02_c02.Text = tabelka01.Rows[1][2].ToString().Trim();
                tab_7_w02_c03.Text = tabelka01.Rows[1][3].ToString().Trim();
                tab_7_w02_c04.Text = tabelka01.Rows[1][4].ToString().Trim();
                tab_7_w02_c05.Text = tabelka01.Rows[1][5].ToString().Trim();
                tab_7_w02_c06.Text = tabelka01.Rows[1][6].ToString().Trim();

                //row 3
                tab_7_w03_c01.Text = tabelka01.Rows[2][1].ToString().Trim();
                tab_7_w03_c02.Text = tabelka01.Rows[2][2].ToString().Trim();
                tab_7_w03_c03.Text = tabelka01.Rows[2][3].ToString().Trim();
                tab_7_w03_c04.Text = tabelka01.Rows[2][4].ToString().Trim();
                tab_7_w03_c05.Text = tabelka01.Rows[2][5].ToString().Trim();
                tab_7_w03_c06.Text = tabelka01.Rows[2][6].ToString().Trim();
            }
            catch (Exception ex)
            {
                cm.makeLog("error", tenPlik + " " + ex.Message, cl.debug(int.Parse((string)Session["id_dzialu"])));
            }

        }
        protected void tworzPlikExcell(object sender, EventArgs e)
        {
            
            // execel begin
            string path = Server.MapPath("Template") + "\\obbc.xlsx";
            FileInfo existingFile = new FileInfo(path);
            if (!existingFile.Exists )
            {
                return;
            }
            string download = Server.MapPath("Template") + @"\obbc";

            FileInfo fNewFile = new FileInfo(download + "_.xlsx");

            // pierwsza tabelka


            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                
                ExcelWorksheet MyWorksheet1 = MyExcel.Workbook.Worksheets[1];

                // pierwsza
                DataTable table1 = (DataTable)Session["tabelka001"];
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], table1,12, 0, 3,false,false,false,false,false);

                //pod tabela
                int rowik = table1.Rows.Count - 4;
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
                MyWorksheet1.Cells[rowik + 12, 1, rowik + 12, 5].Merge = true;

                MyWorksheet1.Cells[rowik + 12, 1].Value = " 3-6 miesięcy";
                MyWorksheet1.Cells[rowik + 13, 1, rowik + 13, 5].Merge = true;

                MyWorksheet1.Cells[rowik + 13, 1].Value = " 6-12 miesięcy";
                MyWorksheet1.Cells[rowik + 14, 1, rowik + 14, 5].Merge = true;

                MyWorksheet1.Cells[rowik + 14, 1].Value = "ponad 12 miesięcy";
                DataTable tabelka001 = (DataTable)Session["tabelka002"];

                foreach (DataRow dR in tabelka001.Rows)
                {
                    for (int i = 2; i < 10; i++)
                    {

                        try
                        {
                            MyWorksheet1.Cells[rowik + 7, i + 4].Value = double.Parse(dR[i - 1].ToString().Trim());
                        }
                        catch
                        {

                            MyWorksheet1.Cells[rowik + 7, i + 4].Value = dR[i - 1].ToString().Trim();
                        }

                        MyWorksheet1.Cells[rowik + 7, i + 4].Style.ShrinkToFit = true;
                        MyWorksheet1.Cells[rowik + 7, i + 4].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                    }
                    rowik++;
                }


                DataTable table2 = (DataTable)Session["tabelka003"];
                MyWorksheet1 = tb.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[2], table2, 2, 6, 2, 4, false);

                // trzecia

                DataTable table3 = (DataTable)Session["tabelka004"];
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[3], table3, 4, 0, 3, false, false, false, false, false);


                // czwarta

                DataTable table4 = (DataTable)Session["tabelka005"];
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[4], table4, 9, 0, 3, false, false, false, false, false);

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
                    cm.makeLog("error", tenPlik + " " + ex.Message, cl.debug(int.Parse((string)Session["id_dzialu"])));
                }

            }//end of using



        }
        protected void tabela1()
        {

            if (Session["id_dzialu"] == null)
            {
                return;
            }
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 1");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2018(int.Parse(idDzialu),1, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 15, tenPlik);
            Session["tabelka001"] = tabelka01;
            gwTabela1.DataSource = null;
            gwTabela1.DataSourceID = null;
            gwTabela1.DataSource = tabelka01;
            gwTabela1.DataBind();
        }

        protected void tabela4()
        {
            if (Session["id_dzialu"] == null)
            {
                return;
            }
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 4");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2018(int.Parse(idDzialu), 4, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 23, tenPlik);
            Session["tabelka004"] = tabelka01;
            gwTabela4.DataSource = null;
            gwTabela4.DataSourceID = null;
            gwTabela4.DataSource = tabelka01;
            gwTabela4.DataBind();
        }
        protected void tabela5()
        {
            if (Session["id_dzialu"] == null)
            {
                return;
            }

            string idDzialu =  (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 5");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2018(int.Parse(idDzialu), 5, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 23, tenPlik);
            Session["tabelka004"] = tabelka01;
            gwTabela5.DataSource = null;
            gwTabela5.DataSourceID = null;
            gwTabela5.DataSource = tabelka01;
            gwTabela5.DataBind();
        }
    

        protected void naglowekTabeli_gwTabela1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_01"];
                tb.makeHeader(sn, dT, gwTabela1);
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

        protected void naglowekTabeli_gwTabela2(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_03"];
                tb.makeHeader(sn, dT, gwTabela4);
            }
        }

        protected void naglowekTabeli_gwTabela3_3(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                string path = Server.MapPath("\\template\\obbc.xlsx");
                DataTable dT = tb.naglowek(path, 4);
                tb.makeHeader(sn, dT, gwTabela5);
            }
        }

        protected void gwTabela1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                storid = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "id").ToString());
            }
        }

        public void AddNewRow(object sender, GridViewRowEventArgs e)
        {
            DataTable tabelka01 = tabela_2();


            GridView GridView1 = (GridView)sender;
            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);

            string idtabeli = "2";
            
            // nowy wiersz
            int idWiersza = 1;
            //(DataTable dane,int iloscKolumn, int idWiersza, string idtabeli, string tekst, int colSpan, int rowSpan, string CssStyleDlaTekstu, string cssStyleDlaTabeli)
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01,8, idWiersza, idtabeli, "zaległości z poprzedniego miesiąca",5,0,"","borderAll center"));

            idWiersza = 2;


            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01,8, idWiersza, idtabeli, "Wpłynęło", 5, 0, "", "borderAll center"));

            // nowy wiersz
            idWiersza = 3;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01,8, idWiersza, idtabeli, "Załatwiono", 5, 0, "", "borderAll center"));

            // nowy wiersz
            idWiersza = 4;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01,8, idWiersza, idtabeli, "Pozostało na miesiąc następny", 5, 0, "", "borderAll center"));


            // nowy wiersz
            idWiersza = 5;

            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01,8, idWiersza, idtabeli, "Powyżej 6-12 miesięcy", 5, 0, "", "borderAll center"));

            // nowy wiersz
            idWiersza = 6;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01,8, idWiersza, idtabeli, "Powyżej 12-24 miesięcy", 5, 0, "", "borderAll center"));
            // nowy wiersz
            idWiersza = 7;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01,8, idWiersza, idtabeli, "Powyżej 24 – 36 miesięcy ", 5, 0, "", "borderAll center"));

            // nowy wiersz
            idWiersza = 8;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01,8, idWiersza, idtabeli, "Powyżej 36 miesięcy", 5, 0, "", "borderAll center"));



        }
    }
}