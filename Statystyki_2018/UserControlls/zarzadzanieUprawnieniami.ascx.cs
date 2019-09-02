using System;
using System.Data;

namespace stat2018.UserControlls
{
    public partial class zarzadzanieUprawnieniami : System.Web.UI.UserControl
    {
        private common cm = new common();
        public listaFormularzy ls = new listaFormularzy();

        public enum Rodzaje
        {
            admin = 0,// (możliwość nadawania uprawnień)
            miesieczne = 1,
            kontrolki = 2,
            MSS = 3,
            kof = 4,
            wyszukiwarka = 5,
            pracownik = 6,
            potwierdzenie = 1
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CBRodzaje.Value = "Statystyki miesięczne";
                if (CBRodzaje.SelectedIndex==-1)
                {
                    if (CBRodzaje.Items.Count>=0)
                    {
                        CBRodzaje.SelectedIndex = 0;
                        FillCityCombo(CBRodzaje.SelectedItem.Value.ToString());
                    }
                    
                }
                
                // FillCityCombo("1");
                //FillCityCombo("Mexico");
              //  CBRodzaje.Items.Clear();
             //   DevExpress.Web.ListEditItemCollection listaRodzai = new DevExpress.Web.ListEditItemCollection();
                DevExpress.Web.ListEditItem listEditItem = new DevExpress.Web.ListEditItem();
                if (CBRodzaje.Items.Count == 0)
                {
                    listEditItem.Text = "Statystyki miesięczne";
                    listEditItem.Value = (int)Rodzaje.miesieczne;
                    CBRodzaje.Items.Add(listEditItem);
                    listEditItem = new DevExpress.Web.ListEditItem

                    {
                        Text = "Kontrolki",
                        Value = (int)Rodzaje.kontrolki
                    };
                    CBRodzaje.Items.Add(listEditItem);

                    listEditItem = new DevExpress.Web.ListEditItem
                    {
                        Text = "MSS",
                        Value = (int)Rodzaje.MSS
                    };
                    CBRodzaje.Items.Add(listEditItem);

                    listEditItem = new DevExpress.Web.ListEditItem
                    {
                        Text = "Kof",
                        Value = (int)Rodzaje.kof
                    };
                    CBRodzaje.Items.Add(listEditItem);

                    listEditItem = new DevExpress.Web.ListEditItem
                    {
                        Text = "Wyszukiwarka",
                        Value = (int)Rodzaje.wyszukiwarka
                    };
                    CBRodzaje.Items.Add(listEditItem);

                    listEditItem = new DevExpress.Web.ListEditItem
                    {
                        Text = "Pracownik",
                        Value = (int)Rodzaje.pracownik
                    };

                //    CBRodzaje.Items.Add(listEditItem);

                    CBRodzaje.SelectedIndex = 0;
                //    FillCityCombo(CBRodzaje.SelectedItem.Value.ToString());


                }
            }
     
        }

        protected void FillCityCombo(string countryName)
        {
            if (string.IsNullOrEmpty(countryName)) return;

            DataTable result = new DataTable();
            DataColumn ident = new DataColumn("ident", typeof(int));
            DataColumn nazwa = new DataColumn("nazwa", typeof(string));
            DataColumn rodzaj = new DataColumn("rodzaj", typeof(int));
            result.Columns.Add(ident);
            result.Columns.Add(nazwa);
            result.Columns.Add(rodzaj);
           
            using (var context = ls.listaFormularze())
            {
                string filter = " rodzaj=" + countryName;
                var jedenRodzaj = context.Select(filter, "ident ASC");
                foreach (var wiersz in jedenRodzaj)
                {
                    DataRow nowyWiersz = result.NewRow();
                    nowyWiersz["ident"] = wiersz[0];
                    nowyWiersz["nazwa"] = wiersz[1];
                    nowyWiersz["rodzaj"] = wiersz[2];
                    result.Rows.Add(nowyWiersz);
                }

            }

            int ilosc = result.Rows.Count;
            if ((result != null) && (result.Rows.Count > 0))
            {
                CBListaFormularzy.DataSource = result;
                CBListaFormularzy.DataBind();
                string minValue = result.Rows[0][0].ToString();
                CBListaFormularzy.Value = minValue;
            }
        }

        protected void CBListaFormularzy_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            FillCityCombo(e.Parameter);
        }
    }
}