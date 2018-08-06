using System;
using System.Text;
using System.Data;
using System.Linq;
using System.Globalization;

namespace stat2018
{

    public partial class mss16r : System.Web.UI.Page
    {

        public Class1 cl = new Class1();
        public mss ms = new mss();
        public common cm = new common();
        public static string tenPlik = "mss16r.aspx";

        protected void Page_Load(object sender, EventArgs e)
        {
           
            cm.log.Debug("otwarcie formularza: " + tenPlik);
            Session["data_1"] = Date1.Text;
            Session["data_2"] = Date2.Text;
            string idWydzial = Request.QueryString["w"];
            if (idWydzial != null)
            {
                Session["id_dzialu"] = idWydzial;
                cm.log.Info(tenPlik + ": id wydzialu=" + idWydzial);
            }
            else
            {
                return;
            }
            if (!IsPostBack)
            {
                try
                {
                    string ccc = (string)Session["user_id"];
                    // file read with version
                    var fileContents = System.IO.File.ReadAllText(Server.MapPath(@"~//version.txt"));
                    this.Title = "Statystyki " + fileContents.ToString().Trim();
                }
                catch (Exception ex)
                {
                    Server.Transfer("default.aspx");
                }
            }
            przemiel();
            makeLabels();
        }// end of Page_Load


