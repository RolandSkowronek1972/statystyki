using System.Data;
namespace stat2018.classes
{
    public class tabeleDoMSS
    {
        public int nrWiersza { get; set; }
        public int nrKolumny { get; set; }
        public int colspan { get; set; }
        public int rowspan { get; set; }
        public string style { get; set; }
        public string text { get; set; }
        public DataSet tabelka { get; set; } 
    }



     
}