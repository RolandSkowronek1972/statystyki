using System;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Text;

namespace stat2018
{
    public partial class mss1r : System.Web.UI.Page
    {
        public static string tenPlik = "mss1r.aspx";
        public Class1 cl = new Class1();
        public mss ms = new mss();
        public common cm = new common();
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
                return;
            }
            if (!IsPostBack)
            {
                //cm.log.Debug("otwarcie formularza: " + tenPlik);
                try
                {
                    // file read with version
                    var fileContents = System.IO.File.ReadAllText(Server.MapPath(@"~//version.txt"));
                    this.Title = "Statystyki " + fileContents.ToString().Trim();
                }
#pragma warning disable CS0168 // The variable 'ex' is declared but never used
                catch (Exception ex)
#pragma warning restore CS0168 // The variable 'ex' is declared but never used
                {
                    Server.Transfer("default.aspx");
                }
            }
            CultureInfo newCulture = (CultureInfo)CultureInfo.CurrentCulture.Clone();
            newCulture.DateTimeFormat = CultureInfo.GetCultureInfo("PL").DateTimeFormat;
            System.Threading.Thread.CurrentThread.CurrentCulture = newCulture;
            System.Threading.Thread.CurrentThread.CurrentUICulture = newCulture;
            if (Session["ustawDate1r"] == null)
            {
                Date1.Date = DateTime.Parse(datyMSS.DataPoczatkowa());
                Date2.Date = DateTime.Parse(datyMSS.DataKoncowa());
                Session["ustawDate1r"] = "X";
            }
            Session["data_1"] = Date1.Date.ToShortDateString();
            Session["data_2"] = Date1.Date.ToShortDateString();
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
            string yyx = (string)Session["id_dzialu"];
            id_dzialu.Text = (string)Session["txt_dzialu"];
            string txt = string.Empty; //

