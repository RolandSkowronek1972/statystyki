using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Linq;

namespace stat2018
{

    public class dataReaders
    {
        public common Common = new common();
        public Class1 cl = new Class1();
        public string con_str = ConfigurationManager.ConnectionStrings["wap"].ConnectionString;
        public string con_str_wcyw = ConfigurationManager.ConnectionStrings["wcywConnectionString"].ConnectionString;
        public log4net.ILog log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        public string[] splitData(string arg)
        {
            string[] stringSeparators = new string[] { "#" };
            string[] stTab = null;
            stTab = arg.Split(stringSeparators, StringSplitOptions.None);
            return stTab;
        }



        string getColumnName(int i)
        {
            string txt = string.Empty;
            if (i < 10)
            {
                txt = "d_0" + i.ToString().Trim();
            }
            else
            {
                txt = "d_" + i.ToString().Trim();
            }
            return txt;
        }
        //====================================================================================================================================
  

        
    
        public DataSet pod_tabela(string cs, string kwerenda, string poczatek, string koniec, string id_sedziego)
        {
            var conn = new SqlConnection(cs);
            DataSet dsMenu = new DataSet();
            if (id_sedziego == null) { id_sedziego = "0"; }
            try
            {
                conn.Open();
                SqlDataAdapter daMenu = new SqlDataAdapter();
                daMenu.SelectCommand = new SqlCommand(kwerenda, conn);
                daMenu.SelectCommand.Parameters.AddWithValue("@data_1", poczatek);
                daMenu.SelectCommand.Parameters.AddWithValue("@data_2", koniec);
                daMenu.SelectCommand.Parameters.AddWithValue("@id_sedziego", id_sedziego);
                daMenu.Fill(dsMenu);
                conn.Close();
                return dsMenu;
            }
            catch (Exception ex)
            {
                conn.Close();
            }

            return null;
        }

       
    
   
        public string podajKwerende_wiersza_przestawnego(int id_dzialu, int id_wiersza, int id_tabeli, int id_kolumny, int pozycja)
        {
            //xxx
            var conn = new SqlConnection(con_str);
            SqlCommand sqlCmd = new SqlCommand();
            string result = string.Empty;
            using (sqlCmd = new SqlCommand())
            {
                sqlCmd = new SqlCommand("SELECT distinct kwerenda FROM kwerendy where id_wydzial=@id_wydzial and id_tabeli=@id_tabeli and id_kolumny=@id_kolumny and id_wiersza=@id_wiersza and pozycja=@pozycja ", conn);
                try
                {
                    conn.Open();

                    sqlCmd.Parameters.AddWithValue("@id_wydzial", id_dzialu);
                    sqlCmd.Parameters.AddWithValue("@id_kolumny", id_kolumny);
                    sqlCmd.Parameters.AddWithValue("@id_wiersza", id_wiersza);
                    sqlCmd.Parameters.AddWithValue("@id_tabeli", id_tabeli);
                    sqlCmd.Parameters.AddWithValue("@pozycja", pozycja);
                    string odp = sqlCmd.ExecuteScalar().ToString().Trim();
                    conn.Close();
                    return odp;

                }
                catch (Exception ex)
                {
                    conn.Close();
                    result = string.Empty;
                }
            }

            return result;
        }

        public string podajKwerende(int id_dzialu, int id_wiersza, int id_kolumny, int id_tabeli)
        {
            
            DataTable parameters = Common.makeParameterTable ();
            parameters.Rows.Add("@id_wydzial", id_dzialu);
            parameters.Rows.Add("@id_tabeli", id_tabeli);
            parameters.Rows.Add("@id_wiersza", id_wiersza);
            parameters.Rows.Add("@id_kolumny", id_kolumny);
            

            return  Common.getQuerryValue("SELECT distinct kwerenda FROM kwerendy where id_wydzial = @id_wydzial and id_tabeli = @id_tabeli and id_kolumny = @id_kolumny and id_wiersza = @id_wiersza", con_str, parameters);
            
        }

        public string podajKwerendePodgladu(int id_dzialu, int id_wiersza, int id_kolumny, int id_tabeli)
        {

            DataTable parameters = Common.makeParameterTable();
            parameters.Rows.Add("@id_wydzial", id_dzialu);
            parameters.Rows.Add("@id_tabeli", id_tabeli);
            parameters.Rows.Add("@id_wiersza", id_wiersza);
            parameters.Rows.Add("@id_kolumny", id_kolumny);


            return Common.getQuerryValue("SELECT distinct podglad FROM kwerendy where id_wydzial=@id_wydzial and id_tabeli=@id_tabeli and id_kolumny=@id_kolumny and id_wiersza=@id_wiersza", con_str, parameters);

        }

  

        public string wyciagnijDaneNt(string kw, DateTime poczatek, DateTime koniec, string cs)
        {
            DataTable parameters = Common.makeParameterTable();
            parameters.Rows.Add("@data_1", poczatek);
            parameters.Rows.Add("@data_2", koniec);

            return Common.getQuerryValue(kw, cs, parameters);
            
        }


 
        public void updateWiersz(int kolumna, int id, string opis, int id_tabeli)
        {
            var conn = new SqlConnection(con_str);
            SqlCommand sqlCmd;

            string txt = "d_";
            txt = getColumnName(kolumna);

            // skasowanie tabeli i wcyw

            using (sqlCmd = new SqlCommand())
            {
                sqlCmd = new SqlCommand("update tbl_statystyki_tbl_01 set " + txt + "=@opis where id_=@id and id_tabeli=@id_tabeli", conn);
                try
                {
                    conn.Open();
                    sqlCmd.Parameters.AddWithValue("@id_tabeli", id_tabeli);
                    sqlCmd.Parameters.AddWithValue("@opis", opis);
                    sqlCmd.Parameters.AddWithValue("@id", id);
                    sqlCmd.ExecuteScalar();
                    conn.Close();
                }
                catch (Exception ex)
                { }
            }
        }

        public void deleteRowTable()
        {
            var conn = new SqlConnection(con_str);
            SqlCommand sqlCmd;

            // skasowanie tabeli i wcyw

            using (sqlCmd = new SqlCommand())
            {
                sqlCmd = new SqlCommand("delete from  tbl_statystyki_tbl_01", conn);
                try
                {
                    conn.Open();
                    sqlCmd.ExecuteScalar();
                    conn.Close();
                }
                catch (Exception ex)
                { }
            }

        }// end of deleteRowTable

      
   
    
        public DataTable generuj_dane_do_tabeli_wierszy2018(DateTime poczatek, DateTime koniec, string id_dzialu, int id_tabeli,int iloscWierszy,int iloscKolumn,string tenPlik)

