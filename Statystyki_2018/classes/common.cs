using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace stat2018
{
    public class common
    {
        public string con_str = ConfigurationManager.ConnectionStrings["wap"].ConnectionString;
        public string con_str_wcyw = ConfigurationManager.ConnectionStrings["wcywConnectionString"].ConnectionString;
        public log_4_net log = new log_4_net();

        public string[] splitData(string arg)
        {
            string[] stringSeparators = new string[] { "#" };
            string[] stTab = null;
            stTab = arg.Split(stringSeparators, StringSplitOptions.None);
            return stTab;
        }

        public string podajMiesiac(int numerMiesiaca)
        {
            switch (numerMiesiaca)
            {
                case 1: return "styczeń";
                case 2: return "luty";
                case 3: return "marzec";
                case 4: return "kwieceń";
                case 5: return "maj";
                case 6: return "czerwiec";
                case 7: return "lipiec";
                case 8: return "sierpień";
                case 9: return "wrzesień";
                case 10: return "październik";
                case 11: return "listopad";
                case 12: return "grudzień";
                default:
                    return "";
            }
        }

        public string podajMiesiacRzymski(int numerMiesiaca)
        {
            switch (numerMiesiaca)
            {
                case 1: return "I";
                case 2: return "II";
                case 3: return "III";
                case 4: return "IV";
                case 5: return "V";
                case 6: return "VI";
                case 7: return "VII";
                case 8: return "VIII";
                case 9: return "IX";
                case 10: return "X";
                case 11: return "XI";
                case 12: return "XII";
                default:
                    return "";
            }
        }

        public DataTable getDataTable(string kwerenda, string connStr, DataTable parameters)
        {
            DataSet dataSet = new DataSet();
            using (SqlDataAdapter dataAdapter = new SqlDataAdapter(kwerenda, connStr))
            {
                foreach (DataRow row in parameters.Rows)
                {
                    dataAdapter.SelectCommand.Parameters.AddWithValue(row[0].ToString().Trim(), row[1].ToString().Trim());
                }
                try
                {
                    dataAdapter.Fill(dataSet);
                }
                catch
                { }
            }
            if (dataSet.Tables.Count != 0)
            {
                return dataSet.Tables[0];
            }
            return null;
        } // end of getDataTable

        public DataTable getDataTable(string kwerenda, string connStr)
        {
            //log.Info("Start getDataTable");
            DataTable result = new DataTable();
            var conn = new SqlConnection(connStr);

            DataSet dsKwerendy = new DataSet();
            dsKwerendy = new DataSet();
            try
            {
                //log.Info("Open DB connection");
                conn.Open();
                //log.Info("DB connection is open");
                SqlDataAdapter daMenu = new SqlDataAdapter();
                daMenu.SelectCommand = new SqlCommand(kwerenda, conn);
                //log.Info("Executing querry");
                daMenu.Fill(dsKwerendy);
                //log.Info("Querry is executed");

                conn.Close();
                //log.Info("DB  is closed");

                result = dsKwerendy.Tables[0];
            }
#pragma warning disable CS0168 // The variable 'ex' is declared but never used
            catch (Exception ex)
#pragma warning restore CS0168 // The variable 'ex' is declared but never used
            {
                //log.Error("Error : " + ex.Message);
                conn.Close();
            }

            return result;
        } // end of getDataTable

        public void runQuerry(string kwerenda, string connStr, DataTable parameters)
        {
            //log.Info("runQuerry is started");

            var conn = new SqlConnection(connStr);
            using (SqlCommand sqlCmd = new SqlCommand(kwerenda, conn))
            {
                try
                {
                    //log.Info("Open DB connection");
                    conn.Open();
                    //log.Info("DB connection is open");
                    if (parameters != null)
                    {
                        foreach (DataRow row in parameters.Rows)
                        {
                            sqlCmd.Parameters.AddWithValue(row[0].ToString().Trim(), row[1].ToString().Trim());
                        }
                    }
                    //log.Info("Start querry execution");
                    sqlCmd.ExecuteScalar();
                    //log.Info("Execution done. ");
                    conn.Close();
                    //log.Info("Close DB connection");
                }
                catch (Exception ex)
                {
                    log.Error("Error : " + ex.Message);
                    conn.Close();
                }
            } // end of using
        }

        public void runQuerry(string kwerenda, string connStr)
        {
            //log.Info("runQuerry is started");
            var conn = new SqlConnection(connStr);
            using (SqlCommand sqlCmd = new SqlCommand(kwerenda, conn))
            {
                try
                {
                    //log.Info("Open DB connection");
                    conn.Open();
                    //log.Info("DB connection is open");
                    //log.Info("Start querry execution");
                    sqlCmd.ExecuteScalar();
                    //log.Info("Execution done. ");
                    conn.Close();
                    //log.Info("Close DB connection");
                }
                catch (Exception ex)
                {
                    log.Error("Error runQuerry : " + ex.Message);
                    conn.Close();
                }
            } // end of using
        }

        public string getQuerryValue(string kwerenda, string connStr, DataTable parameters)
        {
            //log.Info("Start getQuerryValue");
            string result = string.Empty;
            using (SqlCommand sqlCmd = new SqlCommand(kwerenda, new SqlConnection(connStr)))
            {
                try
                {
                    //log.Info("Open DB connection");
                    sqlCmd.Connection.Open();
                    //log.Info("DB connection is open");
                    if (parameters != null)
                    {
                        foreach (DataRow row in parameters.Rows)
                        {
                            sqlCmd.Parameters.AddWithValue(row[0].ToString().Trim(), row[1].ToString().Trim());
                        }
                    }
                    //log.Info("Start querry execution");
                    result = sqlCmd.ExecuteScalar().ToString();
                    //log.Info("Execution done, result is: " + result);
                    sqlCmd.Connection.Close();
                    //log.Info("Close DB connection");
                }
                catch (Exception ex)
                {
                    log.Error("Error getQuerryValue : " + ex.Message);
                    sqlCmd.Connection.Close();
                }
            } // end of using
            return result;
        }// end of getQuerryValue

        //==================================================
      
        public DataTable makeParameterTable()
        {
            DataTable parameters = new DataTable();
            parameters.Columns.Add("name", typeof(String));
            parameters.Columns.Add("value", typeof(String));
            return parameters;
        }

        public string odczytajWartosc(string klucz)
        {
            DataTable parameters = makeParameterTable();
            parameters.Rows.Add("@klucz", klucz.Trim());
            return getQuerryValue("SELECT DISTINCT wartosc FROM  konfig WHERE klucz=rtrim(@klucz)", con_str, parameters);
        }

        //====================================================================================================================================
        public bool dostep(string id_wydzialu, string userId)
        {
            DataTable parameters = makeParameterTable();
            parameters.Rows.Add("@id_wydzialu", id_wydzialu.Trim());
            parameters.Rows.Add("@user_id", userId);
            //log.Debug("dostęp User: " + userId);
            //log.Debug("dostęp id_wydzialu: " + id_wydzialu.Trim());
            string odp = getQuerryValue("SELECT COUNT(*) FROM  uprawnienia WHERE  (id_uzytkownika = @user_id) AND (id_wydzialu =@id_wydzialu)", con_str, parameters);
            try
            {
                if (int.Parse(odp) > 0)
                {
                    return true;
                }
            }
            catch (Exception ex)
            {
                log.Error("dostęp - bład " + ex.Message);
            }
            return false;
        }
    } // end of common
}