            try
            {
                DataTable tabela2 = ms.generuj_dane_do_tabeli_mss2(int.Parse((string)Session["id_dzialu"]), Date1.Date, Date2.Date, 10);
                //wypełnianie lebeli
                //   string selectString = "id_wiersza=" + i + " and " + "id_kolumny=" + j;

                #region "tabela 1 - 1.1.h"

                tab_01_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='1.1.h' and idWiersza ='1' and idkolumny='1'");
                tab_01_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='1.1.h' and idWiersza ='2' and idkolumny='1'");
                tab_01_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='1.1.h' and idWiersza ='3' and idkolumny='1'");
                tab_01_w04_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='1.1.h' and idWiersza ='4' and idkolumny='1'");
                tab_01_w05_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='1.1.h' and idWiersza ='5' and idkolumny='1'");

                #endregion "tabela 1 - 1.1.h"

                #region "tabela 1 - 2.2.a"

                //wiersz 1
                tab_02_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='1' and idkolumny='1'");
                tab_02_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='1' and idkolumny='2'");
                tab_02_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='1' and idkolumny='3'");
                tab_02_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='1' and idkolumny='4'");
                tab_02_w01_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='1' and idkolumny='5'");
                tab_02_w01_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='1' and idkolumny='6'");
                tab_02_w01_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='1' and idkolumny='7'");
                tab_02_w01_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='1' and idkolumny='8'");
                tab_02_w01_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='1' and idkolumny='9'");

                //wiersz 1
                tab_02_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='2' and idkolumny='1'");
                tab_02_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='2' and idkolumny='2'");
                tab_02_w02_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='2' and idkolumny='3'");
                tab_02_w02_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='2' and idkolumny='4'");
                tab_02_w02_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='2' and idkolumny='5'");
                tab_02_w02_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='2' and idkolumny='6'");
                tab_02_w02_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='2' and idkolumny='7'");
                tab_02_w02_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='2' and idkolumny='8'");
                tab_02_w02_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='2' and idkolumny='9'");

                //wiersz 3
                tab_02_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='3' and idkolumny='1'");
                tab_02_w03_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='3' and idkolumny='2'");
                tab_02_w03_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='3' and idkolumny='3'");
                tab_02_w03_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='3' and idkolumny='4'");
                tab_02_w03_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='3' and idkolumny='5'");
                tab_02_w03_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='3' and idkolumny='6'");
                tab_02_w03_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='3' and idkolumny='7'");
                tab_02_w03_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='3' and idkolumny='8'");
                tab_02_w03_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='3' and idkolumny='9'");

                //wiersz 4
                tab_02_w04_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='4' and idkolumny='1'");
                tab_02_w04_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='4' and idkolumny='2'");
                tab_02_w04_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='4' and idkolumny='3'");
                tab_02_w04_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='4' and idkolumny='4'");
                tab_02_w04_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='4' and idkolumny='5'");
                tab_02_w04_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='4' and idkolumny='6'");
                tab_02_w04_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='4' and idkolumny='7'");
                tab_02_w04_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='4' and idkolumny='8'");
                tab_02_w04_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='4' and idkolumny='9'");

                //wiersz 5
                tab_02_w05_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='5' and idkolumny='1'");
                tab_02_w05_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='5' and idkolumny='2'");
                tab_02_w05_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='5' and idkolumny='3'");
                tab_02_w05_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='5' and idkolumny='4'");
                tab_02_w05_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='5' and idkolumny='5'");
                tab_02_w05_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='5' and idkolumny='6'");
                tab_02_w05_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='5' and idkolumny='7'");
                tab_02_w05_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='5' and idkolumny='8'");
                tab_02_w05_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='5' and idkolumny='9'");

                //wiersz 6
                tab_02_w06_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='6' and idkolumny='1'");
                tab_02_w06_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='6' and idkolumny='2'");
                tab_02_w06_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='6' and idkolumny='3'");
                tab_02_w06_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='6' and idkolumny='4'");
                tab_02_w06_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='6' and idkolumny='5'");
                tab_02_w06_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='6' and idkolumny='6'");
                tab_02_w06_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='6' and idkolumny='7'");
                tab_02_w06_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='6' and idkolumny='8'");
                tab_02_w06_c09.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli='2.2.a' and idWiersza ='6' and idkolumny='9'");

                #endregion "tabela 1 - 2.2.a"

                #region "tabel 3 - 4.1"

                //wiersz 1
                string idTabeli = "'4.1'";
                string idWiersza = "'1'";
                tab_03_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_03_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_03_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_03_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_03_w01_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_03_w01_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_03_w01_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                //wiersz 2
                idWiersza = "'2'";
                tab_03_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_03_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_03_w02_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_03_w02_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_03_w02_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_03_w02_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_03_w02_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");

                #endregion "tabel 3 - 4.1"

                #region "tabel 4 - 4.1"

                //wiersz 1
                idTabeli = "'7.1'";
                idWiersza = "'1'";
                tab_04_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_04_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_04_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_04_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");

                //wiersz 2
                idWiersza = "'2'";
                tab_04_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_04_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_04_w02_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_04_w02_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");

                //wiersz 3
                idWiersza = "'3'";
                tab_04_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_04_w03_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_04_w03_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_04_w03_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");

                //wiersz 4
                idWiersza = "'4'";
                tab_04_w04_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_04_w04_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_04_w04_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_04_w04_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");

                #endregion "tabel 4 - 4.1"

                #region "tabel 5 - 7.1"

                //wiersz 1
                idTabeli = "'7.2'";
                idWiersza = "'1'";
                tab_05_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_05_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_05_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_05_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_05_w01_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_05_w01_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_05_w01_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_05_w01_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");

                //wiersz 2
                idWiersza = "'2'";
                tab_05_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_05_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_05_w02_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_05_w02_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_05_w02_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_05_w02_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_05_w02_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_05_w02_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");

                //wiersz 3
                idWiersza = "'3'";
                tab_05_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_05_w03_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_05_w03_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_05_w03_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_05_w03_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_05_w03_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_05_w03_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_05_w03_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");

                //wiersz 4
                idWiersza = "'4'";
                tab_05_w04_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_05_w04_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_05_w04_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_05_w04_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_05_w04_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_05_w04_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_05_w04_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_05_w04_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");

                #endregion "tabel 5 - 7.1"

                #region "tabel 6 - X.1"

                //wiersz 1
                idTabeli = "'7.3'";
                idWiersza = "'1'";
                tab_06_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_06_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_06_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_06_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_06_w01_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_06_w01_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_06_w01_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_06_w01_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");

                //wiersz 2
                idWiersza = "'2'";
                tab_06_w02_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_06_w02_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_06_w02_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_06_w02_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_06_w02_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_06_w02_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_06_w02_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_06_w02_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");

                //wiersz 3
                idWiersza = "'3'";
                tab_06_w03_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_06_w03_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_06_w03_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_06_w03_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_06_w03_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_06_w03_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_06_w03_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_06_w03_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");

                //wiersz 4
                idWiersza = "'4'";
                tab_06_w04_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_06_w04_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_06_w04_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_06_w04_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_06_w04_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_06_w04_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_06_w04_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_06_w04_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");

                #endregion "tabel 6 - X.1"

                #region "tabel 7 - "

                idTabeli = "'8.1'";
                idWiersza = "'1'";

                tab_81_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                //wiersz 1
                idTabeli = "'8.2'";
                idWiersza = "'1'";
                tab_07_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_07_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_07_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_07_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_07_w01_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_07_w01_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_07_w01_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_07_w01_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");

                #endregion "tabel 7 - "

                #region "tabel 8.3 "

                //wiersz 1
                idTabeli = "'8.3'";
                idWiersza = "'1'";
                tab_08_w01_c01.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='1'");
                tab_08_w01_c02.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='2'");
                tab_08_w01_c03.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='3'");
                tab_08_w01_c04.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='4'");
                tab_08_w01_c05.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='5'");
                tab_08_w01_c06.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='6'");
                tab_08_w01_c07.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='7'");
                tab_08_w01_c08.Text = wyciagnijWartosc(tabela2, "idWydzial=" + yyx + " and idTabeli=" + idTabeli + " and idWiersza =" + idWiersza + " and idkolumny='8'");

                #endregion "tabel 8.3 "
            }
            catch
            {
            }

