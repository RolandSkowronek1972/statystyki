using System;
using System.DirectoryServices.AccountManagement;

namespace stat2018
{
    public partial class _default : System.Web.UI.Page
    {
        public logowanie Logowanie = new logowanie();
        public log_4_net log = new log_4_net();

        protected void Page_Load(object sender, EventArgs e)
        {
            string value = Request.QueryString["logout"];
            if (value != null)
            {
                if (value == "true")
                {
                    Session["user_id"] = null;
                    Session["id_dzialu"] = null;
                    Session["data_1"] = null;
                    Session["data_2"] = null;
                    Session["userIdNum"] = null;
                }
            }
            string errorMessage = Request.QueryString["info"];
            if (errorMessage != null)
            {
                ErrorBox.Visible = true;
                ErrorBox.Text = errorMessage;
            }
            else
            {
                ErrorBox.Visible = false;
            }
            if (value == null)
            {
                //URL nie zawierał parametru ‘key’
            }
            else
            {
                Session["user_id"] = null;
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            zaloguj();
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
            zaloguj();
        }

        protected void zaloguj()
        {
            //log.Debug("uruchomienie logowania");

            bool result = true;
            try
            {
                using (PrincipalContext pc = new PrincipalContext(ContextType.Domain, TextBox3.Text.Trim()))
                {
                    try
                    {
                        //log.Info("sprawdzanie logowania domenowego");
                        result = pc.ValidateCredentials(TextBox1.Text.Trim(), TextBox2.Text.Trim());
                        if (result)
                        {
                            //log.Info("Logowanie domenowe się powiodło");
                            Session["damain"] = "1";
                            string id = Logowanie.podajIdUzytkownikaDomenowego(TextBox1.Text);
                            Session["user_id"] = TextBox1.Text.Trim();
                            Session["userIdNum"] = id;
                            Session["identyfikatorUzytkownika"] = id;
                            Session["daneUzytkownika"] = Logowanie.PodajDaneUzytkownika(TextBox1.Text.Trim());
                        }
                        else
                        {
                            Session["damain"] = "0";
                            //log.Info("Logowanie użytkowników z bazy danych");
                            string id = Logowanie.loguj(TextBox1.Text.Trim(), TextBox2.Text.Trim());
                            int ident = 0;
                            try
                            {
                                ident = int.Parse(id);
                            }
                            catch
                            {
                                //log.Error("Logowanie: bład odczytu uzytkownika z bazy danych ");
                                string resutt = Logowanie.CzyJestUzytkownikwBazie(TextBox1.Text.Trim());
                                if (resutt == "0")
                                {
                                    //log.Error("Logowanie: uzytkownik: "+TextBox1.Text.Trim ()+" nie istnieje w bazie danych!!! ");
                                }
                            }
                            if (ident > 0)
                            {
                                //log.Info("Logowanie poprawne!!! identyfikator użytkownika: " + TextBox1.Text.Trim() + " identyfikator: " + id);
                                result = true;
                                Session["user_id"] = TextBox1.Text.Trim();
                                Session["userIdNum"] = id;
                                Session["identyfikatorUzytkownika"] = id;
                                Session["daneUzytkownika"] = Logowanie.PodajDaneUzytkownika(TextBox1.Text.Trim());
                            }
                            else
                            {
                                log.Error("Logowanie nie poprawne!!! Użytkownik: " + TextBox1.Text.Trim() + " podał niepoprawne hasło lub nie istanieje na liście użytkowników");
                            }
                        }
                    }
                    catch
                    {
                        log.Info("Logowanie niepoprawne !!! Użytkownik: " + TextBox1.Text.Trim() + " podał niepoprawne hasło lub nie istanieje na liście użytkowników");
                    }
                }
            }
            catch (Exception ex)
            {
                //log.Error("Logowanie domenowe się nie powiodło");
                Session["damain"] = "0";
                //log.Info("Logowanie użytkowników z bazy danych");

                string id = Logowanie.loguj(TextBox1.Text.Trim(), TextBox2.Text.Trim());
                if (id != "")
                {
                    //log.Info("Logowanie poprawne!!! Nazwa uzytkownika: " + TextBox1.Text.Trim() + " identyfikator: " + id);
                    result = true;
                    Session["user_id"] = TextBox1.Text.Trim();
                    Session["userIdNum"] = id;
                    Session["identyfikatorUzytkownika"] = id;
                    Session["daneUzytkownika"] = Logowanie.PodajDaneUzytkownika(TextBox1.Text.Trim());
                }
                else
                {
                    result = false;
                }
                // Label3.Text = ex.Message; ;
            }

            if (result)
            {
                Session["manu1"] = null;
                Session["manu2"] = null;
                Session["manu3"] = null;
                Session["manu4"] = null;
                Session["user_id"] = TextBox1.Text.Trim();
                Server.Transfer("redirector.aspx");
            }
            else
            {
                ASPxPopupControl1.ShowOnPageLoad = true;
                //     Label3.Text = Label3.Text + " Wrong username or password";
            }
        }
    }
}