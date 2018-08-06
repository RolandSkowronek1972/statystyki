using System;
using System.Web.UI.WebControls;
using System.Data;
using OfficeOpenXml;
using System.Linq;
using System.Text.RegularExpressions;
namespace stat2018
{
    public class tabele
    {
        common cm = new common();


      public   TableCell HeaderCell_(string text, int columns, int rows)
        {
            TableCell HeaderCell = new TableCell();
            HeaderCell.Text = text;
            HeaderCell.ColumnSpan = columns;
            HeaderCell.RowSpan = rows;
            return HeaderCell;
        }

       public  GridViewRow Grw(object sender)
        {
            GridViewRow HeaderGridRow = null;
            GridView HeaderGrid = (GridView)sender;
            HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
            HeaderGridRow.Font.Size = 7;
            HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
            HeaderGridRow.VerticalAlign = VerticalAlign.Top;
            return HeaderGridRow;
        }

        public void makeHeader(System.Web.UI.WebControls.GridView GridViewName, DataTable dT, System.Web.UI.WebControls.GridView GridViewX)
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
                        GridView HeaderGrid = (GridView)GridViewName;
                        HeaderGridRow = Grw(GridViewName);
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
            catch (Exception ex)
            { } // end of try
        }
     public   DataTable tabellaLiczbowa(DataTable tabelaWejsciowa)
        {
            if (tabelaWejsciowa==null)
            {
                return null;
            }
            DataTable tabelaRobocza = new DataTable();
            int iloscKolumn = tabelaWejsciowa.Columns.Cast<DataColumn>().Count(c => c.ColumnName.StartsWith("d_"));

            for (int i = 0; i < iloscKolumn; i++)
            {
                string nazwaKolumny = "d_" + i.ToString("D2");
                tabelaRobocza.Columns.Add(nazwaKolumny ,typeof (double));
            }
            foreach (DataRow  Drow in tabelaWejsciowa.Rows)
            { 
                DataRow wierszTymczasowy = tabelaRobocza.NewRow();
                for (int i = 1; i < iloscKolumn; i++)
                {
                    string nazwaKolumny = "d_" + i.ToString("D2");
                    double liczba = 0;
                    try
                    {
                         liczba = double.Parse (Drow[nazwaKolumny].ToString ());
                    }
                    catch 
                    {  }
                    wierszTymczasowy[nazwaKolumny] = liczba;
                }
                tabelaRobocza.Rows.Add(wierszTymczasowy );
            }

            return tabelaRobocza;

        }
        public void makeSumRow(DataTable table, GridViewRowEventArgs e)
        {
            DataTable tabelka = tabellaLiczbowa(table);
            object sumObject;
            int ilKolumn = e.Row.Cells.Count;
            e.Row.Cells[1].Text = "Ogółem";
            for (int i = 1; i < e.Row.Cells.Count; i++)
            {
                try
                {
                    string idkolumny = "d_" + (i).ToString("D2");
                    sumObject = tabelka.Compute("Sum(" + idkolumny+ ")", "");
                    e.Row.Cells[i+1].Text = sumObject.ToString();
                    e.Row.Cells[i+1].CssClass = "center normal";
                }
                catch (Exception ex)
                {
                    cm.log.Error("sumowanie w stopce : " + ex.Message);
                }

            }

        }
        public void makeSumRow(DataTable table, GridViewRowEventArgs e,int przesuniecie)
        {
            DataTable tabelka = tabellaLiczbowa(table);
            object sumObject;
            int ilKolumn = e.Row.Cells.Count;
            e.Row.Cells[1].Text = "Ogółem";
            for (int i = 1; i < e.Row.Cells.Count; i++)
            {
                try
                {
                    string idkolumny = "d_" + (i).ToString("D2");
                    sumObject = tabelka.Compute("Sum(" + idkolumny + ")", "");
                    e.Row.Cells[i+przesuniecie].Text = sumObject.ToString();
                    e.Row.Cells[i + przesuniecie].CssClass = "center normal";
                }
                catch (Exception ex)
                {
                    cm.log.Error("sumowanie w stopce : " + ex.Message);

                }

            }

        }

