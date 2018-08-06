using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace stat2018
{
    public class wyszukiwarka
    {

        public common cm = new common();
        public string con_str_wcyw = ConfigurationManager.ConnectionStrings["wcywConnectionString"].ConnectionString;
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
                catch (Exception ex)
                {
                    conn.Close();
                }
            } // end of using



            return result;
        }


        public string PobierzDana(string klucz)
        {
            string result = string.Empty;
            string kwerenda = "SELECT [wartosc]  FROM [konfig] where klucz=@klucz ";
            DataTable parameters = new DataTable();

            SqlCommand sqlCmd;
            var conn = new SqlConnection(con_str);
            using (sqlCmd = new SqlCommand())
            {
                sqlCmd = new SqlCommand(kwerenda, conn);
                try
                {
                    conn.Open();
                    sqlCmd.Parameters.AddWithValue("@klucz", klucz);

                    result = sqlCmd.ExecuteScalar().ToString();
                    conn.Close();

                }
                catch (Exception ex)
                {
                    conn.Close();
                }
            } // end of using

            return result;
        }

        public string PobierzDana2(string klucz)
        {
            string result = string.Empty;
            string kwerenda = "SELECT [wartosc]  FROM [konfig] where rtrim(opis)=@klucz ";
            DataTable parameters = new DataTable();

            SqlCommand sqlCmd;
            var conn = new SqlConnection(con_str);
            using (sqlCmd = new SqlCommand())
            {
                sqlCmd = new SqlCommand(kwerenda, conn);
                try
                {
                    conn.Open();
                    sqlCmd.Parameters.AddWithValue("@klucz", klucz);

                    result = sqlCmd.ExecuteScalar().ToString();
                    conn.Close();

                }
                catch (Exception ex)
                {
                    conn.Close();
                }
            } // end of using

            return result;
        }

        public string PobierzConnectionString(string klucz)
        {
            string result = string.Empty;
            string kwerenda = "SELECT [ConnectionString]  FROM [konfig] where rtrim(opis) =@klucz ";
            DataTable parameters = new DataTable();

            SqlCommand sqlCmd;
            var conn = new SqlConnection(con_str);
            using (sqlCmd = new SqlCommand())
            {
                sqlCmd = new SqlCommand(kwerenda, conn);
                try
                {
                    conn.Open();
                    sqlCmd.Parameters.AddWithValue("@klucz", klucz.Trim());

                    result = sqlCmd.ExecuteScalar().ToString();
                    conn.Close();

                }
                catch (Exception ex)
                {
                    conn.Close();
                }
            } // end of using

            return result;
        }
        public DataTable PobierzKwerendy(string connStr)
        {
            return cm.getDataTable("SELECT distinct   [idKolumny]      ,[kwerenda]       ,[kewrendaPodgladu]  FROM [tbl_ocenaPracownikaKwerendy]", con_str, cm.makeParameterTable());
        }

        public string PobierzKwerendePracownika(string kolumna)
        {
            return cm.getQuerryValue("SELECT        kwerenda FROM tbl_ocenaPracownikaKwerendy WHERE(idKolumny = 1)", con_str, cm.makeParameterTable());
        }


        public string PobierzDana(string klucz, int ident)
        {
            DataTable parameters = cm.makeParameterTable();
            parameters.Rows.Add("@klucz", klucz);
            parameters.Rows.Add("@ident", ident);
            return cm.getQuerryValue("SELECT [wartosc]  FROM [konfig] where klucz=@klucz and ident=@ident", con_str, parameters);
        }


        public DataTable PobierzDane(string klucz)
        {
            string kwerenda = "SELECT [wartosc]  FROM [konfig] where klucz=@klucz ";
            DataTable parameters = cm.makeParameterTable();
            parameters.Rows.Add("@klucz", klucz);
            return cm.getDataTable(kwerenda, con_str, parameters);
        }

        public DataTable PobierzListePracowników(string kwerenda, string connectionString)
        {
            return cm.getDataTable(kwerenda, connectionString);
        }

        public DataTable listaSpraw(string connectionString)
        {
 
            return  cm.getDataTable("select d.nazwisko, d.imie, st.nazwa, (select symbol from repertorium where numer=s.repertorium) rep, s.numer, s.rok  from sprawa s, strona t, dane_strony d, status st where s.czyus = 0 and t.czyus = 0 and s.ident = t.id_sprawy and t.id_danych = d.ident and t.id_statusu = st.ident ", connectionString);
            
        }

        public DataTable listaDniPracownika(string idPracownika, DateTime data1, DateTime data2, string kwerenda, string connectionString)
        {
            DataTable result = new DataTable();


            DataTable parameters = cm.makeParameterTable();

            parameters.Rows.Add("@idPracownika", idPracownika);
            parameters.Rows.Add("@data1", data1);
            parameters.Rows.Add("@data2", data2);
            result = cm.getDataTable(kwerenda, connectionString, parameters);

            return result;

        }

        public DataTable PobierzOpisy(string klucz)
        {
            string connectionString = con_str;
            DataTable result = new DataTable();
            string kwerenda = "SELECT [opis],ident  FROM [konfig] where klucz=@klucz ";
            DataTable parameters = cm.makeParameterTable();
            parameters.Rows.Add("@klucz", klucz);

            result = cm.getDataTable(kwerenda, connectionString, parameters);


            return result;
        }

        public string DaneNaDzien(string kwerenda, string connectionString, string data, string idPracownika)
        {
            
            DataTable parameters = cm.makeParameterTable();
            parameters.Rows.Add("@idPracownika", idPracownika);
            parameters.Rows.Add("@data", data);

            return cm.getQuerryValue ("insert into tbl_statystyki_tbl_x5 (imie,nazwisko,funkcja,stanowisko,id_sedziego,id_dzialu) values (@imie,@nazwisko,@funkcja,@stanowisko,@id_sedziego,@id_dzialu)", con_str, parameters);
            

        }

    }


}