using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace stat2018
{
    public class mss
    {
        public common cm = new common();
        public string con_str = ConfigurationManager.ConnectionStrings["wap"].ConnectionString;

        public bool isLicence(string idWydzial)
        {
            bool result = false;
            var conn = new SqlConnection(con_str);
            using (SqlCommand sqlCmd = new SqlCommand("SELECT DISTINCT licencja FROM   wydzialy_mss WHERE       (ident = @idWydzial)", conn))
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
            return result;
        }

        public string kofUpdate(string id, string nr)
        {
            string result = string.Empty;

            string kwerendaKOF = PobierzDana("kof");
            string ConnectionString = PobierzCS("kof");

            DataTable parameters = cm.makeParameterTable();
            parameters.Rows.Add("@nr", nr.Trim());
            parameters.Rows.Add("@id", id);
            cm.runQuerry("update kof set numer_of = @nr where ident = @id", con_str, parameters);
            return result;
        }

        public string PobierzDana(string klucz)
        {
            DataTable parameters = cm.makeParameterTable();
            parameters.Rows.Add("@klucz", klucz);
            string kwerenda = "SELECT [wartosc]  FROM [konfig] where klucz=@klucz";
            return cm.getQuerryValue(kwerenda, con_str, parameters);
        }

        public string czyIstniejeWpiswKOF(string idSprawy)
        {
            string result = string.Empty;
            DataTable parameters = cm.makeParameterTable();
            parameters.Rows.Add("@idSprawy", idSprawy);
            string kwerenda = "SELECT count (*) FROM kof where id_sprawy=@idSprawy";
            result = cm.getQuerryValue(kwerenda, con_str, parameters);
            return result;
        }

        public string PobierzCS(string klucz)
        {
            string result = string.Empty;
            DataTable parameters = cm.makeParameterTable();
            parameters.Rows.Add("@klucz", klucz);
            string kwerenda = "SELECT [ConnectionString]  FROM [konfig] where klucz=@klucz";
            result = cm.getQuerryValue(kwerenda, con_str, parameters);
            return result;
        }

        public string uzupelnijDaneDoKOF()
        {
            //wczytanie całej tablicy z kof
            //cm.log.Info("KOF: start kasowania rekordów bez przypisanej sprawy z tabeli KOF: " + DateTime.Now.ToString());
            cm.runQuerry("delete from kof where numer_of is null", con_str);

            //cm.log.Info("KOF: start odczytu danych z tabeli KOF: " + DateTime.Now.ToString());
            DataTable kofGlowny = cm.getDataTable("select id_sprawy from kof", con_str);
            //cm.log.Info("KOF: Koniec odczytu danych z tabeli KOF: " + DateTime.Now.ToString());

            //cm.log.Info("KOF: " + "start odczytu danych do KOF ");
            DataTable result = new DataTable();
            result.Columns.Add("kwerenda", typeof(string));
            result.Columns.Add("connectionString", typeof(string));
            string kwerenda = "SELECT  distinct      wartosc, ConnectionString FROM            konfig  WHERE        (klucz = 'kof')";

            DataTable parameters = cm.makeParameterTable();

            DataTable KwerendyDoKOF = cm.getDataTable(kwerenda, con_str, parameters);
            //cm.log.Info("KOF: odczytano " + KwerendyDoKOF.Rows.Count.ToString() + " kwerend z tabeli konfig z kluczem kof.");

            foreach (DataRow dRow in KwerendyDoKOF.Rows)
            {
                //cm.log.Info("KOF: kwerenda z tabeli konfig z kluczem KOF: " + dRow[0].ToString().Trim() + " Connectionstring z tabeli konfig z kluczem KOF: " + dRow[1].ToString().Trim());
                DataTable dane = cm.getDataTable(dRow[0].ToString().Trim(), dRow[1].ToString().Trim());
                if (dane.Rows.Count == 0)
                {
                    //cm.log.Info("KOF: Brak danych w imporcie danych : " + DateTime.Now.ToString());
                    continue;
                }
                //cm.log.Info("KOF: Usunięcie duplikatów między bazą kof a nowo zaimpoertowanymi danymi : " + DateTime.Now.ToString());
                int licznik = 0;
                foreach (DataRow drow2 in from DataRow dRow1 in kofGlowny.Rows from DataRow drow2 in dane.Rows where dRow1[0] == drow2[0] select drow2)
                {
                    dane.Rows.Remove(drow2);
                    licznik++;
                }

                //cm.log.Info("KOF: Zakończono usuwanie duplikatów "+licznik.ToString() +" między bazą kof a nowo zaimportowanymi danymi : " + DateTime.Now.ToString());

                // mapowanie tabeli id_sprawy, wydzial, sygnatura, d_wplywu, strona, pelnomocnik, przeciwko, numer_of

                DataColumn ident = new DataColumn("ident", typeof(Int32));
                DataColumn id_sprawy = new DataColumn("id_sprawy", typeof(Int32));
                DataColumn wydzial = new DataColumn("wydzial", typeof(string));
                DataColumn sygnatura = new DataColumn("sygnatura", typeof(string));
                DataColumn strona = new DataColumn("strona", typeof(string));
                DataColumn pelnomocnik = new DataColumn("pelnomocnik", typeof(string));
                DataColumn przeciwko = new DataColumn("przeciwko", typeof(string));
                DataColumn numer_of = new DataColumn("numer_of", typeof(string));
                DataTable danenaSerwer = new DataTable();
                danenaSerwer.Columns.Add(ident);
                danenaSerwer.Columns.Add(id_sprawy);
                danenaSerwer.Columns.Add(wydzial);
                danenaSerwer.Columns.Add(sygnatura);
                danenaSerwer.Columns.Add(strona);
                danenaSerwer.Columns.Add(pelnomocnik);
                danenaSerwer.Columns.Add(przeciwko);
                danenaSerwer.Columns.Add(numer_of);
                //cm.log.Info("KOF: Do zaimportowania jest :" + dane.Rows.Count.ToString ()+ " wierszy.");

                foreach (DataRow dRowN in dane.Rows)
                {
                    DataRow rowNaSerwer = danenaSerwer.NewRow();
                    rowNaSerwer[0] = 0;
                    rowNaSerwer[1] = dRowN[0];
                    rowNaSerwer[2] = dRowN[1];
                    rowNaSerwer[3] = dRowN[2];
                    rowNaSerwer[4] = dRowN[3];
                    rowNaSerwer[5] = dRowN[4];
                    rowNaSerwer[6] = dRowN[5];
                    rowNaSerwer[7] = dRowN[6];

                    danenaSerwer.Rows.Add(rowNaSerwer);
                }
                // Open the destination connection. In the real world you would
                // not use SqlBulkCopy to move data from one table to the other
                // in the same database. This is for demonstration purposes only.
                using (SqlConnection destinationConnection =
                           new SqlConnection(con_str))
                {
                    destinationConnection.Open();

                    // Set up the bulk copy object.
                    // Note that the column positions in the source
                    // data reader match the column positions in
                    // the destination table so there is no need to
                    // map columns.
                    using (SqlBulkCopy bulkCopy =
                               new SqlBulkCopy(destinationConnection))
                    {
                        bulkCopy.DestinationTableName = "kof";

                        try
                        {
                            //cm.log.Info("KOF: Start zapisu z użyciem metody SQLBulkCopy:  " + DateTime.Now.ToString());

                            // Write from the source to the destination.
                            bulkCopy.WriteToServer(danenaSerwer);
                        }
                        catch (Exception ex)
                        {
                            cm.log.Error("KOF: " + ex.Message);
                        }
                        finally
                        {
                            // Close the SqlDataReader. The SqlBulkCopy
                            // object is automatically closed at the end
                            // of the using block.
                            //cm.log.Info("KOF : zakończono wgrywanie danych do tabeli KOF : " + DateTime.Now.ToString());
                        }
                    }
                }
            }
            return "";
        }

        public string uzupelnijDaneDoKOF2()
        {
            string result = string.Empty;

            string kwerendaKOF = PobierzDana("kof");
            string ConnectionString = PobierzCS("kof");

            DataTable parameters = cm.makeParameterTable();

            DataTable dane = cm.getDataTable(kwerendaKOF, ConnectionString, parameters);
            foreach (DataRow dRow in dane.Rows)
            {
                string idSprawy = dRow[0].ToString().Trim();

                string wydzial = dRow[1].ToString().Trim();
                string sygnatura = dRow[2].ToString().Trim();
                string d_wplywu = dRow[3].ToString().Trim();
                string strona = dRow[4].ToString().Trim();
                string pelnomocnik = dRow[5].ToString().Trim();
                string przeciwko = dRow[6].ToString().Trim();

                if (czyIstniejeWpiswKOF(idSprawy) == "0")
                {
                    //zapisz do kof

                    DataTable parameters2 = cm.makeParameterTable();
                    parameters2.Rows.Add("id_sprawy", idSprawy);
                    parameters2.Rows.Add("wydzial", wydzial);
                    parameters2.Rows.Add("sygnatura", sygnatura);
                    parameters2.Rows.Add("d_wplywu", d_wplywu);
                    parameters2.Rows.Add("strona", strona);
                    parameters2.Rows.Add("pelnomocnik", pelnomocnik);
                    parameters2.Rows.Add("przeciwko", przeciwko);
                    cm.runQuerry("INSERT      INTO     kof( id_sprawy, wydzial, sygnatura, d_wplywu, strona, pelnomocnik, przeciwko) VALUES (@id_sprawy, @wydzial, @sygnatura, @d_wplywu, @strona, @pelnomocnik, @przeciwko)", con_str, parameters2);
                }
            }
            return result;
        }

        public DataTable generuj_dane_do_tabeli_mss2(int id_dzialu, DateTime poczatek, DateTime koniec, int il_kolumn)
        {
            //cm.log.Info("mss: rozpoczęcie popmpowania danych");
            var conn = new SqlConnection(con_str);
            string cs = PobierzConnectionStringMSS(id_dzialu);

            string kwerenda = string.Empty;

            DataTable parameters = cm.makeParameterTable();
            parameters.Rows.Add("@id_dzialu", id_dzialu);
            DataTable dT1 = cm.getDataTable("SELECT [id_wydzial] ,[id_tabeli] ,[id_kolumny],[id_wiersza] ,[kwerenda]  FROM kwerenda_mss where  id_wydzial=@id_dzialu order by id_kolumny", con_str, parameters);
            //cm.log.Info("mss: pobrano "+ dT1.Rows.Count + " kwerend odczytujących dane");

            if (dT1.Rows.Count == 0)
            {
                return null;
            }
            // zaladowanie do tabeli
            DataTable dTResult = new DataTable();
            dTResult.Columns.Add("idWydzial", typeof(string));
            dTResult.Columns.Add("idTabeli", typeof(string));
            dTResult.Columns.Add("idWiersza", typeof(string));
            dTResult.Columns.Add("idKolumny", typeof(string));
            dTResult.Columns.Add("wartosc", typeof(string));

            foreach (DataRow dRow in dT1.Rows)
            {
                DataRow resultRow = dTResult.NewRow();
                //wyciagnij zmienne daną
                string idWydzial = dRow[0].ToString().Trim();
                string idTabeli = dRow[1].ToString().Trim();
                string idKolumny = dRow[2].ToString().Trim();
                string idWiersza = dRow[3].ToString().Trim();
                string kwerendaN = dRow[4].ToString().Trim();
                parameters = cm.makeParameterTable();
                parameters.Rows.Add("@id_dzialu", id_dzialu);
                parameters.Rows.Add("@data_1", poczatek);
                parameters.Rows.Add("@data_2", koniec);
                string wartosc = cm.getQuerryValue(kwerendaN, cs, parameters);

                resultRow[0] = idWydzial.Trim();
                resultRow[1] = idTabeli.Trim();
                resultRow[2] = idWiersza.Trim();
                resultRow[3] = idKolumny.Trim();
                resultRow[4] = wartosc;
                dTResult.Rows.Add(resultRow);
            }

            return dTResult;
        }// end of generuj_dane_do_tabeli_mss

        public string PobierzConnectionStringMSS(int id_dzialu)
        {
            DataTable parameters = cm.makeParameterTable();
            parameters.Rows.Add("@ident", id_dzialu);

            return cm.getQuerryValue("SELECT cs  FROM wydzialy_mss where ident=@ident ", con_str, parameters);
        }

        public bool debug(int wydzial)
        {
            bool result = false;
            DataTable parameters = cm.makeParameterTable();
            parameters.Rows.Add("@ident", wydzial);

            if (cm.getQuerryValue("SELECT debug  FROM wydzialy_mss where ident=@ident ", con_str, parameters) == "1")
            {
                result = true;
            }
            return result;
        }// end of debug

        public string nazwaSadu(string id_sadu)
        {
            DataTable parameters = cm.makeParameterTable();
            parameters.Rows.Add("@ident", id_sadu);

            return cm.getQuerryValue("SELECT sad  FROM wydzialy_mss where ident=@ident ", con_str, parameters);
        }// end of nazwaSadu

        public string podajKwerendePodgladu(int id_dzialu, int id_wiersza, int id_kolumny, string id_tabeli)
        {
            DataTable parameters = cm.makeParameterTable();
            parameters.Rows.Add("@id_tabeli", id_tabeli);
            parameters.Rows.Add("@id_wydzial", id_dzialu);
            parameters.Rows.Add("@id_kolumny", id_kolumny);
            parameters.Rows.Add("@id_wiersza", id_wiersza);

            return cm.getQuerryValue("SELECT distinct podglad FROM kwerenda_mss where id_wydzial=@id_wydzial and id_tabeli=@id_tabeli and id_kolumny=@id_kolumny and id_wiersza=@id_wiersza ", con_str, parameters);
        }

        public DataTable pod_tabela(string cs, string kwerenda, string poczatek, string koniec, string id_sedziego)
        {
            DataTable parameters = cm.makeParameterTable();

            parameters.Rows.Add("@data_1", poczatek);
            parameters.Rows.Add("@data_2", koniec);
            parameters.Rows.Add("@id_sedziego", id_sedziego);

            DataTable dT1 = cm.getDataTable(kwerenda, cs, parameters);
            return dT1;
        }

        public StringBuilder raportTXT(DataTable listaTabelek, DataTable tabela2, string idRaportu, string idSad)
        {
            StringBuilder result = new StringBuilder();
            //  output.AppendLine("Id formularza;Okres;Sąd;Wydział ;Dział;Wiersz;Kolumna;Liczba");

            string idsadu = string.Empty;
            string idWydzialu = idSad;

            try
            {
                foreach (DataRow dRR in listaTabelek.Rows)
                {
                    foreach (DataRow dDR in tabela2.Rows)

                    {
                        string t1 = dDR[1].ToString().Trim();
                        string t2 = dRR[0].ToString().Trim();
                        if ((t1 == t2) && (dDR[4].ToString().Trim() != "0"))
                        {
                            string druga = string.Empty;
                            try
                            {
                                druga = idRaportu.Substring(idRaportu.Length - 5, 5);
                            }
                            catch
                            { }
                            string czwarta = string.Empty;
                            try
                            {
                                czwarta = idSad.Substring(idSad.Length - 2, 2);
                            }
#pragma warning disable CS0168 // The variable 'ecc' is declared but never used
                            catch (Exception ecc)
#pragma warning restore CS0168 // The variable 'ecc' is declared but never used
                            { }
                            idsadu = idSad.Substring(0, 6);
                            string idTabeli = t1;
                            string idWiersza = dDR[2].ToString();
                            string idKolumny = dDR[3].ToString();
                            string wartosc = dDR[4].ToString();
                            string line = string.Empty;
                            //output.AppendLine("Id formularza;Okres;Sąd;Wydział ;Dział;Wiersz;Kolumna;Liczba");
                            //   string line = idRaportu.Text  + ";" + Date1.Date.ToShortDateString().Year.ToString() + Date1.Date.Month.ToString("D2") + ";" + idSad.Text.Trim() + ";" + idSad.Text.Trim() + (string)Session["id_dzialu"] + ";" + idTabeli + ";" + idWiersza + ";" + idKolumny + ";" + wartosc ;
                            try
                            {
                                if (int.Parse(wartosc) != 0)
                                {
                                    line = idRaportu + ";" + druga + ";" + idsadu + ";" + idWydzialu + ";" + idTabeli + ";" + idWiersza + ";" + idKolumny + ";" + wartosc;
                                }
                            }
                            catch
                            { }

                            if (string.IsNullOrEmpty(line) == false)
                            {
                                result.AppendLine(line);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                result.AppendLine(ex.Message);
            }
            return result;
        } //end of raportTXT

        public string wyciagnij_tytulMSS(string tabela, string kolumna, string id_dzialu, string id_wiersza)
        {
            var conn = new SqlConnection(con_str);

            SqlCommand sqlCmd;
            using (sqlCmd = new SqlCommand())
            {
                sqlCmd = new SqlCommand("SELECT  opis FROM  kwerenda_mss where id_tabeli=@tabela and id_kolumny=@kolumna and id_wydzial=@dzial and id_wiersza=@id_wiersza", conn);

                try
                {
                    conn.Open();

                    sqlCmd.Parameters.AddWithValue("@kolumna", kolumna.Trim());
                    sqlCmd.Parameters.AddWithValue("@tabela", tabela.Trim());
                    sqlCmd.Parameters.AddWithValue("@dzial", id_dzialu.Trim());
                    sqlCmd.Parameters.AddWithValue("@id_wiersza", id_wiersza.Trim());
                    string odp = sqlCmd.ExecuteScalar().ToString();

                    conn.Close();
                    return odp;
                }
#pragma warning disable CS0168 // The variable 'ex' is declared but never used
                catch (Exception ex)
#pragma warning restore CS0168 // The variable 'ex' is declared but never used
                {
                    conn.Close();
                    return "";
                }
            }
        }// end of wyciagnij_kwerende
    }
}