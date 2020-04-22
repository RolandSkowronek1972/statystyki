using System;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Text;

namespace stat2018
{
    public partial class mss5r : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public mss ms = new mss();
        public common cm = new common();
        public dataReaders dr = new dataReaders();
        public static string tenPlik = "mss1r.aspx";
        public datyDoMSS datyMSS = new datyDoMSS();

        protected void Page_Load(object sender, EventArgs e)
        {
            string idWydzial = Request.QueryString["w"];
            if (idWydzial != null)
            {
                Session["id_dzialu"] = idWydzial;
                //cm.log.Info(tenPlik + ": id wydzialu=" + idWydzial);
            }
            else
            {
                Server.Transfer("default.aspx");
                return;
            }
            if (Session["ustawDate5r"] == null)
            {
                Session["ustawDate15o"] = null;
                Date1.Date = DateTime.Parse(datyMSS.DataPoczatkowa());
                Date2.Date = DateTime.Parse(datyMSS.DataKoncowa());
                Session["ustawDate5r"] = "X";
            }
            if (!IsPostBack)
            {
                
                try
                {
                    // file read with version
                    var fileContents = System.IO.File.ReadAllText(Server.MapPath(@"~//version.txt"));
                    this.Title = "Statystyki " + fileContents.ToString().Trim();
                }
                catch 
                {
                    Server.Transfer("default.aspx");
                }
            }
            CultureInfo newCulture = (CultureInfo)CultureInfo.CurrentCulture.Clone();
            newCulture.DateTimeFormat = CultureInfo.GetCultureInfo("PL").DateTimeFormat;
            System.Threading.Thread.CurrentThread.CurrentCulture = newCulture;
            System.Threading.Thread.CurrentThread.CurrentUICulture = newCulture;
            if (Date1.Text.Length == 0) Date1.Date = DateTime.Parse(datyMSS.DataPoczatkowa());
            if (Date2.Text.Length == 0) Date2.Date = DateTime.Parse(datyMSS.DataKoncowa());

            Session["data_1"] = Date1.Date.ToShortDateString();
            Session["data_2"] = Date2.Date.ToShortDateString();
            odswiez();
            makeLabels();
        }// end of Page_Load

        protected void odswiez()
        {
          
            string yyx = (string)Session["id_dzialu"];
            string idWydzialu = (string)Session["id_dzialu"];
            id_dzialu.Text = (string)Session["txt_dzialu"];
            string txt = string.Empty; //

            try
            {
                string idTabeli = string.Empty;
                string idWiersza = string.Empty;

                DataTable tabela2 = ms.generuj_dane_do_tabeli_mss2(int.Parse((string)Session["id_dzialu"]), Date1.Date, Date2.Date, 21);
                //wypełnianie lebeli
                //   string selectString = "id_wiersza=" + i + " and " + "id_kolumny=" + j;

                #region "1.1";

                idTabeli = "'1.1'";
                idWiersza = "'1'";
                tab_11_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'2'";
                tab_11_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w02_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w02_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'3'";
                tab_11_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w03_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w03_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w03_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'4'";
                tab_11_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w04_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w04_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w04_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'5'";
                tab_11_w05_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w05_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w05_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w05_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'6'";
                tab_11_w06_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w06_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w06_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w06_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'7'";
                tab_11_w07_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w07_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w07_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w07_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'8'";
                tab_11_w08_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w08_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w08_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w08_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'9'";
                tab_11_w09_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w09_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w09_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w09_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'10'";
                tab_11_w10_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w10_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w10_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w10_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'11'";
                tab_11_w11_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w11_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w11_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w11_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'12'";
                tab_11_w12_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w12_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w12_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w12_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'13'";
                tab_11_w13_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w13_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w13_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w13_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'14'";
                tab_11_w14_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w14_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w14_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w14_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'15'";
                tab_11_w15_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w15_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w15_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w15_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'16'";
                tab_11_w16_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w16_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w16_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w16_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'17'";
                tab_11_w17_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w17_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w17_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w17_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'18'";
                tab_11_w18_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w18_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w18_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w18_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'19'";
                tab_11_w19_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w19_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w19_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w19_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'20'";
                tab_11_w20_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w20_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w20_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w20_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'21'";
                tab_11_w21_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w21_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w21_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w21_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'22'";
                tab_11_w22_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w22_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w22_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w22_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'23'";
                tab_11_w23_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w23_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w23_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w23_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'24'";
                tab_11_w24_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w24_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w24_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w24_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'25'";
                tab_11_w25_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w25_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w25_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w25_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'26'";
                tab_11_w26_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w26_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w26_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w26_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'27'";
                tab_11_w27_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w27_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w27_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w27_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'28'";
                tab_11_w28_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w28_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w28_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w28_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'29'";
                tab_11_w29_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w29_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w29_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w29_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'30'";
                tab_11_w30_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w30_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w30_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w30_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'31'";
                tab_11_w31_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w31_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w31_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w31_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'32'";
                tab_11_w32_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w32_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w32_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w32_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'33'";
                tab_11_w33_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w33_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w33_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w33_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'34'";
                tab_11_w34_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w34_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w34_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w34_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'35'";
                tab_11_w35_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w35_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w35_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w35_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'36'";
                tab_11_w36_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w36_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w36_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w36_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'37'";
                tab_11_w37_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w37_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w37_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w37_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'38'";
                tab_11_w38_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w38_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w38_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w38_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'39'";
                tab_11_w39_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w39_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w39_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w39_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'40'";
                tab_11_w40_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w40_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w40_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w40_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'41'";
                tab_11_w41_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w41_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w41_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w41_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'42'";
                tab_11_w42_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w42_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w42_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w42_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'43'";
                tab_11_w43_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w43_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w43_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w43_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'44'";
                tab_11_w44_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w44_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w44_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w44_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'45'";
                tab_11_w45_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w45_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w45_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w45_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'46'";
                tab_11_w46_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w46_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w46_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w46_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'47'";
                tab_11_w47_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w47_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w47_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w47_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'48'";
                tab_11_w48_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w48_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w48_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w48_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'49'";
                tab_11_w49_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w49_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w49_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w49_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'50'";
                tab_11_w50_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w50_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w50_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w50_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'51'";
                tab_11_w51_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w51_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w51_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w51_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'52'";
                tab_11_w52_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w52_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w52_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w52_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'53'";
                tab_11_w53_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w53_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w53_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w53_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'54'";
                tab_11_w54_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w54_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w54_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w54_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'55'";
                tab_11_w55_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w55_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w55_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w55_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'56'";
                tab_11_w56_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w56_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w56_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w56_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'57'";
                tab_11_w57_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w57_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w57_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w57_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'58'";
                tab_11_w58_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w58_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w58_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w58_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'59'";
                tab_11_w59_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w59_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w59_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w59_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'60'";
                tab_11_w60_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w60_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w60_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w60_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'61'";
                tab_11_w61_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w61_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w61_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w61_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'62'";
                tab_11_w62_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w62_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w62_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w62_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'63'";
                tab_11_w63_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w63_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w63_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w63_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'64'";
                tab_11_w64_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w64_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w64_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w64_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'65'";
                tab_11_w65_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w65_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w65_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w65_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'66'";
                tab_11_w66_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w66_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w66_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w66_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'67'";
                tab_11_w67_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w67_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w67_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w67_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'68'";
                tab_11_w68_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w68_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w68_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w68_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'69'";
                tab_11_w69_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w69_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w69_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w69_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'70'";
                tab_11_w70_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w70_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w70_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w70_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'71'";
                tab_11_w71_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w71_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w71_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w71_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'72'";
                tab_11_w72_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w72_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w72_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w72_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'73'";
                tab_11_w73_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w73_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w73_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w73_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'74'";
                tab_11_w74_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w74_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w74_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w74_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'75'";
                tab_11_w75_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w75_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w75_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w75_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'76'";
                tab_11_w76_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w76_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w76_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w76_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'77'";
                tab_11_w77_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w77_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w77_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w77_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'78'";
                tab_11_w78_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w78_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w78_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w78_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'79'";
                tab_11_w79_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w79_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w79_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w79_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'80'";
                tab_11_w80_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w80_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w80_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w80_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'81'";
                tab_11_w81_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w81_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w81_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w81_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'82'";
                tab_11_w82_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w82_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w82_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w82_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'83'";
                tab_11_w83_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w83_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w83_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w83_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'84'";
                tab_11_w84_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w84_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w84_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w84_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'85'";
                tab_11_w85_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w85_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w85_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w85_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'86'";
                tab_11_w86_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w86_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w86_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w86_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'87'";
                tab_11_w87_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w87_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w87_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w87_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'88'";
                tab_11_w88_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w88_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w88_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w88_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'89'";
                tab_11_w89_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w89_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w89_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w89_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'90'";
                tab_11_w90_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w90_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w90_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w90_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'91'";
                tab_11_w91_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w91_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w91_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w91_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'92'";
                tab_11_w92_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w92_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w92_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w92_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'93'";
                tab_11_w93_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w93_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w93_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w93_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'94'";
                tab_11_w94_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w94_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w94_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w94_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'95'";
                tab_11_w95_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_w95_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_w95_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_w95_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);

                #endregion "1.1";

                //tab_11p_w01_c01

                #region "1.1.a"

                idTabeli = "'1.1.a'";
                idWiersza = "'1'";
                tab_11a_w01_col01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                idWiersza = "'2'";
                tab_11a_w02_col01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                #endregion "1.1.a"

                #region "1.1.1";

                idTabeli = "'1.1.1'";
                idWiersza = "'1'";
                tab_111_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_111_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_111_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'2'";
                tab_111_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_111_w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_111_w02_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'3'";
                tab_111_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_111_w03_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_111_w03_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'4'";
                tab_111_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_111_w04_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_111_w04_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'5'";
                tab_111_w05_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_111_w05_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_111_w05_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'6'";
                tab_111_w06_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_111_w06_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_111_w06_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'7'";
                tab_111_w07_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_111_w07_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_111_w07_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'8'";
                tab_111_w08_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_111_w08_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_111_w08_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'9'";
                tab_111_w09_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_111_w09_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_111_w09_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'10'";
                tab_111_w10_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_111_w10_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_111_w10_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'11'";
                tab_111_w11_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_111_w11_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_111_w11_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'12'";
                tab_111_w12_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_111_w12_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_111_w12_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'13'";
                tab_111_w13_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_111_w13_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_111_w13_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'14'";
                tab_111_w14_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_111_w14_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_111_w14_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'15'";
                tab_111_w15_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_111_w15_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_111_w15_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'16'";
                tab_111_w16_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_111_w16_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_111_w16_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'17'";
                tab_111_w17_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_111_w17_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_111_w17_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'18'";
                tab_111_w18_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_111_w18_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_111_w18_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'19'";
                tab_111_w19_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_111_w19_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_111_w19_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'20'";
                tab_111_w20_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_111_w20_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_111_w20_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'21'";
                tab_111_w21_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_111_w21_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_111_w21_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'22'";
                tab_111_w22_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_111_w22_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_111_w22_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'23'";
                tab_111_w23_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_111_w23_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_111_w23_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'24'";
                tab_111_w24_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_111_w24_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_111_w24_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'25'";
                tab_111_w25_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_111_w25_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_111_w25_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'26'";
                tab_111_w26_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_111_w26_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_111_w26_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'27'";
                tab_111_w27_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_111_w27_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_111_w27_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'28'";
                tab_111_w28_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_111_w28_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_111_w28_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'29'";
                tab_111_w29_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_111_w29_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_111_w29_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'30'";
                tab_111_w30_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_111_w30_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_111_w30_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'31'";
                tab_111_w31_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_111_w31_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_111_w31_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'32'";
                tab_111_w32_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_111_w32_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_111_w32_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'33'";
                tab_111_w33_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_111_w33_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_111_w33_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'34'";
                tab_111_w34_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_111_w34_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_111_w34_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'35'";
                tab_111_w35_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_111_w35_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_111_w35_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);