        public GridViewRow PodsumowanieTabeli(DataTable dane, int iloscKolumn,   string cssStyleDlaTabeli)
        {
            DataTable tabelka = tabellaLiczbowa(dane);
            object sumObject;
            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
            NewTotalRow.Cells.Add(cela("Razem", 1,2, cssStyleDlaTabeli));
            for (int i = 1; i < iloscKolumn; i++)
            {

                try
                {
                    string idkolumny = "d_" + (i).ToString("D2");
                    sumObject = tabelka.Compute("Sum(" + idkolumny + ")", "");
                  
                    NewTotalRow.Cells.Add(cela(sumObject.ToString(), 1, 1, cssStyleDlaTabeli));
                }
                catch
                { }
            }
            return NewTotalRow;
        }
        //tabele pod dynamicznymi
        public GridViewRow wierszTabeli(DataTable dane, int iloscKolumn, int idWiersza, string idtabeli, string tekst, int colSpan, int rowSpan, string CssStyleDlaTekstu, string cssStyleDlaTabeli, string drugiText, int colSpanDrugi, int rowSpanDrugi, string cssStyleDrugi)
        {
            // nowy wiersz

            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
            NewTotalRow.Cells.Add(cela(drugiText, colSpanDrugi, rowSpanDrugi ,cssStyleDrugi ));
          
            NewTotalRow.Cells.Add(cela(tekst, rowSpan, colSpan, CssStyleDlaTekstu));
            for (int i = 1; i < iloscKolumn; i++)
            {
                try
                {
                    NewTotalRow.Cells.Add(cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!" + idtabeli.ToString().Trim() + "!" + i.ToString().Trim() + "!3')\">" + dane.Rows[idWiersza - 1][i].ToString().Trim() + "</a>", 1, 1, cssStyleDlaTabeli));
                }
                catch 
                {}
            }
            return NewTotalRow;

        }
        public GridViewRow wierszTabeli(DataTable dane,int iloscKolumn, int idWiersza, string idtabeli, string tekst, int colSpan, int rowSpan, string CssStyleDlaTekstu, string cssStyleDlaTabeli)
        {
            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
            NewTotalRow.Cells.Add(cela(tekst, rowSpan, colSpan, CssStyleDlaTekstu));
            for (int i = 1; i < iloscKolumn; i++)
            {
                try
                {
                    NewTotalRow.Cells.Add(cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!" + idtabeli.ToString().Trim() + "!" + i.ToString().Trim() + "!3')\">" + dane.Rows[idWiersza - 1][i].ToString().Trim() + "</a>", 1, 1, cssStyleDlaTabeli));
                }
                catch (Exception ex)
                {}
               
            }
            return NewTotalRow;
        }// end of 

        public GridViewRow wierszTabeli(DataTable dane, int iloscKolumn, int idWiersza, string idtabeli, string tekst, int colSpan, int rowSpan, string CssStyleDlaTekstu, string cssStyleDlaTabeli,bool ostatniaEdytowalna)
        {
            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
            NewTotalRow.Cells.Add(cela(tekst, rowSpan, colSpan, CssStyleDlaTekstu));
            for (int i = 1; i < iloscKolumn; i++)
            {
                try
                {
                    NewTotalRow.Cells.Add(cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!" + idtabeli.ToString().Trim() + "!" + i.ToString().Trim() + "!3')\">" + dane.Rows[idWiersza - 1][i].ToString().Trim() + "</a>", 1, 1, cssStyleDlaTabeli));
                }
                catch (Exception ex)
                { }

            }
            if (ostatniaEdytowalna)
            {
                 NewTotalRow.Cells.Add(cela("<input id = \"Text1\" type = \"text\" />", 1, 1, "borderTopLeft"));
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

        //   tworzenie arkusza excela

        public ExcelWorksheet tworzArkuszwExcle(ExcelWorksheet Arkusz, DataTable daneDoArkusza, int iloscKolumn, int przesunięcieX, int przesuniecieY, bool lp)
        {

            int wiersz = przesuniecieY;
            if (lp)
            {
                przesunięcieX = przesunięcieX + 1;
            }
            foreach (DataRow dR in daneDoArkusza.Rows)
            {
                Arkusz.Cells[wiersz, przesunięcieX].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                Arkusz.Cells[wiersz, przesunięcieX].Value = dR[1].ToString().Trim() + " " + dR[2].ToString().Trim();
                if (lp)
                {
                    Arkusz.Cells[wiersz, przesunięcieX - 1].Style.ShrinkToFit = true;
                    Arkusz.Cells[wiersz, przesunięcieX -1 ].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Green);

                    Arkusz.Cells[wiersz, przesunięcieX - 1].Value = wiersz - przesuniecieY+1;
                }
                for (int i = 3; i < iloscKolumn + przesunięcieX; i++)
                {
                    Arkusz.Cells[wiersz, i-2+ przesunięcieX].Style.ShrinkToFit = true;
                    Arkusz.Cells[wiersz, i-2+ przesunięcieX].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                    try
                    {
                        try
                        {
                            double value = double.Parse(dR[i].ToString().Trim());
                            Arkusz.Cells[wiersz, i - 2 + przesunięcieX].Value = value;
                        }
                        catch 
                        {
                            Arkusz.Cells[wiersz, i].Value = (dR[i].ToString().Trim());
                        }
                    }
                    catch (Exception ex)
                    {
                        cm.log.Error("Excell " + ex.Message);  
                    }
                }
                wiersz++;
            }
            // tu dodać sumę
            return Arkusz;


        }

        public ExcelWorksheet tworzArkuszwExcle(ExcelWorksheet Arkusz, DataTable daneDoArkusza, int iloscKolumn, int przesunięcieX, int przesuniecieY, bool lp,bool suma)
        {

            tworzArkuszwExcle(Arkusz, daneDoArkusza, iloscKolumn, przesunięcieX, przesuniecieY, lp);
            // tu dodać sumę
          
            ExcelWorksheet tymczasowy=   tworzArkuszwExcle(Arkusz, daneDoArkusza, iloscKolumn, przesunięcieX, przesuniecieY, lp);

           int rowik = daneDoArkusza.Rows.Count + 4;
            tymczasowy.Cells[rowik + 2, 1].Value = "Łącznie";
            tymczasowy.Cells[rowik + 2, 1].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
            int przesuniecie = 0;
            if (lp)
            {
                przesuniecie = 1;
            }
            for (int i = 3+przesuniecie; i < iloscKolumn+1+przesuniecie; i++)
            {
               
                object sumObject;
                try
                {
                  
                    string txt = "d_";
                    string digit = i.ToString("D2");
                    txt = txt + digit;

                    sumObject = daneDoArkusza.Compute("Sum(" + txt + ")", "");
                    tymczasowy.Cells[rowik + 2, i - 1].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                    tymczasowy.Cells[rowik + 2, i - 1].Value = double.Parse(sumObject.ToString());
                }
                catch (Exception)
                {
                    tymczasowy.Cells[rowik + 3, i - 1].Value = "0";
                }

            }

            return Arkusz;


        }

        public ExcelWorksheet tworzArkuszwExcle(ExcelWorksheet Arkusz, DataTable daneDoArkusza, int iloscKolumn, int przesunięcieX, int przesuniecieY, bool lp, bool suma,bool stanowisko,bool funkcja, bool nazwiskoiImeieOsobno)
        {
           
            int wiersz = przesuniecieY;
           
            foreach (DataRow dR in daneDoArkusza.Rows)
            {
                int dodatek = 0;
                if (lp)
                {
                    dodatek++;
                    Arkusz.Cells[wiersz, przesunięcieX +dodatek].Style.ShrinkToFit = true;
                    Arkusz.Cells[wiersz, przesunięcieX + dodatek].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                    Arkusz.Cells[wiersz, przesunięcieX + dodatek].Value = wiersz - przesuniecieY + 1;
                   
                }
                if (stanowisko )
                {
                    dodatek++;
                    Arkusz.Cells[wiersz, przesunięcieX + dodatek].Style.ShrinkToFit = true;
                    Arkusz.Cells[wiersz, przesunięcieX + dodatek].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                    try
                    {
                        string value = (dR["stanowisko"].ToString().Trim());
                        Arkusz.Cells[wiersz, przesunięcieX + dodatek].Value = value;
                    }
                    catch (Exception)
                    {
                        Arkusz.Cells[wiersz, przesunięcieX + dodatek].Value = "";
                    }
                }
                if (funkcja)
                {
                    dodatek++;
                    Arkusz.Cells[wiersz, przesunięcieX+dodatek ].Style.ShrinkToFit = true;
                    Arkusz.Cells[wiersz, przesunięcieX+ dodatek].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Green);
                    try
                    {
                        string value = (dR["funkcja"].ToString().Trim());
                        Arkusz.Cells[wiersz, przesunięcieX + dodatek].Value = value;
                    }
                    catch (Exception)
                    {
                        Arkusz.Cells[wiersz, przesunięcieX + dodatek].Value = "";
                    }

                }
                if (nazwiskoiImeieOsobno )
                {
                    dodatek++;
                    try
                    {
                        Arkusz.Cells[wiersz, przesunięcieX + dodatek].Style.ShrinkToFit = true;
                        Arkusz.Cells[wiersz, przesunięcieX + dodatek].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Green);
                        string value = (dR["nazwisko"].ToString().Trim());
                        Arkusz.Cells[wiersz, przesunięcieX + dodatek].Value = value;
                        dodatek++;
                        Arkusz.Cells[wiersz, przesunięcieX + dodatek].Style.ShrinkToFit = true;
                        Arkusz.Cells[wiersz, przesunięcieX + dodatek].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Green);
                        value = (dR["imie"].ToString().Trim());
                        Arkusz.Cells[wiersz, przesunięcieX + dodatek].Value = value;
                    }
                    catch (Exception)
                    {
                        Arkusz.Cells[wiersz, przesunięcieX + dodatek].Value = "";
                    }
                }
                else
                {
                    try
                    {
                        dodatek++;
                        string value = dR["imie"].ToString().Trim() + " " + dR["nazwisko"].ToString().Trim();
                        Arkusz.Cells[wiersz, przesunięcieX +dodatek].Value = value;
                        Arkusz.Cells[wiersz, przesunięcieX + dodatek].Style.ShrinkToFit = true;
                        Arkusz.Cells[wiersz, przesunięcieX + dodatek].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                    }
                    catch 
                    {}
                }
                
                for (int i = 0; i < iloscKolumn ; i++)
                {
                    try
                    {
                        string colunmName = "d_" + i .ToString("D2");
                        try
                        {
                            
                            double value = double.Parse(dR[colunmName].ToString().Trim());
                            Arkusz.Cells[wiersz, i + przesunięcieX+dodatek].Value = value;
                        }
                        catch
                        {
                           
                            Arkusz.Cells[wiersz, i + przesunięcieX + dodatek].Value = (dR[colunmName].ToString().Trim());
                        }
                        Arkusz.Cells[wiersz, przesunięcieX + dodatek+i].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                    }
                    catch (Exception ex)
                    {
                        cm.log.Error("Excell " + ex.Message);
                    }
                }
                wiersz++;
            }
            // tu dodać sumę
            return Arkusz;
           

        }

        public ExcelWorksheet tworzArkuszwExcelPrzestawiony(ExcelWorksheet Arkusz, DataTable daneDoArkusza, int iloscKolumn, int przesunięcieX, int przesuniecieY, bool lp, bool suma, bool stanowisko, bool funkcja, bool nazwiskoiImeieOsobno)
        {

            int wiersz = przesuniecieY;

            foreach (DataRow dR in daneDoArkusza.Rows)
            {
                int dodatek = 0;
                if (lp)
                {
                    dodatek++;
                    Arkusz.Cells[wiersz, przesunięcieX + dodatek].Style.ShrinkToFit = true;
                    Arkusz.Cells[wiersz, przesunięcieX + dodatek].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                    Arkusz.Cells[wiersz, przesunięcieX + dodatek].Value = wiersz - przesuniecieY + 1;

                }
                if (funkcja)
                {
                    dodatek++;
                    Arkusz.Cells[wiersz, przesunięcieX + dodatek].Style.ShrinkToFit = true;
                    Arkusz.Cells[wiersz, przesunięcieX + dodatek].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Green);
                    try
                    {
                        string value = (dR["funkcja"].ToString().Trim());
                        Arkusz.Cells[wiersz, przesunięcieX + dodatek].Value = value;
                    }
                    catch (Exception)
                    {
                        Arkusz.Cells[wiersz, przesunięcieX + dodatek].Value = "";
                    }

                }
                if (stanowisko)
                {
                    dodatek++;
                    Arkusz.Cells[wiersz, przesunięcieX + dodatek].Style.ShrinkToFit = true;
                    Arkusz.Cells[wiersz, przesunięcieX + dodatek].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                    try
                    {
                        string value = (dR["stanowisko"].ToString().Trim());
                        Arkusz.Cells[wiersz, przesunięcieX + dodatek].Value = value;
                    }
                    catch (Exception)
                    {
                        Arkusz.Cells[wiersz, przesunięcieX + dodatek].Value = "";
                    }
                }

                if (nazwiskoiImeieOsobno)
                {
                    dodatek++;
                    try
                    {
                        Arkusz.Cells[wiersz, przesunięcieX + dodatek].Style.ShrinkToFit = true;
                        Arkusz.Cells[wiersz, przesunięcieX + dodatek].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Green);
                        string value = (dR["nazwisko"].ToString().Trim());
                        Arkusz.Cells[wiersz, przesunięcieX + dodatek].Value = value;
                        dodatek++;
                        Arkusz.Cells[wiersz, przesunięcieX + dodatek].Style.ShrinkToFit = true;
                        Arkusz.Cells[wiersz, przesunięcieX + dodatek].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Green);
                        value = (dR["imie"].ToString().Trim());
                        Arkusz.Cells[wiersz, przesunięcieX + dodatek].Value = value;
                    }
                    catch (Exception)
                    {
                        Arkusz.Cells[wiersz, przesunięcieX + dodatek].Value = "";
                    }
                }
                else
                {
                    try
                    {
                        dodatek++;
                        string value = dR["imie"].ToString().Trim() + " " + dR["nazwisko"].ToString().Trim();
                        Arkusz.Cells[wiersz, przesunięcieX + dodatek].Value = value;
                        Arkusz.Cells[wiersz, przesunięcieX + dodatek].Style.ShrinkToFit = true;
                        Arkusz.Cells[wiersz, przesunięcieX + dodatek].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                    }
                    catch
                    { }
                }

