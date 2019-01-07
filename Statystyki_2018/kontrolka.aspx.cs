using System;
using System.Data;
using DevExpress.Web;
using System.IO;
using DevExpress.XtraPrinting;
using System.Web;
using System.Net.Mime;
using System.Drawing;
using System.Web.UI;

namespace stat2018
{
   

    public partial class kontrolka : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public wyszukiwarka w1 = new wyszukiwarka();
        public common cm = new common();
           
            protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack && !IsCallback )
            {
                
                string kw = string.Empty;
                string cs = string.Empty;
                int szerokoscKolumny = 0;
                int rozmiarCzcionki = 0;
                int szerokosctabeli = 0;
                string value = Request.QueryString["id"];
                string errorMessage = Request.QueryString["info"];
                try
                {
                    ASPxGridView1.SettingsPager.PageSize = int.Parse (cm.odczytajWartosc("kontrolka_wiersze"));
                }
                catch 
                {
                    ASPxGridView1.SettingsPager.PageSize = 500;
                }
                

                if (value != null)
                {
                    // wgrac kwerende
                    DataTable parameters = cm.makeParameterTable();
                    parameters.Rows.Add("@ident", value);
                    kw = cm.getQuerryValue("SELECT wartosc FROM            konfig  WHERE        (ident = @ident)", cm.con_str, parameters);
                    cs = cm.getQuerryValue("SELECT ConnectionString FROM            konfig  WHERE        (ident = @ident)", cm.con_str, parameters);
                    try
                    {
                        szerokoscKolumny = int.Parse ( cm.getQuerryValue("SELECT szerokoscKolumny FROM            konfig  WHERE        (ident = @ident)", cm.con_str, parameters));
                    }
                    catch 
                    {  }
                    try
                    {
                        rozmiarCzcionki = int.Parse (cm.getQuerryValue("SELECT rozmiarczcionki FROM            konfig  WHERE        (ident = @ident)", cm.con_str, parameters));
                    }
                    catch (Exception)
                    {   }
                    try
                    {
                        szerokosctabeli = int.Parse(cm.getQuerryValue("SELECT szerokosctabeli FROM            konfig  WHERE        (ident = @ident)", cm.con_str, parameters));
                    }
                    catch (Exception)
                    { }

                    Session["rozmiarCzcionki"] = rozmiarCzcionki;
                    Session["szerokoscKolumny"] = szerokoscKolumny;
                    Session["szerokosctabeli"] = szerokosctabeli;

                    Session["cs"] = cs;
                    Session["kw"] = kw;
                }
                else
                {
                    Server.Transfer("default.aspx");
                }
                try
                {
                    string land = System.Globalization.CultureInfo.CurrentCulture.Name;
                    var fileContents = System.IO.File.ReadAllText(Server.MapPath(@"~//version.txt"));
                    this.Title = "Kontrolka " + fileContents.ToString().Trim();
                    string txt = (string)Session["user_id"];//userIdNum
                    if (string.IsNullOrEmpty((txt)))
                    {
                        Server.Transfer("default.aspx");
                    }

                }
                catch (Exception ex)
                {
                    cm.log.Error("kontrolka Bład: " + ex.Message);
                }

                if (string.IsNullOrEmpty(data1.Text.Trim()))
                {
                    data1.Text = DateTime.Parse(DateTime.Now.Year.ToString() + "-01-01").ToShortDateString();

                }
                if (string.IsNullOrEmpty(data2.Text.Trim()))
                {
                    data2.Text = DateTime.Now.ToShortDateString();
                }
               
                cm.log.Info("Kontrolka uruchomienie przeliczania formularza ");
                makeGrid(cs, kw);
            }
            else
            {
                ASPxGridView1.DataBind();
            }
            
        }


          protected void makeGrid(string connectionString, string kwerenda)
        {

            // odczytaj dane
            try
            {
                SqlDataSource1.ConnectionString = connectionString;

            }
            catch (Exception)
            { }
            DataTable parameters = cm.makeParameterTable();
            parameters.Rows.Add("@data_1", data1.Text);
            parameters.Rows.Add("@data_2", data2.Text);
            DataTable dT = cm.getDataTable(kwerenda, connectionString, parameters);

            Session["data1"] = data1.Text.Trim();
            Session["data2"] = data2.Text.Trim();


            try
            {

                SqlDataSource1.DataBind();
                SqlDataSource1.CancelSelectOnNullParameter = false;
                //   ASPxGridView1.AutoGenerateColumns = true;
                ASPxGridView1.Columns.Clear();
                ASPxGridView1.DataSource = null;
                ASPxGridView1.DataSourceID = null;
                //   dT.PrimaryKey =  dT.Columns[0] ;
                //wstawienie kolumna
                ASPxGridView1.DataSource = dT;

                foreach (DataColumn dCol in dT.Columns)
                {
                    string name = dCol.ColumnName;
                    Type typ = dCol.DataType;
                    Type typRef = typeof(DateTime);
                    GridViewDataColumn id = new GridViewDataColumn();
                    id.FieldName = name;
                    ASPxGridView1.Columns.Add(id);
                    if (typ == typRef)
                    {
                        ASPxGridView1.DataColumns[name].SettingsHeaderFilter.Mode = GridHeaderFilterMode.DateRangePicker;
                    }

                }




                if (ASPxGridView1.Columns.Count > 0)
                {
                     ASPxGridView1.KeyFieldName = ASPxGridView1.Columns[0].Name;

                }
                int szerokoscKolumny = 0;
                ASPxGridView1.DataBind();
                try
                {
                     szerokoscKolumny = (int)Session["szerokoscKolumny"];
                }
                catch 
                {  }


                int rozmiarczcionki = 0;
                try
                {
                    rozmiarczcionki = (int)Session["rozmiarczcionki"];
                }
                catch 
                {
                    
                }
                if (rozmiarczcionki>0)
                {
                    for (int i = 0; i < ASPxGridView1.Columns.Count; i++)
                    {
                        ASPxGridView1.Columns[i].CellStyle.Font.Size = rozmiarczcionki;
                    }
                }
                if (szerokoscKolumny>0)
                {
                    for (int i = 0; i < ASPxGridView1.Columns.Count; i++)
                    {
                        ASPxGridView1.Columns[i].Width= szerokoscKolumny;
                        ASPxGridView1.Style.Add("width", szerokoscKolumny.ToString());
                    }
                }
                try
                {
                    int szerokoscTabeli = (int)Session["szerokosctabeli"];
                    if (szerokoscTabeli >0)
                    {
                        ASPxGridView1.Width = szerokoscTabeli;

                    }
                }
                catch 
                {

                    ASPxGridView1.Width = 1150;
                }

            }
            catch (Exception ex)
            {
                cm.log.Error(ex.Message);
            }
        }


        protected void szukaj(object sender, EventArgs e)
        {
            try
            {
                
                string connectionString = (string)Session["cs"];
                string kwerenda = (string)Session["kw"];
               
                makeGrid(connectionString, kwerenda);
            }
            catch
            { }
        }

        protected void Druk(object sender, EventArgs e)
        {
            Session["exporter"] = ASPxGridViewExporter1;
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "print2", "JavaScript:window.open('kontrolkaDruk.aspx')", true);
         /*   try
            {

                using (MemoryStream ms = new MemoryStream())
            {
                    PrintableComponentLink pcl = new PrintableComponentLink(new PrintingSystem());
                    ASPxGridViewExporter1.FileName = "Kontrolka.pdf";
                    Font newfont = new Font(FontFamily.GenericSerif, 12, FontStyle.Bold | FontStyle.Underline);
                    
                   
                    pcl.Component = ASPxGridViewExporter1;
                    
                    pcl.Margins.Left = pcl.Margins.Right = 50;
                    
                    pcl.Landscape = true;
                    pcl.CreateDocument(false);
                    pcl.PrintingSystem.Document.AutoFitToPagesWidth = 0;
                    
                   pcl.ExportToPdf(ms);
                    WriteResponse(this.Response, ms.ToArray(), System.Net.Mime.DispositionTypeNames.Inline.ToString());
                }
                /*
                ASPxGridViewExporter1.Landscape = true;
                ASPxGridViewExporter1.WritePdfToResponse("Kontrolka", true, new DevExpress.XtraPrinting.PdfExportOptions() { ShowPrintDialogOnOpen = true });
                
               */ 


           /* }
            catch (Exception ex)
            {
               // cm.log.Error("Kontrolka : generowanie pdf :" + ex.Message);

            }*/

        }

        public static void WriteResponse(HttpResponse response, byte[] filearray, string type)
        {
            response.ClearContent();
            response.Buffer = true;
            response.Cache.SetCacheability(HttpCacheability.Private);
            response.ContentType = "application/pdf";
            ContentDisposition contentDisposition = new ContentDisposition();
            contentDisposition.FileName = "Kontrolka.pdf";
            contentDisposition.DispositionType = type;
            response.AddHeader("Content-Disposition", contentDisposition.ToString());
            response.BinaryWrite(filearray);
            HttpContext.Current.ApplicationInstance.CompleteRequest();
            try
            {
                response.End();
            }
            catch (System.Threading.ThreadAbortException)
            {
            }

        }


        protected void GridDataBinding(object sender, EventArgs e)
        {
            string kwerenda = (string)Session["kw"];
            string connectionString = (string)Session["cs"];



            DataTable parameters = cm.makeParameterTable();
            parameters.Rows.Add("@data_1", data1.Text);
            parameters.Rows.Add("@data_2", data2.Text);
            DataTable dT = cm.getDataTable(kwerenda, connectionString, parameters);

            Session["data1"] = data1.Text.Trim();
            Session["data2"] = data2.Text.Trim();


            ASPxGridView1.Columns.Clear();
            ASPxGridView1.DataSource = null;
                ASPxGridView1.DataSource = dT;

                foreach (DataColumn dCol in dT.Columns)
                {
                    string name = dCol.ColumnName;
                    Type typ = dCol.DataType;
                    Type typRef = typeof(DateTime);
                    GridViewDataColumn id = new GridViewDataColumn();
                    id.FieldName = name;
                    ASPxGridView1.Columns.Add(id);
                    if (typ == typRef)
                    {
                        ASPxGridView1.DataColumns[name].SettingsHeaderFilter.Mode = GridHeaderFilterMode.DateRangePicker;
                        ASPxGridView1.DataColumns[name].Settings.AllowHeaderFilter =DevExpress.Utils.DefaultBoolean.True ;
                    }

                }

                if (ASPxGridView1.Columns.Count > 0)
                {
                     ASPxGridView1.KeyFieldName = ASPxGridView1.Columns[0].Name;
                }



       }
    }
}