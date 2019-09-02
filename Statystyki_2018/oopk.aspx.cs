using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI.WebControls;

namespace stat2018
{
    public partial class oopk : System.Web.UI.Page
    {
        private tabele tb = new tabele();
        public Class1 cl = new Class1();
        public common cm = new common();
        public dataReaders dr = new dataReaders();
        public const string tenPlik = "oopk";

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
                        przemiel();
                        makeLabels();
                    }
                }
            }
            catch
            {
                //     Server.Transfer("default.aspx");
            }
        }// end of Page_Load

        protected void przemiel()
        {
            string dzial = (string)Session["id_dzialu"];
            id_dzialu.Text = (string)Session["txt_dzialu"];

            try
            {
                Session["tabela01"] = dr.tworzTabele(int.Parse(dzial), 5, Date1.Date, Date2.Date, 120, GridView1, tenPlik);
            }
            catch
            { }
            // dopasowanie opisów
            makeLabels();
        }

        #region "nagłowki tabel"

        protected void grvMergeHeader_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tb.makeHeader(header1(), GridView1);
            }
        }

        private DataTable header1()
        {
            DataTable dT = new DataTable();
            dT.Columns.Clear();
            dT.Columns.Add("Column1", typeof(string));
            dT.Columns.Add("Column2", typeof(string));
            dT.Columns.Add("Column3", typeof(string));
            dT.Columns.Add("Column4", typeof(string));
            dT.Columns.Add("Column5", typeof(string));
            // wypełnienie danymi
            dT.Clear();
            dT.Rows.Add(new Object[] { "1", "rozprawy", "1", "1", "v" });//
            dT.Rows.Add(new Object[] { "1", "posiedzenia", "1", "1", "v" });//

            dT.Rows.Add(new Object[] { "1", "rozprawy", "1", "1", "v" });//
            dT.Rows.Add(new Object[] { "1", "posiedzenia", "1", "1", "v" });//

            //wpływ
            dT.Rows.Add(new Object[] { "2", "śledztwa", "1", "2", "v" });//
            dT.Rows.Add(new Object[] { "2", "dochodzenia", "1", "2", "v" });//
                                                                            //wyznaczono
            dT.Rows.Add(new Object[] { "2", "na rozprawę <br/>", "1", "2", "v" });//
            dT.Rows.Add(new Object[] { "2", "na posiedzenie <br/>", "1", "2", "v" });//

            dT.Rows.Add(new Object[] { "2", "na rozprawę <br/>", "1", "2", "v" });//
            dT.Rows.Add(new Object[] { "2", "na posiedzenie <br/>", "1", "2", "v" });//

            dT.Rows.Add(new Object[] { "2", "na rozprawę <br/>", "1", "2", "v" });//
            dT.Rows.Add(new Object[] { "2", "na posiedzenie <br/>", "1", "2", "v" });//

            dT.Rows.Add(new Object[] { "2", "na rozprawę <br/>", "1", "2", "v" });//
            dT.Rows.Add(new Object[] { "2", "na posiedzenie <br/>", "1", "2", "v" });//

            dT.Rows.Add(new Object[] { "2", "na rozprawę <br/>", "1", "2", "v" });//
            dT.Rows.Add(new Object[] { "2", "na posiedzenie <br/>", "1", "2", "v" });//

            dT.Rows.Add(new Object[] { "2", "na rozprawę ", "1", "2", "v" });//
            dT.Rows.Add(new Object[] { "2", "na posiedzenie ", "1", "2", "v" });//

            dT.Rows.Add(new Object[] { "2", "na rozprawę ", "1", "2", "v" });//
            dT.Rows.Add(new Object[] { "2", "na posiedzenie ", "1", "2", "v" });//
                                                                                //załatwiono

            dT.Rows.Add(new Object[] { "2", "na rozprawę <br/>", "1", "2", "v" });//
            dT.Rows.Add(new Object[] { "2", "na posiedzenie <br/>", "1", "2", "v" });//

            dT.Rows.Add(new Object[] { "2", "na rozprawę <br/>", "1", "2", "v" });//
            dT.Rows.Add(new Object[] { "2", "na posiedzenie <br/>", "1", "2", "v" });//

            dT.Rows.Add(new Object[] { "2", "na rozprawę <br/>", "1", "2", "v" });//
            dT.Rows.Add(new Object[] { "2", "na posiedzenie <br/>", "1", "2", "v" });//

            dT.Rows.Add(new Object[] { "2", "na rozprawę <br/>", "1", "2", "v" });//
            dT.Rows.Add(new Object[] { "2", "na posiedzenie <br/>", "1", "2", "v" });//

            dT.Rows.Add(new Object[] { "2", "na rozprawę <br/>", "1", "2", "v" });//
            dT.Rows.Add(new Object[] { "2", "na posiedzenie <br/>", "1", "2", "v" });//

            dT.Rows.Add(new Object[] { "2", "na rozprawę <br/>", "1", "2", "v" });//
            dT.Rows.Add(new Object[] { "2", "na posiedzenie <br/>", "1", "2", "v" });//

            dT.Rows.Add(new Object[] { "2", "na rozprawę <br/>", "1", "2", "v" });//
            dT.Rows.Add(new Object[] { "2", "na posiedzenie <br/>", "1", "2", "v" });//
                                                                                     //Załatwienia
            dT.Rows.Add(new Object[] { "2", "śledztwa", "1", "2", "v" });//
            dT.Rows.Add(new Object[] { "2", "dochodzenia", "1", "2", "v" });//
                                                                            //Sesje odbyte przez sędziego
            dT.Rows.Add(new Object[] { "2", "ogółem", "1", "2", "h" });//
            dT.Rows.Add(new Object[] { "2", "z tego", "2", "1", "h" });//

            dT.Rows.Add(new Object[] { "2", "ogółem ", "1", "2", "h" });//
            dT.Rows.Add(new Object[] { "2", "z tego", "2", "1", "h" });//
                                                                       //Liczba odroczonych publikacji orzeczeń
            dT.Rows.Add(new Object[] { "2", "Ogółem (wszystkie kategorie spraw)", "1", "2", "h" });//

            dT.Rows.Add(new Object[] { "2", "K", "1", "2", "h" });//
            dT.Rows.Add(new Object[] { "2", "W", "1", "2", "h" });//
                                                                  //Liczba odroczonych spraw
            dT.Rows.Add(new Object[] { "2", "z terminem", "1", "2", "h" });//

            dT.Rows.Add(new Object[] { "2", "bez wyznaczonego terminu", "1", "2", "h" });//
            dT.Rows.Add(new Object[] { "2", "OGÓŁEM (wraz <br/>z publikacją orzeczeń)", "1", "2", "h" });//
                                                                                                         //
            dT.Rows.Add(new Object[] { "2", "1 do 14 dni", "1", "2", "h" });//
            dT.Rows.Add(new Object[] { "2", "w tym nieusprawiedliwione", "1", "2", "h" });//
            dT.Rows.Add(new Object[] { "2", "15 do 30 dni  ", "1", "2", "h" });//
            dT.Rows.Add(new Object[] { "2", "w tym nieusprawiedliwione ", "1", "2", "h" });//
            dT.Rows.Add(new Object[] { "2", "pow. 1 do 3 m-cy", "1", "2", "h" });//
            dT.Rows.Add(new Object[] { "2", "w tym nieusprawiedliwione", "1", "2", "h" });//
            dT.Rows.Add(new Object[] { "2", "ponad 3 miesiące", "1", "2", "h" });//
            dT.Rows.Add(new Object[] { "2", "w tym nieusprawiedliwione", "1", "2", "h" });//
                                                                                          //Liczba spraw, w których projekt uzasadnienia sporządził asystent** (Dz. 1.3)
            dT.Rows.Add(new Object[] { "2", "razem k.13 w.01", "1", "2", "h" });//
            dT.Rows.Add(new Object[] { "2", "w tym, w których projekt został zaakceptowany przez sędziego", "1", "2", "h" });//
            dT.Rows.Add(new Object[] { "2", "ogółem", "1", "2", "h" });
            dT.Rows.Add(new Object[] { "2", "uwzględniono", "1", "2", "h" });
            dT.Rows.Add(new Object[] { "2", "na rozprawie", "1", "2", "h" });//
            dT.Rows.Add(new Object[] { "2", "na posiedzeniu", "1", "2", "h" });//

            // ================================    2     ============================
            //wpływ
            dT.Rows.Add(new Object[] { "3", "Ogółem ", "1", "3", "h" });//
            dT.Rows.Add(new Object[] { "3", "K <br/>", "1", "3", "h" });//
            dT.Rows.Add(new Object[] { "3", "w tym postępowanie przygotowawcze zakończone w formie*", "2", "1", "h" });//
            dT.Rows.Add(new Object[] { "3", "W<br/> ", "1", "3", "h" });//
            dT.Rows.Add(new Object[] { "3", "Kop<br/>", "1", "3", "h" });//
            dT.Rows.Add(new Object[] { "3", "Kp <br/>", "1", "3", "h" });//
            dT.Rows.Add(new Object[] { "3", "Ko karne", "1", "3", "h" });//
            dT.Rows.Add(new Object[] { "3", "Ko wykrocz", "1", "3", "h" });//
                                                                           //wyznaczono
            dT.Rows.Add(new Object[] { "3", "Ogółem", "2", "1", "h" });//
            dT.Rows.Add(new Object[] { "3", "K ", "2", "1", "h" });//
            dT.Rows.Add(new Object[] { "3", "W ", "2", "1", "h" });//
            dT.Rows.Add(new Object[] { "3", "Kop ", "2", "1", "h" });//
            dT.Rows.Add(new Object[] { "3", "Kp ", "2", "1", "h" });//
            dT.Rows.Add(new Object[] { "3", "Ko<br/> karne", "2", "1", "h" });//
            dT.Rows.Add(new Object[] { "3", "Ko <br/>wykrocz", "2", "1", "h" });//
                                                                                //Załatwiono
            dT.Rows.Add(new Object[] { "3", "Ogółem <br/> ", "2", "1", "h" });
            dT.Rows.Add(new Object[] { "3", "K ", "2", "1", "h" });
            dT.Rows.Add(new Object[] { "3", "W", "2", "1", "h" });
            dT.Rows.Add(new Object[] { "3", "Kop", "2", "1", "h" });
            dT.Rows.Add(new Object[] { "3", "Kp", "2", "1", "h" });
            dT.Rows.Add(new Object[] { "3", "Ko karne", "2", "1", "h" });
            dT.Rows.Add(new Object[] { "3", "Ko wykrocz", "2", "1", "h" });
            //Załatwienia
            dT.Rows.Add(new Object[] { "3", "Ogółem <br/> ", "1", "3", "h" });
            dT.Rows.Add(new Object[] { "3", "K", "1", "3", "h" });//
            dT.Rows.Add(new Object[] { "3", "w tym postępowanie przygotowawcze zakończone w formie*", "2", "1", "h" });//
            dT.Rows.Add(new Object[] { "3", "W", "1", "3", "h" });//
            dT.Rows.Add(new Object[] { "3", "Kop", "1", "3", "h" });//
            dT.Rows.Add(new Object[] { "3", "Kp", "1", "3", "h" });//
            dT.Rows.Add(new Object[] { "3", "Ko karne", "1", "3", "h" });//
            dT.Rows.Add(new Object[] { "3", "Ko wykrocz", "1", "3", "h" });//
                                                                           //Sesje odbyte przez sędziego
            dT.Rows.Add(new Object[] { "3", "Wszystkie sesje sędziego w wydziale", "3", "1", "h" });//
            dT.Rows.Add(new Object[] { "3", "Na potrzeby MS-s (Dz.1.2.2.k.01)", "3", "1", "h" });//
                                                                                                 //POZOSTAŁOŚC na następny miesiąc (Dz.1.1.k.04)"
            dT.Rows.Add(new Object[] { "3", "Ogółem ", "1", "3", "h" });//
            dT.Rows.Add(new Object[] { "3", "K ", "1", "3", "h" });//
            dT.Rows.Add(new Object[] { "3", "W ", "1", "3", "h" });//
            dT.Rows.Add(new Object[] { "3", "Kop", "1", "3", "h" });//
            dT.Rows.Add(new Object[] { "3", "Kp", "1", "3", "h" });//
            dT.Rows.Add(new Object[] { "3", "Ko karne", "1", "3", "h" });//
            dT.Rows.Add(new Object[] { "3", "Ko wykrocz", "1", "3", "h" });//
                                                                           //Pozostało spraw starych (Dz.2.1.1. w.01+08+09+10)"
            dT.Rows.Add(new Object[] { "3", "Ogółem", "1", "3", "h" });
            dT.Rows.Add(new Object[] { "3", "do 3 m-cy", "1", "3", "h" });
            dT.Rows.Add(new Object[] { "3", "pow.3 do 6 m-cy ", "1", "3", "h" });
            dT.Rows.Add(new Object[] { "3", "pow.6 do 12 m-cy ", "1", "3", "h" });
            dT.Rows.Add(new Object[] { "3", "pow. 12 m-cy do 3 lat", "1", "3", "h" });
            dT.Rows.Add(new Object[] { "3", "pow. 12 m-cy do 2 lat ", "1", "3", "h" });
            dT.Rows.Add(new Object[] { "3", "pow. 2 do 3 lat ", "1", "3", "h" });
            dT.Rows.Add(new Object[] { "3", "pow. 3 do 5 lat ", "1", "3", "h" });
            dT.Rows.Add(new Object[] { "3", "pow. 5 do 8 lat", "1", "3", "h" });
            dT.Rows.Add(new Object[] { "3", "pow. 8 lat", "1", "3", "h" });

            dT.Rows.Add(new Object[] { "3", "ogółem", "1", "3", "h" });
            dT.Rows.Add(new Object[] { "3", "zakreślonych", "1", "3", "h" });
            dT.Rows.Add(new Object[] { "3", "niezakreślonych", "1", "3", "h" });

            dT.Rows.Add(new Object[] { "3", "Łącznie", "1", "3", "h" });
            dT.Rows.Add(new Object[] { "3", "W terminie ustawowym 14 dni", "1", "3", "h" });
            dT.Rows.Add(new Object[] { "3", "Razem po terminie ustawowym ", "1", "3", "h" });
            dT.Rows.Add(new Object[] { "3", "Nieusprawied-liwionych", "1", "3", "h" });
            dT.Rows.Add(new Object[] { "3", "Po upływie terminu ustawowego", "8", "1", "h" });
            //"Skargi na przewlekłość (Dz. 7.1)"
            dT.Rows.Add(new Object[] { "3", "wpływ", "1", "3", "h" });
            dT.Rows.Add(new Object[] { "3", "załatwiono", "2", "1", "h" });
            dT.Rows.Add(new Object[] { "3", "pozostało", "1", "3", "h" });
            //"Stan spraw zawiszonych"
            dT.Rows.Add(new Object[] { "3", " liczba mediacji wpisanych w danym miesiącu do Wykazu Med. ", "1", "3", "h" });//
            dT.Rows.Add(new Object[] { "3", "liczba spraw z rep. K załatwionych w związku z postępowaniem mediacyjnym", "1", "3", "h" });//
            dT.Rows.Add(new Object[] { "3", "w tym <br/> liczba spraw, w których postępowanie zakończyło się ugodą", "1", "3", "h" });//

            // ================================   3     ============================
            dT.Rows.Add(new Object[] { "4", "L.p.", "1", "4", "h" });//
            dT.Rows.Add(new Object[] { "4", "Funkcja", "1", "4", "h" });//
            dT.Rows.Add(new Object[] { "4", "Stanowisko", "1", "4", "h" });
            dT.Rows.Add(new Object[] { "4", "Imię i Nazwisko sędziego", "1", "4", "h" });//
            dT.Rows.Add(new Object[] { "4", "Zaległości z 2018", "1", "4", "h" });//
            dT.Rows.Add(new Object[] { "4", "WPŁYW", "9", "1", "h" });//
            dT.Rows.Add(new Object[] { "4", "Wyznaczono", "14", "1", "h" });//
            dT.Rows.Add(new Object[] { "4", "Załatwiono", "14", "1", "h" });//
            dT.Rows.Add(new Object[] { "4", "Załatwienia", "9", "1", "h" });//
            dT.Rows.Add(new Object[] { "4", "Sesje odbyte przez sędziego", "6", "1", "h" });//
            dT.Rows.Add(new Object[] { "4", "Liczba odroczonych <br/> publikacji orzeczeń", "3", "2", "h" });//
            dT.Rows.Add(new Object[] { "4", "Liczba odroczonych <br/> spraw", "3", "2", "h" });//
            dT.Rows.Add(new Object[] { "4", "POZOSTAŁOŚĆ na następny miesiąc", "7", "1", "h" });//
            dT.Rows.Add(new Object[] { "4", "Pozostało spraw starych", "10", "1", "h" });//
            dT.Rows.Add(new Object[] { "4", "stan spraw zawieszonych (wszystkie kategorie spraw)", "3", "1", "h" });//

            dT.Rows.Add(new Object[] { "4", "Liczba sporządzonych uzasadnień ", "12", "1", "h" });//
            dT.Rows.Add(new Object[] { "4", "Uzasadnienia wygłoszone", "1", "4", "h" });//
            dT.Rows.Add(new Object[] { "4", "Liczba spraw do których wpłynął wniosek o transkrypcję uzasadnien wygłoszone", "1", "4", "h" });
            dT.Rows.Add(new Object[] { "4", "Liczba spraw, w których projekt uzasadnienia sporządził asystent**  ", "2", "2", "h" });//
            dT.Rows.Add(new Object[] { "4", "Skargi na przewlekłość", "4", "1", "h" });//
            dT.Rows.Add(new Object[] { "4", "Mediacje", "3", "1", "h" });//
            dT.Rows.Add(new Object[] { "4", "Uwagi", "1", "4", "h" });//
            dT.Rows.Add(new Object[] { "4", "Kolumna kontrolna (wyznaczenia>=załatwienia)", "2", "2", "h" });//

            return dT;
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
            string path = Server.MapPath("Template") + "\\oopk.xlsx";
            FileInfo existingFile = new FileInfo(path);
            string download = Server.MapPath("Template") + @"\oopk";

            FileInfo fNewFile = new FileInfo(download + "_.xlsx");

            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                ExcelWorksheet MyWorksheet = MyExcel.Workbook.Worksheets[1];

                tb.tworzArkuszwExcle(MyWorksheet, (DataTable)Session["tabela01"], 105, 0, 7, true, true, false, false, true);

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
            }
            przemiel();
        }

        protected void LinkButton54_Click(object sender, EventArgs e)
        {
            przemiel();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //make footer

            if (e.Row.RowType == DataControlRowType.Footer)

            {
                tb.makeSumRow((DataTable)Session["tabela01"], e, 110, 5);
            }
        }
    }
}