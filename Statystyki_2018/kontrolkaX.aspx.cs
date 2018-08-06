using System;
using System.Data;
using DevExpress.Web;


namespace stat2018
{
    public partial class kontrolkaX : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public wyszukiwarka w1 = new wyszukiwarka();
        public common cm = new common();

        protected void Page_Load(object sender, EventArgs e)
        {
          
            if (!IsPostBack)
            {
                string kw = string.Empty;
                string cs = string.Empty;
                try
                {
                   

                    string value = Request.QueryString["id"];
                    string errorMessage = Request.QueryString["info"];
                    if (value != null)
                    {
                        // wgrac kwerende
                        DataTable parameters = cm.makeParameterTable();
                        parameters.Rows.Add("@ident", value);
                        kw = cm.getQuerryValue("SELECT wartosc FROM            konfig  WHERE        (ident = @ident)", cm.con_str, parameters);
                        cs = cm.getQuerryValue("SELECT ConnectionString FROM            konfig  WHERE        (ident = @ident)", cm.con_str, parameters);

                    }
                    else
                    {
                        Server.Transfer("default.aspx");
                    }
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
                    Server.Transfer("default.aspx");
                }

                if (string.IsNullOrEmpty(data1.Text.Trim()))
                {
                    data1.Text = DateTime.Parse(DateTime.Now.Year.ToString() + "-01-01").ToShortDateString();

                }
                if (string.IsNullOrEmpty(data2.Text.Trim()))
                {
                    data2.Text = DateTime.Now.ToShortDateString();
                }
                makeGrid(cs, kw);

            }

        }

        protected void makeGrid(string connectionString, string kwerenda)
        {

            // odczytaj dane
           
            DataTable parameters = cm.makeParameterTable();
            parameters.Rows.Add("@data_1", data1.Text);
            parameters.Rows.Add("@data_2", data2.Text);
            DataTable dT = cm.getDataTable(kwerenda, connectionString, parameters);
            SqlDataSource1.SelectCommand = kwerenda;
            SqlDataSource1.ConnectionString = connectionString;
            SqlDataSource1.DataBind();
            Session["data1"] = data1.Text.Trim();
            Session["data2"] = data2.Text.Trim();


            try
            {

               
                ASPxGridView1.AutoGenerateColumns = true;
                ASPxGridView1.DataSource = null;
                ASPxGridView1.DataSourceID = null;
                ASPxGridView1.DataSource = SqlDataSource1;
                /*
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
                */



                if (ASPxGridView1.Columns.Count > 0)
                {
                    ASPxGridView1.KeyFieldName = ASPxGridView1.Columns[0].Name;

                }
                ASPxGridView1.DataBind();
            }
            catch (Exception ex)
            {
                cm.log.Error(ex.Message);
            }
        }



        protected void szukaj(object sender, EventArgs e)
        {

        }

        protected void Druk(object sender, EventArgs e)
        {

        }
    }
}