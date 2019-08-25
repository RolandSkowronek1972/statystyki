using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Xml;

namespace stat2018
{
    public class XMLHeaders:common
    {
        tabele Tabele = new tabele();
        public void getHeaderFromXML( string path, System.Web.UI.WebControls.GridView GridViewX)
        {
           
            if (string.IsNullOrEmpty (path) )
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

            XmlDocument doc = new XmlDocument();
            doc.Load(path);
            int i = doc.DocumentElement.ChildNodes.Count;
            foreach (XmlNode node in doc.DocumentElement.ChildNodes)
            {

                
                string text = node["text"].InnerText;
                int kolumna = int.Parse(node["kolumna"].InnerText);
                int wiersz = int.Parse(node["wiersz"].InnerText);
                int rowspan = int.Parse(node["rowSpan"].InnerText);
                int colspan = int.Parse(node["colSpan"].InnerText);
                string hv = node["hv"].InnerText;


                DataRow dataRow = schematNaglowka.NewRow();
                dataRow["text"] = text;
                dataRow["wiersz"] = wiersz;
                dataRow["kolumna"] = kolumna;
                dataRow["rowSpan"] = rowspan;
                dataRow["colspan"] = colspan;
                dataRow["hv"] = colspan;
                schematNaglowka.Rows.Add(dataRow);
          
                
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
                        HeaderGridRow = Tabele. Grw(sn);
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
    }
}