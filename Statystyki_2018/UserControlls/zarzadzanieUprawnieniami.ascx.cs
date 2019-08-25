using System;
using DevExpress.Web;
using System.Linq;
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
               // FillCityCombo("1");
                //FillCityCombo("Mexico");
            }
         //   CBRodzaje.Items.Clear();
                /*       DevExpress.Web.ListEditItemCollection listaRodzai = new DevExpress.Web.ListEditItemCollection();
            DevExpress.Web.ListEditItem listEditItem = new DevExpress.Web.ListEditItem();
            if (CBRodzaje.Items.Count == 0)
            {
                listEditItem.Text = "Statystyki miesięczne";
                listEditItem.Value = Rodzaje.miesieczne;
                CBRodzaje.Items.Add(listEditItem);
                listEditItem = new DevExpress.Web.ListEditItem

                {
                    Text = "Kontrolki",
                    Value = Rodzaje.kontrolki
                };
                CBRodzaje.Items.Add(listEditItem);

                listEditItem = new DevExpress.Web.ListEditItem
                {
                    Text = "MSS",
                    Value = Rodzaje.MSS
                };
                CBRodzaje.Items.Add(listEditItem);

                listEditItem = new DevExpress.Web.ListEditItem
                {
                    Text = "Kof",
                    Value = Rodzaje.kof
                };
                CBRodzaje.Items.Add(listEditItem);

                listEditItem = new DevExpress.Web.ListEditItem
                {
                    Text = "Wyszukiwarka",
                    Value = Rodzaje.wyszukiwarka
                };
                CBRodzaje.Items.Add(listEditItem);

                listEditItem = new DevExpress.Web.ListEditItem
                {
                    Text = "Pracownik",
                    Value = Rodzaje.pracownik
                };
                */
               // CBRodzaje.Items.Add(listEditItem);

                CBRodzaje.SelectedIndex = 0;
           
                
            
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

            using (var context = ls.listaFormularze() )
            {
                string filter = " rodzaj=" + countryName;
                var jedenRodzaj = context.Select (filter,"ident ASC");
                foreach (var wiersz in jedenRodzaj)
                {
                    DataRow nowyWiersz = result.NewRow();
                    nowyWiersz["ident"] = wiersz[0];
                    nowyWiersz["nazwa"] = wiersz[1];
                    nowyWiersz["rodzaj"] = wiersz[2];
                    result.Rows.Add(nowyWiersz );
                }
                CBListaFormularzy.DataSource = result ;
                CBListaFormularzy.DataBind();
                if (result !=null)
                {
                    string minValue = result.Rows[0][0].ToString();
                    CBListaFormularzy.Value = minValue;
                }
                //var col = result.Select( "ident=min(ident)");

                
            }
        }

        protected void CBListaFormularzy_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            FillCityCombo(e.Parameter);
        }
       
    }
}