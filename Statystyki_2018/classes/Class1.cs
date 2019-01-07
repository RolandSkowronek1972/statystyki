using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Configuration;
using iTextSharp.text;
using DevExpress.Web;
using System.Collections;
using iTextSharp.text.pdf;

namespace stat2018
{

    public class Class1
    {
        public static BaseFont NewFont = BaseFont.CreateFont(Environment.GetEnvironmentVariable("SystemRoot") + "\\fonts\\sylfaen.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);

        //  static BaseFont NewFont = BaseFont.CreateFont(BaseFont.HELVETICA,BaseFont.CP1257 , BaseFont.EMBEDDED);
        private Font fontPL1 = new Font(NewFont, 10f, Font.NORMAL, BaseColor.BLACK);

        public Font plFont1 = new Font(NewFont, 10f, Font.NORMAL, BaseColor.BLACK);
        public Font plFont = new Font(NewFont, 10f, Font.NORMAL, BaseColor.BLACK);
        public Font plFont2 = new Font(NewFont, 10f, Font.NORMAL, BaseColor.BLACK);
        public Font plFontBIG = new Font(NewFont, 15, Font.NORMAL, BaseColor.BLACK);
        public Font plFont3 = new Font(NewFont, 15, Font.NORMAL, BaseColor.BLACK);

        public common Common = new common();

        public string con_str = ConfigurationManager.ConnectionStrings["wap"].ConnectionString;
        public string con_str_wcyw = ConfigurationManager.ConnectionStrings["wcywConnectionString"].ConnectionString;
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
        public string wyciagnij_sedziego(string id_sedziego)
        {
            DataTable parameters = Common.makeParameterTable();
            parameters.Rows.Add("@id_sedziego", id_sedziego.Trim());
            string sedzia = Common.getQuerryValue("SELECT distinct imie + ' ' + nazwisko   FROM tbl_statystyki_tbl_02 where id_sedziego=@id_sedziego ", con_str, parameters);


            //=========================

             parameters = Common.makeParameterTable();
            parameters.Rows.Add("@id_sedziego", id_sedziego.Trim());
            string stanowisko = Common.getQuerryValue("SELECT distinct  (COALESCE( stanowisko ,'') ) as sedzia  FROM tbl_statystyki_tbl_02 where id_sedziego=@id_sedziego ", con_str, parameters);

            

            return sedzia+ " " + stanowisko;
        }// end of wyciagnij_kwerende


        public string wyciagnij_sedziego_xl(string id_sedziego)
        {

            DataTable parameters = Common.makeParameterTable();
            parameters.Rows.Add("@id_sedziego", id_sedziego.Trim());
            return Common.getQuerryValue("ELECT distinct imie + ' ' + nazwisko + ' ' + (COALESCE( stanowisko ,'') ) as sedzia  FROM tbl_statystyki_tbl_x5 where id_sedziego=@id_sedziego", con_str, parameters);

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

        public string podajFunkcjeSedziegol(int idFunkcji)
        {

            DataTable parameters = Common.makeParameterTable();
            parameters.Rows.Add("@ident", idFunkcji);
           
            return Common.getQuerryValue("SELECT nazwa  FROM funkcje where ident=@ident", con_str, parameters);


        }// end of wyciagnij_kwerende
        public string czy_dostepny(string user, string id_wydzialu, string domain)
        {

            var conn = new SqlConnection(con_str);

            SqlCommand sqlCmd;
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

        public string podajCSWcyw()
        {
            return con_str_wcyw;
        }//end of podajCS
        public string podajCS()
        {
            return con_str;

        }//end of podajCS
        public string PobierzConnectionString(int id_dzialu)
        {
            return podajConnectionString(id_dzialu);
        }
        public string podajCS(string nazwa)
        {
            DataTable parameters = Common.makeParameterTable();
            parameters.Rows.Add("@nazwa", nazwa.Trim());
            return Common.getQuerryValue("SELECT distinct   [cs]  FROM [wydzialy] where nazwa=@nazwa", con_str, parameters);

        }//end of podajCS

        public double pobierzDanePracownika(string idPracownika, string data, int kolumna, string ConnectionString)
        {
            //pobierz kwerende
            string kwerenda = string.Empty;

            DataTable parameters = Common.makeParameterTable();
            parameters.Rows.Add("@idkolumny", kolumna);
            kwerenda = Common.getQuerryValue("SELECT kwerenda FROM tbl_ocenaPracownikaKwerendy where   idKolumny=@idkolumny", con_str, parameters);
            var conn = new SqlConnection(ConnectionString);

            // user nr
            double result = 0;

            //pozwolenie

            parameters = Common.makeParameterTable();
            parameters.Rows.Add("@idPracownika", idPracownika.Trim());
            parameters.Rows.Add("@data", data);

            string odp = Common.getQuerryValue(kwerenda, con_str, parameters);
            try
            {
                result = double.Parse(odp);
            }
            catch (Exception)
            { }
            return result;
        }// end of wyciagnij_kwerende
            
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

       
        public string podajConnectionString(int id_dzialu)
        {

            DataTable parametry = Common.makeParameterTable();
            parametry.Rows.Add("@id_dzialu", id_dzialu);
            return  Common.getQuerryValue ("SELECT distinct cs FROM wydzialy where ident=@id_dzialu", con_str, parametry);
        }

        public string podajKwerende_wiersza(int id_dzialu, int id_wiersza, int id_tabeli, int id_kolumny)
        {
            //xxx
            DataTable parametry = Common.makeParameterTable();
            parametry.Rows.Add("@id_wydzial", id_dzialu);
            parametry.Rows.Add("@id_kolumny", id_kolumny);
            parametry.Rows.Add("@id_wiersza", id_wiersza);
            parametry.Rows.Add("@id_tabeli", id_tabeli);

            
            return Common.getQuerryValue("SELECT distinct kwerenda FROM kwerendy where id_wydzial=@id_wydzial and id_tabeli=@id_tabeli and id_kolumny=@id_kolumny and id_wiersza=@id_wiersza ", con_str, parametry);

            /*
            var conn = new SqlConnection(con_str);
            SqlCommand sqlCmd = new SqlCommand();
            string result = string.Empty;
            using (sqlCmd = new SqlCommand())
            {
                sqlCmd = new SqlCommand("SELECT distinct kwerenda FROM kwerendy where id_wydzial=@id_wydzial and id_tabeli=@id_tabeli and id_kolumny=@id_kolumny and id_wiersza=@id_wiersza ", conn);
                try
                {
                    conn.Open();

                    sqlCmd.Parameters.AddWithValue("@id_wydzial", id_dzialu);
                    sqlCmd.Parameters.AddWithValue("@id_kolumny", id_kolumny);
                    sqlCmd.Parameters.AddWithValue("@id_wiersza", id_wiersza);
                    sqlCmd.Parameters.AddWithValue("@id_tabeli", id_tabeli);

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

            return result;*/
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
            //xxx
            var conn = new SqlConnection(con_str);
            SqlCommand sqlCmd = new SqlCommand();
            string result = string.Empty;
            using (sqlCmd = new SqlCommand())
            {
                sqlCmd = new SqlCommand("SELECT distinct kwerenda FROM kwerendy where id_wydzial=@id_wydzial and id_tabeli=@id_tabeli and id_kolumny=@id_kolumny and id_wiersza=@id_wiersza ", conn);
                try
                {
                    conn.Open();

                    sqlCmd.Parameters.AddWithValue("@id_wydzial", id_dzialu);
                    sqlCmd.Parameters.AddWithValue("@id_kolumny", id_kolumny);
                    sqlCmd.Parameters.AddWithValue("@id_wiersza", id_wiersza);
                    sqlCmd.Parameters.AddWithValue("@id_tabeli", id_tabeli);
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

        public string podajKwerendePodgladu(int id_dzialu, int id_wiersza, int id_kolumny, int id_tabeli)
        {
            var conn = new SqlConnection(con_str);
            SqlCommand sqlCmd = new SqlCommand();
            string result = string.Empty;
            using (sqlCmd = new SqlCommand())
            {
                sqlCmd = new SqlCommand("SELECT distinct podglad FROM kwerendy where id_wydzial=@id_wydzial and id_tabeli=@id_tabeli and id_kolumny=@id_kolumny and id_wiersza=@id_wiersza ", conn);
                try
                {
                    conn.Open();

                    sqlCmd.Parameters.AddWithValue("@id_tabeli", id_tabeli);
                    sqlCmd.Parameters.AddWithValue("@id_wydzial", id_dzialu);
                    sqlCmd.Parameters.AddWithValue("@id_kolumny", id_kolumny);
                    sqlCmd.Parameters.AddWithValue("@id_wiersza", id_wiersza);
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
                catch (Exception ex)
                {
                    conn.Close();
                    result = string.Empty;
                }
            }

            return result;
        }


        public string wyciagnijDaneNt(string kw, DateTime poczatek, DateTime koniec, string cs)
        {
            string result = string.Empty;

            if ((!string.IsNullOrEmpty(cs)) && (!string.IsNullOrEmpty(kw)))
            {

                var conn = new SqlConnection(cs);
                SqlCommand sqlCmd = new SqlCommand();

                using (sqlCmd = new SqlCommand())
                {
                    sqlCmd = new SqlCommand(kw, conn);
                    try
                    {
                        conn.Open();

                        sqlCmd.Parameters.AddWithValue("@data_1", poczatek);
                        sqlCmd.Parameters.AddWithValue("@data_2", koniec);
                        result = sqlCmd.ExecuteScalar().ToString().Trim();
                        conn.Close();


                    }
                    catch (Exception ex)
                    {
                        conn.Close();

                    }
                }

            }
            return result;
        }


        public string wyciagnijDane(int id_dzialu, int id_wiersza, int id_kolumny, DateTime poczatek, DateTime koniec, int id_tabeli)
        {
            string result = string.Empty;
            string cs = podajConnectionString(id_dzialu);
            string kw = string.Empty;
            if (id_kolumny == 0)

            {
                kw = podajKwerende_wiersza(id_dzialu, id_wiersza, id_tabeli, id_kolumny);

            }
            else
            {
                kw = podajKwerende(id_dzialu, id_wiersza, id_kolumny, id_tabeli);
            }
            if ((!string.IsNullOrEmpty(cs)) && (!string.IsNullOrEmpty(kw)))
            {
                var conn = new SqlConnection(cs);
                SqlCommand sqlCmd = new SqlCommand();

                using (sqlCmd = new SqlCommand())
                {
                    sqlCmd = new SqlCommand(kw, conn);
                    try
                    {
                        conn.Open();

                        sqlCmd.Parameters.AddWithValue("@data_1", poczatek);
                        sqlCmd.Parameters.AddWithValue("@data_2", koniec);
                        result = sqlCmd.ExecuteScalar().ToString().Trim();
                        conn.Close();


                    }
                    catch (Exception ex)
                    {
                        conn.Close();

                    }
                }

            }
            return result;
        }

        public void tworzWiersz(int id, string opis, int id_dzialu, int id_tabeli)
        {
            var conn = new SqlConnection(con_str);
            SqlCommand sqlCmd;

            // skasowanie tabeli i wcyw

            using (sqlCmd = new SqlCommand())
            {
                sqlCmd = new SqlCommand("insert into tbl_statystyki_tbl_01 (opis,id_,id_dzialu,id_tabeli) values (@opis,@id,@id_dzialu,@id_tabeli)", conn);
                try
                {
                    conn.Open();
                    sqlCmd.Parameters.AddWithValue("@opis", opis);
                    sqlCmd.Parameters.AddWithValue("@id", id);
                    sqlCmd.Parameters.AddWithValue("@id_dzialu", id_dzialu);
                    sqlCmd.Parameters.AddWithValue("@id_tabeli", id_tabeli);
                    sqlCmd.ExecuteScalar();
                    conn.Close();

                }
                catch
                { }
            }
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
                                if (!string.IsNullOrEmpty(dana.Trim())) updateWiersz(j, i, dana, id_tabeli);
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

        public string generuj_dane_do_tabeli_wierszyNT(DateTime poczatek, DateTime koniec, string id_dzialu, int id_tabeli)

        {
            /*roznica w stosunku do wersji bez NT polega na tym ze wszystkie kwerendy są zaczytywane jednocześnie a potem tylko 
            zaciągane z datasetu
            struktura datasetu
            - wiersz, kolumna, kwerenda
            - kwerenda: SELECT id_wiersza, id_kolumny, kwerenda  FROM kwerendy  where id_wydzial=@id_wydzial and  id_tabeli=@id_tabeli
            */

            DataTable kwerendy = new DataTable();

            DataTable parameters = new DataTable();
            parameters.Columns.Add("name", typeof(String));
            parameters.Columns.Add("value", typeof(String));

            DataRow parametrRow = parameters.NewRow();
            parameters.Rows.Add("@id_wydzial", id_dzialu);
            parameters.Rows.Add("@id_tabeli", id_tabeli);


            DataTable ddT = Common.getDataTable("SELECT id_wiersza, id_kolumny, kwerenda  FROM kwerendy  where id_wydzial=@id_wydzial and  id_tabeli=@id_tabeli", con_str, parameters);

            string cs = podajConnectionString(int.Parse(id_dzialu));
            for (int i = 1; i <= 15; i++) //po wierszach
            {
                for (int j = 0; j <= 15; j++)
                {
                    try
                    {
                        string selectString = "id_wiersza=" + i + " and " + "id_kolumny=" + j;
                        DataRow[] foundRows;
                        foundRows = ddT.Select(selectString);
                        DataRow dr = foundRows[0];
                        string kw = dr[2].ToString();


                        string dana2 = wyciagnijDaneNt(kw, poczatek, koniec, cs);
                        //wpisanie danych
                        if (j == 0)
                        {
                            // poczatek wiersza
                            if (string.IsNullOrEmpty(dana2.Trim()) != true)
                            {
                                tworzWiersz(i, dana2, int.Parse(id_dzialu), id_tabeli);
                            }
                        }
                        else
                        {
                            //srodek wiersza
                            if (!string.IsNullOrEmpty(dana2.Trim())) updateWiersz(j, i, dana2, id_tabeli);
                        }




                    }
                    catch (Exception ex)
                    {


                    }
                }

            }


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
                            //  else
                            //   {
                            //       dR[j + 1] = 0;
                            //   }



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
            string cs = PobierzConnectionString(id_dzialu);
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

        public DataTable DzienneDanePracownika(string data, string idPracownika, int idKolumny, string connectionString)
        {
            //wyciagnac kwerende


            var conn = new SqlConnection(con_str);

            string kwerenda = string.Empty;

            SqlCommand sqlCmd;
            using (sqlCmd = new SqlCommand())
            {

                sqlCmd = new SqlCommand("SELECT         kewrendaPodgladu FROM            tbl_ocenaPracownikaKwerendy where idKolumny=@idKolumny ", conn);
                try
                {
                    conn.Open();
                    sqlCmd.Parameters.AddWithValue("@idKolumny", idKolumny);
                    kwerenda = sqlCmd.ExecuteScalar().ToString();
                    conn.Close();


                }
                catch
                { }
            } // end of using

            DataTable result = new DataTable();

            DataTable parameters = new DataTable();
            parameters.Columns.Add("name", typeof(String));
            parameters.Columns.Add("value", typeof(String));

            parameters.Rows.Add("@idPracownika", idPracownika);
            parameters.Rows.Add("@data", data);
            result = Common.getDataTable(kwerenda, connectionString, parameters);

            return result;
        }

        public DataTable listaSpraw(string connectionString)
        {
            DataTable result = new DataTable();

            DataTable parameters = new DataTable();
            parameters.Columns.Add("name", typeof(String));
            parameters.Columns.Add("value", typeof(String));


            result = Common.getDataTable("select d.nazwisko, d.imie, st.nazwa, (select symbol from repertorium where numer=s.repertorium) rep, s.numer, s.rok  from sprawa s, strona t, dane_strony d, status st where s.czyus = 0 and t.czyus = 0 and s.ident = t.id_sprawy and t.id_danych = d.ident and t.id_statusu = st.ident ", connectionString, parameters);

            return result;
        }
   
        public DataTable listaSpraw(string connectionString, int idDzialu, string imie, string nazwisko)
        {
            DataTable result = new DataTable();

            DataTable parameters = Common.makeParameterTable();

            string kewrenda = Common.odczytajWartosc("listaSpraw01");
            parameters.Rows.Add("@imie", imie);
            parameters.Rows.Add("@nazwisko", nazwisko);
            //result = Common.getDataTable("select rtrim(imie)+' '+rtrim(nazwisko), ident from pracownik where [czyskreslono]=0 order by nazwisko", connectionString, parameters);

            result = Common.getDataTable(kewrenda, connectionString, parameters);

            return result;
        }

        public DataTable listaPracownikow(string connectionString, int idDzialu)
        {
            DataTable parameters = Common.makeParameterTable();

            string kwerenda = Common.odczytajWartosc("listaPracownikow01");
            parameters.Rows.Add("@id_dzialu", idDzialu);
            return Common.getDataTable(kwerenda, connectionString, parameters);
            
        }

        public DataTable listaPracownikow(string connectionString, string kwerenda)
        {
            DataTable parameters = Common.makeParameterTable();
            return Common.getDataTable(kwerenda, connectionString, parameters);
        }


        public DataTable listaWydzialow()
        {
            DataTable parameters = Common.makeParameterTable();
            return Common.getDataTable("SELECT DISTINCT [nazwa], [cs] FROM [wydzialy] ORDER BY [nazwa]", con_str, parameters);
        }

        public DataTable listaWydzialownew()
        {
            DataTable parameters = new DataTable();
            string kwerenda = "SELECT     opis, wartosc FROM konfig WHERE(klucz LIKE 'listaPracownikow_0% ')";
            return Common.getDataTable(kwerenda, con_str, parameters);
        }


        public DataTable listaSedziow(string connectionString, int idDzialu)
        {
           
            DataTable parameters = Common.makeParameterTable();
            parameters.Rows.Add("@id_dzialu", idDzialu);
            return Common.getDataTable("SELECT [ident],[nazwisko],[imie],[funkcja],[tytul]  FROM [sedzia] where [czyskreslono]=0 order by nazwisko", connectionString, parameters);
           
        }

        public string generuj_dane_do_tabeli_(int id_dzialu, int id_tabeli, DateTime poczatek, DateTime koniec, string plik)
        {

            //Common.log.Debug("Początek przetwarzania danych w pliku" + plik + " identyfikator tabeli: " + id_tabeli);
            string odp = generuj_dane_do_tabeli_(id_dzialu, id_tabeli, poczatek, koniec);
            //Common.log.Debug("Koniec przetwarzania danych w pliku" + plik + " identyfikator tabeli: " + id_tabeli);
            return odp;
        }
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
                        string cs = PobierzConnectionString(id_dzialu);
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
                catch (Exception)
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
                        string cs = PobierzConnectionString(id_dzialu);

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
        DataSet kwerendy_mss1r(string cs, string kwe, int id_dzialu, string id_tabeli, DateTime poczatek, DateTime koniec)
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

        public DataTable generuj_dane_do_tabeli_typ2_new2018(int id_dzialu, int id_tabeli, DateTime poczatek, DateTime koniec, int il_kolumn,string tenplik)
        {
            string status = string.Empty;
            //Common.log.Info(tenplik + " :Generowanie tabeli danych: Rozpoczęcie");
            var conn = new SqlConnection(con_str);


            DataTable dTable = new DataTable();
            //Common.log.Info(tenplik + " :Generowanie tabeli danych: Pobieranie connectionstringa");

            string cs = PobierzConnectionString(id_dzialu);

            string kwerenda = string.Empty;

            DataTable parameters = Common.makeParameterTable();
            parameters.Rows.Add("@id_tabeli", id_tabeli);
            parameters.Rows.Add("@id_dzialu", id_dzialu);
            //Common.log.Info(tenplik + " :Generowanie tabeli danych: Wyciądnięcie kwerend dla tabeli :"+id_tabeli);
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
                //Common.log.Info(tenplik + " :Generowanie tabeli danych: Brak kwerend dla tabeli : "+ id_tabeli);
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

                    column.DataType = System.Type.GetType("System.Int32");
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
                //Common.log.Info(tenplik + " :Generowanie tabeli danych: Brak kwerend wyciągających sedziów dla tabeli : " + id_tabeli );
                return null;
            }
            DataRow[] kwerendyDanych = dT1.Select("id_kolumny>0");
            if (kwerendyDanych.Length == 0)
            {
                //Common.log.Info(tenplik + " :Generowanie tabeli danych: ilość kwerend wyciągających dane  dla tabeli : " + id_tabeli + "=" +kwerendyDanych.Length  );
            }
            /*
             dTable.Columns.Add("id", typeof(int));
                dTable.Columns.Add("id_sedziego", typeof(int));
                dTable.Columns.Add("Funkcja", typeof(string));
                dTable.Columns.Add("Stanowisko", typeof(string));
                dTable.Columns.Add("Imie", typeof(string));
                dTable.Columns.Add("Nazwisko", typeof(string));
                dTable.Columns.Add("id_tabeli", typeof(string));
            */
            // ladowanie danych sedziów
            try
            {
                //Common.log.Info(tenplik + " :Generowanie tabeli danych: Wpisywanie danych sedziów dla tabeli : " + id_tabeli );
                int i = 1;
                foreach (var wiersz in kwerendySedziow)
                {
                    string kwerendaSedziego = wiersz[1].ToString();
                    DataTable tabelaSedziow = Common.getDataTable(kwerendaSedziego, cs);
                    foreach (DataRow Sedzia in tabelaSedziow.Rows)
                    {
                        DataRow daneSedziego = dTable.NewRow();
                        daneSedziego[0] = i;
                        daneSedziego[1] = int.Parse(Sedzia[0].ToString());        //id sedziego
                        daneSedziego[2] = funkcja (int.Parse ( Sedzia[3].ToString().Trim() ));                     //funkcja
                        daneSedziego[3] = stanowisko (int.Parse ( Sedzia[4].ToString().Trim() ));                     //stanowisko
                        daneSedziego[4] = Sedzia[1].ToString();                     //imie
                        daneSedziego[5] = Sedzia[2].ToString();                     //nazwisko
                        daneSedziego[6] = id_tabeli;                                //id tabeli
                        dTable.Rows.Add(daneSedziego);
                    }
                }
            }
            catch (Exception ex)
            {

                //Common.log.Error(tenplik + " :Generowanie tabeli danych: Wpisywanie danych sedziów dla tabeli : " + id_tabeli+ " " +ex.Message );
                
            }
            // wpisywanie danych dla sedziów            

            foreach (var wiersz in kwerendyDanych  )
            {
                string kolumna = wiersz[1].ToString();
                string kwerendaDanych = wiersz[1].ToString();
                DataTable parametry = Common.makeParameterTable();
                parameters.Rows.Add("@data_1", poczatek );
                parameters.Rows.Add("@data_2", koniec );

                DataTable tabelaDanychDlaSedziow = Common.getDataTable(kwerendaDanych, cs,parametry);

                // przepisanie danych sedziow
                foreach (DataRow dRow in tabelaDanychDlaSedziow .Rows)
                {
                    string idSedziego = dRow[0].ToString().Trim();

                }



            }

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
                                        { }
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
                                            { }
                                        }
                                    }
                                    break;
                            }//end of switch
                        }
                    }
                }
                catch (Exception ex)
                { }//end of try
           

            return dTable;

        }// end of generuj_dane_do_tabeli_5


        public DataTable generuj_dane_do_tabeli_typ2_new(int id_dzialu, int id_tabeli, DateTime poczatek, DateTime koniec, int il_kolumn)
        {
            string status = string.Empty;
            status = status + "pompowanie danch do tabeli: " + id_tabeli.ToString() + "<br>";
            var conn = new SqlConnection(con_str);


            DataTable dTable = new DataTable();
            string cs = PobierzConnectionString(id_dzialu);

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
                                            dr1[0] = j-1;//lp
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
                                               
                                                string nr_sedziego = dr[1].ToString();
                                                if (nr_sedziego == sedzia)
                                                {
                                                    dTable.Rows[index][getColumnName(int.Parse(id_kol))] = dR[0];
                                                }
                                                index++;
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

        public DataTable generuj_dane_do_tabeli_mss2(int id_dzialu, DateTime poczatek, DateTime koniec, int il_kolumn)
        {
            string status = string.Empty;
            status = status + "pompowanie danch do tabeli<br>";
            var conn = new SqlConnection(con_str);


            DataTable dTable = new DataTable();
            string cs = PobierzConnectionString(id_dzialu);

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


        public DataTable generuj_dane_do_tabeli_XXL_new(int id_dzialu, int id_tabeli, DateTime poczatek, DateTime koniec, int il_kolumn)
        {
            string status = string.Empty;
            status = status + "pompowanie danch do tabeli: " + id_tabeli.ToString() + "<br>";
            //var conn2 = new SqlConnection(con_str_2);//connectionstring wcyw
            var conn = new SqlConnection(con_str);
            DataTable dTable = new DataTable();
            string cs = PobierzConnectionString(id_dzialu);

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

        public string loguj(string user_, string haslo)
        {

            string result = "0";
            var conn = new SqlConnection(con_str);
            SqlCommand sqlCmd;


            // skasowanie tabeli i wcyw

            using (sqlCmd = new SqlCommand())
            {

                sqlCmd = new SqlCommand("SELECT [ident] FROM [uzytkownik] where [login]=@login and  [password]=@passwd ", conn);
                try
                {
                    conn.Open();
                    sqlCmd.Parameters.AddWithValue("@login", user_);
                    sqlCmd.Parameters.AddWithValue("@passwd", haslo);
                    string odp = sqlCmd.ExecuteScalar().ToString();
                    conn.Close();
                    return odp;

                }
                catch
                {
                    result = "0";
                    conn.Close();
                }
            } // end of using

            return result;


        } // end of loguj

        public string podajWzorzec(string id_dzialu)
        {



            DataTable parameters = Common.makeParameterTable();
            parameters.Rows.Add("@id_dzialu", id_dzialu);
            return Common.getQuerryValue("SELECT         plik FROM            wydzialy where  ident=@id_dzialu", con_str, parameters);
            
        } // end of podajWzorzec
     
        //kof

        public string dodajDoTabeliKOF(DataRow rowik)
        {
            string result = string.Empty;
            string id_sprawy = rowik[0].ToString();
            string wydzial = rowik[1].ToString();
            string sygnatura = rowik[2].ToString();
            string d_wplywu = rowik[3].ToString();
            string strona = rowik[4].ToString();
            string pelnomocnik = rowik[5].ToString();
            string przeciwko = rowik[6].ToString();

            DataTable parameters = Common.makeParameterTable();
            parameters.Rows.Add("@id_sprawy", id_sprawy);
            string count = Common.getQuerryValue("select count(*) from kof where id_sprawy =@id_sprawy", podajCS(), parameters);


            if (count == "0")
            {
                parameters = Common.makeParameterTable();


                parameters.Rows.Add("@wydzial", wydzial);
                parameters.Rows.Add("@id_sprawy", id_sprawy);
                parameters.Rows.Add("@sygnatura", sygnatura);
                parameters.Rows.Add("@d_wplywu", d_wplywu);
                parameters.Rows.Add("@strona", strona);
                parameters.Rows.Add("@pelnomocnik", pelnomocnik);
                parameters.Rows.Add("@przeciwko", przeciwko);
                string kwerenda = "INSERT INTO stat.dbo.kof  (id_sprawy, wydzial, sygnatura, d_wplywu, strona, pelnomocnik, przeciwko) VALUES (@id_sprawy, @wydzial, @sygnatura, @d_wplywu, @strona, @pelnomocnik,@przeciwko)";
                Common.runQuerry(kwerenda, podajCS(), parameters);

            }

            return result;
        }
        public GridViewRow Grw(object sender)
        {
            GridViewRow HeaderGridRow = null;
            GridView HeaderGrid = (GridView)sender;
            HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
            HeaderGridRow.Font.Size = 7;
            HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
            HeaderGridRow.VerticalAlign = VerticalAlign.Top;
            return HeaderGridRow;

        }
        public void makeHeader(System.Web.UI.WebControls.GridView sender, DataTable dT, System.Web.UI.WebControls.GridView GridViewX)
        {
            try
            {
                int row = 0;
                TableCell HeaderCell = new TableCell();
                GridViewRow HeaderGridRow = null;
                string hv = "h";
                Style stl = new Style();
                foreach (DataRow dR in dT.Rows)
                {
                    if (int.Parse(dR[0].ToString().Trim()) > row)
                    {
                        GridView HeaderGrid = (GridView)sender;
                        HeaderGridRow = Grw(sender);
                        row = int.Parse(dR[0].ToString().Trim());
                        hv = dR[4].ToString().Trim();
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
                    HeaderCell.Text = dR[1].ToString().Trim();
                    HeaderCell.Style.Clear();
                    HeaderCell.ApplyStyle(stl);
                    HeaderCell.ColumnSpan = int.Parse(dR[2].ToString().Trim());
                    HeaderCell.RowSpan = int.Parse(dR[3].ToString().Trim());
                    HeaderGridRow.Cells.Add(HeaderCell);


                    GridViewX.Controls[0].Controls.AddAt(0, HeaderGridRow);

                }
            }
            catch (Exception ex)
            { } // end of try
        }//end of makeHeader

        public string lasujDanedoWCYW(string repermtorium, string numer, string rok, string id_sedziego, string rok_so, string d_orzeczenia_so, string d_zakreslenia, string czyskreslono, string czyus, string uwagi, string kreator, string d_kreacji, string d_wplywu, string opis)
        {
            string result = string.Empty;

            DataTable parameters = Common.makeParameterTable();
            parameters.Rows.Add("@repermtorium", repermtorium);
            parameters.Rows.Add("@numer", numer);
            parameters.Rows.Add("@rok", rok);
            parameters.Rows.Add("@id_sedziego", id_sedziego);
            parameters.Rows.Add("@rok_so", rok_so);
            parameters.Rows.Add("@d_orzeczenia_so", d_orzeczenia_so);
            parameters.Rows.Add("@d_zakreslenia", d_zakreslenia);
            parameters.Rows.Add("@czyskreslono", czyskreslono);
            parameters.Rows.Add("@czyus", czyus);
            parameters.Rows.Add("@uwagi", uwagi);
            parameters.Rows.Add("@kreator", kreator);
            parameters.Rows.Add("@d_kreacji", d_kreacji);
            parameters.Rows.Add("@d_wplywu", d_wplywu);
            parameters.Rows.Add("@opis", opis);
            string kwerenda = "INSERT INTO stat.dbo.kof  (id_sprawy, wydzial, sygnatura, d_wplywu, strona, pelnomocnik, przeciwko) VALUES (@id_sprawy, @wydzial, @sygnatura, @d_wplywu, @strona, @pelnomocnik,@przeciwko)";
            Common.runQuerry(kwerenda, podajCS(), parameters);

            return result;
        }

        #region private methode

        private DataTable generuj_dane_sedziow (int id_dzialu, int id_tabeli)

        {
            DataTable parametry = Common.makeParameterTable();
            parametry.Rows.Add("@id_wydzial", id_dzialu);
            parametry.Rows.Add("@id_tabeli", id_tabeli);
            string kwerendaSedziow = "SELECT DISTINCT kwerenda FROM   kwerendy WHERE   (id_wydzial = @id_wydzial) AND (id_tabeli = @id_tabeli) AND (id_wiersza = 0) AND (id_kolumny = 0)";
            
           
            string connectionString = podajConnectionString(id_dzialu);
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
                DataTable dana = Common.getDataTable(dRow[0].ToString().Trim(), podajConnectionString(id_dzialu), parametryKwerendydanych);
                if (dana.Rows.Count>0)
                {
                    foreach (DataRow droww  in dana.Rows)
                    {
                        DataRow resultRow = dTResult.NewRow();
                        resultRow[0] = droww[0].ToString(); //dana
                        resultRow[1] = droww[1].ToString(); //id sedziego
                        resultRow[2] = dRow[1].ToString(); // klomna
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
        private DataTable TabelaTyp2()
        {

            DataTable outputTable = new DataTable();
            outputTable.Columns.Add("lp", typeof(int));
            outputTable.Columns.Add("idSedziegi", typeof(int));
            outputTable.Columns.Add("sedzia", typeof(string));
            outputTable.Columns.Add("funkcja", typeof(string ));
            outputTable.Columns.Add("etat", typeof(int));
            outputTable.Columns.Add("nieobecnosci", typeof(int));
            outputTable.Columns.Add("obsady", typeof(double));
            outputTable.Columns.Add("dniPracy", typeof(int));
            outputTable.Columns.Add("czasNaWokandzie", typeof(TimeSpan));
            outputTable.Columns.Add("dniNaWokandzie", typeof(double));
            outputTable.Columns.Add("dniWokand", typeof(double));
            outputTable.Columns.Add("pocztaWyslana1", typeof(int));
            outputTable.Columns.Add("ilPocztyNaDniBezWokand", typeof(double));
            outputTable.Columns.Add("ilosCzynnsci1", typeof(int));
            outputTable.Columns.Add("iloscCzynnosciNaDniBezWokand1", typeof(double));
            outputTable.Columns.Add("ilPocztyNaJednaCzynnoscWykonana", typeof(double));
            outputTable.Columns.Add("ilosCzynnsci2", typeof(int));
            outputTable.Columns.Add("iloscCzynnosciNaDniBezWokand2", typeof(double));
            outputTable.Columns.Add("SumaCzynnosci", typeof(int));
            outputTable.Columns.Add("iloscCzynnosciNaDniBezWokand3", typeof(double));
            outputTable.Columns.Add("iloscCzynnosciBezOkreslonejdatyWykonani", typeof(double));

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

        /// <summary>
        /// 
        /// </summary>
        /// <param name="idDzialu"></param>
        /// <param name="idTabeli"></param>
        /// <param name="poczatek"></param>
        /// <param name="koniec"></param>
        /// <param name="typTabeli"></param>
        /// <returns></returns>

        public DataTable generatorDanychTabeliSedziowskiej(int idDzialu, int idTabeli, DateTime poczatek, DateTime koniec,int typTabeli)
        {
            DataTable sedziowie = generuj_dane_sedziow(idDzialu, idTabeli);
            if (sedziowie.Rows.Count==0)
            {
                return null;
            }
            DataTable daneStatystyczne = generujDaneDoTabeli(idDzialu, idTabeli, poczatek, koniec);

            DataTable wyniki = TabelaTyp2();
            int licznik = 1;
            foreach (DataRow sedzia in sedziowie.Rows)
            {
                DataRow wierszStatystyczny = wyniki.NewRow();
                wierszStatystyczny[0] = licznik;
                wierszStatystyczny[1] = sedzia[0];
                wierszStatystyczny[2]= sedzia [1].ToString ().Trim ()+ " " + sedzia[2].ToString().Trim ();
                wierszStatystyczny[3] = funkcja (int.Parse ( sedzia[4].ToString ().Trim ()));
                DataTable daneNatematSedziego = danejednegoSedziego(daneStatystyczne, int.Parse(sedzia[0].ToString().Trim()));
                foreach (DataRow wierszDanych in daneNatematSedziego.Rows )
                {
                    int kolumna = int.Parse(wierszDanych[1].ToString().Trim());
                    wierszStatystyczny[3 + kolumna] = wierszDanych[0];
                    
                }
                wyniki.Rows.Add(wierszStatystyczny);
            }
            return wyniki;
        }
        #endregion
    } // end of class
}
