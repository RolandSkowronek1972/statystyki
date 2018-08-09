   using System;
    using System.Data;
    using System.Globalization;
    using System.IO;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using OfficeOpenXml;


namespace stat2018
{
    public partial class oopk : System.Web.UI.Page
    {

        public Class1 cl = new Class1();
        public common cm = new common();
        public const string tenPlik = "oopk";
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
            catch 
            {
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
                txt = txt + cl.uzupelnij_statusy_Xl();
            }
            catch
            { }
            // dopasowanie opisów
            makeLabels();

            //Label30.Text = System.IO.File.ReadAllText(Server.MapPath(@"~//version.txt")).ToString().Trim();

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

        GridViewRow Grw(object sender)
        {
            GridViewRow HeaderGridRow = null;
            GridView HeaderGrid = (GridView)sender;
            HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
            HeaderGridRow.Font.Size = 7;
            HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
            HeaderGridRow.VerticalAlign = VerticalAlign.Top;
            return HeaderGridRow;

        }

        protected void makeHeader(System.Web.UI.WebControls.GridView sender, DataTable dT, System.Web.UI.WebControls.GridView GridViewX)
        {
            try
            {
                int row = 0;
                TableCell HeaderCell = new TableCell();
                GridViewRow HeaderGridRow = null;
                string hv = "h";
                Style stl = new Style();
                foreach (DataRow dR in dT.Rows)
                {
                    if (int.Parse(dR[0].ToString().Trim()) > row)
                    {
                        GridView HeaderGrid = (GridView)sender;
                        HeaderGridRow = Grw(sender);
                        row = int.Parse(dR[0].ToString().Trim());
                        hv = dR[4].ToString().Trim();
                    }

                    if (hv == "v")
                    {
                        stl.CssClass = "verticaltext";
                    }
                    else
                    {
                        stl.CssClass = "horizontaltext";
                    }

                    HeaderCell = new TableCell();
                    HeaderCell.Text = dR[1].ToString().Trim();
                    HeaderCell.Style.Clear();
                    HeaderCell.ApplyStyle(stl);
                    HeaderCell.ColumnSpan = int.Parse(dR[2].ToString().Trim());
                    HeaderCell.RowSpan = int.Parse(dR[3].ToString().Trim());
                    HeaderGridRow.Cells.Add(HeaderCell);


                    GridViewX.Controls[0].Controls.AddAt(0, HeaderGridRow);

                }
            }
            catch 
            { } // end of try
        }


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
                dT.Rows.Add(new Object[] { "1", "rozprawy", "1", "1", "v" });//
                dT.Rows.Add(new Object[] { "1", "posiedzenia", "1", "1", "v" });//

                dT.Rows.Add(new Object[] { "1", "rozprawy", "1", "1", "v" });//
                dT.Rows.Add(new Object[] { "1", "posiedzenia", "1", "1", "v" });//

                //wpływ
                dT.Rows.Add(new Object[] { "2", "śledztwa", "1", "2", "v" });//
                dT.Rows.Add(new Object[] { "2", "dochodzenia", "1", "2", "v" });//
                                                                                //wyznaczono
                dT.Rows.Add(new Object[] { "2", "na rozprawę <br/> (k.04)", "1", "2", "v" });//
                dT.Rows.Add(new Object[] { "2", "na posiedzenie <br/> (k.15)", "1", "2", "v" });//

                dT.Rows.Add(new Object[] { "2", "na rozprawę <br/> (k.04)", "1", "2", "v" });//
                dT.Rows.Add(new Object[] { "2", "na posiedzenie <br/> (k.15)", "1", "2", "v" });//

                dT.Rows.Add(new Object[] { "2", "na rozprawę <br/> (k.04)", "1", "2", "v" });//
                dT.Rows.Add(new Object[] { "2", "na posiedzenie <br/> (k.15)", "1", "2", "v" });//

                dT.Rows.Add(new Object[] { "2", "na rozprawę <br/> (k.04)", "1", "2", "v" });//
                dT.Rows.Add(new Object[] { "2", "na posiedzenie <br/> (k.15)", "1", "2", "v" });//

                dT.Rows.Add(new Object[] { "2", "na rozprawę <br/> (k.04)", "1", "2", "v" });//
                dT.Rows.Add(new Object[] { "2", "na posiedzenie <br/> (k.15)", "1", "2", "v" });//

                dT.Rows.Add(new Object[] { "2", "na rozprawę ", "1", "2", "v" });//
                dT.Rows.Add(new Object[] { "2", "na posiedzenie ", "1", "2", "v" });//

