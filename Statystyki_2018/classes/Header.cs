using System;
using System.Data;


namespace stat2018
{
    public class Header
    {

        public common cm = new common();

        public DevExpress.Web.MenuItem daneDoManuKontrolek(string identyfikatorUzytkownika)
        {
            //cm.log.Info("Header: Rozpoczęcie procedury tworzenia elementów meny kontrolek");
            DevExpress.Web.MenuItem mm1 = new DevExpress.Web.MenuItem("Kontrolka");
   
            //czy admin
            //cm.log.Info("Header: Rozpoczęcie procedury tworzenia elementów menu kontrolka");

            DataTable parametry = cm.makeParameterTable();
            parametry.Rows.Add("@identyfikatorUzytkownika", identyfikatorUzytkownika);
            string kwerenda = string.Empty;
            // czy admin
            if (cm.getQuerryValue("select admin from uzytkownik where ident =@identyfikatorUzytkownika", cm.con_str, parametry) == "1")
            {
                kwerenda = "SELECT ident, opis, wartosc FROM konfig  WHERE(klucz = 'kontrolka')";               // admin 
            }
            else
            {
                kwerenda = "SELECT DISTINCT konfig.ident, konfig.opis, konfig.wartosc, konfig.klucz FROM uprawnienia INNER JOIN konfig ON uprawnienia.id_wydzialu - 100 = konfig.ident WHERE        (uprawnienia.id_uzytkownika = @identyfikatorUzytkownika) AND (uprawnienia.id_wydzialu > 100) AND (uprawnienia.id_wydzialu < 200) AND (rtrim(konfig.klucz) = 'kontrolka')";
             //   kwerenda = "SELECT ident, opis, wartosc FROM konfig  WHERE(klucz = 'kontrolka')";               // normalny użytkownik
            }
            DataTable dTable = cm.getDataTable(kwerenda, cm.con_str, parametry);
            foreach (DataRow dRow in dTable.Rows)
            {
                DevExpress.Web.MenuItem mm2 = new DevExpress.Web.MenuItem(dRow[1].ToString().Trim(), dRow[0].ToString().Trim(), "", "kontrolka.aspx?id=" + dRow[0].ToString().Trim( ),"_self");
                //mm2.ItemStyle.Width = 300;
                mm2.ItemStyle.Paddings.PaddingLeft = 30;
                mm1.Items.Add(mm2);

            }
       
            //cm.log.Info("Header: zakonczenie procedury tworzenia elementów meny kontrolek");

            return mm1;
        }

        public DevExpress.Web.MenuItem daneDoManuMiesieczne(string identyfikatorUzytkownika)
        {
            //czy admin
            //cm.log.Info("Header: Rozpoczęcie procedury tworzenia elementów menu statystyk miesięcznych dla użytkownika: " + identyfikatorUzytkownika);

            DevExpress.Web.MenuItem item = new DevExpress.Web.MenuItem("Statystyka");

            string admin = string.Empty;
            DataTable parametry = cm.makeParameterTable();
            parametry.Rows.Add("@identyfikatorUzytkownika", identyfikatorUzytkownika);
            //cm.log.Info("Header: Sprawdz czy użytkownik " + identyfikatorUzytkownika + " ma parawa administratora" );

            try
            {
               
                admin = cm.getQuerryValue("select admin from uzytkownik where ident =@identyfikatorUzytkownika", cm.con_str, parametry);
                //cm.log.Info("Header: Użytkownik ma prawa administracyjne");

            }
            catch
            {
                admin = "0";
                //cm.log.Info("Header: Użytkownik nie ma praw administracyjnych");
            }
            string kwerenda = string.Empty;

            if (admin == "1")
            {
                // admin
                kwerenda = "SELECT ident,nazwa,plik  FROM wydzialy ";
            }
            else
            {
                // normalny użytkownik
                kwerenda = "SELECT DISTINCT uprawnienia.id_wydzialu, wydzialy.nazwa, wydzialy.plik FROM uprawnienia LEFT OUTER JOIN  wydzialy ON uprawnienia.id_wydzialu = wydzialy.ident WHERE(uprawnienia.id_uzytkownika = @identyfikatorUzytkownika) AND(uprawnienia.id_wydzialu < 100) and rtrim(wydzialy.plik)<>''";
                //kwerenda = "SELECT distinct uprawnienia.id_wydzialu, wydzialy.nazwa, wydzialy.plik FROM uprawnienia RIGHT OUTER JOIN   wydzialy ON uprawnienia.id_wydzialu = wydzialy.ident   where uprawnienia.id_uzytkownika = @identyfikatorUzytkownika";
            }
            //cm.log.Info("Header: odczyt działów przypisanych do uzytkownika id= "+ identyfikatorUzytkownika);
            DataTable dTable = cm.getDataTable(kwerenda, cm.con_str, parametry);
            //cm.log.Info("Header: Uzytkownika id= " + identyfikatorUzytkownika+ " ma prawa do "+dTable.Rows.Count.ToString () +" wydziałów");

            foreach (DataRow dRow in dTable.Rows)
            {
                DevExpress.Web.MenuItem mm2 = new DevExpress.Web.MenuItem  ( dRow[1].ToString().Trim(), dRow[0].ToString().Trim(), "", dRow[2].ToString().Trim()+"?w=" + dRow[0].ToString().Trim(), "_self");
                //mm2.ItemStyle.Width = 300;
                mm2.ItemStyle.Paddings.PaddingLeft = 30;
                item.Items.Add(mm2);
                //cm.log.Info("Header: dodano wydzial " + dRow[1].ToString().Trim() + " do menu ");

            }
            return item;

        }