        {
            /*roznica w stosunku do wersji bez NT polega na tym ze wszystkie kwerendy są zaczytywane jednocześnie a potem tylko 
            zaciągane z datasetu
            struktura datasetu
            - wiersz, kolumna, kwerenda
            - kwerenda: SELECT id_wiersza, id_kolumny, kwerenda  FROM kwerendy  where id_wydzial=@id_wydzial and  id_tabeli=@id_tabeli
            */
            string kod = " DR0003";

            Common.log.Info(tenPlik + kod +"-> : rozpoczęcie tworzenia tabeli z danymi");
            DataTable outputTable = new DataTable();
            for (int i = 1; i <= iloscKolumn+1; i++)
            {
                outputTable.Columns.Add("d"+i.ToString ("D2").Trim (), typeof(string));
                outputTable.Columns["d" + i.ToString("D2").Trim()].DefaultValue = "0";
            }
            
            DataTable kwerendy = new DataTable();
            DataTable parameters = Common.makeParameterTable();
            
            DataRow parametrRow = parameters.NewRow();
            parameters.Rows.Add("@id_wydzial", id_dzialu);
            parameters.Rows.Add("@id_tabeli", id_tabeli);

            Common.log.Info(tenPlik + kod + "-> : odczyt kwerend");
            DataTable ddT = Common.getDataTable("SELECT id_wiersza, id_kolumny, kwerenda  FROM kwerendy  where id_wiersza>0 and id_kolumny>0 and id_wydzial=@id_wydzial and  id_tabeli=@id_tabeli", con_str, parameters);
            if (ddT.Rows.Count==0)
            {
                Common.log.Info(tenPlik + kod + "-> : odczyt kwerend: brak kwerend do doczytu danych");
                return null;
            }
            string cs = cl.podajConnectionString(int.Parse(id_dzialu));
            for (int i = 1; i <= iloscWierszy; i++) //po wierszach
            {
                DataRow dR = outputTable.NewRow();
                for (int j = 1; j <= iloscKolumn; j++)//po kolumnach
                {
                    try
                    {
                        string selectString = "id_wiersza=" + i + " and " + "id_kolumny=" + j;
                        DataRow[] foundRows;
                        foundRows = ddT.Select(selectString);
                        if (foundRows.Count()!=0)
                     /*   {
                            dR[j] = "0";
                        }
                        else*/
                        {
                            DataRow dr = foundRows[0];
                            string kw = dr[2].ToString();
                            //wpisanie danych

                            dR[j] = wyciagnijDaneNt(kw, poczatek, koniec, cs);
                        }
                       
                       
                    }
                    catch (Exception ex)
                    {
                        dR[j] = "0";
                    }
                }
                outputTable.Rows.Add(dR);
            }
            return outputTable;

        }// end of generuj_dane_do_tabeli

     
        public DataTable generuj_dane_do_tabeli_przestawnych(int id_dzialu, int id_tabeli, DateTime poczatek, DateTime koniec)
        {

            DataTable tab_1000 = new DataTable();
            tab_1000.Columns.Add("id_sedziego", typeof(int));
            tab_1000.Columns.Add("opis", typeof(String));

            tab_1000.Columns.Add("d_01", typeof(int));
            tab_1000.Columns.Add("d_02", typeof(int));
            tab_1000.Columns.Add("d_03", typeof(int));
            tab_1000.Columns.Add("d_04", typeof(int));
            tab_1000.Columns.Add("d_05", typeof(int));
            tab_1000.Columns.Add("d_06", typeof(int));
            tab_1000.Columns.Add("d_07", typeof(int));
            tab_1000.Columns.Add("id_tabeli", typeof(int));
            /*tab_1000.Columns.Add("d_08", typeof(int));
            tab_1000.Columns.Add("d_09", typeof(int));
            tab_1000.Columns.Add("d_10", typeof(int));
            */
            string status = string.Empty;
            status = status + "pompowanie danch do tabeli: " + id_tabeli.ToString() + "<br>";
            var conn = new SqlConnection(con_str);
            string kwerenda = string.Empty;
            DataTable parameters = new DataTable();
            parameters.Columns.Add("name", typeof(String));
            parameters.Columns.Add("value", typeof(String));

            DataRow parametrRow = parameters.NewRow();
            parameters.Rows.Add("@id_dzialu", id_dzialu);
            parameters.Rows.Add("@id_tabeli", id_tabeli);


            DataTable ddT = Common.getDataTable("SELECT distinct id_kolumny,[kwerenda] FROM [kwerendy] where id_tabeli=@id_tabeli and id_wydzial=@id_dzialu order by id_kolumny", con_str, parameters);
            int il_wierszy = 0;
            try
            {
                il_wierszy = ddT.Rows.Count;
            }
            catch { }
            string cs = cl.PobierzConnectionString(id_dzialu);
            if (il_wierszy == 0)
            {
                // brak kwerend odcztującch
                status = status + "brak kwerend odcztujących" + "<br>";
            }
            else
            {
                // sa kwerendy
                status = status + "są kwerendy odcztujące, il: " + ddT.Rows.Count.ToString() + "<br>";
                //getTable
                int rowId = 0;
                try
                {
                    foreach (DataRow dRow in ddT.Rows)
                    {
                        rowId++;
                        string id_kol = dRow[0].ToString().Trim();
                        string kwe = dRow[1].ToString().Trim();

                        ////############################################  ladowanie danych tabela 2 ##############################
                        // odczyt sedziów 
                        parameters = new DataTable();
                        parameters.Columns.Add("name", typeof(String));
                        parameters.Columns.Add("value", typeof(String));

                        parameters.Rows.Add("@id_dzialu", id_dzialu);
                        parameters.Rows.Add("@id_tabeli", id_tabeli);
                        parameters.Rows.Add("@data_1", poczatek);
                        parameters.Rows.Add("@data_2", koniec);

                        ddT = Common.getDataTable(kwe, cs, parameters);
                        //pętla ładująca dane dane sedzw
                        int lp = 0;
                        foreach (DataRow dR in ddT.Rows)
                        {

                            switch (id_kol)
                            {
                                case "0":
                                    {
                                        lp++;
                                        DataRow dRN = tab_1000.NewRow();

                                        dRN[1] = dR[1].ToString().Trim() + " " + dR[2].ToString().Trim();
                                        dRN[0] = dR[0].ToString().Trim();
                                        dRN[2] = 0;
                                        dRN[3] = 0;
                                        dRN[4] = 0;
                                        dRN[5] = 0;
                                        dRN[6] = 0;
                                        dRN[7] = 0;
                                        dRN[8] = 0;
                                        dRN[9] = id_tabeli;
                                        tab_1000.Rows.Add(dRN);
                                        // załadowanie danych do pierwszych kolumn
                                    }
                                    break;

                                default:
                                    {
                                        //++++++++++++++++
                                        try
                                        {
                                            DataRow[] result = tab_1000.Select("id_sedziego = " + dR[1].ToString().Trim());
                                            foreach (DataRow row in result)
                                            {
                                                DataRow newRow = tab_1000.NewRow();
                                                for (int i = 0; i < 8; i++)
                                                {
                                                    newRow[i] = row[i];
                                                }
                                                // newRow = row;
                                                tab_1000.Rows.Remove(row);// wywala rowa


                                                //   newRow.BeginEdit();
                                                newRow[int.Parse(id_kol) + 1] = dR[0].ToString().Trim();

                                                // newRow.AcceptChanges();
                                                tab_1000.Rows.Add(newRow);
                                            }


                                        }
                                        catch
                                        { }


                                        //++++++++++++++++++


                                    }
                                    break;
                            }
                        }

                    }
                }
                catch (Exception ex)
                { }//end of try
            }// end of if 


            return tab_1000;

        }// end of generuj_dane_do_tabeli_3
        public string PodajKolumne(int idSedziego)
        {
            var conn = new SqlConnection(con_str);
            SqlCommand sqlCmd;

            string status = string.Empty;
            using (sqlCmd = new SqlCommand())
            {
                try
                {
                    conn.Open();
                    sqlCmd = new SqlCommand("SELECT (select ident FROM [tbl_statystyki_tbl_x5] where id_sedziego=@sedzia)-min(ident)  FROM [tbl_statystyki_tbl_x5]", conn);
                    sqlCmd.Parameters.AddWithValue("@sedzia", idSedziego);
                    return sqlCmd.ExecuteScalar().ToString().Trim();

                }
                catch (Exception ex)
                {

                    conn.Close();
                    status = status + "Bład uzupełnienia funkcji " + "<br>" + ex.Message + "<br>";
                }
                try
                {
                    conn.Open();
                    sqlCmd = new SqlCommand("update tbl_statystyki_tbl_x5 set stanowisko=(SELECT   rtrim([nazwa]) FROM funkcje  where [rodzaj]=2 and ident=tbl_statystyki_tbl_x5.stanowisko)", conn);
                    sqlCmd.ExecuteScalar();
                    conn.Close();
                }
                catch (Exception ex)
                {

                    conn.Close();
                    status = status + "Bład uzupełnienia stanowiska " + "<br>" + ex.Message + "<br>";
                }
            }
            return status;
        }
        public string uzupelnij_statusy_Xl()
        {
            var conn = new SqlConnection(con_str);
            SqlCommand sqlCmd;

            string status = string.Empty;
            using (sqlCmd = new SqlCommand())
            {
                try
                {
                    conn.Open();
                    sqlCmd = new SqlCommand("update tbl_statystyki_tbl_x5 set funkcja=(SELECT   rtrim([nazwa]) FROM [funkcje]  where [rodzaj]=1 and ident=tbl_statystyki_tbl_x5.funkcja)", conn);
                    sqlCmd.ExecuteScalar();
                    sqlCmd = new SqlCommand("update tbl_statystyki_tbl_x5 set stanowisko=(SELECT   rtrim([nazwa]) FROM [funkcje]  where [rodzaj]=2 and ident=tbl_statystyki_tbl_x5.stanowisko)", conn);
                    sqlCmd.ExecuteScalar();
                    conn.Close();
                }
                catch (Exception ex)
                {

                    conn.Close();
                    status = status + "Bład uzupełnienia funkcji " + "<br>" + ex.Message + "<br>";
                }
                try
                {
                    conn.Open();
                    sqlCmd = new SqlCommand("update tbl_statystyki_tbl_x5 set stanowisko=(SELECT   rtrim([nazwa]) FROM funkcje  where [rodzaj]=2 and ident=tbl_statystyki_tbl_x5.stanowisko)", conn);
                    sqlCmd.ExecuteScalar();
                    conn.Close();
                }
                catch (Exception ex)
                {

                    conn.Close();
                    status = status + "Bład uzupełnienia stanowiska " + "<br>" + ex.Message + "<br>";
                }
            }
            return status;
        }
        public string uzupelnij_statusy()
        {
            var conn = new SqlConnection(con_str);
            SqlCommand sqlCmd;

            string status = string.Empty;
            using (sqlCmd = new SqlCommand())
            {
                try
                {
                    conn.Open();
                    sqlCmd = new SqlCommand("update tbl_statystyki_tbl_02 set funkcja=(SELECT   rtrim([nazwa]) FROM [funkcje]  where [rodzaj]=1 and ident=tbl_statystyki_tbl_02.funkcja)", conn);
                    sqlCmd.ExecuteScalar();
                    sqlCmd = new SqlCommand("update tbl_statystyki_tbl_02 set stanowisko=(SELECT   rtrim([nazwa]) FROM [funkcje]  where [rodzaj]=2 and ident=tbl_statystyki_tbl_02.stanowisko)", conn);
                    sqlCmd.ExecuteScalar();
                    conn.Close();
                }
                catch (Exception ex)
                {

                    conn.Close();
                    status = status + "Bład uzupełnienia funkcji " + "<br>" + ex.Message + "<br>";
                }

            }
            return status;
        }

