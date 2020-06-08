using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace stat2018
{
    public partial class oopr : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        private tabele tb = new tabele();
        public dataReaders dr = new dataReaders();
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
                Server.Transfer("default.aspx");
                return;
            }
            CultureInfo newCulture = (CultureInfo)CultureInfo.CurrentCulture.Clone();
            newCulture.DateTimeFormat = CultureInfo.GetCultureInfo("PL").DateTimeFormat;
            System.Threading.Thread.CurrentThread.CurrentCulture = newCulture;
            System.Threading.Thread.CurrentThread.CurrentUICulture = newCulture;
            DateTime dTime = DateTime.Now.AddMonths(-1); ;

            if (Date1.Text.Length == 0)
            {
                Date1.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-01");
            }

            if (Date2.Text.Length == 0)
            {
                Date2.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-" + DateTime.DaysInMonth(dTime.Year, dTime.Month).ToString("D2"));
            }

            Session["id_dzialu"] = idWydzial;
            Session["data_1"] = Date1.Date.ToShortDateString();
            Session["data_2"] = Date2.Date.ToShortDateString();

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
                        makeLabels();
                    }
                }
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
                //  Server.Transfer("default.aspx");
            }
        }// end of Page_Load

        protected void odswiez()
        {
            id_dzialu.Text = (string)Session["txt_dzialu"];
            tabela_1();
            // dopasowanie opisów
            makeLabels();
            Label3.Text = cl.nazwaSadu((string)Session["id_dzialu"]);
        }

        protected void tabela_1()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 5");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 5, Date1.Date, Date2.Date, 130, tenPlik);
            Session["tabelka001"] = tabelka01;
            GridView1.DataSource = null;
            GridView1.DataSourceID = null;
            GridView1.DataSource = tabelka01;
            GridView1.DataBind();
        }

        #region "nagłowki tabel"

        private DataTable Header01()
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

            for (int i = 1; i < 115; i++)
            {
                dT_01.Rows.Add(new Object[] { "1", i.ToString(), "1", "1", "h" });
            }

            for (int i = 0; i < 18; i++)
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

            dT_01.Rows.Add(new Object[] { "2", "razem", "1", "1", "h" });
            dT_01.Rows.Add(new Object[] { "2", "w tym, w których projekt został zaakceptowany przez sędziego", "1", "1", "h" });

            dT_01.Rows.Add(new Object[] { "2", "ogółem", "1", "1", "h" });
            dT_01.Rows.Add(new Object[] { "2", "uwzględniono", "1", "1", "h" });
            dT_01.Rows.Add(new Object[] { "2", "liczba spraw w których strony skierowano do mediacji ", "1", "1", "h" });
            dT_01.Rows.Add(new Object[] { "2", "liczba ugód zawartych przed mediatorem", "1", "1", "h" });

            dT_01.Rows.Add(new Object[] { "2", "w tym zatwierdzono  ugodę", "1", "1", "h" });

            //     dT_01.Rows.Add(new Object[] { "3", "Ogółem (Dz. 1.1.1. k.02,w.01 + Dz. 1.1.2 k.02, w.01)", "1", "2", "h" });
            dT_01.Rows.Add(new Object[] { "3", "Ogółem ", "1", "2", "h" });
            dT_01.Rows.Add(new Object[] { "3", "RC", "1", "2", "h" });
            dT_01.Rows.Add(new Object[] { "3", "RNs", "1", "2", "h" });
            dT_01.Rows.Add(new Object[] { "3", "Nsm", "1", "2", "h" });
            dT_01.Rows.Add(new Object[] { "3", "RCo", "1", "2", "h" });
            dT_01.Rows.Add(new Object[] { "3", "Nmo", "1", "2", "h" });
            dT_01.Rows.Add(new Object[] { "3", "RCps", "1", "2", "h" });
            dT_01.Rows.Add(new Object[] { "3", "Nkd", "1", "2", "h" });
            dT_01.Rows.Add(new Object[] { "3", "WSNc", "1", "2", "h" });
            dT_01.Rows.Add(new Object[] { "3", "RCz", "1", "2", "h" });

            dT_01.Rows.Add(new Object[] { "4", "Ogółem MS-S16+MS-S18", "2", "1", "h" });
            dT_01.Rows.Add(new Object[] { "4", "RC", "2", "1", "h" });
            dT_01.Rows.Add(new Object[] { "4", "RNs", "2", "1", "h" });
            dT_01.Rows.Add(new Object[] { "4", "Nsm", "2", "1", "h" });
            dT_01.Rows.Add(new Object[] { "4", "RCo", "2", "1", "h" });
            dT_01.Rows.Add(new Object[] { "4", "Nmo", "2", "1", "h" });
            dT_01.Rows.Add(new Object[] { "4", "RCps", "2", "1", "h" });
            dT_01.Rows.Add(new Object[] { "4", "Nkd", "2", "1", "h" });
            dT_01.Rows.Add(new Object[] { "4", "WSNc", "2", "1", "h" });
            dT_01.Rows.Add(new Object[] { "4", "RCz", "2", "1", "h" });

            dT_01.Rows.Add(new Object[] { "4", "Ogółem", "2", "1", "h" });
            dT_01.Rows.Add(new Object[] { "4", "RC", "2", "1", "h" });
            dT_01.Rows.Add(new Object[] { "4", "RNs", "2", "1", "h" });
            dT_01.Rows.Add(new Object[] { "4", "Nsm", "2", "1", "h" });
            dT_01.Rows.Add(new Object[] { "4", "RCo", "2", "1", "h" });
            dT_01.Rows.Add(new Object[] { "4", "Nmo", "2", "1", "h" });
            dT_01.Rows.Add(new Object[] { "4", "RCps", "2", "1", "h" });
            dT_01.Rows.Add(new Object[] { "4", "Nkd", "2", "1", "h" });
            dT_01.Rows.Add(new Object[] { "4", "WSNc", "2", "1", "h" });
            dT_01.Rows.Add(new Object[] { "4", "RCz", "2", "1", "h" });
            //zalatwienia
            //   dT_01.Rows.Add(new Object[] { "3", "Ogółem (Dz. 1.1.1. k.03,w.01 + Dz. 1.1.2 k.04, w.01),", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "Ogółem ", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "RC", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "RNs", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "Nsm", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "RCo", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "Nmo", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "RCps", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "Nkd", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "WSNc", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "RCz", "1", "3", "h" });

            dT_01.Rows.Add(new Object[] { "4", "ogółem", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "4", "z tego", "2", "1", "h" });

         //   dT_01.Rows.Add(new Object[] { "4", "ogółem (k. 01 w.01)", "1", "3", "h" });
         //   dT_01.Rows.Add(new Object[] { "4", "z tego", "2", "1", "h" });

            //69
         /*   dT_01.Rows.Add(new Object[] { "3", "ogółem (wszystkie kategorie spraw) ", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "RC ", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "RNs", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "Nsm", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "Kkd", "1", "3", "h" });
           
            dT_01.Rows.Add(new Object[] { "3", "z terminem", "1", "3", "h" });

            dT_01.Rows.Add(new Object[] { "3", "bez wyznaczonego terminu", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "OGÓŁEM (wraz z publikacją orzeczeń)", "1", "3", "h" }); */
            // dT_01.Rows.Add(new Object[] { "3", "Ogółem (Dz. 1.1.1. k.18,w.01 + Dz. 1.1.2 k.06,w.01)", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "Ogółem ", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "RC", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "RNs", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "Nsm", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "RCo", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "Nmo", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "RCps", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "Nkd", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "WSNc", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "RCz", "1", "3", "h" });
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
            dT_01.Rows.Add(new Object[] { "3", "ogółem ", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "zakreś-lonych ", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "niezak-reślonych ", "1", "3", "h" });
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
             dT_01.Rows.Add(new Object[] { "3", "WPŁYW", "1", "1", "h" });
            dT_01.Rows.Add(new Object[] { "3", "ROZSTRZYGNIĘCIE", "2", "1", "h" });

            dT_01.Rows.Add(new Object[] { "3", "na rozprawie ", "1", "3", "h" });
            dT_01.Rows.Add(new Object[] { "3", "na posiedzieniu ", "1", "3", "h" });

            dT_01.Rows.Add(new Object[] { "5", "wszystkie sesje sędziego w wydziale", "3", "1", "h" });
         //   dT_01.Rows.Add(new Object[] { "5", "na potrzeby MS-S (Dz. 1.2.2.)", "3", "1", "h" });

            dT_01.Rows.Add(new Object[] { "6", "L.p", "1", "6", "h" });
            dT_01.Rows.Add(new Object[] { "6", " Imię i nazwisko sędziego", "1", "6", "h" });
            dT_01.Rows.Add(new Object[] { "6", "zaległość z poprzedniego roku ", "1", "5", "h" });
            dT_01.Rows.Add(new Object[] { "6", "WPŁYW", "10", "3", "h" });
            dT_01.Rows.Add(new Object[] { "6", "Wyznaczono ", "20", "2", "h" });
            dT_01.Rows.Add(new Object[] { "6", "Załatwiono ", "20", "2", "h" });
            dT_01.Rows.Add(new Object[] { "6", "ZAŁATWIENIA ", "10", "2", "h" });
            dT_01.Rows.Add(new Object[] { "6", "sesje odbyte przez sędziego  ", "3", "1", "h" });
            dT_01.Rows.Add(new Object[] { "6", "Liczba dni, w których odbyły się sesje wyjazdowe (podajemy niezależnie - dla potrzeb informacyjnych)", "1", "5", "h" });
            dT_01.Rows.Add(new Object[] { "6", "Liczba wokand wykonawczych (wykazywana  Dz. 1.1.9)", "1", "5", "h" });
          //  dT_01.Rows.Add(new Object[] { "6", "Liczba odroczonych publikacji wyroków/postanowień (Dz. 1.1.1. k.17)", "5", "2", "h" });
          //  dT_01.Rows.Add(new Object[] { "6", "Liczba odroczonych spraw", "3", "2", "h" });
            dT_01.Rows.Add(new Object[] { "6", "POZOSTAŁOŚĆ na następny m-c", "10", "2", "h" });
            dT_01.Rows.Add(new Object[] { "6", "pozostało spraw starych", "9", "2", "h" });
            dT_01.Rows.Add(new Object[] { "6", "stan spraw zawieszonych", "3", "2", "h" });

            dT_01.Rows.Add(new Object[] { "6", "terminowość sporządzonych uzasadnień (wszystkie kategorie spraw)", "16", "2", "h" });
            dT_01.Rows.Add(new Object[] { "6", "skargi na przewlekłość", "4", "2", "h" });
            dT_01.Rows.Add(new Object[] { "6", "mediacje", "3", "2", "h" });
            dT_01.Rows.Add(new Object[] { "6", "UWAGI", "1", "5", "h" });
            dT_01.Rows.Add(new Object[] { "6", "Kolumna kontrolna (wyznaczenia>=załatwienia)", "2", "2", "h" });

            return dT_01;

            #endregion tabela  1 (wierszowa)
        }

        protected void grvMergeHeader_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(Header01(), GridView1);
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

                string strMonthName = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(Date2.Date.Month);
                int last_day = DateTime.DaysInMonth(Date2.Date.Year, Date2.Date.Month);
                if (((Date1.Date.Day == 1) && (Date2.Date.Day == last_day)) && ((Date1.Date.Month == Date2.Date.Month)))
                {
                    // cały miesiąc
                    Label19.Text = "Załatwienia za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    Label27.Text = "za miesiąc:  " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
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

      

        protected void Button3_Click(object sender, EventArgs e)
        {
            string path = Server.MapPath("Template") + "\\oopr.xlsx";
            FileInfo existingFile = new FileInfo(path);

            string download = Server.MapPath("Template") + @"\oopr";
            FileInfo fNewFile = new FileInfo(download + "_.xlsx");

            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                ExcelWorksheet MyWorksheet = MyExcel.Workbook.Worksheets[1];
                tb.tworzArkuszwExcle(MyWorksheet, (DataTable)Session["tabelka001"], 115, 0, 8, true, true, false, false, true);

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

        protected void LinkButton54_Click(object sender, EventArgs e)
        {
            odswiez();
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
                try
                {
                    tb.makeSumRow((DataTable)Session["tabelka001"], e, 1, "Razem");
                }
                catch (Exception ex)
                {
                    cm.log.Error(tenPlik + " " + ex.Message);
                }
            }
        }
    }
}