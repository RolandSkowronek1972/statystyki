﻿/*
Last Update:
    - version 1.191216
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
    public partial class aopkN : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();
        public devExpressXXL DevExpressXXL = new devExpressXXL();
        private const string tenPlik = "aopk.aspx";
        private const string tenPlikNazwa = "aopk";
        private string path = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            string idWydzial = Request.QueryString["w"];
            try
            {
                if (idWydzial == null)
                {
                    return;
                }

                Session["id_dzialu"] = idWydzial;
                bool dost = cm.dostep(idWydzial, (string)Session["identyfikatorUzytkownika"]);
                if (!dost)
                {
                    Server.Transfer("default.aspx?info='Użytkownik " + (string)Session["identyfikatorUzytkownika"] + " nie praw do działu nr " + idWydzial + "'");
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
            }
            catch
            { }
            odswiez();
            debug();
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
            infoLabel1.Visible = false;

            try
            {
                string idDzialu = (string)Session["id_dzialu"];
                infoLabel1.Visible = cl.debug(int.Parse(idDzialu));
            }
            catch
            {
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

            tabela_1();

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

                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1],tabela, 204, 0, 8, true, true, false, false, false);
                //   MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[2], (DataTable)Session["tabelka002"], 66, 0, 9, true, true, false, false, false);

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

        protected void tabela_1()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 1");
            }

            DataTable tabelka01 = DevExpressXXL.zLicznikiemKolumn(dr.konwertujNaPrzecinek(dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 5, Date1.Date, Date2.Date, 240, tenPlik)));
            Session["tabelka001"] = tabelka01;

            ASPxGridView1.DataSource = null;
            ASPxGridView1.DataSourceID = null;
            ASPxGridView1.AutoGenerateColumns = true;
            ASPxGridView1.DataSource = tabelka01;
            ASPxGridView1.DataBind();
            ASPxGridView1.KeyFieldName = "id_sedziego";
            ASPxGridView1.Columns.Clear();
            int szerokoscKolumny = 80;
            ASPxGridView1.Width = Panel1.Width;
            string idTabeli = "5";
            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("L.p.", "id", idTabeli, "", true, 36, 4));
            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Imie i nazwisko", "Imienazwisko", idTabeli, "", true, 250, 4));

            string[] teksty01 = new string[] { "Ogółem", "K", "KP", "Ko (ogółem)", "Ko z rozdziału 58 kpk oraz ustawy z dn.23.02.1991r o uznanie za nieważne orzeczeń wydanych wobec osób represjonowanych ….", "Kop", "Pf + nowe wykazy K-opr, K-spr (dot. kontroli operacyjnej)" };
            string[] teksty02 = new string[] { "Ogółem", "Ga", "Gz", "GCo-II inst.", "WSC skarga kasacyjna", "WSC skarga o stw. niezg. z pr. II inst.", "Skargi na post. sądowe" };
            string[] teksty03 = new string[] { "Ogółem", "K", "Kp", "Ko", "Kop" };
            string[] teksty04 = new string[] { "z terminem", "bez wyzna- czonego terminu", "OGÓŁEM (wraz z publikacją orzeczeń)" };
            string[] teksty05 = new string[] { "ogółem", "do 3 m-cy", "pow. 3 do 6 m - cy", "pow. 6 do 12 m - cy", "pow. 12 m - cy do 2 lat", "pow. 2 do 3 lat", "pow. 3 do 5 lat", "pow. 5 do 8 lat", "pow. 8 lat" };
            string[] teksty06 = new string[] { "łącznie	w terminie ustawowym", "14 dni	razem po terminie ustawowym	", "nieusprawiedliw." };
            string[] teksty07 = new string[] { "1-14 dni", "w tym nieusprawiedliwione", "15-30 dni", "w tym nieusprawiedliwione", "powyżej 1 do 3 mies.", "w tym nieusprawiedliwione", "ponad 3 mies.", "w tym nieusprawiedliwion" };

            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("zaległość z poprzedniego roku", "d_01", idTabeli, "", false, szerokoscKolumny));

            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(teksty01, 2, idTabeli, false, szerokoscKolumny, "WPŁYW"));
            ASPxGridView1.Columns.Add(DevExpressXXL.SekcjaDwiePodKolumny(teksty03, "Wyznaczono", 9, idTabeli, szerokoscKolumny));
            ASPxGridView1.Columns.Add(DevExpressXXL.SekcjaDwiePodKolumny(teksty03, "Załatwiono", 19, idTabeli, szerokoscKolumny));
            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(teksty03, 29, idTabeli, false, szerokoscKolumny, "ZAŁATWIENIA"));
            ASPxGridView1.Columns.Add(DevExpressXXL.sesjeSedziego(34, idTabeli, szerokoscKolumny));
            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Liczba odroczonych publikacji orzeczeń", "d_40", idTabeli, "", false, szerokoscKolumny));
            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(teksty04, 41, idTabeli, false, szerokoscKolumny, "Liczba odroczonych spraw"));
            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(teksty03, 44, idTabeli, false, szerokoscKolumny, "POZOSTAŁOŚĆ na następny m-c"));

            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(new string[] { "ogółem", "zakreślonych", "nie zakreślonych" }, 49, idTabeli, false, szerokoscKolumny, "stan spraw zawieszonych (wszystkie kategorie spraw)"));

            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(teksty05, 52, idTabeli, false, szerokoscKolumny, "pozostało spraw starych (wszystkie kategorie spraw)"));
            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(teksty03, 29, idTabeli, false, szerokoscKolumny, "stan spraw zawieszonych (wszystkie kategorie spraw)"));

            GridViewBandColumn kolumna_liczbaSporzadzonychUzasadnien = DevExpressXXL.GetBoundColumn("liczba sporządzonych uzasadnień (wszystkie kategorie spraw)");

            GridViewBandColumn kolumna_poUplywieTerminiuUstawowego = DevExpressXXL.GetBoundColumn("po upływie terminiu ustawowego");

            kolumna_poUplywieTerminiuUstawowego.Columns.Add(DevExpressXXL.kolumnaDoTabeli("1-14 dni", "d_65", idTabeli, "", false, szerokoscKolumny));
            kolumna_poUplywieTerminiuUstawowego.Columns.Add(DevExpressXXL.kolumnaDoTabeli("w tym nieuspra- wiedliwione", "d_66", idTabeli, "", false, szerokoscKolumny));
            kolumna_poUplywieTerminiuUstawowego.Columns.Add(DevExpressXXL.kolumnaDoTabeli("15-30 dni", "d_67", idTabeli, "", false, szerokoscKolumny));
            kolumna_poUplywieTerminiuUstawowego.Columns.Add(DevExpressXXL.kolumnaDoTabeli("w tym nieuspra- wiedliwione", "d_68", idTabeli, "", false, szerokoscKolumny));
            kolumna_poUplywieTerminiuUstawowego.Columns.Add(DevExpressXXL.kolumnaDoTabeli("powyżej 1 do 3 mies.", "d_69", idTabeli, "", false, szerokoscKolumny));
            kolumna_poUplywieTerminiuUstawowego.Columns.Add(DevExpressXXL.kolumnaDoTabeli("w tym nieuspra- wiedliwione", "d_70", idTabeli, "", false, szerokoscKolumny));
            kolumna_poUplywieTerminiuUstawowego.Columns.Add(DevExpressXXL.kolumnaDoTabeli("ponad 3 mies.	", "d_71", idTabeli, "", false, szerokoscKolumny));
            kolumna_poUplywieTerminiuUstawowego.Columns.Add(DevExpressXXL.kolumnaDoTabeli("w tym nieuspra- wiedliwione", "d_72", idTabeli, "", false, szerokoscKolumny));

            kolumna_liczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeli("łącznie", "d_61", idTabeli, "", false, szerokoscKolumny));
            kolumna_liczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeli("w terminie ustawowym 14 dni", "d_62", idTabeli, "", false, szerokoscKolumny));
            kolumna_liczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeli("razem po terminie ustawowym", "d_63", idTabeli, "", false, szerokoscKolumny));
            kolumna_liczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeli("nieusprawiedliw", "d_64", idTabeli, "", false, szerokoscKolumny));
            kolumna_liczbaSporzadzonychUzasadnien.Columns.Add(kolumna_poUplywieTerminiuUstawowego);
            ASPxGridView1.Columns.Add(kolumna_liczbaSporzadzonychUzasadnien);

            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(new string[] { "ogółem", "w których wpłynął wniosek o transkrypcję" }, 73, idTabeli, false, szerokoscKolumny, "uzasadnienia wygłoszone"));

            ASPxGridView1.Columns.Add(DevExpressXXL.SkargiNaPrzewleklosc(77, idTabeli, szerokoscKolumny));
            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Uwagi", "d_81", idTabeli, "", false, szerokoscKolumny));
            ASPxGridView1.Columns.Add(DevExpressXXL.podKolumna(new string[] { "na rozprawie", "na posiedzeniu" }, 82, idTabeli, false, szerokoscKolumny, "Kolumna kontrolna (wyznaczenia>=załatwień)"));

            ASPxGridView1.TotalSummary.Clear();
            ASPxGridView1.TotalSummary.Add(DevExpressXXL.komorkaSumujaca("Ogółem"));
            for (int i = 1; i < 211; i++)
            {
                ASPxSummaryItem xxx = DevExpressXXL.komorkaSumujaca(i);

                ASPxGridView1.TotalSummary.Add(DevExpressXXL.komorkaSumujaca(i));
            }
        }

        protected void Suma(object sender, DevExpress.Data.CustomSummaryEventArgs e)
        {
            ASPxSummaryItem sumItem = (ASPxSummaryItem)e.Item;
        }

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
            catch (Exception)
            {
            }
        }
    }
}