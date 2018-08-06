using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using OfficeOpenXml;
namespace stat2018
{
   
    public partial class oopc : System.Web.UI.Page
    {

        public Class1 cl = new Class1();
        public common cm = new common();

        const string tenPlik = "oopc.aspx";
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
                // Server.Transfer("default.aspx");
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

        protected void TimerTick(object sender, EventArgs e)
        {

            Timer1.Enabled = false;
            imgLoader.Visible = false;
        }
        protected void przemiel()
        {
            Timer1.Enabled = true;
            imgLoader.Visible = true;
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
                if (string.IsNullOrEmpty(dzial) != true)
                {
                    txt = txt + cl.generuj_dane_do_tabeli_XXL(int.Parse(dzial), 5, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text));
                    txt = txt + cl.uzupelnij_statusy_Xl();
                }

            }
            catch (Exception ex)
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
            Timer1.Enabled = false;
            imgLoader.Visible = false;
        }

        #region "nagłowki tabel"


        protected void grvMergeHeader_RowCreated(object sender, GridViewRowEventArgs e)
        {


            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();


                DataTable dT = new DataTable();
                dT.Columns.Clear();
                dT.Columns.Add("Column1", typeof(string));
                dT.Columns.Add("Column2", typeof(string));
                dT.Columns.Add("Column3", typeof(string));
                dT.Columns.Add("Column4", typeof(string));
                dT.Columns.Add("Column5", typeof(string));
                // wypełnienie danymi
                dT.Clear();

                //sesje odbyte przez sędziego 
                dT.Rows.Add(new Object[] { "1", "rozprawy", "1", "1", "h" });
                dT.Rows.Add(new Object[] { "1", "posiedzenia", "1", "1", "h" });
                dT.Rows.Add(new Object[] { "1", "rozprawy", "1", "1", "h" });
                dT.Rows.Add(new Object[] { "1", "posiedzenia", "1", "1", "h" });
                //WPŁYW(Dz.1.1.k.02)

                dT.Rows.Add(new Object[] { "2", "106 (w.205)", "1", "2", "h" });
                dT.Rows.Add(new Object[] { "2", "118 (w. 207)", "1", "2", "h" });


                dT.Rows.Add(new Object[] { "2", "na rozprawę (k.04)", "1", "2", "h" });
                dT.Rows.Add(new Object[] { "2", "na posiedzenie (k.15)", "1", "2", "h" });
                dT.Rows.Add(new Object[] { "2", "na rozprawę (k.04)", "1", "2", "h" });
                dT.Rows.Add(new Object[] { "2", "na posiedzenie (k.15)", "1", "2", "h" });
                dT.Rows.Add(new Object[] { "2", "na rozprawę (k.04)", "1", "2", "h" });
                dT.Rows.Add(new Object[] { "2", "na posiedzenie (k.15)", "1", "2", "h" });
                dT.Rows.Add(new Object[] { "2", "na rozprawę (k.04)", "1", "2", "h" });
                dT.Rows.Add(new Object[] { "2", "na posiedzenie (k.15)", "1", "2", "h" });
                dT.Rows.Add(new Object[] { "2", "na rozprawę (k.04)", "1", "2", "h" });
                dT.Rows.Add(new Object[] { "2", "na posiedzenie (k.15)", "1", "2", "h" });
                dT.Rows.Add(new Object[] { "2", "na rozprawę (k.04)", "1", "2", "h" });
                dT.Rows.Add(new Object[] { "2", "na posiedzenie (k.15)", "1", "2", "h" });
                dT.Rows.Add(new Object[] { "2", "na rozprawę (k.04)", "1", "2", "h" });
                dT.Rows.Add(new Object[] { "2", "na posiedzenie (k.15)", "1", "2", "h" });
                //Załatwiono (Dz. 1.2.2.)
                dT.Rows.Add(new Object[] { "2", "na rozprawę (k.04)", "1", "2", "h" });
                dT.Rows.Add(new Object[] { "2", "na posiedzenie (k.15)", "1", "2", "h" });
                dT.Rows.Add(new Object[] { "2", "na rozprawę (k.04)", "1", "2", "h" });
                dT.Rows.Add(new Object[] { "2", "na posiedzenie (k.15)", "1", "2", "h" });
                dT.Rows.Add(new Object[] { "2", "na rozprawę (k.04)", "1", "2", "h" });
                dT.Rows.Add(new Object[] { "2", "na posiedzenie (k.15)", "1", "2", "h" });
                dT.Rows.Add(new Object[] { "2", "na rozprawę (k.04)", "1", "2", "h" });
                dT.Rows.Add(new Object[] { "2", "na posiedzenie (k.15)", "1", "2", "h" });
                dT.Rows.Add(new Object[] { "2", "na rozprawę (k.04)", "1", "2", "h" });
                dT.Rows.Add(new Object[] { "2", "na posiedzenie (k.15)", "1", "2", "h" });
                dT.Rows.Add(new Object[] { "2", "na rozprawę (k.04)", "1", "2", "h" });
                dT.Rows.Add(new Object[] { "2", "na posiedzenie (k.15)", "1", "2", "h" });
                dT.Rows.Add(new Object[] { "2", "na rozprawę (k.04)", "1", "2", "h" });
                dT.Rows.Add(new Object[] { "2", "na posiedzenie (k.15)", "1", "2", "h" });

                //zalatwienia

                dT.Rows.Add(new Object[] { "2", "106 (w.205)", "1", "2", "h" });
                dT.Rows.Add(new Object[] { "2", "118 (w. 207)", "1", "2", "h" });


                //sesje odbyte przez sędziego 

                dT.Rows.Add(new Object[] { "2", "ogółem", "1", "2", "h" });
                dT.Rows.Add(new Object[] { "2", "z tego", "2", "1", "h" });
                dT.Rows.Add(new Object[] { "2", "ogółem (k.01, w.01)", "1", "2", "h" });
                dT.Rows.Add(new Object[] { "2", "z tego", "2", "1", "h" });

                //pozostałości

                dT.Rows.Add(new Object[] { "2", "106", "1", "2", "h" });
                dT.Rows.Add(new Object[] { "2", "118", "1", "2", "h" });
                ////liczba sporządzonych uzasadnień (Dz. 1.4. w.01)

                dT.Rows.Add(new Object[] { "2", "1-14 dni (k.03)", "1", "2", "h" });
                dT.Rows.Add(new Object[] { "2", "w tym nieusprawiedliwione (k.04)", "1", "2", "h" });
                dT.Rows.Add(new Object[] { "2", "15-30 dni (k.05)", "1", "2", "h" });
                dT.Rows.Add(new Object[] { "2", "w tym nieusprawiedliwione (k.06)", "1", "2", "h" });
                dT.Rows.Add(new Object[] { "2", "pow. 1 do 3 mieś. (k.7)", "1", "2", "h" });
                dT.Rows.Add(new Object[] { "2", "w tym nieusprawiedliwione (k.8)", "1", "2", "h" });
                dT.Rows.Add(new Object[] { "2", "ponad 3 mies.  (k.9)", "1", "2", "h" });
                dT.Rows.Add(new Object[] { "2", "w tym nieusprawiedliwione (k.10)", "1", "2", "h" });
                //   //Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent** (Dz. 1.4.)
                dT.Rows.Add(new Object[] { "2", "razem (k.13,w.01)", "1", "2", "h" });
                dT.Rows.Add(new Object[] { "2", "w tym, w których projekt został zaakceptowany przez sędziego (k.14,w.01)", "1", "2", "h" });
                //  skargi na przewlekłość(Dz.4.2.)
                dT.Rows.Add(new Object[] { "2", "ogółem", "1", "2", "h" });
                dT.Rows.Add(new Object[] { "2", "uwzględniono (k.03,w.01)", "1", "2", "h" });
                //mediacje (Dział 1.1.1.)
                dT.Rows.Add(new Object[] { "2", " liczba  sparw, w których strony skierowano do mediacji (kol. 01, w.02)", "1", "2", "h" });

                dT.Rows.Add(new Object[] { "2", "liczba ugód zawartych przed mediatorem (kol. 01, w.05)", "1", "2", "h" });

                dT.Rows.Add(new Object[] { "2", "Umorzono postępowanie w wyniku zatwierdzenia ugody zawartej przed mediatorem (kol. 01, w.08) ", "1", "2", "h" });
                //Kolumna kontrolna (wyznaczenia>=załatwień)
                dT.Rows.Add(new Object[] { "2", "na rozprawie", "1", "2", "h" });

                dT.Rows.Add(new Object[] { "2", "na posiedzeniu", "1", "2", "h" });


                //WPŁYW(Dz.1.1.k.02)
                dT.Rows.Add(new Object[] { "3", "Ogółem (w.01)", "1", "3", "h" });
                dT.Rows.Add(new Object[] { "3", "C (w.02)", "1", "3", "h" });
                dT.Rows.Add(new Object[] { "3", "Ns(w.110)", "1", "3", "h" });
                dT.Rows.Add(new Object[] { "3", "Wykaz N (w.158)", "1", "3", "h" });
                dT.Rows.Add(new Object[] { "3", "Nc (w.161)", "1", "3", "h" });
                dT.Rows.Add(new Object[] { "3", "Co (w.200)", "1", "3", "h" });
                dT.Rows.Add(new Object[] { "3", "w tym", "2", "1", "h" });
                dT.Rows.Add(new Object[] { "3", "Cps (w.227) ", "1", "3", "h" });
                dT.Rows.Add(new Object[] { "3", "WSC (w.229)", "1", "3", "h" });


                dT.Rows.Add(new Object[] { "3", "Ogółem (w.01)", "2", "1", "h" });
                dT.Rows.Add(new Object[] { "3", "C (w.02)", "2", "1", "h" });
                dT.Rows.Add(new Object[] { "3", "Ns (w.04)", "2", "1", "h" });
                dT.Rows.Add(new Object[] { "3", "Nc (w.05)", "2", "1", "h" });
                dT.Rows.Add(new Object[] { "3", "Co (w.06)", "2", "1", "h" });
                dT.Rows.Add(new Object[] { "3", "Cps (w.07)", "2", "1", "h" });
                dT.Rows.Add(new Object[] { "3", "WSC (w.08)", "2", "1", "h" });
                //Załatwiono (Dz. 1.2.2.)
                dT.Rows.Add(new Object[] { "3", "Ogółem (w.01)", "2", "1", "h" });
                dT.Rows.Add(new Object[] { "3", "C (w.02)", "2", "1", "h" });
                dT.Rows.Add(new Object[] { "3", "Ns (w.04)", "2", "1", "h" });
                dT.Rows.Add(new Object[] { "3", "Nc (w.05)", "2", "1", "h" });
                dT.Rows.Add(new Object[] { "3", "Co (w.06)", "2", "1", "h" });
                dT.Rows.Add(new Object[] { "3", "Cps (w.07)", "2", "1", "h" });
                dT.Rows.Add(new Object[] { "3", "WSC (w.08)", "2", "1", "h" });
                //ZAŁATWIENIA
                dT.Rows.Add(new Object[] { "3", "Ogółem (w.01)", "1", "3", "h" });
                dT.Rows.Add(new Object[] { "3", "C (w.02)", "1", "3", "h" });
                dT.Rows.Add(new Object[] { "3", "Ns (w.110)", "1", "3", "h" });
                dT.Rows.Add(new Object[] { "3", "Wykaz N (w.158)", "1", "3", "h" });
                dT.Rows.Add(new Object[] { "3", "Nc (w.161)", "1", "3", "h" });
                dT.Rows.Add(new Object[] { "3", "Co (w.200)", "1 ", "3", "h" });
                dT.Rows.Add(new Object[] { "3", "w tym", "2 ", "1", "h" });

                dT.Rows.Add(new Object[] { "3", "Cps (w.227)", "1", "3", "h" });
                dT.Rows.Add(new Object[] { "3", "WSC (w.229)", "1", "3", "h" });


                //sesje odbyte przez sędziego 
                dT.Rows.Add(new Object[] { "3", "wszystkie sesje sędziego w wydziale", "3", "1", "h" });
                dT.Rows.Add(new Object[] { "3", "na potrzeby MS-S (Dz.1.2.2.)", "3", "1", "h" });
                //Liczba odroczonych publikacji orzeczeń (Dz.1.1.)
                dT.Rows.Add(new Object[] { "3", "ogółem (wszystkie kategorie spraw) (k.14,w.01)", "1", "3", "h" });
                dT.Rows.Add(new Object[] { "3", "C", "1", "3", "h" });
                dT.Rows.Add(new Object[] { "3", "Ns", "1", "3", "h" });
                //Liczba odroczonych spraw (Dz. 1.1.)
                dT.Rows.Add(new Object[] { "3", "z terminem", "1", "3", "h" });
                dT.Rows.Add(new Object[] { "3", "bez wyznaczonego terminu", "1", "3", "h" });
                dT.Rows.Add(new Object[] { "3", "OGÓŁEM (wraz z publikacją orzeczeń)<br/> (k.13,w.01)", "1", "3", "v" });
                //pozostałości
                dT.Rows.Add(new Object[] { "3", "Ogółem (w.01)", "1", "3", "h" });
                dT.Rows.Add(new Object[] { "3", "C (w.02)", "1", "3", "h" });
                dT.Rows.Add(new Object[] { "3", "Ns (w.110)", "1", "3", "h" });
                dT.Rows.Add(new Object[] { "3", "Wykaz N (w.158)", "1", "3", "h" });
                dT.Rows.Add(new Object[] { "3", "Nc (w.161)", "1", "3", "h" });
                dT.Rows.Add(new Object[] { "3", "Co (w.200)", "1 ", "3", "h" });
                dT.Rows.Add(new Object[] { "3", "w tym", "2 ", "1", "h" });

                dT.Rows.Add(new Object[] { "3", "Cps (w.227)", "1", "3", "h" });
                dT.Rows.Add(new Object[] { "3", "WSC (w.229)", "1", "3", "h" });
                ////pozostało spraw starych
                dT.Rows.Add(new Object[] { "3", "Ogółem (k.01) oraz pozostałe kategorie spraw  nie ujęte w MS", "1", "3", "h" });
                dT.Rows.Add(new Object[] { "3", "do 3  m-cy (k.02)", "1", "3", "h" });
                dT.Rows.Add(new Object[] { "3", "pow. 3 do 6 m-cy (k. 04)", "1", "3", "h" });
                dT.Rows.Add(new Object[] { "3", "pow.   6 do 12 m-cy (k.05)", "1", "3", "h" });
                dT.Rows.Add(new Object[] { "3", "pow. 12 m-cy do 2 lat (k.07)", "1", "3", "h" });
                dT.Rows.Add(new Object[] { "3", "pow. 2 do 3 lat (k.08)", "1", "3", "h" });
                dT.Rows.Add(new Object[] { "3", "pow. 3 do 5 lat (k.09)", "1", "3", "h" });
                dT.Rows.Add(new Object[] { "3", "pow. 5 do 8 lat (k.10)", "1", "3", "h" });
                dT.Rows.Add(new Object[] { "3", "pow. 8 lat (k.11)", "1", "3", "h" });
                ////liczba sporządzonych uzasadnień (Dz. 1.4. w.01)
                dT.Rows.Add(new Object[] { "3", "łącznie (k.01)", "1", "3", "h" });
                dT.Rows.Add(new Object[] { "3", "w terminie ustawowym 14 dni (k.02)", "1", "3", "h" });
                dT.Rows.Add(new Object[] { "3", "razem po terminie ustawowym", "1", "3", "h" });
                dT.Rows.Add(new Object[] { "3", "nieusprawiedliwionych", "1", "3", "h" });
                dT.Rows.Add(new Object[] { "3", "po upływie terminu ustawowego", "8", "1", "h" });
                //  skargi na przewlekłość(Dz.4.2.)
                dT.Rows.Add(new Object[] { "3", "wpływ (k.01,w.01)", "1", "3", "h" });
                dT.Rows.Add(new Object[] { "3", "załatwiono", "2", "1", "h" });
                dT.Rows.Add(new Object[] { "3", "pozostało", "1", "3", "h" });
                //mediacje (Dział 1.1.1.)
                dT.Rows.Add(new Object[] { "3", "wpływ", "1", "1", "h" });
                dT.Rows.Add(new Object[] { "3", "rozstrzygnięcie", "2", "1", "h" });
                //stan spraw zawieszonych
                dT.Rows.Add(new Object[] { "3", "ogółem", "1", "3", "h" });
                dT.Rows.Add(new Object[] { "3", "zakreślonych (Dz. 2.1.2.1. k.01, w.01-05)", "1", "3", "h" });
                dT.Rows.Add(new Object[] { "3", "niezakreślonych (Dz. 2.1.1.a.a.1. k. 01, w.01-05)", "1", "3", "h" });



                //==================================== 4 ========================================== 
                dT.Rows.Add(new Object[] { "4", "L.p.", "1", "4", "h" });
                dT.Rows.Add(new Object[] { "4", "Funkcja", "1", "4", "h" });
                dT.Rows.Add(new Object[] { "4", "Stanowisko", "1", "4", "h" });
                dT.Rows.Add(new Object[] { "4", "Imię i nazwisko", "1", "4", "h" });
                dT.Rows.Add(new Object[] { "4", "WPŁYW (Dz.1.1. k.02)", "10", "1", "h" });

                dT.Rows.Add(new Object[] { "4", "Wyznaczono (Dz. 1.2.1.)", "14", "1", "h" });
                dT.Rows.Add(new Object[] { "4", "Załatwiono (Dz. 1.2.2.)", "14", "1", "h" });
                dT.Rows.Add(new Object[] { "4", "ZAŁATWIENIA (Dz.1.1. k.03)", "10", "1", "h" });


                //sesje odbyte przez sędziego 
                dT.Rows.Add(new Object[] { "4", "sesje odbyte przez sędziego", "6", "1", "h" });

                //Liczba odroczonych publikacji orzeczeń (Dz.1.1.)
                dT.Rows.Add(new Object[] { "4", "Liczba odroczonych publikacji orzeczeń (Dz.1.1.)", "3", "1", "h" });
                //Liczba odroczonych publikacji orzeczeń (Dz.1.1.)
                dT.Rows.Add(new Object[] { "4", "Liczba odroczonych spraw (Dz. 1.1.)", "3", "1", "h" });
                //POZOSTAŁOŚĆ na następny m-c (Dz.1.1. k.15)
                dT.Rows.Add(new Object[] { "4", "POZOSTAŁOŚĆ na następny m-c (Dz.1.1. k.15)", "10", "1", "h" });

                //POZOSTAŁOŚĆ na następny m-c (Dz.1.1. k.15)
                dT.Rows.Add(new Object[] { "4", "pozostało spraw starych (Dz. 2.1.1.a.1. w.01-05)", "9", "1", "h" });
                //liczba sporządzonych uzasadnień (Dz. 1.4. w.01)
                dT.Rows.Add(new Object[] { "4", "liczba sporządzonych uzasadnień (Dz. 1.4. w.01)", "12", "1", "h" });
                //Uzasadnienia wygłoszone  (k.11)
                dT.Rows.Add(new Object[] { "4", "Uzasadnienia wygłoszone  (k.11)", "1", "4", "h" });
                //Liczba spraw do których wpłynął wniosek o transkrypcje uzasadnień wygłoszonych (k.12)
                dT.Rows.Add(new Object[] { "4", "Liczba spraw do których wpłynął wniosek o transkrypcje uzasadnień wygłoszonych (k.12)", "1", "4", "h" });
                //Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent** (Dz. 1.4.)
                dT.Rows.Add(new Object[] { "4", "Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent** (Dz. 1.4.)", "2", "2", "h" });
                //skargi na przewlekłość (Dz.4.2.)
                dT.Rows.Add(new Object[] { "4", "skargi na przewlekłość (Dz.4.2.)", "4", "1", "h" });
                //mediacje (Dział 1.1.1.)
                dT.Rows.Add(new Object[] { "4", "mediacje (Dział 1.1.1.)", "3", "1", "h" });
                //stan spraw zawieszonych
                dT.Rows.Add(new Object[] { "4", "stan spraw zawieszonych", "3", "1", "h" });

                dT.Rows.Add(new Object[] { "4", "UWAGI", "1", "4", "h" });

                dT.Rows.Add(new Object[] { "4", "Kolumna kontrolna (wyznaczenia>=załatwień)", "2", "2", "h" });

                //wywołanie
                cl.makeHeader(sn, dT, GridView1);






                /*
                            HeaderGridRow.Font.Size = 7;
                            HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
                            HeaderGridRow.VerticalAlign = VerticalAlign.Top;
                            HeaderGridRow.BackColor = System.Drawing.Color.Cyan;
                            TableCell HeaderCell = new TableCell();


                            /*
                            HeaderCell = new TableCell();
                            HeaderCell.Text = "Ogółem";
                            HeaderCell.ColumnSpan = 1;
                            HeaderCell.RowSpan = 1;
                            HeaderGridRow.Cells.Add(HeaderCell);
                            GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                            HeaderCell = new TableCell();
                            HeaderCell.Text = "K";
                            HeaderCell.ColumnSpan = 1;
                            HeaderCell.RowSpan = 1;
                            HeaderGridRow.Cells.Add(HeaderCell);
                            GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                            HeaderCell = new TableCell();
                            HeaderCell.Text = "W";
                            HeaderCell.ColumnSpan = 1;
                            HeaderCell.RowSpan = 1;
                            HeaderGridRow.Cells.Add(HeaderCell);
                            GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                            HeaderCell = new TableCell();
                            HeaderCell.Text = "Kop";
                            HeaderCell.ColumnSpan = 1;
                            HeaderGridRow.Cells.Add(HeaderCell);
                            GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                            HeaderCell = new TableCell();
                            HeaderCell.Text = "Kp";
                            HeaderCell.ColumnSpan = 1;
                            HeaderGridRow.Cells.Add(HeaderCell);
                            GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                            HeaderCell = new TableCell();
                            HeaderCell.Text = "Ko karne";
                            HeaderCell.ColumnSpan = 1;
                            HeaderGridRow.Cells.Add(HeaderCell);
                            GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                            HeaderCell = new TableCell();
                            HeaderCell.Text = "Ko wykrocz";
                            HeaderCell.ColumnSpan = 1;
                            HeaderGridRow.Cells.Add(HeaderCell);
                            GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                            */
                //czwarty
                /*	HeaderCell = new TableCell();
                    HeaderCell.Text = "rozprawy";

                    HeaderCell.ColumnSpan = 1;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "posiedzenia";

                    HeaderCell.ColumnSpan = 1;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "10";

                    HeaderCell.ColumnSpan = 1;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "118";

                    HeaderCell.ColumnSpan = 1;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "Co<br/>a.''106''";

                    HeaderCell.ColumnSpan = 1;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "Co<br/>a.''118''";

                    HeaderCell.ColumnSpan = 1;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "Co s.106";
                    HeaderCell.ColumnSpan = 1;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "Co s.118";
                    HeaderCell.ColumnSpan = 1;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "Co s.106";
                    HeaderCell.ColumnSpan = 1;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "Co s.118";
                    HeaderCell.ColumnSpan = 1;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                    HeaderCell = new TableCell();
                    HeaderCell.Text = "<br/>usprawiedliwionych";
                    HeaderCell.ColumnSpan = 1;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "nie <br/>usprawiedliwionych";
                    HeaderCell.ColumnSpan = 1;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                    HeaderCell = new TableCell();
                    HeaderCell.Text = "<br/>usprawiedliwionych";
                    HeaderCell.ColumnSpan = 1;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "nie <br/>usprawiedliwionych";
                    HeaderCell.ColumnSpan = 1;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "<br/>usprawiedliwionych";
                    HeaderCell.ColumnSpan = 1;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "nie <br/>usprawiedliwionych";
                    HeaderCell.ColumnSpan = 1;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                // trzeci

                    HeaderGrid = (GridView)sender;
                    HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
                    HeaderGridRow.Font.Size = 7;
                    HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
                    HeaderGridRow.VerticalAlign = VerticalAlign.Top;
                    HeaderGridRow.Font.Size = 7;
                    HeaderGridRow.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.VerticalAlign = VerticalAlign.Top;

                    Style stl = new Style();
                    stl.CssClass = "verticaltext";

                    HeaderCell = new TableCell();
                    HeaderCell.Text = " 106 ";
                    HeaderCell.ApplyStyle(stl);
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = " 118 ";
                    HeaderCell.ApplyStyle(stl);
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "na rozprawę";
                    HeaderCell.ApplyStyle(stl);
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "na posiedzenie";
                    HeaderCell.ApplyStyle(stl);
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "na rozprawę";
                    HeaderCell.ApplyStyle(stl);
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "na posiedzenie";
                    HeaderCell.ApplyStyle(stl);
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                    HeaderCell = new TableCell();
                    HeaderCell.Text = "na rozprawę";
                    HeaderCell.ApplyStyle(stl);
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "na posiedzenie";
                    HeaderCell.ApplyStyle(stl);
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                    HeaderCell = new TableCell();
                    HeaderCell.Text = "na rozprawę";
                    HeaderCell.ApplyStyle(stl);
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "na posiedzenie";
                    HeaderCell.ApplyStyle(stl);
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "na rozprawę";
                    HeaderCell.ApplyStyle(stl);
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "na posiedzenie";
                    HeaderCell.ApplyStyle(stl);
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "na rozprawę";
                    HeaderCell.ApplyStyle(stl);
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "na posiedzenie";
                    HeaderCell.ApplyStyle(stl);
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text ="na rozprawę";
                    HeaderCell.ApplyStyle(stl);
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "na posiedzenie";
                    HeaderCell.ApplyStyle(stl);
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "na rozprawę";
                    HeaderCell.ApplyStyle(stl);
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "na posiedzenie";
                    HeaderCell.ApplyStyle(stl);
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "na rozprawę";
                    HeaderCell.ApplyStyle(stl);
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "na posiedzenie";
                    HeaderCell.ApplyStyle(stl);
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "na rozprawę";
                    HeaderCell.ApplyStyle(stl);
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "na posiedzenie";
                    HeaderCell.ApplyStyle(stl);
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "na rozprawę";
                    HeaderCell.ApplyStyle(stl);
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "na posiedzenie";
                    HeaderCell.ApplyStyle(stl);
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "na rozprawę";
                    HeaderCell.ApplyStyle(stl);
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "na posiedzenie";
                    HeaderCell.ApplyStyle(stl);
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "na rozprawę";
                    HeaderCell.ApplyStyle(stl);
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "na posiedzenie";
                    HeaderCell.ApplyStyle(stl);
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                    HeaderCell = new TableCell();
                    HeaderCell.Text = "na rozprawę";

                    HeaderCell.ApplyStyle(stl);
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();

                    HeaderCell.Text = "na posiedzenie";
                    HeaderCell.ApplyStyle(stl);
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);



                    HeaderCell = new TableCell();
                    HeaderCell.Text = "106";

                    HeaderCell.ApplyStyle(stl);
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();

                    HeaderCell.Text = "118";
                    HeaderCell.ApplyStyle(stl);
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                    //=================

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "1-14 dni";
                    HeaderCell.ColumnSpan = 2;
                    HeaderCell.RowSpan = 1;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                    HeaderCell = new TableCell();
                    HeaderCell.Text = "15-30 dni";
                    HeaderCell.ColumnSpan = 2;
                    HeaderCell.RowSpan = 1;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "pow 30 dni";
                    HeaderCell.ColumnSpan = 2;
                    HeaderCell.RowSpan = 1;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "ogółem";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "uwzgędniono";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "ogółem";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "uwzgędniono";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "Na rozprawie";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 2;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "na posiedzeniu";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 2;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                    //===================================================================================================================================================================
                   //===================================================================================================================================================================
                    //Środkowy
                    //===================================================================================================================================================================
                    //===================================================================================================================================================================
                    HeaderGrid = (GridView)sender;
                    HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
                    HeaderGridRow.Font.Size = 7;
                    HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
                    HeaderGridRow.VerticalAlign = VerticalAlign.Top;
                    HeaderGridRow.Font.Size = 7;
                    HeaderGridRow.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.VerticalAlign = VerticalAlign.Top;


                    HeaderCell = new TableCell();
                    HeaderCell.Text = "Ogółem";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = " C ";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = " Na ";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "Nc";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "Co ";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "w tym";

                    HeaderCell.ColumnSpan = 2;

                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "Cps";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "WSC";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    //stop
                    HeaderCell = new TableCell();
                    HeaderCell.Text = "Ogółem";
                    HeaderCell.ColumnSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);



                    HeaderCell = new TableCell();
                    HeaderCell.Text = " C ";
                    HeaderCell.ColumnSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "Ns";
                    HeaderCell.ColumnSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "Nc ";
                    HeaderCell.ColumnSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "Co";
                    HeaderCell.ColumnSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "Cps";
                    HeaderCell.ColumnSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                    HeaderCell = new TableCell();
                    HeaderCell.Text = "WSC";
                    HeaderCell.ColumnSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                    //zalatwiono

                    HeaderCell = new TableCell();
                    HeaderCell.Text = " Ogółem ";
                    HeaderCell.ColumnSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = " C ";
                    HeaderCell.ColumnSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "Ns";
                    HeaderCell.ColumnSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "Nc ";
                    HeaderCell.ColumnSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "Co";
                    HeaderCell.ColumnSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "Cps";
                    HeaderCell.ColumnSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "WSC";
                    HeaderCell.ColumnSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                    //Załatwienia

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "Ogółem";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);



                    HeaderCell = new TableCell();
                    HeaderCell.Text = " C ";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);



                    HeaderCell = new TableCell();
                    HeaderCell.Text = " Ns ";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                    HeaderCell = new TableCell();
                    HeaderCell.Text = " Nc ";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "Co";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "w tym ";
                    HeaderCell.ColumnSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                    HeaderCell = new TableCell();
                    HeaderCell.Text = "Cps ";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                    HeaderCell = new TableCell();
                    HeaderCell.Text = "WSC";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    //====================================== Sesje odbyte
                    HeaderCell = new TableCell();
                    HeaderCell.Text = "Ogółem";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                    HeaderCell = new TableCell();
                    HeaderCell.Text = "z tego";
                    HeaderCell.ColumnSpan = 2;
                    HeaderCell.RowSpan = 2;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    //==================================
                    HeaderCell = new TableCell();
                    HeaderCell.Text = "ogółem (wszystkie kategorie spraw)";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray  ;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = " C ";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray  ;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = " Nc";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    //========
                    //Liczba odroczonych spraw

                    HeaderCell = new TableCell();
                    HeaderCell.ApplyStyle(stl);
                    HeaderCell.Text = "z terminem";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;

                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.ApplyStyle(stl);
                    HeaderCell.Text = "bez wyznaczonego terminu";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;

                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                    HeaderCell = new TableCell();
                    HeaderCell.Text = "OGÓŁEM (wraz z publikacją orzeczeń)";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;

                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    //pozostałość 

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "Ogółem";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);



                    HeaderCell = new TableCell();
                    HeaderCell.Text = " C ";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);



                    HeaderCell = new TableCell();
                    HeaderCell.Text = " Ns ";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                    HeaderCell = new TableCell();
                    HeaderCell.Text = "Nc";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                    HeaderCell = new TableCell();
                    HeaderCell.Text = "Co ";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                    HeaderCell = new TableCell();
                    HeaderCell.Text = "w tym";
                    HeaderCell.ColumnSpan = 2;
                    HeaderCell.RowSpan = 2;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                    HeaderCell = new TableCell();
                    HeaderCell.Text = "Cps";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray ;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                    HeaderCell = new TableCell();
                    HeaderCell.Text = "WSC";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                    //=====================
                    //pozostało spraw starych
                    HeaderCell = new TableCell();
                    HeaderCell.Text = "ogółem";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                    HeaderCell = new TableCell();
                    HeaderCell.Text = "do 3 m-cy";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "pow. 3 do 6 m-cy";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                    HeaderCell = new TableCell();
                    HeaderCell.Text = "pow. 6 do 12 m-cy";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                    HeaderCell = new TableCell();
                    HeaderCell.Text = "pow. 12 do 2 lat";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                    HeaderCell = new TableCell();
                    HeaderCell.Text = "pow. 2 do 3 lat";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                    HeaderCell = new TableCell();
                    HeaderCell.Text = "pow. 3 do 5 lat";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "w tym";
                    HeaderCell.ColumnSpan = 2;
                    HeaderCell.RowSpan = 2;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "pow 5 do 8 lat";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "w tym";
                    HeaderCell.ColumnSpan = 2;
                    HeaderCell.RowSpan = 2;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                    HeaderCell = new TableCell();
                    HeaderCell.Text = "pow. 8 lat";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "w tym";
                    HeaderCell.ColumnSpan = 2;
                    HeaderCell.RowSpan = 2;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                    //liczba sporządzonych uzasadnień
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                    HeaderCell = new TableCell();
                    HeaderCell.Text = "łacznie";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                    HeaderCell = new TableCell();
                    HeaderCell.Text = "w terminie ustawowym 14 dni";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                    HeaderCell = new TableCell();
                    HeaderCell.Text = "razem po terminie ustawowym";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                    HeaderCell = new TableCell();

                    HeaderCell.Text = "<br/>usprawiedliwionych";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                    HeaderCell = new TableCell();
                    HeaderCell.Text = " nie <br/>usprawiedliwionych";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                    HeaderCell = new TableCell();
                    HeaderCell.Text = " po terminie";
                    HeaderCell.ColumnSpan = 6;
                    HeaderCell.RowSpan = 1;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                    HeaderCell = new TableCell();
                    HeaderCell.Text = " ogółem";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                    HeaderCell = new TableCell();
                    HeaderCell.Text = "w tym w których wpłynął wniosek o transkrypcję";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                    HeaderCell = new TableCell();
                    HeaderCell.Text = "wpływ";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                    HeaderCell = new TableCell();
                    HeaderCell.Text = "załatwiono";
                    HeaderCell.ColumnSpan = 2;
                    HeaderCell.RowSpan = 1;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                    HeaderCell = new TableCell();
                    HeaderCell.Text = "Skierowane do mediacji";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                    HeaderCell = new TableCell();
                    HeaderCell.Text = "załatwiono";
                    HeaderCell.ColumnSpan = 2;
                    HeaderCell.RowSpan = 1;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                    HeaderCell = new TableCell();
                    HeaderCell.Text = "ogółem";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;
                    HeaderCell.ApplyStyle(stl);
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                    HeaderCell = new TableCell();
                    HeaderCell.ApplyStyle(stl);
                    HeaderCell.Text = "zakreślonych";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;

                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                    HeaderCell = new TableCell();
                    HeaderCell.ApplyStyle(stl);
                    HeaderCell.Text = "nie zakreślonych";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 3;

                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    ////  Górny wiersz

                    HeaderGrid = (GridView)sender;
                    HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
                    HeaderGridRow.Font.Size = 10;
                    HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
                    HeaderGridRow.VerticalAlign = VerticalAlign.Top;

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "L.p.";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 4;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "Funkcja";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 4;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "Stanowisko";
                    HeaderCell.RowSpan = 4;
                    HeaderCell.ColumnSpan = 1;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "Imię i nazwisko";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 4;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "WPŁYW";
                    HeaderCell.ColumnSpan = 9;
                    HeaderCell.RowSpan = 1;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                    HeaderCell = new TableCell();
                    HeaderCell.Text = "Wyznaczono";
                    HeaderCell.ColumnSpan = 14;
                    HeaderCell.RowSpan = 1;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "Załatwiono";
                    HeaderCell.ColumnSpan = 14;
                    HeaderCell.RowSpan = 1;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "ZAŁATWIENIA";
                    HeaderCell.ColumnSpan = 9;
                    HeaderCell.RowSpan = 1;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "Sesje odbyte";
                    HeaderCell.ColumnSpan = 3;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderCell.RowSpan = 1;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                    HeaderCell = new TableCell();
                    HeaderCell.Text = "Liczba odroczonych publikacji orzeczeń";
                    HeaderCell.ColumnSpan = 3;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderCell.RowSpan = 1;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "Liczba odroczonych spraw";
                    HeaderCell.ColumnSpan = 3;
                    HeaderCell.RowSpan = 1;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "POZOSTAŁOŚĆ na następny mc";
                    HeaderCell.ColumnSpan = 9;
                    HeaderCell.RowSpan = 1;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "pozostało spraw starych";
                    HeaderCell.ColumnSpan = 15;
                    HeaderCell.RowSpan = 1;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                    HeaderCell = new TableCell();
                    HeaderCell.Text = "liczba sporządzonych uzasadnień";
                    HeaderCell.ColumnSpan = 11;
                    HeaderCell.RowSpan = 1;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                    HeaderCell = new TableCell();
                    HeaderCell.Text = "uzasadnienia wygłoszone *";
                    HeaderCell.ColumnSpan = 2;
                    HeaderCell.RowSpan = 1;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "Skargi na przewlekłość";
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderCell.ColumnSpan = 3;
                    HeaderCell.RowSpan = 1;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "Mediacje";
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderCell.ColumnSpan = 3;
                    HeaderCell.RowSpan = 1;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "Stan spraw zawieszonych";
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderCell.ColumnSpan = 3;
                    HeaderCell.RowSpan = 1;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "UWAGI";
                    HeaderCell.ColumnSpan = 1;
                    HeaderCell.RowSpan = 4;
                    HeaderCell.BackColor = System.Drawing.Color.LightGray;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                    HeaderCell = new TableCell();
                    HeaderCell.Text = "Kolumna kontrolna";
                    HeaderCell.BackColor = System.Drawing.Color.DarkGray;
                    HeaderCell.ColumnSpan = 2;
                    HeaderCell.RowSpan = 2;
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                    */
            }
        }


        #endregion "nagłowki tabel"

        #region "obsługa oncommand  tabel z nazwiskami"



        #endregion "obsługa oncommand  tabel z nazwiskami"


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
            //  excell();

            string path = Server.MapPath("Template") + "\\oopc.xlsx";
            FileInfo existingFile = new FileInfo(path);

            string download = Server.MapPath("Template") + @"\oopc";

            FileInfo fNewFile = new FileInfo(download + "_.xlsx");

            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                try
                {
                    ExcelWorksheet MyWorksheet = MyExcel.Workbook.Worksheets[1];

                    DataView view = (DataView)statystyki.Select(DataSourceSelectArguments.Empty);

                    DataTable table = view.ToTable();
                    table.Columns.Remove("ident");
                    table.Columns.Remove("id_sedziego");
                    table.Columns.Remove("stanowisko");
                    table.Columns.Remove("funkcja");


                    table.Columns.Remove("d_109");
                    table.Columns.Remove("d_108");
                    table.Columns.Remove("d_107");
                    table.Columns.Remove("d_106");

                    robArkusz(MyExcel, 1, view, 6, 113);

                    try
                    {

                        //==========================
                        MyExcel.SaveAs(fNewFile);

                        this.Response.Clear();
                        this.Response.ContentType = "application/vnd.ms-excel";
                        this.Response.AddHeader("Content-Disposition", "attachment;filename=" + fNewFile.Name);
                        this.Response.WriteFile(fNewFile.FullName);
                        this.Response.End();


                    }
                    catch (Exception ex)
                    {
                        Label31.Text = Label31.Text + "Save Error massage " + ex.Message + "<br/>";
                    }
                    try
                    {
                        //  System.Diagnostics.Process.Start(fNewFile.FullName.ToString());
                    }
                    catch (Exception ex)
                    {
                        Label31.Text = Label31.Text + "Run Excell Error massage " + ex.Message;
                    }

                }
                catch (Exception ex)
                { }
                try
                {
                    File.Delete(fNewFile.FullName);
                }
                catch (Exception ex)
                {
                    // Label31.Text = "Delete error massage: " + ex.Message + "<br/>";
                }
            }
        }

        protected void robArkusz(ExcelPackage MyExcel, int nrArkusza, DataView View, int rowikPlus, int ilKolumn)
        {

            ExcelWorksheet MyWorksheet8 = MyExcel.Workbook.Worksheets[nrArkusza];

            DataTable table7 = View.ToTable();
            table7.Columns.Remove("ident");
            table7.Columns.Remove("id_sedziego");
            table7.Columns.Remove("stanowisko");
            //        table.Columns.Remove("funkcja");
            int rowik = 1;
            foreach (DataRow dR in table7.Rows)
            {
                manageCells(MyWorksheet8, rowik + rowikPlus, 1, rowik.ToString());
                manageCells(MyWorksheet8, rowik + rowikPlus, 2, dR[1].ToString().Trim() + " " + dR[2].ToString().Trim());
                for (int i = 3; i < ilKolumn; i++)
                {
                    manageCells(MyWorksheet8, rowik + rowikPlus, i, dR[i].ToString().Trim());
                }
                rowik++;
            }
            manageCells(MyWorksheet8, rowik + rowikPlus, 3, "Razem");

            try
            {
                for (int i = 1; i < ilKolumn - 2; i++)
                {
                    object sumObject;
                    string txt = "d_";
                    string digit = i.ToString("D2");
                    txt = txt + digit;
                    sumObject = table7.Compute("Sum(" + txt + ")", "");
                    manageCells(MyWorksheet8, rowik + rowikPlus, i + 3, sumObject.ToString());
                }
            }
            catch (Exception ex)
            { }





        }

        protected void manageCells(ExcelWorksheet sheet, int rowik, int col, string value)
        {
            try
            {
                sheet.Cells[rowik, col].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                sheet.Cells[rowik, col].Style.ShrinkToFit = true;
                try
                {
                    sheet.Cells[rowik, col].Value = double.Parse(value);

                }
                catch (Exception)
                {
                    sheet.Cells[rowik, col].Value = value;
                }


            }
            catch
            { } // end of try
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


                DataView view = (DataView)statystyki.Select(DataSourceSelectArguments.Empty);

                DataTable table = view.ToTable();
                object sumObject;
                e.Row.Cells[3].Text = "Razem";
                for (int i = 1; i < 109; i++)
                {
                    string txt = "d_";
                    string digit = i.ToString("D2");
                    txt = txt + digit;
                    sumObject = table.Compute("Sum(" + txt + ")", "");
                    e.Row.Cells[3 + i].Text = sumObject.ToString();
                }

            }

        }


    }

}