<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="mss19r.aspx.cs" Inherits="stat2018.mss19r" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        #menu {
            position: relative;
        }

            #menu.scrolling {
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
            }
    </style>

    <script src="Scripts/rls.js"></script>

    <div class="noprint">
        <div id="menu" style="background-color: #f7f7f7; z-index: 9999">
            <div class="manu_back" style="height: 43px; margin: 0 auto 0 auto; position: relative; width: 1150px; left: 0px;">

                <table class="tbl_manu">

                    <tr>
                        <td style="width: 90px;">
                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                            <asp:Label ID="Label4" runat="server" Text="Zakres:"></asp:Label>
                        </td>
                        <td style="width: 80px;">

                            <dx:ASPxDateEdit ID="Date1" runat="server" Theme="Moderno" Height="20px">
                            </dx:ASPxDateEdit>
                        </td>
                        <td style="width: 80px;">
                            <dx:ASPxDateEdit ID="Date2" runat="server" Theme="Moderno" AutoResizeWithContainer="True" Height="20px">
                            </dx:ASPxDateEdit>
                        </td>
                        <td style="width: 100px">
                            <asp:LinkButton ID="LinkButton54" runat="server" class="ax_box" OnClick="LinkButton54_Click">  Odśwież</asp:LinkButton>
                        </td>

                        <td>Id. raportu</td>
                        <td>

                            <asp:TextBox ID="idRaportu" runat="server"></asp:TextBox>
                        </td>
                        <td>Id. Sądu</td>
                        <td>

                            <asp:TextBox ID="idSad" runat="server"></asp:TextBox>
                        </td>
                        <td>
                          
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>

    <div style="width: 1150px; margin: 0 auto 0 auto; position: relative;" class="content">

        <div id="tabela1" style="z-index: 10; visibility: hidden;">
            <div style="margin-left: auto; margin-right: auto; text-align: center; width: auto;">
                <asp:Label ID="Label6" runat="server" Text="Sąd " Style="font-weight: 700"></asp:Label>
                <br />
            </div>
            <div style="margin-left: auto; margin-right: auto; text-align: center; width: auto;">
                <asp:Label runat="server" ID="Label9" Visible="False"></asp:Label>
            </div>
        </div>

        <div id="Div2" style="z-index: 10;">
            <div style="margin-left: auto; margin-right: auto; text-align: center; width: auto;">
                <asp:Label runat="server" ID="id_dzialu" Visible="False"></asp:Label>
            </div>

            <br />
            <table width="100%" border="1" bordercolor="#000000" cellpadding="5" cellspacing="0" style="page-break-before: always">
                <col width="209">
                <col width="191">
                <col width="290">
                <col width="338">
                <tr>
                    <td colspan="4" width="1057" valign="TOP">
                        <p class="western">
                            <font face="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 11pt">Ministerstwo
			Sprawiedliwości, Al. Ujazdowskie 11, 00-950 Warszawa </FONT></font>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" width="410" height="38" valign="TOP">
                        <p class="western">
                            <font face="Times New Roman, serif"><FONT SIZE=3><FONT FACE="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">Sąd:
			1. Rejonowy*</FONT></FONT><SUP><FONT FACE="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">)</FONT></FONT></SUP></FONT></font>
                        </p>
                        <p class="western">
                            <font face="Times New Roman, serif"><FONT SIZE=3><FONT FACE="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">2.
			Okręgowy*</FONT></FONT><SUP><FONT FACE="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">)</FONT></FONT></SUP></FONT></font>
                        </p>
                        </P>
			<p class="western">
                <font face="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">w
			.......................................................</FONT></font>
            </p>
                    </td>
                    <td rowspan="3" width="290">
                        <h2 class="auto-style2 center">MS-S19R</h2>
                        <p class="western" align="CENTER"><font face="Arial, sans-serif"><FONT SIZE=3><B>SPRAWOZDANIE</B></FONT></font></p>
                        <p class="western" align="CENTER">
                            <font face="Arial, sans-serif"><FONT SIZE=3><B>w
			sprawach </B></FONT></font><FONT SIZE=3 face="Arial, sans-serif"><B>gospodarczych </B></FONT>
                        </p>
                    </td>
                    <td rowspan="2" width="338">
                        <p class="western"><font face="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">Adresaci:</FONT></font></p>
                        <ol>
                            <li>
                                <p class="western">
                                    <font face="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">Sąd
				Okręgowy</FONT></font>
                                </p>
                                <li>
                                    <p class="western">
                                        <font face="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">Ministerstwo
				Sprawiedliwości</FONT></font>
                                    </p>
                        </ol>
                        <p class="western" style="margin-left: 0.64cm; text-indent: 0.66cm">
                            <font face="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">Departament
			Strategii i Funduszy Europejskich</FONT></font>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" width="410" height="2" valign="TOP">
                        <p class="western">
                            <font face="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">Okręg
			Sądu   </FONT></font>
                        </p>
                    </td>
                </tr>
                <tr valign="TOP">
                    <td rowspan="2" width="209" height="14">
                        <p class="western"><font face="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">Okręgowego</FONT></font></p>
                        </P>
			<p class="western">
                <font face="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">w
			.................................</FONT></font>
            </p>
                    </td>
                    <td rowspan="2" width="191">
                        <p class="western"><font face="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">Apelacyjnego</FONT></font></p>
                        </P>
			<p class="western">
                <font face="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">w
			.....................................</FONT></font>
            </p>
                    </td>
                    <td rowspan="3" width="338">
                        <p class="western" style="margin-left: 0.15cm; margin-right: 0.15cm; margin-top: 0.01cm; margin-bottom: 0.01cm">
                            <font face="Times New Roman, serif"><FONT SIZE=3><FONT FACE="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">Termin
			przekazania: </FONT></FONT></FONT></font>
                        </p>
                        <p class="western" style="margin-left: 0.42cm; margin-top: 0.07cm">
                            <font face="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">zgodnie
			z PBSSP 2019 r.</FONT></font>
                        </p>
                    </td>
                </tr>
            </table>

            <br />

            <asp:Label ID="kod011" runat="server"></asp:Label>
            <br />
            <br />

            <asp:PlaceHolder runat="server" ID="tablePlaceHolder"></asp:PlaceHolder>

            <br />
             <div id='Sprawy mediacyjne' class="page-break" >
 <br/>
 <strong> Dział 1.1.1 Sprawy mediacyjne</strong> 
    <table  style="width: 100%; ">
 <tr>    <td  class="center borderAll" colspan="5"> Sądowe </td>    <td class="center borderAll"> Liczba</td>
     <td class="center borderAll" colspan="2"> Pozasądowe </td>
