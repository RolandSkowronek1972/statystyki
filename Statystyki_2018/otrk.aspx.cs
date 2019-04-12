using NPOI.HPSF;
using NPOI.HSSF.UserModel;
using NPOI.SS.UserModel;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace stat2018
{
    

    public partial class otrk : System.Web.UI.Page
    {
        private const string tenPlik = "otrk.aspx";
        public Class1 cl = new Class1();
        private HSSFWorkbook hssfworkbook;
        public common cm = new common();

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
            CultureInfo newCulture = (CultureInfo)CultureInfo.CurrentCulture.Clone();
            newCulture.DateTimeFormat = CultureInfo.GetCultureInfo("PL").DateTimeFormat;
            System.Threading.Thread.CurrentThread.CurrentCulture = newCulture;
            System.Threading.Thread.CurrentThread.CurrentUICulture = newCulture;
            DateTime dTime = DateTime.Now.AddMonths(-1); ;

            if (Date1.Text.Length == 0) Date1.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-01");
            if (Date2.Text.Length == 0) Date2.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-" + DateTime.DaysInMonth(dTime.Year, dTime.Month).ToString("D2"));
            Session["data_1"] = Date1.Date.Year.ToString() + "-" + Date1.Date.Month.ToString("D2") + "-" + Date1.Date.Day.ToString("D2");
            cm.log.Info(tenPlik + ": data początku okresy statystycznego w sesji dla popupów " + (string)Session["data_1"]);
            Session["data_2"] = Date2.Date.Year.ToString() + "-" + Date2.Date.Month.ToString("D2") + "-" + Date2.Date.Day.ToString("D2");
            cm.log.Info(tenPlik + ": data początku okresy statystycznego w sesji dla popupów " + (string)Session["data_"]);
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
        
            string yyx = (string)Session["id_dzialu"];
            id_dzialu.Text = (string)Session["txt_dzialu"];
            string txt = string.Empty; 
            txt = txt + cl.clear_maim_db();
            txt = txt + cl.generuj_dane_do_tabeli_wierszy(Date1.Date, Date2.Date, yyx, 1);
            GridView2.DataBind();

            try
            {
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 2, Date1.Date, Date2.Date);

                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 3, Date1.Date, Date2.Date);

                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 4, Date1.Date, Date2.Date);

                txt = txt + cl.uzupelnij_statusy();
            }
            catch
            {
            }
            // dopasowanie opisów

            makeLabels();

            GridView3.DataBind();
            Label11.Visible = cl.debug(int.Parse(yyx));
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

                Label29.Text = DateTime.Now.ToLongDateString();
                id_dzialu.Text = (string)Session["txt_dzialu"];
                Label28.Text = cl.podajUzytkownika(User_id, domain);
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
                    Label17.Text = "Wyznaczenia za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //Stan referatów sędziów na koniec miesiąca
                    Label15.Text = "Stan referatów sędziów na koniec miesiąca " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //Informacje o ruchu sprawa za miesiąc: 
                    Label5.Text = "Informacje o ruchu sprawa za miesiąc:  " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    Label27.Text = "za miesiąc:  " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                }
                else
                {
                    Label19.Text = "Załatwienia za okres od " + Date1.Text + " do  " + Date2.Text;
                    Label17.Text = "Wyznaczenia za okres od" + Date1.Text + " do  " + Date2.Text;
                    Label15.Text = "Stan referatów sędziów za okres od " + Date1.Text + " do  " + Date2.Text;
                    Label5.Text = "Informacje o ruchu sprawa za okres od:  " + Date1.Text + " do  " + Date2.Text;
                    Label27.Text = "za okres od:  " + Date1.Text + " do  " + Date2.Text;

                }
            }
            catch
            {

            }

        }

        #region "nagłowki tabel"

        protected void GridView2_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                // najnizszy
                GridView HeaderGrid = (GridView)sender;
                GridViewRow HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
                HeaderGridRow.Font.Size = 7;
                HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
                HeaderGridRow.VerticalAlign = VerticalAlign.Top;

                TableCell HeaderCell = new TableCell();

                HeaderCell = new TableCell();

                HeaderCell.Text = "K";

                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Kp";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);

                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "KO";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "W";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Kop";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Łacznie";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow);

                ////  drugi wiersz

                //W tym      nieusprawiedliwione

                HeaderGrid = (GridView)sender;
                HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
                HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
                HeaderGridRow.VerticalAlign = VerticalAlign.Top;
                HeaderGridRow.Font.Size = 10;
                HeaderCell = new TableCell();

                HeaderCell.Text = "Ruch spraw";
                HeaderCell.RowSpan = 2;
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Sprawy według repetoriów i wykazów";
                HeaderCell.ColumnSpan = 7;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow);
            }
        }

        protected void grvMergeHeader_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                GridView HeaderGrid = (GridView)sender;
                GridViewRow HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
                HeaderGridRow.Font.Size = 7;
                HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
                HeaderGridRow.VerticalAlign = VerticalAlign.Top;
                TableCell HeaderCell = new TableCell();

                HeaderCell = new TableCell();
                HeaderCell.Text = "rozprawy";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "posiedzenia";
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
                HeaderCell.Text = "Kp";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Ko";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "W";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Kop";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);


                HeaderCell = new TableCell();
                HeaderCell.Text = "Razem";
                HeaderCell.ColumnSpan = 1;

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Urolopy";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Zwolnienia";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                ////  drugi wiersz

                HeaderGrid = (GridView)sender;
                HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
                HeaderGridRow.Font.Size = 7;
                HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
                HeaderGridRow.VerticalAlign = VerticalAlign.Top;

                HeaderCell = new TableCell();
                HeaderCell.Text = "L.p.";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Funkcja";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Stanowisko";
                HeaderCell.RowSpan = 2;
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Imię i nazwisko";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Liczba sesji";
                HeaderCell.ColumnSpan = 2;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Załatwienia";
                HeaderCell.ColumnSpan = 6;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Il. sporządzonych uzasadnień";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Nieobecności";
                HeaderCell.ColumnSpan = 2;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

            }
        }

        protected void GridView3_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                GridView HeaderGrid = (GridView)sender;
                GridViewRow HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
                HeaderGridRow.Font.Size = 7;
                HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
                HeaderGridRow.VerticalAlign = VerticalAlign.Top;
                TableCell HeaderCell = new TableCell();

                HeaderCell = new TableCell();
                HeaderCell.Text = "K";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView3.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Kp";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView3.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Ko";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView3.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "W";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView3.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Kop";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView3.Controls[0].Controls.AddAt(0, HeaderGridRow);



                HeaderCell = new TableCell();
                HeaderCell.Text = "Razem";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView3.Controls[0].Controls.AddAt(0, HeaderGridRow);

                ////  drugi wiersz

                HeaderGrid = (GridView)sender;
                HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
                HeaderGridRow.Font.Size = 7;
                HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
                HeaderGridRow.VerticalAlign = VerticalAlign.Top;

                HeaderCell = new TableCell();
                HeaderCell.Text = "L.p.";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView3.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Funkcja";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView3.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Stanowisko";
                HeaderCell.RowSpan = 2;
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView3.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Imię i nazwisko";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView3.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Wyznaczenia";
                HeaderCell.ColumnSpan = 6;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView3.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Odroczenia liczba spraw odroczonych";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView3.Controls[0].Controls.AddAt(0, HeaderGridRow);
            }
        }

        protected void GridView4_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                GridView HeaderGrid = (GridView)sender;
                GridViewRow HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
                HeaderGridRow.Font.Size = 7;
                HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
                HeaderGridRow.VerticalAlign = VerticalAlign.Top;
                TableCell HeaderCell = new TableCell();

                HeaderCell = new TableCell();
                HeaderCell.Text = "K";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView4.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Kp";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView4.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Ko";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView4.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "W";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView4.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Kop";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView4.Controls[0].Controls.AddAt(0, HeaderGridRow);


                HeaderCell = new TableCell();
                HeaderCell.Text = "Razem";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView4.Controls[0].Controls.AddAt(0, HeaderGridRow);

                ////  drugi wiersz

                HeaderGrid = (GridView)sender;
                HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
                HeaderGridRow.Font.Size = 7;
                HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
                HeaderGridRow.VerticalAlign = VerticalAlign.Top;

                HeaderCell = new TableCell();
                HeaderCell.Text = "L.p.";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView4.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Funkcja";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView4.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Stanowisko";
                HeaderCell.RowSpan = 2;
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView4.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Imię i nazwisko";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.RowSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView4.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Pozostało w referatach spraw kategorii";
                HeaderCell.ColumnSpan = 13;
                HeaderCell.RowSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView4.Controls[0].Controls.AddAt(0, HeaderGridRow);
            }
        }

        #endregion "nagłowki tabel"

        #region "obsługa oncommand  tabel z nazwiskami"

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {


        }


        #endregion "obsługa oncommand  tabel z nazwiskami"


        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["date_1"] = Date1.Text.Trim();
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "print", "window.open('raport_01_print.aspx', '')", true);
        }

        protected void Button3_Click(object sender, EventArgs e)
        {

            // execel begin
            string filename = "StatystykiWydzialRodzinny.xls";
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", string.Format("attachment;filename={0}", filename));

            Response.Clear();

            InitializeWorkbook();
            generate_my_data();
            Response.BinaryWrite(WriteToStream().GetBuffer());

            Response.End();
        }




        private void InitializeWorkbook()
        {
            hssfworkbook = new HSSFWorkbook();

            SummaryInformation si = PropertySetFactory.CreateSummaryInformation();
            si.Subject = "";
            si.Title = "statystyki";
            hssfworkbook.SummaryInformation = si;
        }



        private MemoryStream WriteToStream()
        {
            //Write the stream data of workbook to the root directory
            MemoryStream file = new MemoryStream();

            hssfworkbook.Write(file);
            return file;
        }

        private void generate_my_data()
        {
            DataView view = (DataView)dane_do_tabeli_1.Select(DataSourceSelectArguments.Empty);

            DataTable table = view.ToTable();

            ISheet sheet0 = hssfworkbook.CreateSheet("Ruch spraw");

            IRow row0 = sheet0.CreateRow(0);
            table.TableName = "Załatwienia";
            table.Columns.Remove("id_");

            row0.CreateCell(0).SetCellValue("Opis");
            row0.CreateCell(1).SetCellValue("Sprawy według repetoriów i wykazów");

            var crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 0, 0);
            sheet0.AddMergedRegion(crs);
            crs = new NPOI.SS.Util.CellRangeAddress(0, 0, 1, 8);
            sheet0.AddMergedRegion(crs);





            row0 = sheet0.CreateRow(1);

            row0.CreateCell(1).SetCellValue("K");
            row0.CreateCell(2).SetCellValue("Kp");
            row0.CreateCell(3).SetCellValue("Ko");
            row0.CreateCell(4).SetCellValue("W");
            row0.CreateCell(5).SetCellValue("Kop");
            row0.CreateCell(6).SetCellValue("Łącznie");

            int rol = 2;
            foreach (DataRow rowik in table.Rows)
            {
                row0 = sheet0.CreateRow(rol);
                for (int i = 0; i < 9; i++)
                {
                    try
                    {
                        int ji = int.Parse(rowik[i].ToString().Trim());
                        ICellStyle cellStyle = hssfworkbook.CreateCellStyle();
                        cellStyle.DataFormat = HSSFDataFormat.GetBuiltinFormat("0");
                        row0.CreateCell(i).SetCellValue(ji);
                        row0.Cells[i].CellStyle = cellStyle;
                    }
                    catch (Exception)
                    {
                        row0.CreateCell(i).SetCellValue(rowik[i].ToString().Trim());
                    }
                }
                rol++;
            }// end foreach

            // druga tabela
            view = (DataView)statystyki.Select(DataSourceSelectArguments.Empty);

            table = view.ToTable();

            table = view.ToTable();
            table.TableName = "Załatwienia";
            table.Columns.Remove("ident");
            table.Columns.Remove("sesja");
            table.Columns.Remove("id_sedziego");
            table.Columns.Remove("id_tabeli");
            table.Columns.Remove("id_dzialu");
            table.Columns.Remove("d_12");
            table.Columns.Remove("d_13");
            table.Columns.Remove("d_14");
            table.Columns.Remove("d_15");
            table.Columns.Remove("d_16");
            table.Columns.Remove("d_17");
            table.Columns.Remove("d_18");
            table.Columns.Remove("d_19");
            table.Columns.Remove("d_20");
            table.Columns.Remove("d_21");
            table.Columns.Remove("d_22");
            //
            //robienie
            int ro = 2;

            //-----------------

            IDataFormat format = hssfworkbook.CreateDataFormat();

            //-----------------

            ISheet sheet1 = hssfworkbook.CreateSheet("Załatwienia");

            IRow row2 = sheet1.CreateRow(0);
            row2.CreateCell(0).SetCellValue("L.p.");
            row2.CreateCell(1).SetCellValue("Nazwisko");
            row2.CreateCell(2).SetCellValue("Imię");
            row2.CreateCell(3).SetCellValue("Funkcja");
            row2.CreateCell(4).SetCellValue("Stanowisko");
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 0, 0);
            sheet1.AddMergedRegion(crs);
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 1, 1);
            sheet1.AddMergedRegion(crs);
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 2, 2);
            sheet1.AddMergedRegion(crs);
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 3, 3);
            sheet1.AddMergedRegion(crs);
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 4, 4);
            sheet1.AddMergedRegion(crs);
            row2.CreateCell(5).SetCellValue("Liczba sesji");
            crs = new NPOI.SS.Util.CellRangeAddress(0, 0, 5, 6);
            sheet1.AddMergedRegion(crs);

            row2.CreateCell(7).SetCellValue("Załatwienia");
            crs = new NPOI.SS.Util.CellRangeAddress(0, 0, 7, 12);
            sheet1.AddMergedRegion(crs);

            row2.CreateCell(13).SetCellValue("Il. sporządzonych uzasadnień");
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 13, 13);
            sheet1.AddMergedRegion(crs);

            row2.CreateCell(14).SetCellValue("Nieobecności");
            crs = new NPOI.SS.Util.CellRangeAddress(0, 0, 14, 15);
            sheet1.AddMergedRegion(crs);

            row2 = sheet1.CreateRow(1);

            row2.CreateCell(5).SetCellValue("rozprawy");
            row2.CreateCell(6).SetCellValue("posiedzenia");
            row2.CreateCell(7).SetCellValue("K");
            row2.CreateCell(8).SetCellValue("Kp");
            row2.CreateCell(9).SetCellValue("Ko");
            row2.CreateCell(10).SetCellValue("W");
            row2.CreateCell(11).SetCellValue("Kop");
            row2.CreateCell(12).SetCellValue("Razem");

            row2.CreateCell(14).SetCellValue("Urlopy");
            row2.CreateCell(15).SetCellValue("Zwolnienia");

            foreach (DataRow rowik in table.Rows)
            {
                row2 = sheet1.CreateRow(ro);
                for (int i = 0; i < rowik.ItemArray.Length; i++)
                {
                    try
                    {
                        int ji = int.Parse(rowik[i].ToString().Trim());
                        ICellStyle cellStyle = hssfworkbook.CreateCellStyle();
                        cellStyle.DataFormat = HSSFDataFormat.GetBuiltinFormat("0");
                        row2.CreateCell(i).SetCellValue(ji);
                        row2.Cells[i].CellStyle = cellStyle;
                    }
                    catch (Exception)
                    {
                        row2.CreateCell(i).SetCellValue(rowik[i].ToString().Trim());
                    }
                }
                ro++;
            }// end foreach
             // trzeci sheet

            view = (DataView)tabela_3.Select(DataSourceSelectArguments.Empty);

            table = view.ToTable();

            table.Columns.Remove("ident");
            table.Columns.Remove("sesja");
            table.Columns.Remove("id_sedziego");
            table.Columns.Remove("id_tabeli");
            table.Columns.Remove("id_dzialu");
            table.Columns.Remove("d_08");
            table.Columns.Remove("d_09");
            table.Columns.Remove("d_10");
            table.Columns.Remove("d_11");
            table.Columns.Remove("d_12");
            table.Columns.Remove("d_13");
            table.Columns.Remove("d_14");
            table.Columns.Remove("d_15");
            table.Columns.Remove("d_16");
            table.Columns.Remove("d_17");
            table.Columns.Remove("d_18");
            table.Columns.Remove("d_19");
            table.Columns.Remove("d_20");
            table.Columns.Remove("d_21");
            table.Columns.Remove("d_22");

            ISheet sheet2 = hssfworkbook.CreateSheet("Wyznaczenia");

            row2 = sheet2.CreateRow(0);
            row2.CreateCell(0).SetCellValue("L.p.");
            row2.CreateCell(1).SetCellValue("Nazwisko");
            row2.CreateCell(2).SetCellValue("Imię");
            row2.CreateCell(3).SetCellValue("Funkcja");
            row2.CreateCell(4).SetCellValue("Stanowisko");

            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 0, 0);
            sheet2.AddMergedRegion(crs);
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 1, 1);
            sheet2.AddMergedRegion(crs);
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 2, 2);
            sheet2.AddMergedRegion(crs);
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 3, 3);
            sheet2.AddMergedRegion(crs);
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 4, 4);
            sheet2.AddMergedRegion(crs);

            row2.CreateCell(5).SetCellValue("Wyznaczenia");
            crs = new NPOI.SS.Util.CellRangeAddress(0, 0, 5, 10);
            sheet2.AddMergedRegion(crs);

            row2.CreateCell(5).SetCellValue("Odroczenia liczba spraw odroczonych");
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 11, 11);
            sheet2.AddMergedRegion(crs);
            row2 = sheet2.CreateRow(1);

            row2.CreateCell(5).SetCellValue("K");
            row2.CreateCell(6).SetCellValue("Kp");
            row2.CreateCell(7).SetCellValue("Ko");
            row2.CreateCell(8).SetCellValue("W");
            row2.CreateCell(9).SetCellValue("Kop");
            row2.CreateCell(10).SetCellValue("Razem");


            ro = 2;

            foreach (DataRow rowik in table.Rows)
            {
                row2 = sheet2.CreateRow(ro);
                for (int i = 0; i < rowik.ItemArray.Length; i++)
                {
                    try
                    {
                        int ji = int.Parse(rowik[i].ToString().Trim());
                        ICellStyle cellStyle = hssfworkbook.CreateCellStyle();
                        cellStyle.DataFormat = HSSFDataFormat.GetBuiltinFormat("0");
                        row2.CreateCell(i).SetCellValue(ji);
                        row2.Cells[i].CellStyle = cellStyle;
                    }
                    catch (Exception)
                    {
                        row2.CreateCell(i).SetCellValue(rowik[i].ToString().Trim());
                    }
                }
                ro++;
            }// end foreach

            // czwarty sheet

            view = (DataView)tabela_4.Select(DataSourceSelectArguments.Empty);

            table = view.ToTable();

            table.Columns.Remove("ident");
            table.Columns.Remove("sesja");
            table.Columns.Remove("id_sedziego");
            //        table.Columns.Remove("id_tabeli");
            //       table.Columns.Remove("id_dzialu");
            table.Columns.Remove("d_07");
            table.Columns.Remove("d_08");
            table.Columns.Remove("d_09");
            table.Columns.Remove("d_10");
            table.Columns.Remove("d_11");
            table.Columns.Remove("d_12");
            table.Columns.Remove("d_13");
            table.Columns.Remove("d_14");
            table.Columns.Remove("d_15");
            table.Columns.Remove("d_16");
            table.Columns.Remove("d_17");
            table.Columns.Remove("d_18");
            table.Columns.Remove("d_19");
            table.Columns.Remove("d_20");
            table.Columns.Remove("d_21");
            table.Columns.Remove("d_22");

            ISheet sheet3 = hssfworkbook.CreateSheet("Stan referatów sędziów");

            ICellStyle cellStylex = hssfworkbook.CreateCellStyle();
            cellStylex.DataFormat = HSSFDataFormat.GetBuiltinFormat("0");
            cellStylex.BorderTop = NPOI.SS.UserModel.BorderStyle.Thin;
            cellStylex.BorderRight = NPOI.SS.UserModel.BorderStyle.Thin;
            cellStylex.BorderLeft = NPOI.SS.UserModel.BorderStyle.Thin;
            cellStylex.BorderBottom = NPOI.SS.UserModel.BorderStyle.Thin;




            row2 = sheet3.CreateRow(0);
            row2.CreateCell(0).SetCellValue("L.p.");
            row2.CreateCell(1).SetCellValue("Nazwisko");
            row2.CreateCell(2).SetCellValue("Imię");
            row2.CreateCell(3).SetCellValue("Funkcja");
            row2.CreateCell(4).SetCellValue("Stanowisko");

            row2.Cells[0].CellStyle = cellStylex;
            row2.Cells[1].CellStyle = cellStylex;
            row2.Cells[2].CellStyle = cellStylex;
            row2.Cells[3].CellStyle = cellStylex;
            row2.Cells[4].CellStyle = cellStylex;

            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 0, 0);
            sheet3.AddMergedRegion(crs);
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 1, 1);
            sheet3.AddMergedRegion(crs);
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 2, 2);
            sheet3.AddMergedRegion(crs);
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 3, 3);
            sheet3.AddMergedRegion(crs);
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 4, 4);
            sheet3.AddMergedRegion(crs);
            row2.CreateCell(5).SetCellValue("Pozostało w referatach spraw kategorii");
            crs = new NPOI.SS.Util.CellRangeAddress(0, 0, 5, 10);
            sheet3.AddMergedRegion(crs);
            row2.Cells[5].CellStyle = cellStylex;
            row2 = sheet3.CreateRow(1);

            row2.CreateCell(5).SetCellValue("K");
            row2.CreateCell(6).SetCellValue("Kp");
            row2.CreateCell(7).SetCellValue("Ko");
            row2.CreateCell(8).SetCellValue("W");
            row2.CreateCell(9).SetCellValue("Kop");
            row2.CreateCell(10).SetCellValue("Razem");



            // row2.CreateCell(12).SetCellValue("Odroczenia liczba spraw odroczonych");
            ro = 2;

            foreach (DataRow rowik in table.Rows)
            {
                row2 = sheet3.CreateRow(ro);
                for (int i = 0; i < rowik.ItemArray.Length; i++)
                {
                    try
                    {
                        int ji = int.Parse(rowik[i].ToString().Trim());
                        ICellStyle cellStyle = hssfworkbook.CreateCellStyle();
                        cellStyle.DataFormat = HSSFDataFormat.GetBuiltinFormat("0");
                        cellStyle.BorderTop = NPOI.SS.UserModel.BorderStyle.Thin;
                        cellStyle.BorderRight = NPOI.SS.UserModel.BorderStyle.Thin;
                        cellStyle.BorderLeft = NPOI.SS.UserModel.BorderStyle.Thin;
                        cellStyle.BorderBottom = NPOI.SS.UserModel.BorderStyle.Thin;
                        row2.CreateCell(i).SetCellValue(ji);
                        row2.Cells[i].CellStyle = cellStyle;
                    }
                    catch (Exception)
                    {
                        row2.CreateCell(i).SetCellValue(rowik[i].ToString().Trim());
                    }
                }
                ro++;
            }// end foreach
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

    }
}