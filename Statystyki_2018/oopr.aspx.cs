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
        public const string tenPlik = "oopr.aspx";
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


        protected void grvMergeHeader_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {

                // dolny
                GridView HeaderGrid = (GridView)sender;
                GridViewRow HeaderGridRow = new GridViewRow(0, 1, DataControlRowType.Header, DataControlRowState.Insert);


                HeaderGridRow.Font.Size = 7;
                HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
                HeaderGridRow.VerticalAlign = VerticalAlign.Top;
                HeaderGridRow.BackColor = System.Drawing.Color.LightGray;
                TableCell HeaderCell = new TableCell();


                //czwarty
                HeaderCell = new TableCell();
                HeaderCell.Text = "usprawiedliwiono";

                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "nie usprawiedliwiono";

                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "usprawiedliwiono";

                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "nie usprawiedliwiono";

                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "usprawiedliwiono";

                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "nie usprawiedliwiono";

                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                HeaderGrid = (GridView)sender;
                HeaderGridRow = new GridViewRow(0, 1, DataControlRowType.Header, DataControlRowState.Insert);
                HeaderGridRow.Font.Size = 7;
                HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
                HeaderGridRow.VerticalAlign = VerticalAlign.Top;
                HeaderGridRow.Font.Size = 7;
                HeaderGridRow.BackColor = System.Drawing.Color.LightGray;
                HeaderGridRow.VerticalAlign = VerticalAlign.Top;

                Style stl = new Style();
                stl.CssClass = "verticaltext";

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

                //=================
                HeaderCell = new TableCell();
                HeaderCell.Text = "rozprawy";

                HeaderCell.ApplyStyle(stl);
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();

                HeaderCell.Text = "posiedzenia";
                HeaderCell.ApplyStyle(stl);
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

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
                HeaderCell.Text = "na rozprawie";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 2;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "na posiedzeniu";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 2;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                //===================================================================================================================================================================
                //===================================================================================================================================================================
                //Środkowy
                //===================================================================================================================================================================
                //===================================================================================================================================================================
                //HeaderGrid = (GridView)sender;
                HeaderGridRow = new GridViewRow(0, 1, DataControlRowType.Header, DataControlRowState.Insert);
                HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
                HeaderGridRow.VerticalAlign = VerticalAlign.Top;
                HeaderGridRow.Font.Size = 7;
                HeaderGridRow.BackColor = System.Drawing.Color.LightGray;
                HeaderGridRow.VerticalAlign = VerticalAlign.Top;


                HeaderCell = new TableCell();
                HeaderCell.Text = "Ogółem MS-S16 <br/> + <br/> MS-S18";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Ogółem MS-16";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = " RC ";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "RNs";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Rsm";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "RCo";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Nmo";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "RCsp";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Ogółem MS-18";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                HeaderCell = new TableCell();
                HeaderCell.Text = "Nkd";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                //Wyznaczono
                HeaderCell = new TableCell();
                HeaderCell.Text = "Ogółem <br> MS-S16-S18";
                HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Ogółem -S16 ";
                HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = " RC ";
                HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "RNs";
                HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Nsm";
                HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "RCo";
                HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Nmo";
                HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                HeaderCell = new TableCell();
                HeaderCell.Text = "RCps";
                HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Ogółem <br>MS-S18";
                HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Nkd";
                HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                // Załatwiono

                HeaderCell = new TableCell();
                HeaderCell.Text = "Ogółem <br>MS-S16+MS-S18";
                HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Ogółem MS-16";
                HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "RC";
                HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "RNs";
                HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Nsm";
                HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "RCo";
                HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Nmo";
                HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "RCps";
                HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Ogółem <br> MS-S18";
                HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Nkd";
                HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                //ZAŁATWIENIA

                HeaderCell = new TableCell();
                HeaderCell.Text = "Ogółem<br/>MS-S16<br/>+<br/>MS-S18";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);



                HeaderCell = new TableCell();
                HeaderCell.Text = "Ogółem<br/>MS-S16";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);



                HeaderCell = new TableCell();
                HeaderCell.Text = "RC";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                HeaderCell = new TableCell();
                HeaderCell.Text = "RNs";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                HeaderCell = new TableCell();
                HeaderCell.Text = "Nsm ";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                HeaderCell = new TableCell();
                HeaderCell.Text = "RCo";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                HeaderCell = new TableCell();
                HeaderCell.Text = "Nmo";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                HeaderCell = new TableCell();
                HeaderCell.Text = "RCps";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Ogółem<br/>MS-S18";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Nkd";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                //hhhhh
                // odbyte sesje
                HeaderCell = new TableCell();
                HeaderCell.Text = "Ogółem";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "z tego";
                HeaderCell.ColumnSpan = 2;
                HeaderCell.RowSpan = 1;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                ///

                HeaderCell = new TableCell();
                HeaderCell.Text = "ogółem (wszystkie kategorie spraw)";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;
                HeaderCell.BackColor = System.Drawing.Color.LightGray;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = " RC ";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;
                HeaderCell.BackColor = System.Drawing.Color.LightGray;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "RNs";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Nsm";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Nkd";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                //======== liczba odroczonych spraw
                HeaderCell = new TableCell();
                HeaderCell.ApplyStyle(stl);
                HeaderCell.Text = "z<br/> terminem";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.ApplyStyle(stl);
                HeaderCell.Text = "bez wyznaczonego<br/> terminu";
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
                HeaderCell.Text = "Ogółem<br/>MS-S16<br/>+<br/>MS-S18";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);



                HeaderCell = new TableCell();
                HeaderCell.Text = " Ogółem<br/>MS-S16 ";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);



                HeaderCell = new TableCell();
                HeaderCell.Text = " RC ";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                HeaderCell = new TableCell();
                HeaderCell.Text = "RNs";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                HeaderCell = new TableCell();
                HeaderCell.Text = "Nsm ";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                HeaderCell = new TableCell();
                HeaderCell.Text = "RCo";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                HeaderCell = new TableCell();
                HeaderCell.Text = "Nmo";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;
                HeaderCell.BackColor = System.Drawing.Color.LightGray;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "RCps";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                HeaderCell = new TableCell();
                HeaderCell.Text = "Ogółem<br/> MS-S18";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Nkd";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                // pozostało spraw starych
                HeaderCell = new TableCell();
                HeaderCell.Text = "ogółem";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                HeaderCell = new TableCell();

                HeaderCell = new TableCell();
                HeaderCell.Text = "do 3 m-cy";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                HeaderCell = new TableCell();

                HeaderCell.Text = "pow. 3 do 6 m-cy";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                HeaderCell = new TableCell();
                HeaderCell.Text = "pow. 6 do 12 m-cy";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                HeaderCell = new TableCell();
                HeaderCell.Text = "pow. 12 do 2 lat";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "pow. 2 do 3 lat";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "pow. 3 do 5 lat";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                HeaderCell = new TableCell();
                HeaderCell.Text = "pow. 5 do 8 lat";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                HeaderCell = new TableCell();
                HeaderCell.Text = "pow 8 lat";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;

                HeaderGridRow.Cells.Add(HeaderCell);


                //liczba sporządzonych uzasadnień
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                HeaderCell = new TableCell();
                HeaderCell.Text = "łacznie";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                HeaderCell = new TableCell();
                HeaderCell.Text = "w terminie ustawowym 14 dni";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                HeaderCell = new TableCell();
                HeaderCell.Text = "razem po terminie ustawowym";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                HeaderCell = new TableCell();

                HeaderCell.Text = "usprawiedliwionych";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                HeaderCell = new TableCell();
                HeaderCell.Text = " nie usprawiedliwionych";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                HeaderCell = new TableCell();
                HeaderCell.Text = " nie usprawiedliwionych";
                HeaderCell.ColumnSpan = 6;
                HeaderCell.RowSpan = 1;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                HeaderCell = new TableCell();
                HeaderCell.Text = " ogółem";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                HeaderCell = new TableCell();
                HeaderCell.Text = "w tym w których wpłynął wniosek o transkrypcję";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                HeaderCell = new TableCell();
                HeaderCell.Text = "wpływ";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                HeaderCell = new TableCell();
                HeaderCell.Text = "załatwiono";
                HeaderCell.ColumnSpan = 2;
                HeaderCell.RowSpan = 1;

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

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
                HeaderCell = new TableCell();
                HeaderCell.Text = "ogółem";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 3;
                HeaderCell.BackColor = System.Drawing.Color.LightGray;
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
                HeaderGridRow = new GridViewRow(0, 1, DataControlRowType.Header, DataControlRowState.Insert);
                HeaderGridRow.Font.Size = 10;
                HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
                HeaderGridRow.VerticalAlign = VerticalAlign.Top;
                HeaderGridRow.BackColor = System.Drawing.Color.LightGray;

                HeaderCell = new TableCell();
                HeaderCell.Text = "L.p.";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 4;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Funkcja";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 4;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Stanowisko";
                HeaderCell.RowSpan = 4;
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);

                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Imię i nazwisko";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 4;
                HeaderGridRow.Cells.Add(HeaderCell);

                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "WPŁYW";
                HeaderCell.ColumnSpan = 10;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);

                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                HeaderCell = new TableCell();
                HeaderCell.Text = "<span class='page-break'>Wyznaczono</span>";
                HeaderCell.ColumnSpan = 20;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);

                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Załatwiono";
                HeaderCell.ColumnSpan = 20;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);

                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Załatwienia";
                HeaderCell.ColumnSpan = 10;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);

                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Sesje odbyte";
                HeaderCell.ColumnSpan = 3;

                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                HeaderCell = new TableCell();
                HeaderCell.Text = "<b>Liczba dni,w<br/>których odbyły<br/>się sesje<br>wyjazdowe<br/></b>(podajemy<br/>niezależnie - dla<br/>potrzeb <br/> informacyjnych";
                HeaderCell.ColumnSpan = 1;

                HeaderCell.RowSpan = 4;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "<b>Liczba wokand<br/>wykonawczych<br/>wykazana w MS-S18";
                HeaderCell.ColumnSpan = 1;

                HeaderCell.RowSpan = 4;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);



                HeaderCell = new TableCell();
                HeaderCell.Text = "Liczba odroczonych publikacji wyroków/postanowień";
                HeaderCell.ColumnSpan = 5;
                HeaderCell.RowSpan = 1;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Liczba odroczonych spraw";
                HeaderCell.ColumnSpan = 3;
                HeaderCell.RowSpan = 1;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "POZOSTAŁOŚĆ na następny m-c";
                HeaderCell.ColumnSpan = 10;
                HeaderCell.RowSpan = 1;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                HeaderCell = new TableCell();
                HeaderCell.Text = "pozostało spraw starych";
                HeaderCell.ColumnSpan = 9;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);

                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                HeaderCell = new TableCell();
                HeaderCell.Text = "liczba sporządzonych uzasadnień";
                HeaderCell.ColumnSpan = 11;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);

                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                HeaderCell = new TableCell();
                HeaderCell.Text = "Uzasadnienia wygłoszone*";
                HeaderCell.ColumnSpan = 2;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);

                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                HeaderCell = new TableCell();
                HeaderCell.Text = "Skargi na przewlekłość";

                HeaderCell.ColumnSpan = 3;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Mediacje";

                HeaderCell.ColumnSpan = 3;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Stan spraw zawieszonych";

                HeaderCell.ColumnSpan = 3;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "UWAGI";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 4;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Kolumna kontrolna (wyznaczenia>=załatwień)";
                HeaderCell.ColumnSpan = 2;
                HeaderCell.RowSpan = 2;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
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
            try
            {
                File.Delete(fNewFile.FullName);
            }
            catch (Exception ex)
            {
                //      Label31.Text = "Delete error massage: " + ex.Message + "<br/>";       
            }
            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                ExcelWorksheet MyWorksheet = MyExcel.Workbook.Worksheets[1];

                DataView view = (DataView)statystyki.Select(DataSourceSelectArguments.Empty);
                tabele tb = new tabele();
                DataTable table = view.ToTable();
                tb.tworzArkuszwExcle(MyWorksheet, table, 120, 0, 7, true, false, false, false, true);
              
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
                e.Row.Cells[3].Text = "Razem";


                DataView view = (DataView)statystyki.Select(DataSourceSelectArguments.Empty);

                DataTable table = view.ToTable();
                object sumObject;
                for (int i = 1; i < 118; i++)
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