                for (int i = 0; i < iloscKolumn; i++)
                {
                    try
                    {
                        string colunmName = "d_" + i.ToString("D2");
                        try
                        {

                            double value = double.Parse(dR[colunmName].ToString().Trim());
                            Arkusz.Cells[wiersz, i + przesunięcieX + dodatek].Value = value;
                        }
                        catch
                        {

                            Arkusz.Cells[wiersz, i + przesunięcieX + dodatek].Value = (dR[colunmName].ToString().Trim());
                        }
                        Arkusz.Cells[wiersz, przesunięcieX + dodatek + i].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                    }
                    catch (Exception ex)
                    {
                        cm.log.Error("Excell " + ex.Message);
                    }
                }
                wiersz++;
            }
            // tu dodać sumę
            return Arkusz;


        }

        public ExcelWorksheet tworzArkuszwExcleBezSedziow(ExcelWorksheet Arkusz, DataTable daneDoArkusza,int iloscwierszy, int iloscKolumn, int przesunięcieX, int przesuniecieY)
        {

            int wiersz = przesuniecieY;
            for (int i = 0; i < iloscwierszy; i++)
            {
                for (int j = 0; j < iloscKolumn; j++)
                {
                    Arkusz.Cells[i+przesuniecieY , przesunięcieX + j].Style.ShrinkToFit = true;
                    Arkusz.Cells[i + przesuniecieY, przesunięcieX + j].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                    try
                    {
                        string value = daneDoArkusza.Rows[i][j].ToString().Trim();
                        Arkusz.Cells[i + przesuniecieY, przesunięcieX + j].Value = value;
                    }
                    catch (Exception)
                    {

                        Arkusz.Cells[i + przesuniecieY, przesunięcieX + j].Value = "";
                    }

                }
            }
            return Arkusz;


        }
        public ExcelWorksheet tworzArkuszwExcleBezSedziow(ExcelWorksheet Arkusz, DataTable daneDoArkusza, int iloscwierszy, int iloscKolumn, int przesunięcieX, int przesuniecieY, bool zerowaKolumna)
        {
            int startowaKolumna = 0;
            if (!zerowaKolumna)
            {
                startowaKolumna = 1;
            }
            int wiersz = przesuniecieY;
            for (int i = 0; i < iloscwierszy; i++)
            {
                for (int j = startowaKolumna; j < iloscKolumn; j++)
                {
                    Arkusz.Cells[i + przesuniecieY, przesunięcieX + j].Style.ShrinkToFit = true;
                    Arkusz.Cells[i + przesuniecieY, przesunięcieX + j].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                    try
                    {
                        string value = daneDoArkusza.Rows[i][j].ToString().Trim();
                       
                            Arkusz.Cells[i + przesuniecieY, przesunięcieX + j].Value = value;
                       
                       
                    }
                    catch (Exception)
                    {
                        
                            Arkusz.Cells[i + przesuniecieY, przesunięcieX + j].Value = "";
                        
                        
                    }

                }
            }
            return Arkusz;


        }

        public void komorkaExcela(ExcelWorksheet Arkusz, int wiersz, int kolumna, string tekst, bool zlaczenie, int rowSpan, int colSpan)
        {
            if (zlaczenie)
            {
                try
                {
                    Arkusz.Cells[wiersz, kolumna, wiersz + rowSpan, kolumna + colSpan].Merge = true;
                }
                catch (Exception)
                {

                    
                }
            }
            Arkusz.Cells[wiersz, kolumna].Style.ShrinkToFit = true;
            Arkusz.Cells[wiersz, kolumna].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
            
            Arkusz.Cells[wiersz, kolumna].Value = tekst;

        }
    }
}