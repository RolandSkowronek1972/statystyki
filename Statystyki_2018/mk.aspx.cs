using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Text;
using System.Web.UI.WebControls;

namespace stat2018
{
    public partial class mk : System.Web.UI.Page
    {
        public static string tenPlik = "mk.aspx";
        public Class1 cl = new Class1();
        public mss ms = new mss();
        public common cm = new common();
        public dataReaders dr = new dataReaders();
        public datyDoMSS datyMSS = new datyDoMSS();
        private tabele tb = new tabele();

        private DateTime dataPoczatkuOkresu = DateTime.Parse("1900-01-01");
        private DateTime dataKoncaOkresu = DateTime.Parse("1900-01-01");

        protected void Page_Load(object sender, EventArgs e)
        {
            string idWydzial = Request.QueryString["w"];
            if (idWydzial != null)
            {
                Session["id_dzialu"] = idWydzial;
                cm.log.Info(tenPlik + ": id wydzialu=" + idWydzial);
            }
            else
            {
                Server.Transfer("default.aspx");
                return;
            }
            if (!IsPostBack)
            {
                cm.log.Info("otwarcie formularza: " + tenPlik);
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

            DateTime dTime = DateTime.Now;
            dTime = dTime.AddMonths(-1);
            if (Date1.Text.Length == 0) Date1.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-01");
            if (Date2.Text.Length == 0) Date2.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-" + DateTime.DaysInMonth(dTime.Year, dTime.Month).ToString("D2"));
            Session["data_1"] = Date1.Date.ToShortDateString();
            Session["data_2"] = Date2.Date.ToShortDateString();
            odswierz();
            makeLabels();
        }// end of Page_Load

        protected void odswierz()
        {
            tablePlaceHolder.Controls.Clear();
            string idWydzialu = "'" + (string)Session["id_dzialu"] + "'";
            id_dzialu.Text = (string)Session["txt_dzialu"];

            try
            {
                string idTabeli = string.Empty;
                string idWiersza = string.Empty;
                int idWydzialuNumerycznie = int.Parse((string)Session["id_dzialu"]);
                DataTable tabelaDanych = ms.generuj_dane_do_tabeli_mss10e(idWydzialuNumerycznie, Date1.Date, Date2.Date, 60);
                Session["tabelka"] = tabelaDanych;
                //wypełnianie lebeli
                int iloscWierszy = dr.iloscWierszy(1, idWydzialuNumerycznie, tenPlik);
                cm.log.Info(tenPlik + ": Ilosc wierszy do tabelki 1=" + iloscWierszy.ToString());
                int iloscKolumn = dr.iloscKolumn(1, idWydzialuNumerycznie, tenPlik);
                cm.log.Info(tenPlik + ":  Ilosc kolumn do tabelki 1=" + iloscKolumn.ToString());
                Label tblControl = new Label { ID = "kod01" };
                tblControl.Width = 1150;
                StringBuilder tabelaGlowna = new StringBuilder();
                tabelaGlowna.AppendLine(ms.tworztabeleMK("", null, null, tabelaDanych, 0, iloscWierszy, 0, iloscKolumn, idWydzialuNumerycznie, false, "", 1, false, tenPlik));

                iloscWierszy = dr.iloscWierszy(2, idWydzialuNumerycznie, tenPlik);
                cm.log.Info(tenPlik + ": Ilosc wierszy do tabelki 2=" + iloscWierszy.ToString());
                iloscKolumn = dr.iloscKolumn(2, idWydzialuNumerycznie, tenPlik);
                cm.log.Info(tenPlik + ":  Ilosc kolumn do tabelki 2=" + iloscKolumn.ToString());

                tabelaGlowna.AppendLine(ms.tworztabeleMK("", null, null, tabelaDanych, 0, iloscWierszy, 0, iloscKolumn, idWydzialuNumerycznie, false, "", 2, true, tenPlik));

                iloscWierszy = dr.iloscWierszy(3, idWydzialuNumerycznie, tenPlik);
                cm.log.Info(tenPlik + ": Ilosc wierszy do tabelki 3=" + iloscWierszy.ToString());
                iloscKolumn = dr.iloscKolumn(3, idWydzialuNumerycznie, tenPlik);
                cm.log.Info(tenPlik + ":  Ilosc kolumn do tabelki 3=" + iloscKolumn.ToString());
                tabelaGlowna.AppendLine(ms.tworztabeleMK("", null, null, tabelaDanych, 0, iloscWierszy, 0, iloscKolumn, idWydzialuNumerycznie, false, "", 3, true, tenPlik));

                iloscWierszy = dr.iloscWierszy(4, idWydzialuNumerycznie, tenPlik);
                cm.log.Info(tenPlik + ": Ilosc wierszy do tabelki 4=" + iloscWierszy.ToString());
                iloscKolumn = dr.iloscKolumn(4, idWydzialuNumerycznie, tenPlik);
                cm.log.Info(tenPlik + ":  Ilosc kolumn do tabelki 4=" + iloscKolumn.ToString());

                tabelaGlowna.AppendLine(ms.tworztabeleMK("", null, null, tabelaDanych, 0, iloscWierszy, 0, iloscKolumn, idWydzialuNumerycznie, false, "", 4, true, tenPlik));

                iloscWierszy = dr.iloscWierszy(5, idWydzialuNumerycznie, tenPlik);
                cm.log.Info(tenPlik + ": Ilosc wierszy do tabelki 5=" + iloscWierszy.ToString());
                iloscKolumn = dr.iloscKolumn(5, idWydzialuNumerycznie, tenPlik);
                cm.log.Info(tenPlik + ":  Ilosc kolumn do tabelki 5=" + iloscKolumn.ToString());

                tabelaGlowna.AppendLine(ms.tworztabeleMK("", null, null, tabelaDanych, 0, iloscWierszy, 0, iloscKolumn, idWydzialuNumerycznie, false, "", 5, true, tenPlik));

                tblControl.Text = tabelaGlowna.ToString();
                tablePlaceHolder.Controls.Add(tblControl);
            }
            catch (Exception ex)
            {
                cm.log.Error("Mk: " + ex.Message);
            }
        }

        protected void LinkButton54_Click(object sender, EventArgs e)
        {
            odswierz();
        }

        protected void makeLabels()
        {
            try
            {
                string User_id = string.Empty;
                string domain = string.Empty;
                User_id = (string)Session["user_id"];
                domain = (string)Session["damain"];

                id_dzialu.Text = (string)Session["txt_dzialu"];
                Label27.Text = id_dzialu.Text;
                Label28.Text = cl.podajUzytkownika(User_id, domain);
                Label29.Text = DateTime.Now.ToLongDateString();

                Label30.Text = System.IO.File.ReadAllText(Server.MapPath(@"~//version.txt")).ToString().Trim();
            }
            catch (Exception)
            {
            }
        }

        #region dane do tabeli

        private DataTable schematTabeli()
        {
            DataTable dT = new DataTable();
            dT.Columns.Clear();
            dT.Columns.Add("nrWiersza", typeof(int));
            dT.Columns.Add("nrKolumny", typeof(int));
            dT.Columns.Add("colspan", typeof(int));
            dT.Columns.Add("rowspan", typeof(int));
            dT.Columns.Add("style", typeof(string));
            dT.Columns.Add("text", typeof(string));

            //   var List<tabeleDoMSS> lista = new List <tabeleDoMSS>;
            return dT;
        }

        #region Dzial 5.1

        private DataTable naglowekTabeliDzialu_5_1()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 4, "center", "Wyszczególnienie " });
            dT.Rows.Add(new Object[] { 1, 2, 1, 4, "center col_60", "Pozostałość (wnioski nie rozpatrzone)" });
            dT.Rows.Add(new Object[] { 1, 3, 3, 1, "center", "WPŁYW" });
            dT.Rows.Add(new Object[] { 1, 5, 10, 1, "center", "ROZPATRZONO" });
            dT.Rows.Add(new Object[] { 1, 6, 1, 4, "center col_60", "Pozostałość" });