        public string clear_maim_db()
        {
            string status = string.Empty;

            // skasowanie tabeli i wcyw
            status = status + "Kasowanie tabeli tbl_statystyki_tbl_02" + "<br>";

            Common.runQuerry("delete from  tbl_statystyki_tbl_02", con_str, null);
            Common.runQuerry("delete from  tbl_statystyki_tbl_01", con_str, null);

            status = status + "Tabela tbl_statystyki_tbl_02 skasowana" + "<br>";

            return status;
        }// end of clear_maim_db

        public string clear_maim_db_xl()
        {
            Common.runQuerry("delete from  tbl_statystyki_tbl_x5", con_str, null);
            return "";
        }// end of clear_maim_db

        public bool debug(int wydzial)
        {
            var conn = new SqlConnection(con_str);
            SqlCommand sqlCmd;

            // skasowanie tabeli i wcyw

            using (sqlCmd = new SqlCommand())
            {

                sqlCmd = new SqlCommand("SELECT debug FROM  wydzialy where ident=@ident", conn);
                try
                {
                    conn.Open();
                    sqlCmd.Parameters.AddWithValue("@ident", wydzial);
                    string odp = sqlCmd.ExecuteScalar().ToString();
                    conn.Close();
                    if (odp == "1")
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                catch
                {

                }
            } // end of using

            return false;
        }// end of debug

        public string nazwaSadu(string id_sadu)
        {
            var conn = new SqlConnection(con_str);
            SqlCommand sqlCmd;



            // skasowanie tabeli i wcyw

            using (sqlCmd = new SqlCommand())
            {

                sqlCmd = new SqlCommand("SELECT  sad FROM     wydzialy where ident=@id_sadu", conn);
                try
                {
                    conn.Open();
                    sqlCmd.Parameters.AddWithValue("@id_sadu", id_sadu);
                    string odp = sqlCmd.ExecuteScalar().ToString();
                    conn.Close();
                    return odp;

                }
                catch
                {

                }
            } // end of using

            return "";
        }// end of nazwaSadu

 
        public string generuj_dane_do_tabeli_(int id_dzialu, int id_tabeli, DateTime poczatek, DateTime koniec, string plik)
        {

            Common.log.Debug("Początek przetwarzania danych w pliku" + plik + " identyfikator tabeli: " + id_tabeli);
            string odp = generuj_dane_do_tabeli_(id_dzialu, id_tabeli, poczatek, koniec);
            Common.log.Debug("Koniec przetwarzania danych w pliku" + plik + " identyfikator tabeli: " + id_tabeli);
            return odp;
        }
        public string generuj_dane_do_tabeli_(int id_dzialu, int id_tabeli, DateTime poczatek, DateTime koniec)
        {
            string kod = "Dr00001 ";
            string status = string.Empty;
            Common.log.Info(kod + "pompowanie danch do tabeli: " + id_tabeli.ToString());
            var conn = new SqlConnection(con_str);
            string kwerenda = string.Empty;
            DataTable parameters = Common.makeParameterTable();

            DataRow parametrRow = parameters.NewRow();
            parameters.Rows.Add("@id_dzialu", id_dzialu);
            parameters.Rows.Add("@id_tabeli", id_tabeli);

            DataTable ddT = Common.getDataTable("SELECT id_kolumny,[kwerenda] FROM [kwerendy] where id_wiersza=0 and id_tabeli=@id_tabeli and id_wydzial=@id_dzialu order by id_kolumny", con_str, parameters);
            
            if (ddT.Rows.Count == 0)
            {
                // brak kwerend odcztującch
                Common.log.Info(kod + "brak kwerend odcztujących" );
                return "";
            }

            // sa kwerendy
            Common.log.Info("są kwerendy odcztujące, il: " + ddT.Rows.Count.ToString());
                //getTable
            try
                {
                    foreach (DataRow dRow in ddT.Rows)
                    {
                        string id_kol = dRow[0].ToString().Trim();
                        string kwe = dRow[1].ToString().Trim();
                        string cs = cl.PobierzConnectionString(id_dzialu);
                        ////############################################  ladowanie danych tabela 2 ##############################
                        // odczyt sedziów 
                        parameters = Common.makeParameterTable();

                        parameters.Rows.Add("@id_dzialu", id_dzialu);
                        parameters.Rows.Add("@id_tabeli", id_tabeli);
                        parameters.Rows.Add("@data_1", poczatek);
                        parameters.Rows.Add("@data_2", koniec);

                        ddT = Common.getDataTable(kwe, cs, parameters);
                        //pętla ładująca dane dane sedzw

                        foreach (DataRow dR in ddT.Rows)
                        {
                            switch (id_kol)
                            {
                                case "0":
                                    {
                                        parameters = Common.makeParameterTable();
                                        parameters.Rows.Add("@imie", dR[1].ToString().Trim());
                                        parameters.Rows.Add("@nazwisko", dR[2].ToString().Trim());
                                        parameters.Rows.Add("@funkcja", dR[3].ToString().Trim());
                                        parameters.Rows.Add("@stanowisko", dR[4].ToString().Trim());
                                        parameters.Rows.Add("@id_sedziego", dR[0].ToString().Trim());
                                        parameters.Rows.Add("@id_tabeli", id_tabeli);
                                        parameters.Rows.Add("@id_dzialu", id_dzialu);
                                        parameters.Rows.Add("@sesja", "s3030");
                                        Common.runQuerry("insert into tbl_statystyki_tbl_02 (imie,nazwisko,funkcja,stanowisko,id_sedziego,sesja,id_tabeli,id_dzialu) values (@imie,@nazwisko,@funkcja,@stanowisko,@id_sedziego,@sesja,@id_tabeli,@id_dzialu)", con_str, parameters);
                                        // załadowanie danych do pierwszych kolumn
                                    }
                                    break;

                                default:
                                    {

                                        string txt = string.Empty;
                                        txt = getColumnName(int.Parse(id_kol.Trim()));
                                        parameters = Common.makeParameterTable();

                                        string ttxx = dR[0].ToString().Trim();
                                        parameters.Rows.Add("@value", dR[0].ToString().Trim());
                                        try
                                        {
                                            parameters.Rows.Add("@id_", dR[1].ToString().Trim());
                                        }
                                        catch
                                        {
                                            parameters.Rows.Add("@id_", "0");
                                        }

                                        parameters.Rows.Add("@id_tabeli", id_tabeli);
                                        parameters.Rows.Add("@id_dzialu", id_dzialu);
                                        parameters.Rows.Add("@sesja", "s3030");

                                        //                                        string tvxt = dR[0].ToString().Trim();
                                        //                                      string tvxts = dR[1].ToString().Trim();
                                        Common.runQuerry("update tbl_statystyki_tbl_02 set " + txt + "=@value, sesja=@sesja where id_sedziego=@id_ and id_tabeli=@id_tabeli and id_dzialu=@id_dzialu", con_str, parameters);
                                    }
                                    break;
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                Common.log.Error(kod + " "+ex.Message);

            }//end of try
            return status;

        }// end of generuj_dane_do_tabeli_3



        public string generuj_dane_do_tabeli_XXL(int id_dzialu, int id_tabeli, DateTime poczatek, DateTime koniec)
        {
            string status = string.Empty;
            status = status + "pompowanie danch do tabeli: " + id_tabeli.ToString() + "<br>";
            var conn = new SqlConnection(con_str);
            SqlCommand sqlCmd;


            string kwerenda = string.Empty;
            DataSet dsKwerendy = new DataSet();
            string opis = string.Empty;
            // kwerenda + cs do datasetu

            //dsKwerendy = new DataSet();
            DataTable parameters = Common.makeParameterTable();
            parameters.Rows.Add("@id_dzialu", id_dzialu);
            parameters.Rows.Add("@id_tabeli", id_tabeli);

            DataTable dT1 = Common.getDataTable("SELECT id_kolumny,[kwerenda] FROM [kwerendy] where id_tabeli=@id_tabeli and id_wydzial=@id_dzialu order by id_kolumny", con_str, parameters);

            // zaladowanie do tabeli
            int il_wierszy = 0;
            try
            {
                il_wierszy = dT1.Rows.Count;//dsKwerendy.Tables[0].Rows.Count;
            }
            catch { }

            if (il_wierszy == 0)
            {
                // brak kwerend odcztującch
                status = status + "brak kwerend odcztujących" + "<br>";
            }
            else
            {
                // sa kwerendy
                status = status + "są kwerendy odcztujące, il: " + dT1.Rows.Count.ToString() + "<br>";

                try
                {
                    // DataTable dT = dsKwerendy.Tables[0];

                    foreach (DataRow dRow in dT1.Rows)
                    {
                        string id_kol = dRow[0].ToString().Trim();
                        string kwe = dRow[1].ToString().Trim();
                        string cs = cl.PobierzConnectionString(id_dzialu);

                        ////############################################  ladowanie danych tabela 2 ##############################

                        parameters = Common.makeParameterTable();

                        parameters.Rows.Add("@id_dzialu", id_dzialu);
                        parameters.Rows.Add("@id_tabeli", id_tabeli);
                        parameters.Rows.Add("@data_1", poczatek);
                        parameters.Rows.Add("@data_2", koniec);

                        DataTable ddT = Common.getDataTable(kwe, cs, parameters);

                        //pętla ładująca dane dane sedzw

                        foreach (DataRow dR in ddT.Rows)
                        {
                            switch (id_kol)
                            {
                                case "0":
                                    {
                                        parameters = Common.makeParameterTable();

                                        parameters.Rows.Add("@imie", dR[1].ToString().Trim());
                                        parameters.Rows.Add("@nazwisko", dR[2].ToString().Trim());
                                        parameters.Rows.Add("@funkcja", dR[3].ToString().Trim());
                                        parameters.Rows.Add("@stanowisko", dR[4].ToString().Trim());
                                        parameters.Rows.Add("@id_sedziego", dR[0].ToString().Trim());
                                        parameters.Rows.Add("@id_tabeli", id_tabeli);
                                        parameters.Rows.Add("@id_dzialu", id_dzialu);

                                        Common.runQuerry("insert into tbl_statystyki_tbl_x5 (imie,nazwisko,funkcja,stanowisko,id_sedziego,id_dzialu) values (@imie,@nazwisko,@funkcja,@stanowisko,@id_sedziego,@id_dzialu)", con_str, parameters);

                                        // załadowanie danych do pierwszych kolumn

                                    }
                                    break;

                                default:
                                    {

                                        string txt = getColumnName(int.Parse(id_kol));
                                        // załadowanie danych do pierwszych kolumn
                                        using (sqlCmd = new SqlCommand())
                                        {
                                            status = status + "wpisywanie danych do kolumny " + id_kol.ToString() + "<br>";
                                            sqlCmd = new SqlCommand("update tbl_statystyki_tbl_x5 set " + txt + "=@value  where id_sedziego=@id_  and id_dzialu=@id_dzialu", conn);
                                            try
                                            {
                                                conn.Open();
                                                string tvxt = dR[0].ToString().Trim();
                                                string tvxts = dR[1].ToString().Trim();
                                                sqlCmd.Parameters.AddWithValue("@value", dR[0].ToString().Trim());
                                                sqlCmd.Parameters.AddWithValue("@id_", dR[1].ToString().Trim());
                                                sqlCmd.Parameters.AddWithValue("@id_dzialu", id_dzialu);
                                                sqlCmd.ExecuteScalar();
                                                status = status + "Wpidano dane kolumny " + id_kol.Trim() + "dla sedziego nr " + dR[1].ToString().Trim() + "<br>";
                                                conn.Close();

                                            }
                                            catch (Exception ex)
                                            {
                                                conn.Close();
                                                status = status + "Bład wpisywania danych " + "<br>" + ex.Message + "<br>";
                                            }
                                        } // end of using
                                    }
                                    break;
                            }
                        }

                    }
                }
                catch (Exception)
                { }//end of try
            }// end of if 


            return status;

        }// end of generuj_dane_do_tabeli_5
         //================================================================================================

        string funkcja(int id_)
        {
            //funkcja=(SELECT   rtrim([nazwa]) FROM [funkcje]  where [rodzaj]=1 and ident=tbl_statystyki_tbl_02.funkcja)"

            DataTable parameters = Common.makeParameterTable();
            parameters.Rows.Add("@_id", id_ );
            return Common.getQuerryValue ("SELECT   rtrim([nazwa]) FROM [funkcje]  where [rodzaj]=1 and ident=@_id", con_str, parameters);
        } // end of funkcja

        string stanowisko(int id_)
        {

            DataTable parameters = Common.makeParameterTable();
            parameters.Rows.Add("@_id", id_);
            return Common.getQuerryValue("SELECT   rtrim([nazwa]) FROM [funkcje]  where [rodzaj]=2 and ident=@_id", con_str, parameters);

        }

        DataSet kwerendy_xl(string cs, string kwe, int id_dzialu, int id_tabeli, DateTime poczatek, DateTime koniec)
        {

            DataSet ds_x = new DataSet();
            try
            {
                SqlConnection conn_x = new SqlConnection(cs);
                conn_x.Open();
                SqlDataAdapter da_x = new SqlDataAdapter();

                da_x.SelectCommand = new SqlCommand(kwe, conn_x);
                da_x.SelectCommand.Parameters.AddWithValue("@id_dzialu", id_dzialu);
                da_x.SelectCommand.Parameters.AddWithValue("@id_tabeli", id_tabeli);
                da_x.SelectCommand.Parameters.AddWithValue("@data_1", poczatek);
                da_x.SelectCommand.Parameters.AddWithValue("@data_2", koniec);
                da_x.Fill(ds_x);
                conn_x.Close();

            }
            catch (Exception ev)
            {
                return null;
                // status = status + "Bład odczytu kwerendy " + kwe + "  " + ev.Message + "<br>";

            }
            return ds_x;
        }
  
        public DataTable generuj_dane_do_tabeli_sedziowskiej_2018(int id_dzialu, int id_tabeli, DateTime poczatek, DateTime koniec, int il_kolumn,string tenplik)
        {
            string status = string.Empty;
            Common.log.Info(tenplik + " :Generowanie tabeli danych: Rozpoczęcie");
        
            DataTable dTable = new DataTable();
            Common.log.Info(tenplik + " :Generowanie tabeli danych: Pobieranie connectionstringa");

            string cs = cl.PobierzConnectionString(id_dzialu);

            DataTable parameters = Common.makeParameterTable();
            parameters.Rows.Add("@id_tabeli", id_tabeli);
            parameters.Rows.Add("@id_dzialu", id_dzialu);
            Common.log.Info(tenplik + " :Generowanie tabeli danych: Wyciądnięcie kwerend dla tabeli :"+id_tabeli);
            DataTable dT1 = Common.getDataTable("SELECT id_kolumny,kwerenda FROM kwerendy where id_wiersza=0 and id_tabeli=@id_tabeli and id_wydzial=@id_dzialu order by id_kolumny", con_str, parameters);
            if (dT1.Rows.Count==0)
            {
                Common.log.Info(tenplik + " :Generowanie tabeli danych: Brak kwerend dla tabeli : " + id_tabeli);
                return null;
            }
            
            // tworzenie tabeli

                dTable.Columns.Add("id", typeof(int));
                dTable.Columns.Add("id_sedziego", typeof(int));
                dTable.Columns.Add("Funkcja", typeof(string));
                dTable.Columns.Add("Stanowisko", typeof(string));
                dTable.Columns.Add("Imie", typeof(string));
                dTable.Columns.Add("Nazwisko", typeof(string));
                dTable.Columns.Add("id_tabeli", typeof(string));
                for (int i = 1; i <= il_kolumn; i++)
                {
                    DataColumn column = new DataColumn();

                    column.DataType = typeof(string);
                    column.AllowDBNull = false;
                    column.ColumnName = getColumnName(i);
                    column.DefaultValue = "0";
                    dTable.Columns.Add(column);
                //Common.log.Info(tenplik + " :Generowanie tabeli danych: Ilosć kwerend dla tabeli : " + id_tabeli+ " : "+ il_wierszy.ToString());
            }

            // sa kwerendy
            //wyselekcjonuj kwerendy z sedziami col=0
            DataRow[] kwerendySedziow = dT1.Select("id_kolumny=0");
            if (kwerendySedziow.Length==0 )
            {
                Common.log.Info(tenplik + " :Generowanie tabeli danych: Brak kwerend wyciągających sedziów dla tabeli : " + id_tabeli );
                return null;
            }
            DataRow[] kwerendyDanych = dT1.Select("id_kolumny>0");
            if (kwerendyDanych.Length == 0)
            {
                Common.log.Info(tenplik + " :Generowanie tabeli danych: ilość kwerend wyciągających dane  dla tabeli : " + id_tabeli + "=" +kwerendyDanych.Length  );
            }
            // ladowanie danych sedziów
            try
            {
                Common.log.Info(tenplik + " :Generowanie tabeli danych: Wpisywanie danych sedziów dla tabeli : " + id_tabeli );
                int i = 1;
                foreach (var wiersz in kwerendySedziow)
                {
                    string kwerendaSedziego = wiersz[1].ToString();
                    DataTable parametry= Common.makeParameterTable();
                    parametry.Rows.Add("@data_1", poczatek);
                    parametry.Rows.Add("@data_2", koniec);
                    DataTable tabelaSedziow = Common.getDataTable(kwerendaSedziego, cs,parametry );
                    foreach (DataRow Sedzia in tabelaSedziow.Rows)
                    {
                        DataRow daneSedziego = dTable.NewRow();
                        daneSedziego[0] = i;
                        daneSedziego[1] = int.Parse(Sedzia[0].ToString());        //id sedziego
                        daneSedziego[2] = funkcja (int.Parse ( Sedzia[3].ToString().Trim() ));                     //funkcja
                        daneSedziego[3] = stanowisko (int.Parse ( Sedzia[4].ToString().Trim() ));                     //stanowisko
                        daneSedziego[4] = Sedzia[1].ToString().Trim ();                     //imie
                        daneSedziego[5] = Sedzia[2].ToString().Trim();                     //nazwisko
                        daneSedziego[6] = id_tabeli;                                //id tabeli
                        dTable.Rows.Add(daneSedziego);
                        i++;
                    }
                }
            }
            catch (Exception ex)
            {

                Common.log.Error(tenplik + " :Generowanie tabeli danych: Wpisywanie danych sedziów dla tabeli : " + id_tabeli+ " " +ex.Message );
                
            }
            // wpisywanie danych dla sedziów            

            
            foreach (var  wiersz in kwerendyDanych  )
            {
                string kolumna = wiersz[0].ToString();
                string kwerendaDanych = wiersz[1].ToString();
                DataTable parametry = Common.makeParameterTable();
                parametry.Rows.Add("@data_1", poczatek );
                parametry.Rows.Add("@data_2", koniec );

                DataTable tabelaDanychDlaSedziow = Common.getDataTable(kwerendaDanych, cs, parametry);

                // przepisanie danych sedziow
                int index = 0;
               
                foreach (DataRow dRow in tabelaDanychDlaSedziow .Rows)
                {
                    try
                    {
                        string idSedziego = dRow[1].ToString().Trim();
                        //linq znajdz wiersz z sedzim
                        // pobierz index
                        //                     dTable.Rows[index][getColumnName(int.Parse(kolumna))] = warosc;
                        
                        string warosc = dRow[0].ToString().Trim();
                        index = 0;
                        foreach (DataRow dr in dTable.Rows)
                        {
                            try
                            {
                               
                                string nr_sedziego = dr[1].ToString();
                                if (nr_sedziego == idSedziego)
                                {
                                    dTable.Rows[index][getColumnName(int.Parse(kolumna))] = warosc;
                                }

                            }
                            catch (Exception ex3)
                            { }
                            index++;
                        }
                    }
                    catch (Exception ex)
                    {}
                }
            }
            // uzupelnienie funkcji
            DataTable stanowiska  = Common.getDataTable("SELECT distinct ident ,nazwa FROM stanowiska", con_str);

            foreach (DataRow wierszDanych in dTable.Rows)
            {
                string idFunkcji = wierszDanych["stanowisko"].ToString ().Trim();
           
                var results = from myRow in stanowiska.AsEnumerable()
                              where myRow.Field<string>("nazwa") == idFunkcji
                              select myRow;


            }
            return dTable;
        }// end of generuj_dane_do_tabeli_5
           
        public DataTable generujDaneDoTabeliBezSedziow(int id_dzialu, int id_tabeli, DateTime poczatek, DateTime koniec, int iloscWierszy, int iloscKolumn, string tenPlik)
        {

            DataTable tab_1000 = new DataTable();
            for (int i = 0; i < iloscKolumn; i++)
            {
                tab_1000.Columns.Add("d_" + i.ToString("D2"), typeof(int));
            }
            string status = string.Empty;
            status = status + "pompowanie danch do tabeli: " + id_tabeli.ToString() + "<br>";
            var conn = new SqlConnection(con_str);
            string kwerenda = string.Empty;
            DataTable parameters = Common.makeParameterTable();
            parameters.Rows.Add("@id_dzialu", id_dzialu);
            parameters.Rows.Add("@id_tabeli", id_tabeli);


            DataTable ddT = Common.getDataTable("SELECT distinct id_kolumny,[kwerenda] FROM [kwerendy] where id_tabeli=@id_tabeli and id_wydzial=@id_dzialu and id_wiersza>0 and id_kolumny>0 order by id_kolumny", con_str, parameters);
            if (ddT.Rows.Count == 0)
            {
                // brak kwerend odcztującch

                Common.log.Warn(tenPlik + " brak kwerend odcztujących");
                return null;
            }
            string cs = cl.PobierzConnectionString(id_dzialu);

            // sa kwerendy
            Common.log.Info(tenPlik + " Są kwerendy odcztujące, il: " + ddT.Rows.Count.ToString());
            //getTable
            int rowId = 0;
            try
            {
                foreach (DataRow dRow in ddT.Rows)
                {
                    rowId++;
                    string id_kol = dRow[0].ToString().Trim();
                    string kwe = dRow[1].ToString().Trim();

                    ////############################################  ladowanie danych tabela 2 ##############################
                    // odczyt sedziów 
                    parameters = Common.makeParameterTable ();
                    parameters.Rows.Add("@id_dzialu", id_dzialu);
                    parameters.Rows.Add("@id_tabeli", id_tabeli);
                    parameters.Rows.Add("@data_1", poczatek);
                    parameters.Rows.Add("@data_2", koniec);

                    ddT = Common.getDataTable(kwe, cs, parameters);
                    
                    foreach (DataRow dR in ddT.Rows)
                    {
                        try
                        {
                            DataRow[] result = tab_1000.Select("id_sedziego = " + dR[1].ToString().Trim());
                            foreach (DataRow row in result)
                            {
                                DataRow newRow = tab_1000.NewRow();
                                for (int i = 0; i < iloscKolumn; i++)
                                {
                                    newRow[i] = row[i];
                                }
                                // newRow = row;
                                tab_1000.Rows.Remove(row);// wywala rowa
                                //   newRow.BeginEdit();
                                newRow[int.Parse(id_kol) + 1] = dR[0].ToString().Trim();
                                // newRow.AcceptChanges();
                                tab_1000.Rows.Add(newRow);
                            }
                        }
                        catch (Exception ex)
                        {


                        }
                    }
                }
            }
            catch (Exception ex)
            { }//end of try

            return tab_1000;

        }// end of generuj_dane_do_tabeli_3



        public DataTable generuj_dane_do_tabeli_typ2_new(int id_dzialu, int id_tabeli, DateTime poczatek, DateTime koniec, int il_kolumn)
        {
            string status = string.Empty;
            status = status + "pompowanie danch do tabeli: " + id_tabeli.ToString() + "<br>";
            var conn = new SqlConnection(con_str);


            DataTable dTable = new DataTable();
            string cs = cl.PobierzConnectionString(id_dzialu);

            string kwerenda = string.Empty;
            DataSet dsKwerendy = new DataSet();
            string opis = string.Empty;
            // kwerenda + cs do datasetu

            dsKwerendy = new DataSet();


            DataTable parameters = new DataTable();
            parameters.Columns.Add("name", typeof(String));
            parameters.Columns.Add("value", typeof(String));

            parameters.Rows.Add("@id_tabeli", id_tabeli);
            parameters.Rows.Add("@id_dzialu", id_dzialu);

            DataTable dT1 = Common.getDataTable("SELECT id_kolumny,[kwerenda] FROM [kwerendy] where id_tabeli=@id_tabeli and id_wydzial=@id_dzialu order by id_kolumny", con_str, parameters);

            // zaladowanie do tabeli
            int il_wierszy = 0;
            try
            {
                il_wierszy = dT1.Rows.Count;
            }
            catch { }

            if (il_wierszy == 0)
            {
                // brak kwerend odcztującch
                status = status + "brak kwerend odcztujących" + "<br>";
            }
            else
            {

                dTable.Columns.Add("id", typeof(int));
                dTable.Columns.Add("id_sedziego", typeof(int));
                dTable.Columns.Add("Funkcja", typeof(string));
                dTable.Columns.Add("Stanowisko", typeof(string));
                dTable.Columns.Add("Imie", typeof(string));
                dTable.Columns.Add("Nazwisko", typeof(string));
                dTable.Columns.Add("id_tabeli", typeof(string));
                for (int i = 1; i <= il_kolumn; i++)
                {
                    DataColumn column = new DataColumn();

                    column.DataType = System.Type.GetType("System.Int32");
                    column.AllowDBNull = false;
                    column.ColumnName = getColumnName(i);
                    column.DefaultValue = "0";
                    dTable.Columns.Add(column);
                }

                // sa kwerendy
                try
                {
                    status = status + "są kwerendy odcztujące, il: " + dsKwerendy.Tables[0].Rows.Count.ToString() + "<br>";

                }
                catch (Exception)
                { }

                try
                {
                    // DataTable dT = dsKwerendy.Tables[0];

                    foreach (DataRow dRow in dT1.Rows)
                    {
                        string id_kol = dRow[0].ToString().Trim();
                        string kwe = dRow[1].ToString().Trim();
                        ////############################################  ladowanie danych tabela 2 ##############################

                        DataSet dSet = kwerendy_xl(cs, kwe, id_dzialu, id_tabeli, poczatek, koniec);

                        // odczyt sedziów 
                        DataTable nowa = new DataTable();

                        try
                        {
                            nowa = dSet.Tables[0];
                        }
                        catch (Exception ec)
                        {
                            status = status + "Bład odczytu tabeli z danymi sędziów" + "<br>" + ec.Message + "<br>";
                        }

                        int j = 1;
                        foreach (DataRow dR in nowa.Rows)
                        {
                            switch (id_kol)
                            {
                                case "0":
                                    {
                                        try
                                        {
                                            // załadowanie danych do pierwszych kolumn
                                            j++;
                                            DataRow dr1 = dTable.NewRow();
                                            dr1[0] = j;//lp
                                            dr1[1] = dR[0].ToString().Trim();// id sedziego
                                            dr1[2] = funkcja(int.Parse(dR[3].ToString().Trim()));//funkcja
                                            dr1[3] = stanowisko(int.Parse(dR[4].ToString().Trim())); ;//stanowisko
                                            dr1[4] = dR[1].ToString().Trim();
                                            dr1[5] = dR[2].ToString().Trim();//idtmie nazwisko
                                            dr1[6] = id_tabeli.ToString();
                                            dTable.Rows.Add(dr1);
                                            status = status + "wpisywanie danych o sedziach do pierwszych kolumn" + "<br>";
                                        }
                                        catch (Exception ex2)
                                        {  }
                                   }
                                    break;

                                default:
                                    {
                                        string querry = "id_sedziego=" + dR[1].ToString().Trim();
                                        string sedzia = dR[1].ToString().Trim();
                                        int index = 0;
                                        foreach (DataRow dr in dTable.Rows)
                                        {
                                            try
                                            {
                                                index++;
                                                string nr_sedziego = dr[1].ToString();
                                                if (nr_sedziego == sedzia)
                                                {
                                                    dTable.Rows[index][getColumnName(int.Parse(id_kol))] = dR[0];
                                                }
                                            }
                                            catch (Exception ex3)
                                            {     }
                                        }
                                    }
                                    break;
                            }//end of switch
                        }
                    }
                }
                catch (Exception ex)
                { }//end of try
            }// end of if 


            return dTable;

        }// end of generuj_dane_do_tabeli_5

   

        public DataTable generuj_dane_do_tabeli_XXL_new(int id_dzialu, int id_tabeli, DateTime poczatek, DateTime koniec, int il_kolumn)
        {
            string status = string.Empty;
            status = status + "pompowanie danch do tabeli: " + id_tabeli.ToString() + "<br>";
            //var conn2 = new SqlConnection(con_str_2);//connectionstring wcyw
            var conn = new SqlConnection(con_str);
            DataTable dTable = new DataTable();
            string cs = cl.PobierzConnectionString(id_dzialu);

            string kwerenda = string.Empty;
            DataSet dsKwerendy = new DataSet();
            string opis = string.Empty;
            // kwerenda + cs do datasetu

            dsKwerendy = new DataSet();


            DataTable parameters = Common.makeParameterTable();

            parameters.Rows.Add("@id_tabeli", id_tabeli);
            parameters.Rows.Add("@id_tabeli", id_tabeli);

            DataTable dT1 = Common.getDataTable("SELECT id_kolumny,[kwerenda] FROM [kwerendy] where id_tabeli=@id_tabeli and id_wydzial=@id_dzialu order by id_kolumny", con_str, parameters);

            // zaladowanie do tabeli
            int il_wierszy = 0;
            try
            {
                il_wierszy = dT1.Rows.Count;
            }
            catch { }

            if (il_wierszy == 0)
            {
                // brak kwerend odcztującch
                status = status + "brak kwerend odcztujących" + "<br>";
            }
            else
            {

                dTable.Columns.Add("id", typeof(int));
                dTable.Columns.Add("id_sedziego", typeof(int));
                dTable.Columns.Add("Funkcja", typeof(string));
                dTable.Columns.Add("Stanowisko", typeof(string));
                dTable.Columns.Add("Imie i nazwisko", typeof(string));
                for (int i = 1; i <= il_kolumn; i++)
                {
                    DataColumn column = new DataColumn();
                    column.DataType = System.Type.GetType("System.String");
                    column.AllowDBNull = false;
                    column.ColumnName = getColumnName(i);
                    column.DefaultValue = "0";
                    dTable.Columns.Add(column);
                }

                // sa kwerendy
                status = status + "są kwerendy odcztujące, il: " + dsKwerendy.Tables[0].Rows.Count.ToString() + "<br>";

                try
                {
                    // DataTable dT = dsKwerendy.Tables[0];

                    foreach (DataRow dRow in dT1.Rows)
                    {
                        string id_kol = dRow[0].ToString().Trim();
                        string kwe = dRow[1].ToString().Trim();
                        ////############################################  ladowanie danych tabela 2 ##############################

                        DataSet dSet = kwerendy_xl(cs, kwe, id_dzialu, id_tabeli, poczatek, koniec);

                        // odczyt sedziów 
                        DataTable nowa = new DataTable();

                        try
                        {
                            nowa = dSet.Tables[0];
                        }
                        catch (Exception ec)
                        {
                            status = status + "Bład odczytu tabeli z danymi sędziów" + "<br>" + ec.Message + "<br>";
                        }

                        int j = 0;
                        foreach (DataRow dR in nowa.Rows)
                        {
                            switch (id_kol)
                            {
                                case "0":
                                    {

                                        // załadowanie danych do pierwszych kolumn
                                        j++;
                                        DataRow dr1 = dTable.NewRow();
                                        dr1[0] = j;//lp
                                        dr1[1] = dR[0].ToString().Trim();// id sedziego
                                        dr1[2] = funkcja(int.Parse(dR[3].ToString().Trim()));//funkcja
                                        dr1[3] = stanowisko(int.Parse(dR[4].ToString().Trim())); ;//stanowisko
                                        dr1[4] = dR[1].ToString().Trim() + " " + dR[2].ToString().Trim();//idtmie nazwisko
                                        dTable.Rows.Add(dr1);
                                        status = status + "wpisywanie danych o sedziach do pierwszych kolumn" + "<br>";

                                    }
                                    break;

                                default:
                                    {
                                        string querry = "id_sedziego=" + dR[1].ToString().Trim();
                                        string sedzia = dR[1].ToString().Trim();
                                        int index = 0;
                                        foreach (DataRow dr in dTable.Rows)
                                        {
                                            index++;
                                            string nr_sedziego = dr[1].ToString();
                                            if (nr_sedziego == sedzia)
                                            {
                                                dTable.Rows[index][getColumnName(int.Parse(id_kol))] = dR[0];
                                            }
                                        }
                                    }
                                    break;
                            }//end of switch
                        }
                    }
                }
                catch (Exception)
                { }//end of try
            }// end of if 



            return dTable;

        }// end of generuj_dane_do_tabeli_5

     
        #region private methode

        private DataTable generuj_dane_sedziow (int id_dzialu, int id_tabeli)

        {
            DataTable parametry = Common.makeParameterTable();
            parametry.Rows.Add("@id_wydzial", id_dzialu);
            parametry.Rows.Add("@id_tabeli", id_tabeli);
            string kwerendaSedziow = "SELECT DISTINCT kwerenda FROM   kwerendy WHERE   (id_wydzial = @id_wydzial) AND (id_tabeli = @id_tabeli) AND (id_wiersza = 0) AND (id_kolumny = 0)";
            
           
            string connectionString = cl.podajConnectionString(id_dzialu);
            string kwerenda = Common.getQuerryValue(kwerendaSedziow, con_str,parametry );
            return Common.getDataTable(kwerenda, connectionString);


        }// end of generuj_dane_sedziow

        public  DataTable generujDaneDoTabeli(int id_dzialu, int id_tabeli,DateTime pocztek, DateTime koniec)

        {
            DataTable parametry = Common.makeParameterTable();
            parametry.Rows.Add("@id_wydzial", id_dzialu);
            parametry.Rows.Add("@id_tabeli", id_tabeli);
            string kwerenda = "SELECT DISTINCT kwerenda, id_kolumny FROM   kwerendy WHERE        (id_wydzial = @id_wydzial) AND (id_tabeli = @id_tabeli) AND (id_wiersza = 0) AND (id_kolumny > 0)";
            // wuciaga kewrendy danych
            DataTable kwerendy = Common.getDataTable(kwerenda, con_str,parametry);
            if (kwerendy.Rows.Count==0)
            {
                return null;
            }
            DataTable dTResult = new DataTable();
            dTResult.Columns.Add("dana", typeof(string));
            dTResult.Columns.Add("id_sedziego", typeof(string));
            dTResult.Columns.Add("kolumna", typeof(string));
            DataTable parametryKwerendydanych = Common.makeParameterTable();
            parametryKwerendydanych.Rows.Add("@data_1", pocztek);
            parametryKwerendydanych.Rows.Add("@data_2", koniec);


            foreach (DataRow dRow  in kwerendy.Rows )
            {
                // odczyta dane 
                DataTable dana = Common.getDataTable(dRow[0].ToString().Trim(), cl.podajConnectionString(id_dzialu), parametryKwerendydanych);
                if (dana.Rows.Count>0)
                {
                    foreach (DataRow droww  in dana.Rows)
                    {
                        DataRow resultRow = dTResult.NewRow();
                        resultRow[0] = droww[0].ToString(); //dana
                        resultRow[1] = droww[1].ToString(); //id sedziego
                        resultRow[2] = dRow[1].ToString(); // kolumna
                        dTResult.Rows.Add(resultRow);
                    }
                }
            }
            return dTResult;
        }// end of generuj_dane_sedziow

        private DataTable TabelaTyp1(int iloscKolumn)
        {
            DataTable outputTable = new DataTable();
            for (int i = 1; i < iloscKolumn ; i++)
            {
                string identyfikatorKolumny = "d" + i.ToString("D1");
                outputTable.Columns.Add("identyfikatorKolumny", typeof(int));

            }
            return outputTable;
        }
        

        private DataTable  danejednegoSedziego(DataTable daneSedziow, int idSedziego)
        {
            DataRow[] daneSedziego;

                DataTable sedzia = new DataTable();
            sedzia.Columns.Add("kolumna", typeof(int));
            sedzia.Columns.Add("wartosc", typeof(string));
            string txt = "id_sedziego='" + idSedziego.ToString().Trim()+"'";
            daneSedziego = daneSedziow.Select(txt);
            foreach (DataRow dRow in daneSedziego)
            {
                DataRow wierszSedziego = sedzia.NewRow();
                wierszSedziego[0] = dRow[0];
                wierszSedziego[1] = dRow[1];
                sedzia.Rows.Add(wierszSedziego);
            }
            return sedzia;
        }
        #endregion


        public string wyciagnijWartosc(DataTable ddT, string selectString, string tenPlik)
        {
            string result = "0";
            try
            {
                DataRow[] foundRows;
                foundRows = ddT.Select(selectString);
                if (foundRows.Count() != 0)
                {
                    DataRow dr = foundRows[0];
                    result = dr[4].ToString();
                }
            }
            catch (Exception ex)
            {
                log.Error(tenPlik + " - wyciagnij wartosc -  " + ex.Message);
            }
            return result;
        }


    } // end of class
}
