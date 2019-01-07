using System;
using DevExpress.Web;
using System.IO;
using DevExpress.XtraPrinting;
using System.Web;
using System.Net.Mime;
using System.Drawing;

namespace stat2018
{


    public partial class kontrolkaDruk : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public wyszukiwarka w1 = new wyszukiwarka();
        public common cm = new common();

        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {

                using (MemoryStream ms = new MemoryStream())
                {
                    PrintableComponentLink pcl = new PrintableComponentLink(new PrintingSystem());


                    pcl.Component = (ASPxGridViewExporter)Session["exporter"];
                    ASPxGridViewExporter1.FileName = "Kontrolka.pdf";
                    Font newfont = new Font(FontFamily.GenericSerif, 12, FontStyle.Bold | FontStyle.Underline);


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


            }
            catch (Exception ex)
            {
                // cm.log.Error("Kontrolka : generowanie pdf :" + ex.Message);

            }
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


    }
}