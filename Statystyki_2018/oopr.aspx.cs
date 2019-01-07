using System;
    using System.Data;
    using System.Globalization;
    using System.IO;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using OfficeOpenXml;

namespace stat2018
{
   

    public partial class oopr : System.Web.UI.Page
    {

        public Class1 cl = new Class1();
        public common cm = new common();
        public dataReaders dr = new dataReaders();
        tabele tb = new tabele();
        public const string tenPlik = "oopr.aspx";
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
            Session["data_1"] = Date1.Text;
            Session["data_2"] = Date2.Text;
            clearHedersSession();

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
                //cm.log.Error(tenPlik + " " + ex.Message);
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
            string dzial = (string)Session["id_dzialu"];
            id_dzialu.Text = (string)Session["txt_dzialu"];
            string txt = string.Empty; //

            txt = txt + cl.clear_maim_db_xl();
            try
            {
                txt = txt + cl.generuj_dane_do_tabeli_XXL(int.Parse(dzial), 5, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text));
                //txt = txt + cl.uzupelnij_statusy_Xl();
            }
            catch
            { }
            // dopasowanie opisów
            makeLabels();
            GridView1.DataBind();
            try
            {
                Label11.Visible = cl.debug(int.Parse((string)Session["id_dzialu"]));
            }
            catch
            {
                Label11.Visible = false;
            }

