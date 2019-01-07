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
    public partial class obbp : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();

        const string tenPlik = "obbp.aspx";

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
            { }

            try
            {
                string idDzialu = (string)Session["id_dzialu"];
                infoLabel1.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel3.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel4.Visible = cl.debug(int.Parse(idDzialu));
            
                infoLabel5.Visible = cl.debug(int.Parse(idDzialu));
                
            }
            catch
            {
               
                infoLabel3.Visible = false;
                infoLabel1.Visible = false;
                infoLabel4.Visible = false;
                infoLabel5.Visible = false;

               

            }
        }

        protected void Odswiez(object sender, EventArgs e)
        {
            odswiez();
        }
        protected void odswiez()
        {
          
            //odswiezenie danych
            tabela_1();
          
            tabela_3();
            tabela_4();
            tabela_5();

        }
     
        protected void tworzPlikExcell(object sender, EventArgs e)
        {
            
            // execel begin
            string path = Server.MapPath("Template") + "\\obbp.xlsx";
            FileInfo existingFile = new FileInfo(path);
            if (!existingFile.Exists )
            {
                return;
            }
            string download = Server.MapPath("Template") + @"\obbp";

            FileInfo fNewFile = new FileInfo(download + "_.xlsx");

            // pierwsza tabelka


            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                
                ExcelWorksheet MyWorksheet1 = MyExcel.Workbook.Worksheets[1];

                // pierwsza
                DataTable table1 = (DataTable)Session["tabelka001"];
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], table1,6, 0, 5,true,false,false,false,false);

                //pod tabela
                int rowik = table1.Rows.Count -2;
                MyWorksheet1.Cells[rowik + 7, 1, rowik + 7, 3].Merge = true;
                MyWorksheet1.Cells[rowik + 7, 1].Value = "Zaległość z poprzedniego miesiąca";
                MyWorksheet1.Cells[rowik + 7, 1].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                MyWorksheet1.Cells[rowik + 8, 1, rowik + 8, 3].Merge = true;
                MyWorksheet1.Cells[rowik + 8, 1].Value = "Wpływ";
                MyWorksheet1.Cells[rowik + 8, 1].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                MyWorksheet1.Cells[rowik + 9, 1, rowik + 9, 3].Merge = true;
                MyWorksheet1.Cells[rowik + 9, 1].Value = "Wpływ";
                MyWorksheet1.Cells[rowik + 9, 1].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                MyWorksheet1.Cells[rowik + 10, 1, rowik + 10, 3].Merge = true;
                MyWorksheet1.Cells[rowik + 10, 1].Value = "Załatwienia";
                MyWorksheet1.Cells[rowik + 10, 1].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                MyWorksheet1.Cells[rowik + 11, 1, rowik + 11, 3].Merge = true;
                MyWorksheet1.Cells[rowik + 11, 1].Value = " Pozostało na następny miesiąc";
                MyWorksheet1.Cells[rowik + 11, 1].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                MyWorksheet1.Cells[rowik + 12, 1, rowik + 12, 3].Merge = true;

                MyWorksheet1.Cells[rowik + 12, 1].Value = " 3-6 miesięcy";
                MyWorksheet1.Cells[rowik + 12, 1].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                MyWorksheet1.Cells[rowik + 13, 1, rowik + 13, 3].Merge = true;

                MyWorksheet1.Cells[rowik + 13, 1].Value = " 6-12 miesięcy";
                MyWorksheet1.Cells[rowik + 13, 1].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                MyWorksheet1.Cells[rowik + 14, 1, rowik + 14, 3].Merge = true;

                MyWorksheet1.Cells[rowik + 14, 1].Value = "ponad 12 miesięcy";
                MyWorksheet1.Cells[rowik + 14, 1].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                DataTable tabelka001 = (DataTable)Session["tabelka002"];

                foreach (DataRow dR in tabelka001.Rows)
                {
                    for (int i = 2; i < 6; i++)
                    {
                        
                        try
                        {
                            MyWorksheet1.Cells[rowik + 7, i + 2].Value = double.Parse(dR[i - 1].ToString().Trim());
                        }
                        catch
                        {

                            MyWorksheet1.Cells[rowik + 7, i + 2].Value = dR[i - 1].ToString().Trim();
                        }

                        MyWorksheet1.Cells[rowik + 7, i + 2].Style.ShrinkToFit = true;
                        MyWorksheet1.Cells[rowik + 7, i + 2].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                    }
                    rowik++;
                }



                DataTable table2 = (DataTable)Session["tabelka003"];
                 MyWorksheet1 = tb.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[2], table2, 1,7,  1, 5, false);

                // trzecia

                DataTable table3 = (DataTable)Session["tabelka004"];
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[3], table3, 5, 0, 4, false, false, false, false, false);


                // czwarta

                DataTable table4 = (DataTable)Session["tabelka005"];
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[4], table4, 9, 0, 5, false, false, false, false, false);

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



        }
        protected void tabela_1()
        {
            if (Session["id_dzialu"]==null)
            {
                return;
            }
           
                string idDzialu = (string)Session["id_dzialu"];
                if (cl.debug(int.Parse(idDzialu)))
                {
                    //cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 1");
                }
                DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2018(int.Parse(idDzialu), 1, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 15, tenPlik);
                Session["tabelka001"] = tabelka01;
                gwTabela1.DataSource = null;
                gwTabela1.DataSourceID = null;
                gwTabela1.DataSource = tabelka01;
                gwTabela1.DataBind();
            
           
           
        }
        protected void tabela_4()
        {
        if (Session["id_dzialu"] == null)
        {
            return;
        }

        string idDzialu =  (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                //cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 3");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2018(int.Parse(idDzialu), 4, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 23, tenPlik);
            Session["tabelka004"] = tabelka01;
            gwTabela4.DataSource = null;
            gwTabela4.DataSourceID = null;
            gwTabela4.DataSource = tabelka01;
            gwTabela4.DataBind();
        }

        protected void tabela_5()
        {
            if (Session["id_dzialu"] == null)
            {
                return;
            }
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                //cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 4");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2018(int.Parse(idDzialu), 5, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 23, tenPlik);
            Session["tabelka005"] = tabelka01;
            gwTabela5.DataSource = null;
            gwTabela5.DataSourceID = null;
            gwTabela5.DataSource = tabelka01;
            gwTabela5.DataBind();
        }
        protected void tabela_3()
        {

            if (Session["id_dzialu"] == null)
            {
                return;
            }
            string idDzialu =  (string)Session["id_dzialu"];
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

                     

            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
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
               
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }
            return tabelka01;
        }

        protected void naglowekTabeli_gwTabela1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
              
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                string path = Server.MapPath("\\Template\\obbp.xlsx");
                DataTable dT = tb.naglowek(path, 1);
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
                string path = Server.MapPath("\\Template\\obbp.xlsx");
                DataTable dT = tb.naglowek(path, 3);
                tb.makeHeader(sn, dT, gwTabela4);
            }
        }

      
        protected void naglowekTabeli_gwTabela3(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                string path = Server.MapPath("\\Template\\obbp.xlsx") ;
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
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01,6 , idWiersza, idtabeli, "zaległości z poprzedniego miesiąca",2,0,"","borderAll center"));

            idWiersza = 2;


            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01,6, idWiersza, idtabeli, "Wpłynęło", 2, 0, "", "borderAll center"));

            // nowy wiersz
            idWiersza = 3;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01,6, idWiersza, idtabeli, "Załatwiono", 2, 0, "", "borderAll center"));

            // nowy wiersz
            idWiersza = 4;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01,6, idWiersza, idtabeli, "Pozostało na miesiąc następny", 2, 0, "", "borderAll center"));


            // nowy wiersz
            idWiersza = 5;

            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01,6, idWiersza, idtabeli, "Powyżej 3-6 miesięcy", 2, 0, "", "borderAll center"));

            // nowy wiersz
            idWiersza = 6;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01,6, idWiersza, idtabeli, "Powyżej 6-12 miesięcy", 2, 0, "", "borderAll center"));
            // nowy wiersz
            idWiersza = 7;
           
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01,6, idWiersza, idtabeli, "Powyżej 12 miesięcy", 2, 0, "", "borderAll center"));


        }


    }
}