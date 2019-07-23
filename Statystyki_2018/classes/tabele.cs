using OfficeOpenXml;
using OfficeOpenXml.Style;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;

namespace stat2018
{
    public class tabele
    {
        private common cm = new common();

        public TableCell HeaderCell_(string text, int columns, int rows)
        {
            TableCell HeaderCell = new TableCell();
            HeaderCell.Text = text;
            HeaderCell.ColumnSpan = columns;
            HeaderCell.RowSpan = rows;
            return HeaderCell;
        }
        public GridViewRow Grw(object sender)
        {
            GridViewRow HeaderGridRow = null;
            GridView HeaderGrid = (GridView)sender;
            HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
            HeaderGridRow.Font.Size = 7;
            HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
            HeaderGridRow.VerticalAlign = VerticalAlign.Top;
            return HeaderGridRow;
        }

        public DataTable makeSumRow(DataTable table, int ilKolumn)
        {
            DataTable wyjsciowa = new DataTable();
            for (int i = 0; i < ilKolumn; i++)
            {
                wyjsciowa.Columns.Add("d_" + i.ToString("D2"), typeof(double));
            }
            DataTable tabelka = tabellaLiczbowa(table);
            object sumObject;
            DataRow wiersz = wyjsciowa.NewRow();
            for (int i = 1; i < ilKolumn; i++)
            {
                try
                {
                    string idkolumny = "d_" + (i).ToString("D2");
                    sumObject = tabelka.Compute("Sum(" + idkolumny + ")", "");
                    wiersz[i] = double.Parse(sumObject.ToString());
                }
                catch (Exception ex)
                {
                    cm.log.Error("sumowanie w stopce : " + ex.Message);
                }
            }
            wyjsciowa.Rows.Add(wiersz);
            return wyjsciowa;
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
                        try
                        {
                            hv = dR[4].ToString().Trim();
                        }
                        catch
                        { }
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
            {
                cm.log.Error("tabele.dll->makeHeader: " + ex.Message);
            } // end of try
        }

        public void makeHeader(DataTable dT, System.Web.UI.WebControls.GridView GridViewX)
        {
            System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
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
                        GridView HeaderGrid = (GridView)sn;
                        HeaderGridRow = Grw(sn);
                        row = int.Parse(dR[0].ToString().Trim());
                        try
                        {
                            hv = dR[4].ToString().Trim();
                        }
                        catch
                        { }
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
            {
                cm.log.Error("tabele.dll->makeHeader: " + ex.Message);
            } // end of try
        }

        public void makeHeaderT3(DataTable dT, System.Web.UI.WebControls.GridView GridViewX)
        {
            System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
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
                        GridView HeaderGrid = (GridView)sn;
                        HeaderGridRow = Grw(sn);
                        row = int.Parse(dR[0].ToString().Trim());
                        try
                        {
                            hv = dR[4].ToString().Trim();
                        }
                        catch
                        { }
                    }
                    if (hv == "v")
                    {
                        stl.CssClass = "spetialVertical";
                    }
                    else
                    {
                        stl.CssClass = "horizontaltext ";
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
            {
                cm.log.Error("tabele.dll->makeHeader: " + ex.Message);
            } // end of try
        }

