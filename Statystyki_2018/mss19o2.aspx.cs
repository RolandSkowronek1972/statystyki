using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using OfficeOpenXml;


namespace stat2018
{
    public partial class mss19o2 : System.Web.UI.Page
    {
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

            string idTabeli = string.Empty;
            string idWiersza = string.Empty;
            string idWydzialu = (string)(string)Session["id_dzialu"];
            DataTable tabela2 = new DataTable();// ms.generuj_dane_do_tabeli_mss2(int.Parse((string)Session["id_dzialu"]), DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 21);
                                                //wypełnianie lebeli

        }
    }
}