                #endregion "1.1.1";

                #region "tabela1.1.b"

                //tab_111a1_w01_col01
                idTabeli = "'1.1.b'";
                idWiersza = "'1'";

                tab_11b_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11b_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11b_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11b_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_11b_w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_11b_w01_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_11b_w01_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_11b_w01_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_11b_w01_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);

                idWiersza = "'2'";

                tab_11b_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11b_w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11b_w02_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11b_w02_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_11b_w02_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_11b_w02_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_11b_w02_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_11b_w02_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_11b_w02_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);

                idWiersza = "'3'";

                tab_11b_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11b_w03_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11b_w03_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11b_w03_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_11b_w03_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_11b_w03_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_11b_w03_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_11b_w03_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_11b_w03_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);

                idWiersza = "'4'";

                tab_11b_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                #endregion "tabela1.1.b"

                #region "tabela 1.1.c"

                idTabeli = "'1.1.c'";

                //wiersz 1
                tab_11c_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =1 and idkolumny='1'",tenPlik);

                //wiersz 2
                tab_11c_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =2 and idkolumny='1'",tenPlik);

                //wiersz 3
                tab_11c_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =3 and idkolumny='1'",tenPlik);

                //wiersz 4
                tab_11c_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =4 and idkolumny='1'",tenPlik);

                //wiersz 5
                tab_11c_w05_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =5 and idkolumny='1'",tenPlik);

                #endregion "tabela 1.1.c"

                #region "tabel 2.2.a"

                //wiersz 1
                idTabeli = "'1.1.d'";
                idWiersza = "'1'";

                tab_11d_w01_col01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11d_w01_col02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11d_w01_col03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                //tab_11d_w01_col04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);

                //wiersz 2
                idWiersza = "'2'";
                tab_11d_w02_col01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11d_w02_col02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11d_w02_col03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                //tab_11d_w02_col04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);

                //wiersz 3
                idWiersza = "'3'";
                tab_11d_w03_col01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11d_w03_col02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11d_w03_col03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                //tab_11d_w03_col04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);

                //wiersz 4
                idWiersza = "'4'";
                //tab_11d_w04_col01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                //tab_11d_w04_col02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                //tab_11d_w04_col03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11d_w04_col04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                //wiersz 5
                idWiersza = "'5'";
                //tab_11d_w05_col01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                //tab_11d_w05_col02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                //tab_11d_w05_col03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11d_w05_col04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);

                #endregion "tabel 2.2.a"

                #region "tabel 1.1.d.a"

                //wiersz 1
                idTabeli = "'1.1.d.a'";
                //wiersz 1
                tab_11da_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza = 1 and idkolumny = '1'",tenPlik);
                //wiersz 5
                tab_11da_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza = 2 and idkolumny = '1'",tenPlik);
                tab_11da_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza = 3 and idkolumny = '1'",tenPlik);
                tab_11da_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =4 and idkolumny='1'",tenPlik);
                tab_11da_w05_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =5 and idkolumny='1'",tenPlik);
                tab_11da_w06_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =6 and idkolumny='1'",tenPlik);

                #endregion "tabel 1.1.d.a"

                #region "tabel 1.1.e"

                //wiersz 1
                idTabeli = "'1.1.e'";
                idWiersza = "'1'";
                tab_11e_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                idWiersza = "'2'";
                tab_11e_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                #endregion "tabel 1.1.e"

                #region "1.1.f"

                idTabeli = "'1.1.f'";
                idWiersza = "'1'";
                tab_11f_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11f_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);

                idWiersza = "'2'";
                tab_11f_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11f_w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);

                idWiersza = "'3'";
                tab_11f_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11f_w03_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);

                idWiersza = "'4'";
                tab_11f_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11f_w04_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);

                #endregion "1.1.f"

                #region "1.1.g"

                idTabeli = "'1.1.f'";
                idWiersza = "'1'";
                tab_11g_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                #endregion "1.1.g"

                #region "1.1.i"

                idTabeli = "'1.1.i'";
                idWiersza = "'1'";
                tab_11i_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11i_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);

                idWiersza = "'2'";
                tab_11i_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11i_w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);

                #endregion "1.1.i"

                #region "1.1.ji"

                idTabeli = "'1.1.j'";
                idWiersza = "'1'";
                tab_11j_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'2'";
                tab_11j_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'3'";
                tab_11j_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'4'";
                tab_11j_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'5'";
                tab_11j_w05_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'6'";
                tab_11j_w06_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'7'";
                tab_11j_w07_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'8'";
                tab_11j_w08_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                #endregion "1.1.ji"

                #region "1.1.k"

                idTabeli = "'1.1.k'";
                idWiersza = "'1'";
                tab_11k_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11k_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);

                idWiersza = "'2'";
                tab_11k_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11k_w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);

                #endregion "1.1.k"

                #region "1.1.l"

                idTabeli = "'1.1.l'";
                idWiersza = "'1'";
                tab_11l_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                #endregion "1.1.l"

                #region "1.1.m"

                idTabeli = "'1.1.m'";
                idWiersza = "'1'";
                tab_11m_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                idWiersza = "'2'";
                tab_11m_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                #endregion "1.1.m"

                //tab_11n_w02_c2

                #region "1.1.n"

                idTabeli = "'1.1.n'";
                idWiersza = "'1'";
                tab_11n_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                idWiersza = "'2'";
                tab_11n_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                #endregion "1.1.n"

                //tab_11p_w01_c01

                #region "1.1.o"

                idTabeli = "'1.1.o'";
                idWiersza = "'1'";
                tab_11o_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                #endregion "1.1.o"

                #region "1.1.p"

                idTabeli = "'1.1.p'";
                idWiersza = "'1'";
                tab_11p_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11p_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11p_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11p_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'2'";
                tab_11p_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11p_w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11p_w02_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11p_w02_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                idWiersza = "'3'";
                tab_11p_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11p_w03_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11p_w03_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11p_w03_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);

                #endregion "1.1.p"

                #region "1.1.2";

                idTabeli = "'1.1.2'";
                idWiersza = "'1'";
                tab_112_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_112_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_112_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'2'";
                tab_112_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_112_w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_112_w02_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'3'";
                tab_112_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_112_w03_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_112_w03_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'4'";
                tab_112_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_112_w04_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_112_w04_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'5'";
                tab_112_w05_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_112_w05_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_112_w05_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'6'";
                tab_112_w06_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_112_w06_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_112_w06_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'7'";
                tab_112_w07_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_112_w07_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_112_w07_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'8'";
                tab_112_w08_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_112_w08_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_112_w08_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'9'";
                tab_112_w09_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_112_w09_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_112_w09_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'10'";
                tab_112_w10_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_112_w10_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_112_w10_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'11'";
                tab_112_w11_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_112_w11_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_112_w11_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'12'";
                tab_112_w12_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_112_w12_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_112_w12_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'13'";
                tab_112_w13_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_112_w13_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_112_w13_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'14'";
                tab_112_w14_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_112_w14_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_112_w14_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'15'";
                tab_112_w15_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_112_w15_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_112_w15_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'16'";
                tab_112_w16_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_112_w16_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_112_w16_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'17'";
                tab_112_w17_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_112_w17_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_112_w17_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'18'";
                tab_112_w18_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_112_w18_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_112_w18_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'19'";
                tab_112_w19_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_112_w19_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_112_w19_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'20'";
                tab_112_w20_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_112_w20_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_112_w20_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'21'";
                tab_112_w21_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_112_w21_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_112_w21_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'22'";
                tab_112_w22_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_112_w22_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_112_w22_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'23'";
                tab_112_w23_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_112_w23_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_112_w23_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'24'";
                tab_112_w24_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_112_w24_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_112_w24_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'25'";
                tab_112_w25_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_112_w25_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_112_w25_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'26'";
                tab_112_w26_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_112_w26_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_112_w26_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'27'";
                tab_112_w27_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_112_w27_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_112_w27_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'28'";
                tab_112_w28_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_112_w28_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_112_w28_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'29'";
                tab_112_w29_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_112_w29_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_112_w29_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                idWiersza = "'30'";
                tab_112_w30_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_112_w30_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_112_w30_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);

                #endregion "1.1.2";

                #region "1.1.5"

                idTabeli = "'1.1.5'";
                idWiersza = "'1'";
                tab_115_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_115_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_115_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_115_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_115_w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_115_w01_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_115_w01_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_115_w01_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);

                #endregion "1.1.5"

                #region "1.1.6"

                idTabeli = "'1.1.6'";
                idWiersza = "'1'";
                tab_116_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                idWiersza = "'2'";
                tab_116_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                #endregion "1.1.6"

                #region "1.1.7.a"

                idTabeli = "'1.1.7.a'";
                idWiersza = "'1'";
                tab_117a_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_117a_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_117a_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_117a_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_117a_w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_117a_w01_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_117a_w01_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_117a_w01_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_117a_w01_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_117a_w01_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_117a_w01_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);

                idWiersza = "'2'";
                tab_117a_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_117a_w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_117a_w02_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_117a_w02_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_117a_w02_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_117a_w02_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_117a_w02_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_117a_w02_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);

                idWiersza = "'3'";
                tab_117a_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_117a_w03_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_117a_w03_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_117a_w03_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_117a_w03_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_117a_w03_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_117a_w03_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_117a_w03_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);

                idWiersza = "'4'";
                tab_117a_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_117a_w04_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_117a_w04_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_117a_w04_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_117a_w04_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_117a_w04_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_117a_w04_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_117a_w04_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);

                idWiersza = "'5'";
                tab_117a_w05_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_117a_w05_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_117a_w05_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_117a_w05_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_117a_w05_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_117a_w05_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_117a_w05_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_117a_w05_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_117a_w05_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_117a_w05_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_117a_w05_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);

                idWiersza = "'6'";
                tab_117a_w06_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_117a_w06_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_117a_w06_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_117a_w06_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_117a_w06_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_117a_w06_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_117a_w06_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_117a_w06_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_117a_w06_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_117a_w06_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_117a_w06_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);

                #endregion "1.1.7.a"

                #region "1.1.7.b"

                idTabeli = "'1.1.7.b'";
                idWiersza = "'1'";
                tab_117b_w01_c2.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                #endregion "1.1.7.b"

                //tab_121_w01_c01

                #region "1.2.1"

                idTabeli = "'1.2.1'";
                idWiersza = "'1'";
                tab_121_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_121_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_121_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_121_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_121_w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_121_w01_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_121_w01_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_121_w01_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_121_w01_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_121_w01_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_121_w01_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_121_w01_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_121_w01_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_121_w01_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);
                tab_121_w01_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'",tenPlik);
                tab_121_w01_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'",tenPlik);
                tab_121_w01_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'",tenPlik);
                tab_121_w01_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'",tenPlik);
                tab_121_w01_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'",tenPlik);
                tab_121_w01_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'",tenPlik);
                tab_121_w01_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'",tenPlik);
                tab_121_w01_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'",tenPlik);
                tab_121_w01_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'",tenPlik);
                tab_121_w01_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'",tenPlik);
                tab_121_w01_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'",tenPlik);
                tab_121_w01_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'",tenPlik);

                idWiersza = "'2'";
                tab_121_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_121_w02_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_121_w02_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_121_w02_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_121_w02_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_121_w02_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_121_w02_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_121_w02_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_121_w02_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_121_w02_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_121_w02_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_121_w02_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);
                tab_121_w02_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'",tenPlik);
                tab_121_w02_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'",tenPlik);
                tab_121_w02_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'",tenPlik);
                tab_121_w02_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'",tenPlik);
                tab_121_w02_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'",tenPlik);
                tab_121_w02_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'",tenPlik);
                tab_121_w02_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'",tenPlik);
                tab_121_w02_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'",tenPlik);
                tab_121_w02_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'",tenPlik);
                tab_121_w02_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'",tenPlik);
                tab_121_w02_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'",tenPlik);
                tab_121_w02_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'",tenPlik);

                idWiersza = "'3'";
                tab_121_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_121_w03_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_121_w03_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_121_w03_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_121_w03_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_121_w03_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_121_w03_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_121_w03_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_121_w03_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_121_w03_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_121_w03_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_121_w03_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);
                tab_121_w03_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'",tenPlik);
                tab_121_w03_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'",tenPlik);
                tab_121_w03_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'",tenPlik);
                tab_121_w03_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'",tenPlik);
                tab_121_w03_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'",tenPlik);
                tab_121_w03_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'",tenPlik);
                tab_121_w03_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'",tenPlik);
                tab_121_w03_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'",tenPlik);
                tab_121_w03_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'",tenPlik);
                tab_121_w03_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'",tenPlik);
                tab_121_w03_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'",tenPlik);
                tab_121_w03_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'",tenPlik);

                idWiersza = "'4'";
                tab_121_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_121_w04_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_121_w04_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_121_w04_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_121_w04_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_121_w04_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_121_w04_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_121_w04_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_121_w04_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_121_w04_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_121_w04_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_121_w04_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);
                tab_121_w04_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'",tenPlik);
                tab_121_w04_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'",tenPlik);
                tab_121_w04_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'",tenPlik);
                tab_121_w04_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'",tenPlik);
                tab_121_w04_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'",tenPlik);
                tab_121_w04_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'",tenPlik);
                tab_121_w04_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'",tenPlik);
                tab_121_w04_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'",tenPlik);
                tab_121_w04_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'",tenPlik);
                tab_121_w04_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'",tenPlik);
                tab_121_w04_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'",tenPlik);
                tab_121_w04_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'",tenPlik);

                idWiersza = "'5'";
                tab_121_w05_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                tab_121_w05_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);

                tab_121_w05_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_121_w05_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_121_w05_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_121_w05_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_121_w05_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_121_w05_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_121_w05_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_121_w05_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_121_w05_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_121_w05_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);
                tab_121_w05_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'",tenPlik);
                tab_121_w05_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'",tenPlik);
                tab_121_w05_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'",tenPlik);
                tab_121_w05_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'",tenPlik);
                tab_121_w05_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'",tenPlik);
                tab_121_w05_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'",tenPlik);
                tab_121_w05_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'",tenPlik);
                tab_121_w05_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'",tenPlik);
                tab_121_w05_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'",tenPlik);
                tab_121_w05_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'",tenPlik);
                tab_121_w05_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'",tenPlik);
                tab_121_w05_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'",tenPlik);
                idWiersza = "'6'";
                tab_121_w06_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_121_w06_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_121_w06_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_121_w06_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_121_w06_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_121_w06_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_121_w06_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_121_w06_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_121_w06_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_121_w06_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_121_w06_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_121_w06_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);
                tab_121_w06_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'",tenPlik);
                tab_121_w06_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'",tenPlik);
                tab_121_w06_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'",tenPlik);
                tab_121_w06_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'",tenPlik);
                tab_121_w06_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'",tenPlik);
                tab_121_w06_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'",tenPlik);
                tab_121_w06_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'",tenPlik);
                tab_121_w06_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'",tenPlik);
                tab_121_w06_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'",tenPlik);
                tab_121_w06_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'",tenPlik);
                tab_121_w06_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'",tenPlik);
                tab_121_w06_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'",tenPlik);

                idWiersza = "'7'";
                tab_121_w07_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                tab_121_w07_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);

                tab_121_w07_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_121_w07_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_121_w07_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_121_w07_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_121_w07_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_121_w07_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_121_w07_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_121_w07_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_121_w07_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_121_w07_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);
                tab_121_w07_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'",tenPlik);
                tab_121_w07_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'",tenPlik);
                tab_121_w07_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'",tenPlik);
                tab_121_w07_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'",tenPlik);
                tab_121_w07_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'",tenPlik);
                tab_121_w07_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'",tenPlik);
                tab_121_w07_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'",tenPlik);
                tab_121_w07_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'",tenPlik);
                tab_121_w07_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'",tenPlik);
                tab_121_w07_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'",tenPlik);
                tab_121_w07_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'",tenPlik);
                tab_121_w07_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'",tenPlik);

                #endregion "1.2.1"

                #region "1.2.2"

                idTabeli = "'1.2.2'";
                idWiersza = "'1'";
                tab_122_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_122_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_122_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_122_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_122_w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_122_w01_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_122_w01_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_122_w01_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_122_w01_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_122_w01_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_122_w01_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_122_w01_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_122_w01_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_122_w01_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);
                tab_122_w01_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'",tenPlik);
                tab_122_w01_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'",tenPlik);
                tab_122_w01_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'",tenPlik);
                tab_122_w01_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'",tenPlik);
                tab_122_w01_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'",tenPlik);
                tab_122_w01_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'",tenPlik);
                tab_122_w01_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'",tenPlik);
                tab_122_w01_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'",tenPlik);
                tab_122_w01_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'",tenPlik);
                tab_122_w01_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'",tenPlik);
                tab_122_w01_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'",tenPlik);
                tab_122_w01_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'",tenPlik);

                idWiersza = "'2'";
                tab_122_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_122_w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_122_w02_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_122_w02_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_122_w02_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_122_w02_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_122_w02_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_122_w02_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_122_w02_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_122_w02_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_122_w02_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_122_w02_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_122_w02_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_122_w02_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);
                tab_122_w02_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'",tenPlik);
                tab_122_w02_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'",tenPlik);
                tab_122_w02_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'",tenPlik);
                tab_122_w02_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'",tenPlik);
                tab_122_w02_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'",tenPlik);
                tab_122_w02_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'",tenPlik);
                tab_122_w02_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'",tenPlik);
                tab_122_w02_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'",tenPlik);
                tab_122_w02_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'",tenPlik);
                tab_122_w02_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'",tenPlik);
                tab_122_w02_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'",tenPlik);
                tab_122_w02_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'",tenPlik);

                idWiersza = "'3'";
                tab_122_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_122_w03_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_122_w03_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_122_w03_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_122_w03_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_122_w03_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_122_w03_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_122_w03_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_122_w03_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_122_w03_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_122_w03_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_122_w03_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_122_w03_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_122_w03_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);
                tab_122_w03_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'",tenPlik);
                tab_122_w03_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'",tenPlik);
                tab_122_w03_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'",tenPlik);
                tab_122_w03_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'",tenPlik);
                tab_122_w03_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'",tenPlik);
                tab_122_w03_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'",tenPlik);
                tab_122_w03_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'",tenPlik);
                tab_122_w03_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'",tenPlik);
                tab_122_w03_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'",tenPlik);
                tab_122_w03_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'",tenPlik);
                tab_122_w03_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'",tenPlik);
                tab_122_w03_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'",tenPlik);

                idWiersza = "'4'";
                tab_122_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_122_w04_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_122_w04_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_122_w04_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_122_w04_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_122_w04_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_122_w04_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_122_w04_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_122_w04_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_122_w04_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_122_w04_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_122_w04_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_122_w04_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_122_w04_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);
                tab_122_w04_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'",tenPlik);
                tab_122_w04_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'",tenPlik);
                tab_122_w04_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'",tenPlik);
                tab_122_w04_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'",tenPlik);
                tab_122_w04_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'",tenPlik);
                tab_122_w04_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'",tenPlik);
                tab_122_w04_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'",tenPlik);
                tab_122_w04_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'",tenPlik);
                tab_122_w04_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'",tenPlik);
                tab_122_w04_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'",tenPlik);
                tab_122_w04_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'",tenPlik);
                tab_122_w04_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'",tenPlik);

                idWiersza = "'5'";
                tab_122_w05_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_122_w05_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_122_w05_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_122_w05_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_122_w05_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_122_w05_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_122_w05_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_122_w05_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_122_w05_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_122_w05_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_122_w05_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_122_w05_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_122_w05_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_122_w05_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);
                tab_122_w05_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'",tenPlik);
                tab_122_w05_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'",tenPlik);
                tab_122_w05_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'",tenPlik);
                tab_122_w05_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'",tenPlik);
                tab_122_w05_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'",tenPlik);
                tab_122_w05_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'",tenPlik);
                tab_122_w05_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'",tenPlik);
                tab_122_w05_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'",tenPlik);
                tab_122_w05_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'",tenPlik);
                tab_122_w05_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'",tenPlik);
                tab_122_w05_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'",tenPlik);
                tab_122_w05_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'",tenPlik);

                idWiersza = "'6'";
                tab_122_w11_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_122_w11_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_122_w11_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_122_w11_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_122_w11_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_122_w11_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_122_w11_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_122_w11_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_122_w11_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_122_w11_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_122_w11_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_122_w11_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_122_w11_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_122_w11_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);
                tab_122_w11_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'",tenPlik);
                tab_122_w11_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'",tenPlik);
                tab_122_w11_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'",tenPlik);
                tab_122_w11_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'",tenPlik);
                tab_122_w11_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'",tenPlik);
                tab_122_w11_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'",tenPlik);
                tab_122_w11_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'",tenPlik);
                tab_122_w11_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'",tenPlik);
                tab_122_w11_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'",tenPlik);
                tab_122_w11_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'",tenPlik);
                tab_122_w11_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'",tenPlik);
                tab_122_w11_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'",tenPlik);

                idWiersza = "'7'";
                tab_122_w07_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_122_w07_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_122_w07_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_122_w07_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_122_w07_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_122_w07_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_122_w07_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_122_w07_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_122_w07_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_122_w07_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_122_w07_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_122_w07_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_122_w07_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_122_w07_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);
                tab_122_w07_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'",tenPlik);
                tab_122_w07_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'",tenPlik);
                tab_122_w07_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'",tenPlik);
                tab_122_w07_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'",tenPlik);
                tab_122_w07_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'",tenPlik);
                tab_122_w07_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'",tenPlik);
                tab_122_w07_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'",tenPlik);
                tab_122_w07_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'",tenPlik);
                tab_122_w07_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'",tenPlik);
                tab_122_w07_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'",tenPlik);
                tab_122_w07_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'",tenPlik);
                tab_122_w07_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'",tenPlik);
                idWiersza = "'8'";
                tab_122_w08_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_122_w08_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_122_w08_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_122_w08_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_122_w08_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_122_w08_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_122_w08_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_122_w08_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_122_w08_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_122_w08_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_122_w08_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_122_w08_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_122_w08_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_122_w08_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);
                tab_122_w08_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'",tenPlik);
                tab_122_w08_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'",tenPlik);
                tab_122_w08_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'",tenPlik);
                tab_122_w08_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'",tenPlik);
                tab_122_w08_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'",tenPlik);
                tab_122_w08_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'",tenPlik);
                tab_122_w08_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'",tenPlik);
                tab_122_w08_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'",tenPlik);
                tab_122_w08_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'",tenPlik);
                tab_122_w08_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'",tenPlik);
                tab_122_w08_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'",tenPlik);
                tab_122_w08_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'",tenPlik);

                idWiersza = "'9'";
                tab_122_w09_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_122_w09_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_122_w09_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_122_w09_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_122_w09_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_122_w09_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_122_w09_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_122_w09_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_122_w09_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_122_w09_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_122_w09_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_122_w09_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_122_w09_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_122_w09_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);
                tab_122_w09_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'",tenPlik);
                tab_122_w09_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'",tenPlik);
                tab_122_w09_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'",tenPlik);
                tab_122_w09_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'",tenPlik);
                tab_122_w09_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'",tenPlik);
                tab_122_w09_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'",tenPlik);
                tab_122_w09_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'",tenPlik);
                tab_122_w09_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'",tenPlik);
                tab_122_w09_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'",tenPlik);
                tab_122_w09_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'",tenPlik);
                tab_122_w09_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'",tenPlik);
                tab_122_w09_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'",tenPlik);

                idWiersza = "'10'";
                tab_122_w10_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_122_w10_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_122_w10_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_122_w10_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_122_w10_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_122_w10_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_122_w10_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_122_w10_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_122_w10_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_122_w10_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_122_w10_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_122_w10_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_122_w10_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_122_w10_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);
                tab_122_w10_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'",tenPlik);
                tab_122_w10_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'",tenPlik);
                tab_122_w10_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'",tenPlik);
                tab_122_w10_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'",tenPlik);
                tab_122_w10_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'",tenPlik);
                tab_122_w10_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'",tenPlik);
                tab_122_w10_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'",tenPlik);
                tab_122_w10_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'",tenPlik);
                tab_122_w10_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'",tenPlik);
                tab_122_w10_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'",tenPlik);
                tab_122_w10_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'",tenPlik);
                tab_122_w10_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'",tenPlik);

                idWiersza = "'11'";
                tab_122_w11_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_122_w11_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_122_w11_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_122_w11_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_122_w11_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_122_w11_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_122_w11_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_122_w11_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_122_w11_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_122_w11_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_122_w11_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_122_w11_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_122_w11_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_122_w11_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);
                tab_122_w11_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'",tenPlik);
                tab_122_w11_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'",tenPlik);
                tab_122_w11_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'",tenPlik);
                tab_122_w11_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'",tenPlik);
                tab_122_w11_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'",tenPlik);
                tab_122_w11_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'",tenPlik);
                tab_122_w11_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'",tenPlik);
                tab_122_w11_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'",tenPlik);
                tab_122_w11_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'",tenPlik);
                tab_122_w11_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'",tenPlik);
                tab_122_w11_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'",tenPlik);
                tab_122_w11_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'",tenPlik);

                idWiersza = "'12'";
                tab_122_w12_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_122_w12_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_122_w12_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_122_w12_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_122_w12_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_122_w12_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_122_w12_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_122_w12_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_122_w12_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_122_w12_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_122_w12_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_122_w12_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_122_w12_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_122_w12_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);
                tab_122_w12_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'",tenPlik);
                tab_122_w12_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'",tenPlik);
                tab_122_w12_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'",tenPlik);
                tab_122_w12_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'",tenPlik);
                tab_122_w12_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'",tenPlik);
                tab_122_w12_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'",tenPlik);
                tab_122_w12_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'",tenPlik);
                tab_122_w12_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'",tenPlik);
                tab_122_w12_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'",tenPlik);
                tab_122_w12_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'",tenPlik);
                tab_122_w12_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'",tenPlik);
                tab_122_w12_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'",tenPlik);

                idWiersza = "'13'";
                tab_122_w13_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_122_w13_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_122_w13_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_122_w13_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_122_w13_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_122_w13_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_122_w13_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_122_w13_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_122_w13_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_122_w13_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_122_w13_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_122_w13_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_122_w13_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_122_w13_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);
                tab_122_w13_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'",tenPlik);
                tab_122_w13_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'",tenPlik);
                tab_122_w13_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'",tenPlik);
                tab_122_w13_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'",tenPlik);
                tab_122_w13_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'",tenPlik);
                tab_122_w13_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'",tenPlik);
                tab_122_w13_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'",tenPlik);
                tab_122_w13_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'",tenPlik);
                tab_122_w13_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'",tenPlik);
                tab_122_w13_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'",tenPlik);
                tab_122_w13_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'",tenPlik);
                tab_122_w13_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'",tenPlik);

                idWiersza = "'14'";
                tab_122_w14_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_122_w14_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_122_w14_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_122_w14_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_122_w14_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_122_w14_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_122_w14_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_122_w14_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_122_w14_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_122_w14_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_122_w14_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_122_w14_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_122_w14_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_122_w14_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);
                tab_122_w14_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'",tenPlik);
                tab_122_w14_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'",tenPlik);
                tab_122_w14_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'",tenPlik);
                tab_122_w14_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'",tenPlik);
                tab_122_w14_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'",tenPlik);
                tab_122_w14_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'",tenPlik);
                tab_122_w14_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'",tenPlik);
                tab_122_w14_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'",tenPlik);
                tab_122_w14_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'",tenPlik);
                tab_122_w14_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'",tenPlik);
                tab_122_w14_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'",tenPlik);
                tab_122_w14_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'",tenPlik);

                idWiersza = "'15'";
                tab_122_w15_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_122_w15_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_122_w15_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_122_w15_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_122_w15_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_122_w15_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_122_w15_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_122_w15_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_122_w15_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_122_w15_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_122_w15_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_122_w15_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_122_w15_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_122_w15_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);
                tab_122_w15_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'",tenPlik);
                tab_122_w15_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'",tenPlik);
                tab_122_w15_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'",tenPlik);
                tab_122_w15_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'",tenPlik);
                tab_122_w15_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'",tenPlik);
                tab_122_w15_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'",tenPlik);
                tab_122_w15_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'",tenPlik);
                tab_122_w15_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'",tenPlik);
                tab_122_w15_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'",tenPlik);
                tab_122_w15_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'",tenPlik);
                tab_122_w15_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'",tenPlik);
                tab_122_w15_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'",tenPlik);

                idWiersza = "'16'";
                tab_122_w16_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_122_w16_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_122_w16_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_122_w16_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_122_w16_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_122_w16_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_122_w16_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_122_w16_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_122_w16_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_122_w16_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_122_w16_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_122_w16_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_122_w16_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_122_w16_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);
                tab_122_w16_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'",tenPlik);
                tab_122_w16_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'",tenPlik);
                tab_122_w16_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'",tenPlik);
                tab_122_w16_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'",tenPlik);
                tab_122_w16_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'",tenPlik);
                tab_122_w16_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'",tenPlik);
                tab_122_w16_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'",tenPlik);
                tab_122_w16_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'",tenPlik);
                tab_122_w16_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'",tenPlik);
                tab_122_w16_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'",tenPlik);
                tab_122_w16_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'",tenPlik);
                tab_122_w16_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'",tenPlik);

                idWiersza = "'17'";
                tab_122_w17_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_122_w17_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_122_w17_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_122_w17_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_122_w17_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_122_w17_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_122_w17_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_122_w17_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_122_w17_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_122_w17_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_122_w17_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_122_w17_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_122_w17_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_122_w17_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);
                tab_122_w17_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'",tenPlik);
                tab_122_w17_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'",tenPlik);
                tab_122_w17_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'",tenPlik);
                tab_122_w17_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'",tenPlik);
                tab_122_w17_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'",tenPlik);
                tab_122_w17_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'",tenPlik);
                tab_122_w17_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'",tenPlik);
                tab_122_w17_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'",tenPlik);
                tab_122_w17_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'",tenPlik);
                tab_122_w17_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'",tenPlik);
                tab_122_w17_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'",tenPlik);
                tab_122_w17_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'",tenPlik);

                idWiersza = "'18'";
                tab_122_w18_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_122_w18_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_122_w18_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_122_w18_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_122_w18_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_122_w18_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_122_w18_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_122_w18_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_122_w18_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_122_w18_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_122_w18_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_122_w18_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_122_w18_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_122_w18_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);
                tab_122_w18_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'",tenPlik);
                tab_122_w18_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'",tenPlik);
                tab_122_w18_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'",tenPlik);
                tab_122_w18_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'",tenPlik);
                tab_122_w18_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'",tenPlik);
                tab_122_w18_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'",tenPlik);
                tab_122_w18_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'",tenPlik);
                tab_122_w18_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'",tenPlik);
                tab_122_w18_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'",tenPlik);
                tab_122_w18_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'",tenPlik);
                tab_122_w18_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'",tenPlik);
                tab_122_w18_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'",tenPlik);

                idWiersza = "'19'";
                tab_122_w19_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_122_w19_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_122_w19_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_122_w19_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_122_w19_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_122_w19_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_122_w19_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_122_w19_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_122_w19_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_122_w19_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_122_w19_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_122_w19_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_122_w19_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_122_w19_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);
                tab_122_w19_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'",tenPlik);
                tab_122_w19_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'",tenPlik);
                tab_122_w19_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'",tenPlik);
                tab_122_w19_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'",tenPlik);
                tab_122_w19_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'",tenPlik);
                tab_122_w19_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'",tenPlik);
                tab_122_w19_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'",tenPlik);
                tab_122_w19_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'",tenPlik);
                tab_122_w19_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'",tenPlik);
                tab_122_w19_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'",tenPlik);
                tab_122_w19_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'",tenPlik);
                tab_122_w19_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'",tenPlik);

                idWiersza = "'20'";
                tab_122_w20_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_122_w20_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_122_w20_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_122_w20_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_122_w20_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_122_w20_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_122_w20_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_122_w20_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_122_w20_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_122_w20_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_122_w20_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_122_w20_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_122_w20_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_122_w20_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);
                tab_122_w20_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'",tenPlik);
                tab_122_w20_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'",tenPlik);
                tab_122_w20_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'",tenPlik);
                tab_122_w20_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'",tenPlik);
                tab_122_w20_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'",tenPlik);
                tab_122_w20_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'",tenPlik);
                tab_122_w20_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'",tenPlik);
                tab_122_w20_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'",tenPlik);
                tab_122_w20_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'",tenPlik);
                tab_122_w20_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'",tenPlik);
                tab_122_w20_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'",tenPlik);
                tab_122_w20_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'",tenPlik);

                idWiersza = "'21'";
                tab_122_w21_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_122_w21_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_122_w21_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_122_w21_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_122_w21_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_122_w21_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_122_w21_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_122_w21_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_122_w21_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_122_w21_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_122_w21_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_122_w21_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_122_w21_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_122_w21_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);
                tab_122_w21_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'",tenPlik);
                tab_122_w21_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'",tenPlik);
                tab_122_w21_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'",tenPlik);
                tab_122_w21_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'",tenPlik);
                tab_122_w21_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'",tenPlik);
                tab_122_w21_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'",tenPlik);
                tab_122_w21_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'",tenPlik);
                tab_122_w21_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'",tenPlik);
                tab_122_w21_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'",tenPlik);
                tab_122_w21_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'",tenPlik);
                tab_122_w21_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'",tenPlik);
                tab_122_w21_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'",tenPlik);

                idWiersza = "'22'";
                tab_122_w22_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_122_w22_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_122_w22_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_122_w22_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_122_w22_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_122_w22_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_122_w22_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_122_w22_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_122_w22_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_122_w22_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_122_w22_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_122_w22_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_122_w22_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_122_w22_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);
                tab_122_w22_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'",tenPlik);
                tab_122_w22_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'",tenPlik);
                tab_122_w22_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'",tenPlik);
                tab_122_w22_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'",tenPlik);
                tab_122_w22_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'",tenPlik);
                tab_122_w22_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'",tenPlik);
                tab_122_w22_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'",tenPlik);
                tab_122_w22_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'",tenPlik);
                tab_122_w22_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'",tenPlik);
                tab_122_w22_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'",tenPlik);
                tab_122_w22_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'",tenPlik);
                tab_122_w22_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'",tenPlik);

                idWiersza = "'23'";
                tab_122_w23_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_122_w23_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_122_w23_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_122_w23_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_122_w23_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_122_w23_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_122_w23_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_122_w23_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_122_w23_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_122_w23_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_122_w23_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_122_w23_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_122_w23_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_122_w23_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);
                tab_122_w23_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'",tenPlik);
                tab_122_w23_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'",tenPlik);
                tab_122_w23_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'",tenPlik);
                tab_122_w23_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'",tenPlik);
                tab_122_w23_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'",tenPlik);
                tab_122_w23_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'",tenPlik);
                tab_122_w23_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'",tenPlik);
                tab_122_w23_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'",tenPlik);
                tab_122_w23_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'",tenPlik);
                tab_122_w23_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'",tenPlik);
                tab_122_w23_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'",tenPlik);
                tab_122_w23_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'",tenPlik);

                idWiersza = "'24'";
                tab_122_w24_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_122_w24_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_122_w24_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_122_w24_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_122_w24_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_122_w24_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_122_w24_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_122_w24_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_122_w24_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_122_w24_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_122_w24_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_122_w24_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_122_w24_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_122_w24_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);
                tab_122_w24_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'",tenPlik);
                tab_122_w24_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'",tenPlik);
                tab_122_w24_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'",tenPlik);
                tab_122_w24_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'",tenPlik);
                tab_122_w24_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'",tenPlik);
                tab_122_w24_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'",tenPlik);
                tab_122_w24_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'",tenPlik);
                tab_122_w24_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'",tenPlik);
                tab_122_w24_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'",tenPlik);
                tab_122_w24_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'",tenPlik);
                tab_122_w24_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'",tenPlik);
                tab_122_w24_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'",tenPlik);

                idWiersza = "'25'";
                tab_122_w25_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_122_w25_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_122_w25_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_122_w25_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_122_w25_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_122_w25_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_122_w25_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_122_w25_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_122_w25_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_122_w25_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_122_w25_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_122_w25_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_122_w25_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_122_w25_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);
                tab_122_w25_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'",tenPlik);
                tab_122_w25_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'",tenPlik);
                tab_122_w25_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'",tenPlik);
                tab_122_w25_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'",tenPlik);
                tab_122_w25_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'",tenPlik);
                tab_122_w25_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'",tenPlik);
                tab_122_w25_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'",tenPlik);
                tab_122_w25_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'",tenPlik);
                tab_122_w25_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'",tenPlik);
                tab_122_w25_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'",tenPlik);
                tab_122_w25_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'",tenPlik);
                tab_122_w25_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'",tenPlik);

                idWiersza = "'26'";
                tab_122_w26_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_122_w26_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_122_w26_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_122_w26_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_122_w26_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_122_w26_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_122_w26_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_122_w26_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_122_w26_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_122_w26_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_122_w26_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_122_w26_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_122_w26_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_122_w26_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);
                tab_122_w26_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'",tenPlik);
                tab_122_w26_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'",tenPlik);
                tab_122_w26_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'",tenPlik);
                tab_122_w26_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'",tenPlik);
                tab_122_w26_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'",tenPlik);
                tab_122_w26_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'",tenPlik);
                tab_122_w26_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'",tenPlik);
                tab_122_w26_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'",tenPlik);
                tab_122_w26_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'",tenPlik);
                tab_122_w26_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'",tenPlik);
                tab_122_w26_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'",tenPlik);
                tab_122_w26_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'",tenPlik);

                idWiersza = "'27'";
                tab_122_w27_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_122_w27_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_122_w27_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_122_w27_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_122_w27_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_122_w27_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_122_w27_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_122_w27_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_122_w27_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_122_w27_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_122_w27_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_122_w27_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_122_w27_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_122_w27_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);
                tab_122_w27_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'",tenPlik);
                tab_122_w27_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'",tenPlik);
                tab_122_w27_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'",tenPlik);
                tab_122_w27_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'",tenPlik);
                tab_122_w27_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'",tenPlik);
                tab_122_w27_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'",tenPlik);
                tab_122_w27_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'",tenPlik);
                tab_122_w27_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'",tenPlik);
                tab_122_w27_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'",tenPlik);
                tab_122_w27_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'",tenPlik);
                tab_122_w27_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'",tenPlik);
                tab_122_w27_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'",tenPlik);

                idWiersza = "'28'";
                tab_122_w28_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_122_w28_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_122_w28_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_122_w28_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_122_w28_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_122_w28_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_122_w28_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_122_w28_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_122_w28_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_122_w28_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_122_w28_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_122_w28_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_122_w28_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_122_w28_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);
                tab_122_w28_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'",tenPlik);
                tab_122_w28_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'",tenPlik);
                tab_122_w28_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'",tenPlik);
                tab_122_w28_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'",tenPlik);
                tab_122_w28_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'",tenPlik);
                tab_122_w28_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'",tenPlik);
                tab_122_w28_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'",tenPlik);
                tab_122_w28_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'",tenPlik);
                tab_122_w28_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'",tenPlik);
                tab_122_w28_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'",tenPlik);
                tab_122_w28_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'",tenPlik);
                tab_122_w28_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'",tenPlik);

                idWiersza = "'29'";
                tab_122_w29_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_122_w29_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_122_w29_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_122_w29_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_122_w29_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_122_w29_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_122_w29_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_122_w29_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_122_w29_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_122_w29_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_122_w29_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_122_w29_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_122_w29_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_122_w29_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);
                tab_122_w29_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'",tenPlik);
                tab_122_w29_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'",tenPlik);
                tab_122_w29_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'",tenPlik);
                tab_122_w29_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'",tenPlik);
                tab_122_w29_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'",tenPlik);
                tab_122_w29_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'",tenPlik);
                tab_122_w29_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'",tenPlik);
                tab_122_w29_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'",tenPlik);
                tab_122_w29_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'",tenPlik);
                tab_122_w29_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'",tenPlik);
                tab_122_w29_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'",tenPlik);
                tab_122_w29_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'",tenPlik);

                idWiersza = "'30'";
                tab_122_w30_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_122_w30_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_122_w30_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_122_w30_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_122_w30_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_122_w30_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_122_w30_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_122_w30_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_122_w30_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_122_w30_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_122_w30_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_122_w30_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_122_w30_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_122_w30_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);
                tab_122_w30_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'",tenPlik);
                tab_122_w30_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'",tenPlik);
                tab_122_w30_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'",tenPlik);
                tab_122_w30_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'",tenPlik);
                tab_122_w30_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'",tenPlik);
                tab_122_w30_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'",tenPlik);
                tab_122_w30_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'",tenPlik);
                tab_122_w30_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'",tenPlik);
                tab_122_w30_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'",tenPlik);
                tab_122_w30_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'",tenPlik);
                tab_122_w30_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'",tenPlik);
                tab_122_w30_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'",tenPlik);

                idWiersza = "'31'";
                tab_122_w31_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_122_w31_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_122_w31_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_122_w31_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_122_w31_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_122_w31_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_122_w31_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_122_w31_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_122_w31_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_122_w31_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_122_w31_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_122_w31_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_122_w31_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_122_w31_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);
                tab_122_w31_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'",tenPlik);
                tab_122_w31_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'",tenPlik);
                tab_122_w31_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'",tenPlik);
                tab_122_w31_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'",tenPlik);
                tab_122_w31_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'",tenPlik);
                tab_122_w31_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'",tenPlik);
                tab_122_w31_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'",tenPlik);
                tab_122_w31_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'",tenPlik);
                tab_122_w31_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'",tenPlik);
                tab_122_w31_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'",tenPlik);
                tab_122_w31_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'",tenPlik);
                tab_122_w31_c26.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='26'",tenPlik);

                #endregion "1.2.2"

                #region "1.3"

                idTabeli = "'1.3'";
                idWiersza = "'1'";
                tab_13_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_13_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_13_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_13_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_13_w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_13_w01_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_13_w01_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_13_w01_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_13_w01_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_13_w01_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_13_w01_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_13_w01_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_13_w01_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_13_w01_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);

                idWiersza = "'2'";
                tab_13_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_13_w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_13_w02_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_13_w02_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_13_w02_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_13_w02_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_13_w02_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_13_w02_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_13_w02_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_13_w02_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_13_w02_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_13_w02_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_13_w02_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_13_w02_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);

                idWiersza = "'3'";
                tab_13_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_13_w03_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_13_w03_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_13_w03_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_13_w03_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_13_w03_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_13_w03_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_13_w03_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_13_w03_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_13_w03_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_13_w03_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_13_w03_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_13_w03_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_13_w03_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);

                idWiersza = "'4'";
                tab_13_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_13_w04_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_13_w04_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_13_w04_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_13_w04_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_13_w04_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_13_w04_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_13_w04_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_13_w04_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_13_w04_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_13_w04_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_13_w04_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_13_w04_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_13_w04_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);

                idWiersza = "'5'";
                tab_13_w05_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_13_w05_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_13_w05_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_13_w05_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_13_w05_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_13_w05_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_13_w05_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_13_w05_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_13_w05_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_13_w05_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_13_w05_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_13_w05_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_13_w05_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_13_w05_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);

                idWiersza = "'6'";
                tab_13_w06_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_13_w06_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_13_w06_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_13_w06_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_13_w06_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_13_w06_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_13_w06_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_13_w06_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_13_w06_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_13_w06_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_13_w06_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_13_w06_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_13_w06_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_13_w06_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);

                #endregion "1.3"

                #region "2.1.1"

                idTabeli = "'2.1.1'";
                idWiersza = "'1'";
                tab_211_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_211_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_211_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_211_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_211_w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_211_w01_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_211_w01_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_211_w01_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_211_w01_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_211_w01_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_211_w01_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);

                idWiersza = "'2'";
                tab_211_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_211_w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_211_w02_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_211_w02_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_211_w02_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_211_w02_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_211_w02_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_211_w02_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_211_w02_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_211_w02_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_211_w02_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);

                idWiersza = "'3'";
                tab_211_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_211_w03_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_211_w03_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_211_w03_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_211_w03_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_211_w03_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_211_w03_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_211_w03_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_211_w03_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_211_w03_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_211_w03_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);

                idWiersza = "'4'";
                tab_211_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_211_w04_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_211_w04_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_211_w04_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_211_w04_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_211_w04_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_211_w04_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_211_w04_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_211_w04_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_211_w04_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_211_w04_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);

                idWiersza = "'5'";
                tab_211_w05_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_211_w05_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_211_w05_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_211_w05_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_211_w05_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_211_w05_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_211_w05_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_211_w05_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_211_w05_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_211_w05_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_211_w05_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);

                idWiersza = "'6'";
                tab_211_w06_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_211_w06_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_211_w06_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_211_w06_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_211_w06_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_211_w06_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_211_w06_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_211_w06_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_211_w06_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_211_w06_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_211_w06_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);

                idWiersza = "'7'";
                tab_211_w07_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_211_w07_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_211_w07_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_211_w07_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_211_w07_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_211_w07_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_211_w07_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_211_w07_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_211_w07_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_211_w07_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_211_w07_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);

                idWiersza = "'8'";
                tab_211_w08_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_211_w08_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_211_w08_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_211_w08_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_211_w08_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_211_w08_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_211_w08_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_211_w08_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_211_w08_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_211_w08_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_211_w08_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);

                idWiersza = "'9'";
                tab_211_w09_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_211_w09_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_211_w09_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_211_w09_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_211_w09_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_211_w09_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_211_w09_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_211_w09_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_211_w09_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_211_w09_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_211_w09_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);

                idWiersza = "'10'";
                tab_211_w10_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_211_w10_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_211_w10_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_211_w10_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_211_w10_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_211_w10_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_211_w10_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_211_w10_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_211_w10_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_211_w10_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_211_w10_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);

                idWiersza = "'11'";
                tab_211_w11_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_211_w11_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_211_w11_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_211_w11_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_211_w11_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_211_w11_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_211_w11_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_211_w11_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_211_w11_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_211_w11_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_211_w11_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);

                #endregion "2.1.1"

                #region "2.1.1.a"

                idTabeli = "'2.1.1.a'";
                idWiersza = "'1'";

                tab_211a_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_211a_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_211a_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_211a_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_211a_w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_211a_w01_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_211a_w01_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_211a_w01_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_211a_w01_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_211a_w01_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_211a_w01_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);

                idWiersza = "'2'";
                tab_211a_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_211a_w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_211a_w02_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_211a_w02_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_211a_w02_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_211a_w02_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_211a_w02_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_211a_w02_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_211a_w02_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_211a_w02_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_211a_w02_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);

                idWiersza = "'3'";
                tab_211a_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_211a_w03_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_211a_w03_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_211a_w03_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_211a_w03_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_211a_w03_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_211a_w03_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_211a_w03_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_211a_w03_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_211a_w03_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_211a_w03_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);

                idWiersza = "'4'";
                tab_211a_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_211a_w04_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_211a_w04_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_211a_w04_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_211a_w04_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_211a_w04_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_211a_w04_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_211a_w04_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_211a_w04_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_211a_w04_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_211a_w04_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);

                idWiersza = "'5'";
                tab_211a_w05_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_211a_w05_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_211a_w05_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_211a_w05_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_211a_w05_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_211a_w05_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_211a_w05_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_211a_w05_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_211a_w05_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_211a_w05_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_211a_w05_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);

                idWiersza = "'6'";
                tab_211a_w06_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_211a_w06_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_211a_w06_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_211a_w06_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_211a_w06_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_211a_w06_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_211a_w06_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_211a_w06_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_211a_w06_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_211a_w06_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_211a_w06_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);

                idWiersza = "'7'";
                tab_211a_w07_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_211a_w07_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_211a_w07_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_211a_w07_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_211a_w07_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_211a_w07_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_211a_w07_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_211a_w07_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_211a_w07_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_211a_w07_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_211a_w07_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);

                idWiersza = "'8'";
                tab_211a_w08_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_211a_w08_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_211a_w08_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_211a_w08_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_211a_w08_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_211a_w08_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_211a_w08_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_211a_w08_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_211a_w08_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_211a_w08_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_211a_w08_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);

                idWiersza = "'9'";
                tab_211a_w09_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_211a_w09_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_211a_w09_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_211a_w09_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_211a_w09_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_211a_w09_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_211a_w09_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_211a_w09_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_211a_w09_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_211a_w09_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_211a_w09_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);

                idWiersza = "'10'";
                tab_211a_w10_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_211a_w10_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_211a_w10_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_211a_w10_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_211a_w10_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_211a_w10_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_211a_w10_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_211a_w10_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_211a_w10_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_211a_w10_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_211a_w10_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);

                idWiersza = "'11'";
                tab_211a_w11_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_211a_w11_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_211a_w11_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_211a_w11_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_211a_w11_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_211a_w11_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_211a_w11_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_211a_w11_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_211a_w11_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_211a_w11_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_211a_w11_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);

                #endregion "2.1.1.a"

                #region "2.1.2"

                idTabeli = "'2.1.2'";
                idWiersza = "'1'";
                tab_212_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_212_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_212_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_212_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_212_w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_212_w01_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_212_w01_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_212_w01_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_212_w01_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_212_w01_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_212_w01_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);

                idWiersza = "'2'";
                tab_212_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_212_w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_212_w02_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_212_w02_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_212_w02_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_212_w02_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_212_w02_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_212_w02_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_212_w02_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_212_w02_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_212_w02_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);

                idWiersza = "'3'";
                tab_212_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_212_w03_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_212_w03_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_212_w03_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_212_w03_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_212_w03_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_212_w03_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_212_w03_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_212_w03_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_212_w03_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_212_w03_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);

                idWiersza = "'4'";
                tab_212_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_212_w04_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_212_w04_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_212_w04_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_212_w04_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_212_w04_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_212_w04_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_212_w04_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_212_w04_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_212_w04_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_212_w04_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);

                idWiersza = "'5'";
                tab_212_w05_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_212_w05_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_212_w05_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_212_w05_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_212_w05_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_212_w05_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_212_w05_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_212_w05_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_212_w05_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_212_w05_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_212_w05_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);

                idWiersza = "'6'";
                tab_212_w06_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_212_w06_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_212_w06_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_212_w06_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_212_w06_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_212_w06_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_212_w06_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_212_w06_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_212_w06_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_212_w06_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_212_w06_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);

                idWiersza = "'7'";
                tab_212_w07_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_212_w07_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_212_w07_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_212_w07_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_212_w07_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_212_w07_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_212_w07_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_212_w07_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_212_w07_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_212_w07_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_212_w07_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);

                idWiersza = "'8'";
                tab_212_w08_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_212_w08_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_212_w08_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_212_w08_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_212_w08_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_212_w08_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_212_w08_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_212_w08_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_212_w08_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_212_w08_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_212_w08_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);

                idWiersza = "'9'";
                tab_212_w09_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_212_w09_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_212_w09_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_212_w09_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_212_w09_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_212_w09_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_212_w09_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_212_w09_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_212_w09_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_212_w09_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_212_w09_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);

                idWiersza = "'10'";
                tab_212_w10_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_212_w10_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_212_w10_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_212_w10_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_212_w10_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_212_w10_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_212_w10_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_212_w10_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_212_w10_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_212_w10_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_212_w10_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);

                idWiersza = "'11'";
                tab_212_w11_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_212_w11_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_212_w11_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_212_w11_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_212_w11_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_212_w11_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_212_w11_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_212_w11_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_212_w11_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_212_w11_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_212_w11_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);

                #endregion "2.1.2"

                #region "2.2"

                idTabeli = "'2.2'";
                idWiersza = "'1'";
                tab_22_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_22_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_22_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_22_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_22_w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_22_w01_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_22_w01_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_22_w01_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_22_w01_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);

                idWiersza = "'2'";
                tab_22_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_22_w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_22_w02_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_22_w02_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_22_w02_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_22_w02_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_22_w02_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_22_w02_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_22_w02_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);

                idWiersza = "'3'";
                tab_22_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_22_w03_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_22_w03_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_22_w03_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_22_w03_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_22_w03_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_22_w03_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_22_w03_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_22_w03_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);

                idWiersza = "'4'";
                tab_22_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_22_w04_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_22_w04_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_22_w04_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_22_w04_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_22_w04_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_22_w04_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_22_w04_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_22_w04_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);

                idWiersza = "'5'";
                tab_22_w05_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_22_w05_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_22_w05_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_22_w05_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_22_w05_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_22_w05_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_22_w05_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_22_w05_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_22_w05_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);

                idWiersza = "'6'";
                tab_22_w06_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_22_w06_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_22_w06_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_22_w06_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_22_w06_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_22_w06_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_22_w06_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_22_w06_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_22_w06_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);

                idWiersza = "'7'";
                tab_22_w07_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_22_w07_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_22_w07_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_22_w07_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_22_w07_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_22_w07_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_22_w07_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_22_w07_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_22_w07_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);

                idWiersza = "'8'";
                tab_22_w08_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_22_w08_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_22_w08_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_22_w08_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_22_w08_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_22_w08_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_22_w08_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_22_w08_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_22_w08_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);

                idWiersza = "'9'";
                tab_22_w09_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_22_w09_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_22_w09_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_22_w09_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_22_w09_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_22_w09_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_22_w09_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_22_w09_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_22_w09_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);

                idWiersza = "'10'";
                tab_22_w10_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_22_w10_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_22_w10_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_22_w10_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_22_w10_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_22_w10_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_22_w10_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_22_w10_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_22_w10_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);

                idWiersza = "'11'";
                tab_22_w11_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_22_w11_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_22_w11_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_22_w11_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_22_w11_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_22_w11_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_22_w11_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_22_w11_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_22_w11_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);

                #endregion "2.2"

                #region "2.2.a"

                idTabeli = "'2.2.a'";
                idWiersza = "'1'";
                tab_22a_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_22a_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_22a_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_22a_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_22a_w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_22a_w01_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_22a_w01_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_22a_w01_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_22a_w01_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);

                idWiersza = "'2'";
                tab_22a_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_22a_w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_22a_w02_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_22a_w02_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_22a_w02_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_22a_w02_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_22a_w02_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_22a_w02_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_22a_w02_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);

                idWiersza = "'3'";
                tab_22a_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_22a_w03_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_22a_w03_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_22a_w03_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_22a_w03_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_22a_w03_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_22a_w03_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_22a_w03_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_22a_w03_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);

                idWiersza = "'4'";
                tab_22a_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_22a_w04_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_22a_w04_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_22a_w04_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_22a_w04_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_22a_w04_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_22a_w04_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_22a_w04_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_22a_w04_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);

                idWiersza = "'5'";
                tab_22a_w05_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_22a_w05_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_22a_w05_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_22a_w05_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_22a_w05_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_22a_w05_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_22a_w05_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_22a_w05_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_22a_w05_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);

                idWiersza = "'6'";
                tab_22a_w06_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_22a_w06_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_22a_w06_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_22a_w06_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_22a_w06_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_22a_w06_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_22a_w06_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_22a_w06_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_22a_w06_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);

                idWiersza = "'7'";
                tab_22a_w07_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_22a_w07_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_22a_w07_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_22a_w07_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_22a_w07_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_22a_w07_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_22a_w07_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_22a_w07_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_22a_w07_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);

                idWiersza = "'8'";
                tab_22a_w08_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_22a_w08_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_22a_w08_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_22a_w08_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_22a_w08_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_22a_w08_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_22a_w08_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_22a_w08_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_22a_w08_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);

                idWiersza = "'9'";
                tab_22a_w09_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_22a_w09_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_22a_w09_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_22a_w09_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_22a_w09_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_22a_w09_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_22a_w09_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_22a_w09_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_22a_w09_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);

                idWiersza = "'10'";
                tab_22a_w10_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_22a_w10_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_22a_w10_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_22a_w10_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_22a_w10_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_22a_w10_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_22a_w10_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_22a_w10_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_22a_w10_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);

                idWiersza = "'11'";
                tab_22a_w11_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_22a_w11_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_22a_w11_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_22a_w11_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_22a_w11_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_22a_w11_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_22a_w11_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_22a_w11_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_22a_w11_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);

                #endregion "2.2.a"

                #region "3"

                idTabeli = "'3'";
                idWiersza = "'1'";
                tab_3_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_3_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_3_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_3_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_3_w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_3_w01_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_3_w01_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_3_w01_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);

                idWiersza = "'2'";
                tab_3_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_3_w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_3_w02_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_3_w02_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_3_w02_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_3_w02_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_3_w02_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_3_w02_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);

                idWiersza = "'3'";
                tab_3_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_3_w03_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_3_w03_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_3_w03_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_3_w03_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_3_w03_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_3_w03_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_3_w03_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);

                idWiersza = "'4'";
                tab_3_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_3_w04_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_3_w04_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_3_w04_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_3_w04_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_3_w04_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_3_w04_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_3_w04_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);

                #endregion "3"

                #region "3.1"

                idTabeli = "'3.1'";
                idWiersza = "'1'";
                tab_31_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_31_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_31_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_31_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_31_w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_31_w01_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);

                idWiersza = "'2'";
                tab_31_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_31_w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_31_w02_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_31_w02_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_31_w02_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_31_w02_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);

                idWiersza = "'3'";
                tab_31_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_31_w03_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_31_w03_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_31_w03_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_31_w03_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_31_w03_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);

                idWiersza = "'4'";
                tab_31_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_31_w04_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_31_w04_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_31_w04_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_31_w04_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_31_w04_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);

                idWiersza = "'5'";
                tab_31_w05_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_31_w05_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_31_w05_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_31_w05_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_31_w05_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_31_w05_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);

                #endregion "3.1"

                #region "4.1"

                idTabeli = "'4.1'";
                idWiersza = "'1'";
                tab_41_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'2'";
                tab_41_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'3'";
                tab_41_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'4'";
                tab_41_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                #endregion "4.1"

                #region "4.2"

                idTabeli = "'4.2'";
                idWiersza = "'1'";
                tab_42_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'2'";
                tab_42_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'3'";
                tab_42_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'4'";
                tab_42_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'5'";
                tab_42_w05_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'6'";
                tab_42_w06_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'7'";
                tab_42_w07_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                #endregion "4.2"

                #region "4.3"

                idTabeli = "'4.3'";
                idWiersza = "'1'";
                tab_43_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'2'";
                tab_43_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                #endregion "4.3"

                #region "5"

                idTabeli = "'5'";
                idWiersza = "'1'";
                tab_5_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'2'";
                tab_5_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'3'";
                tab_5_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'4'";
                tab_5_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                #endregion "5"

                #region "6"

                idTabeli = "'6'";
                idWiersza = "'1'";
                tab_6_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'2'";
                tab_6_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'3'";
                tab_6_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'4'";
                tab_6_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'5'";
                tab_6_w05_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'6'";
                tab_6_w06_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'7'";
                tab_6_w07_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'8'";
                tab_6_w08_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'9'";
                tab_6_w09_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'10'";
                tab_6_w10_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'11'";
                tab_6_w11_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                idWiersza = "'12'";
                tab_6_w12_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'13'";
                tab_6_w13_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'14'";
                tab_6_w14_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'15'";
                tab_6_w15_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'16'";
                tab_6_w16_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'17'";
                tab_6_w17_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'18'";
                tab_6_w18_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'19'";
                tab_6_w19_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'20'";
                tab_6_w20_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                idWiersza = "'21'";
                tab_6_w21_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                idWiersza = "'22'";
                tab_6_w22_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                idWiersza = "'23'";
                tab_6_w23_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                idWiersza = "'24'";
                tab_6_w24_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                idWiersza = "'25'";
                tab_6_w25_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                idWiersza = "'26'";
                tab_6_w26_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                idWiersza = "'27'";
                tab_6_w27_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                idWiersza = "'28'";
                tab_6_w28_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                #endregion "6"

                #region "7.1"

                idTabeli = "'7.1'";
                idWiersza = "'1'";
                tab_7_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_7_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_7_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_7_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_7_w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_7_w01_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_7_w01_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);

                #endregion "7.1"

                #region "8"

                idTabeli = "'8'";
                idWiersza = "'1'";
                tab_8_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_8_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_8_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_8_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_8_w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_8_w01_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_8_w01_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_8_w01_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_8_w01_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_8_w01_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_8_w01_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_8_w01_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_8_w01_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_8_w01_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);
                tab_8_w01_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'",tenPlik);
                tab_8_w01_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'",tenPlik);
                tab_8_w01_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'",tenPlik);
                tab_8_w01_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'",tenPlik);

                idWiersza = "'2'";
                tab_8_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_8_w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_8_w02_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_8_w02_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_8_w02_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_8_w02_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_8_w02_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_8_w02_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_8_w02_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_8_w02_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_8_w02_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_8_w02_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_8_w02_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_8_w02_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);
                tab_8_w02_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'",tenPlik);
                tab_8_w02_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'",tenPlik);
                tab_8_w02_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'",tenPlik);
                tab_8_w02_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'",tenPlik);

                idWiersza = "'3'";
                tab_8_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_8_w03_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_8_w03_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_8_w03_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_8_w03_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_8_w03_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_8_w03_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_8_w03_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_8_w03_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_8_w03_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_8_w03_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_8_w03_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_8_w03_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_8_w03_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);
                tab_8_w03_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'",tenPlik);
                tab_8_w03_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'",tenPlik);
                tab_8_w03_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'",tenPlik);
                tab_8_w03_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'",tenPlik);

                idWiersza = "'4'";
                tab_8_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_8_w04_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_8_w04_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_8_w04_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_8_w04_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_8_w04_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_8_w04_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_8_w04_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_8_w04_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_8_w04_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_8_w04_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_8_w04_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_8_w04_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_8_w04_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);
                tab_8_w04_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'",tenPlik);
                tab_8_w04_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'",tenPlik);
                tab_8_w04_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'",tenPlik);
                tab_8_w04_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'",tenPlik);

                idWiersza = "'5'";
                tab_8_w05_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_8_w05_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_8_w05_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_8_w05_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_8_w05_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_8_w05_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_8_w05_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_8_w05_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_8_w05_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_8_w05_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_8_w05_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_8_w05_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_8_w05_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_8_w05_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);
                tab_8_w05_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'",tenPlik);
                tab_8_w05_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'",tenPlik);
                tab_8_w05_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'",tenPlik);
                tab_8_w05_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'",tenPlik);

                idWiersza = "'6'";
                tab_8_w06_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_8_w06_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_8_w06_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_8_w06_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_8_w06_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_8_w06_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_8_w06_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_8_w06_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_8_w06_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_8_w06_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_8_w06_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_8_w06_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_8_w06_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_8_w06_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);
                tab_8_w06_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'",tenPlik);
                tab_8_w06_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'",tenPlik);
                tab_8_w06_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'",tenPlik);
                tab_8_w06_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'",tenPlik);

                idWiersza = "'7'";
                tab_8_w07_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_8_w07_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_8_w07_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_8_w07_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_8_w07_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_8_w07_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_8_w07_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_8_w07_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_8_w07_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_8_w07_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_8_w07_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_8_w07_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_8_w07_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_8_w07_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);
                tab_8_w07_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'",tenPlik);
                tab_8_w07_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'",tenPlik);
                tab_8_w07_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'",tenPlik);
                tab_8_w07_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'",tenPlik);

                #endregion "8"

                #region "8.a"

                idTabeli = "'8.a'";
                idWiersza = "'1'";
                tab_8a_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                #endregion "8.a"

                #region "8.b"

                idTabeli = "'8.b'";
                idWiersza = "'1'";
                tab_8b_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                #endregion "8.b"

                #region "8.c"

                idTabeli = "'8.c'";
                idWiersza = "'1'";
                tab_8c_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                #endregion "8.c"

                #region "9.1"

                idTabeli = "'9.1'";
                idWiersza = "'1'";
                tab_91_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_91_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_91_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_91_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_91_w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_91_w01_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_91_w01_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_91_w01_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);
                tab_91_w01_c09.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='9'",tenPlik);
                tab_91_w01_c10.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='10'",tenPlik);
                tab_91_w01_c11.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='11'",tenPlik);
                tab_91_w01_c12.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='12'",tenPlik);
                tab_91_w01_c13.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='13'",tenPlik);
                tab_91_w01_c14.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='14'",tenPlik);
                tab_91_w01_c15.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='15'",tenPlik);
                tab_91_w01_c16.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='16'",tenPlik);
                tab_91_w01_c17.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='17'",tenPlik);
                tab_91_w01_c18.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='18'",tenPlik);

                tab_91_w01_c19.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='19'",tenPlik);
                tab_91_w01_c20.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='20'",tenPlik);
                tab_91_w01_c21.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='21'",tenPlik);
                tab_91_w01_c22.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='22'",tenPlik);
                tab_91_w01_c23.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='23'",tenPlik);
                tab_91_w01_c24.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='24'",tenPlik);
                tab_91_w01_c25.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='25'",tenPlik);

                #endregion "9.1"

                #region "9.2"

                idTabeli = "'9.2'";
                idWiersza = "'1'";
                tab_92_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_92_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_92_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_92_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_92_w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_92_w01_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);

                idWiersza = "'2'";
                tab_92_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_92_w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_92_w02_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_92_w02_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_92_w02_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_92_w02_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);

                idWiersza = "'3'";
                tab_92_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_92_w03_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_92_w03_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_92_w03_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_92_w03_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_92_w03_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);

                #endregion "9.2"

                #region "10"

                idTabeli = "'10'";
                idWiersza = "'1'";
                tab_10_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'2'";
                tab_10_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'3'";
                tab_10_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'4'";
                tab_10_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'5'";
                tab_10_w05_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'6'";
                tab_10_w06_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'7'";
                tab_10_w07_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'8'";
                tab_10_w08_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'9'";
                tab_10_w09_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'10'";
                tab_10_w10_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'11'";
                tab_10_w11_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'12'";
                tab_10_w12_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'13'";
                tab_10_w13_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'14'";
                tab_10_w14_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                idWiersza = "'15'";
                tab_10_w15_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                #endregion "10"

                #region "11.1"

                idTabeli = "'11.1'";
                idWiersza = "'1'";
                tab_11_1_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_1_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_1_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_1_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);

                idWiersza = "'2'";
                tab_11_1_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_1_w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_1_w02_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_1_w02_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);

                idWiersza = "'3'";
                tab_11_1_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_1_w03_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_1_w03_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_1_w03_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);

                idWiersza = "'4'";
                tab_11_1_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_1_w04_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_1_w04_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_1_w04_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);

                #endregion "11.1"

                #region "11.2"

                idTabeli = "'11.2'";
                idWiersza = "'1'";
                tab_11_2_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_2_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_2_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_2_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_11_2_w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_11_2_w01_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_11_2_w01_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_11_2_w01_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);

                idWiersza = "'2'";
                tab_11_2_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_2_w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_2_w02_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_2_w02_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_11_2_w02_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_11_2_w02_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_11_2_w02_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_11_2_w02_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);

                idWiersza = "'3'";
                tab_11_2_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_2_w03_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_2_w03_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_2_w03_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_11_2_w03_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_11_2_w03_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_11_2_w03_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_11_2_w03_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);

                idWiersza = "'4'";
                tab_11_2_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_11_2_w04_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_11_2_w04_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_11_2_w04_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_11_2_w04_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_11_2_w04_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_11_2_w04_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_11_2_w04_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);

                #endregion "11.2"

                #region "11.3"

                idTabeli = "'11.3'";
                idWiersza = "'1'";
                tab_113_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_113_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_113_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_113_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_113_w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_113_w01_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_113_w01_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_113_w01_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);

                idWiersza = "'2'";
                tab_113_w02_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_113_w02_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_113_w02_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_113_w02_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_113_w02_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_113_w02_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_113_w02_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_113_w02_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);

                idWiersza = "'3'";
                tab_113_w03_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_113_w03_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_113_w03_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_113_w03_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_113_w03_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_113_w03_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_113_w03_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_113_w03_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);

                idWiersza = "'4'";
                tab_113_w04_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_113_w04_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_113_w04_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_113_w04_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_113_w04_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_113_w04_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_113_w04_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_113_w04_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);

                #endregion "11.3"

                #region "11.1"

                idTabeli = "'12.1'";
                idWiersza = "'1'";
                tab_12_1_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                #endregion "11.1"

                #region "12.2"

                idTabeli = "'12.2'";
                idWiersza = "'1'";
                tab_12_2_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_12_2_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_12_2_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_12_2_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_12_2_w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_12_2_w01_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_12_2_w01_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_12_2_w01_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);

                #endregion "12.2"

                #region "12.3"

                idTabeli = "'12.3'";
                idWiersza = "'1'";
                tab_12_3_w01_c01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                tab_12_3_w01_c02.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'",tenPlik);
                tab_12_3_w01_c03.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'",tenPlik);
                tab_12_3_w01_c04.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'",tenPlik);
                tab_12_3_w01_c05.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'",tenPlik);
                tab_12_3_w01_c06.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'",tenPlik);
                tab_12_3_w01_c07.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'",tenPlik);
                tab_12_3_w01_c08.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'",tenPlik);

                #endregion "12.3"

                #region "13"

                idTabeli = "'13'";
                idWiersza = "'1'";
                tab_13_w01_col01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);
                idWiersza = "'2'";
                tab_13_w02_col01.Text = dr.wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'",tenPlik);

                #endregion "13"

                //enf for while
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }

            // dopasowanie opisów
            makeLabels();

            try
            {
                Label11.Visible = cl.debug(int.Parse(yyx));
            }
            catch
            {
                Label11.Visible = false;
            }

            Label11.Text = txt;
            //Label3.Text = ms.nazwaSadu((string)Session["id_dzialu"]);
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
                //    Label3.Text = cl.nazwaSadu((string)Session["id_dzialu"]);

                id_dzialu.Text = (string)Session["txt_dzialu"];
                Label28.Text = cl.podajUzytkownika(User_id, domain);
                Label29.Text = DateTime.Now.ToLongDateString();
                try
                {
                    Label30.Text = System.IO.File.ReadAllText(Server.MapPath(@"~//version.txt")).ToString().Trim();
                }
                catch
                { }

                string strMonthName = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(Date2.Date.Month);
                int last_day = DateTime.DaysInMonth(Date2.Date.Year, Date2.Date.Month);
                if (((Date1.Date.Day == 1) && (Date2.Date.Day == last_day)) && ((Date1.Date.Month == Date2.Date.Month)))
                {
                    // cały miesiąc
                    tabela1Label.Text = "Dział 1.1.b Sprawy rozpatrywane w trybie art. 335, 336, 338a, 387 i 474a kpk za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //      tabela2Label.Text = "Dział 1.1.1.a.2. Liczba spraw o umieszczenie w szpitalu psychiatrycznym bez zgody, w których wydano zarządzenie o doprowadzeniu osoby pozostającej w szpitalu, a której postępowanie bezpośrednio dotyczy na rozprawę, stosownie do możliwości przewidzianej w przepisie art. 46 ust. 1a ustawy z dnia 19 sierpnia 1994 r. o ochronie zdrowia psychicznego (Dz. U. z 2016 r., poz. 546) za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //    tabela3Label.Text = "Dział 4.1. Terminowość postępowania międzyinstancyjnego w pierwszej instancji za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //    tabela4Label.Text = "Dział 2.2.a. Czas trwania postępowania sądowego od dnia pierwszej rejestracji do dnia uprawomocnienia się sprawy merytorycznie zakończonej (wyrokiem, orzeczeniem) w I instancji (łącznie z czasem trwania mediacji) za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";

                    //    tabela5Label.Text = "Dział 11.1. Terminowość postępowania międzyinstancyjnego  w pierwszej instancji za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //Informacje o ruchu sprawa za miesiąc: 

                    //Pozostało z ubieglego miesiąca
                }
                else
                {
                    tabela1Label.Text = "Dział 1.1.b Sprawy rozpatrywane w trybie art. 335, 336, 338a, 387 i 474a kpk za okres od:  " + Date1.Text + " do  " + Date2.Text;
                    //       tabela2Label.Text = "Dział 1.1.1.a.2. Liczba spraw o umieszczenie w szpitalu psychiatrycznym bez zgody, w których wydano zarządzenie o doprowadzeniu osoby pozostającej w szpitalu, a której postępowanie bezpośrednio dotyczy na rozprawę, stosownie do możliwości przewidzianej w przepisie art. 46 ust. 1a ustawy z dnia 19 sierpnia 1994 r. o ochronie zdrowia psychicznego (Dz. U. z 2016 r., poz. 546) za okres od " + Date1.Text + " do  " + Date2.Text;
                    //     tabela3Label.Text = "Dział 4.1. Terminowość postępowania międzyinstancyjnego w pierwszej instancji za okres od" + Date1.Text + " do  " + Date2.Text;

                    //  tabela4Label.Text = "Dział 2.2.a. Czas trwania postępowania sądowego od dnia pierwszej rejestracji do dnia uprawomocnienia się sprawy merytorycznie zakończonej (wyrokiem, orzeczeniem) w I instancji (łącznie z czasem trwania mediacji) za okres od " + Date1.Text + " do  " + Date2.Text;

                    //   tabela5Label.Text = "Dział 11.1. Terminowość postępowania międzyinstancyjnego  w pierwszej instancji za okres od " + Date1.Text + " do  " + Date2.Text;
                }
            }
            catch
            {
            }
        }

        protected void LinkButton54_Click(object sender, EventArgs e)
        {
            odswiez();
        }

        protected void makeCSVFile(object sender, EventArgs e)
        {
            //tworzenie pliku csv

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
                DataTable tabela2 = cl.generuj_dane_do_tabeli_mss2(int.Parse((string)Session["id_dzialu"]), Date1.Date, Date2.Date, 21,tenPlik); //dane
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
    }
}