        public DataTable tabellaLiczbowa(DataTable tabelaWejsciowa)
        {
            if (tabelaWejsciowa == null)
            {
                return null;
            }
            DataTable tabelaRobocza = new DataTable();
            int iloscKolumn = tabelaWejsciowa.Columns.Cast<DataColumn>().Count(c => c.ColumnName.StartsWith("d_"));

            for (int i = 0; i < iloscKolumn; i++)
            {
                string nazwaKolumny = "d_" + i.ToString("D2");
                tabelaRobocza.Columns.Add(nazwaKolumny, typeof(double));
            }
            foreach (DataRow Drow in tabelaWejsciowa.Rows)
            {
                DataRow wierszTymczasowy = tabelaRobocza.NewRow();
                for (int i = 1; i < iloscKolumn; i++)
                {
                    string dana = string.Empty;
                    string nazwaKolumny = "d_" + i.ToString("D2");
                    double liczba = 0;
                    dana = Drow[nazwaKolumny].ToString();
                    try
                    {
                        liczba = double.Parse(dana);
                    }
                    catch (Exception ex)
                    {
                        try
                        {
                            dana = dana.Replace(".", ",");
                            if (string.IsNullOrEmpty(dana))
                            {
                                dana = "0";
                            }
                            liczba = double.Parse(dana);
                        }
                        catch (Exception)
                        {
                            cm.log.Error("tabellaLiczbowa: " + ex.Message + " : " + dana.ToString());
                        }
                    } // end of try
                    wierszTymczasowy[nazwaKolumny] = liczba;
                }
                tabelaRobocza.Rows.Add(wierszTymczasowy);
            }

            return tabelaRobocza;
        }

        public void makeSumRow(DataTable table, GridViewRowEventArgs e, string tenplik)
        {
            cm.log.Error("sumowanie w stopce : " + tenplik);
            makeSumRow(table, e);
        }

        public void makeSumRow(DataTable table, GridViewRowEventArgs e)
        {
            DataTable tabelka = tabellaLiczbowa(table);
            object sumObject;
            int ilKolumn = e.Row.Cells.Count;
            e.Row.Cells[1].Text = "Ogółem";
            for (int i = 1; i < e.Row.Cells.Count - 1; i++)
            {
                try
                {
                    string idkolumny = "d_" + (i).ToString("D2");
                    sumObject = tabelka.Compute("Sum(" + idkolumny + ")", "");
                    e.Row.Cells[i + 1].Text = sumObject.ToString();
                    e.Row.Cells[i + 1].CssClass = "center normal";
                }
                catch (Exception ex)
                {
                    cm.log.Error("sumowanie w stopce : " + ex.Message);
                }
            }
        }
        public void makeSumRow(DataTable table, GridViewRowEventArgs e, int przesuniecie)
        {
            DataTable tabelka = tabellaLiczbowa(table);
            if (tabelka == null)
            {
                return;
            }
            object sumObject;
            int ilKolumn = e.Row.Cells.Count;
            e.Row.Cells[0 + przesuniecie].Text = "Ogółem";
            for (int i = 1; i < e.Row.Cells.Count ; i++)
            {
                try
                {
                    string idkolumny = "d_" + (i).ToString("D2");
                    sumObject = tabelka.Compute("Sum(" + idkolumny + ")", "");
                    e.Row.Cells[i + przesuniecie].Text = sumObject.ToString();
                    e.Row.Cells[i + przesuniecie].CssClass = "center normal";
                }
                catch (Exception ex)
                {
                    cm.log.Error("sumowanie w stopce : " + ex.Message);
                }
            }
        }

        public void makeSumRow(DataTable table, GridViewRowEventArgs e, int przesuniecie, string razem)
        {
            DataTable tabelka = tabellaLiczbowa(table);
            object sumObject;
            int ilKolumn = e.Row.Cells.Count;
            e.Row.Cells[0 + przesuniecie].Text = razem;
            for (int i = 1; i < e.Row.Cells.Count - 1; i++)
            {
                try
                {
                    string idkolumny = "d_" + (i).ToString("D2");
                    sumObject = tabelka.Compute("Sum(" + idkolumny + ")", "");
                    e.Row.Cells[i + przesuniecie].Text = sumObject.ToString();
                    e.Row.Cells[i + przesuniecie].CssClass = "center normal";
                }
                catch (Exception ex)
                {
                    cm.log.Error("sumowanie w stopce : " + ex.Message);
                }
            }
        }