                dT.Rows.Add(new Object[] { "2", "na rozprawę ", "1", "2", "v" });//
                dT.Rows.Add(new Object[] { "2", "na posiedzenie ", "1", "2", "v" });//
                                                                                    //załatwiono

                dT.Rows.Add(new Object[] { "2", "na rozprawę <br/> (k.04)", "1", "2", "v" });//
                dT.Rows.Add(new Object[] { "2", "na posiedzenie <br/> (k.15)", "1", "2", "v" });//

                dT.Rows.Add(new Object[] { "2", "na rozprawę <br/> (k.04)", "1", "2", "v" });//
                dT.Rows.Add(new Object[] { "2", "na posiedzenie <br/> (k.15)", "1", "2", "v" });//

                dT.Rows.Add(new Object[] { "2", "na rozprawę <br/> (k.04)", "1", "2", "v" });//
                dT.Rows.Add(new Object[] { "2", "na posiedzenie <br/> (k.15)", "1", "2", "v" });//

                dT.Rows.Add(new Object[] { "2", "na rozprawę <br/> (k.04)", "1", "2", "v" });//
                dT.Rows.Add(new Object[] { "2", "na posiedzenie <br/> (k.15)", "1", "2", "v" });//

                dT.Rows.Add(new Object[] { "2", "na rozprawę <br/> (k.04)", "1", "2", "v" });//
                dT.Rows.Add(new Object[] { "2", "na posiedzenie <br/> (k.15)", "1", "2", "v" });//

                dT.Rows.Add(new Object[] { "2", "na rozprawę <br/> (k.04)", "1", "2", "v" });//
                dT.Rows.Add(new Object[] { "2", "na posiedzenie <br/> (k.15)", "1", "2", "v" });//

                dT.Rows.Add(new Object[] { "2", "na rozprawę <br/> (k.04)", "1", "2", "v" });//
                dT.Rows.Add(new Object[] { "2", "na posiedzenie <br/> (k.15)", "1", "2", "v" });//
                                                                                                //Załatwienia
                dT.Rows.Add(new Object[] { "2", "śledztwa", "1", "2", "v" });//
                dT.Rows.Add(new Object[] { "2", "dochodzenia", "1", "2", "v" });//
                                                                                //Sesje odbyte przez sędziego
                dT.Rows.Add(new Object[] { "2", "ogółem", "1", "2", "h" });//
                dT.Rows.Add(new Object[] { "2", "z tego", "2", "1", "h" });//

                dT.Rows.Add(new Object[] { "2", "ogółem (w.01)", "1", "2", "h" });//
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
                dT.Rows.Add(new Object[] { "2", "1 do 14 dni  (k.03)", "1", "2", "h" });//
                dT.Rows.Add(new Object[] { "2", "w tym nieusprawiedliwione (k.04)", "1", "2", "h" });//
                dT.Rows.Add(new Object[] { "2", "15 do 30 dni  (k.05)", "1", "2", "h" });//
                dT.Rows.Add(new Object[] { "2", "w tym nieusprawiedliwione (k.06)", "1", "2", "h" });//
                dT.Rows.Add(new Object[] { "2", "pow. 1 do 3 m-cy  (k.07)", "1", "2", "h" });//
                dT.Rows.Add(new Object[] { "2", "w tym nieusprawiedliwione (k.08)", "1", "2", "h" });//
                dT.Rows.Add(new Object[] { "2", "ponad 3 miesiące (k.09)", "1", "2", "h" });//
                dT.Rows.Add(new Object[] { "2", "w tym nieusprawiedliwione (k.10)", "1", "2", "h" });//
                                                                                                     //Liczba spraw, w których projekt uzasadnienia sporządził asystent** (Dz. 1.3) 
                dT.Rows.Add(new Object[] { "2", "razem k.13 w.01", "1", "2", "h" });//
                dT.Rows.Add(new Object[] { "2", "w tym, w których projekt został zaakceptowany przez sędziego (k.14. w.01)", "1", "2", "h" });//

                dT.Rows.Add(new Object[] { "2", "ogółem", "1", "2", "h" });//
                dT.Rows.Add(new Object[] { "2", "uwzględniono (k.03, w.01)", "1", "2", "h" });//


                dT.Rows.Add(new Object[] { "2", "na rozprawie", "1", "2", "h" });//
                dT.Rows.Add(new Object[] { "2", "na posiedzeniu", "1", "2", "h" });//

