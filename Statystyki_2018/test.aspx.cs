using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace stat2018
{
    public partial class test : System.Web.UI.Page
    {
        private tabele tb = new tabele();
        private dataReaders dr = new dataReaders();
        public mss ms = new mss();

        private const int wiersz = 1;
        private const int kolumna = 2;
        private const int tekst = 3;
        private const int rowspan = 4;
        private const int colspan = 5;
        private const int style = 6;

        protected void odswiez()
        {
            string tenPlikNazwa = "aglg2";
            Label2.Text = "";
            string path = Server.MapPath("\\Template\\" + tenPlikNazwa + ".xlsx");

            Label2.Text = File.Exists(path) ? (Label2.Text = Label2.Text + "Plik: " + path + " istnieje ." + Environment.NewLine) : (Label2.Text = Label2.Text + " Plik " + path + " nie istnieje. " + Environment.NewLine);
            path = Server.MapPath("~\\Template\\" + tenPlikNazwa + ".xlsx");
            string tzxt = File.Exists(path) ? (Label3.Text = Label3.Text + "Plik: " + path + " istnieje ." + Environment.NewLine) : (Label3.Text = Label3.Text + " Plik " + path + " nie istnieje. " + Environment.NewLine);
            Label3.Text = tzxt;
        }

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
            catch
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
            /*        GridView1.DataSource = null;
                    GridView1.DataSourceID = null;
                    GridView1.AutoGenerateColumns = true;
                    GridView1.DataSource = przykladowedane;
                    GridView1.DataBind();*/
            //mss5r
        } /*

        protected void generujTabele(string nazwaPliku, string nazwatabeli)
        {
            string excelFilename = string.Empty;

            // czytaj z excela
            var package = new ExcelPackage(new FileInfo(nazwaPliku));
            string nazwaTabeliDanych = nazwatabeli + "_dane";

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
*/

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
                int storid = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "D1").ToString());
            }
        }

        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                //generujTabele("c:\\temp\\mss5r.xlsx", "1.1");
                //generujTabele(path, "1.1");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            StringBuilder sText = new StringBuilder();

            //read excell file
            string path = Server.MapPath("\\msstabele\\aopc2.xlsx");
            DataTable dT = tb.naglowek(path, 1);
            string row = string.Empty;
            foreach (DataRow dR in dT.Rows)
            {
                row = dR[0].ToString().Trim();

                string Text = dR[1].ToString().Trim();
                string ColumnSpan = dR[2].ToString().Trim();
                string RowSpan = dR[3].ToString().Trim();
                //tabelaNaglowkowa.Rows.Add(new Object[] { "5", "TEXT", "COLSPAN", "ROWSPAN", "h", "60" });
                sText.AppendLine("tabelaNaglowkowa.Rows.Add(new Object[] { \"" + row + "\",\"" + Text + "\",\"" + colspan + "\",\"" + RowSpan + "\"});");
                TextBox1.Text = sText.ToString();
            }
            //  odswiez();
        }

        protected IList<int> okreslKomorke(int wierszPoczatkowy, int kolumnaPoczatkowa, int iloscWierszy, int iloscKolumn, ExcelWorksheet worksheet)
        {
            IList<int> wyniki = new List<int>();
            int rowSpan = 0;
            int colSpan = 0;

            bool mergedY = false;

            for (int i = wierszPoczatkowy; i <= iloscWierszy; i++)
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
            for (int j = kolumnaPoczatkowa; j <= iloscKolumn; j++)
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

        protected void naglowekTabeli_gwTabela1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                GridView sn = new GridView();
                DataTable dT = naglowek("\\Template\\otrc.xlsx", 1);
                //  tb.makeHeader(sn, dT, gwTabela1);
            }
        }

        private DataTable naglowek(string plik, int numerArkusza)
        {
            //  string path = Server.MapPath("\\Template\\otrc.xlsx");
            string path = Server.MapPath(plik);
            IList<string> komorki = new List<string>();
            DataTable schematNaglowka = new DataTable();
            schematNaglowka.Columns.Add("wiersz", typeof(int));
            schematNaglowka.Columns.Add("kolumna", typeof(int));
            schematNaglowka.Columns.Add("text", typeof(string));
            schematNaglowka.Columns.Add("rowSpan", typeof(int));
            schematNaglowka.Columns.Add("colSpan", typeof(int));

            var package = new ExcelPackage(new FileInfo(path));

            using (package)
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
                            if (text != null)
                            {
                                schematNaglowka.Rows.Add(komorka);
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
            var max = schematNaglowka.Rows.OfType<DataRow>().Skip(5).Select(row => row["wiersz"]).Max();
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
            return dT_01;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            odczytXML("mss.xml", 12);
        }

        private DataTable schematTabeli()
        {
            DataTable dT = new DataTable();
            dT.Columns.Clear();
            dT.Columns.Add("nrWiersza", typeof(int));
            dT.Columns.Add("nrKolumny", typeof(int));
            dT.Columns.Add("colspan", typeof(int));
            dT.Columns.Add("rowspan", typeof(int));
            dT.Columns.Add("style", typeof(string));
            dT.Columns.Add("text", typeof(string));
            return dT;
        }

        private enum pola
        {
            iloscWieszyNaglowka = 0,
            ilosckolunPrzedIteracja = 1,
            ilosckolunPoIteracji = 2,
            lp = 3,

            //===============
            naglowek = 2,

            tabelaBoczna = 3,

            //nr noda z komorkami
            nodZkomorkami = 4
        }

        private void odczytXML(string sciezka, int idDzialu)
        {
            string path = Server.MapPath("XMLHeaders") + "\\" + sciezka;

            if (!File.Exists(path))
            {
                TextBox1.Text = "błąd ładowania pliku " + path;
                return;
            }
            XmlDocument doc = new XmlDocument();

            int i = doc.DocumentElement.ChildNodes.Count;
            StringBuilder st = new StringBuilder();
            string tekstNadTabela = string.Empty;
            int iloscWierszy = 0;
            string idTabeli = string.Empty;
            int iloscWieszyNaglowka = 0;
            int ilosckolunPrzedIteracja = 0;
            int ilosckolunPoIteracji = 0;
            int Lp = 0;
            bool lp = false;
            DataTable tabelaDanych = ms.generuj_dane_do_tabeli_mss2(idDzialu, DateTime.Now, DateTime.Now, 60);

            foreach (XmlNode node in doc.DocumentElement.ChildNodes)
            {
                DataTable naglowek = new DataTable();
                DataTable tabelaBoczna = new DataTable();
                DataTable komorkiNaglowka = new DataTable();
                DataTable komorkiboczne = new DataTable();

                idTabeli = node.Attributes[0].Value.ToString();
                st.AppendLine(" ####################################################    ");
                st.AppendLine(" id Tabeli " + idTabeli);
                iloscWierszy = int.Parse(node.ChildNodes[0].InnerText);
                tekstNadTabela = node.ChildNodes[1].InnerText;
                naglowek = obslugaTabel(node.ChildNodes[(int)pola.naglowek]);

                if (naglowek != null)
                {
                    iloscWieszyNaglowka = int.Parse(naglowek.Rows[0][(int)pola.iloscWieszyNaglowka].ToString());
                    ilosckolunPrzedIteracja = int.Parse(naglowek.Rows[0][(int)pola.ilosckolunPrzedIteracja].ToString());
                    ilosckolunPoIteracji = int.Parse(naglowek.Rows[0][(int)pola.ilosckolunPoIteracji].ToString());
                    Lp = int.Parse(naglowek.Rows[0][(int)pola.lp].ToString());
                    lp = (Lp == 0);
                    komorkiNaglowka = (DataTable)naglowek.Rows[0][(int)pola.nodZkomorkami];

                    st.AppendLine(" ilosc wierszy [" + iloscWieszyNaglowka.ToString() + "] ilosc kolumn przed iterają [" + ilosckolunPrzedIteracja.ToString() + "] ilosć kolumn po iteracji [" + ilosckolunPoIteracji.ToString() + "] lp " + Lp.ToString());
                    st.AppendLine("Ilosc komorek " + komorkiNaglowka.Rows.Count.ToString());
                }
                else
                {
                    st.AppendLine(" bład przy generowaniu nagłówka    ");
                }
                tabelaBoczna = (obslugaTabel(node.ChildNodes[(int)pola.tabelaBoczna]));

                if (tabelaBoczna != null)
                {
                    komorkiboczne = (DataTable)tabelaBoczna.Rows[0][(int)pola.nodZkomorkami];
                }

                Label tblControl = new Label { ID = "kod01" };
                tblControl.Width = 1150;
                StringBuilder tabelaGlowna = new StringBuilder();
                tabelaGlowna.AppendLine(ms.tworztabeleMSS(idTabeli, komorkiNaglowka, komorkiboczne, tabelaDanych, iloscWieszyNaglowka, iloscWierszy, ilosckolunPrzedIteracja, ilosckolunPoIteracji, idDzialu, lp, tekstNadTabela, "test"));
                tblControl.Text = tabelaGlowna.ToString();
                tablePlaceHolder.Controls.Add(tblControl);
            }
            TextBox1.Text = TextBox1.Text + st.ToString();
        }

        /*
                private DataTable obslugaNaglowka(XmlNode nodNaglowka)
                {
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.AppendLine("Start obsługo nagłowka");
                    int iloscWieszyNaglowka = 0;
                    int ilosckolunPrzedIteracja = 0;
                    int ilosckolunPoIteracji = 0;
                    int lp = 0;
                    try
                    {
                        iloscWieszyNaglowka = int.Parse(nodNaglowka.ChildNodes[0].InnerText);
                        ilosckolunPrzedIteracja = int.Parse(nodNaglowka.ChildNodes[1].InnerText);
                        ilosckolunPoIteracji = int.Parse(nodNaglowka.ChildNodes[2].InnerText);
                        lp = int.Parse(nodNaglowka.ChildNodes[3].InnerText);
                    }
                    catch (Exception ex)
                    {
                    }

                    DataTable naglowek = new DataTable();
                    naglowek.Columns.Add(new DataColumn("iloscWieszyNaglowka", typeof(int)));
                    naglowek.Columns.Add(new DataColumn("ilosckolunPrzedIteracja", typeof(int)));
                    naglowek.Columns.Add(new DataColumn("ilosckolunPoIteracji", typeof(int)));
                    naglowek.Columns.Add(new DataColumn("lp", typeof(int)));
                    naglowek.Columns.Add(new DataColumn("tabela", typeof(DataTable)));

                    DataRow wierszZnaglowkiem = naglowek.NewRow();
                    wierszZnaglowkiem["iloscWieszyNaglowka"] = iloscWieszyNaglowka;
                    wierszZnaglowkiem["ilosckolunPrzedIteracja"] = ilosckolunPrzedIteracja;
                    wierszZnaglowkiem["ilosckolunPoIteracji"] = ilosckolunPoIteracji;
                    wierszZnaglowkiem["lp"] = lp;
                    wierszZnaglowkiem["tabela"] = wygenerujTabele(nodNaglowka.ChildNodes[4]);
                    naglowek.Rows.Add(wierszZnaglowkiem);

                    return naglowek;
                }
                */

        private DataTable obslugaTabel(XmlNode nod)
        {
            if (nod == null)
            {
                return null;
            }
            int iloscWieszy = 0;
            int ilosckolunPrzedIteracja = 0;
            int ilosckolunPoIteracji = 0;
            int lp = 0;
            try
            {
                iloscWieszy = int.Parse(nod.ChildNodes[0].InnerText);
                ilosckolunPrzedIteracja = int.Parse(nod.ChildNodes[1].InnerText);
                ilosckolunPoIteracji = int.Parse(nod.ChildNodes[2].InnerText);
                lp = int.Parse(nod.ChildNodes[3].InnerText);
            }
            catch (Exception ex)
            {
            }

            DataTable naglowek = new DataTable();
            naglowek.Columns.Add(new DataColumn("iloscWieszy", typeof(int)));
            naglowek.Columns.Add(new DataColumn("ilosckolunPrzedIteracja", typeof(int)));
            naglowek.Columns.Add(new DataColumn("ilosckolunPoIteracji", typeof(int)));
            naglowek.Columns.Add(new DataColumn("lp", typeof(int)));
            naglowek.Columns.Add(new DataColumn("tabela", typeof(DataTable)));

            DataRow wierszZnaglowkiem = naglowek.NewRow();
            wierszZnaglowkiem["iloscWieszy"] = iloscWieszy;
            wierszZnaglowkiem["ilosckolunPrzedIteracja"] = ilosckolunPrzedIteracja;
            wierszZnaglowkiem["ilosckolunPoIteracji"] = ilosckolunPoIteracji;
            wierszZnaglowkiem["lp"] = lp;
            if (nod.ChildNodes.Count == 5)
            {
                wierszZnaglowkiem["tabela"] = wygenerujTabele(nod.ChildNodes[4]);
            }
            else
            {
                wierszZnaglowkiem["tabela"] = null;
            }
            naglowek.Rows.Add(wierszZnaglowkiem);

            return naglowek;
        }

        private DataTable wygenerujTabele(XmlNode schemat)
        {
            DataTable tabelaWyjsciowa = schematTabeli();
            foreach (XmlNode komorka in schemat.ChildNodes)
            {
                int wiersz = int.Parse(komorka.ChildNodes[0].InnerText.Trim());
                int kolumna = int.Parse(komorka.ChildNodes[1].InnerText.Trim());
                int rowspan = int.Parse(komorka.ChildNodes[2].InnerText.Trim());
                int colspan = int.Parse(komorka.ChildNodes[3].InnerText.Trim());
                string style = komorka.ChildNodes[4].InnerText.Trim();
                string tekst = komorka.ChildNodes[5].InnerText.Trim();
                //                         W  K  CS RS   style"    text"
                tabelaWyjsciowa.Rows.Add(new Object[] { wiersz, kolumna, rowspan, colspan, style, tekst });
            }
            return tabelaWyjsciowa;
        }
    }
}