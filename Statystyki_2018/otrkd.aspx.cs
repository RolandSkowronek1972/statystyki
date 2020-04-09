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
    public partial class otrkd : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tabele = new tabele();
        private HSSFWorkbook hssfworkbook;
        public string tenPlik = "otrkd.aspx";

        protected void Page_Load(object sender, EventArgs e)
        {
            string idWydzial = Request.QueryString["w"];
            if (idWydzial != null)
            {
                Session["id_dzialu"] = idWydzial;
                //  //cm.log.Info(tenPlik + ": id wydzialu=" + idWydzial);
            }
            else
            {
                return;
            }
            CultureInfo newCulture = (CultureInfo)CultureInfo.CurrentCulture.Clone();
            newCulture.DateTimeFormat = CultureInfo.GetCultureInfo("PL").DateTimeFormat;
            System.Threading.Thread.CurrentThread.CurrentCulture = newCulture;
            System.Threading.Thread.CurrentThread.CurrentUICulture = newCulture;
            System.Threading.Thread.CurrentThread.CurrentUICulture = newCulture;
            DateTime dTime = DateTime.Now.AddMonths(-1); ;

            if (Date1.Text.Length == 0) Date1.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-01");
            if (Date2.Text.Length == 0) Date2.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-" + DateTime.DaysInMonth(dTime.Year, dTime.Month).ToString("D2"));
           
            Session["data_1"] = Date1.Date.ToShortDateString();
            Session["data_2"] = Date2.Date.ToShortDateString();

            clearHedersSession();
            makeHeader();
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

        protected void odswiez()
        {
            Session["sesja"] = "s3030";
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
            id_dzialu.Text = (string)Session["txt_dzialu"];
            string txt = string.Empty; 

            txt = txt + cl.clear_maim_db();
            try
            {
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 2, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text));
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 3, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text));
                txt = txt + cl.generuj_dane_do_tabeli_(int.Parse((string)Session["id_dzialu"]), 4, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text));
                //txt = txt + cl.uzupelnij_statusy();
            }
            catch
            {
            }
            // dopasowanie opisów

            GridView1.DataBind();
            GridView2.DataBind();
            GridView3.DataBind();
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

        #region "nagłowki tabel"

        protected void makeHeader()
        {
            System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();

            #region deklaracja

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

            dT_01.Clear();

            #endregion deklaracja

            #region tabela  1 ()

            dT_01.Clear();

            dT_01.Rows.Add(new Object[] { "1", "Kkow", "1", "1", "v" });//
            dT_01.Rows.Add(new Object[] { "1", "O", "1", "1", "v" });//
            dT_01.Rows.Add(new Object[] { "1", "Art.164 §1i 2kkw", "1", "1", "v" });//
            dT_01.Rows.Add(new Object[] { "1", "Art.153 §4 kkw", "1", "1", "v" });//
            dT_01.Rows.Add(new Object[] { "1", "Dozór el", "1", "1", "v" });//
            dT_01.Rows.Add(new Object[] { "1", "Nadzory z art.181a§kkw", "1", "1", "v" });//
            dT_01.Rows.Add(new Object[] { "1", "Dozory", "1", "1", "v" });//
            dT_01.Rows.Add(new Object[] { "1", "Kkow", "1", "1", "v" });//
            dT_01.Rows.Add(new Object[] { "1", "Łączna liczba spraw (w tym zawiszone)", "1", "1", "v" });//

            dT_01.Rows.Add(new Object[] { "2", "L.p.", "1", "2", "h" });//
            dT_01.Rows.Add(new Object[] { "2", "Nazwisko i imie <br.> Kuratora", "1", "2", "h" });//
            dT_01.Rows.Add(new Object[] { "2", "dozory własne od 20 do 35 (standardye < br/>(na koniec okresu stat.)", "1", "2", "h" });//
            dT_01.Rows.Add(new Object[] { "2", "Dozory powierz.od 30 do 60 (standardy)", "1", "2", "h" });//
            dT_01.Rows.Add(new Object[] { "2", "Inne sprawy do 50 (standardy)", "1", "2", "h" });//
            dT_01.Rows.Add(new Object[] { "2", "w tym", "6", "1", "h" });//
            dT_01.Rows.Add(new Object[] { "2", "Łącznie liczba spraw do 120 (standardy)", "1", "2", "h" });//
            dT_01.Rows.Add(new Object[] { "2", "W tym własnych do 50 (standardy)", "1", "2", "h" });//
            dT_01.Rows.Add(new Object[] { "2", "Sprawy zawieszone", "1", "2", "h" });//

            Session["header_01"] = dT_01;

            #endregion tabela  1 ()

            #region tabela  3 ()

            dT_03.Clear();

            dT_03.Rows.Add(new Object[] { "1", "Art. 214 kpk", "1", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "Art.14 §1 kkw", "1", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "Art.43h §4 kkw", "1", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "Ogółem we wszystkich fazach postępowania", "1", "1", "h" });
            dT_03.Rows.Add(new Object[] { "1", "Wywiady kontrolne", "1", "1", "h" });

            dT_03.Rows.Add(new Object[] { "2", "L.p.", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Imię i Nazwisko", "1", "2", "h" });
            dT_03.Rows.Add(new Object[] { "2", "Obciążenia wywiadami zleconymi", "5", "1", "h" });

            Session["header_03"] = dT_03;

            #endregion tabela  3 ()
        }

        protected void grvMergeHeader_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tabele.makeHeader(new System.Web.UI.WebControls.GridView(), (DataTable)Session["header_03"], GridView1);
            }
        }

        protected void grvMergeHeader_RowCreated2(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tabele.makeHeader(new System.Web.UI.WebControls.GridView(), (DataTable)Session["header_03"], GridView2);
            }
        }

        protected void GridView3_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                tabele.makeHeader(new System.Web.UI.WebControls.GridView(), (DataTable)Session["header_01"], GridView3);
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
                Label3x.Text = cl.nazwaSadu((string)Session["id_dzialu"]);
                Label5.Text = cl.nazwaSadu((string)Session["id_dzialu"]);
                Label3.Text = cl.nazwaSadu((string)Session["id_dzialu"]);
                id_dzialu.Text = (string)Session["txt_dzialu"];

                string strMonthName = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(DateTime.Parse(Date2.Text).Month);
                int last_day = DateTime.DaysInMonth(DateTime.Parse(Date2.Text).Year, DateTime.Parse(Date2.Text).Month);
                if (((DateTime.Parse(Date1.Text).Day == 1) && (DateTime.Parse(Date2.Text).Day == last_day)) && ((DateTime.Parse(Date1.Text).Month == DateTime.Parse(Date2.Text).Month)))
                {
                    // cały miesiąc
                    Label19.Text = "stan za miesiąc " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    Label2.Text = "stan za miesiąc  " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku. ";
                    Label406.Text = "stan za miesiąc " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku. ";
                }
                else
                {
                    Label19.Text = "stan  za okres od " + Date1.Date.ToShortDateString() + " do  " + Date2.Date.ToShortDateString();
                    Label2.Text = "stan za okres od" + Date1.Date.ToShortDateString() + " do  " + Date2.Date.ToShortDateString();
                    Label406.Text = "stan za okres od" + Date1.Date.ToShortDateString() + " do  " + Date2.Date.ToShortDateString();
                }
            }
            catch
            {
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            // execel begin
            string filename = "statystykiWydzialCywilny.xls";
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
            ISheet sheet0 = hssfworkbook.CreateSheet("Ruch spraw");

            //	DataView view = (DataView)dane_do_tabeli_1.Select(DataSourceSelectArguments.Empty);

            //	DataTable table = view.ToTable();

            IRow row0 = sheet0.CreateRow(0);
            //	table.TableName = "Załatwienia";
            //	table.Columns.Remove("id_");

            row0.CreateCell(0).SetCellValue("Opis");
            row0.CreateCell(1).SetCellValue("Sprawy według repetoriów i wykazów");

            var crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 0, 0);
            sheet0.AddMergedRegion(crs);
            crs = new NPOI.SS.Util.CellRangeAddress(0, 0, 1, 8);
            sheet0.AddMergedRegion(crs);

            row0 = sheet0.CreateRow(1);

            row0.CreateCell(1).SetCellValue("C");
            row0.CreateCell(2).SetCellValue("CG-G");
            row0.CreateCell(3).SetCellValue("Ns");
            row0.CreateCell(4).SetCellValue("Nc");
            row0.CreateCell(5).SetCellValue("Co");
            row0.CreateCell(6).SetCellValue("Cps");

            row0.CreateCell(7).SetCellValue("WSC");
            row0.CreateCell(8).SetCellValue("Łącznie");

            // druga tabela
            DataView view = (DataView)statystyki.Select(DataSourceSelectArguments.Empty);
            DataTable table = view.ToTable();
            table = view.ToTable();

            table = view.ToTable();
            table.TableName = "Załatwienia";
            table.Columns.Remove("ident");
            table.Columns.Remove("sesja");
            table.Columns.Remove("id_sedziego");
            table.Columns.Remove("id_tabeli");
            table.Columns.Remove("id_dzialu");
            //table.Columns.Remove("d_13");
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
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 0, 0);
            sheet1.AddMergedRegion(crs);

            row2.CreateCell(1).SetCellValue("Nazwisko");
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 1, 1);
            sheet1.AddMergedRegion(crs);

            row2.CreateCell(2).SetCellValue("Imię");
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 2, 2);
            sheet1.AddMergedRegion(crs);

            row2.CreateCell(3).SetCellValue("Funkcja");
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 3, 3);
            sheet1.AddMergedRegion(crs);

            row2.CreateCell(4).SetCellValue("Stanowisko");
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 4, 4);
            sheet1.AddMergedRegion(crs);

            row2.CreateCell(5).SetCellValue("Liczba sesji");
            crs = new NPOI.SS.Util.CellRangeAddress(0, 0, 5, 6);

            sheet1.AddMergedRegion(crs);

            row2.CreateCell(7).SetCellValue("Załatwienia");
            crs = new NPOI.SS.Util.CellRangeAddress(0, 0, 7, 14);
            sheet1.AddMergedRegion(crs);

            row2.CreateCell(15).SetCellValue("Il. sporządzonych uzasadnień");
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 15, 15);
            sheet1.AddMergedRegion(crs);

            row2.CreateCell(16).SetCellValue("Nieobecności");
            crs = new NPOI.SS.Util.CellRangeAddress(0, 0, 16, 17);
            sheet1.AddMergedRegion(crs);

            row2 = sheet1.CreateRow(1);

            row2.CreateCell(5).SetCellValue("rozprawy");
            row2.CreateCell(6).SetCellValue("posiedzenia");
            row2.CreateCell(7).SetCellValue("C");
            row2.CreateCell(8).SetCellValue("C-GC");
            row2.CreateCell(9).SetCellValue("Ns");
            row2.CreateCell(10).SetCellValue("Nc");
            row2.CreateCell(11).SetCellValue("Co");
            row2.CreateCell(12).SetCellValue("Cps");
            row2.CreateCell(13).SetCellValue("WSC");
            row2.CreateCell(14).SetCellValue("Razem");
            row2.CreateCell(16).SetCellValue("Urlopy");
            row2.CreateCell(17).SetCellValue("Zwolnienia");

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

            sheet1.AutoSizeColumn(0, true);
            sheet1.AutoSizeColumn(1, true);

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
            crs = new NPOI.SS.Util.CellRangeAddress(0, 0, 5, 12);
            sheet2.AddMergedRegion(crs);

            row2 = sheet2.CreateRow(1);

            row2.CreateCell(5).SetCellValue("C");
            row2.CreateCell(6).SetCellValue("C-GC");
            row2.CreateCell(7).SetCellValue("Ns");
            row2.CreateCell(8).SetCellValue("Nc");
            row2.CreateCell(9).SetCellValue("Co");
            row2.CreateCell(10).SetCellValue("Cps");
            row2.CreateCell(11).SetCellValue("WSC");
            row2.CreateCell(12).SetCellValue("Razem");
            row2.CreateCell(13).SetCellValue("Odroczenia liczba spraw odroczonych");
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

        protected void make_footer(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataView view = (DataView)statystyki.Select(DataSourceSelectArguments.Empty);

                DataTable table = view.ToTable();
                object sumObject;
                e.Row.Cells[1].Text = "Razem";
                for (int i = 1; i < 21; i++)
                {
                    string txt = "d_";
                    string digit = i.ToString("D2");
                    txt = txt + digit;
                    sumObject = table.Compute("Sum(" + txt + ")", "");
                    try
                    {
                        e.Row.Cells[1 + i].Text = sumObject.ToString();
                    }
                    catch (Exception)
                    { }
                }
            }
        }

        protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataView view = (DataView)tabela_3.Select(DataSourceSelectArguments.Empty);

                DataTable table = view.ToTable();
                object sumObject;
                e.Row.Cells[1].Text = "Razem";
                for (int i = 1; i < 21; i++)
                {
                    string txt = "d_";
                    string digit = i.ToString("D2");
                    txt = txt + digit;
                    sumObject = table.Compute("Sum(" + txt + ")", "");
                    try
                    {
                        e.Row.Cells[1 + i].Text = sumObject.ToString();
                    }
                    catch (Exception)
                    { }
                }
            }
        }

        protected void makeFooter2(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataView view = (DataView)tabela_4.Select(DataSourceSelectArguments.Empty);

                DataTable table = view.ToTable();
                object sumObject;
                e.Row.Cells[1].Text = "Razem";
                for (int i = 1; i < 21; i++)
                {
                    string txt = "d_";
                    string digit = i.ToString("D2");
                    txt = txt + digit;
                    sumObject = table.Compute("Sum(" + txt + ")", "");
                    try
                    {
                        e.Row.Cells[1 + i].Text = sumObject.ToString();
                    }
                    catch (Exception)
                    { }
                }
            }
        }
    }
}