        public void makeSumRow(DataTable table, GridViewRowEventArgs e, int przesuniecie, int polaczenie)
        {
            DataTable tabelka = tabellaLiczbowa(table);
            object sumObject;
            int ilKolumn = e.Row.Cells.Count;
            e.Row.Cells[0].ColumnSpan = polaczenie;
            e.Row.Cells[0].Text = "Ogółem";
            try
            {
                for (int i = 1; i < polaczenie; i++)
                {
                    e.Row.Cells.RemoveAt(1);
                }
            }
            catch
            { }
            for (int i = 1; i < e.Row.Cells.Count - 1; i++)
            {
                try
                {
                    string idkolumny = "d_" + (i).ToString("D2");
                    sumObject = tabelka.Compute("Sum(" + idkolumny + ")", "");
                    e.Row.Cells[i].Text = sumObject.ToString();
                    e.Row.Cells[i].CssClass = "center normal";
                }
                catch (Exception ex)
                {
                    cm.log.Error("sumowanie w stopce : " + ex.Message);
                }
            }
        }

        public GridViewRow PodsumowanieTabeli(DataTable dane, int iloscKolumn, string cssStyleDlaTabeli)
        {
            DataTable tabelka = tabellaLiczbowa(dane);
            object sumObject;
            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
            NewTotalRow.Cells.Add(cela("Razem", 1, 2, cssStyleDlaTabeli));
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
            NewTotalRow.Cells.Add(cela(drugiText, colSpanDrugi, rowSpanDrugi, cssStyleDrugi));

            NewTotalRow.Cells.Add(cela(tekst, rowSpan, colSpan, CssStyleDlaTekstu));
            for (int i = 1; i < iloscKolumn; i++)
            {
                try
                {
                    NewTotalRow.Cells.Add(cela("<a class='normal' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!" + idtabeli.ToString().Trim() + "!" + i.ToString().Trim() + "!3')\">" + dane.Rows[idWiersza - 1][i].ToString().Trim() + "</a>", 1, 1, cssStyleDlaTabeli));
                }
                catch
                { }
            }
            return NewTotalRow;
        }

        public GridViewRow wierszTabeli(DataTable dane, int iloscKolumn, int idWiersza, string idtabeli, string tekst, int colSpan, int rowSpan, string CssStyleDlaTekstu, string cssStyleDlaTabeli)
        {
            if (dane == null)
            {
                return null;
            }
            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
            NewTotalRow.Cells.Add(cela(tekst, rowSpan, colSpan, CssStyleDlaTekstu));
            for (int i = 1; i < iloscKolumn; i++)
            {
                try
                {
                    NewTotalRow.Cells.Add(cela("<a class='" + CssStyleDlaTekstu + "' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!" + idtabeli.ToString().Trim() + "!" + i.ToString().Trim() + "!3')\">" + dane.Rows[idWiersza - 1][i].ToString().Trim() + "</a>", 1, 1, cssStyleDlaTabeli));
                }
                catch
                {
                    try
                    {
                        NewTotalRow.Cells.Add(cela("<a class='" + CssStyleDlaTekstu + "' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!" + idtabeli.ToString().Trim() + "!" + i.ToString().Trim() + "!3')\">0</a>", 1, 1, cssStyleDlaTabeli));
                    }
                    catch
                    { }
                }
            }
            return NewTotalRow;
        }// end of

