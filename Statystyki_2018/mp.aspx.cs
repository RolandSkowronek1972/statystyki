/*
Last Update:
    - version 1.191210
Creation date: 2019-12-16

*/

using DevExpress.Web;
using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;

namespace stat2018
{
    public partial class mp : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();
        public devExpressXXL DevExpressXXL = new devExpressXXL();
        private const string tenPlik = "mp.aspx";
        private const string tenPlikNazwa = "mp";
        private string path = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            string idWydzial = "12";// Request.QueryString["w"];
            try
            {
                if (idWydzial == null)
                {
                    Server.Transfer("default.aspx");
                    return;
                }

                Session["id_dzialu"] = idWydzial;
                bool dost = cm.dostep(idWydzial, (string)Session["identyfikatorUzytkownika"]);
                if (!dost)
                {
                    //    Server.Transfer("default.aspx?info='Użytkownik " + (string)Session["identyfikatorUzytkownika"] + " nie praw do działu nr " + idWydzial + "'");
                }

                path = Server.MapPath("~\\Template\\" + tenPlikNazwa + ".xlsx");
                CultureInfo newCulture = (CultureInfo)CultureInfo.CurrentCulture.Clone();
                newCulture.DateTimeFormat = CultureInfo.GetCultureInfo("PL").DateTimeFormat;
                System.Threading.Thread.CurrentThread.CurrentCulture = newCulture;
                System.Threading.Thread.CurrentThread.CurrentUICulture = newCulture;
                DateTime dTime = DateTime.Now.AddMonths(-1); ;

                if (Date1.Text.Length == 0) Date1.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-01");
                if (Date2.Text.Length == 0) Date2.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-" + DateTime.DaysInMonth(dTime.Year, dTime.Month).ToString("D2"));
                Session["id_dzialu"] = idWydzial;
                Session["data_1"] = Date1.Date.ToShortDateString();
                Session["data_2"] = Date2.Date.ToShortDateString();
                odswiez();
                debug();
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + ": błąd: "+ ex.Message);
            }
        }// end of Page_Load

        protected void TimerTick(object sender, EventArgs e)
        {
            Timer1.Enabled = false;
            imgLoader.Visible = false;
        }

        private void debug()
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
                //Label3.Text = cl.nazwaSadu((string)Session["id_dzialu"]);
                Label28.Text = cl.podajUzytkownika(User_id, domain);
                Label29.Text = DateTime.Now.ToLongDateString();
                Label30.Text = System.IO.File.ReadAllText(Server.MapPath(@"~//version.txt")).ToString().Trim();
            }
            catch
            { }

            try
            {
                string idDzialu = (string)Session["id_dzialu"];
                infoLabel1.Visible = cl.debug(int.Parse(idDzialu));
             
            }
            catch
            {
                infoLabel1.Visible = false;

                
            }
        }

        protected void Odswiez(object sender, EventArgs e)
        {
            odswiez();
        }

        protected void odswiez()
        {
            if (Session["id_dzialu"] == null)
            {
                return;
            }

            //odswiezenie danych
            tabela(1,ASPxGridView1);
          //  tabela_2();

            LabelNazwaSadu.Text = cl.nazwaSadu((string)Session["id_dzialu"]);
        }

        protected void tworzPlikExcell(object sender, EventArgs e)
        {
            // execel begin
            string path = Server.MapPath("Template") + "\\" + tenPlikNazwa + ".xlsx";
            FileInfo existingFile = new FileInfo(path);
            if (!existingFile.Exists)
            {
                return;
            }
            string download = Server.MapPath("Template") + @"\" + tenPlikNazwa + "";

            FileInfo fNewFile = new FileInfo(download + "_.xlsx");
            DataTable tabela = (DataTable)Session["tabelka001"];
            if (tabela == null)
            {
                return;
            }
            foreach (DataRow dr in tabela.Select($"id=0"))
                dr.Delete();
            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                ExcelWorksheet MyWorksheet1 = MyExcel.Workbook.Worksheets[1];

                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], tabela, 204, 0, 8, true, true, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[2], (DataTable)Session["tabelka002"], 66, 0, 9, true, true, false, false, false);

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

        protected void tabela(int nrTabeli,ASPxGridView kontrolka)
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 1");
            }
            DataTable tabelka01 = DevExpressXXL.zLicznikiemKolumn(dr.konwertujNaPrzecinek(dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), nrTabeli, Date1.Date, Date2.Date, 240, tenPlik)));
            DataTable naglowki = dr.generuj_naglowki_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), nrTabeli, Date1.Date, Date2.Date, 240, tenPlik);
            if (tabelka01==null)
            {
                cm.log.Error(tenPlik + ": brak danych do tabeli "+ nrTabeli.ToString());
            }
            Session["tabelka001"] = tabelka01;

            kontrolka.DataSource = null;
            kontrolka.DataSourceID = null;
            kontrolka.AutoGenerateColumns = true;
            kontrolka.DataSource = tabelka01;
            kontrolka.DataBind();
            kontrolka.KeyFieldName = "id_sedziego";
            kontrolka.Columns.Clear();
            int szerokoscKolumny = 80;
            kontrolka.Width = Panel1.Width;
           
            kontrolka.Columns.Add(DevExpressXXL.kolumnaDoTabeli("L.p.", "id", nrTabeli.ToString(), "", true, 36));
            kontrolka.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Imie i nazwisko", "Imienazwisko", nrTabeli.ToString(), "", true, 250));
            int iloscKolumn = dr.iloscKolumn(nrTabeli, int.Parse (idDzialu), tenPlik);
        
           


            for (int i = 1; i < iloscKolumn; i++)
            {

                kontrolka.Columns.Add(DevExpressXXL.kolumnaDoTabeli(tekstNaglowka(naglowki, i), "d_"+i.ToString("D2") , nrTabeli.ToString(), "", false, szerokoscKolumny));
            }

            kontrolka.TotalSummary.Clear();
            kontrolka.TotalSummary.Add(DevExpressXXL.komorkaSumujaca("Ogółem"));
            for (int i = 1; i < iloscKolumn; i++)
            {
                kontrolka.TotalSummary.Add(DevExpressXXL.komorkaSumujaca(i));
            }
        }

        private string tekstNaglowka(DataTable tabela, int kolumna)
        {
            //wyciągnij nagłowki
            string result = string.Empty;
            foreach (DataRow item in tabela.Rows)
            {
                string kol = item[0].ToString();
                if (kol==kolumna.ToString ())
                {
                    result = item[1].ToString();
                    continue;
                }
            }
            if (result=="")
            {
                result = "-";
            }
            return result;

        }
      
        /*
        private GridViewColumn dwieInstancje(string Opis, int przesuniecie, string idTabeli, int szerokoscKolumny, string[] teksty)
        {
            GridViewBandColumn kolumna = DevExpressXXL.GetBoundColumn(Opis);
            kolumna.Columns.Add(DevExpressXXL.podKolumna(teksty, przesuniecie, idTabeli, false, szerokoscKolumny, "I instancja"));
            kolumna.Columns.Add(DevExpressXXL.podKolumna(teksty, teksty.Length + przesuniecie, idTabeli, false, szerokoscKolumny, "II instancja"));
            return kolumna;
        }

  */
        protected void Suma(object sender, DevExpress.Data.CustomSummaryEventArgs e)
        {
            ASPxSummaryItem sumItem = (ASPxSummaryItem)e.Item;
        }
        /*
        private GridViewBandColumn sekcjaZpodwojnymiPodkolumnami(string Opis, int przesuniecie, string idTabeli, int szerokoscKolumny)
        {
            string[] teksty01 = new string[] { "Ogółem", "GC", "GNs", "GNc", "GCo", "WSC skarga o stw. niezg. z pr.s", "Wykaz U","WNSc" };
            string[] teksty02 = new string[] { "Ogółem", "Ga", "Gz", "GCo-II inst.", "WSC skarga kasacyjna", "WSC skarga o stw. niezg. z pr. II inst.", "Skargi na post. sądowe", "WNSc" };

            GridViewBandColumn kolumna = DevExpressXXL.GetBoundColumn(Opis);
            kolumna.Columns.Add(DevExpressXXL.podKolumna(new string[] { "na rozprawie", "na posiedzeniu" }, przesuniecie, idTabeli, false, szerokoscKolumny, "I + II instancja łącznie"));

            kolumna.Columns.Add(DevExpressXXL.SekcjaDwiePodKolumny(teksty01, "I instancja", przesuniecie + 2, idTabeli, szerokoscKolumny));
            kolumna.Columns.Add(DevExpressXXL.SekcjaDwiePodKolumny(teksty02, "II instancja", przesuniecie + 18, idTabeli, szerokoscKolumny));

            return kolumna;
        }

        private GridViewBandColumn stanSprawZawieszonych(int przesuniecie, string idTabeli, int szerokoscKolumny)
        {
           
            GridViewBandColumn kolumna = DevExpressXXL.GetBoundColumn("stan spraw zawieszonych (wszystkie kategorie spraw, bez czasu trwania mediacji, zgodnie z MS-S19o)");
          
            kolumna.Columns.Add(DevExpressXXL.podKolumna(new string[] { "ogółem", "zakreślonych", "nie-zakreślonych" }, przesuniecie, idTabeli, false, szerokoscKolumny, "I  instancja"));
            kolumna.Columns.Add(DevExpressXXL.podKolumna(new string[] { "ogółem", "zakreślonych", "nie-zakreślonych" }, przesuniecie+3, idTabeli, false, szerokoscKolumny, "II instancja"));

            return kolumna;
        }

        private GridViewBandColumn sekcjaMniejsza(string Opis, int przesuniecie, string idTabeli, int szerokoscKolumny)

        {
            string[] teksty01 = new string[] { "Ogółem", "GC", "GNs", "GNc", "GCo", "WSC skarga o stw. niezg. z pr.s", "Wykaz U", "WSNc" };
            string[] teksty02 = new string[] { "Ogółem", "Ga", "Gz", "GCo-II inst.", "WSC skarga kasacyjna", "WSC skarga o stw. niezg. z pr. II inst.", "Skargi na post. sądowe", "WSNc" };
        
            GridViewBandColumn kolumna = DevExpressXXL.GetBoundColumn(Opis);
            kolumna.Columns.Add(DevExpressXXL.kolumnaDoTabeli("I + II instancja łącznie", "d_" + przesuniecie.ToString("D2"), idTabeli, "", false, szerokoscKolumny));
            kolumna.Columns.Add(DevExpressXXL.podKolumna(teksty01, przesuniecie + 1, idTabeli, false, szerokoscKolumny, "I instancja"));
            kolumna.Columns.Add(DevExpressXXL.podKolumna(teksty02, przesuniecie + 9, idTabeli, false, szerokoscKolumny, "II instancja"));
            return kolumna;
        }
        */
        protected void ASPxGridView1_SummaryDisplayText(object sender, ASPxGridViewSummaryDisplayTextEventArgs e)
        {
            try
            {
                if (e.Item.FieldName.Contains("d_"))
                {
                    double value = double.Parse(e.Value.ToString());
                    string field = e.Item.FieldName.Replace("d_", "");
                    value = value - double.Parse(field);
                    e.Text = value.ToString();
                }
            }
            catch
            {
            }
        }
       
        protected void ASPxGridView2_SummaryDisplayText(object sender, ASPxGridViewSummaryDisplayTextEventArgs e)
        {
            try
            {
                if (e.Item.FieldName.Contains("d_"))
                {
                    double value = double.Parse(e.Value.ToString());
                    string field = e.Item.FieldName.Replace("d_", "");
                    value = value - double.Parse(field);
                    e.Text = value.ToString();
                }
            }
            catch
            {
            }
        }
    }
}