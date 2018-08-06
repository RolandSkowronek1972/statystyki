using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using OfficeOpenXml;
using OfficeOpenXml.Table;
using OfficeOpenXml.Style; 
    
using System.Reflection;

namespace stat2018
{
    public partial class test : System.Web.UI.Page
    {
        public mss ms = new mss();
        private const int wiersz = 1;
        private const int kolumna = 2;
        private const int tekst = 3;
        private const int rowspan = 4;
        private const int colspan = 5;
        private const int style = 6;
        private int storid = 0;

        private string wyciagnijWartosc(DataTable ddT, string selectString)
        {
            string result = "0";
            try
            {
                DataRow[] foundRows;
                foundRows = ddT.Select(selectString);
                DataRow dr = foundRows[0];
                result = dr[4].ToString();
            }
            catch (Exception ex)
            { }
            return result;

        }



        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //  generujTabele("c:\\temp\\mss5r.xlsx", "1.1");
            DataTable przykladowedane = new DataTable();
            przykladowedane.Columns.Add("D1", typeof(int));
            przykladowedane.Columns.Add("D2", typeof(int));
            przykladowedane.Columns.Add("D3", typeof(int));
            przykladowedane.Columns.Add("D4", typeof(int));
            DataRow row1 = przykladowedane.NewRow();
            row1["D1"] = 1;
            row1["D2"] = 2;
            row1["D3"] = 3;
            row1["D4"] = 4;
            przykladowedane.Rows.Add(row1);
            GridView1.DataSource = null;
            GridView1.DataSourceID = null;
            GridView1.AutoGenerateColumns = true;
            GridView1.DataSource = przykladowedane;
            GridView1.DataBind();
            //mss5r

        }
        protected void generujTabele(string nazwaPliku, string nazwatabeli)
        {
            string excelFilename = string.Empty;
        
            // czytaj z excela
            var package = new ExcelPackage(new FileInfo(nazwaPliku));
            string nazwaTabeliDanych = nazwatabeli + "_dane";
            DataTable teksty = czesctekstowa();
            using (package)
            {
                var worksheet = package.Workbook.Worksheets[nazwatabeli];
                
                int rows = worksheet.Dimension.End.Row;
                for (int i = 2; i < rows; i++)
                {
                    string info = worksheet.Cells[i, 1].Text;
                    if (string.IsNullOrEmpty(info.Trim()))
                    {
                        return;
                    }
                    // jezeli dane sa to
                    DataRow wierszDanych = teksty.NewRow();
                    int value = 0;
                    wierszDanych["wiersz"] = int.Parse(worksheet.Cells[i, wiersz].Text.Trim());
                    wierszDanych["kolumna"] = int.Parse(worksheet.Cells[i, kolumna].Text.Trim());
                    wierszDanych["text"] = worksheet.Cells[i, tekst].Text.Trim();
                    wierszDanych["rowspan"] = int.Parse(worksheet.Cells[i, rowspan].Text.Trim());
                    wierszDanych["colspan"] = int.Parse(worksheet.Cells[i, colspan].Text.Trim());
                    wierszDanych["style"] = worksheet.Cells[i, style].Text.Trim();
                    teksty.Rows.Add(wierszDanych);
                }
            }
            // znalezienie największego numeru wiersza
            
            int maxwiersz =int.Parse ( teksty.Compute("Max(wiersz)", string.Empty).ToString ());
            //dane do tabeli z liczbami
            DataTable tabela2 = ms.generuj_dane_do_tabeli_mss2(1, DateTime.Now.Date, DateTime.Now.Date, 21);
            for (int i = 1; i < maxwiersz; i++)
            {
                //zmniejsz tabele do danych tlko z wiersza
                string kwerenda = "wiersz="+i.ToString();
                DataRow[] znalezione = teksty.Select(kwerenda);
                if (znalezione.Length>0)
                {
                    DataTable jedenWiersz = znalezione.CopyToDataTable();
                    GridView1.Controls[0].Controls.AddAt(i, wierszTabeli(jedenWiersz, null, 5, i, nazwatabeli, "normal", "BorderAll"));
                }
                

            }




        }
        public DataTable czesctekstowa ()
        {
            DataTable tblCzescTekstowa = new DataTable();
            tblCzescTekstowa.Columns.Add("wiersz", typeof(int));
            tblCzescTekstowa.Columns.Add("kolumna", typeof(int));
            tblCzescTekstowa.Columns.Add("text", typeof(string));
            tblCzescTekstowa.Columns.Add("rowspan", typeof(int));
            tblCzescTekstowa.Columns.Add("colspan", typeof(int));
            tblCzescTekstowa.Columns.Add("style", typeof(string));
            return tblCzescTekstowa;
        }
        public GridViewRow wierszTabeli(DataTable daneWiersza, DataTable dane, int iloscKolumn, int idWiersza, string idtabeli,  string CssStyleDlaTekstu, string cssStyleDlaTabeli)
        {
            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
            // wpisanie tekstów
            foreach (DataRow komorka in daneWiersza.Rows)
            {
                int wiersz = int.Parse (komorka["wiersz"].ToString().Trim());
                int kolumna = int.Parse(komorka["kolumna"].ToString().Trim());
                string tekst = komorka["text"].ToString().Trim();
                int rowSpan = int.Parse(komorka["rowspan"].ToString().Trim());
                int colspan = int.Parse(komorka["colspan"].ToString().Trim());

                NewTotalRow.Cells.Add(cela (tekst, rowSpan, colspan,"borderAll"));
            }
            // kolumna wyliczeniowa
            NewTotalRow.Cells.Add(cela(idWiersza.ToString() , 1, 1, "col_36"));
            if (dane!=null)
            {
                for (int i = 1; i < iloscKolumn; i++)
                {
                    //NewTotalRow.Cells.Add(cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!" + idtabeli.ToString().Trim() + "!" + i.ToString().Trim() + "!3')\">" + dane.Rows[idWiersza - 1][i].ToString().Trim() + "</a>", 1, 1, cssStyleDlaTabeli));
                    NewTotalRow.Cells.Add(cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!" + idtabeli.ToString().Trim() + "!" + i.ToString().Trim() + "!3')\">" + i.ToString().Trim() + "</a>", 1, 1, cssStyleDlaTabeli));
                }
            }
            
            return NewTotalRow;
        }// end of 


        public TableCell cela(string text, int rowSpan, int colSpan, string cssClass)
        {


            TableCell HeaderCell = new TableCell();

            HeaderCell.Height = 10;
            HeaderCell.HorizontalAlign = HorizontalAlign.Center;
            HeaderCell.ColumnSpan = colSpan;
            HeaderCell.RowSpan = rowSpan;
            HeaderCell.CssClass = cssClass;

            HeaderCell.Text = text;

            return HeaderCell;
        }

      
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
               int  storid = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "D1").ToString());
            }

        }

        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer )
            {
                string path = Server.MapPath("\\msstabele\\mss5r.xlsx");
                //generujTabele("c:\\temp\\mss5r.xlsx", "1.1");
                generujTabele(path, "1.1");
            }
           
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //read excell file 
            string path = Server.MapPath("\\template\\otrc.xlsx");
            IList<string> komorki = new List<string>();
            DataTable schematNaglowka = new DataTable();
            schematNaglowka.Columns.Add("wiersz", typeof(int));
            schematNaglowka.Columns.Add("kolumna", typeof(int));
            schematNaglowka.Columns.Add("text", typeof(string));
            schematNaglowka.Columns.Add("rowSpan", typeof(int));
            schematNaglowka.Columns.Add("colSpan", typeof(int));

            var package = new ExcelPackage(new FileInfo(path));
            DataTable teksty = czesctekstowa();
            using (package)
            {
                ExcelWorksheet worksheet = package.Workbook.Worksheets[1];

                int rows = worksheet.Dimension.End.Row;
                int columns = worksheet.Dimension.End.Column;
        
                for (int i = 1; i <= rows; i++)

                {
                    for (int j = 1; j <= columns; j++)
                    {
                    
                        
                        object baseE = worksheet.Cells[i, j];
                        ExcelCellBase celka = (ExcelCellBase)baseE;

                        bool polaczony =(bool) celka.GetType().GetProperty("Merge").GetValue(celka, null);
                        var kolumny = celka.GetType().GetProperty("Columns").GetValue(celka, null);
                        var wiersze = celka.GetType().GetProperty("Rows").GetValue(celka, null);
                        var text = celka.GetType().GetProperty("Value").GetValue(celka, null);
                       
                        DataRow komorka = schematNaglowka.NewRow();
                        if (polaczony && text!=null)
                        {
                            IList<int> lista = okreslKomorke(i, j, rows, columns, worksheet);
                            
                            ExcelCellAddress jakisobjekt = (ExcelCellAddress)celka.GetType().GetProperty("End").GetValue(celka, null);
                            komorka["wiersz"] = i;
                            komorka["kolumna"] = j;
                            komorka["text"] = text;
                            komorka["colSpan"] = lista[0].ToString();
                            komorka["rowSpan"] = lista[1].ToString();
                            schematNaglowka.Rows.Add(komorka);
                            int k = lista[1];
                            if (k>1)
                            {
                                j = j + k;
                            }
                           
                        }
                        else
                        {
                            komorka["wiersz"] = i;
                            komorka["kolumna"] = j;
                            komorka["text"] = text;
                            komorka["colSpan"] = 1;
                            komorka["rowSpan"] = 1;
                            schematNaglowka.Rows.Add(komorka);

                        }

                    }
                }
               
            }
            foreach (DataRow komorka in schematNaglowka.Rows )
            {
                TextBox1.Text = TextBox1.Text+ komorka[0].ToString()+" "+ komorka[1].ToString() + " "+komorka[2].ToString() + " "+ komorka[3].ToString() + " "+ komorka[4].ToString() + " " + Environment.NewLine;

            }
        }


        protected IList<int> okreslKomorke(int wierszPoczatkowy, int kolumnaPoczatkowa, int iloscWierszy, int iloscKolumn, ExcelWorksheet worksheet)
        {
            IList<int> wyniki = new List<int>();
            int rowSpan = 0;
            int colSpan = 0;

            bool mergedY = false;

            for (int i = wierszPoczatkowy; i <= iloscWierszy; i++)
            {
                object baseE = worksheet.Cells[i, kolumnaPoczatkowa ];

                ExcelCellBase celka = (ExcelCellBase)baseE;
                bool polaczony = (bool)celka.GetType().GetProperty("Merge").GetValue(celka, null);
                var text = celka.GetType().GetProperty("Value").GetValue(celka, null);
                if (!polaczony)
                {
                    break;
                }
                else
                {
                    if (mergedY)
                    {
                        if (text != null)
                        {
                            break;
                        }
                    }
                    mergedY = true;


                }
                rowSpan++;
            }
            bool mergedX = false;
            for (int j = kolumnaPoczatkowa; j <= iloscKolumn; j++)
            {
                object baseE = worksheet.Cells[wierszPoczatkowy , j];

                ExcelCellBase celka = (ExcelCellBase)baseE;
                bool polaczony = (bool)celka.GetType().GetProperty("Merge").GetValue(celka, null);
                var text = celka.GetType().GetProperty("Value").GetValue(celka, null);
                if (!polaczony)
                {
                    break;
                }
                else
                {
                    if (mergedX )
                    {
                        if (text!=null)
                        {
                            break;
                        }
                    }
                    mergedX = true;
                }

                colSpan++;
            }
            wyniki.Add(rowSpan);
            wyniki.Add(colSpan);
            return wyniki;
        }
    }
}