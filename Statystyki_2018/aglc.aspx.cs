﻿using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using OfficeOpenXml;

namespace stat2018
{
    public partial class aglc : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tabela = new tabele();
        public dataReaders dr = new dataReaders();

        public static string tenPlik = "aglc.aspx";

        protected void Page_Load(object sender, EventArgs e)
        {
            string idWydzial = Request.QueryString["w"];
            if (idWydzial != null)
            {
                Session["id_dzialu"] = idWydzial;
                //cm.log.Info(tenPlik + ": id wydzialu=" + idWydzial);
            }
            else
            {
                return;
            }
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
            string id_dzialu = (string)Session["id_dzialu"];
            string txt = string.Empty; 
         
            txt = txt + cl.clear_maim_db();
            //tabela 1
            try
            {
                DataTable Tabela2 = dr.generuj_dane_do_tabeli_sedziowskiej_2018(int.Parse(id_dzialu), 1, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 28, tenPlik);
                Session["tabelka001"] = Tabela2;
                gwTabela1.DataSource = null;
                gwTabela1.DataSourceID = null;
                gwTabela1.DataSource = Tabela2;
                gwTabela1.DataBind();

            }
            catch (Exception ex)
            {
                //cm.log.Error(tenPlik +" " +ex.Message);   
            }
            //tabela 2
            try
            {
                DataTable tabela02 = dr.generuj_dane_do_tabeli_wierszy2018(DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), ((string)Session["id_dzialu"]), 2, 24, 43, tenPlik);

                Session["tabelka002"] = tabela02;
               
                //  wiersz 1
                tab_tabela2_w01_c01.Text = tabela02.Rows[0][1].ToString().Trim();
                tab_tabela2_w01_c02.Text = tabela02.Rows[0][2].ToString().Trim();
                tab_tabela2_w01_c03.Text = tabela02.Rows[0][3].ToString().Trim();
                tab_tabela2_w01_c04.Text = tabela02.Rows[0][4].ToString().Trim();
                tab_tabela2_w01_c05.Text = tabela02.Rows[0][5].ToString().Trim();
                tab_tabela2_w01_c06.Text = tabela02.Rows[0][6].ToString().Trim();
                tab_tabela2_w01_c07.Text = tabela02.Rows[0][7].ToString().Trim();
                tab_tabela2_w01_c08.Text = tabela02.Rows[0][8].ToString().Trim();
                tab_tabela2_w01_c09.Text = tabela02.Rows[0][9].ToString().Trim();
                //  wiersz 2
                tab_tabela2_w02_c01.Text = tabela02.Rows[1][1].ToString().Trim();
                tab_tabela2_w02_c02.Text = tabela02.Rows[1][2].ToString().Trim();
                tab_tabela2_w02_c03.Text = tabela02.Rows[1][3].ToString().Trim();
                tab_tabela2_w02_c04.Text = tabela02.Rows[1][4].ToString().Trim();
                tab_tabela2_w02_c05.Text = tabela02.Rows[1][5].ToString().Trim();
                tab_tabela2_w02_c06.Text = tabela02.Rows[1][6].ToString().Trim();
                tab_tabela2_w02_c07.Text = tabela02.Rows[1][7].ToString().Trim();
                tab_tabela2_w02_c08.Text = tabela02.Rows[1][8].ToString().Trim();
                tab_tabela2_w02_c09.Text = tabela02.Rows[1][9].ToString().Trim();
                //  wiersz 3
                tab_tabela2_w03_c01.Text = tabela02.Rows[2][1].ToString().Trim();
                tab_tabela2_w03_c02.Text = tabela02.Rows[2][2].ToString().Trim();
                tab_tabela2_w03_c03.Text = tabela02.Rows[2][3].ToString().Trim();
                tab_tabela2_w03_c04.Text = tabela02.Rows[2][4].ToString().Trim();
                tab_tabela2_w03_c05.Text = tabela02.Rows[2][5].ToString().Trim();
                tab_tabela2_w03_c06.Text = tabela02.Rows[2][6].ToString().Trim();
                tab_tabela2_w03_c07.Text = tabela02.Rows[2][7].ToString().Trim();
                tab_tabela2_w03_c08.Text = tabela02.Rows[2][8].ToString().Trim();
                tab_tabela2_w03_c09.Text = tabela02.Rows[2][9].ToString().Trim();
                //  wiersz 4
                tab_tabela2_w04_c01.Text = tabela02.Rows[3][1].ToString().Trim();
                tab_tabela2_w04_c02.Text = tabela02.Rows[3][2].ToString().Trim();
                tab_tabela2_w04_c03.Text = tabela02.Rows[3][3].ToString().Trim();
                tab_tabela2_w04_c04.Text = tabela02.Rows[3][4].ToString().Trim();
                tab_tabela2_w04_c05.Text = tabela02.Rows[3][5].ToString().Trim();
                tab_tabela2_w04_c06.Text = tabela02.Rows[3][6].ToString().Trim();
                tab_tabela2_w04_c07.Text = tabela02.Rows[3][7].ToString().Trim();
                tab_tabela2_w04_c08.Text = tabela02.Rows[3][8].ToString().Trim();
                tab_tabela2_w04_c09.Text = tabela02.Rows[3][9].ToString().Trim();
                //  wiersz 5
                tab_tabela2_w05_c01.Text = tabela02.Rows[4][1].ToString().Trim();
                tab_tabela2_w05_c02.Text = tabela02.Rows[4][2].ToString().Trim();
                tab_tabela2_w05_c03.Text = tabela02.Rows[4][3].ToString().Trim();
                tab_tabela2_w05_c04.Text = tabela02.Rows[4][4].ToString().Trim();
                tab_tabela2_w05_c05.Text = tabela02.Rows[4][5].ToString().Trim();
                tab_tabela2_w05_c06.Text = tabela02.Rows[4][6].ToString().Trim();
                tab_tabela2_w05_c07.Text = tabela02.Rows[4][7].ToString().Trim();
                tab_tabela2_w05_c08.Text = tabela02.Rows[4][8].ToString().Trim();
                tab_tabela2_w05_c09.Text = tabela02.Rows[4][9].ToString().Trim();
                //  wiersz 6
                tab_tabela2_w06_c01.Text = tabela02.Rows[5][1].ToString().Trim();
                tab_tabela2_w06_c02.Text = tabela02.Rows[5][2].ToString().Trim();
                tab_tabela2_w06_c03.Text = tabela02.Rows[5][3].ToString().Trim();
                tab_tabela2_w06_c04.Text = tabela02.Rows[5][4].ToString().Trim();
                tab_tabela2_w06_c05.Text = tabela02.Rows[5][5].ToString().Trim();
                tab_tabela2_w06_c06.Text = tabela02.Rows[5][6].ToString().Trim();
                tab_tabela2_w06_c07.Text = tabela02.Rows[5][7].ToString().Trim();
                tab_tabela2_w06_c08.Text = tabela02.Rows[5][8].ToString().Trim();
                tab_tabela2_w06_c09.Text = tabela02.Rows[5][9].ToString().Trim();
                //  wiersz 7
                tab_tabela2_w07_c01.Text = tabela02.Rows[6][1].ToString().Trim();
                tab_tabela2_w07_c02.Text = tabela02.Rows[6][2].ToString().Trim();
                tab_tabela2_w07_c03.Text = tabela02.Rows[6][3].ToString().Trim();
                tab_tabela2_w07_c04.Text = tabela02.Rows[6][4].ToString().Trim();
                tab_tabela2_w07_c05.Text = tabela02.Rows[6][5].ToString().Trim();
                tab_tabela2_w07_c06.Text = tabela02.Rows[6][6].ToString().Trim();
                tab_tabela2_w07_c07.Text = tabela02.Rows[6][7].ToString().Trim();
                tab_tabela2_w07_c08.Text = tabela02.Rows[6][8].ToString().Trim();
                tab_tabela2_w07_c09.Text = tabela02.Rows[6][9].ToString().Trim();
                //  wiersz 8
                tab_tabela2_w08_c01.Text = tabela02.Rows[7][1].ToString().Trim();
                tab_tabela2_w08_c02.Text = tabela02.Rows[7][2].ToString().Trim();
                tab_tabela2_w08_c03.Text = tabela02.Rows[7][3].ToString().Trim();
                tab_tabela2_w08_c04.Text = tabela02.Rows[7][4].ToString().Trim();
                tab_tabela2_w08_c05.Text = tabela02.Rows[7][5].ToString().Trim();
                tab_tabela2_w08_c06.Text = tabela02.Rows[7][6].ToString().Trim();
                tab_tabela2_w08_c07.Text = tabela02.Rows[7][7].ToString().Trim();
                tab_tabela2_w08_c08.Text = tabela02.Rows[7][8].ToString().Trim();
                tab_tabela2_w08_c09.Text = tabela02.Rows[7][9].ToString().Trim();
                //  wiersz 9
                tab_tabela2_w09_c01.Text = tabela02.Rows[8][1].ToString().Trim();
                tab_tabela2_w09_c02.Text = tabela02.Rows[8][2].ToString().Trim();
                tab_tabela2_w09_c03.Text = tabela02.Rows[8][3].ToString().Trim();
                tab_tabela2_w09_c04.Text = tabela02.Rows[8][4].ToString().Trim();
                tab_tabela2_w09_c05.Text = tabela02.Rows[8][5].ToString().Trim();
                tab_tabela2_w09_c06.Text = tabela02.Rows[8][6].ToString().Trim();
                tab_tabela2_w09_c07.Text = tabela02.Rows[8][7].ToString().Trim();
                tab_tabela2_w09_c08.Text = tabela02.Rows[8][8].ToString().Trim();
                tab_tabela2_w09_c09.Text = tabela02.Rows[8][9].ToString().Trim();
                //  wiersz 10
                tab_tabela2_w10_c01.Text = tabela02.Rows[9][1].ToString().Trim();
                tab_tabela2_w10_c02.Text = tabela02.Rows[9][2].ToString().Trim();
                tab_tabela2_w10_c03.Text = tabela02.Rows[9][3].ToString().Trim();
                tab_tabela2_w10_c04.Text = tabela02.Rows[9][4].ToString().Trim();
                tab_tabela2_w10_c05.Text = tabela02.Rows[9][5].ToString().Trim();
                tab_tabela2_w10_c06.Text = tabela02.Rows[9][6].ToString().Trim();
                tab_tabela2_w10_c07.Text = tabela02.Rows[9][7].ToString().Trim();
                tab_tabela2_w10_c08.Text = tabela02.Rows[9][8].ToString().Trim();
                tab_tabela2_w10_c09.Text = tabela02.Rows[9][9].ToString().Trim();


            }
            catch (Exception ex)
            {
                //cm.log.Error(tenPlik + " " + ex.Message);
            }
            //tabela 3
            try
            {
                DataTable Tabela2 = dr.generuj_dane_do_tabeli_sedziowskiej_2018(int.Parse(id_dzialu), 3, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 26, tenPlik);
                Session["tabelka003"] = Tabela2;
                gwTabela3.DataSource = null;
                gwTabela3.DataSourceID = null;
                gwTabela3.DataSource = Tabela2;
                gwTabela3.DataBind();
              
               
                

            }
            catch (Exception ex)
            {
                //cm.log.Error(tenPlik + " " + ex.Message);
            }

