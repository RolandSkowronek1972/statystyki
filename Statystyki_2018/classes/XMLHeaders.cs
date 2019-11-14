using System;
using System.Data;
using System.Web.UI.WebControls;
using System.Text;
using System.Xml;

namespace stat2018
{
    public class XMLHeaders : common
    {
        private tabele Tabele = new tabele();

        public void getHeaderFromXML(string path, System.Web.UI.WebControls.GridView GridViewX)
        {
            if (string.IsNullOrEmpty(path))
            {
                //   return null;
            }
            System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
            DataTable schematNaglowka = new DataTable();
            schematNaglowka.Columns.Add("wiersz", typeof(int));
            schematNaglowka.Columns.Add("kolumna", typeof(int));
            schematNaglowka.Columns.Add("text", typeof(string));
            schematNaglowka.Columns.Add("rowSpan", typeof(int));
            schematNaglowka.Columns.Add("colSpan", typeof(int));
            schematNaglowka.Columns.Add("hv", typeof(string));
            schematNaglowka.Columns.Add("css", typeof(string));
            XmlDocument doc = new XmlDocument();
            doc.Load(path);
            int i = doc.DocumentElement.ChildNodes.Count;
            foreach (XmlNode node in doc.DocumentElement.ChildNodes)
            {
                try
                {
                    string style = string.Empty;
                    int wiersz = int.Parse(node["wiersz"].InnerText);
                    int kolumna = int.Parse(node["kolumna"].InnerText);
                    string text = node["text"].InnerText;
                    int rowspan = int.Parse(node["rowSpan"].InnerText);
                    int colspan = int.Parse(node["colSpan"].InnerText);
                    string hv = node["hv"].InnerText;
                    try
                    {
                        style = node["style"].InnerText;
                    }
                    catch
                    { }

                    DataRow dataRow = schematNaglowka.NewRow();
                    dataRow["text"] = text;
                    dataRow["wiersz"] = wiersz;
                    dataRow["kolumna"] = kolumna;
                    dataRow["rowSpan"] = rowspan;
                    dataRow["colspan"] = colspan;
                    dataRow["hv"] = hv;
                    dataRow["css"] = style;
                    schematNaglowka.Rows.Add(dataRow);
                }
                catch (Exception ex)
                {
                    log.Error("XML Header " + ex.Message);
                }
            }

            try
            {
                int row = 0;
                TableCell HeaderCell = new TableCell();
                GridViewRow HeaderGridRow = null;
                string hv = "h";
                Style stl = new Style();
                foreach (DataRow dR in schematNaglowka.Rows)
                {
                    if (int.Parse(dR["wiersz"].ToString().Trim()) != row)
                    {
                        GridView HeaderGrid = (GridView)sn;
                        HeaderGridRow = Tabele.Grw(sn);
                        row = int.Parse(dR["wiersz"].ToString().Trim());
                        try
                        {
                            hv = dR["hv"].ToString().Trim();
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
                    if (!string.IsNullOrEmpty(dR["css"].ToString().Trim()))
                    {
                        stl.CssClass = stl.CssClass + " " + dR["css"].ToString().Trim();
                    }
                    HeaderCell = new TableCell();
                    HeaderCell.Text = dR["text"].ToString().Trim();
                    HeaderCell.Style.Clear();
                    HeaderCell.ApplyStyle(stl);
                    HeaderCell.ColumnSpan = int.Parse(dR["colSpan"].ToString().Trim());
                    HeaderCell.RowSpan = int.Parse(dR["rowSpan"].ToString().Trim());
                    HeaderGridRow.Cells.Add(HeaderCell);
                    GridViewX.Controls[0].Controls.AddAt(0, HeaderGridRow);
                }
            }
            catch (Exception ex)
            {
                log.Error("tabele.dll->makeHeader: " + ex.Message);
            } // end of try
        }

        public string getHeaderFromXML(string path, string tenPlik)
        {
            if (string.IsNullOrEmpty(path))
            {
                log.Error(tenPlik +" XML Header - brak pliku " );

                return string.Empty ;
            }
            System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
            DataTable schematNaglowka = new DataTable();
            schematNaglowka.Columns.Add("wiersz", typeof(int));
            schematNaglowka.Columns.Add("kolumna", typeof(int));
            schematNaglowka.Columns.Add("text", typeof(string));
            schematNaglowka.Columns.Add("rowSpan", typeof(int));
            schematNaglowka.Columns.Add("colSpan", typeof(int));
            schematNaglowka.Columns.Add("hv", typeof(string));
            schematNaglowka.Columns.Add("css", typeof(string));
            XmlDocument doc = new XmlDocument();
            doc.Load(path);
            int i = doc.DocumentElement.ChildNodes.Count;
            StringBuilder NaglowekTabeli = new StringBuilder();
            NaglowekTabeli.Append("<tr>");
            int tenWiersz = 0;
            foreach (XmlNode node in doc.DocumentElement.ChildNodes)
            {
                try
                {
                    string style = string.Empty;
                    int wiersz = int.Parse(node["wiersz"].InnerText);
                    if (tenWiersz==0)
                    {
                        tenWiersz = wiersz;
                    }
                    int kolumna = int.Parse(node["kolumna"].InnerText);
                    string text = node["text"].InnerText;
                    int rowspan = int.Parse(node["rowSpan"].InnerText);
                    int colspan = int.Parse(node["colSpan"].InnerText);
                    
                    string StyleTxt = string.Empty;
                    string RowspanTxt = string.Empty;
                    string ColspanTxt = string.Empty;
                    try
                    {
                        style = node["style"].InnerText;
                    }
                    catch
                    { }
                    if (!string.IsNullOrEmpty ( style.Trim ()))
                    {
                        StyleTxt = " class='"+ style.Trim() + "' ";
                    }
                    if (rowspan>0)
                    {
                        RowspanTxt = " rowspan='" + rowspan.ToString() + "'";
                    }
                    if (colspan>0)
                    {
                        ColspanTxt = " colspan='" + colspan.ToString() + "'";
                    }
                    if (tenWiersz != wiersz)
                    {
                        NaglowekTabeli.AppendLine("</tr>");
                        NaglowekTabeli.AppendLine("<tr>");
                        tenWiersz = wiersz;

                    }
                    NaglowekTabeli.AppendLine("<td "+StyleTxt+RowspanTxt+ ColspanTxt + " >"+text +"</td>");
                  
                }
                catch (Exception ex)
                {
                    log.Error(tenWiersz +" XML Header " + ex.Message);
                }
            }

            return NaglowekTabeli.ToString();
        }
    }
}