                // ================================    2     ============================
                //wpływ
                dT.Rows.Add(new Object[] { "3", "Ogółem (w.01)", "1", "3", "h" });//
                dT.Rows.Add(new Object[] { "3", "K <br/>(w.01)", "1", "3", "h" });//
                dT.Rows.Add(new Object[] { "3", "w tym postępowanie przygotowawcze zakończone w formie*", "2", "1", "h" });//
                dT.Rows.Add(new Object[] { "3", "W<br/> (w.78)", "1", "3", "h" });//
                dT.Rows.Add(new Object[] { "3", "Kop<br/> (w.80)", "1", "3", "h" });//
                dT.Rows.Add(new Object[] { "3", "Kp <br/>(w10)", "1", "3", "h" });//
                dT.Rows.Add(new Object[] { "3", "Ko karne <br/>(w36)", "1", "3", "h" });//
                dT.Rows.Add(new Object[] { "3", "Ko wykrocz <br/>(w.59)", "1", "3", "h" });//
                                                                                           //wyznaczono
                dT.Rows.Add(new Object[] { "3", "Ogółem <br/> (w.01)", "2", "1", "h" });//
                dT.Rows.Add(new Object[] { "3", "K <br/> (w.02)", "2", "1", "h" });//
                dT.Rows.Add(new Object[] { "3", "W <br/> (w.06)", "2", "1", "h" });//
                dT.Rows.Add(new Object[] { "3", "Kop <br/> (w.07)", "2", "1", "h" });//
                dT.Rows.Add(new Object[] { "3", "Kp <br/> (w.07)", "2", "1", "h" });//
                dT.Rows.Add(new Object[] { "3", "Ko<br/> karne", "2", "1", "h" });//
                dT.Rows.Add(new Object[] { "3", "Ko <br/>wykrocz", "2", "1", "h" });//
                                                                                    //Załatwiono
                dT.Rows.Add(new Object[] { "3", "Ogółem <br/> (w.01)", "2", "1", "h" });//
                dT.Rows.Add(new Object[] { "3", "K <br/> (w.02)", "2", "1", "h" });//
                dT.Rows.Add(new Object[] { "3", "W <br/> (w.30)", "2", "1", "h" });//
                dT.Rows.Add(new Object[] { "3", "Kop <br/> (w.31)", "2", "1", "h" });//
                dT.Rows.Add(new Object[] { "3", "Kp <br/> (w.26)", "2", "1", "h" });//
                dT.Rows.Add(new Object[] { "3", "Ko karne <br/> (w 28)", "2", "1", "h" });//
                dT.Rows.Add(new Object[] { "3", "Ko wykrocz <br/> (w29)", "2", "1", "h" });//
                                                                                           //Załatwienia
                dT.Rows.Add(new Object[] { "3", "Ogółem <br/> (w.01)", "1", "3", "h" });//
                dT.Rows.Add(new Object[] { "3", "K <br/> (w.03)", "1", "3", "h" });//
                dT.Rows.Add(new Object[] { "3", "w tym postępowanie przygotowawcze zakończone w formie*", "2", "1", "h" });//
                dT.Rows.Add(new Object[] { "3", "W <br/> (w.30)", "1", "3", "h" });//
                dT.Rows.Add(new Object[] { "3", "Kop <br/> (w.31)", "1", "3", "h" });//
                dT.Rows.Add(new Object[] { "3", "Kp <br/> (w.26)", "1", "3", "h" });//
                dT.Rows.Add(new Object[] { "3", "Ko karne <br/> (w 28)", "1", "3", "h" });//
                dT.Rows.Add(new Object[] { "3", "Ko wykrocz <br/> (w29)", "1", "3", "h" });//
                                                                                           //Sesje odbyte przez sędziego
                dT.Rows.Add(new Object[] { "3", "Wszystkie sesje sędziego w wydziale", "3", "1", "h" });//
                dT.Rows.Add(new Object[] { "3", "Na potrzeby MS-s (Dz.1.2.2.k.01)", "3", "1", "h" });//
                                                                                                     //POZOSTAŁOŚC na następny miesiąc (Dz.1.1.k.04)"
                dT.Rows.Add(new Object[] { "3", "Ogółem (w.01)", "1", "3", "h" });//
                dT.Rows.Add(new Object[] { "3", "K (w.03)", "1", "3", "h" });//
                dT.Rows.Add(new Object[] { "3", "W (w.78)", "1", "3", "h" });//
                dT.Rows.Add(new Object[] { "3", "Kop (w.80)", "1", "3", "h" });//
                dT.Rows.Add(new Object[] { "3", "Kp (w.10)", "1", "3", "h" });//
                dT.Rows.Add(new Object[] { "3", "Ko karne (w.36)", "1", "3", "h" });//
                dT.Rows.Add(new Object[] { "3", "Ko wykrocz (w.59)", "1", "3", "h" });//
                                                                                      //Pozostało spraw starych (Dz.2.1.1. w.01+08+09+10)"
                dT.Rows.Add(new Object[] { "3", "Ogółem (k.01)", "1", "3", "h" });//
                dT.Rows.Add(new Object[] { "3", "do 3 m-cy (k.02)", "1", "3", "h" });//
                dT.Rows.Add(new Object[] { "3", "pow.3 do 6 m-cy  (k.04)", "1", "3", "h" });//
                dT.Rows.Add(new Object[] { "3", "pow.6 do 12 m-cy  (k.04)", "1", "3", "h" });//
                dT.Rows.Add(new Object[] { "3", "pow. 12 m-cy do 3 lat", "1", "3", "h" });//
                dT.Rows.Add(new Object[] { "3", "pow. 12 m-cy do 2 lat (k.07)", "1", "3", "h" });//
                dT.Rows.Add(new Object[] { "3", "pow. 2 do 3 lat (k.08)", "1", "3", "h" });//
                dT.Rows.Add(new Object[] { "3", "pow. 3 do 5 lat (k.09)", "1", "3", "h" });//
                dT.Rows.Add(new Object[] { "3", "pow. 5 do 8 lat (k.10)", "1", "3", "h" });//
                dT.Rows.Add(new Object[] { "3", "pow. 8 lat (k.11)", "1", "3", "h" });//


