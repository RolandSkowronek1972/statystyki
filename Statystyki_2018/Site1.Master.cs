using System;


namespace stat2018
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        common cm = new common();
        public Header naglowek = new Header();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                String IdentyfikatorUzytkownika = string.Empty;
                try
                {
                    cm.log.Info("Site1.Master: Przypisanie identyfikatora uzytkownika");
                    IdentyfikatorUzytkownika = (string)Session["identyfikatorUzytkownika"];
                    int userDigitalId = 0;
                    try
                    {
                        userDigitalId = int.Parse(IdentyfikatorUzytkownika);
                    }
                    catch 
                    {
                        cm.log.Error("Site1.Master:Brak przeniesienia z logowania identyfikatora numerycznego Użytkownika! ");
                    }
                    cm.log.Info("Site1.Master: Identyfikatora uzytkownika: " + IdentyfikatorUzytkownika);
                }
                catch 
                {
                    cm.log.Error("Site1.Master: Nie przypisanoe identyfikatora użytkownika");
                }

                //SPRAWDZENIE CZY POPRZEDNI I OBECNY UZYTKOWNIK SA TAKIE SAME
                try
                {
                    if (!string.IsNullOrEmpty (IdentyfikatorUzytkownika.Trim()))
                    {

                    
                        if ((string.Equals((string)Session["poprzedniUzytkownik"], IdentyfikatorUzytkownika)) && (Session["manu1"] != null))
                        {
                            wypelnijMenu();
                        }
                        else
                        {
                            //nowy user
                            Session["manu1"] = naglowek.daneDoManuMiesieczne(IdentyfikatorUzytkownika);
                            Session["manu2"] = naglowek.daneDoManuKontrolek(IdentyfikatorUzytkownika);
                            Session["manu3"] = naglowek.daneDoManuMSS(IdentyfikatorUzytkownika);
                            Session["manu4"] = naglowek.daneDoManuInne(IdentyfikatorUzytkownika);
                            wypelnijMenu();
                        }
                    }
                }
                catch (Exception ex)
                {
                    cm.log.Error(ex.Message);
                }


                Label1.Text = (string)Session["daneUzytkownika"];
                Session["poprzedniUzytkownik"] = IdentyfikatorUzytkownika;
            }
        }

        protected void wypelnijMenu()
        {
            ASPxPopupMenu1.Items.Clear();
            ASPxPopupMenu1.RootItem.Items.Add((DevExpress.Web.MenuItem)Session["manu1"]);
            ASPxPopupMenu1.RootItem.Items.Add((DevExpress.Web.MenuItem)Session["manu2"]);
            ASPxPopupMenu1.RootItem.Items.Add((DevExpress.Web.MenuItem)Session["manu3"]);
            ASPxPopupMenu1.RootItem.Items.Add((DevExpress.Web.MenuItem)Session["manu4"]);
        }

        protected void ASPxPopupMenu1_ItemClick(object source, DevExpress.Web.MenuItemEventArgs e)
        {
            string txt = e.Item.Name;
            Session["id_dzialu"] = txt;
        }
    }
}
