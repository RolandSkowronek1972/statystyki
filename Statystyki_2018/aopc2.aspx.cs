/*
Last Update:
    - version 1.191122
Creation date: 2019-11-22

*/

using DevExpress.Web;
using OfficeOpenXml;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI.WebControls;


namespace stat2018
{
    public partial class aopc2 : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();
        public devExpressXXL DevExpressXXL = new devExpressXXL();
        private const string tenPlik = "aopc2.aspx";
        private const string tenPlikNazwa = "aopc2";
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
                Session["data_1"] = Date1.Date.ToShortDateString();
                Session["data_2"] = Date2.Date.ToShortDateString();
            }
            catch
            { }
          
            odswiez();
            debug();
        }// end of Page_Load

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
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], tabela, 99, 0, 8, true, true, false, false, false);

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
            string idTabeli = "5";
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 5");
            }
            DataTable tabelka01 = DevExpressXXL.zLicznikiemKolumn(dr.konwertujNaPrzecinek(dr.generuj_dane_do_tabeli_sedziowskiej_2019(int.Parse(idDzialu), 5, Date1.Date, Date2.Date, 150, tenPlik)));
            Session["tabelka001"] = tabelka01;
            if (tabelka01 == null)
            {
                cm.log.Info(tenPlik + ": brak danych dla tabeli 5");
                return;
            }

            ASPxGridView1.DataSource = null;
            ASPxGridView1.DataSourceID = null;
            ASPxGridView1.AutoGenerateColumns = true;
            ASPxGridView1.DataSource = tabelka01;
            ASPxGridView1.DataBind();

            ASPxGridView1.KeyFieldName = "id_sedziego";
            ASPxGridView1.Columns.Clear();
            int szerokoscKolumny = 80;
            ASPxGridView1.Width = Panel1.Width;// ((Request.Browser.ScreenPixelsWidth) * 2)+240;

            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("L.p.", "id", idTabeli, "", true, 36));

            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Imie i nazwisko", "Imienazwisko", idTabeli, "", true, 250));

            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("zaległość z poprzedniego roku", "d_01", idTabeli, "", false, szerokoscKolumny));

            #region wplyw

            GridViewBandColumn kolumna_wplyw01 = new GridViewBandColumn { Caption = "WPŁYW " };
            kolumna_wplyw01.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
            string[] tekstydoWplyw = new string[7] { "Ogółem", "Ca", "Cz", "Co", "WSC skarga kasacyjna", "WSC skarga o stw. niezg. z pr.", "Wykaz S" };

            for (int j = 0; j < 7; j++)
            {
                kolumna_wplyw01.Columns.Add(DevExpressXXL.kolumnaDoTabeli(tekstydoWplyw[j], "d_" + (j + 2).ToString("D2"), idTabeli, "", false, szerokoscKolumny));
            }
            ASPxGridView1.Columns.Add(kolumna_wplyw01);

            #endregion wplyw

            #region wyznaczono

            GridViewBandColumn kolumna_wyznaczono01 = DevExpressXXL.GetBoundColumn("WYZNACZONO ");

            string[] tekstydoWYZNACZONO = new string[7] { "Ogółem", "Ca", "Cz", "Co", "WSC skarga kasacyjna", "WSC skarga o stw. niezg. z pr.", "Wykaz S" };

            int i = 0;
            do
            {
                i += 2;

                GridViewDataTextColumn d1 = DevExpressXXL.kolumnaDoTabeli("na rozprawę", "d_" + (i - 1 + 8).ToString("D2"), idTabeli, "", false, szerokoscKolumny);
                GridViewDataTextColumn d2 = DevExpressXXL.kolumnaDoTabeli("na posie- dzenie", "d_" + ((i + 8)).ToString("D2"), idTabeli, "", false, szerokoscKolumny);
                GridViewBandColumn D3 = DevExpressXXL.GetBoundColumn(tekstydoWplyw[(i / 2) - 1]);

                D3.Columns.Add(d1);
                D3.Columns.Add(d2);
                kolumna_wyznaczono01.Columns.Add(D3);
            } while (i < 14);
            ASPxGridView1.Columns.Add(kolumna_wyznaczono01);

            #endregion wyznaczono

            #region Załatwiono

            GridViewBandColumn kolumna_Zalatwiono = DevExpressXXL.GetBoundColumn("Załatwiono");

            // string[] tekstydoWYZNACZONO = new string[7] { "Ogółem", "Ca", "Cz", "Co", "WSC skarga kasacyjna", "WSC skarga o stw. niezg. z pr.", "Wykaz S" };

            i = 0;
            do
            {
                i += 2;

                GridViewDataTextColumn d1 = DevExpressXXL.kolumnaDoTabeli("na rozprawę", "d_" + (i - 1 + 22).ToString("D2"), idTabeli, "", false, szerokoscKolumny);
                GridViewDataTextColumn d2 = DevExpressXXL.kolumnaDoTabeli("na posie- dzenie", "d_" + ((i + 22)).ToString("D2"), idTabeli, "", false, szerokoscKolumny);
                GridViewBandColumn D3 = DevExpressXXL.GetBoundColumn(tekstydoWplyw[(i / 2) - 1]);

                D3.Columns.Add(d1);
                D3.Columns.Add(d2);
                kolumna_Zalatwiono.Columns.Add(D3);
            } while (i < 14);
            ASPxGridView1.Columns.Add(kolumna_Zalatwiono);

            #endregion Załatwiono

            #region ZAŁATWIENIA

            GridViewBandColumn kolumna_ZALATWIENIA = DevExpressXXL.GetBoundColumn("ZAŁATWIENIA ");

            for (int j = 0; j < 7; j++)
            {
                kolumna_ZALATWIENIA.Columns.Add(DevExpressXXL.kolumnaDoTabeli(tekstydoWplyw[j], "d_" + (j + 37).ToString("D2"), idTabeli, "", false, szerokoscKolumny));
            }
            ASPxGridView1.Columns.Add(kolumna_ZALATWIENIA);

            #endregion ZAŁATWIENIA

            #region sesje odbyte przez sędziego

            GridViewBandColumn kolumna_sesjeOdbytePrzezSedziego = DevExpressXXL.GetBoundColumn("sesje odbyte przez sędziego ");

            GridViewBandColumn sesjeOdbyte = DevExpressXXL.GetBoundColumn("wszystkie sesje sędziego w wydziale");
            sesjeOdbyte.Columns.Add(DevExpressXXL.kolumnaDoTabeli("ogółem", "d_44", idTabeli, "", false, szerokoscKolumny));

            GridViewBandColumn zTego = DevExpressXXL.GetBoundColumn("z tego");

            zTego.Columns.Add(DevExpressXXL.kolumnaDoTabeli("rozprawy", "d_45", idTabeli, "", false, szerokoscKolumny));
            zTego.Columns.Add(DevExpressXXL.kolumnaDoTabeli("posie- dzenia", "d_46", idTabeli, "", false, szerokoscKolumny));
            sesjeOdbyte.Columns.Add(zTego);
            kolumna_sesjeOdbytePrzezSedziego.Columns.Add(sesjeOdbyte);

            GridViewBandColumn sesjeOdbyte2 = DevExpressXXL.GetBoundColumn("wszystkie sesje sędziego w wydziale");
            sesjeOdbyte2.Columns.Add(DevExpressXXL.kolumnaDoTabeli("ogółem", "d_47", idTabeli, "", false, szerokoscKolumny));

            GridViewBandColumn zTego2 = DevExpressXXL.GetBoundColumn("z tego");

            zTego2.Columns.Add(DevExpressXXL.kolumnaDoTabeli("rozprawy", "d_48", idTabeli, "", false, szerokoscKolumny));
            zTego2.Columns.Add(DevExpressXXL.kolumnaDoTabeli("posie- dzenia", "d_49", idTabeli, "", false, szerokoscKolumny));
            sesjeOdbyte2.Columns.Add(zTego2);
            kolumna_sesjeOdbytePrzezSedziego.Columns.Add(sesjeOdbyte2);
            ASPxGridView1.Columns.Add(kolumna_sesjeOdbytePrzezSedziego);
            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Liczba odroczonych publikacji orzeczeń", "d_50", idTabeli, "", false, szerokoscKolumny));

            #endregion sesje odbyte przez sędziego

            #region Liczba odroczonych spraw

            GridViewBandColumn LiczbaOdroczonychSpraw = DevExpressXXL.GetBoundColumn("Liczba odroczonych spraw ");

            LiczbaOdroczonychSpraw.Columns.Add(DevExpressXXL.kolumnaDoTabeli("z terminem", "d_51", idTabeli, "", false, szerokoscKolumny));
            LiczbaOdroczonychSpraw.Columns.Add(DevExpressXXL.kolumnaDoTabeli("bez wyznaczonego terminu", "d_52", idTabeli, "", false, szerokoscKolumny));
            LiczbaOdroczonychSpraw.Columns.Add(DevExpressXXL.kolumnaDoTabeli("OGÓŁEM (wraz z publikacją orzeczeń)", "d_53", idTabeli, "", false, szerokoscKolumny));

            ASPxGridView1.Columns.Add(LiczbaOdroczonychSpraw);

            #endregion Liczba odroczonych spraw

            #region POZOSTAŁOŚĆ na następny m-c

            GridViewBandColumn kolumna_PozostaloscNaNastępny = DevExpressXXL.GetBoundColumn(" POZOSTAŁOŚĆ na następny m-c ");

            for (int j = 0; j < 7; j++)
            {
                kolumna_PozostaloscNaNastępny.Columns.Add(DevExpressXXL.kolumnaDoTabeli(tekstydoWplyw[j], "d_" + (j + 54).ToString("D2"), idTabeli, "", false, szerokoscKolumny));
            }
            ASPxGridView1.Columns.Add(kolumna_ZALATWIENIA);

            #endregion POZOSTAŁOŚĆ na następny m-c

            #region stan spraw zawieszonych (wszystkie kategorie spraw)

            GridViewBandColumn stanSprawZawieszonych = DevExpressXXL.GetBoundColumn("stan spraw zawieszonych (wszystkie kategorie spraw)");

            stanSprawZawieszonych.Columns.Add(DevExpressXXL.kolumnaDoTabeli("ogółem", "d_61", idTabeli, "", false, szerokoscKolumny));
            stanSprawZawieszonych.Columns.Add(DevExpressXXL.kolumnaDoTabeli("zakreślonych", "d_62", idTabeli, "", false, szerokoscKolumny));
            stanSprawZawieszonych.Columns.Add(DevExpressXXL.kolumnaDoTabeli("nie- zakreślonych", "d_63", idTabeli, "", false, szerokoscKolumny));

            ASPxGridView1.Columns.Add(stanSprawZawieszonych);

            #endregion stan spraw zawieszonych (wszystkie kategorie spraw)

            #region pozostało spraw starych (wszystkie kategorie spraw)

            GridViewBandColumn kolumna_pozostaloSprawStarych = DevExpressXXL.GetBoundColumn("pozostało spraw starych (wszystkie kategorie spraw)");
            string[] tekstydopozostaloSprawStarych = new string[9] { "Ogółem", "do 3 m-cy", "pow. 3 do 6 m-cy", "pow. 6 do 12 m-cy", "pow. 12 m-cy do 2 lat", "pow. 2 do 3 lat", "pow. 3 do 5 lat", "pow. 5 do 8 lat", "pow. 8 lat" };

            for (int j = 0; j < 9; j++)
            {
                kolumna_pozostaloSprawStarych.Columns.Add(DevExpressXXL.kolumnaDoTabeli(tekstydopozostaloSprawStarych[j], "d_" + (j + 64).ToString("D2"), idTabeli, "", false, szerokoscKolumny));
            }
            ASPxGridView1.Columns.Add(kolumna_pozostaloSprawStarych);

            #endregion pozostało spraw starych (wszystkie kategorie spraw)

            #region liczba sporządzonych uzasadnień

            GridViewBandColumn kolumna_liczbaSporzadzonychUzasadnien = DevExpressXXL.GetBoundColumn("liczba sporządzonych uzasadnień");
            string[] tekstydoliczbaSporzadzonychUzasadnien = new string[4] { "łącznie", "w terminie ustawowym 14 dni", "razem po terminie ustawowym", "nieusprawied- liwione" };

            for (int j = 0; j < 4; j++)
            {
                kolumna_liczbaSporzadzonychUzasadnien.Columns.Add(DevExpressXXL.kolumnaDoTabeli(tekstydoliczbaSporzadzonychUzasadnien[j], "d_" + (j + 73).ToString("D2"), idTabeli, "", false, szerokoscKolumny));
            }
            GridViewBandColumn kolumna_poUplywieTerminieuUstawowego = DevExpressXXL.GetBoundColumn("po upływie terminiu ustawowego");
            string[] tekstydo_poUplywieTerminieuUstawowego = new string[8] { "1-14 dni", "w tym nieusprawie- dliwione", "15-30 dni", "w tym nieusprawie- dliwione", "powyżej 1 do 3 mies.", "w tym nieusprawie- dliwione", "ponad 3 mies", "w tym nieusprawie- dliwione" };

            for (int j = 0; j < 8; j++)
            {
                kolumna_poUplywieTerminieuUstawowego.Columns.Add(DevExpressXXL.kolumnaDoTabeli(tekstydo_poUplywieTerminieuUstawowego[j], "d_" + (j + 73).ToString("D2"), idTabeli, "", false, szerokoscKolumny));
            }
            kolumna_liczbaSporzadzonychUzasadnien.Columns.Add(kolumna_poUplywieTerminieuUstawowego);
            ASPxGridView1.Columns.Add(kolumna_liczbaSporzadzonychUzasadnien);

            #endregion liczba sporządzonych uzasadnień

            #region uzasadnienia wygłoszone*

            GridViewBandColumn kolumna_uzasadnieniaWygloszone = DevExpressXXL.GetBoundColumn("uzasadnienia wygłoszone*");
            kolumna_uzasadnieniaWygloszone.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Ogólem", "d_85", idTabeli, "", false, szerokoscKolumny));
            kolumna_uzasadnieniaWygloszone.Columns.Add(DevExpressXXL.kolumnaDoTabeli("w tym w których wpłynął wniosek o transkrypcję", "d_86", idTabeli, "", false, szerokoscKolumny));
            ASPxGridView1.Columns.Add(kolumna_uzasadnieniaWygloszone);

            #endregion uzasadnienia wygłoszone*

            #region uzasadnienia wygłoszone*

            GridViewBandColumn LiczbaSprawwKtorychProjekt = DevExpressXXL.GetBoundColumn("Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent");
            LiczbaSprawwKtorychProjekt.Columns.Add(DevExpressXXL.kolumnaDoTabeli("razem", "d_87", idTabeli, "", false, szerokoscKolumny));
            LiczbaSprawwKtorychProjekt.Columns.Add(DevExpressXXL.kolumnaDoTabeli("w tym, w których projekt został zaakceptowany przez sędziego", "d_88", idTabeli, "", false, szerokoscKolumny));

            ASPxGridView1.Columns.Add(LiczbaSprawwKtorychProjekt);

            #endregion uzasadnienia wygłoszone*

            #region Skargi na przewlekłość

            GridViewBandColumn SkargiNaPrzewlekłosc = DevExpressXXL.GetBoundColumn("Skargi na przewlekłość");
            SkargiNaPrzewlekłosc.Columns.Add(DevExpressXXL.kolumnaDoTabeli("Wpływ", "d_89", idTabeli, "", false, szerokoscKolumny));
            GridViewBandColumn załatwiono = DevExpressXXL.GetBoundColumn("załatwiono");

            załatwiono.Columns.Add(DevExpressXXL.kolumnaDoTabeli("ogółem", "d_90", idTabeli, "", false, szerokoscKolumny));
            załatwiono.Columns.Add(DevExpressXXL.kolumnaDoTabeli("uwzględniono", "d_91", idTabeli, "", false, szerokoscKolumny));
            SkargiNaPrzewlekłosc.Columns.Add(załatwiono);
            SkargiNaPrzewlekłosc.Columns.Add(DevExpressXXL.kolumnaDoTabeli("pozostałość", "d_92", idTabeli, "", false, szerokoscKolumny));

            ASPxGridView1.Columns.Add(SkargiNaPrzewlekłosc);

            #endregion Skargi na przewlekłość

            #region mediacje

            GridViewBandColumn mediacje = DevExpressXXL.GetBoundColumn("mediacje");

            mediacje.Columns.Add(DevExpressXXL.kolumnaDoTabeli("WPŁYW liczba sparw, w których strony skierowano do mediacji", "d_93", idTabeli, "", false, szerokoscKolumny));
            GridViewBandColumn rozstrzygniecie = DevExpressXXL.GetBoundColumn("rozstrzygnięcie");

            rozstrzygniecie.Columns.Add(DevExpressXXL.kolumnaDoTabeli("liczba ugód zawartych przed mediatorem", "d_94", idTabeli, "", false, szerokoscKolumny));
            rozstrzygniecie.Columns.Add(DevExpressXXL.kolumnaDoTabeli("w tym zatwierdzono ugodę", "d_95", idTabeli, "", false, szerokoscKolumny));
            mediacje.Columns.Add(rozstrzygniecie);
            ASPxGridView1.Columns.Add(mediacje);

            #endregion mediacje

            ASPxGridView1.Columns.Add(DevExpressXXL.kolumnaDoTabeli("UWAGI", "d_96", idTabeli, "", false, szerokoscKolumny));
            #region Kolumna kontrolna (wyznaczenia>=załatwień)    

            GridViewBandColumn KolumnaKontrolna = DevExpressXXL.GetBoundColumn("Kolumna kontrolna (wyznaczenia>=załatwień) ");
            KolumnaKontrolna.Columns.Add(DevExpressXXL.kolumnaDoTabeli("na rozprawie", "d_97", idTabeli, "", false, szerokoscKolumny));
            KolumnaKontrolna.Columns.Add(DevExpressXXL.kolumnaDoTabeli("na posie- dzenie", "d_98", idTabeli, "", false, szerokoscKolumny));

            ASPxGridView1.Columns.Add(KolumnaKontrolna);
            #endregion
            ASPxGridView1.TotalSummary.Clear();
            ASPxGridView1.TotalSummary.Add(DevExpressXXL.komorkaSumujaca("Ogółem"));
            for (int ji = 1; ji < 100; ji++)
            {
                ASPxGridView1.TotalSummary.Add(DevExpressXXL.komorkaSumujaca(ji));
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
            catch 
            {

                
            }
            
        }
    }
}