            dT.Rows.Add(new Object[] { 2, 3, 1, 3, "center col_60", "razem" });
            dT.Rows.Add(new Object[] { 2, 4, 2, 1, "center", "w tym  (z rubr. 2)" });
            dT.Rows.Add(new Object[] { 2, 6, 1, 3, "center col_60", "razem (rubr. 6 do 10 + 13 + 14)" });
            dT.Rows.Add(new Object[] { 2, 7, 1, 3, "center col_60", "uwzględniono" });
            dT.Rows.Add(new Object[] { 2, 8, 1, 3, "center col_60", "nie uwzględniono" });
            dT.Rows.Add(new Object[] { 2, 9, 2, 1, "center", "pozostawiono bez rozpoznania z uwagi na" });
            dT.Rows.Add(new Object[] { 2, 11, 3, 1, "center", "umorzono postępowanie" });
            dT.Rows.Add(new Object[] { 2, 13, 1, 3, "center col_60", "w inny sposób" });
            dT.Rows.Add(new Object[] { 2, 14, 1, 3, "center col_60", "przekazano innemu sądowi" });

            dT.Rows.Add(new Object[] { 3, 4, 1, 2, "center", "przekazane z innych sądów" });
            dT.Rows.Add(new Object[] { 3, 5, 1, 2, "center", "dotyczące zastępczej kary pozbawienia wolności" });