        protected void przemiel()
        {
            Session["sesja"] = "s3030";
            try
            {
                DateTime dTime = DateTime.Now;
                dTime = dTime.AddMonths(-1);
                if (Date1.Text.Length == 0)
                {
                    Date1.Text = dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-01";
                }
                if (Date2.Text.Length == 0)
                {
                    Date2.Text = dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-" + DateTime.DaysInMonth(dTime.Year, dTime.Month).ToString("D2");
                }

                Session["data_1"] = Date1.Text.Trim();
                Session["data_2"] = Date2.Text.Trim();
            }
            catch
            { }
            string idWydzialu = "'"+(string)Session["id_dzialu"]+"'";
            id_dzialu.Text = (string)Session["txt_dzialu"];
            string txt = string.Empty; //



            try
            {
                string idTabeli = string.Empty;
                string idWiersza = string.Empty;

                DataTable tabela2 = ms.generuj_dane_do_tabeli_mss2(int.Parse((string)Session["id_dzialu"]), DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 21);
                //wypełnianie lebeli
                //   string selectString = "id_wiersza=" + i + " and " + "id_kolumny=" + j;

                #region "tabela 1.1.a.1"
                //tab_111a1_w01_col01
                idTabeli = "'1.1.1.a.1'";
                idWiersza = "'1'";
                tab_111a1_w01_col01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_111a1_w01_col02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_111a1_w01_col03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_111a1_w01_col04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_111a1_w01_col05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_111a1_w01_col06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                #endregion
                
                #region "tabela 1.1.a.2"

                idTabeli = "'1.1.1.a.2'";
                idWiersza = "'1'";
                tab_111a2_w01_col01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                #endregion

                #region "tabela 1.1.1.b"

                idTabeli = "'1.1.1.b'";
                idWiersza = "'1'";
                tab_111b_w01_col01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                #endregion


                #region "tabela 1.1.1.c"

                idTabeli = "'1.1.1.c'";
                idWiersza = "'1'";
                tab_111c_w01_col01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                #endregion


                #region "1.1.1.d";
                idTabeli = "'1.1.1.d'";
                idWiersza = "'1'";
                tab_111d_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_111d_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_111d_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'2'";
                tab_111d_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_111d_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_111d_w02_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'3'";
                tab_111d_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_111d_w03_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_111d_w03_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'4'";
                tab_111d_w04_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_111d_w04_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_111d_w04_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'5'";
                tab_111d_w05_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_111d_w05_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_111d_w05_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'6'";
                tab_111d_w06_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_111d_w06_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_111d_w06_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'7'";
                tab_111d_w07_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_111d_w07_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_111d_w07_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'8'";
                tab_111d_w08_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_111d_w08_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_111d_w08_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'9'";
                tab_111d_w09_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_111d_w09_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_111d_w09_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'10'";
                tab_111d_w10_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_111d_w10_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_111d_w10_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'11'";
                tab_111d_w11_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_111d_w11_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_111d_w11_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'12'";
                tab_111d_w12_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_111d_w12_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_111d_w12_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'13'";
                tab_111d_w13_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_111d_w13_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_111d_w13_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'14'";
                tab_111d_w14_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_111d_w14_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_111d_w14_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'15'";
                tab_111d_w15_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_111d_w15_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_111d_w15_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'16'";
                tab_111d_w16_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_111d_w16_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_111d_w16_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'17'";
                tab_111d_w17_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_111d_w17_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_111d_w17_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                #endregion ;

                #region "1.1.1.e";
                idTabeli = "'1.1.1.e'";
                idWiersza = "'1'";
                tab_111e_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_111e_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                idWiersza = "'2'";
                tab_111e_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_111e_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                idWiersza = "'3'";
                tab_111e_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_111e_w03_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                idWiersza = "'4'";
                tab_111e_w04_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_111e_w04_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                idWiersza = "'5'";
                tab_111e_w05_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_111e_w05_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                idWiersza = "'6'";
                tab_111e_w06_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_111e_w06_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                idWiersza = "'7'";
                tab_111e_w07_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_111e_w07_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                idWiersza = "'8'";
                tab_111e_w08_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_111e_w08_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                idWiersza = "'9'";
                tab_111e_w09_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_111e_w09_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                #endregion ;


                #region "1.1.1.f";
                idTabeli = "'1.1.1.f'";
                idWiersza = "'1'";
                tab_111f_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'2'";
                tab_111f_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'3'";
                tab_111f_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'4'";
                tab_111f_w04_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'5'";
                tab_111f_w05_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'6'";
                tab_111f_w06_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                #endregion ;

                #region "1.1.1.g";
                idTabeli = "'1.1.1.g'";
                idWiersza = "'1'";
                tab_111g_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_111g_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                idWiersza = "'2'";
                tab_111g_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_111g_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                idWiersza = "'3'";
                tab_111g_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_111g_w03_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                idWiersza = "'4'";
                tab_111g_w04_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_111g_w04_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                idWiersza = "'5'";
                tab_111g_w05_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_111g_w05_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                idWiersza = "'6'";
                tab_111g_w06_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_111g_w06_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                idWiersza = "'7'";
                tab_111g_w07_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_111g_w07_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                idWiersza = "'8'";
                tab_111g_w08_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_111g_w08_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                idWiersza = "'9'";
                tab_111g_w09_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_111g_w09_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                idWiersza = "'10'";
                tab_111g_w10_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_111g_w10_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                idWiersza = "'11'";
                tab_111g_w11_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_111g_w11_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                idWiersza = "'12'";
                tab_111g_w12_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_111g_w12_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                idWiersza = "'13'";
                tab_111g_w13_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_111g_w13_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                #endregion ;

                #region "1.1.1.g";
                idTabeli = "'1.1.1.g.1'";
                idWiersza = "'1'";

                tab_111g1_w01_col01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'2'";
                tab_111g1_w02_col01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'3'";
                tab_111g1_w03_col01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");

                #endregion
                #region "tabela 1.1.1.h"
                idTabeli = "'1.1.1.h'";

                //wiersz 1
                tab_111h1_w01_col01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza ='1' and idkolumny='1'");


             
                #endregion

                #region "tabela 1.1.1.i"
                //wiersz 1
                idTabeli = "'1.1.1.i'";
                tab_111i_w01_col01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza ='1' and idkolumny='1'");


                #endregion

                #region "tabela 1.1.1.j"
                //wiersz 1
                idTabeli = "'1.1.1.j'";
                tab_111j_w01_col01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza ='1' and idkolumny='1'");


                #endregion



                #region "1.1.2";
                idTabeli = "'1.1.2'";
                idWiersza = "'1'";
                tab_112_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_112_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_112_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_112_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_112_w01_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_112_w01_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                idWiersza = "'2'";
                tab_112_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_112_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_112_w02_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_112_w02_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_112_w02_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_112_w02_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                idWiersza = "'3'";
                tab_112_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_112_w03_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_112_w03_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_112_w03_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_112_w03_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_112_w03_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                #endregion ;

                #region "1.1.2.a";
                idTabeli = "'1.1.2.a'";
                idWiersza = "'1'";
                tab_112a_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_112a_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_112a_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_112a_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_112a_w01_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_112a_w01_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_112a_w01_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_112a_w01_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                #endregion ;

                #region "'1.1.2.b'";
                idTabeli = "1.1.2.b";
                idWiersza = "'1'";
                tab_112b_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'2'";
                tab_112b_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'3'";
                tab_112b_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'4'";
                tab_112b_w04_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'5'";
                tab_112b_w05_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'6'";
                tab_112b_w06_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'7'";
                tab_112b_w07_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'8'";
                tab_112b_w08_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'9'";
                tab_112b_w09_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'10'";
                tab_112b_w10_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'11'";
                tab_112b_w11_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'12'";
                tab_112b_w12_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'13'";
                tab_112b_w13_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'14'";
                tab_112b_w14_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'15'";
                tab_112b_w15_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'16'";
                tab_112b_w16_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'17'";
                tab_112b_w17_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'18'";
                tab_112b_w18_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'19'";
                tab_112b_w19_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'20'";
                tab_112b_w20_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'21'";
                tab_112b_w21_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'22'";
                tab_112b_w22_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'23'";
                tab_112b_w23_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                idWiersza = "'24'";
                tab_112b_w24_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                #endregion ;

                #region "1.1.2.c";
                idTabeli = "'1.1.2.c'";
                idWiersza = "'1'";
                tab_112c_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_112c_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_112c_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'2'";
                tab_112c_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_112c_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_112c_w02_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'3'";
                tab_112c_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_112c_w03_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_112c_w03_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'4'";
                tab_112c_w04_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_112c_w04_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_112c_w04_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'5'";
                tab_112c_w05_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_112c_w05_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_112c_w05_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'6'";
                tab_112c_w06_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_112c_w06_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_112c_w06_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'7'";
                tab_112c_w07_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_112c_w07_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_112c_w07_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'8'";
                tab_112c_w08_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_112c_w08_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_112c_w08_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'9'";
                tab_112c_w09_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_112c_w09_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_112c_w09_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'10'";
                tab_112c_w10_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_112c_w10_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_112c_w10_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'11'";
                tab_112c_w11_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_112c_w11_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_112c_w11_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'12'";
                tab_112c_w12_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_112c_w12_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_112c_w12_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'13'";
                tab_112c_w13_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_112c_w13_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_112c_w13_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'14'";
                tab_112c_w14_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_112c_w14_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_112c_w14_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'15'";
                tab_112c_w15_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_112c_w15_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_112c_w15_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'16'";
                tab_112c_w16_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_112c_w16_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_112c_w16_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'17'";
                tab_112c_w17_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_112c_w17_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_112c_w17_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'18'";
                tab_112c_w18_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_112c_w18_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_112c_w18_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'19'";
                tab_112c_w19_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_112c_w19_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_112c_w19_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'20'";
                tab_112c_w20_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_112c_w20_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_112c_w20_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'21'";
                tab_112c_w21_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_112c_w21_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_112c_w21_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'22'";
                tab_112c_w22_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_112c_w22_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_112c_w22_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'23'";
                tab_112c_w23_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_112c_w23_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_112c_w23_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'24'";
                tab_112c_w24_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_112c_w24_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_112c_w24_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'25'";
                tab_112c_w25_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_112c_w25_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_112c_w25_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'26'";
                tab_112c_w26_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_112c_w26_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_112c_w26_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'27'";
                tab_112c_w27_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_112c_w27_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_112c_w27_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'28'";
                tab_112c_w28_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_112c_w28_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_112c_w28_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'29'";
                tab_112c_w29_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_112c_w29_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_112c_w29_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'30'";
                tab_112c_w30_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_112c_w30_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_112c_w30_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'31'";
                tab_112c_w31_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_112c_w31_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_112c_w31_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'32'";
                tab_112c_w32_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_112c_w32_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_112c_w32_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'33'";
                tab_112c_w33_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_112c_w33_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_112c_w33_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'34'";
                tab_112c_w34_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_112c_w34_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_112c_w34_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'35'";
                tab_112c_w35_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_112c_w35_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_112c_w35_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'36'";
                tab_112c_w36_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_112c_w36_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_112c_w36_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                idWiersza = "'37'";
                tab_112c_w37_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_112c_w37_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_112c_w37_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                #endregion ;


                #region "tabel 2.2.a"
                //wiersz 1
                idTabeli = "'2.2.a'";
                idWiersza = "'1'";
                //tab_22a_w01_col01 to tab_22a_w01_col09

                tab_22a_w01_col01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_22a_w01_col02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_22a_w01_col03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_22a_w01_col04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_22a_w01_col05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_22a_w01_col06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_22a_w01_col07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_22a_w01_col08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_22a_w01_col09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");

                //wiersz 2
                idWiersza = "'2'";
                tab_22a_w02_col01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_22a_w02_col02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_22a_w02_col03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_22a_w02_col04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_22a_w02_col05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_22a_w02_col06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_22a_w02_col07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_22a_w02_col08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_22a_w02_col09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");

                //wiersz 3
                idWiersza = "'3'";
                tab_22a_w03_col01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_22a_w03_col02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_22a_w03_col03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_22a_w03_col04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_22a_w03_col05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_22a_w03_col06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_22a_w03_col07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_22a_w03_col08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_22a_w03_col09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");

                //wiersz 4
                idWiersza = "'4'";
                tab_22a_w04_col01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_22a_w04_col02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_22a_w04_col03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_22a_w04_col04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_22a_w04_col05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_22a_w04_col06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_22a_w04_col07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_22a_w04_col08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                tab_22a_w04_col09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'");

                #endregion


                #region "tabel 11.1"
                //wiersz 1
                idTabeli = "'11.1'";
                idWiersza = "'1'";
                tab_111_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_111_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_111_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_111_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_111_w01_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_111_w01_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_111_w01_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");


                //wiersz 2
                idWiersza = "'2'";
                tab_111_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_111_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_111_w02_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_111_w02_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_111_w02_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_111_w02_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_111_w02_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");


                #endregion

                #region "tabel 11.2"
                //wiersz 1
                idTabeli = "'11.2'";
                idWiersza = "'1'";
                tab_112_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_112_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_112_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_112_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_112_w01_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_112_w01_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_112_w01_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");

                #endregion


                #region "tabel 14.1 "
                //wiersz 1
                idTabeli = "'14.1'";
                idWiersza = "'1'";
                tab_141_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_141_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_141_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_141_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");

                idWiersza = "'2'";
                tab_141_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_141_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_141_w02_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_141_w02_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");

                idWiersza = "'3'";
                tab_141_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_141_w03_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_141_w03_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_141_w03_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");

                idWiersza = "'4'";
                tab_141_w04_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_141_w04_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_141_w04_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_141_w04_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");

                idWiersza = "'5'";
                tab_141_w05_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_141_w05_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_141_w05_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_141_w05_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");

                idWiersza = "'6'";
                tab_141_w06_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_141_w06_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_141_w06_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_141_w06_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");

                #endregion

                #region "14.2"
                idTabeli = "'14.2'";

                //wiersz 1
                idWiersza = "'1'";
                tab_142_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_142_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_142_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_142_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_142_w01_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_142_w01_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_142_w01_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_142_w01_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");

                //wiersz 2
                idWiersza = "'2'";
                tab_142_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_142_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_142_w02_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_142_w02_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_142_w02_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_142_w02_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_142_w02_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_142_w02_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");

                //wiersz 3
                idWiersza = "'3'";
                tab_142_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_142_w03_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_142_w03_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_142_w03_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_142_w03_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_142_w03_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_142_w03_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_142_w03_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                //wiersz 4
                idWiersza = "'4'";
                tab_142_w04_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_142_w04_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_142_w04_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_142_w04_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_142_w04_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_142_w04_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_142_w04_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_142_w04_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                //wiersz 5
                idWiersza = "'5'";
                tab_142_w05_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_142_w05_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_142_w05_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_142_w05_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_142_w05_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_142_w05_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_142_w05_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_142_w05_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                //wiersz 6
                idWiersza = "'6'";
                tab_142_w06_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_142_w06_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_142_w06_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_142_w06_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_142_w06_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_142_w06_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_142_w06_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_142_w06_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");

                #endregion
                #region "14.3"
                idTabeli = "'14.3'";

                //wiersz 1
                idWiersza = "'1'";
                tab_143_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_143_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_143_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_143_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_143_w01_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_143_w01_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_143_w01_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_143_w01_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");

                //wiersz 2
                idWiersza = "'2'";
                tab_143_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_143_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_143_w02_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_143_w02_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_143_w02_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_143_w02_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_143_w02_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_143_w02_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");

                //wiersz 3
                idWiersza = "'3'";
                tab_143_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_143_w03_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_143_w03_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_143_w03_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_143_w03_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_143_w03_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_143_w03_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_143_w03_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                //wiersz 4
                idWiersza = "'4'";
                tab_143_w04_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_143_w04_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_143_w04_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_143_w04_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_143_w04_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_143_w04_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_143_w04_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_143_w04_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                //wiersz 5
                idWiersza = "'5'";
                tab_143_w05_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_143_w05_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_143_w05_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_143_w05_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_143_w05_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_143_w05_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_143_w05_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_143_w05_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");
                //wiersz 6
                idWiersza = "'6'";
                tab_143_w06_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_143_w06_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_143_w06_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_143_w06_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_143_w06_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_143_w06_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_143_w06_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_143_w06_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");

                #endregion

                #region 15.1
                idTabeli = "'15.1'";
                idWiersza = "'1'";
                tab_151_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                #endregion

                #region 15.2
                idTabeli = "'15.2'";
                idWiersza = "'1'";
                tab_152_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_152_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_152_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_152_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_152_w01_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_152_w01_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_152_w01_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_152_w01_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");


                #endregion

                #region 15.3
                idTabeli = "'15.3'";
                idWiersza = "'1'";
                tab_153_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_153_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_153_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_153_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_153_w01_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_153_w01_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_153_w01_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_153_w01_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");


                #endregion



                //14.5
            }
            catch (Exception ex)
            {

            }

            // dopasowanie opisów
            makeLabels();


            try
            {
                Label11.Visible = ms.debug(int.Parse(idWydzialu));
            }
            catch
            {
                Label11.Visible = false;
            }

            Label11.Text = txt;
     
        }



