using iTextSharp.text;
using iTextSharp.text.pdf;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace stat2018
{
    public class Class1
    {
        public static BaseFont NewFont = BaseFont.CreateFont(Environment.GetEnvironmentVariable("SystemRoot") + "\\fonts\\sylfaen.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);

        private Font fontPL1 = new Font(NewFont, 10f, Font.NORMAL, BaseColor.BLACK);

        public Font plFont1 = new Font(NewFont, 10f, Font.NORMAL, BaseColor.BLACK);
        public Font plFont = new Font(NewFont, 10f, Font.NORMAL, BaseColor.BLACK);
        public Font plFont2 = new Font(NewFont, 10f, Font.NORMAL, BaseColor.BLACK);
        public Font plFontBIG = new Font(NewFont, 15, Font.NORMAL, BaseColor.BLACK);
        public Font plFont3 = new Font(NewFont, 15, Font.NORMAL, BaseColor.BLACK);

        public common Common = new common();

        public string con_str = ConfigurationManager.ConnectionStrings["wap"].ConnectionString;
        public string con_str_wcyw = ConfigurationManager.ConnectionStrings["wcywConnectionString"].ConnectionString;
        /*
        public string[] splitData(string arg)
        {
            string[] stringSeparators = new string[] { "#" };
            string[] stTab = null;
            stTab = arg.Split(stringSeparators, StringSplitOptions.None);
            return stTab;
        }
        */
        private string getColumnName(int i)
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
        public string wyciagnij_sedziego(string id_sedziego)
        {
            DataTable parameters = Common.makeParameterTable();
            parameters.Rows.Add("@id_sedziego", id_sedziego.Trim());
            string sedzia = Common.getQuerryValue("SELECT distinct imie + ' ' + nazwisko   FROM tbl_statystyki_tbl_02 where id_sedziego=@id_sedziego ", con_str, parameters);

            //=========================

            parameters = Common.makeParameterTable();
            parameters.Rows.Add("@id_sedziego", id_sedziego.Trim());
            string stanowisko = Common.getQuerryValue("SELECT distinct  (COALESCE( stanowisko ,'') ) as sedzia  FROM tbl_statystyki_tbl_02 where id_sedziego=@id_sedziego ", con_str, parameters);

            return sedzia + " " + stanowisko;
        }// end of wyciagnij_kwerende

   
        public string wyciagnij_tytul(string tabela, string kolumna, string id_dzialu)
        {
            DataTable parameters = Common.makeParameterTable();
            parameters.Rows.Add("@kolumna", kolumna.Trim());
            parameters.Rows.Add("@tabela", tabela.Trim());
            parameters.Rows.Add("@dzial", id_dzialu.Trim());

            return Common.getQuerryValue("SELECT  opis FROM  kwerendy where id_tabeli=@tabela and id_kolumny=@kolumna and id_wydzial=@dzial", con_str, parameters);
        }// end of wyciagnij_tytul

        public string wyciagnij_tytul(string tabela, string kolumna, string id_dzialu, string id_wiersza)
        {
            DataTable parameters = Common.makeParameterTable();
            parameters.Rows.Add("@kolumna", kolumna.Trim());
            parameters.Rows.Add("@tabela", tabela.Trim());
            parameters.Rows.Add("@dzial", id_dzialu.Trim());
            parameters.Rows.Add("@id_wiersza", id_wiersza.Trim());

            return Common.getQuerryValue("SELECT  opis FROM  kwerendy where id_tabeli=@tabela and id_kolumny=@kolumna and id_wydzial=@dzial and id_wiersza=@id_wiersza", con_str, parameters);
        }// end of wyciagnij_kwerende

        public string czy_dostepny(string user, string id_wydzialu, string domain)
        {
            var conn = new SqlConnection(con_str);

            SqlCommand sqlCmd = new SqlCommand();
            // user nr
            string result = "";
            using (sqlCmd = new SqlCommand())
            {
                switch (domain)
                {
                    case "1":
                        {
                            sqlCmd = new SqlCommand("SELECT distinct  [ident]       FROM uzytkownik  where   [login_domenowy] =@name", conn);
                        }
                        break;

                    default:
                        {
                            sqlCmd = new SqlCommand("SELECT distinct  [ident]       FROM uzytkownik  where   [login] =@name", conn);
                        }
                        break;
                }
                try
                {
                    conn.Open();
                    sqlCmd.Parameters.AddWithValue("@name", user.Trim());
                    result = sqlCmd.ExecuteScalar().ToString();
                    conn.Close();
                }
                catch (Exception ex)
                {
                    conn.Close();
                    return ex.Message.ToString();
                }
            }

            //pozwolenie

            DataTable parameters = Common.makeParameterTable();
            parameters.Rows.Add("@id_wydzialu", id_wydzialu.Trim());
            parameters.Rows.Add("@user_id", result);
            return Common.getQuerryValue("SELECT COUNT(*) FROM     uprawnienia WHERE  (id_uzytkownika = @user_id) AND (id_wydzialu =@id_wydzialu)", con_str_wcyw, parameters);
        }// czy_dostepny
        /*
        public bool czyPracowal(string idPracownika, string data, string ConnectionString)
        {
            bool result = false;
            DataTable parameters = Common.makeParameterTable();
            parameters.Rows.Add("@idPracownika", idPracownika.Trim());
            parameters.Rows.Add("@data", data);
            string odp = Common.getQuerryValue("SELECT  opis FROM  kwerendy where id_tabeli=@tabela and id_kolumny=@kolumna and id_wydzial=@dzial", con_str_wcyw, parameters);
            if (int.Parse(odp) > 0)
            {
                result = true;
            }
            return result;
        }// end of CzyPracowal
        */
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
            catch
            {
                conn.Close();
            }

            return null;
        }

        public string podajConnectionString(int id_dzialu)
        {
            DataTable parametry = Common.makeParameterTable();
            parametry.Rows.Add("@id_dzialu", id_dzialu);
            return Common.getQuerryValue("SELECT distinct cs FROM wydzialy where ident=@id_dzialu", con_str, parametry);
        }

        public string podajKwerende(int id_dzialu, int id_wiersza, int id_kolumny, int id_tabeli)
        {
            DataTable parametry = Common.makeParameterTable();
            parametry.Rows.Add("@id_wydzial", id_dzialu);
            parametry.Rows.Add("@id_kolumny", id_kolumny);
            parametry.Rows.Add("@id_wiersza", id_wiersza);
            parametry.Rows.Add("@id_tabeli", id_tabeli);

            return Common.getQuerryValue("SELECT distinct kwerenda FROM kwerendy where id_wydzial=@id_wydzial and id_tabeli=@id_tabeli and id_kolumny=@id_kolumny and id_wiersza=@id_wiersza ", con_str, parametry);
        }

        public string podajKwerendePodgladu(int id_dzialu, int id_wiersza, int id_kolumny, int id_tabeli)
        {
            DataTable parametry = Common.makeParameterTable();
            parametry.Rows.Add("@id_wydzial", id_dzialu);
            parametry.Rows.Add("@id_kolumny", id_kolumny);
            parametry.Rows.Add("@id_wiersza", id_wiersza);
            parametry.Rows.Add("@id_tabeli", id_tabeli);

            return Common.getQuerryValue("SELECT distinct podglad FROM kwerendy where id_wydzial=@id_wydzial and id_tabeli=@id_tabeli and id_kolumny=@id_kolumny and id_wiersza=@id_wiersza ", con_str, parametry);
        }

        public string podajUzytkownika(string id_uzytkownika, string domain)
        {
            var conn = new SqlConnection(con_str);
            SqlCommand sqlCmd = new SqlCommand();
            string result = string.Empty;
            using (sqlCmd = new SqlCommand())
            {
                switch (domain)
                {
                    case "1":
                        {
                            sqlCmd = new SqlCommand("SELECT  imie + ' ' + nazwisko FROM     uzytkownik where  login_domenowy=@id_", conn);
                        }
                        break;

                    default:
                        {
                            sqlCmd = new SqlCommand("SELECT  imie + ' ' + nazwisko FROM     uzytkownik where  login=@id_", conn);
                        }
                        break;
                }
                try
                {
                    conn.Open();

                    sqlCmd.Parameters.AddWithValue("@id_", id_uzytkownika);
                    string odp = sqlCmd.ExecuteScalar().ToString().Trim();
                    conn.Close();
                    return odp;
                }
#pragma warning disable CS0168 // The variable 'ex' is declared but never used
                catch (Exception ex)
#pragma warning restore CS0168 // The variable 'ex' is declared but never used
                {
                    conn.Close();
                    result = string.Empty;
                }
            }

            return result;
        }

            public string wyciagnijDane(int id_dzialu, int id_wiersza, int id_kolumny, DateTime poczatek, DateTime koniec, int id_tabeli)
        {
            string result = string.Empty;
            string cs = podajConnectionString(id_dzialu);
            string kw = podajKwerende(id_dzialu, id_wiersza, id_kolumny, id_tabeli);

            if ((!string.IsNullOrEmpty(cs)) && (!string.IsNullOrEmpty(kw)))
            {
                DataTable parametry = Common.makeParameterTable();
                parametry.Rows.Add("@data_1", poczatek);
                parametry.Rows.Add("@data_2", koniec);
                result = Common.getQuerryValue(kw, cs, parametry);
            }
            return result;
        }

        public void tworzWiersz(int id, string opis, int id_dzialu, int id_tabeli)
        {
            DataTable parametry = Common.makeParameterTable();
            parametry.Rows.Add("@opis", opis);
            parametry.Rows.Add("@id", id);
            parametry.Rows.Add("@id_dzialu", id_dzialu);
            parametry.Rows.Add("@id_tabeli", id_tabeli);

            Common.runQuerry("insert into tbl_statystyki_tbl_01 (opis,id_,id_dzialu,id_tabeli) values (@opis,@id,@id_dzialu,@id_tabeli)", con_str, parametry);
        }
        public void updateWiersz(int kolumna, int id, string opis, int id_tabeli)
        {
            string txt = getColumnName(kolumna);
            // skasowanie tabeli i wcyw

            DataTable parametry = Common.makeParameterTable();
            parametry.Rows.Add("@opis", opis);
            parametry.Rows.Add("@id", id);
            parametry.Rows.Add("@id_tabeli", id_tabeli);

            Common.runQuerry("update tbl_statystyki_tbl_01 set " + txt + "=@opis where id_=@id and id_tabeli=@id_tabeli", con_str, parametry);
        }

        public void deleteRowTable()
        {
            Common.runQuerry("delete from  tbl_statystyki_tbl_01", con_str);
        }// end of deleteRowTable

        public string generuj_dane_do_tabeli_wierszy(DateTime poczatek, DateTime koniec, string id_dzialu, int id_tabeli)

        {
            string kwerenda = string.Empty;
            DataSet dsMenu = new DataSet();
            string opis = string.Empty;
            try
            {
                // int ilosc_wierszy = PodajIloscWierszy(int.ps(id_dzialu), id_tabeli);
                for (int i = 1; i <= 15; i++) //po wierszach
                {
                    for (int j = 0; j <= 15; j++)
                    {
                        try
                        {
                            string dana = wyciagnijDane(int.Parse(id_dzialu), i, j, poczatek, koniec, id_tabeli);
                            if (j == 0)
                            {
                                // poczatek wiersza
                                if (string.IsNullOrEmpty(dana.Trim()) != true)
                                {
                                    tworzWiersz(i, dana, int.Parse(id_dzialu), id_tabeli);
                                }
                            }
                            else
                            {
                                //srodek wiersza
                                if (!string.IsNullOrEmpty(dana.Trim()))
                                {
                                    updateWiersz(j, i, dana, id_tabeli);
                                }
                            }
                        }
                        catch
                        { } // end of try
                    }
                }
            }
            catch
            { }

            return "1";
        }// end of generuj_dane_do_tabeli
        public DataTable generuj_dane_do_tabeli_wierszy_przestawnych1(DateTime poczatek, DateTime koniec, string id_dzialu, int id_tabeli, int id_pozycji)
        {
            string kwerenda = string.Empty;
            DataSet dsMenu = new DataSet();
            string opis = string.Empty;
            DataTable tab_1000 = new DataTable();
            tab_1000.Columns.Add("id_", typeof(String));
            tab_1000.Columns.Add("opis", typeof(String));
            tab_1000.Columns.Add("d_01", typeof(int));
            tab_1000.Columns.Add("d_02", typeof(int));
            tab_1000.Columns.Add("d_03", typeof(int));
            tab_1000.Columns.Add("d_04", typeof(int));
            tab_1000.Columns.Add("d_05", typeof(int));
            tab_1000.Columns.Add("d_06", typeof(int));
            tab_1000.Columns.Add("d_07", typeof(int));
            tab_1000.Columns.Add("id_tabeli", typeof(int));

            try
            {
                // int ilosc_wierszy = PodajIloscWierszy(int.ps(id_dzialu), id_tabeli);
                for (int i = 1; i <= 15; i++) //po wierszach
                {
                    DataRow dR = tab_1000.NewRow();
                    for (int j = 0; j <= 7; j++)
                    {
                        try
                        {
                            dR[0] = i.ToString();
                            string dana = wyciagnijDane(int.Parse(id_dzialu), i, j, poczatek, koniec, id_tabeli);

                            if (j != 0)
                            {
                                if (string.IsNullOrEmpty(dana.Trim()) == true)
                                {
                                    dana = "0";
                                }
                            }
                            if (!string.IsNullOrEmpty(dana))
                            {
                                dR[j + 1] = dana;
                            }
                        }
                        catch
                        { } // end of try
                        dR["id_tabeli"] = id_tabeli;
                    }
                    if (!string.IsNullOrEmpty(dR[1].ToString().Trim()))
                    {
                        tab_1000.Rows.Add(dR);
                    }
                }
            }
            catch
            { }

            return tab_1000;
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
            string cs =podajConnectionString (id_dzialu);
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
#pragma warning disable CS0168 // The variable 'ex' is declared but never used
                catch (Exception ex)
#pragma warning restore CS0168 // The variable 'ex' is declared but never used
                { }//end of try
            }// end of if

            return tab_1000;
        }// end of generuj_dane_do_tabeli_3

        public string uzupelnij_statusy_Xl()
        {
            Common.runQuerry("update tbl_statystyki_tbl_x5 set funkcja=(SELECT     rtrim([nazwa]) FROM [funkcje]  where [rodzaj]=1 and ident=tbl_statystyki_tbl_x5.funkcja)", con_str, null);
            Common.runQuerry("update tbl_statystyki_tbl_x5 set stanowisko=(SELECT  rtrim([nazwa]) FROM funkcje    where [rodzaj]=2 and ident=tbl_statystyki_tbl_x5.stanowisko)", con_str, null);

            return "1";
        }

        public string uzupelnij_statusy()
        {
            Common.runQuerry("update tbl_statystyki_tbl_02 set funkcja = (SELECT   rtrim([nazwa]) FROM[funkcje]  where[rodzaj] = 1 and ident = tbl_statystyki_tbl_02.funkcja)", con_str, null);
            Common.runQuerry("update tbl_statystyki_tbl_02 set stanowisko=(SELECT   rtrim([nazwa]) FROM [funkcje]  where [rodzaj]=2 and ident=tbl_statystyki_tbl_02.stanowisko)", con_str, null);

            return "1";
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
            DataTable parametry = Common.makeParameterTable();
            parametry.Rows.Add("@ident", wydzial);

            string odp = Common.getQuerryValue("SELECT debug FROM  wydzialy where ident=@ident", con_str, parametry);

            if (odp == "1")
            {
                return true;
            }
            else
            {
                return false;
            }
            /*
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
            */
          
        }// end of debug

        public string nazwaSadu(string id_sadu)
        {
            DataTable parameters = Common.makeParameterTable();
            parameters.Rows.Add("@id_sadu", id_sadu);

            return Common.getQuerryValue("SELECT  sad FROM     wydzialy where ident=@id_sadu", con_str, parameters);
        }// end of nazwaSadu

      
        public string generuj_dane_do_tabeli_(int id_dzialu, int id_tabeli, DateTime poczatek, DateTime koniec)
        {
            string status = string.Empty;
            status = status + "pompowanie danch do tabeli: " + id_tabeli.ToString() + "<br>";
            var conn = new SqlConnection(con_str);
            string kwerenda = string.Empty;
            DataTable parameters = Common.makeParameterTable();

            DataRow parametrRow = parameters.NewRow();
            parameters.Rows.Add("@id_dzialu", id_dzialu);
            parameters.Rows.Add("@id_tabeli", id_tabeli);

            DataTable ddT = Common.getDataTable("SELECT id_kolumny,[kwerenda] FROM [kwerendy] where id_tabeli=@id_tabeli and id_wydzial=@id_dzialu order by id_kolumny", con_str, parameters);
            int il_wierszy = 0;
            try
            {
                il_wierszy = ddT.Rows.Count;
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
                status = status + "są kwerendy odcztujące, il: " + ddT.Rows.Count.ToString() + "<br>";
                //getTable
                try
                {
                    foreach (DataRow dRow in ddT.Rows)
                    {
                        string id_kol = dRow[0].ToString().Trim();
                        string kwe = dRow[1].ToString().Trim();
                        string cs = podajConnectionString(id_dzialu);
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
                catch
                { }//end of try
            }// end of if
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
                        string cs = podajConnectionString(id_dzialu);

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


        public DataSet kwerendy_xl(string cs, string kwe, int id_dzialu, int id_tabeli, DateTime poczatek, DateTime koniec)
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
#pragma warning disable CS0168 // The variable 'ev' is declared but never used
            catch (Exception ev)
#pragma warning restore CS0168 // The variable 'ev' is declared but never used
            {
                return null;
                // status = status + "Bład odczytu kwerendy " + kwe + "  " + ev.Message + "<br>";
            }
            return ds_x;
        }


      
        public DataTable generuj_dane_do_tabeli_mss2(int id_dzialu, DateTime poczatek, DateTime koniec, int il_kolumn)
        {
            string status = string.Empty;
            status = status + "pompowanie danch do tabeli<br>";
            var conn = new SqlConnection(con_str);

            DataTable dTable = new DataTable();
            string cs = podajConnectionString(id_dzialu);

            string kwerenda = string.Empty;
            DataSet dsKwerendy = new DataSet();
            string opis = string.Empty;
            // kwerenda + cs do datasetu

            dsKwerendy = new DataSet();

            DataTable parameters = new DataTable();
            parameters.Columns.Add("name", typeof(String));
            parameters.Columns.Add("value", typeof(String));

            parameters.Rows.Add("@id_dzialu", id_dzialu);
            DataTable dT1 = Common.getDataTable("SELECT [id_wydzial] ,[id_tabeli] ,[id_kolumny],[id_wiersza] ,[kwerenda]  FROM [kwerenda_mss] where  id_wydzial=@id_dzialu order by id_kolumny", con_str, parameters);

            // zaladowanie do tabeli
            int il_wierszy = 0;
            try
            {
                il_wierszy = dT1.Rows.Count;
            }
            catch { }

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
                parameters = new DataTable();
                parameters.Columns.Add("name", typeof(String));
                parameters.Columns.Add("value", typeof(String));

                parameters.Rows.Add("@id_dzialu", id_dzialu);
                parameters.Rows.Add("@data_1", poczatek);
                parameters.Rows.Add("@data_2", koniec);
                string wartosc = Common.getQuerryValue(kwerendaN, cs, parameters);
                try
                {
                    int w = int.Parse(wartosc);
                }
                catch
                {
                    wartosc = "0";
                }
                resultRow[0] = idWydzial.Trim();
                resultRow[1] = idTabeli.Trim();
                resultRow[2] = idWiersza.Trim();
                resultRow[3] = idKolumny.Trim();
                resultRow[4] = wartosc;
                dTResult.Rows.Add(resultRow);
            }

            return dTResult;
        }// end of generuj_dane_do_tabeli_mss2

       
    } // end of class
}