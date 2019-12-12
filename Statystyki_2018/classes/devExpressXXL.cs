﻿using DevExpress.Data;
using DevExpress.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace stat2018
{
    public class devExpressXXL
    {

        public GridViewBandColumn podKolumna(string[] teksty, int przesunieciedanych, string idTabeli, bool isFixet, int szerokoscKolumn, string tekstGlowny)
        {
            GridViewBandColumn result = GetBoundColumn(tekstGlowny);

            for (int i = 0; i < teksty.Length; i++)
            {
                result.Columns.Add(kolumnaDoTabeli(teksty[i], "d_" + (i + przesunieciedanych).ToString("D2"), idTabeli, "", isFixet, szerokoscKolumn));
            }

            return result;
        }
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
        public ASPxSummaryItem komorkaSumujaca(string text)
        {
            string idPola = "Imienazwisko";
            ASPxSummaryItem _komorkaSumujaca = new ASPxSummaryItem()
            {
                FieldName = idPola,
                ShowInColumn = idPola,


                SummaryType = SummaryItemType.Count,

                DisplayFormat = text
            };
            return _komorkaSumujaca;
        }

        public ASPxSummaryItem komorkaSumujaca(string text,string nazwaPola)
        {
            string idPola = nazwaPola;
            ASPxSummaryItem _komorkaSumujaca = new ASPxSummaryItem()
            {
                FieldName = idPola,
                ShowInColumn = idPola,


                SummaryType = SummaryItemType.Count,

                DisplayFormat = text
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
/*
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
        }*/

        public GridViewDataTextColumn kolumnaDoTabeli(string Napis, string poleDanych, string identyfikatorTabeli, string styl, bool isFixed, int szerokoscKolumny)
        {
            GridViewDataTextColumn kolumna_ = new GridViewDataTextColumn
            {
                Caption = Napis,
                FieldName = poleDanych,
                Width = szerokoscKolumny,
                DataItemTemplate = new CustomTemplate { IdKolumny = poleDanych, IdTabeli = identyfikatorTabeli }
            };
            kolumna_.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
            kolumna_.CellStyle.Wrap = DevExpress.Utils.DefaultBoolean.True;
            kolumna_.CellStyle.CssClass = "normal center " + styl;
            kolumna_.HeaderStyle.CssClass = styl;
            kolumna_.HeaderStyle.Wrap = DevExpress.Utils.DefaultBoolean.True;
            if (isFixed)
            {
                kolumna_.FixedStyle = GridViewColumnFixedStyle.Left;
            }
            return kolumna_;
        }
        // parts
        public GridViewBandColumn SekcjaDwiePodKolumny(string[] teksty, string Opis, int przesuniecie, string idTabeli, int szerokoscKolumny)
        {
            GridViewBandColumn kolumnaWyjsciowa = GetBoundColumn(Opis);
            foreach (var item in teksty)
            {
                kolumnaWyjsciowa.Columns.Add(podKolumna(new string[] { "na rozprawe", "na posie- dzenie" }, przesuniecie, idTabeli, false, szerokoscKolumny, item.ToString()));
                przesuniecie = przesuniecie + 2;
            }
            return kolumnaWyjsciowa;
        }

        //private class
        private class CustomTemplate : ITemplate
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