using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using OfficeOpenXml;

namespace stat2018
{
    public partial class oktg : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tabela = new tabele();
        public dataReaders dr = new dataReaders();
        const string tenPlik = "oktg.aspx";


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
                cm.log.Error(tenPlik + " " + ex.Message);
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
            string idDzialu = (string)Session["id_dzialu"];
            string txt = string.Empty; 
            
            DataTable tabelkaGW1 = new DataTable();
            DataTable tabelkaGW2 = new DataTable();
            DataTable tabelkaGW3 = new DataTable();

            try
            {
                cm.log.Info("OGLR2: wczytywanie danych do tabeli 2");
                tabelkaGW2 = dr.generuj_dane_do_tabeli_wierszy2018(DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), (string)Session["id_dzialu"], 2, 11, 8, tenPlik);
                Session["tabelkaGW002"] = tabelkaGW2;
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + "  " + ex.Message);
            }

            try
            {
                cm.log.Info(tenPlik + ": wczytywanie danych do tabeli 1");
                tabelkaGW1 = dr.generuj_dane_do_tabeli_sedziowskiej_2018(int.Parse((string)Session["id_dzialu"]), 1, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 30, tenPlik);
                Session["tabelkaGW001"] = tabelkaGW1;
                Tabela1.DataSource = null;
                Tabela1.DataSourceID = null;
                Tabela1.DataSource = tabelkaGW1;
                Tabela1.DataBind();
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + "  " + ex.Message);
            }
           

            try
            {
                    cm.log.Info(tenPlik+": wczytywanie danych do tabeli 3");
                    tabelkaGW3 = dr.generuj_dane_do_tabeli_sedziowskiej_2018(int.Parse((string)Session["id_dzialu"]), 3, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 30, tenPlik);
                    Session["tabelkaGW003"] = tabelkaGW3;
                    Gridview3.DataSource = null;
                    Gridview3.DataSourceID = null;
                    Gridview3.DataSource = tabelkaGW3;
                    Gridview3.DataBind();

                }
                catch (Exception ex)
                {

                    cm.log.Error("OGLR2: " + ex.Message);

                }
            
            // dopasowanie opisów
            makeLabels();

           
            try
            {
                Label11.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel2.Visible = cl.debug(int.Parse(idDzialu ));

                
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

            DataTable dT_07 = new DataTable();
            dT_07.Columns.Clear();
            dT_07.Columns.Add("Column1", typeof(string));
            dT_07.Columns.Add("Column2", typeof(string));
            dT_07.Columns.Add("Column3", typeof(string));
            dT_07.Columns.Add("Column4", typeof(string));
            dT_07.Columns.Add("Column5", typeof(string));
            dT_07.Columns.Add("Column6", typeof(string));

            DataTable dT_08 = new DataTable();
            dT_08.Columns.Clear();
            dT_08.Columns.Add("Column1", typeof(string));
            dT_08.Columns.Add("Column2", typeof(string));
            dT_08.Columns.Add("Column3", typeof(string));
            dT_08.Columns.Add("Column4", typeof(string));
            dT_08.Columns.Add("Column5", typeof(string));
            dT_08.Columns.Add("Column6", typeof(string));


            dT_01.Clear();

            dT_01.Rows.Add(new Object[] { "1", "GC", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "GNs", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "GNc", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Gco", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "GCps", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Razem", "1", "1" });

            dT_01.Rows.Add(new Object[] { "1", "GC", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "GNs", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "GNc", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Gco", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "GCps", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Razem", "1", "1" });


            dT_01.Rows.Add(new Object[] { "2", "L.p.", "1", "2" });

            dT_01.Rows.Add(new Object[] { "2", "Sędzia", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "Ilość odbytych sesji/spraw", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "Liczba przesłuchanych stron", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "Wpływ", "6", "1" });
            dT_01.Rows.Add(new Object[] { "2", "Załatwienia", "6", "1" });

            dT_01.Rows.Add(new Object[] { "2", "Absencja w dn. rob.", "1", "2" });
            Session["header_01"] = dT_01;

            #endregion


            #region tabela  2 ()

            dT_02.Clear();


            dT_02.Rows.Add(new Object[] { "1", "GC", "1", "1" });
            dT_02.Rows.Add(new Object[] { "1", "GNs", "1", "1" });
            dT_02.Rows.Add(new Object[] { "1", "GNc", "1", "1" });
            dT_02.Rows.Add(new Object[] { "1", "Gco", "1", "1" });
            dT_02.Rows.Add(new Object[] { "1", "GCps", "1", "1" });
            dT_02.Rows.Add(new Object[] { "1", "Razem", "1", "1" });
            
            dT_02.Rows.Add(new Object[] { "2", "L.p.", "1", "2", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "2", "Nazwisko i imie sędziego ", "1", "2", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "2", "Zaległości", "6", "1", "h", });//

            Session["header_02"] = dT_02;



            #endregion
        

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
                    tabela2Label.Text = "Wydajność sędziów orzekających w Wydziale w za miesiąc " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    lbTabela3Title.Text = "Terminowość sporządzania uzasadnień za miesiąc " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";

                    
                }
                else
                {
                    tabela2Label.Text = "Wydajność sędziów orzekających w Wydziale za okres od " + Date1.Text + " do  " + Date2.Text;
                    lbTabela3Title.Text = "Terminowość sporządzania uzasadnień za okres od" + Date1.Text + " do  " + Date2.Text;

                    
                }
            }
            catch
            {

            }

        }

       

        protected void Button3_Click(object sender, EventArgs e)
        {
            FileInfo tenPlikExcela= new FileInfo(tenPlik);
            string path = Server.MapPath("Template") + "\\"+Path.GetFileNameWithoutExtension ( tenPlikExcela.Name)  + ".xlsx";
            FileInfo existingFile = new FileInfo(path);

            string download = Server.MapPath("Template") + @"\"+ Path.GetFileNameWithoutExtension(tenPlikExcela.Name);

            FileInfo fNewFile = new FileInfo(download + "_.xlsx");

            // pierwsza tabelka
            
            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                // pierwsza

                ExcelWorksheet MyWorksheet1 = MyExcel.Workbook.Worksheets[1];
                DataTable table = (DataTable)Session["tabelkaGW001"];
                table.Columns.Remove("id");
                table.Columns.Remove("id_sedziego");
                table.Columns.Remove("stanowisko");
                table.Columns.Remove("funkcja");
                table.Columns.Remove("id_tabeli");
                MyWorksheet1 = tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], table, 14,1, 6,true,false,false,false,false);

                //druga

                ExcelWorksheet MyWorksheet2 = MyExcel.Workbook.Worksheets[2];
                table = (DataTable)Session["tabelkaGW003"];
                table.Columns.Remove("id");
                table.Columns.Remove("id_sedziego");
                table.Columns.Remove("stanowisko");
                table.Columns.Remove("funkcja");
                table.Columns.Remove("id_tabeli");

                MyWorksheet2 = tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[2], table, 7, 1, 6, true, false, false, false, false);

                
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
            przemiel();
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "print2", "JavaScript: window.print();", true);
            makeLabels();
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
        protected void Gridview1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = ((DataView)daneDoTabeli1.Select(DataSourceSelectArguments.Empty)).ToTable();

                makeSumRow(table, e);

            }
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                storid = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "id").ToString());

            }

        }

   
       

        protected void Gridview1_RowCreated1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_01"];
                tabela.makeHeader(sn, dT, Tabela1);
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

        protected void Gridview1_RowDataBound1(object sender, GridViewRowEventArgs e)
        {
           
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                storid = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "id").ToString());
            }
        }

        protected void naglowekTabeli_Tabela1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_01"];
                cl.makeHeader(sn, dT, Tabela1);
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

        protected void stopkaTabeli_Tabela1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                storid = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "id").ToString());
            }
        
        }

    
        protected void naglowekTabela3(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_02"];
                tabela.makeHeader(sn, dT, Gridview3);
            }
        }

      
        protected void stopkaTabeli2(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelkaGW002"];
                tabela.makeSumRow(table, e);

            }
        }

        protected void Gridview3_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelkaGW003"];
                tabela.makeSumRow(table, e);
            }
        }

        
        public void AddNewRow(object sender, GridViewRowEventArgs e)
        {
            GridView GridView1 = (GridView)sender;
            string idtabeli = "2";

            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tabela.PodsumowanieTabeli((DataTable)Session["tabelkaGW001"], 16,  "normal borderTopLeft"));

            // nowy wiersz
            int idWiersza = 1;
            
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tabela.wierszTabeli((DataTable)Session["tabelkaGW002"], 7, idWiersza, idtabeli, "Pozostało z okresu poprzedniego", 4, 1, "normal", "borderTopLeft"));

            idWiersza = 2;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tabela.wierszTabeli((DataTable)Session["tabelkaGW002"], 7, idWiersza, idtabeli, "Wpływ spraw", 4, 1, "normal", "borderTopLeft"));

            // nowy wiersz
            idWiersza = 3;
            
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tabela.wierszTabeli((DataTable)Session["tabelkaGW002"], 7, idWiersza, idtabeli, "załatwienia", 4, 1, "normal", "borderTopLeft"));

            // nowy wiersz
            idWiersza = 4;
            
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tabela.wierszTabeli((DataTable)Session["tabelkaGW002"], 7, idWiersza, idtabeli, "pozostałość na okres następny", 4, 1, "normal", "borderTopLeft"));

            // nowy wiersz

            idWiersza = 5;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tabela.wierszTabeli((DataTable)Session["tabelkaGW002"], 7, idWiersza, idtabeli, "3-6 miesiecy", 1, 1, "normal", "", "Zaległość", 5, 3, "borderTopLeft "));

            // nowy wiersz
            idWiersza = 6;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tabela.wierszTabeli((DataTable)Session["tabelkaGW002"], 7, idWiersza, idtabeli, "6-12 miesiecy", 1, 1, "normal", "borderTopLeft"));
            
                   // nowy wiersz
            idWiersza = 7;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tabela.wierszTabeli((DataTable)Session["tabelkaGW002"], 7, idWiersza, idtabeli, "12 m-cy do 2 lat)", 1, 1, "normal", "borderTopLeft"));
            idWiersza = 8;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tabela.wierszTabeli((DataTable)Session["tabelkaGW002"], 7, idWiersza, idtabeli, "2-3 lat", 1, 1, "normal", "borderTopLeft"));

            idWiersza = 9;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tabela.wierszTabeli((DataTable)Session["tabelkaGW002"], 7, idWiersza, idtabeli, "powyżej 3 lat", 1, 1, "normal", "borderTopLeft"));

              
        }

      
    }
}