        public GridViewRow wierszTabeli(DataTable dane, int iloscKolumn, int idWiersza, string idtabeli, string tekst, int colSpan, int rowSpan, string CssStyleDlaTekstu, string cssStyleDlaTabeli, bool ostatniaEdytowalna)
        {
            GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
            NewTotalRow.Cells.Add(cela(tekst, rowSpan, colSpan, CssStyleDlaTekstu));
            for (int i = 1; i < iloscKolumn; i++)
            {
                try
                {
                    NewTotalRow.Cells.Add(cela("<a class='" + CssStyleDlaTekstu + "' href=\"javascript: openPopup('popup.aspx?sesja=" + idWiersza.ToString().Trim() + "!" + idtabeli.ToString().Trim() + "!" + i.ToString().Trim() + "!3')\">" + dane.Rows[idWiersza - 1][i].ToString().Trim() + "</a>", 1, 1, cssStyleDlaTabeli));
                }
                catch
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

        public ExcelWorksheet tworzArkuszwExcle(ExcelWorksheet Arkusz, DataTable daneDoArkusza, int iloscKolumn, int przesunięcieX, int przesuniecieY, bool lp, bool suma)
        {
            if (daneDoArkusza == null)
            {
                return null;
            }
            tworzArkuszwExcle(Arkusz, daneDoArkusza, iloscKolumn, przesunięcieX, przesuniecieY, lp, false);
            // tu dodać sumę

            ExcelWorksheet tymczasowy = tworzArkuszwExcle(Arkusz, daneDoArkusza, iloscKolumn, przesunięcieX, przesuniecieY, lp, false);

            int rowik = daneDoArkusza.Rows.Count + 4;
            tymczasowy.Cells[rowik + 2, 1].Value = "Łącznie";
            tymczasowy.Cells[rowik + 2, 1].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
            int przesuniecie = 0;
            if (lp)
            {
                przesuniecie = 1;
            }
            for (int i = 3 + przesuniecie; i < iloscKolumn + 1 + przesuniecie; i++)
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

        public ExcelWorksheet tworzArkuszwExcle(ExcelWorksheet Arkusz, DataTable daneDoArkusza, int iloscKolumn, int przesunięcieX, int przesuniecieY, bool lp, bool suma, bool stanowisko, bool funkcja, bool nazwiskoiImeieOsobno)
        {
            try
            {
                int wiersz = przesuniecieY;
                int dod = 0;
                foreach (DataRow dR in daneDoArkusza.Rows)
                {
                    int dodatek = 0;
                    if (lp)
                    {
                        try
                        {
                            dodatek++;
                            Arkusz.Cells[wiersz, przesunięcieX + dodatek].Style.ShrinkToFit = true;
                            Arkusz.Cells[wiersz, przesunięcieX + dodatek].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                            Arkusz.Cells[wiersz, przesunięcieX + dodatek].Value = wiersz - przesuniecieY + 1;
                        }
                        catch (Exception ex)
                        {

                            cm.log.Error("tworzArkuszwExcle- lp " + ex.Message);
                        }
                       
                    }
                    if (stanowisko)
                    {
                            try
                        {
                            dodatek++;
                            Arkusz.Cells[wiersz, przesunięcieX + dodatek].Style.ShrinkToFit = true;
                            Arkusz.Cells[wiersz, przesunięcieX + dodatek].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);

                            string value = (dR["stanowisko"].ToString().Trim());
                            Arkusz.Cells[wiersz, przesunięcieX + dodatek].Value = value;
                        }
                        catch (Exception ex)
                        {
                            Arkusz.Cells[wiersz, przesunięcieX + dodatek].Value = "";
                            cm.log.Error("tworzArkuszwExcle- stanowisko " + ex.Message);
                        }
                    }
                    if (funkcja)
                    {
                           try
                        {
                            dodatek++;
                            Arkusz.Cells[wiersz, przesunięcieX + dodatek].Style.ShrinkToFit = true;
                            Arkusz.Cells[wiersz, przesunięcieX + dodatek].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Green);

                            string value = (dR["funkcja"].ToString().Trim());
                            Arkusz.Cells[wiersz, przesunięcieX + dodatek].Value = value;
                        }
                        catch (Exception ex)
                        {
                            Arkusz.Cells[wiersz, przesunięcieX + dodatek].Value = "";
                            cm.log.Error("tworzArkuszwExcle- lp " + ex.Message);
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
                        catch (Exception ex)
                        {
                            Arkusz.Cells[wiersz, przesunięcieX + dodatek].Value = "";
                            cm.log.Error("tworzArkuszwExcle- lp " + ex.Message);
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
                        catch (Exception ex)
                        {
                            cm.log.Error("tworzArkuszwExcle- lp " + ex.Message);
                        }
                    }

                    for (int i = 1; i < iloscKolumn; i++)
                    {
                        try
                        {
                            string colunmName = "d_" + (i).ToString("D2");
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
                    dod = dodatek;
                }

                // tu dodać sumę
                if (suma)
                {
                    DataTable tabelka = tabellaLiczbowa(daneDoArkusza);
                    object sumObject;

                    Arkusz.Cells[wiersz, przesunięcieX + dod].Value = "Razem";
                    Arkusz.Cells[wiersz, przesunięcieX + dod].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                    Arkusz.Cells[wiersz, przesunięcieX + dod].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                    for (int i = 1; i < iloscKolumn; i++)
                    {
                        try
                        {
                            string idkolumny = "d_" + (i).ToString("D2");
                            sumObject = tabelka.Compute("Sum(" + idkolumny + ")", "");
                            Arkusz.Cells[wiersz, i + przesunięcieX + dod].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                            Arkusz.Cells[wiersz, i + przesunięcieX + dod].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                            Arkusz.Cells[wiersz, i + przesunięcieX + dod].Value = (sumObject.ToString());
                        }
                        catch (Exception ecx)
                        {
                            string mes = ecx.Message;
                            Arkusz.Cells[wiersz, i + przesunięcieX + dod].Value = mes;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                cm.log.Error("Excell " + ex.Message);
            }

            return Arkusz;
        }

        public ExcelWorksheet tworzArkuszwExcleOKRR(ExcelWorksheet Arkusz, DataTable daneDoArkusza, int iloscKolumn, int przesunięcieX, int przesuniecieY, bool lp, bool suma, bool stanowisko, bool funkcja, bool nazwiskoiImeieOsobno)
        {
            try
            {
                int wiersz = przesuniecieY;
                int dod = 0;
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

                    for (int i = 1; i < iloscKolumn; i++)
                    {
                        try
                        {
                            string colunmName = "d_" + (i).ToString("D2");
                            try
                            {
                                if (i == 35)
                                {
                                    Arkusz.Cells[wiersz, 35, wiersz, 35 + 3].Merge = true;
                                    double value = double.Parse(dR[colunmName].ToString().Trim());
                                    Arkusz.Cells[wiersz, i + przesunięcieX + dodatek].Value = value;
                                }
                                if (i < 35)
                                {
                                    double value = double.Parse(dR[colunmName].ToString().Trim());
                                    Arkusz.Cells[wiersz, i + przesunięcieX + dodatek].Value = value;
                                }
                                if (i > 38)
                                {
                                    double value = double.Parse(dR[colunmName].ToString().Trim());
                                    Arkusz.Cells[wiersz, i + przesunięcieX + dodatek].Value = value;
                                }
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
                    dod = dodatek;
                }

                // tu dodać sumę
                if (suma)
                {
                    DataTable tabelka = tabellaLiczbowa(daneDoArkusza);
                    object sumObject;

                    Arkusz.Cells[wiersz, przesunięcieX + dod].Value = "Razem";
                    Arkusz.Cells[wiersz, przesunięcieX + dod].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                    Arkusz.Cells[wiersz, przesunięcieX + dod].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                    for (int i = 1; i < iloscKolumn; i++)
                    {
                        try
                        {
                            string idkolumny = "d_" + (i).ToString("D2");
                            sumObject = tabelka.Compute("Sum(" + idkolumny + ")", "");
                            Arkusz.Cells[wiersz, i + przesunięcieX + dod].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                            Arkusz.Cells[wiersz, i + przesunięcieX + dod].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                            Arkusz.Cells[wiersz, i + przesunięcieX + dod].Value = (sumObject.ToString());
                        }
                        catch (Exception ecx)
                        {
                            string mes = ecx.Message;
                            Arkusz.Cells[wiersz, i + przesunięcieX + dod].Value = mes;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                cm.log.Error("Excell " + ex.Message);
            }

            return Arkusz;
        }

        public ExcelWorksheet tworzArkuszwExcelPrzestawiony(ExcelWorksheet Arkusz, DataTable daneDoArkusza, int iloscKolumn, int przesunięcieX, int przesuniecieY, bool lp, bool suma, bool stanowisko, bool funkcja, bool nazwiskoiImeieOsobno)
        {
            int wiersz = przesuniecieY;

            try
            {
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
            }
            catch
            {
            }
            // tu dodać sumę
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
                    Arkusz.Cells[wiersz, kolumna, wiersz + rowSpan, kolumna + colSpan].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
                }
                catch (Exception ex)
                {
                    cm.log.Error("komorkaExcela maerge " + ex.Message);
                }
            }
            Arkusz.Cells[wiersz, kolumna].Style.ShrinkToFit = true;
            Arkusz.Cells[wiersz, kolumna].Style.Border.BorderAround(OfficeOpenXml.Style.ExcelBorderStyle.Thin, System.Drawing.Color.Black);
            Arkusz.Cells[wiersz, kolumna].Value = tekst;
        }

        public DataTable naglowek(string plik, int numerArkusza)
        {
            if (string.IsNullOrEmpty(plik.Trim()))
            {
                return null;
            }
            IList<string> komorki = new List<string>();
            
            DataTable schematNaglowka = new DataTable();
            schematNaglowka.Columns.Add("wiersz", typeof(int));
            schematNaglowka.Columns.Add("kolumna", typeof(int));
            schematNaglowka.Columns.Add("text", typeof(string));
            schematNaglowka.Columns.Add("rowSpan", typeof(int));
            schematNaglowka.Columns.Add("colSpan", typeof(int));

            var package = new ExcelPackage(new FileInfo(plik));
            using (package)
            {
                int iloscZakladek = package.Workbook.Worksheets.Count;
                if (iloscZakladek >= numerArkusza)
                {
                    ExcelWorksheet worksheet = package.Workbook.Worksheets[numerArkusza];

                    int rows = worksheet.Dimension.End.Row;
                    int columns = worksheet.Dimension.End.Column;

                    for (int i = 1; i <= rows; i++)
                    {
                        for (int j = 1; j <= columns; j++)
                        {
                            object baseE = worksheet.Cells[i, j];
                            ExcelCellBase celka = (ExcelCellBase)baseE;

                            bool polaczony = (bool)celka.GetType().GetProperty("Merge").GetValue(celka, null);
                            var kolumny = celka.GetType().GetProperty("Columns").GetValue(celka, null);
                            var wiersze = celka.GetType().GetProperty("Rows").GetValue(celka, null);
                            var text = celka.GetType().GetProperty("Value").GetValue(celka, null);

                            DataRow komorka = schematNaglowka.NewRow();
                            if (polaczony && text != null)
                            {
                                IList<int> lista = okreslKomorke(i, j, rows, columns, worksheet);

                                komorka["wiersz"] = i;
                                komorka["kolumna"] = j;
                                komorka["text"] = text;
                                komorka["colSpan"] = lista[0].ToString();
                                komorka["rowSpan"] = lista[1].ToString();

                                schematNaglowka.Rows.Add(komorka);
                                int k = lista[1];
                                if (k > 1)
                                {
                                    j = (j + k) - 1;
                                }
                            }
                            else
                            {
                                komorka["wiersz"] = i;
                                komorka["kolumna"] = j;
                                komorka["text"] = text;
                                komorka["colSpan"] = 1;
                                komorka["rowSpan"] = 1;
                                if (text != null)
                                {
                                    schematNaglowka.Rows.Add(komorka);
                                }
                            }
                        }
                    }
                }
            }

            DataTable dT_01 = new DataTable();
            dT_01.Columns.Clear();
            dT_01.Columns.Add("Column1", typeof(string));
            dT_01.Columns.Add("Column2", typeof(string));
            dT_01.Columns.Add("Column3", typeof(string));
            dT_01.Columns.Add("Column4", typeof(string));
            dT_01.Columns.Add("Column5", typeof(string));

            // max ilosc wierszy
            var max = schematNaglowka.Rows.OfType<DataRow>().Select(row => row["wiersz"]).Max();

            if (max != null)
            {
                int wiersz = 0;
                for (int i = (int)max; i >= 0; i--)
                {
                    wiersz++;
                    //wyciągnij dane tylko z wierszem
                    string selectString = "wiersz=" + i.ToString();
                    DataRow[] jedenWiersz = schematNaglowka.Select(selectString);
                    foreach (var komorka in jedenWiersz)
                    {
                        dT_01.Rows.Add(new Object[] { wiersz.ToString(), komorka["text"], komorka["rowSpan"], komorka["colSpan"], "h" });
                    }
                }
            }

            return dT_01;
        }

        protected IList<int> okreslKomorke(int wierszPoczatkowy, int kolumnaPoczatkowa, int iloscWierszy, int iloscKolumn, ExcelWorksheet worksheet)
        {
            IList<int> wyniki = new List<int>();
            int rowSpan = 0;
            int colSpan = 0;

            bool mergedY = false;

            for (int i = wierszPoczatkowy; i <= iloscWierszy + 1; i++)
            {
                object baseE = worksheet.Cells[i, kolumnaPoczatkowa];

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
            for (int j = kolumnaPoczatkowa; j <= iloscKolumn + 1; j++)
            {
                object baseE = worksheet.Cells[wierszPoczatkowy, j];

                ExcelCellBase celka = (ExcelCellBase)baseE;
                bool polaczony = (bool)celka.GetType().GetProperty("Merge").GetValue(celka, null);
                var text = celka.GetType().GetProperty("Value").GetValue(celka, null);
                if (!polaczony)
                {
                    break;
                }
                else
                {
                    if (mergedX)
                    {
                        if (text != null)
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

        public DataTable SchematTabelinaglowkowej()
        {
            DataTable tabelaNaglowkowa = new DataTable();
            tabelaNaglowkowa.Columns.Clear();
            tabelaNaglowkowa.Columns.Add("Column1", typeof(string));
            tabelaNaglowkowa.Columns.Add("Column2", typeof(string));
            tabelaNaglowkowa.Columns.Add("Column3", typeof(string));
            tabelaNaglowkowa.Columns.Add("Column4", typeof(string));
            tabelaNaglowkowa.Columns.Add("Column5", typeof(string));
            tabelaNaglowkowa.Columns.Add("Column6", typeof(string));
            return tabelaNaglowkowa;
        }

        public string komorkaHTML(string text, int colspan, int rowspan, string style)
        {
            StringBuilder builder = new StringBuilder();
            builder.Append("<td ");
#pragma warning disable CS0472 // The result of the expression is always 'true' since a value of type 'bool' is never equal to 'null' of type 'bool?'
            if (string.IsNullOrEmpty(style.Trim()) != null)
#pragma warning restore CS0472 // The result of the expression is always 'true' since a value of type 'bool' is never equal to 'null' of type 'bool?'
            {
                builder.Append(" class='" + style + "' ");
            }
            if (rowspan > 0)
            {
                builder.Append(" rowspan='" + rowspan + "' ");
            }
            if (colspan > 0)
            {
                builder.Append(" colspan='" + colspan + "' ");
            }
            builder.AppendLine(">");
            builder.AppendLine("<p>" + text + "</p>");
            builder.AppendLine("</td>");
            return builder.ToString();
        }
    }
}