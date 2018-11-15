using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace stat2018
{
    public partial class wizytacjaCywilny : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();
        public tabele tb = new tabele();
        public dataReaders dr = new dataReaders();

        const string tenPlik = "oktp.aspx";

        int storid = 0;
        int rowIndex = 1;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
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
        }

        protected void Odswiez(object sender, EventArgs e)
        {

            //odswiezenie danych
            tabelaDoWydzialu_II_1();
            tabelaDoWydzialu_II_2();
            tabelaDoWydzialu_II_3();
            tworztabelke();
        }

        protected void tworzPlikExcell(object sender, EventArgs e)
        {
            //excell

        }
        protected void tworztabelke()
        {
          
            string idDzialu = "10";// (string)Session["id_dzialu"];

            var tblControl = new Table { ID = "tabOne" };
            TableRow row = new TableRow();
            //header
            tblControl.Width = 1150;

            TableCell tCell =  komorkaTabeli("L.p.", 3, 0, "borderAll center col_36");
            row.Cells.Add(tCell);

            tCell = new TableCell();
            tCell = komorkaTabeli("imię i nazwisko", 3, 0, "borderAll center col_100");
            row.Cells.Add(tCell);


            tCell = new TableCell();
            tCell = komorkaTabeli("Funkcja", 3, 0, "borderAll center col_100");
            row.Cells.Add(tCell);

            tCell = new TableCell();
            tCell = komorkaTabeli("pomoc asystenta", 3, 0, "borderAll center col_100");
            row.Cells.Add(tCell);

            tCell = new TableCell();
            tCell = komorkaTabeli("", 3, 0, "borderAll center");
            row.Cells.Add(tCell);

            tCell = new TableCell();

            tCell = komorkaTabeli("kategoria spraw", 0, 15, "borderAll center");
            row.Cells.Add(tCell);

            
            tCell = new TableCell();
            tCell = komorkaTabeli("sprawdzenie (do usunięcia po sprawdzeniu) suma musi dać 100", 3, 0, "borderAll center col_100");

            row.Cells.Add(tCell);
            tblControl.Rows.Add(row);

            // drugi wiersz naglowka
            row = new TableRow();
            tCell = new TableCell();
            tCell = komorkaTabeli("ogółem", 0, 0, "borderAll center col_100");
            row.Cells.Add(tCell);

            tCell = new TableCell();
            tCell = komorkaTabeli("C", 0, 2, "borderAll center col_100");
            row.Cells.Add(tCell);
            tCell = new TableCell();
            tCell = komorkaTabeli("Cgg", 0, 2, "borderAll center col_100");
            row.Cells.Add(tCell);
            tCell = new TableCell();
            tCell = komorkaTabeli("Co", 0, 2, "borderAll center col_100");
            row.Cells.Add(tCell);
            tCell = new TableCell();
            tCell = komorkaTabeli("Cps", 0, 2, "borderAll center col_100");
            row.Cells.Add(tCell);
            tCell = new TableCell();
            tCell = komorkaTabeli("C- upr", 0, 2, "borderAll center col_100");
            row.Cells.Add(tCell);
            tCell = new TableCell();
            tCell = komorkaTabeli("Nc", 0, 2, "borderAll center col_100");
            row.Cells.Add(tCell);
            tCell = new TableCell();
            tCell = komorkaTabeli("Ns", 0, 2, "borderAll centercol_100");
            row.Cells.Add(tCell);

            tblControl.Rows.Add(row);
            // drugi wiersz naglowka
            row = new TableRow();
            tCell = new TableCell();

            tCell = komorkaTabeli("Liczba", 0, 0, "borderAll center col_100");
            row.Cells.Add(tCell);

            for (int i = 0; i < 7; i++)
            {
                tCell = new TableCell();
                tCell = komorkaTabeli("Liczba", 0, 0, "borderAll center col_50");
                row.Cells.Add(tCell);
                tCell = new TableCell();
                tCell = komorkaTabeli("%", 0, 0, "borderAll center col_50");
                row.Cells.Add(tCell);

            }

            tblControl.Rows.Add(row);
            tablePlaceHolder.Controls.Add(tblControl);
            // zaladowanie danych
            cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 1");

            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2018(int.Parse(idDzialu),2, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 36, tenPlik);
            Session["tabelka001"] = tabelka01;
            //ilosc sedziów
            row = new TableRow();

            int licznik = 1;
            foreach (DataRow  wierszZtabeli in tabelka01.Rows)
            {
              //  tblControl = new Table();
                row = new TableRow();
                tCell = komorkaTabeli(licznik.ToString (), 2, 0, "borderAll center col_36");
                row.Cells.Add(tCell);

                tCell = new TableCell();
                tCell = komorkaTabeli(wierszZtabeli["imie"].ToString () + " "+ wierszZtabeli["nazwisko"].ToString(), 2, 1, "borderAll center col_100");
                row.Cells.Add(tCell);


                tCell = new TableCell();
  
                tCell = komorkaTabeli(wierszZtabeli["funkcja"].ToString(), 2, 0, "borderAll center col_100");
                row.Cells.Add(tCell);

                tCell = new TableCell();

                tCell = komorkaTabeli("", 2, 0, "borderAll center col_100");
                row.Cells.Add(tCell);


                tCell = new TableCell();
                tCell = komorkaTabeli("Liczba / % spraw na dzień rozpoczęcia wizytacji albo na dzień zamknięcia referatu – dla sędziów przydzielonych do innych wydziałów przed tym dniem", 1, 0, "borderAll center col_100");
                row.Cells.Add(tCell);

               

                for (int i = 1; i < 17; i++)
                {
                    tCell = new TableCell();

                    tCell = komorkaTabeli(wierszZtabeli["D_" + i.ToString ("D2")].ToString(), 1, 1, "borderAll center col_50");
                    row.Cells.Add(tCell);

                }

              

                tblControl.Rows.Add(row);

                row = new TableRow();
                tCell = new TableCell();
                tCell = komorkaTabeli("Liczba / % spraw na dzień rozpoczęcia poprzedniej wizytacji albo na dzień utworzenia referatu –dla sędziów przydzielonych do wydziału po tym dniu", 1, 0, "borderAll center col_100");
                row.Cells.Add(tCell);
                for (int i = 18; i < 34; i++)
                {
                    tCell = new TableCell();

                    tCell = komorkaTabeli(wierszZtabeli["D_" + i.ToString("D2")].ToString(), 1, 1, "borderAll center col_50");

                    row.Cells.Add(tCell);

                }
                               
             
                licznik++;

               
                tblControl.Rows.Add(row);

                tablePlaceHolder.Controls.Add(tblControl);
            }
     //       tablePlaceHolder.Controls.Add(tblControl);

        }
        protected void tabelaDoWydzialu_II_1()
        {
          
          
            string idDzialu = "10";// (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 3");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2018(int.Parse(idDzialu),3, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 15, tenPlik);
      //      tabelka01.Columns.Remove("funkcja");
      //      tabelka01.Columns.Remove("stanowisko");
            Session["tabelka003"] = tabelka01;
            gwTabela3.DataSource = null;
            gwTabela3.DataSourceID = null;
            gwTabela3.DataSource = tabelka01;
            gwTabela3.DataBind();
        }

        protected void tabelaDoWydzialu_II_2()
        {


            string idDzialu = "10";// (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 2");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2018(int.Parse(idDzialu), 3, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 23, tenPlik);
            //      tabelka01.Columns.Remove("funkcja");
            //      tabelka01.Columns.Remove("stanowisko");
            Session["tabelka004"] = tabelka01;
            gwTabela3_2.DataSource = null;
            gwTabela3_2.DataSourceID = null;
            gwTabela3_2.DataSource = tabelka01;
            gwTabela3_2.DataBind();
        }
        protected void tabelaDoWydzialu_II_3()
        {


            string idDzialu = "10";// (string)Session["id_dzialu"];
            if (cl.debug(int.Parse(idDzialu)))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 2");
            }
            DataTable tabelka01 = dr.generuj_dane_do_tabeli_sedziowskiej_2018(int.Parse(idDzialu), 3, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 23, tenPlik);
            //      tabelka01.Columns.Remove("funkcja");
            //      tabelka01.Columns.Remove("stanowisko");
            Session["tabelka004"] = tabelka01;
            gwTabela3_3.DataSource = null;
            gwTabela3_3.DataSourceID = null;
            gwTabela3_3.DataSource = tabelka01;
            gwTabela3_3.DataBind();
        }
        TableCell komorkaTabeli(string text, int rowSpan, int colSpan, string stylKomorki)
        {
            TableCell tCell = new TableCell();
            tCell.Text = text;
            tCell.RowSpan = rowSpan;
            tCell.ColumnSpan = colSpan;
            tCell.CssClass = stylKomorki;
            return tCell;




        }

        protected void tab_1_w02_c01_dateInit(object sender, EventArgs e)
        {
            tab_1_w02_c01.Value = DateTime.Now;
        }

        protected void tab_2_w01_c01_dateInit(object sender, EventArgs e)
        {
            tab_2_w01_c01.Value = DateTime.Now;
        }

        protected void naglowekTabeli_gwTabela1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                string path = Server.MapPath("\\template\\wizc_aspx.xlsx");
                DataTable dT = tb.naglowek(path, 3);
                tb.makeHeader(sn, dT, gwTabela3);
            }
        }

        protected void naglowekTabeli_gwTabela2(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                string path = Server.MapPath("\\template\\wizc_aspx.xlsx");
                DataTable dT = tb.naglowek(path, 4);
                tb.makeHeader(sn, dT, gwTabela3_2);
            }
        }

        protected void naglowekTabeli_gwTabela3_3(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                System.Web.UI.WebControls.GridView sn = new System.Web.UI.WebControls.GridView();
                string path = Server.MapPath("\\template\\wizc_aspx.xlsx");
                DataTable dT = tb.naglowek(path, 5);
                tb.makeHeader(sn, dT, gwTabela3_3);
            }
        }
    }
}