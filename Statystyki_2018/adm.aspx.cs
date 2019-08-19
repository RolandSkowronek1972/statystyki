using System;

using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DevExpress.Web;
using System.Collections;

namespace stat2018
{
    public partial class adm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ASPxGridView1_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
           // e.NewValues=
            IDictionaryEnumerator enumerator = e.NewValues.GetEnumerator();
            enumerator.Reset();
            
        }

        protected void zapisDanych(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            try
            {
               
                var miesieczne = e.NewValues["rodzaj"];
                var mss = e.NewValues["mss"];
                var kontrolki = e.NewValues["kontrolka"];
                var kof = e.NewValues["kof"];
                var wyszukiwarka = e.NewValues["wyszukiwarka"];
                var pracownik = e.NewValues["pracownik"];

            }
            catch (Exception ex)
            {
                var error = ex.Message;
                string blad = error.ToString();
              
            }
            

        }
    }
}