using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using OfficeOpenXml;

namespace stat2018
{
    public partial class oktp : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();

        const string tenPlik = "oktp.aspx";

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
            string txt = string.Empty; //
            try
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 2");

                DataTable tabelka02 = dr.generuj_dane_do_tabeli_wierszy2018(DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), (string)Session["id_dzialu"], 2, 11, 22, tenPlik);
                Session["tabelka002"] = tabelka02;

                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 1");

                DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2018 (int.Parse (idDzialu),1, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 23, tenPlik);
                tabelka01.Columns.Remove("funkcja");
                tabelka01.Columns.Remove("stanowisko");

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

         

            dT_01.Clear();
            dT_01.Rows.Add(new Object[] { "1", "P", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Np.", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Po", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "U", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Uo", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Razem", "1", "1" });

            dT_01.Rows.Add(new Object[] { "1", "P", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Np.", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Po", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "U", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Uo", "1", "1" });
            dT_01.Rows.Add(new Object[] { "1", "Razem", "1", "1" });


            dT_01.Rows.Add(new Object[] { "2", "L.p.", "1", "2" });



            dT_01.Rows.Add(new Object[] { "2", " Imię i nazwisko sędziego", "1", "2" });
            dT_01.Rows.Add(new Object[] { "2", "Ilość sesji", "1", "2" });

            dT_01.Rows.Add(new Object[] { "2", "Liczba Przesł.osób", "1", "2" });


            dT_01.Rows.Add(new Object[] { "2", "Wpływ", "6", "1" });
            dT_01.Rows.Add(new Object[] { "2", "Załatwienia", "6", "1" });
            dT_01.Rows.Add(new Object[] { "2", "Absencja w diach roboczych", "1", "2" });
            

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
            dT_02.Rows.Add(new Object[] { "3", "Dni rozpraw", "1", "3", "h", "60" });//
            dT_02.Rows.Add(new Object[] { "3", "ZAŁATWIENIA Sprawy rodzinne i nieletnich", "16", "1", "h", "45" });//


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
                    tabela2Label.Text = "Sprawozdanie z ruchu spraw w za miesiąc " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    

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
           
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string path = Server.MapPath("Template") + "\\oktp.xlsx";
            FileInfo existingFile = new FileInfo(path);

            string download = Server.MapPath("Template") + @"\oktp";

            FileInfo fNewFile = new FileInfo(download + "_.xlsx");

            // pierwsza tabelka


            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                // pierwsza

                int rowik = 0;


                ExcelWorksheet MyWorksheet1 = MyExcel.Workbook.Worksheets[1];
              
                DataTable table = (DataTable)Session["tabelka001"];
            
                MyWorksheet1= tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], table, 16, 0,5, true,false,false,false,false);

              
                rowik = table.Rows.Count+3 ;
               
                // pod tabela z tebeli nr 2

              
                rowik = rowik + 2;
                tb.komorkaExcela(MyWorksheet1, rowik, 1, "Pozostało z poprzedniego okresu", true, 0, 3);
                tb.komorkaExcela(MyWorksheet1, rowik + 1, 1, "Wpłynęło", true, 0, 3);
                tb.komorkaExcela(MyWorksheet1, rowik + 2, 1, "Załatwiono", true, 0, 3);
                tb.komorkaExcela(MyWorksheet1, rowik + 3, 1, "Pozostało na następny okres", true, 0, 3);

                tb.komorkaExcela(MyWorksheet1, rowik + 4, 1, "Zaległości", true, 4, 1);

                tb.komorkaExcela(MyWorksheet1, rowik + 4, 3, "3 - 6 miesięcy", true, 0, 1);
                tb.komorkaExcela(MyWorksheet1, rowik + 5, 3, "6 - 12 miesięcy", true, 0, 1);
                tb.komorkaExcela(MyWorksheet1, rowik + 6, 3, "od 1 do 2 lat", true, 0, 1);
                tb.komorkaExcela(MyWorksheet1, rowik + 7, 3, "od 2 do 3 lat", true, 0, 1);
                tb.komorkaExcela(MyWorksheet1, rowik + 8, 3, "powyżej 3 lat", true, 0, 1);

             


                DataTable tabelka001 = (DataTable)Session["tabelka002"];
                for (int i = 0; i < 9; i++)
                {
                    for (int j = 0; j < 7; j++)
                    {
                        try
                        {
                            MyWorksheet1.Cells[rowik  + i, j + 4].Value = tabelka001.Rows[i][j].ToString();
                            MyWorksheet1.Cells[rowik + i, j+4].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                        }
                        catch (Exception ec)
                        {  }
                        
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



        // podtabela
     


        GridViewRow wierszTabeli3(DataTable tabelka01, int idWiersza, string idtabeli, string tekst)
        {
            // nowy wiersz

            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
          
            NewTotalRow.Cells.Add(tb.cela(tekst, 1, 2, "borderTopLeft  "));
        
            for (int i = 1; i < 7; i++)
            {
                NewTotalRow.Cells.Add(tb.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!2!" + i.ToString().Trim() + "!3')\">" + tabelka01.Rows[idWiersza-1][i].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
                 }
       
            return NewTotalRow;
        }



        GridViewRow wierszTabela2(DataTable tabelka01, int idWiersza, string idtabeli, string tekst)
        {
            // nowy wiersz

            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
            NewTotalRow.Cells.Add(tb.cela("Zaległości", 5, 2, "borderTopLeft col_260"));
            NewTotalRow.Cells.Add(tb.cela(tekst, 1, 2, "borderTopLeft  "));
        
            for (int i = 1; i < 7; i++)
            {
                NewTotalRow.Cells.Add(tb.cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!2!" + i.ToString().Trim() + "!3')\">" + tabelka01.Rows[idWiersza-1][i].ToString().Trim() + "</a>", 1, 1, "borderTopLeft"));
            }
          
            return NewTotalRow;


        }


   

        public void AddNewRow(object sender, GridViewRowEventArgs e)
        {
            DataTable tabelka01 = (DataTable)Session["tabelka002"];
            DataTable tabelka02 = (DataTable)Session["tabelka001"];
            

            GridView GridView1 = (GridView)sender;
            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);

            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex,tb.PodsumowanieTabeli (tabelka02,16, "normal borderAll center"));

            string idtabeli = "2";
         
            // nowy wiersz
            int idWiersza = 1;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 7, idWiersza, idtabeli, "Pozostało z poprzedniego okresu", 4, 1, "normal ", "borderAll center"));
            
            idWiersza = 2;


            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex,tb.wierszTabeli(tabelka01,7,idWiersza,idtabeli, "Wpłynęło",4,1, "normal ", "borderAll center"));

            // nowy wiersz
            idWiersza = 3;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 7, idWiersza, idtabeli, "Załatwiono", 4, 1, "normal ", "borderAll center"));
            

            // nowy wiersz
            idWiersza = 4;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, tb.wierszTabeli(tabelka01, 7, idWiersza, idtabeli, "Pozostało na następny okres", 4, 1, "normal ", "borderAll center"));
           

            // nowy wiersz
            idWiersza = 5;
          
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabela2(tabelka01, idWiersza, idtabeli, "3-6 m-cy"));
            // nowy wiersz
            idWiersza = 6;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli3(tabelka01, idWiersza, idtabeli, "6 - 12 miesięcy"));

            // nowy wiersz
            idWiersza = 7;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli3(tabelka01, idWiersza, idtabeli, "od 1 do 2 lat"));

            idWiersza = 8;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli3(tabelka01, idWiersza, idtabeli, "od 2 do 3 lat"));
            //wierszTabelia3
            idWiersza = 9;
            GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, wierszTabeli3(tabelka01, idWiersza, idtabeli, "powyżej 3 lat"));

           

  





        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}