<td class="col_60 borderAll center">Liczba</td>
</tr>
 <tr>    <td  class="center borderAll" colspan="5">0</td>    <td class="col_60 borderAll center">1</td>
     <td class="center borderAll" colspan="2">&nbsp;</td>
<td class="col_60 borderAll center">2</td>
</tr>
  <tr>
    <td  class="borderAll wciecie" rowspan="5">wpływ</td>
    <td  class="borderAll wciecie" rowspan="5">Liczba</td>
    <td  class="borderAll wciecie" rowspan="3">spraw w których</td>
    <td  class="borderAll  wciecie">przeprowadzono spotkanie informacyjne (art. 183 8 § 4 kpc)</td>
  <td  class="borderAll col_36">1</td>
    <td  class="col_60 borderAll center"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1!1!4')"><asp:Label CssClass="normal" ID="tab_111_w01_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="wciecie  borderAll ">Liczba wniosków o zatwierdzenie ugody złożonych przez stronę </td>
    <td  class="col_36 center borderAll ">14</td>
    <td  class="col_60 borderAll center"><a href="javascript:openPopup('popup.aspx?sesja=14!1.1.1!1!4')"><asp:Label CssClass="normal" ID="tab_111_w14_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll  wciecie">strony skierowano do mediacji po udziale w spotkaniu informacyjnym </td>
  <td  class="borderAll col_36">2</td>
    <td  class="col_60 borderAll center"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.1!1!4')"><asp:Label CssClass="normal" ID="tab_111_w02_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="wciecie  borderAll ">Liczba protokołów złożonych przez mediatorów po podjęciu mediacji przez strony, zawierających ugody (art. 183 13 § 1 kpc) </td>
    <td  class="col_36 center borderAll ">15</td>
    <td  class="col_60 borderAll center"><a href="javascript:openPopup('popup.aspx?sesja=15!1.1.1!1!4')"><asp:Label CssClass="normal" ID="tab_111_w15_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll  wciecie">strony skierowano do mediacji na podstawie postanowienia sądu (art. 183 8 § 1 kpc) </td>
  <td  class="borderAll col_36">3</td>
    <td  class="col_60 borderAll center"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.1!1!4')"><asp:Label CssClass="normal" ID="tab_111_w03_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">mediacji ogółem (w jednej sprawie może być więcej niż jedna mediacja) </td>
  <td  class="borderAll col_36">4</td>
    <td  class="col_60 borderAll center"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.1!1!4')"><asp:Label CssClass="normal" ID="tab_111_w04_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">protokołów złożonych przez mediatorów po podjęciu mediacji przez strony (art. 183 13 § 2 kpc) </td>
  <td  class="borderAll col_36">5</td>
    <td  class="col_60 borderAll center"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.1!1!4')"><asp:Label CssClass="normal" ID="tab_111_w05_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" rowspan="8">Rozstrzy¬gnięcie przed</td>
    <td  class="borderAll wciecie" rowspan="3">mediatorem</td>
    <td  class="borderAll wciecie" rowspan="3">w sprawach skierowanych w trybie (art. 183 8 § 1 kpc) - liczba </td>
    <td  class="borderAll  wciecie">ugód zawartych przed mediatorem </td>
  <td  class="borderAll col_36">6</td>
    <td  class="col_60 borderAll center"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.1!1!4')"><asp:Label CssClass="normal" ID="tab_111_w06_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll  wciecie">spraw, w których nie zawarto ugody przed mediatorem </td>
  <td  class="borderAll col_36">7</td>
    <td  class="col_60 borderAll center"><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.1!1!4')"><asp:Label CssClass="normal" ID="tab_111_w07_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll  wciecie">spraw, w których postępowanie mediacyjne przed mediatorem zakończyło się w inny sposób niż wykazany w w . 06 i 07 </td>
  <td  class="borderAll col_36">8</td>
    <td  class="col_60 borderAll center"><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.1!1!4')"><asp:Label CssClass="normal" ID="tab_111_w08_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" rowspan="5">sądem</td>
    <td  class="borderAll wciecie" colspan="2">zatwierdzono ugodę (liczba spraw w których sąd zatwierdził ugodę lecz nie umorzył postępowania) </td>
  <td  class="borderAll col_36">9</td>
    <td  class="col_60 borderAll center"><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.1!1!4')"><asp:Label CssClass="normal" ID="tab_111_w09_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="wciecie center borderAll ">Zatwierdzono ugodę </td>
    <td  class=" center borderAll ">16</td>
    <td  class="col_60 borderAll center"><a href="javascript:openPopup('popup.aspx?sesja=16!1.1.1!1!4')"><asp:Label CssClass="normal" ID="tab_111_w16_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">w tym nadano klauzulę wykonalności w trybie art. 18314§2 kpc </td>
  <td  class="borderAll col_36">10</td>
    <td  class="col_60 borderAll center"><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.1!1!4')"><asp:Label CssClass="normal" ID="tab_111_w10_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="wciecie center borderAll ">Nadano klauzulę wykonalności (art. 183 14 § 2 kpc) </td>
    <td  class=" center borderAll ">17</td>
    <td  class="col_60 borderAll center"><a href="javascript:openPopup('popup.aspx?sesja=17!1.1.1!1!4')"><asp:Label CssClass="normal" ID="tab_111_w17_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">zatwierdzono ugodę i umorzono postępowanie (art. 183 14 § 1 i 2 kpc) </td>
  <td  class="borderAll col_36">11</td>
    <td  class="col_60 borderAll center"><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.1!1!4')"><asp:Label CssClass="normal" ID="tab_111_w11_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="wciecie center borderAll ">Odmówiono zatwierdzenia ugody w trybie (art. 18314 § 3 kpc) </td>
    <td  class=" center borderAll ">18</td>
    <td  class="col_60 borderAll center"><a href="javascript:openPopup('popup.aspx?sesja=18!1.1.1!1!4')"><asp:Label CssClass="normal" ID="tab_111_w18_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">w tym nadano klauzulę wykonalności w trybie art. 18314§2 kpc </td>
  <td  class="borderAll col_36">12</td>
    <td  class="col_60 borderAll center"><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.1!1!4')"><asp:Label CssClass="normal" ID="tab_111_w12_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">odmówiono zatwierdzenia ugody w trybie (art. 18314 § 3 kpc) </td>
  <td  class="borderAll col_36">13</td>
    <td  class="col_60 borderAll center"><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.1!1!4')"><asp:Label CssClass="normal" ID="tab_111_w13_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
    </table>
 </div>

            <br />

            <asp:PlaceHolder runat="server" ID="tablePlaceHolder1"></asp:PlaceHolder>

            <br />
        </div>
            <br />

              <div id='Terminowość sporządzania tłumaczeń pisemnych' class="page-break" >
               <asp:PlaceHolder runat="server" ID="PlaceHolder1"></asp:PlaceHolder>

 <br/>
 <strong> Dział 7.2</strong> Terminowość sporządzania tłumaczeń pisemnych&nbsp;
    <table  style="width: 100%; ">
 <tr>    <td class="center borderAll" colspan="8"> Liczba sporządzonych tłumaczeń pisemnych</td>