            dT.Rows.Add(new Object[] { 3, 9, 1, 2, "center", "brak warunków technicznych" });
            dT.Rows.Add(new Object[] { 3, 10, 1, 2, "center", "nieuzupełnie-nie braku formalnego w terminie" });
            dT.Rows.Add(new Object[] { 3, 13, 1, 2, "center", "razem" });
            dT.Rows.Add(new Object[] { 3, 14, 2, 1, "center col_60", "z powodu" });

            dT.Rows.Add(new Object[] { 4, 13, 1, 1, "center col_60", "cofnięcia wniosku" });
            dT.Rows.Add(new Object[] { 4, 14, 1, 1, "center col_60", "innego" });

            return dT;
        }

        private DataTable tabelaBocznaDzialu_5_1()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 1, "wciecie borderAll", "W okresie miesięcznym" });
            dT.Rows.Add(new Object[] { 2, 1, 1, 1, "wciecie borderAll", "Narastająco od 1 stycznia do ostatniego dnia okresu sprawozdawczego" });

            return dT;
        }

        #endregion Dzial 5.1

        #region dzial 5.2

        private DataTable naglowekTabeliDzialu_5_2()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 1, "center col_200", "Wyszczególnienie" });
            dT.Rows.Add(new Object[] { 1, 3, 1, 1, "center col_150", "Razem (rubr. 2 do 6)" });
            dT.Rows.Add(new Object[] { 1, 4, 1, 1, "center col_150", "Skazany lub jego obrońca " });
            dT.Rows.Add(new Object[] { 1, 5, 1, 1, "center col_150", "Prokurator" });
            dT.Rows.Add(new Object[] { 1, 6, 1, 1, "center col_150", "Sądowy kurator zawodowy" });
            dT.Rows.Add(new Object[] { 1, 7, 1, 1, "center col_150", "Dyrektor zakładu karnego " });
            dT.Rows.Add(new Object[] { 1, 8, 1, 1, "center col_150", "Inne" });

            return dT;
        }

        private DataTable tabelaBocznaDzialu_5_2()
        {
            return tabelaBocznaDzialu_5_1();
        }

        #endregion dzial 5.2

        #region dzial 5.3

        private DataTable naglowekTabeliDzialu_5_3()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 2, 2, "center", "Wyszczególnienie" });
            dT.Rows.Add(new Object[] { 1, 3, 1, 2, "center", "Ogółem" });
            dT.Rows.Add(new Object[] { 1, 4, 2, 1, "center", "w tym (rubr. 1)" });

            //wiersz 2
            dT.Rows.Add(new Object[] { 2, 4, 1, 1, "center", "wobec których wykonuje się orzeczenie dotyczące zakazu zbliżania się do określonej osoby " });
            dT.Rows.Add(new Object[] { 2, 5, 1, 1, "center", "wobec których wykonuje się orzeczenie dotyczące obowiązku powstrzymywania się od przebywania w określonych miejscach " });

            return dT;
        }

        private DataTable tabelaBocznaDzialu_5_3()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 2, "wciecie borderAll", "Liczba osób" });

            dT.Rows.Add(new Object[] { 1, 2, 1, 1, "wciecie borderAll", "w okresie sprawozdawczym" });
            dT.Rows.Add(new Object[] { 2, 2, 1, 1, "center borderAll", "stan na ostatni dzień okresu sprawozdawczego" });

            return dT;
        }

        #endregion dzial 5.3

        #region dzial 5.4

        private DataTable naglowekTabeliDzialu_5_4()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 2, "center", "Orzeczenia w przedmiocie zastosowania środka karnego zakazu wstępu na imprezę masową z obowiązkiem przebywania w miejscach stałego pobytu" });
            dT.Rows.Add(new Object[] { 1, 2, 2, 1, "center ", "Liczba orzeczeń/osób w okresie sprawozdawczym)" });
            dT.Rows.Add(new Object[] { 1, 4, 2, 1, "center", "Wykonywane orzeczenia/osoby (stan w ostatnim dniu okresu sprawozdawczego)" });

            dT.Rows.Add(new Object[] { 2, 3, 1, 1, "center col_100", "orzeczenia" });
            dT.Rows.Add(new Object[] { 2, 4, 1, 1, "center col_100", "osoby" });
            dT.Rows.Add(new Object[] { 2, 5, 1, 1, "center col_100", "orzeczenia" });
            dT.Rows.Add(new Object[] { 2, 6, 1, 1, "center col_100", "osoby" });

            return dT;
        }

        private DataTable tabelaBocznaDzialu_5_4()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 1, 1, "wciecie borderAll", "Ogółem orzeczenia przekazane do sądu penitencjarnego" });

            return dT;
        }

        #endregion dzial 5.4

        #region dzial 5.5

        private DataTable naglowekTabeliDzialu_5_5()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 2, 2, "center", "Orzeczenia o warunkowym przedterminowym zwolnieniu (w okresie miesięcznym) (w okresie miesięcznym) (na podstawie wykazu Kow)" });

            dT.Rows.Add(new Object[] { 1, 3, 3, 1, "center ", "Wnioski/działanie sadu urzędu" });

            dT.Rows.Add(new Object[] { 2, 3, 1, 1, "center col_100", "razem (rubryka 2+3)" });
            dT.Rows.Add(new Object[] { 2, 4, 1, 1, "center col_100", "uwzględnione" });
            dT.Rows.Add(new Object[] { 2, 5, 1, 1, "center col_100", "nieuwzględnione" });
            return dT;
        }

        private DataTable tabelaBocznaDzialu_5_5()
        {
            DataTable dT = schematTabeli();
            dT.Clear();
            //                         W  K  CS RS   style"    text"
            dT.Rows.Add(new Object[] { 1, 1, 2, 1, "wciecie borderAll", "Ogółem orzeczenia (w. 02 do 06)" });

            dT.Rows.Add(new Object[] { 2, 1, 2, 1, "wciecie borderAll", "Działania sądu z urzędu" });

            dT.Rows.Add(new Object[] { 3, 1, 1, 4, "wciecie borderAll", "Wnioski złożone przez" });
            dT.Rows.Add(new Object[] { 3, 2, 1, 1, "wciecie borderAll", "skazanego lub obrońcy" });
            dT.Rows.Add(new Object[] { 4, 2, 1, 1, "wciecie borderAll", "dyrektora zakładu karnego" });
            dT.Rows.Add(new Object[] { 5, 2, 1, 1, " wciecie borderAll", "prokuratora" });
            dT.Rows.Add(new Object[] { 6, 2, 1, 1, " wciecie borderAll", "kuratora sądowego" });

            return dT;
        }

        #endregion dzial 5.5

        #endregion dane do tabeli

        protected void excelZapisz(object sender, EventArgs e)
        {
            string path = Server.MapPath("Template") + "\\mk.xlsx";
            FileInfo existingFile = new FileInfo(path);

            string download = Server.MapPath("Template") + @"\mk";
            FileInfo fNewFile = new FileInfo(download + "_.xlsx");
           
            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
              //  ExcelWorksheet MyWorksheet = MyExcel.Workbook.Worksheets[1];
                int idWydzialuNumerycznie = int.Parse((string)Session["id_dzialu"]);
                for (int i = 1; i < 6; i++)
                {
                    try
                    {
                        DataTable dane = (DataTable)Session["tabelka"];
                        int iloscKolumn = dr.iloscKolumn(i, idWydzialuNumerycznie, tenPlik);
                        int iloscWierszy = dr.iloscWierszy(i, idWydzialuNumerycznie, tenPlik);
                        //----------------------------------
                      /*  string querryString = "idtabeli<>" + i.ToString();
                        DataRow[] dtr = dane.Select(querryString);
                        foreach (var drow in dtr)
                        {
                            drow.Delete();
                        }
                        dane.AcceptChanges();
                        dane.Columns.Remove("idTabeli");
                        dane.Columns.Remove("idWydzial");
                        dane.AcceptChanges();
                        //----------------------------------
                        */


                       // DataTable danex = tabulka(dane, iloscKolumn, iloscWierszy, i, idWydzialuNumerycznie.ToString());
                        tb.tworzArkuszwExcleBezSedziowMK(MyExcel.Workbook.Worksheets[i], dane, iloscWierszy+1, iloscKolumn+1, 0, 1, false, idWydzialuNumerycznie,i,tenPlik);
                    }
                    catch (Exception ex)
                    {
                        cm.log.Error(tenPlik + " excel1  " + ex.Message);
                    }
                }

                try
                {
                    MyExcel.SaveAs(fNewFile);

                    this.Response.Clear();
                    this.Response.ContentType = "application/vnd.ms-excel";
                    this.Response.AddHeader("Content-Disposition", "attachment;filename=" + fNewFile.Name);
                    this.Response.WriteFile(fNewFile.FullName);
                    this.Response.End();
                }
                catch (Exception ex)
                {
                    cm.log.Error(tenPlik + " " + ex.Message);
                }
            }//end of using
        }

        private DataTable tabulka(DataTable daneWejsciowe, int iloscKolumn, int iloscWierszy, int idTabeli,string idWydzialu)
        {
            DataTable dTResult = new DataTable();

            dTResult.Columns.Add("idWiersza", typeof(string));
            dTResult.Columns.Add("idKolumny", typeof(string));
            dTResult.Columns.Add("wartosc", typeof(string));
            for (int i = 1; i < iloscWierszy + 1; i++)
            {

              

                for (int j = 1; j < iloscKolumn + 1; j++)
                {
                    string txt = dr.wyciagnijWartosc(daneWejsciowe, "idWydzial=" + idWydzialu + " and idTabeli='" + idTabeli.ToString() + "' and idWiersza ='" + i.ToString() + "' and idkolumny='" + j.ToString() + "'", tenPlik);
                    DataRow nowyWiersz = dTResult.NewRow();
                    nowyWiersz["idWiersza"] =i.ToString();
                    nowyWiersz["idKolumny"] = j.ToString();

                   
                    nowyWiersz["wartosc"] = txt;
                    dTResult.Rows.Add(nowyWiersz);
                }
              
            }

           

           
            return dTResult;
        }
    }
}