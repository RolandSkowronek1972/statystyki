using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using DevExpress.Web;

namespace stat2018
{
    public partial class WebForm2 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        protected void grid_DataBound(object sender, EventArgs e)
        {
            /*
            var Grid = sender as ASPxGridView;
            foreach (GridViewColumn Column in Grid.AllColumns)
            {
                try
                {
                    GridViewDataColumn DataColumn = (GridViewDataColumn)Column;
                    if (DataColumn.GetType().Equals(typeof(GridViewDataDateColumn)))
                    {
                        grid.DataColumns[Column.Index].SettingsHeaderFilter.Mode = GridHeaderFilterMode.DateRangePicker;
                    }
                }
                catch 
                {

                   
                }
               
               
            }*/
        }

        protected void ASPxGridView1_DataBound(object sender, EventArgs e)
        {
            var grid = sender as ASPxGridView;
           // var targetColumn = (GridViewDataColumn)grid.AllColumns.First(x => (x as GridViewDataColumn).FieldName.Contains("Date"));
           // targetColumn.SettingsHeaderFilter.Mode = GridHeaderFilterMode.DateRangePicker;


            foreach (GridViewColumn Column in grid.AllColumns)
            {
                try
                {
                    GridViewDataColumn DataColumn = (GridViewDataColumn)Column;
                    if (DataColumn.GetType().Equals(typeof(GridViewDataDateColumn)))
                    {
                        grid.DataColumns[Column.Index].SettingsHeaderFilter.Mode = GridHeaderFilterMode.DateRangePicker;
                    }
                }
                catch
                {


                }
            }

        }
    }
}