                dT.Rows.Add(new Object[] { "3", "Łącznie (k.01)", "1", "3", "h" });//
                dT.Rows.Add(new Object[] { "3", "W terminie ustawowym 14 dni (k.02)", "1", "3", "h" });//
                dT.Rows.Add(new Object[] { "3", "Razem po terminie ustawowym ", "1", "3", "h" });//
                dT.Rows.Add(new Object[] { "3", "Nieusprawiedliwionych", "1", "3", "h" });//

                dT.Rows.Add(new Object[] { "3", "Po upływie terminu ustawowego", "8", "1", "h" });//
                                                                                                  //"Skargi na przewlekłość (Dz. 7.1)"
                dT.Rows.Add(new Object[] { "3", "wpływ (k.01 w.01)", "1", "3", "h" });//
                dT.Rows.Add(new Object[] { "3", "załatwiono", "2", "1", "h" });//
                dT.Rows.Add(new Object[] { "3", "pozostało (k.03 w.01)", "1", "3", "h" });//
                                                                                          //"Stan spraw zawiszonych"
                dT.Rows.Add(new Object[] { "3", "ogólem", "1", "3", "h" });//
                dT.Rows.Add(new Object[] { "3", "zakreślonych (2.1.2. k.01 w.01+07+08+09)", "1", "3", "h" });//
                dT.Rows.Add(new Object[] { "3", "niezakreślonych (Dz. 2.1.1.a.1 k.01 w.01+07+08+09)", "1", "3", "h" });//

                // ================================   3     ============================
                dT.Rows.Add(new Object[] { "4", "L.p.", "1", "4", "h" });//
                dT.Rows.Add(new Object[] { "4", "Funkcja", "1", "4", "h" });//
                dT.Rows.Add(new Object[] { "4", "Stanowisko", "1", "4", "h" });
                dT.Rows.Add(new Object[] { "4", "Imię i Nazwisko sędziego", "1", "4", "h" });//
                dT.Rows.Add(new Object[] { "4", "WPŁYW (Dz. 1.1.k.02) ", "9", "1", "h" });//
                dT.Rows.Add(new Object[] { "4", "Wyznaczono (Dz. 1.2.1) ", "14", "1", "h" });//
                dT.Rows.Add(new Object[] { "4", "Załatwiono (Dz. 1.2.2) ", "14", "1", "h" });//
                dT.Rows.Add(new Object[] { "4", "Załatwienia (Dz. 1.1.k03) ", "9", "1", "h" });//
                dT.Rows.Add(new Object[] { "4", "Sesje odbyte przez sędziego", "6", "1", "h" });//
                dT.Rows.Add(new Object[] { "4", "Liczba odroczonych <br/> publikacji orzeczeń", "3", "2", "h" });//
                dT.Rows.Add(new Object[] { "4", "Liczba odroczonych <br/> spraw", "3", "2", "h" });//
                dT.Rows.Add(new Object[] { "4", "POZOSTAŁOŚC na następny miesiąc (Dz.1.1.k.04)", "7", "1", "h" });//
                dT.Rows.Add(new Object[] { "4", "Pozostało spraw starych (Dz.2.1.1. w.01+08+09+10)", "10", "1", "h" });//
                dT.Rows.Add(new Object[] { "4", "Liczba sporządzonych uzasadnień (Dz.1.3. w.01)", "12", "1", "h" });//
                dT.Rows.Add(new Object[] { "4", "Uzasadnienia wygłoszone (Dz. 1.3 k.11 w.01) ", "1", "4", "h" });//
                dT.Rows.Add(new Object[] { "4", "Liczba spraw do których wpłynął wniosek o transkrypcję uzasadnien wygłoszone (Dz. 1.3 k.12 w.01) ", "1", "4", "h" });//
                dT.Rows.Add(new Object[] { "4", "Liczba spraw, w których projekt uzasadnienia sporządził asystent** (Dz. 1.3) ", "2", "2", "h" });//
                dT.Rows.Add(new Object[] { "4", "Skargi na przewlekłość (Dz. 7.1)", "4", "1", "h" });//
                dT.Rows.Add(new Object[] { "4", "Stan spraw zawieszonych", "3", "1", "h" });//
                dT.Rows.Add(new Object[] { "4", "Uwagi", "1", "4", "h" });//
                dT.Rows.Add(new Object[] { "4", "Kolumna kontrolna (wyznaczenia>=załatwienia)", "2", "2", "h" });//