</tr>
 <tr>    <td class="center borderAll" rowspan="2"> razem
     <br />
     (kol.1= 2 do 5 = 6 do 8)</td>
<td class="center borderAll" rowspan="2">w ustalonym terminie</td>
<td class="center borderAll" colspan="3">po ustalonym terminie</td>
<td class="center borderAll" colspan="3">wg czasu wydania tłumaczenia</td>
</tr>
 <tr>    
<td class="center borderAll">do 30 dni</td>
<td class="center borderAll">pow. 1 do 3 miesięcy</td>
<td class="center borderAll">pow. 3 miesięcy</td>
<td class="center borderAll">do 30 dni</td>
<td class="center borderAll">pow. 1 do 3 miesięcy</td>
<td class="center borderAll">pow. 3 miesięcy</td>
</tr>
 <tr>    <td class="center borderAll">1</td>
<td class="center borderAll">2</td>
<td class="center borderAll">3</td>
<td class="center borderAll">4</td>
<td class="center borderAll">5</td>
<td class="center borderAll">6</td>
<td class="center borderAll">7</td>
<td class="center borderAll">8</td>
</tr>
  <tr>
    <td  class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.2!1!4')"><asp:Label CssClass="normal" ID="tab_7_2_w01_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.2!2!4')"><asp:Label CssClass="normal" ID="tab_7_2_w01_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.2!3!4')"><asp:Label CssClass="normal" ID="tab_7_2_w01_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.2!4!4')"><asp:Label CssClass="normal" ID="tab_7_2_w01_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.2!5!4')"><asp:Label CssClass="normal" ID="tab_7_2_w01_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.2!6!4')"><asp:Label CssClass="normal" ID="tab_7_2_w01_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.2!7!4')"><asp:Label CssClass="normal" ID="tab_7_2_w01_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.2!8!4')"><asp:Label CssClass="normal" ID="tab_7_2_w01_c08" runat="server" Text="0"></asp:Label></a></td>
  </tr>
    </table>
 </div>

            <br />