        protected void makeLabels()
        {
            try
            {
                string User_id = string.Empty;
                string domain = string.Empty;
                try
                {
                    User_id = (string)Session["user_id"];
                    domain = (string)Session["damain"];
                }
                catch
                { }
        
                id_dzialu.Text = (string)Session["txt_dzialu"];
                Label28.Text = cl.podajUzytkownika(User_id, domain);
                Label29.Text = DateTime.Now.ToLongDateString();
                try
                {
                    Label30.Text = System.IO.File.ReadAllText(Server.MapPath(@"~//version.txt")).ToString().Trim();
                }
                catch
                { }


                string strMonthName = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(DateTime.Parse(Date2.Text).Month);
                int last_day = DateTime.DaysInMonth(DateTime.Parse(Date2.Text).Year, DateTime.Parse(Date2.Text).Month);
                if (((DateTime.Parse(Date1.Text).Day == 1) && (DateTime.Parse(Date2.Text).Day == last_day)) && ((DateTime.Parse(Date1.Text).Month == DateTime.Parse(Date2.Text).Month)))
                {

                    // cały miesiąc
                    tabela1Label.Text = "Dział 1.1.1.a.1 Liczba spraw o umieszczenie w szpitalu psychiatrycznym bez zgody, w którym natąpiło przekroczenie terminu 14 dni od dnia wpływu wniosku lub zawiadomienia o przyjęciu do szpitala psychiatrycznego osoby chorej psychicznie lub z zaburzeniami psychicznymi wymaganego w celu odbycia rozprawy [art. 45 ust. 1 ustawy z dnia 19 sierpnia 1994 r. o ochronie zdrowia psychicznego (Dz. U. z 2016 r., poz. 546 )] za miesiąc " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    //      tabela2Label.Text = "Dział 1.1.1.a.2. Liczba spraw o umieszczenie w szpitalu psychiatrycznym bez zgody, w których wydano zarządzenie o doprowadzeniu osoby pozostającej w szpitalu, a której postępowanie bezpośrednio dotyczy na rozprawę, stosownie do możliwości przewidzianej w przepisie art. 46 ust. 1a ustawy z dnia 19 sierpnia 1994 r. o ochronie zdrowia psychicznego (Dz. U. z 2016 r., poz. 546) za miesiąc " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    //    tabela3Label.Text = "Dział 4.1. Terminowość postępowania międzyinstancyjnego w pierwszej instancji za miesiąc " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    tabela4Label.Text = "Dział 2.2.a. Czas trwania postępowania sądowego od dnia pierwszej rejestracji do dnia uprawomocnienia się sprawy merytorycznie zakończonej (wyrokiem, orzeczeniem) w I instancji (łącznie z czasem trwania mediacji) za miesiąc " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";

                    tabela5Label.Text = "Dział 11.1. Terminowość postępowania międzyinstancyjnego  w pierwszej instancji za miesiąc " + strMonthName + " " + DateTime.Parse(Date2.Text).Year.ToString() + " roku.";
                    //Informacje o ruchu sprawa za miesiąc: 

                    //Pozostało z ubieglego miesiąca
                }
                else
                {
                    tabela1Label.Text = "Dział 1.1.1.a.1 Liczba spraw o umieszczenie w szpitalu psychiatrycznym bez zgody, w którym natąpiło przekroczenie terminu 14 dni od dnia wpływu wniosku lub zawiadomienia o przyjęciu do szpitala psychiatrycznego osoby chorej psychicznie wymaganego w celu odbycia rozprawy [art. 45 ust. 1 ustawy z dnia 19 sierpnia 1994 r. o ochronie zdrowia psychicznego (Dz. U. z 2016 r., poz. 546 )] za okres od:  " + Date1.Text + " do  " + Date2.Text;
                    //       tabela2Label.Text = "Dział 1.1.1.a.2. Liczba spraw o umieszczenie w szpitalu psychiatrycznym bez zgody, w których wydano zarządzenie o doprowadzeniu osoby pozostającej w szpitalu, a której postępowanie bezpośrednio dotyczy na rozprawę, stosownie do możliwości przewidzianej w przepisie art. 46 ust. 1a ustawy z dnia 19 sierpnia 1994 r. o ochronie zdrowia psychicznego (Dz. U. z 2016 r., poz. 546) za okres od " + Date1.Text + " do  " + Date2.Text;
                    //     tabela3Label.Text = "Dział 4.1. Terminowość postępowania międzyinstancyjnego w pierwszej instancji za okres od" + Date1.Text + " do  " + Date2.Text;

                    tabela4Label.Text = "Dział 2.2.a. Czas trwania postępowania sądowego od dnia pierwszej rejestracji do dnia uprawomocnienia się sprawy merytorycznie zakończonej (wyrokiem, orzeczeniem) w I instancji (łącznie z czasem trwania mediacji) za okres od " + Date1.Text + " do  " + Date2.Text;


                    tabela5Label.Text = "Dział 11.1. Terminowość postępowania międzyinstancyjnego  w pierwszej instancji za okres od " + Date1.Text + " do  " + Date2.Text;

                }
            }
            catch
            {

            }

        }



