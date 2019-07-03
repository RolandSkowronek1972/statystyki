using System;
using System.Data;

namespace stat2018
{
    public partial class popup : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public mss ms = new mss();
        public common cm = new common();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string sesja = Request.QueryString["sesja"];
                if (sesja != null)
                {
                    // jest wywolanie
                    Label1.Text = sesja;
                    string[] stringSeparators = new string[] { "!" };
                    string[] stTab = null;


                    stTab = sesja.Split(stringSeparators, StringSplitOptions.None);
                    try
                    {
                        //1 - id wiersza// id sedziego
                        //2 - id tabeli
                        //3 - id kolumny
                        //4 - id typu 
                        string id_ = stTab[0].ToString().Trim();
                        string id_tabeli = stTab[1].ToString().Trim();
                        string kolumna = stTab[2].ToString().Trim();
                        string typ = stTab[3].ToString().Trim();
                        //cm.log.Info("POPUP: Wczytano dane : id tabeli "+id_tabeli +" id kolumny "+ kolumna +" typ: "+typ);
                        switch (typ)
                        {

                            case "1":
                                {
                                    tabelaWierszowa(int.Parse(id_), int.Parse(id_tabeli), int.Parse(kolumna));
                                }
                                break;
                            case "2":
                                {
                                    tabelaSedziowska(int.Parse(id_), int.Parse(id_tabeli), int.Parse(kolumna));
                                }
                                break;
                            case "3":
                                {
                                    //wierszowa akac
                                    tabelaWierszowaAKAC(int.Parse(id_), int.Parse(id_tabeli), int.Parse(kolumna));
                                }
                                break;
                            case "4":
                                {
                                    //wierszowa mms
                                    tabelaMSS(int.Parse(id_), id_tabeli, int.Parse(kolumna));
                                }
                                break;
                            case "5":
                                {
                                    //wierszowa XXL
                                   tabelaXXL(int.Parse(id_), int.Parse(id_tabeli), int.Parse(kolumna));
                                }
                                break;
                            default:
                                break;
                        }


                    }
                    catch (Exception ex)
                    {

                        cm.log.Error("POPUP: Wczytywanie danych : " + ex.Message );

                    }
                }
            }
        }

        protected void tabelaWierszowaAKAC(int id_wiersza, int id_tabeli, int id_kolumny)
        {
            string kw = string.Empty;
            string cs = string.Empty;

            //  Session["bb"] = e.CommandName.ToString();
            string id_dzialu = (string)Session["id_dzialu"];

            string date1 = (string)Session["data_1"];
            string date2 = (string)Session["data_2"];

            if (!string.IsNullOrEmpty(id_tabeli.ToString().Trim()))
            {

                cs = cl.podajConnectionString(int.Parse((string)Session["id_dzialu"]));
                kw = cl.podajKwerendePodgladu(int.Parse(id_dzialu), id_wiersza, id_kolumny, id_tabeli);

            }
            GridView1.DataSource = null;
            GridView1.DataSourceID = null;


            try
            {

                DataSet dane = new DataSet();
                dane.Tables.Clear();
                dane = cl.pod_tabela(cs, kw, date1, date2, id_wiersza.ToString());
                GridView1.DataSource = dane.Tables[0];
                Session["data_table"] = dane.Tables[0];
                GridView1.AutoGenerateColumns = true;
                GridView1.DataBind();
                GridView1.Visible = true;
            }
            catch (Exception ex)
            {
                cm.log.Error("popup  " + ex.Message);
                GridView1.DataSource = null;
                GridView1.DataSourceID = null;
                GridView1.Visible = false;
            }
            Label1.Text = cl.wyciagnij_tytul(id_tabeli.ToString(), id_kolumny.ToString(), id_dzialu, id_wiersza.ToString());
            Page.Header.Title = Label1.Text;
        }

        protected void tabelaMSS(int id_wiersza, string id_tabeli, int id_kolumny)
        {
            //cm.log.Info("POPUP: Tworzenie tabeli do popupu MSS, tabela: " + id_tabeli + " ,kolumna " + id_kolumny.ToString() + " ,wiersz : " + id_wiersza.ToString());

            string kw = string.Empty;
            string cs = string.Empty;

            //  Session["bb"] = e.CommandName.ToString();
            string id_dzialu = (string)Session["id_dzialu"];

            string date1 = (string)Session["data_1"];
            string date2 = (string)Session["data_2"];

            if (!string.IsNullOrEmpty(id_tabeli.ToString().Trim()))
            {

                cs = ms.PobierzConnectionStringMSS(int.Parse(id_dzialu));
                kw = ms.podajKwerendePodgladu(int.Parse(id_dzialu), id_wiersza, id_kolumny, id_tabeli);

            }
            //cm.log.Info("POPUP: Tworzenie tabeli do popupu MSS, kwerenda: " + kw );

            GridView1.DataSource = null;
            GridView1.DataSourceID = null;


            try
            {

                DataTable dane = new DataTable();

                dane = ms.pod_tabela(cs, kw, date1, date2, id_wiersza.ToString());

                GridView1.DataSource = dane;
                Session["data_table"] = dane;
                GridView1.AutoGenerateColumns = true;
                GridView1.DataBind();
                GridView1.Visible = true;
            }
            catch (Exception ex)
            {
                cm.log.Error("POPUP: Bład odczytu tabeli do popupu MSS, kwerenda: " + kw + " ,bład " + ex.Message);

                GridView1.DataSource = null;
                GridView1.DataSourceID = null;
                GridView1.Visible = false;
            }
            Label1.Text = "";
            Label1.Text = ms.wyciagnij_tytulMSS(id_tabeli.ToString(), id_kolumny.ToString(), id_dzialu, id_wiersza.ToString());
            Page.Header.Title = Label1.Text;
        }


        protected void tabelaWierszowa(int id_wiersza, int id_tabeli, int id_kolumny)
        {
            string kw = string.Empty;
            string cs = string.Empty;

            //  Session["bb"] = e.CommandName.ToString();
            string id_dzialu = (string)Session["id_dzialu"];

            string date1 = (string)Session["data_1"];
            string date2 = (string)Session["data_2"];

            if (!string.IsNullOrEmpty(id_tabeli.ToString().Trim()))
            {

                cs = cl.podajConnectionString(int.Parse((string)Session["id_dzialu"]));
                kw = cl.podajKwerendePodgladu(int.Parse(id_dzialu), id_wiersza, id_kolumny, id_tabeli);

            }
            GridView1.DataSource = null;
            GridView1.DataSourceID = null;


            try
            {

                DataSet dane = new DataSet();
                dane.Tables.Clear();
                dane = cl.pod_tabela(cs, kw, date1, date2, id_wiersza.ToString());
                GridView1.DataSource = dane.Tables[0];
                Session["data_table"] = dane.Tables[0];
                GridView1.AutoGenerateColumns = true;
                GridView1.DataBind();
                GridView1.Visible = true;
            }
            catch (Exception ex)
            {
                cm.log.Error("popup " + ex.Message);
                GridView1.DataSource = null;
                GridView1.DataSourceID = null;
                GridView1.Visible = false;
            }
            Label1.Text = cl.wyciagnij_tytul(id_tabeli.ToString(), id_kolumny.ToString(), id_dzialu, id_wiersza.ToString());
            Page.Header.Title = Label1.Text;
        }

        protected void tabelaSedziowska(int id_sedziego, int id_tabeli, int id_kolumny)
        {
            string kw = string.Empty;
            string cs = string.Empty;

            //  Session["bb"] = e.CommandName.ToString();
            string id_dzialu = (string)Session["id_dzialu"];

            string date1 = (string)Session["data_1"];
            string date2 = (string)Session["data_2"];

            if (!string.IsNullOrEmpty(id_tabeli.ToString().Trim()))
            {

                cs = cl.podajConnectionString(int.Parse((string)Session["id_dzialu"]));
                kw = cl.podajKwerendePodgladu(int.Parse(id_dzialu), 0, id_kolumny, id_tabeli);


            }
            GridView1.DataSource = null;
            GridView1.DataSourceID = null;


            try
            {

                DataSet dane = new DataSet();
                dane.Tables.Clear();
                dane = cl.pod_tabela(cs, kw, date1, date2, id_sedziego.ToString());
                GridView1.DataSource = dane.Tables[0];
                Session["data_table"] = dane.Tables[0];
                GridView1.AutoGenerateColumns = true;
                GridView1.DataBind();
                GridView1.Visible = true;
            }
            catch (Exception ex)
            {
                cm.log.Error( "popup " + ex.Message);
                GridView1.DataSource = null;
                GridView1.DataSourceID = null;
                GridView1.Visible = false;
            }
            string tytul = cl.wyciagnij_tytul(id_tabeli.ToString(), id_kolumny.ToString(), id_dzialu);
            if (tytul == "Odwołanie do obiektu nie zostało ustawione na wystąpienie obiektu.")
            {
                tytul = "";
                Label2.Text = tytul;
            }
            Label2.Text = tytul;
            string sedzia = cl.wyciagnij_sedziego(id_sedziego.ToString());
            if (sedzia == "Odwołanie do obiektu nie zostało ustawione na wystąpienie obiektu.")
            {
                sedzia = "";
                Label1.Text = sedzia;
            }
            Label1.Text = sedzia;
            Page.Header.Title = Label1.Text.Trim() + " " + Label2.Text.Trim();
        }

        protected void tabelaXXL(int id_sedziego, int id_tabeli, int id_kolumny)
        {
            string kw = string.Empty;
            string cs = string.Empty;

            //  Session["bb"] = e.CommandName.ToString();
            string id_dzialu = (string)Session["id_dzialu"];

            string date1 = (string)Session["data_1"];
            string date2 = (string)Session["data_2"];

            if (!string.IsNullOrEmpty(id_tabeli.ToString().Trim()))
            {

                cs = cl.podajConnectionString(int.Parse((string)Session["id_dzialu"]));
                kw = cl.podajKwerendePodgladu(int.Parse(id_dzialu), 0, id_kolumny, id_tabeli);


            }
            GridView1.DataSource = null;
            GridView1.DataSourceID = null;


            try
            {

                DataSet dane = new DataSet();
                dane.Tables.Clear();
                dane = cl.pod_tabela(cs, kw, date1, date2, id_sedziego.ToString());
                GridView1.DataSource = dane.Tables[0];
                Session["data_table"] = dane.Tables[0];
                GridView1.AutoGenerateColumns = true;
                GridView1.DataBind();
                GridView1.Visible = true;
            }
            catch (Exception ex)
            {
                cm.log.Error("popup " + ex.Message);
                GridView1.DataSource = null;
                GridView1.DataSourceID = null;
                GridView1.Visible = false;
            }
            string tytul = cl.wyciagnij_tytul(id_tabeli.ToString(), id_kolumny.ToString(), id_dzialu);
            if (tytul == "Odwołanie do obiektu nie zostało ustawione na wystąpienie obiektu.")
            {
                tytul = "";
                Label2.Text = tytul;
            }
            Label2.Text = tytul;
            string sedzia = cl.wyciagnij_sedziegoXXL(id_sedziego.ToString());
            if (sedzia == "Odwołanie do obiektu nie zostało ustawione na wystąpienie obiektu.")
            {
                sedzia = "";
                Label1.Text = sedzia;
            }
            Label1.Text = sedzia;
            Page.Header.Title = Label1.Text.Trim() + " " + Label2.Text.Trim();
        }
    }
}