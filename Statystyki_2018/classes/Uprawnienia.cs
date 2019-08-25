using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace stat2018
{
  
    public class Uprawnienia 
    {
        private common cm = new common();
        public enum Rodzaje
        {
            admin = 0,// (możliwość nadawania uprawnień)
            miesięczne = 1,
            kontrolki = 2,
            MSS = 3,
            kof = 4,
            wyszukiwarka = 5,
            pracownik = 6,
            potwierdzenie = 1
        }

        public bool Administrator(int UserId)
        {
            bool result = false;
            string answer =cm. getQuerryValue("SELECT  admin FROM  uzytkownik where ident=" + UserId.ToString(), cm.con_str, cm.makeParameterTable());
            if (answer == "1") result = true;
            return result;
        }
        public bool Miesieczne(int UserId)
        {
            return zapytanie( Rodzaje.miesięczne,  UserId);
        }
        public bool Kontrolki(int UserId)
        {
            return zapytanie(Rodzaje.kontrolki , UserId);
        }
        public bool MSS(int UserId)
        {
            return zapytanie(Rodzaje.MSS, UserId);
        }
        public bool Kof(int UserId)
        {
            return zapytanie(Rodzaje.kof, UserId);
        }
        public bool wyszukiwarka(int UserId)
        {
            return zapytanie(Rodzaje.wyszukiwarka, UserId);
        }
        public bool pracownik(int UserId)
        {
            return zapytanie(Rodzaje.pracownik, UserId);
        }

        private bool zapytanie(Enum rodzaj, int UserId)
        {
            bool result = false;
            System.Data.DataTable parametry = cm.makeParameterTable();
            parametry.Rows.Add("@id_uzytkownika", UserId);
            parametry.Rows.Add("@rodzaj", rodzaj);
            string answer = cm.getQuerryValue("SELECT count(*) FROM  uprawnienia where rodzaj=@rodzaj and  id_uzytkownika=@id_uzytkownika" , cm.con_str, cm. makeParameterTable());
            if (answer == "1") result = true;
            return result;

        }
    }
}