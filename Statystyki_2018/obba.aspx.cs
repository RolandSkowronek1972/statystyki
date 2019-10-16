using OfficeOpenXml;
using System;
using System.Data;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace stat2018
{
    public partial class obba : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();

        public dataReaders dr = new dataReaders();

        public static string tenPlik = "obba.aspx";

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
                        odswiez();
                    }
                }
            }
            catch
            {
                Server.Transfer("default.aspx");
            }
        }// end of Page_Load

        protected void odswiez()
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
                DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(Date1.Date, Date2.Date, (string)Session["id_dzialu"], 1, 30, 9, tenPlik);
                Session["tabelka001"] = tabelka01;
                pisz("tab_1_", 30, 7, tabelka01);
                //row 1
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " wypełnianie danymi " + ex);
            }

            Label11.Visible = false;
            Label11.Text = txt;
            Label3.Text = cl.nazwaSadu((string)Session["id_dzialu"]);
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string path = Server.MapPath("Template") + "\\obba.xlsx";
            FileInfo existingFile = new FileInfo(path);
            string download = Server.MapPath("Template") + @"\obba";

            FileInfo fNewFile = new FileInfo(download + "_.xlsx");

            // pierwsza tabelka

            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                // pierwsza

              ExcelWorksheet MyWorksheet1 = MyExcel.Workbook.Worksheets[1];
                    DataTable tabelka001 = (DataTable)Session["tabelka001"];
                try
                {


                    for (int i = 0; i <= 6; i++)
                    {
                        cm.log.Info("Generowanie excell obba i= " + i.ToString());
                        tb.komorkaExcela(MyWorksheet1, i+3, 2, tabelka001.Rows[i][1].ToString().Trim(), false, 0, 0);
                        tb.komorkaExcela(MyWorksheet1, i+3, 4, tabelka001.Rows[i][2].ToString().Trim(), false, 0, 0);
                        tb.komorkaExcela(MyWorksheet1, i+3, 5, tabelka001.Rows[i][3].ToString().Trim(), false, 0, 0);
                        tb.komorkaExcela(MyWorksheet1, i+3, 6, tabelka001.Rows[i][4].ToString().Trim(), false, 0, 0);
                        tb.komorkaExcela(MyWorksheet1, i+3, 7, tabelka001.Rows[i][5].ToString().Trim(), false, 0, 0);
                        tb.komorkaExcela(MyWorksheet1, i+3, 9, tabelka001.Rows[i][6].ToString().Trim(), false, 0, 0);
                        tb.komorkaExcela(MyWorksheet1, i+3, 10, tabelka001.Rows[i][7].ToString().Trim(), false, 0, 0);
                        
                    }
                }
                catch (Exception ex)
                {
                    cm.log.Error(tenPlik + " Generowanie pliku Excell 1 " + ex.Message);
                }

                try
                {

                    for (int i = 8; i <= 10; i++)
                    {
                        tb.komorkaExcela(MyWorksheet1, i+2, 2, tabelka001.Rows[i][1].ToString().Trim(), false, 0, 0);
                        tb.komorkaExcela(MyWorksheet1, i+2, 9, tabelka001.Rows[i][7].ToString().Trim(), false, 0, 0);
                        tb.komorkaExcela(MyWorksheet1, i+2, 10, tabelka001.Rows[i][8].ToString().Trim(), false, 0, 0);
                    }
                
                }
                catch (Exception ex)
            {
                cm.log.Error(tenPlik + " Generowanie pliku Excell 2 " + ex.Message);
            }
                try
                {
                    tb.komorkaExcela(MyWorksheet1, 12, 9, tabelka001.Rows[10][7].ToString().Trim(), false, 0, 0);
                    tb.komorkaExcela(MyWorksheet1, 12, 10, tabelka001.Rows[10][8].ToString().Trim(), false, 0, 0);
                }
                catch (Exception ex)
                {
                    cm.log.Error(tenPlik + " Generowanie pliku Excell 3 " + ex.Message);
                }
                try
                {
                    for (int i = 11; i <= 18; i++)
                    {
                        tb.komorkaExcela(MyWorksheet1, i + 5, 4, tabelka001.Rows[i][2].ToString().Trim(), false, 0, 0);
                        tb.komorkaExcela(MyWorksheet1, i + 5, 5, tabelka001.Rows[i][3].ToString().Trim(), false, 0, 0);
                        tb.komorkaExcela(MyWorksheet1, i + 5, 6, tabelka001.Rows[i][4].ToString().Trim(), false, 0, 0);
                        tb.komorkaExcela(MyWorksheet1, i + 5, 7, tabelka001.Rows[i][5].ToString().Trim(), false, 0, 0);
                        // tb.komorkaExcela(MyWorksheet1, i, 7, tabelka001.Rows[i][6].ToString().Trim(), false, 0, 0);
                        tb.komorkaExcela(MyWorksheet1, i + 5, 9, tabelka001.Rows[i][7].ToString().Trim(), false, 0, 0);
                        tb.komorkaExcela(MyWorksheet1, i + 5, 10, tabelka001.Rows[i][8].ToString().Trim(), false, 0, 0);
                    }
                }
                catch (Exception ex)
                {
                    cm.log.Error(tenPlik + " Generowanie pliku Excell 4 " + ex.Message);
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

            odswiez();
        }

        protected void LinkButton54_Click(object sender, EventArgs e)
        {
            odswiez();
        }

        protected void LinkButton55_Click(object sender, EventArgs e)
        {
            odswiez();
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "print2", "JavaScript: window.print();", true);
        }

        protected void pisz(string Template, int iloscWierszy, int iloscKolumn, DataTable dane)
        {
            for (int wiersz = 1; wiersz <= iloscWierszy; wiersz++)
            {
                for (int kolumna = 1; kolumna <= iloscKolumn; kolumna++)
                {
                    string controlName = Template + "w" + wiersz.ToString("D2") + "_c" + kolumna.ToString("D2");
                    Label tb = (Label)this.Master.FindControl("ContentPlaceHolder1").FindControl(controlName);
                    if (tb != null)
                    {
                        try
                        {
                            tb.Text = dane.Rows[wiersz - 1][kolumna].ToString().Trim();
                        }
                        catch
                        { }
                    }
                }
            }
        }// end of pisz
    }
}