            //tabela 4
            try
            {
                DataTable tabela04 = dr.generuj_dane_do_tabeli_wierszy2018(DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), ((string)Session["id_dzialu"]), 4, 8, 2, tenPlik);

                Session["tabelka004"] = tabela04;
                //  wiersz 1

                tab_tabela4_w01_c01.Text = tabela04.Rows[0][1].ToString().Trim();

                //  wiersz 2
                tab_tabela4_w02_c01.Text = tabela04.Rows[1][1].ToString().Trim();

                //  wiersz 3
                tab_tabela4_w03_c01.Text = tabela04.Rows[2][1].ToString().Trim();

                //  wiersz 4
                tab_tabela4_w04_c01.Text = tabela04.Rows[3][1].ToString().Trim();

                //  wiersz 5
                tab_tabela4_w05_c01.Text = tabela04.Rows[4][1].ToString().Trim();

                //  wiersz 6
                tab_tabela4_w06_c01.Text = tabela04.Rows[5][1].ToString().Trim();

                //  wiersz 7
                tab_tabela4_w07_c01.Text = tabela04.Rows[6][1].ToString().Trim();

                //  wiersz 8
                tab_tabela4_w08_c01.Text = tabela04.Rows[7][1].ToString().Trim();


            }
            catch (Exception ex)
            {
                //cm.log.Error(tenPlik + " " + ex.Message);
            }

           

            // dopasowanie opisów
            makeLabels();
          

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

            DataTable dT_06 = new DataTable();
            dT_06.Columns.Clear();
            dT_06.Columns.Add("Column1", typeof(string));
            dT_06.Columns.Add("Column2", typeof(string));
            dT_06.Columns.Add("Column3", typeof(string));
            dT_06.Columns.Add("Column4", typeof(string));
            dT_06.Columns.Add("Column5", typeof(string));

            dT_01.Clear();

            for (int i = 0; i < 9; i++)
            {
                dT_01.Rows.Add(new Object[] { "1", "Razem", "1", "1", "h" });
                dT_01.Rows.Add(new Object[] { "1", "R", "1", "1", "h" });
                dT_01.Rows.Add(new Object[] { "1", "P", "1", "1", "h" });
            }
           

            dT_01.Rows.Add(new Object[] { "2", "C", "3", "1", "h" });
            dT_01.Rows.Add(new Object[] { "2", "Ns", "3", "1", "h" });
            dT_01.Rows.Add(new Object[] { "2", "Co I inst.", "3", "1", "h" });
            dT_01.Rows.Add(new Object[] { "2", "Ca", "3", "1", "h" });
            dT_01.Rows.Add(new Object[] { "2", "Cz", "3", "1", "h" });
            dT_01.Rows.Add(new Object[] { "2", "Co II inst.", "3", "1", "h" });
            dT_01.Rows.Add(new Object[] { "2", "Wykaz S", "3", "1", "h" });
            dT_01.Rows.Add(new Object[] { "2", "WSC", "3", "1", "h" });
            dT_01.Rows.Add(new Object[] { "2", "Razem", "3", "1", "h" });
            dT_01.Rows.Add(new Object[] { "3", "L.p.", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "Nazwisko i imię sędziego", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "Załatwienia", "28", "1", "h" });
            Session["header_01"] = dT_01;

            #endregion


        
            #region tabela  3 ()

            dT_03.Clear();
            //dT_03.Rows.Add(new Object[] { "3", "Sędzia", colspan, rowspan, "h" });

            for (int i = 0; i < 6; i++)
            {
                dT_03.Rows.Add(new Object[] { "1", "Odrocz.", "1", "1", "h" });
                dT_03.Rows.Add(new Object[] { "1", "Odrocz publ.", "1", "1", "h" });
            }
            dT_03.Rows.Add(new Object[] { "1", "Odrocz.", "1", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "6", "1", "1", "h" });


            dT_03.Rows.Add(new Object[] { "2", "C", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Ns", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Co I insta", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Ca", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Cz", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Co II insta", "2", "1", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Wykaz S", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "WSC", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Razem", "2", "1", "h" });

           

            dT_03.Rows.Add(new Object[] { "3", "L.p.", "1", "3", "h" });
            dT_03.Rows.Add(new Object[] { "3", "Sędzia", "1", "3", "h" });

            dT_03.Rows.Add(new Object[] { "3", "Odroczenia", "16", "1", "h" });
            Session["header_03"] = dT_03;

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
                lbTabela1.Text = "Miesięczny ruch spraw w " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";

                //lbtabela02.Text = "Miesięczny ruch spraw w " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                lbTabela3.Text = "Miesięczny ruch spraw w " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                lbTabela4.Text = "Miesięczny ruch spraw w " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";

                Label6.Text = cl.nazwaSadu((string)Session["id_dzialu"]);

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
            string path = Server.MapPath("Template") + "\\aglc.xlsx";
            FileInfo existingFile = new FileInfo(path);

            string download = Server.MapPath("Template") + @"\aglc";

            FileInfo fNewFile = new FileInfo(download + "_.xlsx");

            // pierwsza tabelka

            DataTable tabelka001 = (DataTable)Session["tabelka001"];


            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                // pierwsza
               
                DataTable table = (DataTable)Session["tabelka001"];
               tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], table, 26, 0, 5, false,false,false,false,false);

                // druga 
                DataTable table2 = (DataTable)Session["tabelka002"];
                tabela.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[2], table2, 10, 10, 1, 2,false);
                
                // trzecia 
                DataTable table3 = (DataTable)Session["tabelka003"];
                tabela.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[3], table3, 26, 0, 3, false, false, false, false, false);

                DataTable table4 = (DataTable)Session["tabelka004"];
                tabela.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[4], table4, 8, 2, 1, 2,false);


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
                    //cm.log.Error(tenPlik + " " + ex.Message);

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

        protected void naglowekTabeli_gwTabela1(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_01"];
                tabela.makeHeader(sn, dT, gwTabela1);
            }
        }

        protected void stopkaTabeli_gwTabela1(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka001"];
                tabela.makeSumRow(table, e);
            }
        }

        protected void naglowekTabeli_gwTabela3(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = (DataTable)Session["header_03"];
                tabela.makeHeader(sn, dT, gwTabela3);
            }
        }

        protected void stopkaTabeli_gwTabela3(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka003"];
                tabela.makeSumRow(table, e);
            }
        }
    }
}