            // dopasowanie opisów
            makeLabels();

            try
            {
                Label11.Visible = ms.debug(int.Parse(yyx));
            }
            catch
            {
                Label11.Visible = false;
            }

            Label11.Text = txt;
            Label3.Text = ms.nazwaSadu((string)Session["id_dzialu"]);
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
                Label3.Text = ms.nazwaSadu((string)Session["id_dzialu"]);

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
                    tabela1Label.Text = "Dział 1.1.h. w tym w wyniku sprzeciwu od nakazu wydanego w elektronicznym postępowaniu upominawczym za miesiąc:  " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    tabela2Label.Text = "Dział 2.2.a. Czas trwania postępowania sądowego od dnia pierwszej rejestracji do dnia uprawomocnienia się sprawy merytorycznie zakończonej (wyrokiem, orzeczeniem) w I instancji (łącznie z czasem trwania mediacji) za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    tabela3Label.Text = "Dział 4.1. Terminowość postępowania międzyinstancyjnego w pierwszej instancji za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    tabela4Label.Text = "Dział 7.1. Liczba biegłych/podmiotów wydających opinie w sprawach  (z wył. tłumaczy przysięgłych) za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";

                    tabela5Label.Text = "Dział 7.2. Terminowość sporządzania opinii pisemnych (z wył. tłumaczy przysięgłych) za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    tabela6Label.Text = "Dział 7.3.Terminowość przyznawania wynagrodzeń za sporządzenie opinii pisemnych i ustnych oraz za stawiennictwo za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    tabela7Label.Text = "Dział 8.2 Terminowość sporządzania tłumaczeń pisemnych za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    tabela8Label.Text = "Dział 8.3 Terminowość przyznawania wynagrodzeń za sporządzenie tłumaczeń pisemnych i ustnych oraz za stawiennictwo za miesiąc " + strMonthName + " " + Date2.Date.Year.ToString() + " roku.";
                    //Informacje o ruchu sprawa za miesiąc: 

                    //Pozostało z ubieglego miesiąca
                }
                else
                {
                    tabela1Label.Text = "Dział 1.1.h. w tym w wyniku sprzeciwu od nakazu wydanego w elektronicznym postępowaniu upominawczym za okres od:  " + Date1.Text + " do  " + Date2.Text;
                    tabela2Label.Text = "Dział 2.2.a. Czas trwania postępowania sądowego od dnia pierwszej rejestracji do dnia uprawomocnienia się sprawy merytorycznie zakończonej (wyrokiem, orzeczeniem) w I instancji (łącznie z czasem trwania mediacji) za okres od " + Date1.Text + " do  " + Date2.Text;
                    tabela3Label.Text = "Dział 4.1. Terminowość postępowania międzyinstancyjnego w pierwszej instancji za okres od" + Date1.Text + " do  " + Date2.Text;

                    tabela4Label.Text = "Dział 7.1. Liczba biegłych/podmiotów wydających opinie w sprawach  (z wył. tłumaczy przysięgłych) za okres od " + Date1.Text + " do  " + Date2.Text;

                    tabela5Label.Text = "Dział 7.2. Terminowość sporządzania opinii pisemnych (z wył. tłumaczy przysięgłych) za okres od " + Date1.Text + " do  " + Date2.Text;
                    tabela6Label.Text = "Dział 7.3.Terminowość przyznawania wynagrodzeń za sporządzenie opinii pisemnych i ustnych oraz za stawiennictwo za okres od " + Date1.Text + " do  " + Date2.Text;
                    tabela7Label.Text = "Dział 8.2 Terminowość sporządzania tłumaczeń pisemnych za okres od " + Date1.Text + " do  " + Date2.Text;
                    tabela8Label.Text = "Dział 8.3 Terminowość przyznawania wynagrodzeń za sporządzenie tłumaczeń pisemnych i ustnych oraz za stawiennictwo za okres od  " + Date1.Text + " do " + Date2.Text;
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
#pragma warning disable CS0168 // The variable 'ex' is declared but never used
            catch (Exception ex)
#pragma warning restore CS0168 // The variable 'ex' is declared but never used
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
                    DataTable tabela2 = ms.generuj_dane_do_tabeli_mss2(int.Parse((string)Session["id_dzialu"]), Date1.Date, Date2.Date, 21); //dane
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
            catch (Exception)
            {
            }
        }
    }
}