<div id='Terminowość przyznawania wynagrodzeń za sporządzenie tłumaczeń pisemnych i ustnych oraz za stawiennictwo' class="page-break" >
 <br/>
 <strong> Dział 7.3 </strong>Terminowość przyznawania wynagrodzeń za sporządzenie tłumaczeń pisemnych i ustnych oraz za stawiennictwo&nbsp;
    <table  style="width: 100%; ">
 <tr>    <td class="center borderAll" colspan="4"> Postanowienia o przyznaniu wynagrodzenia wg czasu od złożenia rachunku</td>
<td class="center borderAll" colspan="4">Skierowanie rachunku do oddziału finansowego wg czasu od postanowienia o przyznaniu wynagrodzenia</td>
</tr>
 <tr>    <td class="center borderAll"> razem (kol.2-4)</td>
<td class="center borderAll">do 14 dni</td>
<td class="center borderAll">pow. 14 do 30 dni</td>
<td class="center borderAll">powyżej miesiąca</td>
<td class="center borderAll">razem (kol. 6-8)</td>
<td class="center borderAll">do 14 dni</td>
<td class="center borderAll">pow.14 do 30 dni</td>
<td class="center borderAll">powyżej miesiąca </td>
</tr>
 <tr>    <td class="center borderAll">1</td>