        public DevExpress.Web.MenuItem daneDoManuMSS(string identyfikatorUzytkownika)
        {
            //czy admin
            //cm.log.Info("Header: Rozpoczęcie procedury tworzenia elementów menu statystyk MS-S");

            DevExpress.Web.MenuItem item = new DevExpress.Web.MenuItem("MS-S");

            DataTable parametry = cm.makeParameterTable();
            parametry.Rows.Add("@identyfikatorUzytkownika", identyfikatorUzytkownika);
            string kwerenda = string.Empty;
            // czy admin
            if (cm.getQuerryValue("select admin from uzytkownik where ident =@identyfikatorUzytkownika", cm.con_str, parametry) == "1")
            {
                kwerenda = "SELECT ident ,nazwa ,plik FROM wydzialy_mss";                                 // admin
            }
            else
            {
                
                kwerenda = "SELECT DISTINCT wydzialy_mss.ident as id_wydzialu, wydzialy_mss.nazwa, wydzialy_mss.plik FROM  uprawnienia LEFT OUTER JOIN wydzialy_mss ON uprawnienia.id_wydzialu = wydzialy_mss.ident + 200 WHERE        (uprawnienia.id_uzytkownika = @identyfikatorUzytkownika) AND (uprawnienia.id_wydzialu >= 200) AND (wydzialy_mss.ident IS NOT NULL)";
                //SELECT DISTINCT wydzialy_mss.ident as id_wydzialu, wydzialy_mss.nazwa, wydzialy_mss.plik FROM  uprawnienia LEFT OUTER JOIN wydzialy_mss ON uprawnienia.id_wydzialu = wydzialy_mss.ident + 200 WHERE        (uprawnienia.id_uzytkownika = 8) AND (uprawnienia.id_wydzialu >= 200) AND (wydzialy_mss.ident IS NOT NULL)

            }
            DataTable dTable = cm.getDataTable(kwerenda, cm.con_str, parametry);
            foreach (DataRow dRow in dTable.Rows)
            {
                DevExpress.Web.MenuItem mm2 = new DevExpress.Web.MenuItem(dRow[1].ToString().Trim(), dRow[0].ToString().Trim(), "", dRow[2].ToString().Trim() + "?w=" + dRow[0].ToString().Trim(), "_self");
                mm2.ItemStyle.Paddings.PaddingLeft = 30;
                item.Items.Add(mm2);

            }
            return item;

        }

        public DevExpress.Web.MenuItem daneDoManuInne(string identyfikatorUzytkownika)
        {
            //czy admin
            //cm.log.Info("Header: Rozpoczęcie procedury tworzenia elementów menu statystyk MS-S");

            DevExpress.Web.MenuItem mm1 = new DevExpress.Web.MenuItem("Inne");
            DevExpress.Web.MenuItem mm2 = new DevExpress.Web.MenuItem();

            mm2 = new DevExpress.Web.MenuItem("Ocena pracownika Nowa", "", "", "ocenaPracownika.aspx", "_self");
            mm2.ItemStyle.Width = 300;
            mm2.ItemStyle.Paddings.PaddingLeft = 30;
            mm1.Items.Add(mm2);

            mm2 = new DevExpress.Web.MenuItem("Kontrolka KOF", "", "", "kof.aspx", "_self");
            mm2.ItemStyle.Width = 300;
            mm2.ItemStyle.Paddings.PaddingLeft = 30;
            mm1.Items.Add(mm2);


            mm2 = new DevExpress.Web.MenuItem("Wyszukiwarka Spraw", "", "", "wyszukiwarkaSpraw.aspx", "_self");
            mm2.ItemStyle.Width = 300;
            mm2.ItemStyle.Paddings.PaddingLeft = 30;
            mm1.Items.Add(mm2);


            return mm1;

        }

        public DevExpress.Web.MenuItem wyloguj()
        {
            //czy admin
            //cm.log.Info("Header: Rozpoczęcie procedury tworzenia elementów menu wyloguj");

            DevExpress.Web.MenuItem mm1 = new DevExpress.Web.MenuItem("Wylogowanie");
            DevExpress.Web.MenuItem mm2 = new DevExpress.Web.MenuItem();

            mm2 = new DevExpress.Web.MenuItem("Wyloguj", "", "", "default.aspx?logout=true", "_self");
            mm2.ItemStyle.Width = 300;
            mm2.ItemStyle.Paddings.PaddingLeft = 30;

            mm1.Items.Add(mm2);
            return mm1;

        }
    }
}