        protected void LinkButton54_Click(object sender, EventArgs e)
        {
            przemiel();
        }


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


        protected void makeCSVFile(object sender, EventArgs e)
        {
            //tworzenie pliku csv
            try
            {
                string idSadu = idSad.Text.Trim();
                string idWydzialu = (string)Session["id_dzialu"];
                try
                {
                    int idWydzialN = int.Parse(idWydzialu);
                    idWydzialu = idWydzialN.ToString("D2");
                }
                catch (Exception)
                {
                    idWydzialu = string.Empty;
                }
                if (!string.IsNullOrEmpty(idWydzialu))
                {
                    DataTable tabela2 = cl.generuj_dane_do_tabeli_mss2(int.Parse((string)Session["id_dzialu"]), DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 21); //dane
                    var distinctRows = (from DataRow dRow in tabela2.Rows select dRow["idTabeli"]).Distinct(); //lista tabelek
                    DataTable listaTabelek = new DataTable();
                    listaTabelek.Columns.Add("tabela", typeof(string));
                    DataRow rowik = listaTabelek.NewRow();

                    foreach (var tabela in distinctRows)
                    {
                        rowik = listaTabelek.NewRow();
                        rowik[0] = tabela.ToString().Trim();
                        listaTabelek.Rows.Add(rowik);
                    }
                    var output = new StringBuilder();
                    //  output.AppendLine("Id formularza;Okres;Sąd;Wydział ;Dział;Wiersz;Kolumna;Liczba");

                    output = ms.raportTXT(listaTabelek, tabela2, idRaportu.Text.Trim(), idSad.Text);



                    Response.Clear();
                    Response.Buffer = true;
                    Response.ContentType = "application/text";
                    Response.AddHeader("Content-Disposition", "attachment;filename=" + idRaportu.Text.Trim() + ".csv");
                    Response.Output.Write(output);
                    //  Response.WriteFile(idRaportu + ".csv");
                    Response.Flush();
                    Response.End();
                }
            }
            catch (Exception ex)
            {



            }

        }

    }

}