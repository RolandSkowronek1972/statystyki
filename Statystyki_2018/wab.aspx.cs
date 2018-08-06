using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI;
using OfficeOpenXml;


namespace stat2018
{
   
    public partial class wab : System.Web.UI.Page
    {

        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();

        public dataReaders dr = new dataReaders();
     
        public static string tenPlik = "wab.aspx";

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
                 Server.Transfer("default.aspx");
            }
        }// end of Page_Load

  
        protected void przemiel()
        {
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
            string txt = string.Empty; //
            try
            {
                
                DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), (string)Session["id_dzialu"], 1,1,12,tenPlik);
                Session["tabelka002"] = tabelka01;
                //row 1
                tab_01_w01_c01.Text = tabelka01.Rows[0][1].ToString();
                tab_01_w01_c02.Text = tabelka01.Rows[0][2].ToString();
                tab_01_w01_c03.Text = tabelka01.Rows[0][3].ToString();
                tab_01_w01_c04.Text = tabelka01.Rows[0][4].ToString();
                tab_01_w01_c05.Text = tabelka01.Rows[0][5].ToString();
                tab_01_w01_c06.Text = tabelka01.Rows[0][6].ToString();
            
                tab_01_w01_c07.Text = tabelka01.Rows[0][7].ToString();
                tab_01_w01_c08.Text = tabelka01.Rows[0][8].ToString();
                tab_01_w01_c09.Text = tabelka01.Rows[0][9].ToString();
                tab_01_w01_c10.Text = tabelka01.Rows[0][10].ToString();
                tab_01_w01_c11.Text = tabelka01.Rows[0][11].ToString();
                tab_01_w01_c12.Text = tabelka01.Rows[0][12].ToString();

            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex);
            }

            try
            {

                DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), (string)Session["id_dzialu"],2, 1, 12, tenPlik);
                Session["tabelka001"] = tabelka01;
                //row 1
                tab_02_w01_c01.Text = tabelka01.Rows[0][1].ToString();
                tab_02_w01_c02.Text = tabelka01.Rows[0][2].ToString();
                tab_02_w01_c03.Text = tabelka01.Rows[0][3].ToString();
                tab_02_w01_c04.Text = tabelka01.Rows[0][4].ToString();
                tab_02_w01_c05.Text = tabelka01.Rows[0][5].ToString();
                tab_02_w01_c06.Text = tabelka01.Rows[0][6].ToString();

                tab_02_w01_c07.Text = tabelka01.Rows[0][7].ToString();
                tab_02_w01_c08.Text = tabelka01.Rows[0][8].ToString();
                tab_02_w01_c09.Text = tabelka01.Rows[0][9].ToString();
                tab_02_w01_c10.Text = tabelka01.Rows[0][10].ToString();
                tab_02_w01_c11.Text = tabelka01.Rows[0][11].ToString();
                tab_02_w01_c12.Text = tabelka01.Rows[0][12].ToString();
                tab_02_w01_c13.Text = tabelka01.Rows[0][13].ToString();
                tab_02_w01_c14.Text = tabelka01.Rows[0][14].ToString();

            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex);
            }

            try
            {

                DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), (string)Session["id_dzialu"], 3, 1, 12, tenPlik);
                Session["tabelka003"] = tabelka01;
                //row 1
                tab_03_w01_c01.Text = tabelka01.Rows[0][1].ToString();
                tab_03_w01_c02.Text = tabelka01.Rows[0][2].ToString();
                tab_03_w01_c03.Text = tabelka01.Rows[0][3].ToString();
                tab_03_w01_c04.Text = tabelka01.Rows[0][4].ToString();
                tab_03_w01_c05.Text = tabelka01.Rows[0][5].ToString();
                tab_03_w01_c06.Text = tabelka01.Rows[0][6].ToString();

                tab_03_w01_c07.Text = tabelka01.Rows[0][7].ToString();
                tab_03_w01_c08.Text = tabelka01.Rows[0][8].ToString();
            
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex);
            }
            // dopasowanie opisów
            makeLabels();

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
                    lbTabela01.Text = "Tabela przedstawiająca terminowość przyznawania wynagrodzenia biegłym i tłumaczom oraz skierowania wydanych w tym zakresie orzeczeń do wykonania w sądownictwie powszechnym w miesiącu " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                }
                else
                {
                    lbTabela01.Text = "Tabela przedstawiająca terminowość przyznawania wynagrodzenia biegłym i tłumaczom oraz skierowania wydanych w tym zakresie orzeczeń do wykonania w sądownictwie powszechnym  w okresie od " + Date1.Text + " do  " + Date2.Text;

                }
            }
            catch
            {}

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string path = Server.MapPath("Template") + "\\wab.xlsx";
            FileInfo existingFile = new FileInfo(path);

            string download = Server.MapPath("Template") + @"\wab";

            FileInfo fNewFile = new FileInfo(download + "_.xlsx");

            // pierwsza tabelka

            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                // pierwsza

                int rowik = 4;
                try
                {
                    ExcelWorksheet MyWorksheet1 = MyExcel.Workbook.Worksheets[1];
                    DataTable tabelka001 = (DataTable)Session["tabelka001"];
                    for (int i = 1; i <= 12; i++)
                    {
                        try
                        {
                            MyWorksheet1.Cells[rowik, i + 1].Value = double.Parse(tabelka001.Rows[0][i].ToString().Trim());
                        }
                        catch
                        {
                            MyWorksheet1.Cells[rowik, i + 1].Value = tabelka001.Rows[0][i + 1].ToString().Trim();
                        }
                        MyWorksheet1.Cells[rowik, i + 1].Style.ShrinkToFit = true;
                        MyWorksheet1.Cells[rowik, i + 1].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                    }

                }
                catch (Exception ex)
                {
                    cm.log.Error(tenPlik + " Generowanie pliku Excell " + ex.Message);
                }

                //druga 
                try
                {
                    DataTable tabelka001 = (DataTable)Session["tabelka002"];
                    ExcelWorksheet MyWorksheet2 = MyExcel.Workbook.Worksheets[2];
                    for (int i = 0; i < 14; i++)
                    {
                        tb.komorkaExcela(MyWorksheet2,  4, 1, tabelka001.Rows[0][i].ToString().Trim(),false, 0, 0);
                    }
                }
                catch (Exception ex)
                {
                    cm.log.Error(tenPlik + " Generowanie pliku Excell " + ex.Message);
                }

                //trzecoa 
                try
                {
                    DataTable tabelka001 = (DataTable)Session["tabelka003"];

                    ExcelWorksheet MyWorksheet2 = MyExcel.Workbook.Worksheets[3];
                    for (int i = 0; i < 7; i++)
                    {
                        tb.komorkaExcela(MyWorksheet2, 4, 1, tabelka001.Rows[0][i].ToString().Trim(), false, 0, 0);

                    }

                }
                catch (Exception ex)
                {
                    cm.log.Error(tenPlik + " Generowanie pliku Excell " + ex.Message);
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
                    cm.log.Error(tenPlik + " Generowanie pliku Excell " + ex.Message);
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


 
    }
}