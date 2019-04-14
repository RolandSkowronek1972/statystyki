using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Configuration;
namespace stat2018
{
    public class SsrSso
    {
        public common cm = new common();
        public string con_str = ConfigurationManager.ConnectionStrings["wap"].ConnectionString;

     

        public bool isLicence(string idWydzial)
        {
            bool result = false;


            var conn = new SqlConnection(con_str);
            using (SqlCommand sqlCmd = new SqlCommand("SELECT DISTINCT licencja FROM   wydzialy WHERE        (ident = @idWydzial)", conn))
            {
                try
                {
                    conn.Open();
                    sqlCmd.Parameters.AddWithValue("@idWydzial", idWydzial);

                    if (sqlCmd.ExecuteScalar().ToString().Trim() == "1")
                    {
                        result = true;
                    }
                    conn.Close();

                }
#pragma warning disable CS0168 // The variable 'ex' is declared but never used
                catch (Exception ex)
#pragma warning restore CS0168 // The variable 'ex' is declared but never used
                {
                    conn.Close();
                }
            } // end of using

            conn.Close();

            return result;
        }

        public DataTable getTabData1(string idWydzial, string idZakladki, string idSekcji, string idWiersza, string connectionString, DateTime dataPoczatku, DateTime dataKonca, int idSedziego)
        {

            DataTable dT = new DataTable();
            //section 1
            string query = "SELECT DISTINCT id_kolumny, kwerenda     FROM kwerendy2 WHERE (  id_zakladki =@id_zakladki) AND(id_sekcji = @id_sekcji) AND (id_wydzial = @id_wydzial) AND(id_wiersza = @id_wiersza) order by id_kolumny";

            DataTable result = new DataTable();

            DataTable parameters = new DataTable();
            parameters.Columns.Add("name", typeof(String));
            parameters.Columns.Add("value", typeof(String));
            DataRow parametrRow = parameters.NewRow();
            parameters.Rows.Add("@id_zakladki", idZakladki);
            parameters.Rows.Add("@id_sekcji", idSekcji);
            parameters.Rows.Add("@id_wydzial", idWydzial);
            parameters.Rows.Add("@id_wiersza", idWiersza);

            dT = cm.getDataTable(query, con_str, parameters);

            result.Columns.Add("columna", typeof(String));
            result.Columns.Add("wartosc", typeof(String));

            result.Columns.Clear();
            result.Columns.Add("idKolumny", typeof(String));
            result.Columns.Add("value", typeof(String));
            foreach (DataRow dR in dT.Rows)
            {
                //wyciaganie danych do kolumn
                parameters = new DataTable();
                parameters.Columns.Add("name", typeof(String));
                parameters.Columns.Add("value", typeof(String));
                parametrRow = parameters.NewRow();
                parameters.Rows.Add("@data1", dataPoczatku);
                parameters.Rows.Add("@data2", dataKonca);
                string kwerenda = dR[1].ToString().Trim();
                parameters.Rows.Add("@id_sedziego", idSedziego);
                DataTable ddT = cm.getDataTable(kwerenda, con_str, parameters);
                DataRow ddR = result.NewRow();
                ddR[0] = dR[0].ToString().Trim();
                DataRow dF = ddT.Rows[0];
                ddR[1] = dF[0].ToString();

                result.Rows.Add(ddR);


            }
            return result;
        }

    }
}