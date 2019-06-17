<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="mss11o.aspx.cs" Inherits="stat2018.mss11o" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.15.0,  Culture=neutral,  PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

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
                            <asp:Button ID="Button1" runat="server" CssClass="ax_box" Text="Twórz plik csv" OnClick="makeCSVFile" />
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
                       
                       
                            <h2 class="center">MS-S11/12o</h2>
                            <p class="center">&nbsp;</p>
                        
                            <h3 class="center">SPRAWOZDANIE</h3>
                        
                            <h3 class="center">z zakresu prawa pracy i ubezpieczeń społecznych</h3>
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

              <div id='Terminowość sporządzania tłumaczeń pisemnych' class="page-break" >
               <asp:PlaceHolder runat="server" ID="tablePlaceHolder"></asp:PlaceHolder>

 <br/>
 <strong> Dział 10.2 Terminowość sporządzania tłumaczeń pisemnych</strong>&nbsp;
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
    <td  class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!10.2!1!4')"><asp:Label CssClass="normal" ID="tab_102_w01_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!10.2!2!4')"><asp:Label CssClass="normal" ID="tab_102_w01_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!10.2!3!4')"><asp:Label CssClass="normal" ID="tab_102_w01_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!10.2!4!4')"><asp:Label CssClass="normal" ID="tab_102_w01_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!10.2!5!4')"><asp:Label CssClass="normal" ID="tab_102_w01_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!10.2!6!4')"><asp:Label CssClass="normal" ID="tab_102_w01_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!10.2!7!4')"><asp:Label CssClass="normal" ID="tab_102_w01_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!10.2!8!4')"><asp:Label CssClass="normal" ID="tab_102_w01_c08" runat="server" Text="0"></asp:Label></a></td>
  </tr>
    </table>
 </div>

            <br />

<div id='Terminowość przyznawania wynagrodzeń za sporządzenie tłumaczeń pisemnych i ustnych oraz za stawiennictwo' class="page-break" >
 <br/>
 <strong> Dział 10.3 Terminowość przyznawania wynagrodzeń za sporządzenie tłumaczeń pisemnych i ustnych oraz za stawiennictwo</strong>&nbsp;
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
    <td  class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!10.3!1!4')"><asp:Label CssClass="normal" ID="tab_103_w01_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!10.3!2!4')"><asp:Label CssClass="normal" ID="tab_103_w01_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!10.3!3!4')"><asp:Label CssClass="normal" ID="tab_103_w01_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!10.3!4!4')"><asp:Label CssClass="normal" ID="tab_103_w01_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!10.3!5!4')"><asp:Label CssClass="normal" ID="tab_103_w01_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!10.3!6!4')"><asp:Label CssClass="normal" ID="tab_103_w01_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!10.3!7!4')"><asp:Label CssClass="normal" ID="tab_103_w01_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!10.3!8!4')"><asp:Label CssClass="normal" ID="tab_103_w01_c08" runat="server" Text="0"></asp:Label></a></td>
  </tr>
    </table>
 </div>
               <br />
 &nbsp;<div class="page-break">
                <strong>Dział 11 </strong>Obciążenia administracyjne respondentów

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
            </strong>
            <br />

            <br />
        </div>

   <div id="debag">

           
                <br />
                Raport statystyczny
                    <asp:Label ID="Label27" runat="server"></asp:Label>
                &nbsp;Sporzadzone dn.
            <asp:Label ID="Label29" runat="server"></asp:Label>&nbsp;przez&nbsp;
&nbsp;&nbsp;
            <asp:Label ID="Label28" runat="server"></asp:Label>
                &nbsp;<asp:Label ID="Label30" runat="server"></asp:Label>
                <br />

            </div>
    </div>
</asp:Content>