                //wywołanie
                makeHeader(sn, dT, GridView1);


                // dolny
                GridView HeaderGrid = (GridView)sender;
                GridViewRow HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);


                HeaderGridRow.Font.Size = 7;
                HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
                HeaderGridRow.VerticalAlign = VerticalAlign.Top;
                HeaderGridRow.BackColor = System.Drawing.Color.Gray;
                TableCell HeaderCell = new TableCell();



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


        protected void Button3_Click(object sender, EventArgs e)
        {
            string path = Server.MapPath("Template") + "\\oopk.xlsx";
            FileInfo existingFile = new FileInfo(path);
            //string download = Environment.GetEnvironmentVariable("USERPROFILE") + @"\" + "Downloads"+@"\RaportCywilny";

            string download = Server.MapPath("Template") + @"\oopk";

            FileInfo fNewFile = new FileInfo(download + "_.xlsx");

            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                ExcelWorksheet MyWorksheet = MyExcel.Workbook.Worksheets[1];

                DataView view = (DataView)statystyki.Select(DataSourceSelectArguments.Empty);

                DataTable table = view.ToTable();
                table.Columns.Remove("ident");
                table.Columns.Remove("id_sedziego");
                table.Columns.Remove("stanowisko");
                table.Columns.Remove("funkcja");


                MyWorksheet.Cells[1, 4].Value = "Ruch spraw w referatach sędziów za okres od " + Date1.Text + " do " + Date2.Text;
                
                robArkusz(MyExcel, 1, view, 6, 106);


                try
                {
                    MyExcel.SaveAs(fNewFile);

                    this.Response.Clear();
                    this.Response.ContentType = "application/vnd.ms-excel";
                    this.Response.AddHeader("Content-Disposition", "attachment;filename=" + fNewFile.Name);
                    this.Response.WriteFile(fNewFile.FullName);
                    this.Response.End();

                }
                catch 
                {
                    //  Label31.Text = Label31.Text + "Save Error massage " + ex.Message + "<br/>";
                }


               
            }
            przemiel();
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
            manageCells(MyWorksheet8, rowik + rowikPlus, 2, "Razem");

            try
            {
                for (int i = 1; i < ilKolumn - 2; i++)
                {
                    object sumObject;
                    string txt = "d_";
                    string digit = i.ToString("D2");
                    txt = txt + digit;
                    sumObject = table7.Compute("Sum(" + txt + ")", "");
                    manageCells(MyWorksheet8, rowik + rowikPlus, i + 2, sumObject.ToString());
                }
            }
            catch 
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
            //make footer


            if (e.Row.RowType == DataControlRowType.Footer)

            {
                e.Row.Cells[3].Text = "Razem";

                //e.Row.Cells[3].Text = "Total: " + _totalUnitsOnOrder.ToString();
                DataView view = (DataView)statystyki.Select(DataSourceSelectArguments.Empty);

                DataTable table = view.ToTable();
                object sumObject;

                for (int i = 1; i < 94; i++)
                {
                    string txt = "d_";
                    string digit = i.ToString("D2");
                    txt = txt + digit;
                    sumObject = table.Compute("Sum(" + txt + ")", "");
                    e.Row.Cells[3 + i].Text = sumObject.ToString();
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}