<td class="center borderAll">2</td>
<td class="center borderAll">3</td>
<td class="center borderAll">4</td>
<td class="center borderAll">5</td>
<td class="center borderAll">6</td>
<td class="center borderAll">7</td>
<td class="center borderAll">8</td>
</tr>
  <tr>
    <td  class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.3!1!4')"><asp:Label CssClass="normal" ID="tab_7_3_w01_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.3!2!4')"><asp:Label CssClass="normal" ID="tab_7_3_w01_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.3!3!4')"><asp:Label CssClass="normal" ID="tab_7_3_w01_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.3!4!4')"><asp:Label CssClass="normal" ID="tab_7_3_w01_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.3!5!4')"><asp:Label CssClass="normal" ID="tab_7_3_w01_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.3!6!4')"><asp:Label CssClass="normal" ID="tab_7_3_w01_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.3!7!4')"><asp:Label CssClass="normal" ID="tab_7_3_w01_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7.3!8!4')"><asp:Label CssClass="normal" ID="tab_7_3_w01_c08" runat="server" Text="0"></asp:Label></a></td>
  </tr>
    </table>
 </div>
               <br />
 &nbsp;<div class="page-break">
                <strong>Dział 8 </strong>Obciążenia administracyjne respondentów

                 <br />
                <br />
                Proszę podać czas (w minutach) przeznaczony na:<br />
                <br />

                <table style="width: 100%;">
                    <tr>
                        <td class="col_100">&nbsp;</td>
                        <td>przygotowanie danych dla potrzeb wypełnianego formularza</td>
                        <td class="borderAll col_100">
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>wypełnienie formularza</td>
                        <td class="borderAll col_100">
                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </table>

                <br />
            </div>

                <table style="width: 100%;">
                    <tr>
                        <td class="col_100">&nbsp;</td>
                        <td>Wyjaśnienia dotyczące sprawozdania można uzyskać pod numerem telefonu </td>
                        <td class=" col_180">
                            .......................................................</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    </table>

            <br />
           
            <br />

        <div id="debag">
                <br />
                Raport statystyczny
                    <asp:Label ID="Label27" runat="server"></asp:Label>
                &nbsp;Sporzadzony dn.
            <asp:Label ID="Label29" runat="server"></asp:Label>&nbsp;przez&nbsp;
&nbsp;&nbsp;
            <asp:Label ID="Label28" runat="server"></asp:Label>
                &nbsp;<asp:Label ID="Label30" runat="server"></asp:Label>
                <br />

                <asp:Label ID="Label11" runat="server"></asp:Label>
        </div>

        <br />
    </div>
</asp:Content>