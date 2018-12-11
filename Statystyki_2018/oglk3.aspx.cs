/*
Last Update:
    - version 1.181211
Creation date: 2018-12-11

*/
using System;
using System.Data;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using OfficeOpenXml;

namespace stat2018
{
    public partial class oglk3 : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();

        const string tenPlik = "oglk3.aspx";
        const string tenPlikNazwa = "oglk3";
        string path = "";
        
        

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string idWydzial = Request.QueryString["w"];
                if (idWydzial != null)
                {
                    Session["id_dzialu"] = idWydzial;
                }
                else
                {
                    return;
                }
                path = Server.MapPath("\\template\\" + tenPlikNazwa + ".xlsx");
                DateTime dTime = DateTime.Now;
                dTime = dTime.AddMonths(-1);
                if (Date1.Text.Length == 0)
                {
                    Date1.Text = dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-01";
                    Date1.Date = DateTime.Parse(Date1.Text);
                }
                if (Date2.Text.Length == 0)
                {
                    Date2.Text = dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-" + DateTime.DaysInMonth(dTime.Year, dTime.Month).ToString("D2");
                    Date2.Date = DateTime.Parse(Date2.Text);
                }

                Session["data_1"] = Date1.Text.Trim();
                Session["data_2"] = Date2.Text.Trim();
            }
            catch
            { }
            odswiez();
            debug();
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
                Label3.Text = cl.nazwaSadu((string)Session["id_dzialu"]);
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
                infoLabel2.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel3.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel4.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel5.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel6.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel7.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel8.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel9.Visible = cl.debug(int.Parse(idDzialu));
                //infoLabel10.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel11.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel12.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel13.Visible = cl.debug(int.Parse(idDzialu));
                infoLabel14.Visible = cl.debug(int.Parse(idDzialu));
            }
            catch
            {
               
                infoLabel4.Visible = false;
                infoLabel1.Visible = false;
                infoLabel5.Visible = false;
                infoLabel2.Visible = false;

               

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
            tabela_2();
            tabela_3();
            tabela_4();
            tabela_5();
            tabela_6();
            tabela_7();
            tabela_8();
            tabela_9();
            tabela_10();
            tabela_11();
            tabela_12();
            tabela_13();
           
        }

        protected void tworzPlikExcell(object sender, EventArgs e)
        {
            
            // execel begin
            string path = Server.MapPath("Template") + "\\"+tenPlikNazwa+".xlsx";
            FileInfo existingFile = new FileInfo(path);
            if (!existingFile.Exists )
            {
                return;
            }
            string download = Server.MapPath("Template") + @"\"+tenPlikNazwa+"";

            FileInfo fNewFile = new FileInfo(download + "_.xlsx");

            // pierwsza tabelka


            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                
                ExcelWorksheet MyWorksheet1 = MyExcel.Workbook.Worksheets[1];

                // pierwsza
             
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[1], (DataTable)Session["tabelka001"], 13, 0, 5,false,false,false,false,false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[2], (DataTable)Session["tabelka002"], 13, 0, 5, false, false, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[3], (DataTable)Session["tabelka003"], 13, 0, 5, false, false, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[4], (DataTable)Session["tabelka004"], 14, 0, 4, false, false, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[5], (DataTable)Session["tabelka005"], 4, 0, 3, false, false, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[6], (DataTable)Session["tabelka006"], 4, 0, 3, false, false, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[7], (DataTable)Session["tabelka007"], 7, 0, 3, false, false, false, false, false);
               
                MyWorksheet1 = tb.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[8], (DataTable)Session["tabelka008"],4,2,2,2,false);
                MyWorksheet1 = tb.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[9], (DataTable)Session["tabelka009"], 1, 11, 2, 2, false);
                MyWorksheet1 = tb.tworzArkuszwExcleBezSedziow(MyExcel.Workbook.Worksheets[10], (DataTable)Session["tabelka010"], 4, 3, 2, 1, false);

                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[11], (DataTable)Session["tabelka011"], 8, 0, 4, false, false, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[12], (DataTable)Session["tabelka012"], 6, 0, 4, false, false, false, false, false);
                MyWorksheet1 = tb.tworzArkuszwExcle(MyExcel.Workbook.Worksheets[13], (DataTable)Session["tabelka013"], 7, 0, 4, false, false, false, false, false);

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
                    cm.makeLog("error", tenPlik + " " + ex.Message, cl.debug(int.Parse((string)Session["id_dzialu"])));
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
                DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2018(int.Parse(idDzialu), 1, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 35, tenPlik);
                Session["tabelka001"] = tabelka01;
                gwTabela1.DataSource = null;
                gwTabela1.DataSourceID = null;
                gwTabela1.DataSource = tabelka01;
                gwTabela1.DataBind();
           
        }
        protected void tabela_2()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 2");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2018(int.Parse(idDzialu), 2, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 35, tenPlik);
            Session["tabelka002"] = tabelka01;
            gwTabela2.DataSource = null;
            gwTabela2.DataSourceID = null;
            gwTabela2.DataSource = tabelka01;
            gwTabela2.DataBind();

        }
        protected void tabela_3()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 2");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2018(int.Parse(idDzialu), 3, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 35, tenPlik);
            Session["tabelka003"] = tabelka01;
            gwTabela3.DataSource = null;
            gwTabela3.DataSourceID = null;
            gwTabela3.DataSource = tabelka01;
            gwTabela3.DataBind();

        }

        protected void tabela_4()
        {
        string idDzialu =  (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 4");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2018(int.Parse(idDzialu), 4, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 23, tenPlik);
            Session["tabelka004"] = tabelka01;
            gwTabela4.DataSource = null;
            gwTabela4.DataSourceID = null;
            gwTabela4.DataSource = tabelka01;
            gwTabela4.DataBind();
        }

        protected void tabela_5()
        {
            
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 5");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2018(int.Parse(idDzialu), 5, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 23, tenPlik);
            Session["tabelka005"] = tabelka01;
            gwTabela5.DataSource = null;
            gwTabela5.DataSourceID = null;
            gwTabela5.DataSource = tabelka01;
            gwTabela5.DataBind();
        }

        protected void tabela_6()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 6");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2018(int.Parse(idDzialu), 6, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 23, tenPlik);
            Session["tabelka006"] = tabelka01;
            gwTabela6.DataSource = null;
            gwTabela6.DataSourceID = null;
            gwTabela6.DataSource = tabelka01;
            gwTabela6.DataBind();
        }

        protected void tabela_7()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 7");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2018(int.Parse(idDzialu), 7, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 23, tenPlik);
            Session["tabelka007"] = tabelka01;
            gwTabela7.DataSource = null;
            gwTabela7.DataSourceID = null;
            gwTabela7.DataSource = tabelka01;
            gwTabela7.DataBind();
        }

        protected void tabela_8()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 8");
            }
           
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), (string)Session["id_dzialu"], 8, 4, 2, tenPlik);
            Session["tabelka008"] = tabelka01;
            pisztb("tab_8_", 4, 2, tabelka01);
        }

        protected void tabela_9()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 9");
            }
            
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), (string)Session["id_dzialu"], 9,1 , 11, tenPlik);
            Session["tabelka009"] = tabelka01;
            pisz("tab_9_", 1, 11, tabelka01);

        }
      

        protected void tabela_10()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 10");
            }

            DataTable tabelka01 = dr.generuj_dane_do_tabeli_wierszy2018(DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), (string)Session["id_dzialu"], 10, 4, 4, tenPlik);
            Session["tabelka010"] = tabelka01;
            pisz("tab_11_", 4, 4, tabelka01);

        }

        protected void tabela_11()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 11");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2018(int.Parse(idDzialu), 11, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 23, tenPlik);
            Session["tabelka011"] = tabelka01;
            gwTabela11.DataSource = null;
            gwTabela11.DataSourceID = null;
            gwTabela11.DataSource = tabelka01;
            gwTabela11.DataBind();

        }


        protected void tabela_12()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 12");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2018(int.Parse(idDzialu), 12, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 23, tenPlik);
            Session["tabelka012"] = tabelka01;
            gwTabela12.DataSource = null;
            gwTabela12.DataSourceID = null;
            gwTabela12.DataSource = tabelka01;
            gwTabela12.DataBind();

        }


        protected void tabela_13()
        {
            string idDzialu = (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 13");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2018(int.Parse(idDzialu), 13, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 23, tenPlik);
            Session["tabelka013"] = tabelka01;
            gwTabela13.DataSource = null;
            gwTabela13.DataSourceID = null;
            gwTabela13.DataSource = tabelka01;
            gwTabela13.DataBind();

        }


        protected void naglowekTabeli_gwTabela1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {

                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                string path = Server.MapPath("\\template\\" + tenPlikNazwa + ".xlsx");
                DataTable dT = tb.naglowek(path, 1);
                tb.makeHeader(sn, dT, gwTabela1);
            }
        }

        protected void naglowekTabeli_gwTabela2(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                string path = Server.MapPath("\\template\\" + tenPlikNazwa + ".xlsx");
                DataTable dT = tb.naglowek(path, 2);
                tb.makeHeader(sn, dT, gwTabela2);
            }
        }

      
        protected void naglowekTabeli_gwTabela3(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = tb.naglowek(path, 3);
                tb.makeHeader(sn, dT, gwTabela3);
            }
        }


        protected void naglowekTabeli_gwTabela4(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = tb.naglowek(path,4);
                tb.makeHeader(sn, dT, gwTabela4);
            }
        }

        protected void naglowekTabeli_gwTabela5(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = tb.naglowek(path, 5);
               tb.makeHeader(sn, dT, gwTabela5);
            }
        }

        protected void naglowekTabeli_gwTabela6(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = tb.naglowek(path, 6);
                tb.makeHeader(sn, dT, gwTabela6);
            }
        }

        protected void naglowekTabeli_gwTabela7(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = tb.naglowek(path, 7);
                tb.makeHeader(sn, dT, gwTabela7);
            }
        }

        protected void naglowekTabeli_gwTabela8(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
         ///       DataTable dT = tb.naglowek(path, 8);
          //      tb.makeHeader(sn, dT, gwTabela8);
            }
        }

        protected void naglowekTabeli_gwTabela10(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
          //      DataTable dT = tb.naglowek(path, 10);
          //      tb.makeHeader(sn, dT, gwTabela10);
            }
        }

        protected void naglowekTabeli_gwTabela11(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = tb.naglowek(path, 11);
                tb.makeHeader(sn, dT, gwTabela11);
            }
        }
        protected void naglowekTabeli_gwTabela12(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = tb.naglowek(path, 12);
                tb.makeHeader(sn, dT, gwTabela12);
            }
        }
        protected void naglowekTabeli_gwTabela13(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = tb.naglowek(path, 13);
                tb.makeHeader(sn, dT, gwTabela13);
            }

        }

        protected void naglowekTabeli_gwTabela14(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                DataTable dT = tb.naglowek(path, 14);
                tb.makeHeader(sn, dT, gwTabela13);
            }
        }

        protected void stopkaTabeli_gwTabela14(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka014"];
                tb.makeSumRow(table, e, 0);
            }
        }
        protected void stopkaTabeli_gwTabela13(object sender, GridViewRowEventArgs e)
        {
            //podsumowanie tab 13
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka013"];
               tb.makeSumRow(table, e,0);
            }
        }

        protected void stopkaTabeli_gwTabela12(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka012"];
                tb.makeSumRow(table, e,0);
            }

        }
        protected void stopkaTabeli_gwTabela11(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka011"];
                tb.makeSumRow(table, e, 0);
            }
        }
        protected void stopkaTabeli_gwTabela10(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka010"];
                tb.makeSumRow(table, e,0);
            }
        }

        protected void stopkaTabeli_gwTabela8(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka008"];
                tb.makeSumRow(table, e,0);
            }

        }

        protected void stopkaTabeli_gwTabela7(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka007"];
                tb.makeSumRow(table, e,0);
            }

        }

        protected void stopkaTabeli_gwTabela6(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka006"];
                tb.makeSumRow(table, e,0);
            }

        }

        protected void stopkaTabeli_gwTabela5(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka005"];
                tb.makeSumRow(table, e,0);
            }

        }

        protected void stopkaTabeli_gwTabela4(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka004"];
                tb.makeSumRow(table, e,0);
            }

        }

        protected void stopkaTabeli_gwTabela3(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka003"];
                tb.makeSumRow(table, e,0);
            }

        }

        protected void stopkaTabeli_gwTabela2(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka002"];
                tb.makeSumRow(table, e,0);
            }

        }

        protected void stopkaTabeli_gwTabela1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable table = (DataTable)Session["tabelka001"];
                tb.makeSumRow(table, e,0);
            }

        }

       
        protected void pisz(string template, int iloscWierszy, int iloscKolumn, DataTable dane)
        {

            for (int wiersz = 1; wiersz <= iloscWierszy; wiersz++)
            {
                for (int kolumna = 1; kolumna <= iloscKolumn; kolumna++)
                {
                    string controlName = template + "w" + wiersz.ToString("D2") + "_c" + kolumna.ToString("D2");
                    Label tb = (Label)this.Master.FindControl("ContentPlaceHolder1").FindControl(controlName);
                    if (tb != null)
                    {
                        try
                        {
                            tb.Text = dane.Rows[wiersz - 1][kolumna].ToString().Trim();

                        }
                        catch 
                        {
                        }
                        //tb.Text = dr.wyciagnijWartosc(dane, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza ='" + wiersz + "' and idkolumny='" + kolumna + "'", tenPlik);
                    }
                }
            }
        }// end of pisz
        protected void pisztb(string template, int iloscWierszy, int iloscKolumn, DataTable dane)
        {

            for (int wiersz = 1; wiersz <= iloscWierszy; wiersz++)
            {
                for (int kolumna = 1; kolumna <= iloscKolumn; kolumna++)
                {
                    string controlName = template + "w" + wiersz.ToString("D2") + "_c" + kolumna.ToString("D2");
                    TextBox tb = (TextBox)this.Master.FindControl("ContentPlaceHolder1").FindControl(controlName);
                    if (tb != null)
                    {
                        try
                        {
                            tb.Text = dane.Rows[wiersz - 1][kolumna].ToString().Trim();

                        }
                        catch                        {

                           
                        }
                        //tb.Text = dr.wyciagnijWartosc(dane, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza ='" + wiersz + "' and idkolumny='" + kolumna + "'", tenPlik);
                    }
                }
            }
        }// end of pisz

       
    }
}