            Label11.Text = txt;
            Label3.Text = cl.nazwaSadu((string)Session["id_dzialu"]);
        }

        #region "nagłowki tabel"
        protected void makeHeader()
        {

           #region tabela  1 (wierszowa)


            DataTable dT_01 = new DataTable();
            dT_01.Columns.Clear();
            dT_01.Columns.Add("Column1", typeof(string));
            dT_01.Columns.Add("Column2", typeof(string));
            dT_01.Columns.Add("Column3", typeof(string));
            dT_01.Columns.Add("Column4", typeof(string));
            dT_01.Columns.Add("Column5", typeof(string));
           
           
            dT_01.Clear();

            for (int i = 1; i < 114; i++)
            {
                dT_01.Rows.Add(new Object[] { "1", i.ToString(), "1", "1", "h" });
            }


            for (int i = 0; i < 16; i++)
            {
                dT_01.Rows.Add(new Object[] { "2", "na rozp-<br/>rawie", "1", "1", "h" });
                dT_01.Rows.Add(new Object[] { "2", "na posie-<br/>dzenie", "1", "1", "h" });
            }
            dT_01.Rows.Add(new Object[] { "2", "rozp-<br/>rawy", "1", "1", "h" });
            dT_01.Rows.Add(new Object[] { "2", "posie-<br/>dzenia", "1", "1", "h" });
            dT_01.Rows.Add(new Object[] { "2", "rozp-<br/>rawy", "1", "1", "h" });
            dT_01.Rows.Add(new Object[] { "2", "posie-<br/>dzenia", "1", "1", "h" });


                     

            dT_01.Rows.Add(new Object[] { "2", "1 - 14 dni", "1", "1", "h" });
            dT_01.Rows.Add(new Object[] { "2", "w tym nieuspra-<br/>wiedliwione", "1", "1", "h" });
            dT_01.Rows.Add(new Object[] { "2", "15 - 30 dni ", "1", "1", "h" });
            dT_01.Rows.Add(new Object[] { "2", "w tym nieuspra-<br/>wiedliwione", "1", "1", "h" });
            dT_01.Rows.Add(new Object[] { "2", "pow. 1 do 3 mieś.", "1", "1", "h" });
            dT_01.Rows.Add(new Object[] { "2", "w tym nieuspra-<br/>wiedliwione", "1", "1", "h" });
            dT_01.Rows.Add(new Object[] { "2", "ponad 3 mies.", "1", "1", "h" });
            dT_01.Rows.Add(new Object[] { "2", "w tym nieuspra-<br/>wiedliwione", "1", "1", "h" });

            dT_01.Rows.Add(new Object[] { "2", "ogółem", "1", "1", "h" });
            dT_01.Rows.Add(new Object[] { "2", "uwzględniono", "1", "1", "h" });

            dT_01.Rows.Add(new Object[] { "2", "ogółem", "1", "1", "h" });
            dT_01.Rows.Add(new Object[] { "2", "w tym zatwierdzono  ugodę", "1", "1", "h" });

            dT_01.Rows.Add(new Object[] { "3", "Ogółem (Dz. 1.1.1. k.02,w.01 + Dz. 1.1.2 k.02, w.01)", "1", "2", "h" });
            dT_01.Rows.Add(new Object[] { "3", "Ogółem ", "1", "2", "h" });
            dT_01.Rows.Add(new Object[] { "3", "RC", "1", "2", "h" });
            dT_01.Rows.Add(new Object[] { "3", "RNs", "1", "2", "h" });
            dT_01.Rows.Add(new Object[] { "3", "Nsm", "1", "2", "h" });
            dT_01.Rows.Add(new Object[] { "3", "RCo", "1", "2", "h" });
            dT_01.Rows.Add(new Object[] { "3", "Nmo", "1", "2", "h" });
            dT_01.Rows.Add(new Object[] { "3", "RCps", "1", "2", "h" });
            dT_01.Rows.Add(new Object[] { "3", "Nkd", "1", "2", "h" });

            dT_01.Rows.Add(new Object[] { "4", "Ogółem MS-S16+MS-S18", "2", "1", "h" });
            dT_01.Rows.Add(new Object[] { "4", "RC", "2", "1", "h" });
            dT_01.Rows.Add(new Object[] { "4", "RNs", "2", "1", "h" });
            dT_01.Rows.Add(new Object[] { "4", "Nsm", "2", "1", "h" });
            dT_01.Rows.Add(new Object[] { "4", "RCo", "2", "1", "h" });
            dT_01.Rows.Add(new Object[] { "4", "Nmo", "2", "1", "h" });
            dT_01.Rows.Add(new Object[] { "4", "RCps", "2", "1", "h" });
            dT_01.Rows.Add(new Object[] { "4", "Nkd", "2", "1", "h" });

            dT_01.Rows.Add(new Object[] { "4", "Ogółem", "2", "1", "h" });
            dT_01.Rows.Add(new Object[] { "4", "RC", "2", "1", "h" });
            dT_01.Rows.Add(new Object[] { "4", "RNs", "2", "1", "h" });
            dT_01.Rows.Add(new Object[] { "4", "Nsm", "2", "1", "h" });
            dT_01.Rows.Add(new Object[] { "4", "RCo", "2", "1", "h" });
            dT_01.Rows.Add(new Object[] { "4", "Nmo", "2", "1", "h" });
            dT_01.Rows.Add(new Object[] { "4", "RCps", "2", "1", "h" });
            dT_01.Rows.Add(new Object[] { "4", "Nkd", "2", "1", "h" });
            //zalatwienia
            dT_01.Rows.Add(new Object[] { "3", "Ogółem (Dz. 1.1.1. k.03,w.01 + Dz. 1.1.2 k.04, w.01),", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "Ogółem ", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "RC", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "RNs", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "Nsm", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "RCo", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "Nmo", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "RCps", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "Nkd", "1", "3", "h" });

            dT_01.Rows.Add(new Object[] { "4", "ogółem", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "4", "z tego", "2", "1", "h" });

            dT_01.Rows.Add(new Object[] { "4", "ogółem (k. 01 w.01)", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "4", "z tego", "2", "1", "h" });

            //69
            dT_01.Rows.Add(new Object[] { "3", "ogółem (wszystkie kategorie spraw) ", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "RC ", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "RNs", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "Nsm", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "Kkd", "1", "3", "h" });

            dT_01.Rows.Add(new Object[] { "3", "z terminem", "1", "3", "h" });

            dT_01.Rows.Add(new Object[] { "3", "bez wyznaczonego terminu", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "OGÓŁEM (wraz z publikacją orzeczeń)", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "Ogółem (Dz. 1.1.1. k.18,w.01 + Dz. 1.1.2 k.06,w.01)", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "Ogółem ", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "RC", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "RNs", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "Nsm", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "RCo", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "Nmo", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "RCps", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "Nkd", "1", "3", "h" });
            //89
            dT_01.Rows.Add(new Object[] { "3", "Ogółem ", "1", "3", "h" });

            dT_01.Rows.Add(new Object[] { "3", "do 3 m-cy ", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "pow. 3 do 6 m-cy ", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "pow. 6 do 12 m-cy ", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "pow. 12 m-cy do 2 lat ", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "pow. 2 do 3 lat", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "pow. 3 do 5 lat ", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "pow. 5 do 8 lat ", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "pow. 8 lat ", "1", "3", "h" });

            dT_01.Rows.Add(new Object[] { "3", "Łącznie ", "1", "3", "h" });

            dT_01.Rows.Add(new Object[] { "3", "w terminie ustawowym 14 dni ", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "razem po terminie ustawowym ", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "nieus-<br/>prawiedli-<br/>wionych ", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "po upływie terminu ustawowego ", "8", "1", "h" });

            dT_01.Rows.Add(new Object[] { "3", "Uzasadnienia wygłoszone * ", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "Liczba spraw do których wpłynął wniosek o transkrypcje uzasadnień wygłoszonych", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent**  ", "2", "1", "h" });
            //115
            dT_01.Rows.Add(new Object[] { "3", "wpływ ", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "rozpoznane skargi  ", "2", "1", "h" });
            dT_01.Rows.Add(new Object[] { "3", "pozostałość ", "1", "3", "h" });

            dT_01.Rows.Add(new Object[] { "3", "skierowano do mediacji ", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "załatwiono", "2", "1", "h" });

            dT_01.Rows.Add(new Object[] { "3", "ogółem ", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "zakreślonych ", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "niezakreślonych ", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "na rozprawie ", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "na posiedzieniu ", "1", "3", "h" });

            dT_01.Rows.Add(new Object[] { "5", "wszystkie sesje sędziego w wydziale", "3", "1", "h" });
            dT_01.Rows.Add(new Object[] { "5", "na potrzeby MS-S (Dz. 1.2.2.)", "3", "1", "h" });

            dT_01.Rows.Add(new Object[] { "6", "L.p", "1", "6", "h" });
            dT_01.Rows.Add(new Object[] { "6", "Nazwisko sędziego", "1", "6", "h" });
            dT_01.Rows.Add(new Object[] { "6", "Imię", "1", "6", "h" });
            dT_01.Rows.Add(new Object[] { "6", "WPŁYW", "9", "3", "h" });
            dT_01.Rows.Add(new Object[] { "6", "Wyznaczono ", "16", "2", "h" });
            dT_01.Rows.Add(new Object[] { "6", "Załatwiono ", "16", "2", "h" });
            dT_01.Rows.Add(new Object[] { "6", "ZAŁATWIENIA ", "9", "2", "h" });
            dT_01.Rows.Add(new Object[] { "6", "sesje odbyte przez sędziego  ", "6", "1", "h" });
            dT_01.Rows.Add(new Object[] { "6", "Liczba dni, w których odbyły się sesje wyjazdowe (podajemy niezależnie - dla potrzeb informacyjnych)", "1", "5", "h" });
            dT_01.Rows.Add(new Object[] { "6", "Liczba wokand wykonawczych (wykazywana  Dz. 1.1.9)", "1", "5", "h" });
            dT_01.Rows.Add(new Object[] { "6", "Liczba odroczonych publikacji wyroków/postanowień (Dz. 1.1.1. k.17)", "5", "2", "h" });
            dT_01.Rows.Add(new Object[] { "6", "Liczba odroczonych spraw", "3", "2", "h" });
            dT_01.Rows.Add(new Object[] { "6", "POZOSTAŁOŚĆ na następny m-c", "9", "2", "h" });
            dT_01.Rows.Add(new Object[] { "6", "pozostało spraw starych", "9", "2", "h" });
            dT_01.Rows.Add(new Object[] { "6", "terminowość sporządzonych uzasadnień (wszystkie kategorie spraw)", "16", "2", "h" });
            dT_01.Rows.Add(new Object[] { "6", "skargi na przewlekłość", "4", "2", "h" });
            dT_01.Rows.Add(new Object[] { "6", "mediacje", "3", "2", "h" });
            dT_01.Rows.Add(new Object[] { "6", "stan spraw zawieszonych", "3", "2", "h" });
            dT_01.Rows.Add(new Object[] { "6", "UWAGI", "1", "5", "h" });
            dT_01.Rows.Add(new Object[] { "6", "Kolumna kontrolna (wyznaczenia>=załatwienia)", "2", "2", "h" });

            Session["header_01"] = dT_01;

            #endregion




        }

        protected void grvMergeHeader_RowCreated(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                makeHeader();
                DataTable dT =(DataTable)Session["header_01"];//dr.naglowek("\\Template\\oopr.xlsx", 1); //
                tb.makeHeader(sn, dT, GridView1);
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
                    Label19.Text = "Załatwienia za miesiąc " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    Label27.Text = "za miesiąc:  " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                }
                else
                {
                    Label19.Text = "Załatwienia za okres od " + Date1.Text + " do  " + Date2.Text;
                    Label27.Text = "za okres od:  " + Date1.Text + " do  " + Date2.Text;

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
            string path = Server.MapPath("Template") + "\\oopr.xlsx";
            FileInfo existingFile = new FileInfo(path);

            string download = Server.MapPath("Template") + @"\oopr";

            FileInfo fNewFile = new FileInfo(download + "_.xlsx");
           
            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                ExcelWorksheet MyWorksheet = MyExcel.Workbook.Worksheets[1];

                DataView view = (DataView)statystyki.Select(DataSourceSelectArguments.Empty);
                tabele tb = new tabele();
                DataTable table = view.ToTable();
                tb.tworzArkuszwExcle(MyWorksheet, table, 114, 0, 7, true, false, false, false, true);
              
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
                       //cm.log.Error(tenPlik + " " + ex.Message );

                }

            }//end of using

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


        
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[2].Text = "Razem";


                DataView view = (DataView)statystyki.Select(DataSourceSelectArguments.Empty);

                DataTable table = view.ToTable();
                object sumObject;
                try
                {
                    for (int i = 1; i < 118; i++)
                    {
                        string txt = "d_";
                        string digit = i.ToString("D2");
                        txt = txt + digit;
                        sumObject = table.Compute("Sum(" + txt + ")", "");
                        e.Row.Cells[2 + i].Text = sumObject.ToString();
                    }
                }
                catch (Exception ex)
                {
                    //cm.log.Error(tenPlik + " " + ex.Message);
                }
            }
        }
    }
}