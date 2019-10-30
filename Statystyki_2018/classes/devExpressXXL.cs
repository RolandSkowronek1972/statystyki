using DevExpress.Data;
using DevExpress.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace stat2018
{
    public class devExpressXXL
    {
       

        public ASPxSummaryItem komorkaSumujaca(int FieldNr)
        {
            string idPola = "d_" + FieldNr.ToString("D2");
            ASPxSummaryItem _komorkaSumujaca = new ASPxSummaryItem
            {
                FieldName = idPola,
                ShowInColumn = idPola,
                SummaryType = SummaryItemType.Sum,
                DisplayFormat = "{0}"
            };
            return _komorkaSumujaca;
        }

        public GridViewBandColumn GetBoundColumn(string caption)
        {
            GridViewBandColumn _getBoundColumn = new GridViewBandColumn { Caption = caption };
            _getBoundColumn.HeaderStyle.Wrap = DevExpress.Utils.DefaultBoolean.True;
            _getBoundColumn.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;

            return _getBoundColumn;
        }

        public GridViewBandColumn GetBoundColumn(string caption, string style)
        {
            GridViewBandColumn _getBoundColumn = GetBoundColumn(caption);
            _getBoundColumn.HeaderStyle.CssClass = style;
            return _getBoundColumn;
        }

        public GridViewDataTextColumn kolumnaDoTabeli(string Napis, string poleDanych, string identyfikatorWydzialu, string styl, bool isFixed)
        {
            GridViewDataTextColumn kolumna_ = new GridViewDataTextColumn
            {
                Caption = Napis,
                FieldName = poleDanych,
                Width = 36,
                DataItemTemplate = new CustomTemplate { IdKolumny = poleDanych, IdTabeli = identyfikatorWydzialu }
            };
            kolumna_.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
            kolumna_.CellStyle.CssClass = "normal center " + styl;
            kolumna_.HeaderStyle.CssClass = styl;
            kolumna_.HeaderStyle.Wrap = DevExpress.Utils.DefaultBoolean.True;
            if (isFixed)
            {
                kolumna_.FixedStyle = GridViewColumnFixedStyle.Left;
            }
            return kolumna_;
        }

        public GridViewDataTextColumn kolumnaDoTabeli(string Napis, string poleDanych, string identyfikatorWydzialu, string styl, bool isFixed, int szerokoscKolumny)
        {
            GridViewDataTextColumn kolumna_ = new GridViewDataTextColumn
            {
                Caption = Napis,
                FieldName = poleDanych,
                Width = szerokoscKolumny,
                DataItemTemplate = new CustomTemplate { IdKolumny = poleDanych, IdTabeli = identyfikatorWydzialu }
            };
            kolumna_.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
            kolumna_.CellStyle.CssClass = "normal center " + styl;
            kolumna_.HeaderStyle.CssClass = styl;
            kolumna_.HeaderStyle.Wrap = DevExpress.Utils.DefaultBoolean.True;
            if (isFixed)
            {
                kolumna_.FixedStyle = GridViewColumnFixedStyle.Left;
            }
            return kolumna_;
        }

        public GridViewBandColumn kolumnaDoTabeli(string Napis, string poleDanych, string identyfikatorWydzialu, string styl, bool isFixed, int szerokoscKolumny, bool numerKolumny)
        {
            string numerKolumnySTR = poleDanych.Replace("d_", "");

            GridViewDataTextColumn kolumna_ = new GridViewDataTextColumn
            {
                Caption = int.Parse(numerKolumnySTR).ToString(),
                FieldName = poleDanych,
                Width = szerokoscKolumny,
                DataItemTemplate = new CustomTemplate { IdKolumny = poleDanych, IdTabeli = identyfikatorWydzialu }
            };
            kolumna_.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
            kolumna_.CellStyle.CssClass = "normal center " + styl;
            kolumna_.HeaderStyle.CssClass = styl;
            kolumna_.HeaderStyle.Wrap = DevExpress.Utils.DefaultBoolean.True;
            if (isFixed)
            {
                kolumna_.FixedStyle = GridViewColumnFixedStyle.Left;
            }

            GridViewBandColumn kolumnaZNumerem = GetBoundColumn(Napis);
            kolumnaZNumerem.Columns.Add(kolumna_);
            return kolumnaZNumerem;
        }
        public GridViewBandColumn kolumnaDoTabeli(string Napis, string poleDanych, string identyfikatorWydzialu, string styl, bool isFixed, int szerokoscKolumny, bool numerKolumny,int poziom)
        {
            string numerKolumnySTR = poleDanych.Replace("d_", "");

            GridViewDataTextColumn kolumna_ = new GridViewDataTextColumn
            {
                Caption = int.Parse(numerKolumnySTR).ToString(),
                FieldName = poleDanych,
                Width = szerokoscKolumny,
                DataItemTemplate = new CustomTemplate { IdKolumny = poleDanych, IdTabeli = identyfikatorWydzialu }
            };
            kolumna_.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
            kolumna_.CellStyle.CssClass = "normal center " + styl;
            kolumna_.HeaderStyle.CssClass = styl;
            kolumna_.HeaderStyle.Wrap = DevExpress.Utils.DefaultBoolean.True;
            if (isFixed)
            {
                kolumna_.FixedStyle = GridViewColumnFixedStyle.Left;
            }

            GridViewBandColumn kolumnaZNumerem = GetBoundColumn(Napis);
            switch (poziom)
            {
                case 1: {

                        kolumnaZNumerem.Columns.Add(kolumna_);
                    }
                    break;
                case 2:
                    {
                        GridViewBandColumn kolumnaZNumeremPoziom1 = new GridViewBandColumn();
                        kolumnaZNumeremPoziom1.Columns.Add(kolumna_);
                      
                        kolumnaZNumerem.Columns.Add(kolumnaZNumeremPoziom1);
                    }
                    break;
                case 3:
                    {
                        GridViewBandColumn kolumnaZNumeremPoziom1 = new GridViewBandColumn();
                        kolumnaZNumeremPoziom1.Columns.Add(kolumna_);
                        GridViewBandColumn kolumnaZNumeremPoziom2 = new GridViewBandColumn();
                        kolumnaZNumeremPoziom2.Columns.Add(kolumnaZNumeremPoziom1);
                        kolumnaZNumerem.Columns.Add(kolumnaZNumeremPoziom1);
                    }
                    break;
                case 4:
                    {
                        GridViewBandColumn kolumnaZNumeremPoziom1 = new GridViewBandColumn();
                        kolumnaZNumeremPoziom1.Columns.Add(kolumna_);
                        GridViewBandColumn kolumnaZNumeremPoziom2 = new GridViewBandColumn();
                        kolumnaZNumeremPoziom2.Columns.Add(kolumnaZNumeremPoziom1);
                        GridViewBandColumn kolumnaZNumeremPoziom3 = new GridViewBandColumn();
                        kolumnaZNumeremPoziom3.Columns.Add(kolumnaZNumeremPoziom2);
                        kolumnaZNumerem.Columns.Add(kolumnaZNumeremPoziom3);
                    }
                    break;
                case 5:
                    {
                        GridViewBandColumn kolumnaZNumeremPoziom1 = new GridViewBandColumn();
                        kolumnaZNumeremPoziom1.Columns.Add(kolumna_);
                        GridViewBandColumn kolumnaZNumeremPoziom2 = new GridViewBandColumn();
                        kolumnaZNumeremPoziom2.Columns.Add(kolumnaZNumeremPoziom1);
                        GridViewBandColumn kolumnaZNumeremPoziom3 = new GridViewBandColumn();
                        kolumnaZNumeremPoziom3.Columns.Add(kolumnaZNumeremPoziom2);
                        GridViewBandColumn kolumnaZNumeremPoziom4 = new GridViewBandColumn();
                        kolumnaZNumeremPoziom3.Columns.Add(kolumnaZNumeremPoziom3);
                        kolumnaZNumerem.Columns.Add(kolumnaZNumeremPoziom4);
                    }
                    break;
                case 6:
                    {
                        GridViewBandColumn kolumnaZNumeremPoziom1 = new GridViewBandColumn();
                        kolumnaZNumeremPoziom1.Columns.Add(kolumna_);
                        GridViewBandColumn kolumnaZNumeremPoziom2 = new GridViewBandColumn();
                        kolumnaZNumeremPoziom2.Columns.Add(kolumnaZNumeremPoziom1);
                        GridViewBandColumn kolumnaZNumeremPoziom3 = new GridViewBandColumn();
                        kolumnaZNumeremPoziom3.Columns.Add(kolumnaZNumeremPoziom2);
                        GridViewBandColumn kolumnaZNumeremPoziom4 = new GridViewBandColumn();
                        kolumnaZNumeremPoziom3.Columns.Add(kolumnaZNumeremPoziom3);
                        GridViewBandColumn kolumnaZNumeremPoziom5 = new GridViewBandColumn();
                        kolumnaZNumeremPoziom3.Columns.Add(kolumnaZNumeremPoziom5);
                        kolumnaZNumerem.Columns.Add(kolumnaZNumeremPoziom4);
                    }
                    break;
                default:
                    break;
            }
           
          //  kolumnaZNumerem.Columns.Add(kolumna_);
            return kolumnaZNumerem;
        }

        public class CustomTemplate : ITemplate
        {
            public string IdTabeli;
            public string IdKolumny;

            public void InstantiateIn(Control container)
            {
                GridViewDataItemTemplateContainer gcontainer = (GridViewDataItemTemplateContainer)container;
                if (IdKolumny.Contains("d_"))
                {
                    try
                    {
                        string kolumna = IdKolumny.Replace("d_", "");
                        Label lB1 = new Label();
                        int kolumnaNum = int.Parse(kolumna);
                        string funkcjaJavascript = "javascript:openPopup('popup.aspx?sesja=" + gcontainer.KeyValue + "!" + IdTabeli + "!" + kolumnaNum.ToString() + "!6')";
                        lB1.Text = " <a href = " + funkcjaJavascript + ">" + DataBinder.Eval(gcontainer.DataItem, IdKolumny) + "</a>";
                        gcontainer.Controls.Add(lB1);
                    }
                    catch
                    { }
                }
                else
                {
                    Label lB1 = new Label { Text = DataBinder.Eval(gcontainer.DataItem, IdKolumny).ToString() };
                    gcontainer.Controls.Add(lB1);
                }
            }
        }
    } // end of class
}