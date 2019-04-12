using System.Data;
using System.Text;
using System.Web.UI.WebControls;

namespace stat2018.classes
{
    public class tabeleMSS
    {
        static public DataTable tabelkaMSS()
        {
            DataTable tabMSS = new DataTable();
            tabMSS.Columns.Add(new DataColumn("sekcja", typeof(int)));
            tabMSS.Columns.Add(new DataColumn("wiersz", typeof(int)));
            tabMSS.Columns.Add(new DataColumn("pozycja", typeof(int)));
            tabMSS.Columns.Add(new DataColumn("rowSpan", typeof(int)));
            tabMSS.Columns.Add(new DataColumn("colSpan", typeof(int)));
            tabMSS.Columns.Add(new DataColumn("rozmiartekstu", typeof(int)));
            tabMSS.Columns.Add(new DataColumn("bold", typeof(int)));
            tabMSS.Columns.Add(new DataColumn("italik", typeof(int)));
            tabMSS.Columns.Add(new DataColumn("tekst", typeof(string)));
            return tabMSS;
        }

        static public DataRow komorka()
        {
            DataTable t = tabelkaMSS();
            DataRow dataRow = t.NewRow();
            return dataRow;
        }
        public string tabelaDoWyswietlenia(DataTable tabelaDanych,DataRow daneTabeli)
        {
            StringBuilder builder = new StringBuilder();
            builder.AppendLine("<br/><table style='width: 1150px;'>");
            // sekcja nagłówek

            builder.AppendLine("</table>");
            return builder.ToString();

        }
    }
}