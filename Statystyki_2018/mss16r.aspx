<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="mss16r.aspx.cs" Inherits="stat2018.mss16r" %>

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
       <div id="menu" style="background-color: #f7f7f7;z-index:9999">
        <div class="manu_back" style="height: 43px; margin: 0 auto 0 auto; position:relative;  width: 1150px;    left: 0px;">

         <table class="tbl_manu">

        <tr>
            <td style="width:90px;">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <asp:Label ID="Label4" runat="server" Text="Zakres:"></asp:Label>
                  </td>
              <td style="width:80px;">

                     <dx:aspxdateedit ID="Date1" runat="server" Theme="Moderno" Height="20px">
                </dx:aspxdateedit>
                </td>
              <td style="width:80px;">
                <dx:aspxdateedit ID="Date2" runat="server" Theme="Moderno" AutoResizeWithContainer="True" Height="20px">
                </dx:aspxdateedit>
            </td>
            <td style="width: 100px">
                <asp:LinkButton ID="LinkButton54" runat="server" class="ax_box" OnClick="LinkButton54_Click">  Odśwież</asp:LinkButton>
            </td>

            <td>

                Id. raportu</td>
            <td>

                <asp:TextBox ID="idRaportu" runat="server" ></asp:TextBox>
            </td>
            <td>

                Id. Sądu</td>
            <td>

                <asp:TextBox ID="idSad" runat="server" ></asp:TextBox>
            </td>
            <td>
                 <asp:Button ID="Button1" runat="server" CssClass="ax_box" Text="Twórz plik csv" OnClick="makeCSVFile" />
            </td>
        </tr>
    </table>
    </div>
           </div>
      </div>

   <div style="width:1150px; margin: 0 auto 0 auto; position:relative;" class="content">

          <div id="tabela1"  style="z-index:10; visibility:hidden;">
        <div style="margin-left:auto;margin-right:auto;text-align: center; width:auto; ">
            <asp:Label ID="Label6" runat="server" Text="Sąd " style="font-weight: 700"></asp:Label>
     <br />
         </div>
         <div style="margin-left:auto;margin-right:auto;text-align: center; width:auto; ">
             <asp:label runat="server" ID="Label9" Visible="False"></asp:label></div>
  &nbsp;<asp:SqlDataSource ID="SqlDataSource2" runat="server"
        ConnectionString="<%$ ConnectionStrings:wap %>"

        SelectCommand="SELECT DISTINCT id_, opis, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15,id_tabeli FROM tbl_statystyki_tbl_01 WHERE (id_dzialu = @id_dzialu) AND (id_tabeli = 1) ORDER BY id_">
        <SelectParameters>
            <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
        </SelectParameters>
             </asp:SqlDataSource>
     </div>

     <div id="Div2"  style="z-index:10; ">
         <div style="margin-left:auto;margin-right:auto;text-align: center; width:auto; ">
             <asp:label runat="server" ID="id_dzialu" Visible="False"></asp:label></div>

         <br />
         <TABLE WIDTH="100%" BORDER=1 BORDERCOLOR="#000000" CELLPADDING=5 CELLSPACING=0 STYLE="page-break-before: always">
	<COL WIDTH=209>
	<COL WIDTH=191>
	<COL WIDTH=290>
	<COL WIDTH=338>
	<TR>
		<TD COLSPAN=4 WIDTH=1057 VALIGN=TOP>
			<P CLASS="western"><FONT FACE="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 11pt">Ministerstwo
			Sprawiedliwości, Al. Ujazdowskie 11, 00-950 Warszawa </FONT></FONT>
			</P>
		</TD>
	</TR>
	<TR>
		<TD COLSPAN=2 WIDTH=410 HEIGHT=38 VALIGN=TOP>
			<P CLASS="western"><FONT FACE="Times New Roman, serif"><FONT SIZE=3><FONT FACE="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">Sąd:
			1. Rejonowy*</FONT></FONT><SUP><FONT FACE="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">)</FONT></FONT></SUP></FONT></FONT></P>
			<P CLASS="western">         <FONT FACE="Times New Roman, serif"><FONT SIZE=3><FONT FACE="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">2.
			Okręgowy*</FONT></FONT><SUP><FONT FACE="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">)</FONT></FONT></SUP></FONT></FONT></P>
			</P>
			<P CLASS="western"><FONT FACE="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">w
			.......................................................</FONT></FONT></P>
		</TD>
		<TD ROWSPAN=3 WIDTH=290>
			<H2 CLASS="auto-style2 center">MS-S16/18</H2>
			<P CLASS="western" ALIGN=CENTER><FONT FACE="Arial, sans-serif"><FONT SIZE=3><B>SPRAWOZDANIE</B></FONT></FONT></P>
			<P CLASS="western" ALIGN=CENTER><FONT FACE="Arial, sans-serif"><FONT SIZE=3><B>w
			sprawach rodzinnych i nieletnich </B></FONT></FONT>
			</P>
		</TD>
		<TD ROWSPAN=2 WIDTH=338>
			<P CLASS="western"><FONT FACE="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">Adresaci:</FONT></FONT></P>
			<OL>
				<LI><P CLASS="western"><FONT FACE="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">Sąd
				Okręgowy</FONT></FONT></P>
				<LI><P CLASS="western"><FONT FACE="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">Ministerstwo
				Sprawiedliwości</FONT></FONT></P>
			</OL>
			<P CLASS="western" STYLE="margin-left: 0.64cm; text-indent: 0.66cm">
			<FONT FACE="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">Departament
			Strategii i Funduszy Europejskich</FONT></FONT></P>
		</TD>
	</TR>
	<TR>
		<TD COLSPAN=2 WIDTH=410 HEIGHT=2 VALIGN=TOP>
			<P CLASS="western"><FONT FACE="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">Okręg
			Sądu   </FONT></FONT>
			</P>
		</TD>
	</TR>
	<TR VALIGN=TOP>
		<TD ROWSPAN=2 WIDTH=209 HEIGHT=14>
			<P CLASS="western"><FONT FACE="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">Okręgowego</FONT></FONT></P>
			</P>
			<P CLASS="western"><FONT FACE="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">w
			.................................</FONT></FONT></P>
		</TD>
		<TD ROWSPAN=2 WIDTH=191>
			<P CLASS="western"><FONT FACE="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">Apelacyjnego</FONT></FONT></P>
			</P>
			<P CLASS="western"><FONT FACE="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">w
			.....................................</FONT></FONT></P>
		</TD>
		<TD ROWSPAN=3 WIDTH=338>
			<P CLASS="western" STYLE="margin-left: 0.15cm; margin-right: 0.15cm; margin-top: 0.01cm; margin-bottom: 0.01cm">
			  <FONT FACE="Times New Roman, serif"><FONT SIZE=3><FONT FACE="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">Termin
			przekazania: </FONT></FONT></FONT></FONT>
			</P>
			<P CLASS="western" STYLE="margin-left: 0.42cm; margin-top: 0.07cm">
			<FONT FACE="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">zgodnie
			z PBSSP 2017 r.</FONT></FONT></P>
		</TD>
	</TR>
</TABLE>

         <br />
         <br />
     </div>
   <div id="zalatwienia"  class="page-break">
    <br />

         <asp:Label ID="tabela1Label" runat="server"></asp:Label>

       <br />
       <table  style="width:100%;">
           <tr>
               <td class="center" colspan="6" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666; border-width: thin thin 0px thin;">Liczba spraw, w których nastąpiło przekroczenie terminu 14 dni od dnia wpływu wniosku lub zawiadomienia o przyjęciu do szpitala psychiatrychnego</td>
           </tr>
           <tr>
               <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 191px;">Razem&nbsp; (kol. 2 fo 6)</td>
               <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 191px;">do 7 dni </td>
               <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 191px;">powyżej 7 do 14 dni</td>
               <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 191px;">powyżej 14 do 21 dni</td>
               <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 191px;">powyżej 21 do30 dni</td>
               <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666; width: 191px;">Ponad 30 dni</td>
           </tr>
           <tr>
               <td class="center mssGrayMiddle" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666; ">1</td>
               <td class="center mssGrayMiddle" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 191px;" >2</td>
               <td class="center mssGrayMiddle" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 191px;">3</td>
               <td class="center mssGrayMiddle" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 191px;" >4</td>
               <td class="center mssGrayMiddle" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 191px;" >5</td>
               <td class="center mssGrayMiddle" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666; border-width: thin thin 0px thin;" >6</td>
           </tr>
           <tr>
               <td class="center" style="border: thin solid #000000;" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.a.1!1!4')"><asp:Label CssClass="normal" ID="tab_111a1_w01_col01" runat="server" Text="0"></asp:Label></a></td>
               <td class="center" style="border: thin solid #000000;" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.a.1!2!4')"><asp:Label CssClass="normal" ID="tab_111a1_w01_col02" runat="server" Text="0"></asp:Label></a></td>
               <td class="center" style="border: thin solid #000000;" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.a.1!3!4')"><asp:Label CssClass="normal" ID="tab_111a1_w01_col03" runat="server" Text="0"></asp:Label></a></td>
               <td class="center" style="border: thin solid #000000;" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.a.1!4!4')"><asp:Label CssClass="normal" ID="tab_111a1_w01_col04" runat="server" Text="0"></asp:Label></a></td>
               <td class="center" style="border: thin solid #000000;" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.a.1!5!4')"><asp:Label CssClass="normal" ID="tab_111a1_w01_col05" runat="server" Text="0"></asp:Label></a></td>
               <td class="center" style="border: thin solid #000000;" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.a.1!6!4')"><asp:Label CssClass="normal" ID="tab_111a1_w01_col06" runat="server" Text="0"></asp:Label></a></td>
           </tr>
           </table>
       <br />
    <br />
       </div>
    <div id="wyznaczenia"  class="page-break">
        <table style="width:100%;" >
            <tr>
                <td style="width: 1000px">

                    <strong>Dział 1.1.1.a.2.</strong> Liczba spraw o umieszczenie w szpitalu psychiatrycznym bez zgody, w których wydano zarządzenie o doprowadzeniu osoby pozostającej w szpitalu, a której postępowanie bezpośrednio dotyczy na rozprawę, stosownie do możliwości przewidzianej w przepisie art. 46 ust. 1a ustawy z dnia 19 sierpnia 1994 r. o ochronie zdrowia psychicznego (Dz. U. z 2017 r., poz. 882)
                </td>
                 <td valign="top" class="center">
                    <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.a.2!1!4')"> <asp:TextBox ID="tab_111a2_w01_col01" runat="server" ReadOnly="True" CssClass="col_155"></asp:TextBox></a>
                </td>
            </tr>
        </table>
        <br />
        <table style="width:100%;" >
            <tr>
                <td style="width: 1000px">

                    <strong>Dział 1.1.1.b.</strong> w tym (dz. 1.1.1. w. 47 lit. b) orzeczono przysposobienie, na które rodzice wcześniej wyrazili zgodę</td>
                 <td valign="top" class="center">
                    <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.b!1!4')"> <asp:TextBox ID="tab_111b_w01_col01" runat="server" ReadOnly="True" CssClass="col_155"></asp:TextBox></a>
                </td>
            </tr>
        </table>
        <br />
        <table style="width:100%;" >
            <tr>
                <td style="width: 1000px">

                    <strong>Dział 1.1.1.c</strong>. w tym (dz. 1.1.1. w. 47 lit. c) przez osoby zamieszkałe za granicą</td>
                 <td valign="top" class="center">
                    <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.c!1!4')"> <asp:TextBox ID="tab_111c_w01_col01" runat="server" ReadOnly="True" CssClass="col_155"></asp:TextBox></a>
                </td>
            </tr>
        </table>
        <br />

                    <strong>Dział 1.1.1.d</strong>. Przysposobienie według wieku małoletnich (liczby osób)<br />
        <br />
         <div id='1.1.1.d'>
   <table  style="width: 100%; ">
  <tr>
    <td  class="borderAll center" colspan="2" rowspan="2">Małoletni według wieku </td>
    <td  class="borderAll center" rowspan="2">Ogółem orzeczone </td>
    <td  class="borderAll center" colspan="2">w tym </td>
  </tr>
  <tr>
    <td  class="borderAll center">blankietowe </td>
    <td  class="borderAll center">przez osoby zamieszkałe za granicą </td>
  </tr>
  <tr>
    <td  class="borderAll center" colspan="2">0</td>
    <td  class="col_166 center borderAll ">1</td>
    <td  class="col_166 center borderAll ">2</td>
    <td  class="col_166 center borderAll ">3</td>
  </tr>
  <tr>
    <td  class="col_200 borderAll ">Razem (w. 02 do 17)</td>
  <td  class="borderAll col_36">1</td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.d!1!4')"><asp:Label CssClass="normal" ID="tab_111d_w01_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.d!2!4')"><asp:Label CssClass="normal" ID="tab_111d_w01_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.d!3!4')"><asp:Label CssClass="normal" ID="tab_111d_w01_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_200 borderAll ">Do roku</td>
  <td  class="borderAll col_36">2</td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.1.d!1!4')"><asp:Label CssClass="normal" ID="tab_111d_w02_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.1.d!2!4')"><asp:Label CssClass="normal" ID="tab_111d_w02_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.1.d!3!4')"><asp:Label CssClass="normal" ID="tab_111d_w02_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_200 borderAll ">Pow. roku do 2 lat </td>
  <td  class="borderAll col_36">3</td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.1.d!1!4')"><asp:Label CssClass="normal" ID="tab_111d_w03_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.1.d!2!4')"><asp:Label CssClass="normal" ID="tab_111d_w03_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.1.d!3!4')"><asp:Label CssClass="normal" ID="tab_111d_w03_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_200 borderAll ">Pow. 2 do 3 lat </td>
  <td  class="borderAll col_36">4</td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.1.d!1!4')"><asp:Label CssClass="normal" ID="tab_111d_w04_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.1.d!2!4')"><asp:Label CssClass="normal" ID="tab_111d_w04_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.1.d!3!4')"><asp:Label CssClass="normal" ID="tab_111d_w04_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_200 borderAll ">Pow. 3 do 4 lat </td>
  <td  class="borderAll col_36">5</td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.1.d!1!4')"><asp:Label CssClass="normal" ID="tab_111d_w05_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.1.d!2!4')"><asp:Label CssClass="normal" ID="tab_111d_w05_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.1.d!3!4')"><asp:Label CssClass="normal" ID="tab_111d_w05_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_200 borderAll ">Pow. 4 do 5 lat </td>
  <td  class="borderAll col_36">6</td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.1.d!1!4')"><asp:Label CssClass="normal" ID="tab_111d_w06_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.1.d!2!4')"><asp:Label CssClass="normal" ID="tab_111d_w06_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.1.d!3!4')"><asp:Label CssClass="normal" ID="tab_111d_w06_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_200 borderAll ">Pow. 5 do 6 lat </td>
  <td  class="borderAll col_36">7</td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.1.d!1!4')"><asp:Label CssClass="normal" ID="tab_111d_w07_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.1.d!2!4')"><asp:Label CssClass="normal" ID="tab_111d_w07_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.1.d!3!4')"><asp:Label CssClass="normal" ID="tab_111d_w07_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_200 borderAll ">Pow. 6 do 7 lat </td>
  <td  class="borderAll col_36">8</td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.1.d!1!4')"><asp:Label CssClass="normal" ID="tab_111d_w08_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.1.d!2!4')"><asp:Label CssClass="normal" ID="tab_111d_w08_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.1.d!3!4')"><asp:Label CssClass="normal" ID="tab_111d_w08_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_200 borderAll ">Pow. 7 do 8 lat </td>
  <td  class="borderAll col_36">9</td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.1.d!1!4')"><asp:Label CssClass="normal" ID="tab_111d_w09_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.1.d!2!4')"><asp:Label CssClass="normal" ID="tab_111d_w09_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.1.d!3!4')"><asp:Label CssClass="normal" ID="tab_111d_w09_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_200 borderAll ">Pow. 8 do 9 lat </td>
  <td  class="borderAll col_36">10</td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.1.d!1!4')"><asp:Label CssClass="normal" ID="tab_111d_w10_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.1.d!2!4')"><asp:Label CssClass="normal" ID="tab_111d_w10_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.1.d!3!4')"><asp:Label CssClass="normal" ID="tab_111d_w10_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_200 borderAll ">Pow. 9 do 10 lat </td>
  <td  class="borderAll col_36">11</td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.1.d!1!4')"><asp:Label CssClass="normal" ID="tab_111d_w11_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.1.d!2!4')"><asp:Label CssClass="normal" ID="tab_111d_w11_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.1.d!3!4')"><asp:Label CssClass="normal" ID="tab_111d_w11_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_200 borderAll ">Pow. 10 do 11 lat </td>
  <td  class="borderAll col_36">12</td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.1.d!1!4')"><asp:Label CssClass="normal" ID="tab_111d_w12_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.1.d!2!4')"><asp:Label CssClass="normal" ID="tab_111d_w12_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.1.d!3!4')"><asp:Label CssClass="normal" ID="tab_111d_w12_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_200 borderAll ">Pow. 11 do 12 lat </td>
  <td  class="borderAll col_36">13</td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.1.d!1!4')"><asp:Label CssClass="normal" ID="tab_111d_w13_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.1.d!2!4')"><asp:Label CssClass="normal" ID="tab_111d_w13_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.1.d!3!4')"><asp:Label CssClass="normal" ID="tab_111d_w13_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_200 borderAll ">Pow. 12 do 13 lat </td>
  <td  class="borderAll col_36">14</td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.1.1.d!1!4')"><asp:Label CssClass="normal" ID="tab_111d_w14_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.1.1.d!2!4')"><asp:Label CssClass="normal" ID="tab_111d_w14_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.1.1.d!3!4')"><asp:Label CssClass="normal" ID="tab_111d_w14_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_200 borderAll ">Pow. 13 do 14 lat </td>
  <td  class="borderAll col_36">15</td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.1.1.d!1!4')"><asp:Label CssClass="normal" ID="tab_111d_w15_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.1.1.d!2!4')"><asp:Label CssClass="normal" ID="tab_111d_w15_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.1.1.d!3!4')"><asp:Label CssClass="normal" ID="tab_111d_w15_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_200 borderAll ">Pow. 14 do 15 lat </td>
  <td  class="borderAll col_36">16</td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.1.1.d!1!4')"><asp:Label CssClass="normal" ID="tab_111d_w16_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.1.1.d!2!4')"><asp:Label CssClass="normal" ID="tab_111d_w16_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.1.1.d!3!4')"><asp:Label CssClass="normal" ID="tab_111d_w16_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_200 borderAll ">Ponad 15 lat </td>
  <td  class="borderAll col_36">17</td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.1.1.d!1!4')"><asp:Label CssClass="normal" ID="tab_111d_w17_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.1.1.d!2!4')"><asp:Label CssClass="normal" ID="tab_111d_w17_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.1.1.d!3!4')"><asp:Label CssClass="normal" ID="tab_111d_w17_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
    </table>
 </div>
<br />

                    <strong>Dział 1.1.1.e.</strong> Pozbawienie, zawieszenie, ograniczenie władzy rodzicielskiej
         <div id='1.1.1.e'>
   <table  style="width: 100%; ">
  <tr>
    <td  class="borderAll center" colspan="3">Wyszczególnienia</td>
    <td  class="borderAll center">Liczba spraw (Dział 1.1. w.48 rubr. 5) </td>
    <td  class="borderAll center">Liczba małoletnich, których sprawa dotyczy (Dział 1.1. w.48 rubr. 6 ) </td>
  </tr>
  <tr>
    <td  class="borderAll center" colspan="3">0</td>
    <td  class="borderAll center">1</td>
    <td  class="borderAll center">2</td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">Razem (w. 01= w.02+05+06) </td>
  <td  class="borderAll col_36">1</td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.e!1!4')"><asp:Label CssClass="normal" ID="tab_111e_w01_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.e!2!4')"><asp:Label CssClass="normal" ID="tab_111e_w01_c02" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">Pozbawienie władzy rodzicielskiej </td>
  <td  class="borderAll col_36">2</td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.1.e!1!4')"><asp:Label CssClass="normal" ID="tab_111e_w02_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.1.e!2!4')"><asp:Label CssClass="normal" ID="tab_111e_w02_c02" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderLeft"></td>
    <td  class="borderTopBottom">w tym ze względu na stosowanie przemocy w rodzinie w rozumieniu art. 2 pkt 2 ustawy z dnia 29 lipca 2005 roku o przeciwdziałaniu przemocy w rodzinie (Dz.U. z 2015 r. poz. 1390) </td>
  <td  class="borderAll col_36">3</td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.1.e!1!4')"><asp:Label CssClass="normal" ID="tab_111e_w03_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.1.e!2!4')"><asp:Label CssClass="normal" ID="tab_111e_w03_c02" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderLeft"></td>
    <td  class="borderTopBottom">w tym z uwagi na powiadomienie sądu opiekuńczego przez pracownika socjalnego o odebraniu dziecka z rodziny w trybie art. 12a ust. 1 w zw. z ust. 4 ustawy z dnia 29 lipca 2005 roku o przeciwdziałaniu przemocy w rodzinie (Dz.U. z 2015 r. poz. 1390) </td>
  <td  class="borderAll col_36">4</td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.1.e!1!4')"><asp:Label CssClass="normal" ID="tab_111e_w04_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.1.e!2!4')"><asp:Label CssClass="normal" ID="tab_111e_w04_c02" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">Zawieszenie władzy rodzicielskiej </td>
  <td  class="borderAll col_36">5</td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.1.e!1!4')"><asp:Label CssClass="normal" ID="tab_111e_w05_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.1.e!2!4')"><asp:Label CssClass="normal" ID="tab_111e_w05_c02" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td colspan="2" class="borderAll wciecie">Ograniczenie władzy rodzicielskiej </td>
  <td  class="borderAll col_36">6</td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.1.e!1!4')"><asp:Label CssClass="normal" ID="tab_111e_w06_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.1.e!2!4')"><asp:Label CssClass="normal" ID="tab_111e_w06_c02" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderLeft"></td>
    <td  class="borderTopBottom">w tym ze względu na stosowanie przemocy w rodzinie w rozumieniu art. 2 pkt 2 ustawy z dnia 29 lipca 2005 roku o przeciwdziałaniu przemocy w rodzinie (Dz.U. z 2015 r. poz. 1390) </td>
  <td  class="borderAll col_36">7</td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.1.e!1!4')"><asp:Label CssClass="normal" ID="tab_111e_w07_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.1.e!2!4')"><asp:Label CssClass="normal" ID="tab_111e_w07_c02" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderLeft"></td>
    <td  class=" borderTopBottom">w tym z uwagi na powiadomienie sądu opiekuńczego przez pracownika socjalnego o odebraniu dziecka z rodziny w trybie art. 12a ust. 1 w zw. z ust. 4 ustawy z dnia 29 lipca 2005 roku o przeciwdziałaniu przemocy w rodzinie (Dz.U. z 2015 r. poz. 1390) </td>
  <td  class="borderAll col_36">8</td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.1.e!1!4')"><asp:Label CssClass="normal" ID="tab_111e_w08_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.1.e!2!4')"><asp:Label CssClass="normal" ID="tab_111e_w08_c02" runat="server" Text="0"></asp:Label></a>
        <br />
      </td>
  </tr>
  <tr>
    <td  class="borderLeft"></td>
    <td  class="borderAll">w tym orzeczenie przez sąd pieczy naprzemiennej (art. 107§1 i 2 kro) </td>
  <td  class="borderAll col_36">9</td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.1.e!1!4')"><asp:Label CssClass="normal" ID="tab_111e_w09_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_166 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.1.e!2!4')"><asp:Label CssClass="normal" ID="tab_111e_w09_c02" runat="server" Text="0"></asp:Label></a></td>
  </tr>
    </table>
 </div>

        <br />

                    <strong>Dział 1.1.1.f.</strong> w tym (dz. 1.1.1. w. 48 lit. f)<div id='1.1.1.f'>
   <table  style="width: 100%; ">
  <tr>
    <td  class="borderAll center" colspan="2">Wyszczególnienie</td>
    <td  class="col_330 center borderAll ">Liczby</td>
  </tr>
  <tr>
    <td  class="borderAll center" colspan="2">0</td>
    <td  class="col_330 center borderAll ">1</td>
  </tr>
  <tr>
    <td  class="col_300 wciecie borderAll">Liczba ojców, którzy złożyli wniosek o powierzenie wykonywania władzy rodzicielskiej </td>
  <td  class="borderAll col_36">1</td>
    <td  class="col_330 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.f!1!4')"><asp:Label CssClass="normal" ID="tab_111f_w01_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_300 wciecie borderAll">w tym liczba ojców, których wniosek sąd uwzględnił </td>
  <td  class="borderAll col_36">2</td>
    <td  class="col_330 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.1.f!1!4')"><asp:Label CssClass="normal" ID="tab_111f_w02_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_300 wciecie borderAll">Liczba matek, które złożyły wniosek o powierzenie wykonywania władzy rodzicielskiej </td>
  <td  class="borderAll col_36">3</td>
    <td  class="col_330 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.1.f!1!4')"><asp:Label CssClass="normal" ID="tab_111f_w03_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_300 wciecie borderAll">w tym liczba matek, których wniosek sąd uwzględnił </td>
  <td  class="borderAll col_36">4</td>
    <td  class="col_330 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.1.f!1!4')"><asp:Label CssClass="normal" ID="tab_111f_w04_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_300 wciecie borderAll">Liczba spraw, w których rodzice przedstawili porozumienie o sposobie wykonywania władzy rodzicielskiej i utrzymywaniu kontaktów z dzieckiem </td>
  <td  class="borderAll col_36">5</td>
    <td  class="col_330 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.1.f!1!4')"><asp:Label CssClass="normal" ID="tab_111f_w05_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_300 wciecie borderAll">w tym liczba spraw, w których sąd uwzględnił porozumienie </td>
  <td  class="borderAll col_36">6
    <td  class="col_330 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.1.f!1!4')"><asp:Label CssClass="normal" ID="tab_111f_w06_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
    </table>
 </div>

        <br />
        <div id='1.1.1.g'>

                    <strong>Dział 1.1.1.g. </strong>
            <h3 class="western"><font size="2">Rodzaje orzeczeń wydanych w okresie statystycznym w sprawach dotyczących wykonywania kontaktów z dzieckiem (art. 598</font><sup><font size="2">15 </font></sup>i nast. K.p.c.)</h3>
            <br />
   <table  style="width: 100%; ">
  <tr>
    <td  class="borderAll center" colspan="2" rowspan="2">Wyszczególnienia</td>
    <td  class="borderAll center" colspan="2">Liczby</td>
  </tr>
  <tr>
    <td  class="col_90 center borderAll">rodziców</td>
    <td  class="col_90 center borderAll">orzeczeń</td>
  </tr>
  <tr>
    <td  class="borderAll center" colspan="2">0</td>
    <td  class="col_90 center borderAll">1</td>
    <td  class="col_90 center borderAll">2</td>
  </tr>
  <tr>
    <td  class="col_300 wciecie borderAll ">Razem (w. 02, 05, 08,11)</td>
  <td  class="borderAll col_36">1</td>
    <td  class="col_90 center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.g!1!4')"><asp:Label CssClass="normal" ID="tab_111g_w01_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.g!2!4')"><asp:Label CssClass="normal" ID="tab_111g_w01_c02" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_300 wciecie borderAll ">Orzeczenie, w którym zagrożono osobie, pod której pieczą dziecko pozostaje, niewykonującej (albo niewłaściwie wykonującej) obowiązki wynikające z orzeczenia albo z ugody zawartej przed sądem lub przed mediatorem w przedmiocie kontaktów z dzieckiem (art. 59815 § 1 k.p.c.) nakazaniem zapłaty oznaczonej sumy pieniężnej na rzecz osoby uprawnionej do kontaktu z dzieckiem </td>
  <td  class="borderAll col_36">2</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.1.g!1!4')"><asp:Label CssClass="normal" ID="tab_111g_w02_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.1.g!2!4')"><asp:Label CssClass="normal" ID="tab_111g_w02_c02" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_300 wciecie borderAll ">Liczba ojców, którym zagrożono nakazaniem zapłaty oznaczonej sumy pieniężnej na rzecz osoby uprawnionej do kontaktu z dzieckiem w sytuacjach wskazanych w w. 02 </td>
  <td  class="borderAll col_36">3</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.1.g!1!4')"><asp:Label CssClass="normal" ID="tab_111g_w03_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.1.g!2!4')"><asp:Label CssClass="normal" ID="tab_111g_w03_c02" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_300 wciecie borderAll ">Liczba matek, którym zagrożono nakazaniem zapłaty oznaczonej sumy pieniężnej na rzecz osoby uprawnionej do kontaktu z dzieckiem w sytuacjach wskazanych w w. 02 </td>
  <td  class="borderAll col_36">4</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.1.g!1!4')"><asp:Label CssClass="normal" ID="tab_111g_w04_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.1.g!2!4')"><asp:Label CssClass="normal" ID="tab_111g_w04_c02" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_300 wciecie borderAll ">Orzeczenie, w którym zagrożono osobie uprawnionej do kontaktu z dzieckiem albo osobie, której tego kontaktu zakazano, naruszających obowiązki wynikające z orzeczenia albo z ugody zawartej przed sądem lub przed mediatorem w przedmiocie kontaktów z dzieckiem (art. 59815 § 2 k.p.c.) nakazaniem zapłaty oznaczonej sumy pieniężnej na rzecz osoby, pod której pieczą dziecko pozostaje </td>
  <td  class="borderAll col_36">5</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.1.g!1!4')"><asp:Label CssClass="normal" ID="tab_111g_w05_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.1.g!2!4')"><asp:Label CssClass="normal" ID="tab_111g_w05_c02" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_300 wciecie borderAll ">Liczba ojców, którym zagrożono nakazaniem zapłaty oznaczonej sumy pieniężnej na rzecz osoby, pod której pieczą dziecko pozostaje w sytuacjach wskazanych w w. 05 </td>
  <td  class="borderAll col_36">6</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.1.g!1!4')"><asp:Label CssClass="normal" ID="tab_111g_w06_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.1.g!2!4')"><asp:Label CssClass="normal" ID="tab_111g_w06_c02" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_300 wciecie borderAll ">Liczba matek, którym zagrożono nakazaniem zapłaty oznaczonej sumy pieniężnej na rzecz osoby, pod której pieczą dziecko pozostaje w sytuacjach wskazanych w w. 05 </td>
  <td  class="borderAll col_36">7</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.1.g!1!4')"><asp:Label CssClass="normal" ID="tab_111g_w07_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.1.g!2!4')"><asp:Label CssClass="normal" ID="tab_111g_w07_c02" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_300 wciecie borderAll ">Orzeczenie, którym nakazano osobom wymienionym w w. 02 lub 05 zapłatę oznaczonej sumy pieniężnej również z poprzednich okresów statystycznych </td>
  <td  class="borderAll col_36">8</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.1.g!1!4')"><asp:Label CssClass="normal" ID="tab_111g_w08_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.1.g!2!4')"><asp:Label CssClass="normal" ID="tab_111g_w08_c02" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_300 wciecie borderAll ">Liczba ojców, w sytuacjach wymienionych w w. 02 lub 05, którym nakazano zapłatę oznaczonej sumy pieniężnej również z poprzednich okresów statystycznych </td>
  <td  class="borderAll col_36">9</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.1.g!1!4')"><asp:Label CssClass="normal" ID="tab_111g_w09_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.1.g!2!4')"><asp:Label CssClass="normal" ID="tab_111g_w09_c02" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_300 wciecie borderAll ">Liczba matek, w sytuacjach wymienionych w w. 02 lub 05, którym nakazano zapłatę oznaczonej sumy pieniężnej również z poprzednich okresów statystycznych </td>
  <td  class="borderAll col_36">10</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.1.g!1!4')"><asp:Label CssClass="normal" ID="tab_111g_w10_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.1.g!2!4')"><asp:Label CssClass="normal" ID="tab_111g_w10_c02" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_300 wciecie borderAll ">Orzeczenie, którym przyznano zwrot wydatków poniesionych w związku z przygotowaniem kontaktów, jeżeli do kontaktu nie doszło wskutek niewykonania lub niewłaściwego wykonania przez osobę, pod której pieczą dziecko pozostaje, obowiązków wynikających z orzeczenia albo z ugody zawartej przed sądem lub przed mediatorem w przedmiocie kontaktów z dzieckiem (art. 59817 § 1 k.p.c.) oraz naruszenia przez uprawnionego do kontaktu z dzieckiem obowiązków dotyczących kontaktu, wynikających z orzeczenia albo z ugody zawartej przed sądem lub przed mediatorem (art. 59817 § 2 k.p.c.) </td>
  <td  class="borderAll col_36">11</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.1.g!1!4')"><asp:Label CssClass="normal" ID="tab_111g_w11_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.1.g!2!4')"><asp:Label CssClass="normal" ID="tab_111g_w11_c02" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_300 wciecie borderAll ">Liczba ojców, którym przyznano zwrot wydatków poniesionych w związku z przygotowaniem kontaktów, w sytuacjach wymienionych w w.11</td>
  <td  class="borderAll col_36">12</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.1.g!1!4')"><asp:Label CssClass="normal" ID="tab_111g_w12_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.1.g!2!4')"><asp:Label CssClass="normal" ID="tab_111g_w12_c02" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_300 wciecie borderAll ">Liczba matek, którym przyznano zwrot wydatków poniesionych w związku z przygotowaniem kontaktów, w sytuacjach wymienionych w w.11 </td>
  <td  class="borderAll col_36">13</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.1.g!1!4')"><asp:Label CssClass="normal" ID="tab_111g_w13_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.1.g!2!4')"><asp:Label CssClass="normal" ID="tab_111g_w13_c02" runat="server" Text="0"></asp:Label></a></td>
  </tr>
    </table>
 </div>

        <br />
        <table style="width:100%;" >
            <tr>
                <td style="width: 1000px">

                    <strong>Dział 1.1.1.g.1</strong>. </td>
                 <td valign="top" class="center">
                </td>
            </tr>
        </table>
        <table style="width:100%;" >
            <tr>
                <td style="width: 1000px" class="wciecie">

                    Sprawy dotyczące wykonywania orzeczeń o odebranie osoby podlegającej władzy rodzicielskiej lub pozostającej pod opieką, wydanych na podstawie art. 5981- 5985 kpc </td>
                 <td valign="top" class="center">

                     <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.g.1!1!4')"> <asp:TextBox ID="tab_111g1_w01_col01" runat="server" ReadOnly="True" CssClass="col_155"></asp:TextBox></a>
                </td>
            </tr>
        </table>
        <table style="width:100%;" >
            <tr>
                <td style="width: 1000px" class="wciecie">

                    Sprawy dotyczące wykonywania orzeczeń o odebranie osoby podlegającej władzy rodzicielskiej lub pozostającej pod opieką, wydanych na podstawie art. 5986- 59812 kpc w zw. z art. 59813 </td>
                 <td valign="top" class="center">
                  <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.g.1!1!4')"> <asp:TextBox ID="tab_111g1_w02_col01" runat="server" ReadOnly="True" CssClass="col_155"></asp:TextBox></a>
                 </td>
            </tr>
        </table>
        <br />

        <br />
        <table style="width:100%;">
            <tr>
                <td style="width: 1000px">
                    <p style="margin-bottom: 0cm">
                        <strong>Dział 1.1.1.h</strong> Liczba zarządzeń sędziego o natychmiastowe wypisanie ze szpitala psychiatrycznego i umorzenie postępowania [art. 45 ust. 2 ustawy z dnia 19 sierpnia 1994 r. o ochronie zdrowia psychicznego (Dz. U. z 2016 r., poz. 546)]</p>
                </td>
                <td valign="bottom" class="center">
                    <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.h!1!4')"> <asp:TextBox ID="tab_111h1_w01_col01" runat="server" ReadOnly="True" CssClass="col_155"></asp:TextBox></a>
                </td>
            </tr>
            </table>
        <br />
        </div>
       <div id="1.1.1.i"  class="page-break">
           <br />
        <table style="width:100%;">
            <tr>
                <td style="width: 1000px">

                        <font face="Arial, sans-serif"><font size="2" style="font-size: 11pt"><font size="2" style="font-size: 9pt"><b>Dział 1.1.1.i. Liczba spraw, w których orzeczono obniżenie alimentów wyłącznie z uwagi na okoliczność uzyskania świadczenia wychowawczego przez uprawniony podmiot na podstawie ustawy z dnia 11 lutego 2016 r. </b><i><b>O pomocy państwa w wychowaniu dzieci</b></i><b> (Dz. U. poz. 195) symbol 003o</b></font></font></font>
                </td>
                <td valign="bottom" class="center">
                         <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.i!1!4')"> <asp:TextBox ID="tab_111i_w01_col01" runat="server" ReadOnly="True" CssClass="col_155"></asp:TextBox></a>
                </td>
            </tr>
            <tr>
                <td style="width: 1000px">

                        <font size="2" style="font-size: 9pt"><span class="auto-style4" >Dział 1.1.1.j. Liczba zarządzeń sędziego o natychmiastowe wypisanie ze szpitala psychiatrycznego i umorzenie postępowania</span></font>
                        <br class="auto-style3" />

                            <font face="Arial, sans-serif"><font size="2" style="font-size: 9pt"><font size="1"><span class="auto-style3" >[art. 45 ust. 2 ustawy z dnia 19 sierpnia 1994 r. o ochronie zdrowia psychicznego </span></font><font class="auto-style3"><font size="1" style="font-size: 6pt"><span >(Dz. U. z 2016 r., poz. 546</span></font><font size="1"><span >)]</span></font></font></font></font>
                </td>
                <td valign="bottom" class="center">

                       <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.i!1!4')">  <asp:TextBox ID="tab_111j_w01_col01" runat="server" ReadOnly="True" CssClass="col_155"></asp:TextBox></a>
                </td>
            </tr>
            </table>
    &nbsp;&nbsp;
    &nbsp;<br />
        </div>

                        <strong>Dział 1.1.2</strong> Ewidencja spraw nieletnich<br />
        <div id='1.1.2'>
   <table  style="width: 100%; ">
  <tr>
    <td  class="borderAll center" colspan="2" rowspan="2">Wyszczególnienia</td>
  <td  class="borderAll center" rowspan="2">L.p.</td>
    <td  class="borderAll center" rowspan="2">Pozostało z ubiegłego roku</td>
    <td  class="borderAll center" colspan="2">WPŁYNĘŁO</td>
    <td  class="borderAll center" colspan="2">ZAŁATWION</td>
    <td  class="col_90 center borderAll " rowspan="2">Pozostało na okres następny</td>
  </tr>
  <tr>
    <td  class="borderAll center">razem</td>
    <td  class="borderAll center">w tym z innego sądu</td>
    <td  class="borderAll center">razem</td>
    <td  class="borderAll center">w tym z innego sądu</td>
  </tr>
  <tr>
    <td  class="borderAll center" colspan="3">0</td>
    <td  class="borderAll center">1</td>
    <td  class="borderAll center">2</td>
    <td  class="borderAll center">3</td>
    <td  class="borderAll center">4</td>
    <td  class="col_90 center borderAll ">5</td>
    <td  class="col_90 center borderAll ">6</td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">Rep. Nkd (w. 02 + 03)</td>
  <td  class="borderAll col_36">1</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2!1!4')"><asp:Label CssClass="normal" ID="tab_112_w01_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2!2!4')"><asp:Label CssClass="normal" ID="tab_112_w01_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2!3!4')"><asp:Label CssClass="normal" ID="tab_112_w01_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2!4!4')"><asp:Label CssClass="normal" ID="tab_112_w01_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2!5!4')"><asp:Label CssClass="normal" ID="tab_112_w01_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2!6!4')"><asp:Label CssClass="normal" ID="tab_112_w01_c06" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_100 borderAll " rowspan="2">z tego</td>
    <td  class="col_100 borderAll ">demoralizacja</td>
  <td  class="borderAll col_36">2</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.2!1!4')"><asp:Label CssClass="normal" ID="tab_112_w02_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.2!2!4')"><asp:Label CssClass="normal" ID="tab_112_w02_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.2!3!4')"><asp:Label CssClass="normal" ID="tab_112_w02_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.2!4!4')"><asp:Label CssClass="normal" ID="tab_112_w02_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.2!5!4')"><asp:Label CssClass="normal" ID="tab_112_w02_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.2!6!4')"><asp:Label CssClass="normal" ID="tab_112_w02_c06" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_100 borderAll ">czyny karalne</td>
  <td  class="borderAll col_36">3</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.2!1!4')"><asp:Label CssClass="normal" ID="tab_112_w03_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.2!2!4')"><asp:Label CssClass="normal" ID="tab_112_w03_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.2!3!4')"><asp:Label CssClass="normal" ID="tab_112_w03_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.2!4!4')"><asp:Label CssClass="normal" ID="tab_112_w03_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.2!5!4')"><asp:Label CssClass="normal" ID="tab_112_w03_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.2!6!4')"><asp:Label CssClass="normal" ID="tab_112_w03_c06" runat="server" Text="0"></asp:Label></a></td>
  </tr>
    </table>
 </div>
 <br />
          <div id='1.1.2.a'>
                      
         
         <strong>   Dział 1.1.2.a </strong>&nbsp;Ewidencja popełnionych czynów karalnych przez nieletnich w odniesieniu do osób
              
   <table  style="width: 100%; ">
  <tr>
    <td  class="col_100 borderAll " rowspan="4">Wyszczególnienia</td>
  <td  class="borderAll col_36" rowspan="4">L.p.</td>
    <td  class="col_90 center borderAll " rowspan="4">Wszczęto</td>
    <td  class="borderAll center" colspan="5">Załatwiono</td>
    <td  class="borderAll center" colspan="2">czyny karalne</td>
  </tr>
  <tr>
    <td  class="col_90 center borderAll " rowspan="3">razem (kol. 2= 3 do 6) </td>
    <td  class="borderAll center" colspan="4">z tego</td>
    <td  class="col_90 center borderAll " rowspan="3">wydano orzeczenie kończące postępowanie</td>
    <td  class="col_90 center borderAll " rowspan="3">stwierdzone czyny karalne przypisane nieletniemu w orzeczeniu kończącym postępowanie (wszystkie czyny) </td>
  </tr>
  <tr>
    <td  class="col_90 center borderAll " rowspan="2">nie wszczęto </td>
    <td colspan="2">umorzono z powodu </td>
    <td  class="col_90 center borderAll " rowspan="2">w inny sposób</td>
  </tr>
  <tr>
    <td  class="col_90 center borderAll ">niecelowości ze wzgl. na orzeczone środki w innej sprawie</td>
    <td  class="col_90 center borderAll ">innego</td>
  </tr>
  <tr>
    <td  class="borderAll center" colspan="2">0</td>
    <td  class="col_90 center borderAll ">1</td>
    <td  class="col_90 center borderAll ">2</td>
    <td  class="col_90 center borderAll ">3</td>
    <td  class="col_90 center borderAll ">4</td>
    <td  class="col_90 center borderAll ">5</td>
    <td  class="col_90 center borderAll ">6</td>
    <td  class="col_90 center borderAll ">7</td>
    <td  class="col_90 center borderAll ">8</td>
  </tr>
  <tr>
    <td  class="col_100 borderAll ">Rep Nkd</td>
  <td  class="borderAll col_36">1</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2.a!1!4')"><asp:Label CssClass="normal" ID="tab_112a_w01_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2.a!2!4')"><asp:Label CssClass="normal" ID="tab_112a_w01_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2.a!3!4')"><asp:Label CssClass="normal" ID="tab_112a_w01_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2.a!4!4')"><asp:Label CssClass="normal" ID="tab_112a_w01_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2.a!5!4')"><asp:Label CssClass="normal" ID="tab_112a_w01_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2.a!6!4')"><asp:Label CssClass="normal" ID="tab_112a_w01_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2.a!7!4')"><asp:Label CssClass="normal" ID="tab_112a_w01_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2.a!8!4')"><asp:Label CssClass="normal" ID="tab_112a_w01_c08" runat="server" Text="0"></asp:Label></a></td>
  </tr>
    </table>
 </div>

          <br />

                      
          <strong>  Dział 1.1.2.b </strong>&nbsp;Stwierdzone czyny karalne przypisane nieletniemu w orzeczeniu kończącym postępowanie <div id='1.1.2.b'>
   <table  style="width: 100%; ">
  <tr>
    <td  class="borderAll center" colspan="4">Rodzaje czynów karalnych </td>
    <td  class="col_90 center borderAll ">Liczba stwierdzonych czynów karalnych </td>
  </tr>
  <tr>
    <td  class="borderAll center" colspan="4">0</td>
    <td  class="col_90 center borderAll ">1</td>
  </tr>
  <tr>
    <td  class="borderAll center" colspan="3">Ogółem (w.01 = dz.1.1.2.a, kol. 8)</td>
  <td  class="borderAll col_36">1</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_112b_w01_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_100 borderAll " rowspan="23">w tym</td>
    <td  class="borderAll center" colspan="2">zabójstwo art. 148 kk</td>
  <td  class="borderAll col_36">2</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_112b_w02_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" rowspan="2">uszczerbek na zdrowiu art.</td>
    <td  class="borderAll wciecie">156 kk</td>
  <td  class="borderAll col_36">3</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_112b_w03_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">157 kk</td>
  <td  class="borderAll col_36">4</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_112b_w04_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" rowspan="2">udział w bójce lub pobiciu art.</td>
    <td  class="borderAll wciecie">158 kk</td>
  <td  class="borderAll col_36">5</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_112b_w05_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">159 kk</td>
  <td  class="borderAll col_36">6</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_112b_w06_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">przestępstwa z ustawy o przeciwdziałaniu narkomani </td>
  <td  class="borderAll col_36">7</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_112b_w07_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">zgwałcenie art. 197 kk </td>
  <td  class="borderAll col_36">8</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_112b_w08_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" rowspan="7">korupcja art. </td>
    <td  class="col_100 borderAll ">228 kk </td>
  <td  class="borderAll col_36">9</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_112b_w09_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_100 borderAll ">229 kk </td>
  <td  class="borderAll col_36">10</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_112b_w10_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_100 borderAll ">230 kk </td>
  <td  class="borderAll col_36">11</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_112b_w11_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_100 borderAll ">231 kk </td>
  <td  class="borderAll col_36">12</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_112b_w12_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_100 borderAll ">250a kk </td>
  <td  class="borderAll col_36">13</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_112b_w13_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_100 borderAll ">296a kk </td>
  <td  class="borderAll col_36">14</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_112b_w14_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_100 borderAll ">296b kk </td>
  <td  class="borderAll col_36">15</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_112b_w15_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">kradzież rzeczy art. 278 kk </td>
  <td  class="borderAll col_36">16</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_112b_w16_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">w tym kradzież samochodu </td>
  <td  class="borderAll col_36">17</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_112b_w17_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">kradzież z włamaniem art. 279 kk </td>
  <td  class="borderAll col_36">18</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_112b_w18_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">rozbój art. 280 kk </td>
  <td  class="borderAll col_36">19</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_112b_w19_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">kradzież rozbójnicza art. 281 kk </td>
  <td  class="borderAll col_36">20</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_112b_w20_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">wymuszenie rozbójnicze 282 kk </td>
  <td  class="borderAll col_36">21</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_112b_w21_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" rowspan="2">oszustwo art. </td>
    <td  class="col_100 borderAll ">286 kk </td>
  <td  class="borderAll col_36">22</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_112b_w22_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_100 borderAll ">287 kk </td>
  <td  class="borderAll col_36">23</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_112b_w23_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">prowadzenie pojazdu na drodze przez osobę w stanie nietrzeźwym lub pod wpływem środka odurzającego art. 178a kk </td>
  <td  class="borderAll col_36">24</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_112b_w24_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
    </table>
 </div>

          <br />

                        <strong>
          Dział 1.1.2.c </strong>&nbsp;Załatwiono w odniesieniu do osób (z wyłączeniem orzeczeń zmienionych w czasie wykonywania orzeczeń) Rep. Nkd<div id='1.1.2.c'>
   <table  style="width: 100%; ">
  <tr>
    <td  class="borderAll center" colspan="3">Wyszczególnienia</td>
    <td  class="col_110 center borderAll ">ogółem</td>
    <td  class="col_110 center borderAll ">Demoralizacja</td>
    <td  class="col_110 center borderAll ">Czyny karalne</td>
  </tr>
  <tr>
    <td  class="borderAll center" colspan="3">0</td>
    <td  class="col_110 center borderAll ">1</td>
    <td  class="col_110 center borderAll ">2</td>
    <td  class="col_110 center borderAll ">3</td>
  </tr>
  <tr>
    <td colspan="2" class="borderAll wciecie">Załatwiono ogółem (w. 2 do 5+10+23+32+33+37) </td>
  <td  class="borderAll col_36">1</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w01_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w01_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w01_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td colspan="2" class="borderAll wciecie">Nie wszczęto postępowania </td>
  <td  class="borderAll col_36">2</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w02_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w02_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w02_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_100 borderAll " rowspan="2">Umorzono z powodu </td>
    <td  class="borderAll wciecie">niecelowości ze wzgl. na orzeczone środki w innej sprawie </td>
  <td  class="borderAll col_36">3</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w03_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w03_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w03_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">innego </td>
  <td  class="borderAll col_36">4</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w04_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w04_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w04_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_100 borderAll " rowspan="5">Przekazano </td>
    <td  class="borderAll wciecie">ogółem (w. 6–9) </td>
  <td  class="borderAll col_36">5</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w05_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w05_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w05_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">innemu sądowi </td>
  <td  class="borderAll col_36">6</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w06_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w06_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w06_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">prokuratorowi </td>
  <td  class="borderAll col_36">7</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w07_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w07_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w07_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">szkole i organizacji </td>
  <td  class="borderAll col_36">8</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w08_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w08_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w08_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">innemu organowi </td>
  <td  class="borderAll col_36">9</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w09_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w09_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w09_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td class="borderAll wciecie" colspan="2">Orzeczono środki wychowawcze wobec osób </td>
  <td  class="borderAll col_36">10</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w10_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w10_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w10_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="2">Środki wychowawcze – ogółem a) (art. 6 ustawy) *) (w. 12 do 22) </td>
  <td  class="borderAll col_36">11</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w11_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w11_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w11_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="2">Upomnienie (pkt. 1) </td>
  <td  class="borderAll col_36">12</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w12_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w12_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w12_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="2">Zobowiązanie do określonego postępowania (pkt. 2) </td>
  <td  class="borderAll col_36">13</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w13_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w13_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w13_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="2">Nadzór odpowiedzialny rodziców lub opiekuna (p. 3) </td>
  <td  class="borderAll col_36">14</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w14_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w14_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w14_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="2">Nadzór organizacji, zakładu pracy, osoby godnej zaufania (p.4) </td>
  <td  class="borderAll col_36">15</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w15_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w15_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w15_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="2">Nadzór kuratora (p. 5) </td>
  <td  class="borderAll col_36">16</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w16_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w16_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w16_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="2">Skierowanie do ośrodka kuratorskiego (p. 6) </td>
  <td  class="borderAll col_36">17</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w17_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w17_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w17_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="2">Zakaz prowadzenia pojazdów (p. 7) </td>
  <td  class="borderAll col_36">18</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w18_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w18_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w18_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="2">Przepadek rzeczy (p.8) </td>
  <td  class="borderAll col_36">19</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w19_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w19_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w19_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_100 borderAll " rowspan="2">Art. 6 pkt 9 umieszczono w</td>
    <td  class="borderAll wciecie">rodzinie zastępczej zawodowej (p. 9) </td>
  <td  class="borderAll col_36">20</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w20_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w20_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w20_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">młodzieżowym ośrodku wychowawczym </td>
  <td  class="borderAll col_36">21</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w21_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w21_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w21_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="wciecie borderAll" colspan="2">Inny środek wychowawczy (pkt. 11) </td>
  <td  class="borderAll col_36">22</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w22_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w22_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w22_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2"</td>
        Orzeczono środki poprawcze ogółem (w. 24 do 25)
<td  class="borderAll col_36">23</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w23_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w23_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w23_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">Zakład poprawczy bez zawieszenia </td>
  <td  class="borderAll col_36">24</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w24_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w24_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w24_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">Zakład poprawczy z zawieszeniem </td>
  <td  class="borderAll col_36">25</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w25_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w25_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w25_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_100 borderAll " rowspan="6">Środki w okresie zawieszenia zakładu poprawczego b) </td>
    <td  class="borderAll wciecie">nadzór kuratora </td>
  <td  class="borderAll col_36">26</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w26_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w26_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w26_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">skierowanie do kuratorskiego ośrodka </td>
  <td  class="borderAll col_36">27</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w27_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w27_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w27_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">umieszczenie w rodzinie zastęp. </td>
  <td  class="borderAll col_36">28</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w28_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w28_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w28_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">nadzór organizacji, zakładu pracy, osoby godnej zaufania </td>
  <td  class="borderAll col_36">29</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w29_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w29_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w29_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">umieszczenie w młodzieżowym ośrodku wychowawczym </td>
  <td  class="borderAll col_36">30</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w30_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w30_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w30_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">inne środki </td>
  <td  class="borderAll col_36">31</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w31_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w31_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w31_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">Orzeczono karę </td>
  <td  class="borderAll col_36">32</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w32_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w32_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w32_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">Środki leczniczo-wychowawcze (art. 26*)) </td>
  <td  class="borderAll col_36">33</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w33_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w33_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w33_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_100 borderAll " rowspan="3">w tym umieszczenie w </td>
    <td  class="borderAll wciecie">zakładzie leczniczym </td>
  <td  class="borderAll col_36">34</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w34_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w34_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w34_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">młodzieżowym ośrodku wychowawczym </td>
  <td  class="borderAll col_36">35</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w35_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w35_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w35_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">domu pomocy społecznej </td>
  <td  class="borderAll col_36">36</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w36_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w36_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w36_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">domu pomocy społecznej </td>
  <td  class="borderAll col_36">37</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w37_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w37_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w37_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
    </table>
 </div>

          *) Ustawa z dnia 26 października 1982 r. o postępowaniu w sprawach nieletnich (Dz. U. z 2016 r., poz. 1654)
          <br />
          a) Liczba środków nie może być mniejsza od liczby orzeczeń wykazanej w wierszu 2.
          <br />
          b) Wykazuje się wszystkie środki orzeczone przy zawieszeniu zakładu poprawczego. Suma wierszy 26 do 31 może być zatem większa od liczby w wierszu 25.
          <br />
       <br />

       <div id='Zastosowanie środków zapobiegania i zwalczania demoralizacji i przestępczości nieletnich (art. 26 i 27 ustawy)*)' class="page-break" >
 <br/>
 <strong> Dział 1.1.3 Zastosowanie środków zapobiegania i zwalczania demoralizacji i przestępczości nieletnich (art. 26 i 27 ustawy)*)</strong> 
    <table  style="width: 100%; ">
 <tr>    <td  class="center borderAll" colspan="3"> Wyszczególnienie</td>    <td class="center borderAll"> Liczba</td>
</tr>
 <tr>    <td  class="center borderAll" colspan="3">0</td>    <td class="center borderAll">1</td>
</tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">Umieszczenie w schronisku dla nieletnich</td>
  <td  class="borderAll col_36">1</td>
    <td  class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.3!1!4')"><asp:Label CssClass="normal" ID="tab_113_w01_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">Nadzór organizacji młodzieżowej, społecznej, zakładu pracy, osoby godnej zaufania</td>
  <td  class="borderAll col_36">2</td>
    <td  class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.3!1!4')"><asp:Label CssClass="normal" ID="tab_113_w02_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">Nadzór kuratora</td>
  <td  class="borderAll col_36">3</td>
    <td  class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.3!1!4')"><asp:Label CssClass="normal" ID="tab_113_w03_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" rowspan="3">Nadzór kuratora</td>
    <td  class="borderAll wciecie">zakładzie leczniczym</td>
  <td  class="borderAll col_36">4</td>
    <td  class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.3!1!4')"><asp:Label CssClass="normal" ID="tab_113_w04_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">młodzieżowym ośrodku wychowawczym</td>
  <td  class="borderAll col_36">5</td>
    <td  class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.3!1!4')"><asp:Label CssClass="normal" ID="tab_113_w05_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">domu pomocy społecznej</td>
  <td  class="borderAll col_36">6</td>
    <td  class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.3!1!4')"><asp:Label CssClass="normal" ID="tab_113_w06_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
    </table>
 </div>
         
          <br />
          <br />
          <div id='1.1.4'>
 <strong> Dział 1.1.4</strong> Obciążenie kosztami postępowania we wszystkich sprawach  Nw, Nkd – łącznie (art. 32  ustawy)*)
   <table  style="width: 100%; ">
 <tr>    <td  class="center borderAll" colspan="2"> Wyszczególnienie </td>    <td class="center borderAll"> Liczba</td>
</tr>
 <tr>    <td  class="center borderAll" colspan="2">0</td>    <td class="center borderAll">1</td>
</tr>
  <tr>
    <td  class="borderAll wciecie">Rodziców </td>
  <td  class="borderAll col_36">1</td>
    <td  class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.4!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_4_w01_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">Nieletnich</td>
  <td  class="borderAll col_36">2</td>
    <td  class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.4!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_4_w02_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">Innych osób zobowiązanych do alimentacji</td>
  <td  class="borderAll col_36">3</td>
    <td  class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.4!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_4_w03_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
    </table>
 </div>
         <div id='1.1.5' class="page-break">
        
 <strong> Dział Środki zobowiązujące rodziców (opiekunów)   (art. 7  ustawy)*)</strong> 
    <table  style="width: 100%; ">
 <tr>    <td  class="center borderAll" colspan="3"> Wyszczególnienie</td>    <td class="center borderAll"> Liczba</td>
</tr>
 <tr>    <td  class="center borderAll" colspan="3">0</td>    <td class="center borderAll">1</td>
</tr>
  <tr>
    <td  class="borderAll wciecie" rowspan="3">Zobowiązano rodziców (opiekuna) do</td>
    <td  class="borderAll wciecie">Poprawy określonych warunków nieletniego</td>
  <td  class="borderAll col_36">1</td>
    <td  class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.5!1!4')"><asp:Label CssClass="normal" ID="tab_115_w01_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">naprawienia szkody wyrządzonej przez nieletniego</td>
  <td  class="borderAll col_36">2</td>
    <td  class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.5!1!4')"><asp:Label CssClass="normal" ID="tab_115_w02_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">inne</td>
  <td  class="borderAll col_36">3</td>
    <td  class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.5!1!4')"><asp:Label CssClass="normal" ID="tab_115_w03_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
    </table>
 </div>
      
          <br />
          <div id="1.1.6">
              <strong>Dział 1.1.6</strong> Nieletni oczekujący na umieszczenie i umieszczeni
             <table  style="width: 100%; ">
                  <tr>
                      <td class="center borderAll" colspan="4">Wyszczególnienie </td>
                      <td class="center borderAll">Liczba</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="4">0</td>
                      <td class="center borderAll">1</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="3">Liczba nieletnich umieszczonych w zakładach poprawczych (stan w ostatnim dniu okresu sprawozdawczego) (wydane skierowania)</td>
                      <td class="borderAll col_36">1</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.6!1!4')">
                          <asp:Label ID="tab_1_1_6_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="8">Liczba nieletnich
                          <br />
                          oczekujących na umieszczenie
                          <br />
                          (stan w ostatnim dniu
                          <br />
                          okresu sprawozdawczego)</td>
                      <td class="borderAll wciecie" colspan="2">w zakładzie poprawczym</td>
                      <td class="borderAll col_36">2</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.6!1!4')">
                          <asp:Label ID="tab_1_1_6_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="2">w tym oczekujący</td>
                      <td class="borderAll wciecie">w schronisku</td>
                      <td class="borderAll col_36">3</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.6!1!4')">
                          <asp:Label ID="tab_1_1_6_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">na wolności</td>
                      <td class="borderAll col_36">4</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.6!1!4')">
                          <asp:Label ID="tab_1_1_6_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">w instytucji lub organizacji w celu przygotowania do zawodu</td>
                      <td class="borderAll col_36">5</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.6!1!4')">
                          <asp:Label ID="tab_1_1_6_w05_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">w rodzinie zastępczej</td>
                      <td class="borderAll col_36">6</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.6!1!4')">
                          <asp:Label ID="tab_1_1_6_w06_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">w zakładzie leczniczym</td>
                      <td class="borderAll col_36">7</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.6!1!4')">
                          <asp:Label ID="tab_1_1_6_w07_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">w młodzieżowym ośrodku wychowawczym</td>
                      <td class="borderAll col_36">8</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.6!1!4')">
                          <asp:Label ID="tab_1_1_6_w08_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">w domu pomocy społecznej</td>
                      <td class="borderAll col_36">9</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.6!1!4')">
                          <asp:Label ID="tab_1_1_6_w09_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
              </table>
          </div>

          <br />

          <div id="1.1.7">
              <strong>Dział 1.1.7</strong> Sprawy Nw (wykonywane środki wobec nieletnich)
             <table  style="width: 100%; ">
                  <tr>
                      <td class="center borderAll" colspan="2" rowspan="4">Wykonywane środki </td>
                      <td class="center borderAll" rowspan="4">Stan w ostatnim dniu poprze-dniego okresu sprawoz-dawczego </td>
                      <td class="center borderAll" rowspan="4">Przybyło</td>
                      <td class="center borderAll" colspan="10">U B Y Ł O&nbsp;&nbsp; Z&nbsp;&nbsp; P O W O D U</td>
                      <td class="center borderAll" rowspan="4">Stan w ostatnim dniu okresu sprawoz-dawczego</td>
                      <td class="center borderAll" rowspan="4">Wykony-wane środki</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" rowspan="3">ogółem (rubr. 4 do 12) </td>
                      <td class="center borderAll" rowspan="3">uchylenia środka</td>
                      <td class="center borderAll" rowspan="3">upływu wieku</td>
                      <td class="center borderAll" colspan="2">odwołania warunkowego </td>
                      <td class="center borderAll" colspan="2">orzeczenia</td>
                      <td class="center borderAll" rowspan="3">zmiany rodzaju środka</td>
                      <td class="center borderAll" rowspan="3">przekazania innemu sądowi</td>
                      <td class="center borderAll" rowspan="3">innego</td>
                  </tr>
                  <tr>
                      <td class="center borderAll">zawieszenia</td>
                      <td class="center borderAll">zwolnienia</td>
                      <td class="center borderAll" rowspan="2">zakładu poprawczego</td>
                      <td class="center borderAll" rowspan="2">kary</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="2">zakładu poprawczego</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="2">0</td>
                      <td class="center borderAll">1</td>
                      <td class="center borderAll">2</td>
                      <td class="center borderAll">3</td>
                      <td class="center borderAll">4</td>
                      <td class="center borderAll">5</td>
                      <td class="center borderAll">6</td>
                      <td class="center borderAll">7</td>
                      <td class="center borderAll">8</td>
                      <td class="center borderAll">9</td>
                      <td class="center borderAll">10</td>
                      <td class="center borderAll">11</td>
                      <td class="center borderAll">12</td>
                      <td class="center borderAll">13</td>
                      <td class="center borderAll">14</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Zobowiązanie do określonego postępowania</td>
                      <td class="borderAll col_36">1</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7!1!4')">
                          <asp:Label ID="tab_1_1_7_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7!2!4')">
                          <asp:Label ID="tab_1_1_7_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7!3!4')">
                          <asp:Label ID="tab_1_1_7_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7!4!4')">
                          <asp:Label ID="tab_1_1_7_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7!5!4')">
                          <asp:Label ID="tab_1_1_7_w01_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7!6!4')">
                          <asp:Label ID="tab_1_1_7_w01_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7!7!4')">
                          <asp:Label ID="tab_1_1_7_w01_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7!8!4')">
                          <asp:Label ID="tab_1_1_7_w01_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7!9!4')">
                          <asp:Label ID="tab_1_1_7_w01_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7!10!4')">
                          <asp:Label ID="tab_1_1_7_w01_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7!11!4')">
                          <asp:Label ID="tab_1_1_7_w01_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7!12!4')">
                          <asp:Label ID="tab_1_1_7_w01_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7!13!4')">
                          <asp:Label ID="tab_1_1_7_w01_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7!14!4')">
                          <asp:Label ID="tab_1_1_7_w01_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Nadzór odpowiedzialny rodziców lub opiekunów</td>
                      <td class="borderAll col_36">2</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7!1!4')">
                          <asp:Label ID="tab_1_1_7_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7!2!4')">
                          <asp:Label ID="tab_1_1_7_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7!3!4')">
                          <asp:Label ID="tab_1_1_7_w02_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7!4!4')">
                          <asp:Label ID="tab_1_1_7_w02_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7!5!4')">
                          <asp:Label ID="tab_1_1_7_w02_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7!6!4')">
                          <asp:Label ID="tab_1_1_7_w02_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7!7!4')">
                          <asp:Label ID="tab_1_1_7_w02_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7!8!4')">
                          <asp:Label ID="tab_1_1_7_w02_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7!9!4')">
                          <asp:Label ID="tab_1_1_7_w02_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7!10!4')">
                          <asp:Label ID="tab_1_1_7_w02_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7!11!4')">
                          <asp:Label ID="tab_1_1_7_w02_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7!12!4')">
                          <asp:Label ID="tab_1_1_7_w02_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7!13!4')">
                          <asp:Label ID="tab_1_1_7_w02_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7!14!4')">
                          <asp:Label ID="tab_1_1_7_w02_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Nadzór organizacji, zakładu pracy, osoby godnej zaufania</td>
                      <td class="borderAll col_36">3</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7!1!4')">
                          <asp:Label ID="tab_1_1_7_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7!2!4')">
                          <asp:Label ID="tab_1_1_7_w03_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7!3!4')">
                          <asp:Label ID="tab_1_1_7_w03_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7!4!4')">
                          <asp:Label ID="tab_1_1_7_w03_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7!5!4')">
                          <asp:Label ID="tab_1_1_7_w03_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7!6!4')">
                          <asp:Label ID="tab_1_1_7_w03_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7!7!4')">
                          <asp:Label ID="tab_1_1_7_w03_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7!8!4')">
                          <asp:Label ID="tab_1_1_7_w03_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7!9!4')">
                          <asp:Label ID="tab_1_1_7_w03_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7!10!4')">
                          <asp:Label ID="tab_1_1_7_w03_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7!11!4')">
                          <asp:Label ID="tab_1_1_7_w03_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7!12!4')">
                          <asp:Label ID="tab_1_1_7_w03_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7!13!4')">
                          <asp:Label ID="tab_1_1_7_w03_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7!14!4')">
                          <asp:Label ID="tab_1_1_7_w03_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Nadzór kuratora</td>
                      <td class="borderAll col_36">4</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7!1!4')">
                          <asp:Label ID="tab_1_1_7_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7!2!4')">
                          <asp:Label ID="tab_1_1_7_w04_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7!3!4')">
                          <asp:Label ID="tab_1_1_7_w04_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7!4!4')">
                          <asp:Label ID="tab_1_1_7_w04_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7!5!4')">
                          <asp:Label ID="tab_1_1_7_w04_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7!6!4')">
                          <asp:Label ID="tab_1_1_7_w04_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7!7!4')">
                          <asp:Label ID="tab_1_1_7_w04_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7!8!4')">
                          <asp:Label ID="tab_1_1_7_w04_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7!9!4')">
                          <asp:Label ID="tab_1_1_7_w04_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7!10!4')">
                          <asp:Label ID="tab_1_1_7_w04_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7!11!4')">
                          <asp:Label ID="tab_1_1_7_w04_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7!12!4')">
                          <asp:Label ID="tab_1_1_7_w04_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7!13!4')">
                          <asp:Label ID="tab_1_1_7_w04_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7!14!4')">
                          <asp:Label ID="tab_1_1_7_w04_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Skierowanie do ośrodka kuratorskiego </td>
                      <td class="borderAll col_36">5</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7!1!4')">
                          <asp:Label ID="tab_1_1_7_w05_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7!2!4')">
                          <asp:Label ID="tab_1_1_7_w05_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7!3!4')">
                          <asp:Label ID="tab_1_1_7_w05_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7!4!4')">
                          <asp:Label ID="tab_1_1_7_w05_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7!5!4')">
                          <asp:Label ID="tab_1_1_7_w05_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7!6!4')">
                          <asp:Label ID="tab_1_1_7_w05_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7!7!4')">
                          <asp:Label ID="tab_1_1_7_w05_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7!8!4')">
                          <asp:Label ID="tab_1_1_7_w05_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7!9!4')">
                          <asp:Label ID="tab_1_1_7_w05_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7!10!4')">
                          <asp:Label ID="tab_1_1_7_w05_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7!11!4')">
                          <asp:Label ID="tab_1_1_7_w05_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7!12!4')">
                          <asp:Label ID="tab_1_1_7_w05_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7!13!4')">
                          <asp:Label ID="tab_1_1_7_w05_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7!14!4')">
                          <asp:Label ID="tab_1_1_7_w05_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
              </table>
          </div>
          <br />
          <div id="1.1.7.b">
              <strong>Dział 1.1.7.b</strong> Sprawy Nw (wykonywane środki wobec nieletnich)
             <table  style="width: 100%; ">
                  <tr>
                      <td class="center borderAll" colspan="2" rowspan="2">Wykonywane środki – umieszczenie w </td>
                      <td class="center borderAll" rowspan="2">Stan w ostatnim dniu poprze-dniego okresu sprawoz-dawczego </td>
                      <td class="center borderAll" rowspan="2">Przybyło</td>
                      <td class="center borderAll" colspan="8">U B Y Ł O Z P O W O D U</td>
                      <td class="center borderAll" rowspan="2">Stan w ostatnim dniu okresu sprawoz-dawczego</td>
                      <td class="center borderAll" rowspan="2">Wykony-wane środki</td>
                  </tr>
                  <tr>
                      <td class="center borderAll">ogółem</td>
                      <td class="center borderAll">warunkowego zwolnienia</td>
                      <td class="center borderAll">zmiany lub uchylenia środka</td>
                      <td class="center borderAll">zwolnienia z powodu upływu wieku</td>
                      <td class="center borderAll">umieszczenia w zakładzie poprawczym</td>
                      <td class="center borderAll">orzeczenia kary</td>
                      <td class="center borderAll">orzeczenia kary przekazania innemu sądowi</td>
                      <td class="center borderAll">innego</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="2">0</td>
                      <td class="center borderAll">1</td>
                      <td class="center borderAll">2</td>
                      <td class="center borderAll">3</td>
                      <td class="center borderAll">4</td>
                      <td class="center borderAll">5</td>
                      <td class="center borderAll">6</td>
                      <td class="center borderAll">7</td>
                      <td class="center borderAll">8</td>
                      <td class="center borderAll">9</td>
                      <td class="center borderAll">10</td>
                      <td class="center borderAll">11</td>
                      <td class="center borderAll">12</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">instytucji lub organizacji do przygotowania zawodowego</td>
                      <td class="borderAll col_36">1</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.b!1!4')">
                          <asp:Label ID="tab_1_1_7_b_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.b!2!4')">
                          <asp:Label ID="tab_1_1_7_b_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.b!3!4')">
                          <asp:Label ID="tab_1_1_7_b_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.b!4!4')">
                          <asp:Label ID="tab_1_1_7_b_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.b!5!4')">
                          <asp:Label ID="tab_1_1_7_b_w01_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.b!6!4')">
                          <asp:Label ID="tab_1_1_7_b_w01_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.b!7!4')">
                          <asp:Label ID="tab_1_1_7_b_w01_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.b!8!4')">
                          <asp:Label ID="tab_1_1_7_b_w01_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.b!9!4')">
                          <asp:Label ID="tab_1_1_7_b_w01_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.b!10!4')">
                          <asp:Label ID="tab_1_1_7_b_w01_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.b!11!4')">
                          <asp:Label ID="tab_1_1_7_b_w01_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.b!12!4')">
                          <asp:Label ID="tab_1_1_7_b_w01_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">rodzinie zastępczej</td>
                      <td class="borderAll col_36">2</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7.b!1!4')">
                          <asp:Label ID="tab_1_1_7_b_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7.b!2!4')">
                          <asp:Label ID="tab_1_1_7_b_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7.b!3!4')">
                          <asp:Label ID="tab_1_1_7_b_w02_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7.b!4!4')">
                          <asp:Label ID="tab_1_1_7_b_w02_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7.b!5!4')">
                          <asp:Label ID="tab_1_1_7_b_w02_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7.b!6!4')">
                          <asp:Label ID="tab_1_1_7_b_w02_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7.b!7!4')">
                          <asp:Label ID="tab_1_1_7_b_w02_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7.b!8!4')">
                          <asp:Label ID="tab_1_1_7_b_w02_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7.b!9!4')">
                          <asp:Label ID="tab_1_1_7_b_w02_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7.b!10!4')">
                          <asp:Label ID="tab_1_1_7_b_w02_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7.b!11!4')">
                          <asp:Label ID="tab_1_1_7_b_w02_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.7.b!12!4')">
                          <asp:Label ID="tab_1_1_7_b_w02_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">młodzieżowym ośrodku wychowawczym</td>
                      <td class="borderAll col_36">3</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7.b!1!4')">
                          <asp:Label ID="tab_1_1_7_b_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7.b!2!4')">
                          <asp:Label ID="tab_1_1_7_b_w03_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7.b!3!4')">
                          <asp:Label ID="tab_1_1_7_b_w03_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7.b!4!4')">
                          <asp:Label ID="tab_1_1_7_b_w03_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7.b!5!4')">
                          <asp:Label ID="tab_1_1_7_b_w03_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7.b!6!4')">
                          <asp:Label ID="tab_1_1_7_b_w03_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7.b!7!4')">
                          <asp:Label ID="tab_1_1_7_b_w03_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7.b!8!4')">
                          <asp:Label ID="tab_1_1_7_b_w03_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7.b!9!4')">
                          <asp:Label ID="tab_1_1_7_b_w03_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7.b!10!4')">
                          <asp:Label ID="tab_1_1_7_b_w03_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7.b!11!4')">
                          <asp:Label ID="tab_1_1_7_b_w03_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.7.b!12!4')">
                          <asp:Label ID="tab_1_1_7_b_w03_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">młodzieżowym ośrodku socjoterapii</td>
                      <td class="borderAll col_36">4</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7.b!1!4')">
                          <asp:Label ID="tab_1_1_7_b_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7.b!2!4')">
                          <asp:Label ID="tab_1_1_7_b_w04_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7.b!3!4')">
                          <asp:Label ID="tab_1_1_7_b_w04_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7.b!4!4')">
                          <asp:Label ID="tab_1_1_7_b_w04_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7.b!5!4')">
                          <asp:Label ID="tab_1_1_7_b_w04_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7.b!6!4')">
                          <asp:Label ID="tab_1_1_7_b_w04_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7.b!7!4')">
                          <asp:Label ID="tab_1_1_7_b_w04_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7.b!8!4')">
                          <asp:Label ID="tab_1_1_7_b_w04_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7.b!9!4')">
                          <asp:Label ID="tab_1_1_7_b_w04_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7.b!10!4')">
                          <asp:Label ID="tab_1_1_7_b_w04_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7.b!11!4')">
                          <asp:Label ID="tab_1_1_7_b_w04_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.7.b!12!4')">
                          <asp:Label ID="tab_1_1_7_b_w04_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">zakładzie poprawczym</td>
                      <td class="borderAll col_36">5</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.b!1!4')">
                          <asp:Label ID="tab_1_1_7_b_w05_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.b!2!4')">
                          <asp:Label ID="tab_1_1_7_b_w05_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.b!3!4')">
                          <asp:Label ID="tab_1_1_7_b_w05_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.b!4!4')">
                          <asp:Label ID="tab_1_1_7_b_w05_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.b!5!4')">
                          <asp:Label ID="tab_1_1_7_b_w05_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.b!6!4')">
                          <asp:Label ID="tab_1_1_7_b_w05_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.b!7!4')">
                          <asp:Label ID="tab_1_1_7_b_w05_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.b!8!4')">
                          <asp:Label ID="tab_1_1_7_b_w05_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.b!9!4')">
                          <asp:Label ID="tab_1_1_7_b_w05_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.b!10!4')">
                          <asp:Label ID="tab_1_1_7_b_w05_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.b!11!4')">
                          <asp:Label ID="tab_1_1_7_b_w05_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.7.b!12!4')">
                          <asp:Label ID="tab_1_1_7_b_w05_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">zakładzie leczniczym lub innym odpowiednim zakładzie</td>
                      <td class="borderAll col_36">6</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.7.b!1!4')">
                          <asp:Label ID="tab_1_1_7_b_w06_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.7.b!2!4')">
                          <asp:Label ID="tab_1_1_7_b_w06_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.7.b!3!4')">
                          <asp:Label ID="tab_1_1_7_b_w06_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.7.b!4!4')">
                          <asp:Label ID="tab_1_1_7_b_w06_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.7.b!5!4')">
                          <asp:Label ID="tab_1_1_7_b_w06_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.7.b!6!4')">
                          <asp:Label ID="tab_1_1_7_b_w06_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.7.b!7!4')">
                          <asp:Label ID="tab_1_1_7_b_w06_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.7.b!8!4')">
                          <asp:Label ID="tab_1_1_7_b_w06_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.7.b!9!4')">
                          <asp:Label ID="tab_1_1_7_b_w06_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.7.b!10!4')">
                          <asp:Label ID="tab_1_1_7_b_w06_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.7.b!11!4')">
                          <asp:Label ID="tab_1_1_7_b_w06_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.7.b!12!4')">
                          <asp:Label ID="tab_1_1_7_b_w06_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
              </table>
          </div>
          <br />
          <br />
      <div id='1.1.7.c' class="page-break">
 <br />
 <strong> Dział 1.1.7.c</strong>  Liczba spraw Nw
    <table  style="width: 100%; ">
 <tr>    <td  class="center borderAll" colspan="2"> Wyszczególnienie</td>    <td class="borderAll center "> Liczba spraw ogółem *)</td>
<td class="borderAll center ">Stan w ostatnim dniu poprzedniego okresu sprawozdawczego</td>
<td class="borderAll center ">Przybyło</td>
<td class="borderAll center ">Ubyło</td>
<td class="borderAll center ">Stan w ostatnim dniu okresu sprawozdawczego</td>
</tr>
 <tr>    <td  class="center borderAll" colspan="2">0</td>    <td class="borderAll center ">1</td>
<td class="borderAll center ">2</td>
<td class="borderAll center ">3</td>
<td class="borderAll center ">4</td>
<td class="borderAll center ">5</td>
</tr>
  <tr>
    <td  class="borderAll col_150">Sprawy Nw</td>
  <td  class="borderAll col_36">1</td>
    <td  class="borderAll center col_180"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.c!1!4')"><asp:Label CssClass="normal" ID="tab_117c_w01_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="borderAll center col_180"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.c!2!4')"><asp:Label CssClass="normal" ID="tab_117c_w01_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="borderAll center col_180"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.c!3!4')"><asp:Label CssClass="normal" ID="tab_117c_w01_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="borderAll center col_180"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.c!4!4')"><asp:Label CssClass="normal" ID="tab_117c_w01_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="borderAll center col_180"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.7.c!5!4')"><asp:Label CssClass="normal" ID="tab_117c_w01_c05" runat="server" Text="0"></asp:Label></a></td>
  </tr>
    </table>
              *) Liczba postępowań wykonawczych prowadzonych w stosunku do danego nieletniego – pozostających w toku
 </div>
<br />
        <div id="1.1.8" class="page-break">
              <strong>Dział 1.1.8</strong> Ośrodki kuratorskie
              <table style="width: 100%">
                  <tr>
                      <td class="center borderAll" colspan="4">Wyszczególnienie</td>
                      <td class="borderAll col_150 center">Liczba</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="4">0</td>
                      <td class="borderAll col_150 center">1</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="4">Ośrodki</td>
                      <td class="borderAll wciecie" colspan="2">stan w ostatnim dniu poprzedniego okresu sprawozdawczego </td>
                      <td class="borderAll col_36">1</td>
                      <td class="borderAll col_150 center"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.8!1!4')">
                          <asp:Label ID="tab_1_1_1_8_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="2">w okresie sprawozdawczym</td>
                      <td class="borderAll wciecie">przybyło</td>
                      <td class="borderAll col_36">2</td>
                      <td class="borderAll col_150 center"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.8!1!4')">
                          <asp:Label ID="tab_1_1_1_8_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">ubyło</td>
                      <td class="borderAll col_36">3</td>
                      <td class="borderAll col_150 center"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.8!1!4')">
                          <asp:Label ID="tab_1_1_1_8_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">stan w ostatnim dniu okresu sprawozdawczego</td>
                      <td class="borderAll col_36">4</td>
                      <td class="borderAll col_150 center"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.8!1!4')">
                          <asp:Label ID="tab_1_1_1_8_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="2">Nieletni</td>
                      <td class="borderAll wciecie" colspan="2">ogółem (stan w ostatnim dniu okresu sprawozdawczego)</td>
                      <td class="borderAll col_36">5</td>
                      <td class="borderAll col_150 center"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.8!1!4')">
                          <asp:Label ID="tab_1_1_1_8_w05_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">w tym ze spraw Nw</td>
                      <td class="borderAll col_36">6</td>
                      <td class="borderAll col_150 center"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.8!1!4')">
                          <asp:Label ID="tab_1_1_1_8_w06_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
              </table>
          </div>
       <br />

          <div id="1.1.9" class="page-break">
              <strong>Dział 1.1.9</strong> Posiedzenia wykonawcze
             <table  style="width: 100%; ">
                  <tr>
                      <td class="center borderAll" colspan="2" rowspan="2">Wyszczególnienie</td>
                      <td class="center borderAll" colspan="5">Liczba spraw, w których</td>
                  </tr>
                  <tr>
                      <td class="center borderAll">Ogółem (rubr. 2 do 5) </td>
                      <td class="center borderAll">wydano orzeczenie wykonawcze (merytoryczne)</td>
                      <td class="center borderAll">wykonano czynności kontrolne</td>
                      <td class="center borderAll">podjęto czynności lub działania pozaorzecznicze poza sądem</td>
                      <td class="center borderAll">inne</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="2">0</td>
                      <td class="center borderAll">1</td>
                      <td class="center borderAll">2</td>
                      <td class="center borderAll">3</td>
                      <td class="center borderAll">4</td>
                      <td class="center borderAll">5</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Sprawy załatwione na posiedzeniach wykonawczych (w. 2 do 4)</td>
                      <td class="borderAll col_36">1</td>
                      <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.9!1!4')">
                          <asp:Label ID="tab_1_1_9_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.9!2!4')">
                          <asp:Label ID="tab_1_1_9_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.9!3!4')">
                          <asp:Label ID="tab_1_1_9_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.9!4!4')">
                          <asp:Label ID="tab_1_1_9_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.9!5!4')">
                          <asp:Label ID="tab_1_1_9_w01_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">nieletnich</td>
                      <td class="borderAll col_36">2</td>
                      <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.9!1!4')">
                          <asp:Label ID="tab_1_1_9_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.9!2!4')">
                          <asp:Label ID="tab_1_1_9_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.9!3!4')">
                          <asp:Label ID="tab_1_1_9_w02_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.9!4!4')">
                          <asp:Label ID="tab_1_1_9_w02_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.9!5!4')">
                          <asp:Label ID="tab_1_1_9_w02_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">małoletnich</td>
                      <td class="borderAll col_36">3</td>
                      <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.9!1!4')">
                          <asp:Label ID="tab_1_1_9_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.9!2!4')">
                          <asp:Label ID="tab_1_1_9_w03_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.9!3!4')">
                          <asp:Label ID="tab_1_1_9_w03_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.9!4!4')">
                          <asp:Label ID="tab_1_1_9_w03_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.9!5!4')">
                          <asp:Label ID="tab_1_1_9_w03_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">dorosłych</td>
                      <td class="borderAll col_36">4</td>
                      <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.9!1!4')">
                          <asp:Label ID="tab_1_1_9_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.9!2!4')">
                          <asp:Label ID="tab_1_1_9_w04_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.9!3!4')">
                          <asp:Label ID="tab_1_1_9_w04_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.9!4!4')">
                          <asp:Label ID="tab_1_1_9_w04_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.9!5!4')">
                          <asp:Label ID="tab_1_1_9_w04_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Liczba posiedzeń</td>
                      <td class="borderAll col_36">5</td>
                      <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.9!1!4')">
                          <asp:Label ID="tab_1_1_9_w05_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.9!2!4')">
                          <asp:Label ID="tab_1_1_9_w05_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.9!3!4')">
                          <asp:Label ID="tab_1_1_9_w05_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.9!4!4')">
                          <asp:Label ID="tab_1_1_9_w05_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_180 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.9!5!4')">
                          <asp:Label ID="tab_1_1_9_w05_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
              </table>
          </div>
          <br />
        <div id='Ustanowienie pełnomocnika / obrońcy z urzędu' class="page-break">
 <br />
 <strong> Dział 1.1.10 </strong>
            Ustanowienie pełnomocnika / obrońcy z urzędu
    <table  style="width: 100%; ">
 <tr>    <td  class="center borderAll" colspan="2"> Repertorium lub wykaz</td>    <td class="center borderAll"> Liczba spraw w których doszło do ustanowienia pełnomocnika z urzędu (radca prawny, adwokat)</td>
<td class="center borderAll">Liczba ustanowionych pełnomocników z urzędu (radca prawny, adwokat) </td>
<td class="center borderAll">W tym liczba wyznaczonych pełnomocników w wyniku zwolnienia poprzedniego pełnomocnika </td>
</tr>
 <tr>    <td  class="center borderAll" colspan="2">0</td>    <td class="center borderAll">1</td>
<td class="center borderAll">2</td>
<td class="center borderAll">3</td>
</tr>
   <tr>
    <td  class="borderAll  col_60 wciecie">RC</td>
  <td  class="borderAll col_36">1</td>
    <td  class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.10!1!4')"><asp:Label CssClass="normal" ID="Label8" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.10!2!4')"><asp:Label CssClass="normal" ID="Label10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.10!3!4')"><asp:Label CssClass="normal" ID="Label12" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll  col_60 wciecie">RNc</td>
  <td  class="borderAll col_36">2</td>
    <td  class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.10!1!4')"><asp:Label CssClass="normal" ID="tab_1110_w02_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.10!2!4')"><asp:Label CssClass="normal" ID="tab_1110_w02_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.10!3!4')"><asp:Label CssClass="normal" ID="tab_1110_w02_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll  col_60 wciecie">Nsm</td>
  <td  class="borderAll col_36">3</td>
    <td  class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.10!1!4')"><asp:Label CssClass="normal" ID="tab_1110_w03_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.10!2!4')"><asp:Label CssClass="normal" ID="tab_1110_w03_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.10!3!4')"><asp:Label CssClass="normal" ID="tab_1110_w03_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll  col_60 wciecie">Nkd</td>
  <td  class="borderAll col_36">4</td>
    <td  class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.10!1!4')"><asp:Label CssClass="normal" ID="tab_1110_w04_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.10!2!4')"><asp:Label CssClass="normal" ID="tab_1110_w04_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.10!3!4')"><asp:Label CssClass="normal" ID="tab_1110_w04_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
    </table>
 </div>

       <br />
          <h4><span lang="PL">Sprawy z zakresu spraw cywilnych rodzinnych i nieletnich – część wspólna<o:p></o:p></span></h4>
          <br />
        

 <div id='1.2.a' class="page-break">
 <br />
     <strong>Dział 1.2.a.</strong> Struktura wpływu spraw<table  style="width: 100%; ">
 <tr>
     <td  class="center borderAll" colspan="4" rowspan="3"> Wyszczególnienie</td>    <td class="center borderAll" colspan="7"> Repertorium / wykaz</td>
</tr>
 <tr>    <td class="center borderAll" rowspan="2"> Ogółem</td>
<td class="center borderAll" colspan="6">w tym</td>
</tr>
 <tr>
<td class="center borderAll">RC</td>
<td class="center borderAll">RNs</td>
<td class="center borderAll">Nsm</td>
<td class="center borderAll">RCo</td>
<td class="center borderAll">Nmo</td>
<td class="center borderAll">Nkd</td>
</tr>
 <tr>    <td  class="center borderAll" colspan="4">0</td>    <td class="center borderAll">1</td>
<td class="center borderAll">2</td>
<td class="center borderAll">3</td>
<td class="center borderAll">4</td>
<td class="center borderAll">5</td>
<td class="center borderAll">6</td>
<td class="center borderAll">7</td>
</tr>
  <tr>
    <td  class="borderAll wciecie" colspan="3">Pozostało z ubiegłego roku (w.01 = dz.1.1.1. kol.1 i dz. 1.1.2. kol.1 odpowiednie wiersze)</td>
  <td  class="borderAll col_36">1</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.a!1!4')"><asp:Label CssClass="normal" ID="tab_12a_w01_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.a!2!4')"><asp:Label CssClass="normal" ID="tab_12a_w01_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.a!3!4')"><asp:Label CssClass="normal" ID="tab_12a_w01_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.a!4!4')"><asp:Label CssClass="normal" ID="tab_12a_w01_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.a!5!4')"><asp:Label CssClass="normal" ID="tab_12a_w01_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.a!6!4')"><asp:Label CssClass="normal" ID="tab_12a_w01_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.a!7!4')"><asp:Label CssClass="normal" ID="tab_12a_w01_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="3">Wpłynęło ogółem (w.02 = dz.1.1.1. kol.2 + dz. 1.1.2. kol.2 odpowiednie wiersze = w.03+22) </td>
  <td  class="borderAll col_36">2</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.a!1!4')"><asp:Label CssClass="normal" ID="tab_12a_w02_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.a!2!4')"><asp:Label CssClass="normal" ID="tab_12a_w02_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.a!3!4')"><asp:Label CssClass="normal" ID="tab_12a_w02_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.a!4!4')"><asp:Label CssClass="normal" ID="tab_12a_w02_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.a!5!4')"><asp:Label CssClass="normal" ID="tab_12a_w02_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.a!6!4')"><asp:Label CssClass="normal" ID="tab_12a_w02_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.a!7!4')"><asp:Label CssClass="normal" ID="tab_12a_w02_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="verticaltext borderAll wciecie " rowspan="19">W tym ponownie wpisane</td>
    <td  class="borderAll wciecie" colspan="2">razem (w.03 = w.04 do 21)</td>
  <td  class="borderAll col_36">3</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.a!1!4')"><asp:Label CssClass="normal" ID="tab_12a_w03_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.a!2!4')"><asp:Label CssClass="normal" ID="tab_12a_w03_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.a!3!4')"><asp:Label CssClass="normal" ID="tab_12a_w03_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.a!4!4')"><asp:Label CssClass="normal" ID="tab_12a_w03_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.a!5!4')"><asp:Label CssClass="normal" ID="tab_12a_w03_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.a!6!4')"><asp:Label CssClass="normal" ID="tab_12a_w03_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.a!7!4')"><asp:Label CssClass="normal" ID="tab_12a_w03_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">zwrot pozwu/wniosku/skargi (art. 130 kpc)</td>
  <td  class="borderAll col_36">4</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.a!1!4')"><asp:Label CssClass="normal" ID="tab_12a_w04_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.a!2!4')"><asp:Label CssClass="normal" ID="tab_12a_w04_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.a!3!4')"><asp:Label CssClass="normal" ID="tab_12a_w04_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.a!4!4')"><asp:Label CssClass="normal" ID="tab_12a_w04_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.a!5!4')"><asp:Label CssClass="normal" ID="tab_12a_w04_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.a!6!4')"><asp:Label CssClass="normal" ID="tab_12a_w04_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.a!7!4')"><asp:Label CssClass="normal" ID="tab_12a_w04_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">zwrot pozwu/wniosku/skargi (art. 1301 kpc)</td>
  <td  class="borderAll col_36">5</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.a!1!4')"><asp:Label CssClass="normal" ID="tab_12a_w05_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.a!2!4')"><asp:Label CssClass="normal" ID="tab_12a_w05_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.a!3!4')"><asp:Label CssClass="normal" ID="tab_12a_w05_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.a!4!4')"><asp:Label CssClass="normal" ID="tab_12a_w05_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.a!5!4')"><asp:Label CssClass="normal" ID="tab_12a_w05_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.a!6!4')"><asp:Label CssClass="normal" ID="tab_12a_w05_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.a!7!4')"><asp:Label CssClass="normal" ID="tab_12a_w05_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">przekazanie z innych jednostek na podstawie art. 200§1 kpc (z wyjątkiem zmian organizacyjnych)</td>
  <td  class="borderAll col_36">6</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.a!1!4')"><asp:Label CssClass="normal" ID="tab_12a_w06_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.a!2!4')"><asp:Label CssClass="normal" ID="tab_12a_w06_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.a!3!4')"><asp:Label CssClass="normal" ID="tab_12a_w06_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.a!4!4')"><asp:Label CssClass="normal" ID="tab_12a_w06_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.a!5!4')"><asp:Label CssClass="normal" ID="tab_12a_w06_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.a!6!4')"><asp:Label CssClass="normal" ID="tab_12a_w06_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.a!7!4')"><asp:Label CssClass="normal" ID="tab_12a_w06_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">wyłączenie roszczenia do odrębnego rozpoznania – poprzednio połączonej na podstawie art. 219 kpc</td>
  <td  class="borderAll col_36">7</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.a!1!4')"><asp:Label CssClass="normal" ID="tab_12a_w07_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.a!2!4')"><asp:Label CssClass="normal" ID="tab_12a_w07_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.a!3!4')"><asp:Label CssClass="normal" ID="tab_12a_w07_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.a!4!4')"><asp:Label CssClass="normal" ID="tab_12a_w07_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.a!5!4')"><asp:Label CssClass="normal" ID="tab_12a_w07_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.a!6!4')"><asp:Label CssClass="normal" ID="tab_12a_w07_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.a!7!4')"><asp:Label CssClass="normal" ID="tab_12a_w07_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">wyłączenie roszczenia do odrębnego rozpoznania (z wyłączeniem wiersza 07)</td>
  <td  class="borderAll col_36">8</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.a!1!4')"><asp:Label CssClass="normal" ID="tab_12a_w08_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.a!2!4')"><asp:Label CssClass="normal" ID="tab_12a_w08_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.a!3!4')"><asp:Label CssClass="normal" ID="tab_12a_w08_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.a!4!4')"><asp:Label CssClass="normal" ID="tab_12a_w08_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.a!5!4')"><asp:Label CssClass="normal" ID="tab_12a_w08_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.a!6!4')"><asp:Label CssClass="normal" ID="tab_12a_w08_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.a!7!4')"><asp:Label CssClass="normal" ID="tab_12a_w08_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">sprawy zawieszone, które podjęto</td>
  <td  class="borderAll col_36">9</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.a!1!4')"><asp:Label CssClass="normal" ID="tab_12a_w09_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.a!2!4')"><asp:Label CssClass="normal" ID="tab_12a_w09_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.a!3!4')"><asp:Label CssClass="normal" ID="tab_12a_w09_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.a!4!4')"><asp:Label CssClass="normal" ID="tab_12a_w09_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.a!5!4')"><asp:Label CssClass="normal" ID="tab_12a_w09_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.a!6!4')"><asp:Label CssClass="normal" ID="tab_12a_w09_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.a!7!4')"><asp:Label CssClass="normal" ID="tab_12a_w09_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">przekazano sprawy w ramach sądu pomiędzy wydziałami tego samego pionu</td>
  <td  class="borderAll col_36">10</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.a!1!4')"><asp:Label CssClass="normal" ID="tab_12a_w10_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.a!2!4')"><asp:Label CssClass="normal" ID="tab_12a_w10_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.a!3!4')"><asp:Label CssClass="normal" ID="tab_12a_w10_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.a!4!4')"><asp:Label CssClass="normal" ID="tab_12a_w10_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.a!5!4')"><asp:Label CssClass="normal" ID="tab_12a_w10_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.a!6!4')"><asp:Label CssClass="normal" ID="tab_12a_w10_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.a!7!4')"><asp:Label CssClass="normal" ID="tab_12a_w10_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">przekazano sprawy w ramach sądu pomiędzy wydziałami różnych pionów</td>
  <td  class="borderAll col_36">11</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.a!1!4')"><asp:Label CssClass="normal" ID="tab_12a_w11_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.a!2!4')"><asp:Label CssClass="normal" ID="tab_12a_w11_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.a!3!4')"><asp:Label CssClass="normal" ID="tab_12a_w11_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.a!4!4')"><asp:Label CssClass="normal" ID="tab_12a_w11_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.a!5!4')"><asp:Label CssClass="normal" ID="tab_12a_w11_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.a!6!4')"><asp:Label CssClass="normal" ID="tab_12a_w11_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.a!7!4')"><asp:Label CssClass="normal" ID="tab_12a_w11_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">po uchyleniu orzeczenia i przekazaniu sprawy do ponownego rozpoznania </td>
  <td  class="borderAll col_36">12</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.a!1!4')"><asp:Label CssClass="normal" ID="tab_12a_w12_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.a!2!4')"><asp:Label CssClass="normal" ID="tab_12a_w12_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.a!3!4')"><asp:Label CssClass="normal" ID="tab_12a_w12_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.a!4!4')"><asp:Label CssClass="normal" ID="tab_12a_w12_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.a!5!4')"><asp:Label CssClass="normal" ID="tab_12a_w12_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.a!6!4')"><asp:Label CssClass="normal" ID="tab_12a_w12_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.a!7!4')"><asp:Label CssClass="normal" ID="tab_12a_w12_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">w wyniku zmian zarządzenia MS o biurowości</td>
  <td  class="borderAll col_36">13</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.a!1!4')"><asp:Label CssClass="normal" ID="tab_12a_w13_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.a!2!4')"><asp:Label CssClass="normal" ID="tab_12a_w13_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.a!3!4')"><asp:Label CssClass="normal" ID="tab_12a_w13_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.a!4!4')"><asp:Label CssClass="normal" ID="tab_12a_w13_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.a!5!4')"><asp:Label CssClass="normal" ID="tab_12a_w13_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.a!6!4')"><asp:Label CssClass="normal" ID="tab_12a_w13_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.a!7!4')"><asp:Label CssClass="normal" ID="tab_12a_w13_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" rowspan="2">zmiany organizacyjne związane z utworzeniem lub likwidacją </td>
    <td  class="borderAll wciecie">wydziału (łów) / sekcji </td>
  <td  class="borderAll col_36">14</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.a!1!4')"><asp:Label CssClass="normal" ID="tab_12a_w14_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.a!2!4')"><asp:Label CssClass="normal" ID="tab_12a_w14_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.a!3!4')"><asp:Label CssClass="normal" ID="tab_12a_w14_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.a!4!4')"><asp:Label CssClass="normal" ID="tab_12a_w14_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.a!5!4')"><asp:Label CssClass="normal" ID="tab_12a_w14_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.a!6!4')"><asp:Label CssClass="normal" ID="tab_12a_w14_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.a!7!4')"><asp:Label CssClass="normal" ID="tab_12a_w14_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">sądu (dów)</td>
  <td  class="borderAll col_36">15</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.a!1!4')"><asp:Label CssClass="normal" ID="tab_12a_w15_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.a!2!4')"><asp:Label CssClass="normal" ID="tab_12a_w15_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.a!3!4')"><asp:Label CssClass="normal" ID="tab_12a_w15_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.a!4!4')"><asp:Label CssClass="normal" ID="tab_12a_w15_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.a!5!4')"><asp:Label CssClass="normal" ID="tab_12a_w15_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.a!6!4')"><asp:Label CssClass="normal" ID="tab_12a_w15_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.a!7!4')"><asp:Label CssClass="normal" ID="tab_12a_w15_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" rowspan="2">w związku ze zmianą obszaru właściwości miejscowej</td>
    <td  class="borderAll wciecie">wydziału (łów)</td>
  <td  class="borderAll col_36">16</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.a!1!4')"><asp:Label CssClass="normal" ID="tab_12a_w16_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.a!2!4')"><asp:Label CssClass="normal" ID="tab_12a_w16_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.a!3!4')"><asp:Label CssClass="normal" ID="tab_12a_w16_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.a!4!4')"><asp:Label CssClass="normal" ID="tab_12a_w16_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.a!5!4')"><asp:Label CssClass="normal" ID="tab_12a_w16_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.a!6!4')"><asp:Label CssClass="normal" ID="tab_12a_w16_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.a!7!4')"><asp:Label CssClass="normal" ID="tab_12a_w16_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">sądu (dów)</td>
  <td  class="borderAll col_36">17</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.a!1!4')"><asp:Label CssClass="normal" ID="tab_12a_w17_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.a!2!4')"><asp:Label CssClass="normal" ID="tab_12a_w17_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.a!3!4')"><asp:Label CssClass="normal" ID="tab_12a_w17_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.a!4!4')"><asp:Label CssClass="normal" ID="tab_12a_w17_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.a!5!4')"><asp:Label CssClass="normal" ID="tab_12a_w17_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.a!6!4')"><asp:Label CssClass="normal" ID="tab_12a_w17_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.a!7!4')"><asp:Label CssClass="normal" ID="tab_12a_w17_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">przekazanie z innego trybu na podstawie art. 201§1 i 2 kpc lub do odrębnego postępowania </td>
  <td  class="borderAll col_36">18</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.a!1!4')"><asp:Label CssClass="normal" ID="tab_12a_w18_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.a!2!4')"><asp:Label CssClass="normal" ID="tab_12a_w18_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.a!3!4')"><asp:Label CssClass="normal" ID="tab_12a_w18_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.a!4!4')"><asp:Label CssClass="normal" ID="tab_12a_w18_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.a!5!4')"><asp:Label CssClass="normal" ID="tab_12a_w18_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.a!6!4')"><asp:Label CssClass="normal" ID="tab_12a_w18_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.a!7!4')"><asp:Label CssClass="normal" ID="tab_12a_w18_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" rowspan="2">wpływ spraw</td>
    <td  class="borderAll wciecie">w związku z funkcjonowaniem § 43 Regulaminu</td>
  <td  class="borderAll col_36">19</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.a!1!4')"><asp:Label CssClass="normal" ID="tab_12a_w19_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.a!2!4')"><asp:Label CssClass="normal" ID="tab_12a_w19_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.a!3!4')"><asp:Label CssClass="normal" ID="tab_12a_w19_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.a!4!4')"><asp:Label CssClass="normal" ID="tab_12a_w19_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.a!5!4')"><asp:Label CssClass="normal" ID="tab_12a_w19_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.a!6!4')"><asp:Label CssClass="normal" ID="tab_12a_w19_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.a!7!4')"><asp:Label CssClass="normal" ID="tab_12a_w19_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">w związku ze wspólnym wpływem § 54 ust.2 Regulaminu </td>
  <td  class="borderAll col_36">20</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.a!1!4')"><asp:Label CssClass="normal" ID="tab_12a_w20_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.a!2!4')"><asp:Label CssClass="normal" ID="tab_12a_w20_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.a!3!4')"><asp:Label CssClass="normal" ID="tab_12a_w20_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.a!4!4')"><asp:Label CssClass="normal" ID="tab_12a_w20_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.a!5!4')"><asp:Label CssClass="normal" ID="tab_12a_w20_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.a!6!4')"><asp:Label CssClass="normal" ID="tab_12a_w20_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.a!7!4')"><asp:Label CssClass="normal" ID="tab_12a_w20_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">inne</td>
  <td  class="borderAll col_36">21</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.a!1!4')"><asp:Label CssClass="normal" ID="tab_12a_w21_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.a!2!4')"><asp:Label CssClass="normal" ID="tab_12a_w21_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.a!3!4')"><asp:Label CssClass="normal" ID="tab_12a_w21_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.a!4!4')"><asp:Label CssClass="normal" ID="tab_12a_w21_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.a!5!4')"><asp:Label CssClass="normal" ID="tab_12a_w21_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.a!6!4')"><asp:Label CssClass="normal" ID="tab_12a_w21_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.a!7!4')"><asp:Label CssClass="normal" ID="tab_12a_w21_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="3">Wpływ pozostałych spraw</td>
  <td  class="borderAll col_36">22</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.a!1!4')"><asp:Label CssClass="normal" ID="tab_12a_w22_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.a!2!4')"><asp:Label CssClass="normal" ID="tab_12a_w22_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.a!3!4')"><asp:Label CssClass="normal" ID="tab_12a_w22_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.a!4!4')"><asp:Label CssClass="normal" ID="tab_12a_w22_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.a!5!4')"><asp:Label CssClass="normal" ID="tab_12a_w22_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.a!6!4')"><asp:Label CssClass="normal" ID="tab_12a_w22_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.a!7!4')"><asp:Label CssClass="normal" ID="tab_12a_w22_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
    </table>
 </div>
       <br />
       <div id='Dział 1.2.b. Struktura załatwień spraw' class="page-break">
 <br />
     <strong> Dział 1.2.b. Struktura załatwień spraw</strong>
    <table  style="width: 100%; ">
<tr>
     <td  class="center borderAll" colspan="4" rowspan="3"> Wyszczególnienie</td>    <td class="center borderAll" colspan="7"> Repertorium / wykaz</td>
</tr>
 <tr>    <td class="center borderAll" rowspan="2"> Ogółem</td>
<td class="center borderAll" colspan="6">wtym</td>
</tr>
 <tr>
<td class="center borderAll">RC</td>
<td class="center borderAll">RNs</td>
<td class="center borderAll">Nsm</td>
<td class="center borderAll">RCo</td>
<td class="center borderAll">Nmo</td>
<td class="center borderAll">Nkd</td>
</tr>
 <tr>    <td  class="center borderAll" colspan="4">0</td>    <td class="center borderAll">1</td>
<td class="center borderAll">2</td>
<td class="center borderAll">3</td>
<td class="center borderAll">4</td>
<td class="center borderAll">5</td>
<td class="center borderAll">6</td>
<td class="center borderAll">7</td>
</tr>
  <tr>
    <td  class="borderAll wciecie" colspan="3">Załatwiono ogółem (w.01 = dz.1.1.1. kol.3 + dz. 1.1.2. kol. 4 odpowiednie wiersze = w.02+23)</td>
  <td  class="borderAll col_36">1</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w01_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w01_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w01_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w01_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w01_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w01_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w01_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" rowspan="21">W tym szczególne rodzaje załatwień</td>
    <td  class="borderAll wciecie" colspan="2">razem (w. 02 = w.03 do 22)</td>
  <td  class="borderAll col_36">2</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w02_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w02_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w02_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w02_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w02_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w02_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w02_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">zwrot pozwu/wniosku/skargi (art. 130 kpc)</td>
  <td  class="borderAll col_36">3</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w03_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w03_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w03_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w03_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w03_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w03_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w03_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">zwrot pozwu/wniosku/skargi (art. 1301 kpc)</td>
  <td  class="borderAll col_36">4</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w04_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w04_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w04_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w04_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w04_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w04_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w04_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">przekazanie do innych jednostek na podstawie art. 200§1 kpc (z wyjątkiem zmian organizacyjnych)</td>
  <td  class="borderAll col_36">5</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w05_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w05_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w05_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w05_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w05_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w05_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w05_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">zakończono w trybie art. 339 kpc</td>
  <td  class="borderAll col_36">6</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w06_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w06_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w06_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w06_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w06_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w06_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w06_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">zakończono w trybie art. 341 kpc</td>
  <td  class="borderAll col_36">7</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w07_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w07_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w07_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w07_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w07_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w07_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w07_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">w wyniku zmian zarządzenia MS o biurowości</td>
  <td  class="borderAll col_36">8</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w08_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w08_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w08_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w08_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w08_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w08_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w08_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">w wyniku przekazania sprawy w ramach sądu pomiędzy wydziałami tego samego pionu</td>
  <td  class="borderAll col_36">9</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w09_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w09_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w09_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w09_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w09_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w09_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w09_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">w wyniku przekazania sprawy w ramach sądu pomiędzy wydziałami różnych pionów</td>
  <td  class="borderAll col_36">10</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w10_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w10_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w10_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w10_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w10_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w10_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w10_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" rowspan="2">zmiany organizacyjne związane z utworzeniem lub likwidacją</td>
    <td  class="borderAll wciecie">wydziału (łów) / sekcji </td>
  <td  class="borderAll col_36">11</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w11_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w11_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w11_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w11_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w11_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w11_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w11_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">sądu (dów)</td>
  <td  class="borderAll col_36">12</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w12_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w12_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w12_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w12_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w12_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w12_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w12_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" rowspan="2">w związku ze zmianą obszaru właściwości miejscowej</td>
    <td  class="borderAll wciecie">wydziału (łów)</td>
  <td  class="borderAll col_36">13</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w13_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w13_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w13_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w13_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w13_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w13_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w13_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">sądu (dów)</td>
  <td  class="borderAll col_36">14</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w14_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w14_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w14_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w14_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w14_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w14_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w14_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">połączono do łącznego rozpoznania na podstawie art. 219 kpc</td>
  <td  class="borderAll col_36">15</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w15_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w15_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w15_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w15_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w15_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w15_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w15_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">przekazanie do innego trybu na podstawie art. 201§1 i 2 kpc lub do odrębnego postępowania</td>
  <td  class="borderAll col_36">16</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w16_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w16_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w16_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w16_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w16_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w16_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w16_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">zakreślono na podstawie art. 174 §1 pkt 1 kpc</td>
  <td  class="borderAll col_36">17</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w17_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w17_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w17_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w17_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w17_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w17_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w17_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">umorzenie na skutek cofnięcia pozwu, wniosku, skargi</td>
  <td  class="borderAll col_36">18</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w18_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w18_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w18_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w18_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w18_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w18_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w18_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">zakończono w trybie art.1481 §1 kpc</td>
  <td  class="borderAll col_36">19</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w19_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w19_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w19_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w19_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w19_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w19_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w19_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" rowspan="2">zakreślenie spraw </td>
    <td  class="borderAll wciecie">w związku z funkcjonowaniem § 43 Regulaminu</td>
  <td  class="borderAll col_36">20</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w20_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w20_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w20_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w20_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w20_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w20_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w20_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">w związku ze wspólnym wpływem § 54 ust.2 Regulaminu</td>
  <td  class="borderAll col_36">21</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w21_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w21_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w21_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w21_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w21_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w21_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w21_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">inne formalne (w tym odrzucenia pozwu/wniosku/skargi) (= w.16 k.3 + w.17 k.3 dz.1.2.2.)</td>
  <td  class="borderAll col_36">22</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w22_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w22_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w22_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w22_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w22_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w22_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w22_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="3">Załatwienia merytoryczne pozostałych spraw</td>
  <td  class="borderAll col_36">23</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w23_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w23_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w23_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w23_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w23_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w23_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w23_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="3">Pozostało na okres następny (w.24 = dz.1.1.1. kol.18 + dz. 1.1.2. kol. 6 odpowiednie wiersze)</td>
  <td  class="borderAll col_36">24</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w24_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w24_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w24_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w24_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w24_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w24_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w24_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
    </table>
 </div>
       <br />
          <div id='Liczba sesji i wyznaczonych spraw' class="page-break">
            <br />
            <strong>Dział Liczba sesji i wyznaczonych spraw</strong>
            <table style="width: 100%;">
                <tr>
                    <td class="center borderAll" rowspan="3">SPRAWY według repertoriów i wyka-zów</td>
                    <td class="center borderAll" rowspan="3">L.p.</td>
                    <td class="center borderAll" rowspan="3">Liczba sesji (rozprawy i posiedzenia) - wokandy</td>
                    <td class="center borderAll" rowspan="3">Suma wyznaczonych spraw Łączna liczba dni na które wyznaczono sesje -wokandy</td>
                    <td class="center borderAll" rowspan="3">Łączna liczba dni na które wyznaczono sesje -wokandy</td>

                    <td class="center borderAll" colspan="12">Liczba wyznaczonych spraw na rozprawę, dotyczy: </td>
                    <td class="center borderAll" colspan="13">Liczba wyznaczonych spraw na posiedzenia, dotyczy:</td>
                </tr>
                <tr>
                    <td class="center borderAll" rowspan="2">Razem wyzna-czonych spraw na rozprawę</td>
                    <td class="center borderAll" rowspan="2">sędziów / SR z wyłączeniem sędziów funkcyjnych </td>
                    <td class="center borderAll" rowspan="2">sędziów funkcyjnych SR (suma kol. od 7 do 13) </td>
                    <td class="center borderAll" colspan="7">z tego</td>
                    <td class="center borderAll" rowspan="2">inni sędziowie SR</td>
                    <td class="center borderAll" rowspan="2">Inni sędziowie</td>
                    <td class="center borderAll" rowspan="2">Razem wyznaczonych spraw na posiedzenie</td>
                      <td class="center borderAll" rowspan="2">sędziów SR z wyłączeniem sędziów funkcyjnych</td>
                      <td class="center borderAll" rowspan="2">sędziów / funkcyjnych SR (suma kol. od 18 do 24)</td>
                      <td class="center borderAll" colspan="7">z tego</td>
                      <td class="center borderAll" rowspan="2">inni sędziowie SR</td>
                      <td class="center borderAll" rowspan="2">Inni sędziowie</td>
               
                    <td class="center borderAll" rowspan="2">referen-darzy </td>
                </tr>
                <tr>
                    <td class="center borderAll">prezesa </td>
                      <td class="center borderAll">wice-prezesa </td>
                      <td class="center borderAll">przewod-niczącego wydziału </td>
                      <td class="center borderAll">zastępcę przewod-niczącego wydziału</td>
                      <td class="center borderAll">kiero-wnika sekcji</td>
                      <td class="center borderAll">innych funkcyjnych tego sądu z tego pionu </td>
                      <td class="center borderAll">innych funkcyjnych tego sądu z innych pionów </td>
                      <td class="center borderAll">prezesa </td>
                      <td class="center borderAll">wiceprezesa </td>
                      <td class="center borderAll">przewod-niczącego wydziału </td>
                      <td class="center borderAll">zastępcę przewod-niczącego wydziału</td>
                      <td class="center borderAll">kierownika sekcji</td>
                      <td class="center borderAll">innych funkcyjnych tego sądu z tego pionu </td>
                      <td class="center borderAll">innych funkcyjnych tego sądu z innych pionów </td>
                </tr>
                <tr>
                    <td class="center borderAll" colspan="2">0</td>
                    <td class="center borderAll">1</td>
                    <td class="center borderAll">2</td>
                    <td class="center borderAll">3</td>
                    <td class="center borderAll">4</td>
                    <td class="center borderAll">5</td>
                    <td class="center borderAll">6</td>
                    <td class="center borderAll">7</td>
                    <td class="center borderAll">8</td>
                    <td class="center borderAll">9</td>
                    <td class="center borderAll">10</td>
                    <td class="center borderAll">11</td>
                    <td class="center borderAll">12</td>
                    <td class="center borderAll">13</td>
                    <td class="center borderAll">14</td>
                    <td class="center borderAll">15</td>
                    <td class="center borderAll">16</td>
                    <td class="center borderAll">17</td>
                    <td class="center borderAll">18</td>
                    <td class="center borderAll">19</td>
                    <td class="center borderAll">20</td>
                    <td class="center borderAll">21</td>
                    <td class="center borderAll">22</td>
                    <td class="center borderAll">23</td>
                    <td class="center borderAll">24</td>
                    <td class="center borderAll">25</td>
                    <td class="center borderAll">26</td>
                    <td class="center borderAll">27</td>
                    <td class="center borderAll">28</td>
                </tr>
                <tr>
                    <td class="borderAll col_80_fest">OGÓŁEM (wiersze od 02 do 10)</td>
                    <td class="borderAll col_36">1</td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w01_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!9!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w01_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!10!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w01_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!11!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w01_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!12!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w01_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!13!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w01_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!14!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w01_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!15!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w01_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!16!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w01_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!17!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w01_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!18!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w01_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!19!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w01_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!20!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w01_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!21!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w01_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!22!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w01_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!23!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w01_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!24!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w01_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!25!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w01_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!26!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w01_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!27!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w01_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!28!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w01_c28" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_80_fest">RC</td>
                    <td class="borderAll col_36">2</td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w02_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w02_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w02_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w02_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w02_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!9!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w02_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!10!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w02_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!11!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w02_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!12!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w02_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!13!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w02_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!14!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w02_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!15!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w02_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!16!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w02_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!17!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w02_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!18!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w02_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!19!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w02_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!20!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w02_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!21!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w02_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!22!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w02_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!23!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w02_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!24!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w02_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!25!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w02_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!26!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w02_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!27!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w02_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!28!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w02_c28" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_80_fest">RNs</td>
                    <td class="borderAll col_36">3</td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w03_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w03_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w03_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w03_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w03_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!9!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w03_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!10!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w03_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!11!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w03_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!12!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w03_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!13!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w03_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!14!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w03_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!15!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w03_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!16!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w03_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!17!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w03_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!18!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w03_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!19!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w03_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!20!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w03_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!21!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w03_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!22!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w03_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!23!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w03_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!24!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w03_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!25!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w03_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!26!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w03_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!27!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w03_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!28!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w03_c28" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_80_fest">Nsm</td>
                    <td class="borderAll col_36">4</td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w04_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w04_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w04_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w04_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w04_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!9!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w04_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!10!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w04_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!11!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w04_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!12!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w04_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!13!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w04_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!14!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w04_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!15!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w04_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!16!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w04_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!17!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w04_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!18!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w04_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!19!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w04_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!20!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w04_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!21!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w04_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!22!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w04_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!23!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w04_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!24!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w04_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!25!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w04_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!26!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w04_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!27!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w04_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!28!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w04_c28" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_80_fest">RNc</td>
                    <td class="borderAll col_36">5</td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w05_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w05_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w05_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w05_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w05_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w05_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w05_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!9!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w05_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!10!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w05_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!11!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w05_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!12!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w05_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!13!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w05_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!14!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w05_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!15!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w05_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!16!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w05_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!17!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w05_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!18!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w05_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!19!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w05_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!20!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w05_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!21!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w05_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!22!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w05_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!23!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w05_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!24!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w05_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!25!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w05_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!26!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w05_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!27!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w05_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!28!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w05_c28" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_80_fest">RCo</td>
                    <td class="borderAll col_36">6</td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w06_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w06_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w06_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w06_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w06_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w06_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w06_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!9!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w06_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!10!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w06_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!11!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w06_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!12!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w06_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!13!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w06_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!14!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w06_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!15!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w06_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!16!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w06_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!17!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w06_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!18!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w06_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!19!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w06_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!20!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w06_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!21!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w06_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!22!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w06_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!23!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w06_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!24!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w06_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!25!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w06_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!26!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w06_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!27!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w06_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!28!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w06_c28" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_80_fest">Nmo</td>
                    <td class="borderAll col_36">7</td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w07_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w07_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w07_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w07_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w07_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w07_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w07_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w07_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!9!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w07_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!10!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w07_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!11!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w07_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!12!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w07_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!13!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w07_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!14!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w07_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!15!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w07_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!16!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w07_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!17!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w07_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!18!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w07_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!19!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w07_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!20!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w07_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!21!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w07_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!22!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w07_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!23!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w07_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!24!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w07_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!25!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w07_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!26!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w07_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!27!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w07_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!28!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w07_c28" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_80_fest">RCps</td>
                    <td class="borderAll col_36">8</td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w08_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w08_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w08_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w08_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w08_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w08_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w08_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w08_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!9!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w08_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!10!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w08_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!11!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w08_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!12!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w08_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!13!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w08_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!14!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w08_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!15!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w08_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!16!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w08_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!17!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w08_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!18!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w08_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!19!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w08_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!20!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w08_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!21!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w08_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!22!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w08_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!23!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w08_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!24!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w08_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!25!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w08_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!26!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w08_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!27!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w08_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!28!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w08_c28" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_80_fest">Nkd</td>
                    <td class="borderAll col_36">9</td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w09_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w09_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w09_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w09_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w09_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w09_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w09_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w09_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!9!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w09_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!10!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w09_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!11!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w09_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!12!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w09_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!13!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w09_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!14!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w09_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!15!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w09_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!16!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w09_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!17!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w09_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!18!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w09_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!19!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w09_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!20!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w09_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!21!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w09_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!22!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w09_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!23!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w09_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!24!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w09_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!25!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w09_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!26!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w09_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!27!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w09_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!28!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w09_c28" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_80_fest">Skarga o stwierdzenie niezgodności z prawem (WSC)</td>
                    <td class="borderAll col_36">10</td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!1!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w10_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!2!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w10_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!3!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w10_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!4!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w10_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!5!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w10_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!6!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w10_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!7!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w10_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!8!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w10_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!9!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w10_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!10!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w10_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!11!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w10_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!12!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w10_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!13!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w10_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!14!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w10_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!15!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w10_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!16!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w10_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!17!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w10_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!18!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w10_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!19!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w10_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!20!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w10_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!21!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w10_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!22!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w10_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!23!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w10_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!24!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w10_c24" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!25!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w10_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!26!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w10_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!27!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w10_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="wciecie center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!28!4')">
                        <asp:Label CssClass="normal" ID="tab_121_w10_c28" runat="server" Text="0"></asp:Label></a></td>
                </tr>
            </table>
        </div>
          <br />
          <br />
          <div id="1.2.2" class="page-break">
              <strong>Dział 1.2.2</strong> Liczba odbytych sesji i załatwionych spraw
             <table  style="width: 100%; ">
                <tr>
                      <td class="center borderAll" rowspan="3" colspan="2">SPRAWY według repertoriów i wyka-zów</td>
                      <td class="center borderAll" rowspan="3">L.p.</td>
                      <td class="center borderAll" rowspan="3">Liczba sesji (rozprawy i posiedzenia) - wokandy</td>
                      <td class="center borderAll" rowspan="3">Suma wyznaczonych spraw Łączna liczba dni na które wyznaczono sesje -wokandy</td>
                      <td class="center borderAll" rowspan="3">Załatwienie<sup>1</sup>) ogółem (kol. 4, 15)</td>
                      <td class="center borderAll" colspan="11">Liczba wyznaczonych spraw na rozprawę, dotyczy: </td>
                      <td class="center borderAll" colspan="12">Liczba wyznaczonych spraw na posiedzenia, dotyczy:</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" rowspan="2">Załatwienie razem (kol. 5, 6, 14) </td>
                      <td class="center borderAll" rowspan="2">sędziów / SR z wyłączeniem sędziów funkcyjnych </td>
                      <td class="center borderAll" rowspan="2">sędziów funkcyjnych SR (suma kol. od 7 do 13) </td>
                      <td class="center borderAll" colspan="7">z tego</td>
                      <td class="center borderAll" rowspan="2">inni</td>
                      <td class="center borderAll" rowspan="2">Załatwie-nie razem (kol. 16, 17, 25, 26)</td>
                      <td class="center borderAll" rowspan="2">sędziów SR z wyłączeniem sędziów funkcyjnych</td>
                      <td class="center borderAll" rowspan="2">sędziów / funkcyjnych SR (suma kol. od 18 do 24)</td>
                      <td class="center borderAll" colspan="7">z tego</td>
                      <td class="center borderAll" rowspan="2">inni</td>
                      <td class="center borderAll" rowspan="2">referen-darzy </td>
                  </tr>
                  <tr>
                      <td class="center borderAll">prezesa </td>
                      <td class="center borderAll">wiceprezesa </td>
                      <td class="center borderAll">przewod-niczącego wydziału </td>
                      <td class="center borderAll">zastępcę przewod-niczącego wydziału</td>
                      <td class="center borderAll">kierownika sekcji</td>
                      <td class="center borderAll">innych funkcyjnych tego sądu z tego pionu </td>
                      <td class="center borderAll">innych funkcyjnych tego sądu z innych pionów </td>
                      <td class="center borderAll">prezesa </td>
                      <td class="center borderAll">wiceprezesa </td>
                      <td class="center borderAll">przewod-niczącego wydziału </td>
                      <td class="center borderAll">zastępcę przewod-niczącego wydziału</td>
                      <td class="center borderAll">kierownika sekcji</td>
                      <td class="center borderAll">innych funkcyjnych tego sądu z tego pionu </td>
                      <td class="center borderAll">innych funkcyjnych tego sądu z innych pionów </td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="3">0</td>
                      <td class="center borderAll">1</td>
                      <td class="center borderAll">2</td>
                      <td class="center borderAll">3</td>
                      <td class="center borderAll">4</td>
                      <td class="center borderAll">5</td>
                      <td class="center borderAll">6</td>
                      <td class="center borderAll">7</td>
                      <td class="center borderAll">8</td>
                      <td class="center borderAll">9</td>
                      <td class="center borderAll">10</td>
                      <td class="center borderAll">11</td>
                      <td class="center borderAll">12</td>
                      <td class="center borderAll">13</td>
                      <td class="center borderAll">14</td>
                      <td class="center borderAll">15</td>
                      <td class="center borderAll">16</td>
                      <td class="center borderAll">17</td>
                      <td class="center borderAll">18</td>
                      <td class="center borderAll">19</td>
                      <td class="center borderAll">20</td>
                      <td class="center borderAll">21</td>
                      <td class="center borderAll">22</td>
                      <td class="center borderAll">23</td>
                      <td class="center borderAll">24</td>
                      <td class="center borderAll">25</td>
                      <td class="center borderAll">26</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">OGÓŁEM (wiersze od 02 + 18 do 25) </td>
                      <td class="borderAll col_36">1</td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w01_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w01_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w01_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w01_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w01_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w01_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w01_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w01_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w01_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w01_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w01_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w01_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w01_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w01_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w01_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w01_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w01_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w01_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w01_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w01_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w01_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w01_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">RC</td>
                      <td class="borderAll col_36">2</td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w02_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w02_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w02_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w02_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w02_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w02_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w02_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w02_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w02_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w02_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w02_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w02_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w02_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w02_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w02_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w02_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w02_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w02_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w02_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w02_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w02_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w02_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w02_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w02_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">zwrot pozwu/wniosku/skargi (art. 130 kpc) </td>
                      <td class="borderAll col_36">3</td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w03_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w03_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w03_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w03_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w03_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w03_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w03_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w03_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w03_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w03_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w03_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w03_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w03_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w03_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w03_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w03_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w03_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w03_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w03_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w03_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w03_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w03_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w03_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w03_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w03_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">zwrot pozwu/wniosku/skargi (art. 130<sup>1</sup> kpc) </td>
                      <td class="borderAll col_36">4</td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w04_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w04_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w04_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w04_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w04_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w04_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w04_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w04_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w04_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w04_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w04_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w04_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w04_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w04_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w04_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w04_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w04_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w04_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w04_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w04_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w04_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w04_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w04_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w04_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w04_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">przekazanie do innych jednostek na podstawie art. 200§1 kpc </td>
                      <td class="borderAll col_36">5</td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w05_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w05_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w05_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w05_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w05_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w05_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w05_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w05_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w05_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w05_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w05_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w05_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w05_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w05_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w05_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w05_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w05_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w05_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w05_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w05_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w05_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w05_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w05_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w05_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w05_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w05_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">zakończono w trybie art. 339 kpc </td>
                      <td class="borderAll col_36">6</td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w06_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w06_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w06_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w06_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w06_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w06_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w06_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w06_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w06_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w06_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w06_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w06_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w06_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w06_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w06_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w06_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w06_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w06_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w06_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w06_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w06_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w06_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w06_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w06_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w06_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w06_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">zakończono w trybie art. 341 kpc</td>
                      <td class="borderAll col_36">7</td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w07_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w07_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w07_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w07_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w07_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w07_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w07_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w07_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w07_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w07_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w07_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w07_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w07_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w07_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w07_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w07_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w07_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w07_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w07_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w07_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w07_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w07_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w07_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w07_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w07_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w07_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">w wyniku zmian zarządzenia MS o biurowości</td>
                      <td class="borderAll col_36">8</td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w08_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w08_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w08_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w08_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w08_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w08_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w08_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w08_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w08_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w08_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w08_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w08_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w08_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w08_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w08_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w08_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w08_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w08_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w08_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w08_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w08_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w08_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w08_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w08_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w08_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w08_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="2">zmiany organizacyjne związane z utworzeniem lub likwidacją</td>
                      <td class="borderAll wciecie">wydziału (ów)</td>
                      <td class="borderAll col_36">9</td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w09_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w09_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w09_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w09_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w09_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w09_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w09_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w09_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w09_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w09_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w09_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w09_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w09_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w09_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w09_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w09_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w09_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w09_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w09_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w09_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w09_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w09_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w09_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w09_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w09_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w09_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">sądu (ów)</td>
                      <td class="borderAll col_36">10</td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w10_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w10_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w10_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w10_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w10_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w10_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w10_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w10_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w10_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w10_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w10_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w10_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w10_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w10_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w10_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w10_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w10_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w10_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w10_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w10_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w10_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w10_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w10_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w10_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w10_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w10_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="2">w wyniku zmiany obszaru właściwości miejscowej</td>
                      <td class="borderAll wciecie">wydziału (ów)</td>
                      <td class="borderAll col_36">11</td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w11_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w11_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w11_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w11_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w11_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w11_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w11_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w11_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w11_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w11_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w11_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w11_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w11_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w11_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w11_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w11_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w11_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w11_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w11_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w11_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w11_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w11_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w11_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w11_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w11_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w11_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">sądu (ów)</td>
                      <td class="borderAll col_36">12</td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w12_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w12_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w12_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w12_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w12_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w12_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w12_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w12_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w12_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w12_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w12_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w12_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w12_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w12_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w12_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w12_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w12_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w12_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w12_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w12_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w12_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w12_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w12_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w12_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w12_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w12_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">połączono do łącznego rozpoznania na podstawie art. 219 kpc </td>
                      <td class="borderAll col_36">13</td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w13_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w13_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w13_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w13_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w13_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w13_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w13_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w13_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w13_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w13_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w13_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w13_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w13_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w13_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w13_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w13_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w13_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w13_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w13_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w13_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w13_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w13_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w13_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w13_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w13_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w13_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">przekazanie do innego trybu na podstawie art. 201§1 i 2 kpc </td>
                      <td class="borderAll col_36">14</td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w14_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w14_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w14_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w14_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w14_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w14_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w14_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w14_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w14_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w14_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w14_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w14_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w14_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w14_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w14_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w14_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w14_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w14_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w14_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w14_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w14_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w14_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w14_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w14_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w14_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w14_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">zakreślono na podstawie art. 174 §1 pkt 1 kpc </td>
                      <td class="borderAll col_36">15</td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w15_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w15_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w15_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w15_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w15_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w15_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w15_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w15_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w15_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w15_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w15_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w15_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w15_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w15_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w15_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w15_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w15_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w15_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w15_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w15_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w15_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w15_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w15_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w15_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w15_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w15_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">odrzucono pozew/wniosek/skargę </td>
                      <td class="borderAll col_36">16</td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w16_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w16_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w16_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w16_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w16_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w16_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w16_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w16_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w16_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w16_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w16_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w16_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w16_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w16_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w16_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w16_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w16_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w16_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w16_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w16_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w16_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w16_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w16_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w16_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w16_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w16_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">inne formalne (z wiersza 39 dz. 1.2) </td>
                      <td class="borderAll col_36">17</td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w17_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w17_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w17_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w17_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w17_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w17_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w17_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w17_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w17_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w17_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w17_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w17_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w17_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w17_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w17_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w17_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w17_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w17_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w17_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w17_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w17_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w17_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w17_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w17_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w17_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w17_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">RNs </td>
                      <td class="borderAll col_36">18</td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w18_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w18_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w18_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w18_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w18_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w18_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w18_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w18_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w18_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w18_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w18_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w18_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w18_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w18_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w18_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w18_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w18_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w18_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w18_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w18_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w18_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w18_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w18_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w18_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w18_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w18_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">Nsm </td>
                      <td class="borderAll col_36">19</td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w19_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w19_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w19_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w19_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w19_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w19_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w19_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w19_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w19_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w19_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w19_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w19_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w19_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w19_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w19_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w19_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w19_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w19_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w19_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w19_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w19_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w19_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w19_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w19_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w19_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w19_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">RNc </td>
                      <td class="borderAll col_36">20</td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w20_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w20_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w20_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w20_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w20_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w20_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w20_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w20_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w20_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w20_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w20_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w20_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w20_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w20_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w20_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w20_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w20_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w20_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w20_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w20_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w20_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w20_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w20_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w20_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w20_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w20_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">RCo </td>
                      <td class="borderAll col_36">21</td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w21_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w21_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w21_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w21_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w21_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w21_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w21_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w21_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w21_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w21_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w21_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w21_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w21_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w21_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w21_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w21_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w21_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w21_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w21_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w21_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w21_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w21_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w21_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w21_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w21_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w21_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">Nmo </td>
                      <td class="borderAll col_36">22</td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w22_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w22_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w22_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w22_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w22_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w22_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w22_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w22_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w22_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w22_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w22_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w22_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w22_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w22_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w22_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w22_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w22_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w22_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w22_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w22_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w22_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w22_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w22_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w22_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w22_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w22_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">RCp</td>
                      <td class="borderAll col_36">23</td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w23_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w23_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w23_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w23_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w23_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w23_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w23_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w23_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w23_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w23_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w23_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w23_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w23_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w23_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w23_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w23_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w23_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w23_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w23_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w23_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w23_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w23_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w23_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w23_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w23_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w23_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">Nkd </td>
                      <td class="borderAll col_36">24</td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w24_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w24_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w24_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w24_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w24_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w24_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w24_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w24_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w24_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w24_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w24_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w24_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w24_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w24_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w24_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w24_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w24_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w24_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w24_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w24_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w24_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w24_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w24_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w24_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w24_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w24_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">Skarga o stwierdzenie niezgodności z prawem (WSC)</td>
                      <td class="borderAll col_36">25</td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w25_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w25_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w25_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w25_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w25_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w25_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w25_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w25_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w25_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w25_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w25_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w25_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w25_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w25_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w25_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w25_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w25_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w25_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w25_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w25_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w25_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w25_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w25_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w25_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w25_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_30 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w25_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
              </table>
          </div>
          <br />

          <div id="1.3" class="page-break">
              <strong>Dział 1.3</strong> Załatwienie spraw przez referendarzy
             <table  style="width: 100%; ">
                  <tr>
                      <td class="center borderAll" colspan="2" rowspan="2">Wyszczególnienie</td>
                      <td class="center borderAll" colspan="7">Liczba spraw załatwionych przez referendarzy </td>
                  </tr>
                  <tr>
                      <td class="center borderAll">ogółem (kol. od 2 do 7)</td>
                      <td class="center borderAll">Rep. RC</td>
                      <td class="center borderAll">Rep. RNs</td>
                      <td class="center borderAll">Rep Nsm</td>
                      <td class="center borderAll">Rep. RCo</td>
                      <td class="center borderAll">Rep Nkd</td>
                      <td class="center borderAll">inne</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="2">0</td>
                      <td class="center borderAll">1</td>
                      <td class="center borderAll">2</td>
                      <td class="center borderAll">3</td>
                      <td class="center borderAll">4</td>
                      <td class="center borderAll">5</td>
                      <td class="center borderAll">6</td>
                      <td class="center borderAll">7</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">W przedmiocie zwolnienia od kosztów sądowych i/lub ustanowienia adwokata lub radcy prawnego </td>
                      <td class="borderAll col_36">1</td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.3!1!4')">
                          <asp:Label ID="tab_1_3_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.3!2!4')">
                          <asp:Label ID="tab_1_3_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.3!3!4')">
                          <asp:Label ID="tab_1_3_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.3!4!4')">
                          <asp:Label ID="tab_1_3_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.3!5!4')">
                          <asp:Label ID="tab_1_3_w01_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.3!6!4')">
                          <asp:Label ID="tab_1_3_w01_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.3!7!4')">
                          <asp:Label ID="tab_1_3_w01_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Zwrot pism po po bezskutecznym upływie terminu do ich uzupełnienia i opłacenia </td>
                      <td class="borderAll col_36">2</td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.3!1!4')">
                          <asp:Label ID="tab_1_3_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.3!2!4')">
                          <asp:Label ID="tab_1_3_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.3!3!4')">
                          <asp:Label ID="tab_1_3_w02_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.3!4!4')">
                          <asp:Label ID="tab_1_3_w02_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.3!5!4')">
                          <asp:Label ID="tab_1_3_w02_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.3!6!4')">
                          <asp:Label ID="tab_1_3_w02_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.3!7!4')">
                          <asp:Label ID="tab_1_3_w02_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Inne</td>
                      <td class="borderAll col_36">3</td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.3!1!4')">
                          <asp:Label ID="tab_1_3_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.3!2!4')">
                          <asp:Label ID="tab_1_3_w03_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.3!3!4')">
                          <asp:Label ID="tab_1_3_w03_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.3!4!4')">
                          <asp:Label ID="tab_1_3_w03_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.3!5!4')">
                          <asp:Label ID="tab_1_3_w03_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.3!6!4')">
                          <asp:Label ID="tab_1_3_w03_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.3!7!4')">
                          <asp:Label ID="tab_1_3_w03_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
              </table>
          </div>
          <br />
          <div id="1.4" class="page-break">
              <strong>Dział 1.4</strong> Terminowość sporządzania uzasadnień
             <table  style="width: 100%; ">
                  <tr>
                      <td class="center borderAll" colspan="2" rowspan="3">SPRAWY według repertoriów</td>
                      <td class="center borderAll" colspan="10">Terminowość sporządzania uzasadnień</td>
                      <td class="center borderAll" rowspan="3">Uzasadnienia wygłoszone (art.328 § 1<sup>1</sup> kpc)</td>
                      <td class="center borderAll" rowspan="3">Liczba spraw do których wpłynął wniosek o transkrypcje uzasadnień wygłoszonych w trybie art.328 § 1<sup>1</sup> kpc</td>
                      <td class="center borderAll" colspan="2" rowspan="2">Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" rowspan="2">razem (kol. 2, 3, 5, 7, 9)</td>
                      <td class="center borderAll" rowspan="2">w terminie ustawo-wym</td>
                      <td class="center borderAll" colspan="8">po upływie terminu ustawowego <sup>1</sup>)</td>
                  </tr>
                  <tr>
                      <td class="center borderAll">1-14 dni</td>
                      <td class="center borderAll">w tym nieuspra-wiedli-wione</td>
                      <td class="center borderAll">15-30 dni</td>
                      <td class="center borderAll">w tym nieuspra-wiedli-wione</td>
                      <td class="center borderAll">pow. 1 do 3 mies.</td>
                      <td class="center borderAll">w tym nieuspra-wiedli-wione</td>
                      <td class="center borderAll">ponad 3 mies.</td>
                      <td class="center borderAll">w tym nieuspra-wiedli-wione</td>
                      <td class="center borderAll">Razem</td>
                      <td class="center borderAll">w tym, w których projekt został zaakcep-towany przez sędziego</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="2">0</td>
                      <td class="center borderAll">1</td>
                      <td class="center borderAll">2</td>
                      <td class="center borderAll">3</td>
                      <td class="center borderAll">4</td>
                      <td class="center borderAll">5</td>
                      <td class="center borderAll">6</td>
                      <td class="center borderAll">7</td>
                      <td class="center borderAll">8</td>
                      <td class="center borderAll">9</td>
                      <td class="center borderAll">10</td>
                      <td class="center borderAll">11</td>
                      <td class="center borderAll">12</td>
                      <td class="center borderAll">13</td>
                      <td class="center borderAll">14</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Razem sprawy cywilne (wiersze od 02 do 04)</td>
                      <td class="borderAll col_36">1</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.4!1!4')">
                          <asp:Label ID="tab_1_4_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.4!2!4')">
                          <asp:Label ID="tab_1_4_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.4!3!4')">
                          <asp:Label ID="tab_1_4_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.4!4!4')">
                          <asp:Label ID="tab_1_4_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.4!5!4')">
                          <asp:Label ID="tab_1_4_w01_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.4!6!4')">
                          <asp:Label ID="tab_1_4_w01_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.4!7!4')">
                          <asp:Label ID="tab_1_4_w01_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.4!8!4')">
                          <asp:Label ID="tab_1_4_w01_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.4!9!4')">
                          <asp:Label ID="tab_1_4_w01_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.4!10!4')">
                          <asp:Label ID="tab_1_4_w01_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.4!11!4')">
                          <asp:Label ID="tab_1_4_w01_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.4!12!4')">
                          <asp:Label ID="tab_1_4_w01_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.4!13!4')">
                          <asp:Label ID="tab_1_4_w01_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.4!14!4')">
                          <asp:Label ID="tab_1_4_w01_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">RC</td>
                      <td class="borderAll col_36">2</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.4!1!4')">
                          <asp:Label ID="tab_1_4_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.4!2!4')">
                          <asp:Label ID="tab_1_4_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.4!3!4')">
                          <asp:Label ID="tab_1_4_w02_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.4!4!4')">
                          <asp:Label ID="tab_1_4_w02_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.4!5!4')">
                          <asp:Label ID="tab_1_4_w02_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.4!6!4')">
                          <asp:Label ID="tab_1_4_w02_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.4!7!4')">
                          <asp:Label ID="tab_1_4_w02_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.4!8!4')">
                          <asp:Label ID="tab_1_4_w02_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.4!9!4')">
                          <asp:Label ID="tab_1_4_w02_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.4!10!4')">
                          <asp:Label ID="tab_1_4_w02_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.4!11!4')">
                          <asp:Label ID="tab_1_4_w02_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.4!12!4')">
                          <asp:Label ID="tab_1_4_w02_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.4!13!4')">
                          <asp:Label ID="tab_1_4_w02_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.4!14!4')">
                          <asp:Label ID="tab_1_4_w02_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">RNs</td>
                      <td class="borderAll col_36">3</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.4!1!4')">
                          <asp:Label ID="tab_1_4_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.4!2!4')">
                          <asp:Label ID="tab_1_4_w03_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.4!3!4')">
                          <asp:Label ID="tab_1_4_w03_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.4!4!4')">
                          <asp:Label ID="tab_1_4_w03_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.4!5!4')">
                          <asp:Label ID="tab_1_4_w03_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.4!6!4')">
                          <asp:Label ID="tab_1_4_w03_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.4!7!4')">
                          <asp:Label ID="tab_1_4_w03_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.4!8!4')">
                          <asp:Label ID="tab_1_4_w03_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.4!9!4')">
                          <asp:Label ID="tab_1_4_w03_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.4!10!4')">
                          <asp:Label ID="tab_1_4_w03_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.4!11!4')">
                          <asp:Label ID="tab_1_4_w03_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.4!12!4')">
                          <asp:Label ID="tab_1_4_w03_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.4!13!4')">
                          <asp:Label ID="tab_1_4_w03_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.4!14!4')">
                          <asp:Label ID="tab_1_4_w03_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Nsm</td>
                      <td class="borderAll col_36">4</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.4!1!4')">
                          <asp:Label ID="tab_1_4_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.4!2!4')">
                          <asp:Label ID="tab_1_4_w04_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.4!3!4')">
                          <asp:Label ID="tab_1_4_w04_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.4!4!4')">
                          <asp:Label ID="tab_1_4_w04_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.4!5!4')">
                          <asp:Label ID="tab_1_4_w04_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.4!6!4')">
                          <asp:Label ID="tab_1_4_w04_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.4!7!4')">
                          <asp:Label ID="tab_1_4_w04_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.4!8!4')">
                          <asp:Label ID="tab_1_4_w04_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.4!9!4')">
                          <asp:Label ID="tab_1_4_w04_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.4!10!4')">
                          <asp:Label ID="tab_1_4_w04_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.4!11!4')">
                          <asp:Label ID="tab_1_4_w04_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.4!12!4')">
                          <asp:Label ID="tab_1_4_w04_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.4!13!4')">
                          <asp:Label ID="tab_1_4_w04_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.4!14!4')">
                          <asp:Label ID="tab_1_4_w04_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                    <tr>
                      <td class="borderAll wciecie">Nkd</td>
                      <td class="borderAll col_36">4</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.4!1!4')">
                          <asp:Label ID="tab_1_4_w05_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.4!2!4')">
                          <asp:Label ID="tab_1_4_w05_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.4!3!4')">
                          <asp:Label ID="tab_1_4_w05_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.4!4!4')">
                          <asp:Label ID="tab_1_4_w05_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.4!5!4')">
                          <asp:Label ID="tab_1_4_w05_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.4!6!4')">
                          <asp:Label ID="tab_1_4_w05_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.4!7!4')">
                          <asp:Label ID="tab_1_4_w05_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.4!8!4')">
                          <asp:Label ID="tab_1_4_w05_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.4!9!4')">
                          <asp:Label ID="tab_1_4_w05_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.4!10!4')">
                          <asp:Label ID="tab_1_4_w05_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.4!11!4')">
                          <asp:Label ID="tab_1_4_w05_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.4!12!4')">
                          <asp:Label ID="tab_1_4_w05_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.4!13!4')">
                          <asp:Label ID="tab_1_4_w05_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.4!14!4')">
                          <asp:Label ID="tab_1_4_w05_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
              </table>
          </div>
          <br />
          <div id="2.1.1" class="page-break">
              <strong>Dział 2.1.1</strong> Sprawy od dnia pierwotnego wpisu do repertorium (łącznie z czasem trwania mediacji)
               <table  style="width: 100%; ">
                  <tr>
                      <td class="center borderAll" rowspan="2" colspan="2">SPRAWY według
                          <br />
                          repertoriów</td>
                      <td class="center borderAll" rowspan="2">Symbol </td>
                      <td class="center borderAll" rowspan="2">Lp.</td>
                      <td class="center borderAll" colspan="11">Liczba spraw niezałatwionych pozostających od daty pierwszego wpływu do sądu</td>
                  </tr>
                  <tr>
                      <td class="center borderAll">razem (kol. 2, 3)</td>
                      <td class="center borderAll">do 3 miesięcy</td>
                      <td class="center borderAll">suma powyżej 3 miesięcy (kol. od 4 do 6)</td>
                      <td class="center borderAll">powyżej 3 do 6 miesięcy </td>
                      <td class="center borderAll">powyżej 6 do 12 miesięcy</td>
                      <td class="center borderAll">suma powyżej 12 miesięcy (kol. od 7 do 11)</td>
                      <td class="center borderAll">powyżej 12 miesięcy do 2 lat</td>
                      <td class="center borderAll">powyżej 2 do 3 lat</td>
                      <td class="center borderAll">powyżej 3 do 5 lat</td>
                      <td class="center borderAll">powyżej 5 do 8 lat</td>
                      <td class="center borderAll">ponad 8 lat</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="4">0</td>
                      <td class="center borderAll">1</td>
                      <td class="center borderAll">2</td>
                      <td class="center borderAll">3</td>
                      <td class="center borderAll">4</td>
                      <td class="center borderAll">5</td>
                      <td class="center borderAll">6</td>
                      <td class="center borderAll">7</td>
                      <td class="center borderAll">8</td>
                      <td class="center borderAll">9</td>
                      <td class="center borderAll">10</td>
                      <td class="center borderAll">11</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">ogółem</td>
                      <td class="borderAll wciecie">--</td>
                      <td class="borderAll col_36">1</td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1!1!4')">
                          <asp:Label ID="tab_2_1_1_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1!2!4')">
                          <asp:Label ID="tab_2_1_1_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1!3!4')">
                          <asp:Label ID="tab_2_1_1_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1!4!4')">
                          <asp:Label ID="tab_2_1_1_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1!5!4')">
                          <asp:Label ID="tab_2_1_1_w01_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1!6!4')">
                          <asp:Label ID="tab_2_1_1_w01_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1!7!4')">
                          <asp:Label ID="tab_2_1_1_w01_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1!8!4')">
                          <asp:Label ID="tab_2_1_1_w01_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1!9!4')">
                          <asp:Label ID="tab_2_1_1_w01_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1!10!4')">
                          <asp:Label ID="tab_2_1_1_w01_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1!11!4')">
                          <asp:Label ID="tab_2_1_1_w01_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="4">w tym</td>
                      <td class="borderAll wciecie">RC</td>
                      <td class="borderAll wciecie">--</td>
                      <td class="borderAll col_36">2</td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1!1!4')">
                          <asp:Label ID="tab_2_1_1_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1!2!4')">
                          <asp:Label ID="tab_2_1_1_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1!3!4')">
                          <asp:Label ID="tab_2_1_1_w02_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1!4!4')">
                          <asp:Label ID="tab_2_1_1_w02_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1!5!4')">
                          <asp:Label ID="tab_2_1_1_w02_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1!6!4')">
                          <asp:Label ID="tab_2_1_1_w02_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1!7!4')">
                          <asp:Label ID="tab_2_1_1_w02_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1!8!4')">
                          <asp:Label ID="tab_2_1_1_w02_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1!9!4')">
                          <asp:Label ID="tab_2_1_1_w02_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1!10!4')">
                          <asp:Label ID="tab_2_1_1_w02_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1!11!4')">
                          <asp:Label ID="tab_2_1_1_w02_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">RNs</td>
                      <td class="borderAll wciecie">--</td>
                      <td class="borderAll col_36">3</td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1!1!4')">
                          <asp:Label ID="tab_2_1_1_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1!2!4')">
                          <asp:Label ID="tab_2_1_1_w03_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1!3!4')">
                          <asp:Label ID="tab_2_1_1_w03_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1!4!4')">
                          <asp:Label ID="tab_2_1_1_w03_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1!5!4')">
                          <asp:Label ID="tab_2_1_1_w03_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1!6!4')">
                          <asp:Label ID="tab_2_1_1_w03_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1!7!4')">
                          <asp:Label ID="tab_2_1_1_w03_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1!8!4')">
                          <asp:Label ID="tab_2_1_1_w03_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1!9!4')">
                          <asp:Label ID="tab_2_1_1_w03_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1!10!4')">
                          <asp:Label ID="tab_2_1_1_w03_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1!11!4')">
                          <asp:Label ID="tab_2_1_1_w03_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Nsm</td>
                      <td class="borderAll wciecie">--</td>
                      <td class="borderAll col_36">4</td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.1!1!4')">
                          <asp:Label ID="tab_2_1_1_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.1!2!4')">
                          <asp:Label ID="tab_2_1_1_w04_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.1!3!4')">
                          <asp:Label ID="tab_2_1_1_w04_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.1!4!4')">
                          <asp:Label ID="tab_2_1_1_w04_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.1!5!4')">
                          <asp:Label ID="tab_2_1_1_w04_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.1!6!4')">
                          <asp:Label ID="tab_2_1_1_w04_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.1!7!4')">
                          <asp:Label ID="tab_2_1_1_w04_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.1!8!4')">
                          <asp:Label ID="tab_2_1_1_w04_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.1!9!4')">
                          <asp:Label ID="tab_2_1_1_w04_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.1!10!4')">
                          <asp:Label ID="tab_2_1_1_w04_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.1!11!4')">
                          <asp:Label ID="tab_2_1_1_w04_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                 <tr>
                      <td class="borderAll wciecie">Nkd</td>
                      <td class="borderAll wciecie">--</td>
                      <td class="borderAll col_36">4</td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.1!1!4')">
                          <asp:Label ID="tab_2_1_1_w05_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.1!2!4')">
                          <asp:Label ID="tab_2_1_1_w05_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.1!3!4')">
                          <asp:Label ID="tab_2_1_1_w05_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.1!4!4')">
                          <asp:Label ID="tab_2_1_1_w05_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.1!5!4')">
                          <asp:Label ID="tab_2_1_1_w05_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.1!6!4')">
                          <asp:Label ID="tab_2_1_1_w05_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.1!7!4')">
                          <asp:Label ID="tab_2_1_1_w05_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.1!8!4')">
                          <asp:Label ID="tab_2_1_1_w05_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.1!9!4')">
                          <asp:Label ID="tab_2_1_1_w05_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.1!10!4')">
                          <asp:Label ID="tab_2_1_1_w05_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.1!11!4')">
                          <asp:Label ID="tab_2_1_1_w05_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>

                 </tr>
              </table>
          </div>
          <br />
<div id="2.1.1.a" class="page-break">
              <strong>Dział 2.1.1.a</strong> Sprawy zawieszone nie zakreślone od dnia pierwotnego wpisu do repertorium (wykazane w dziale 2.1.1.) (łącznie z czasem trwania mediacji)
             <table  style="width: 100%; ">
                  <tr>
                      <td class="center borderAll" rowspan="2" colspan="2">SPRAWY według
                          <br />
                          repertoriów</td>
                      <td class="center borderAll" rowspan="2">Symbol </td>
                      <td class="center borderAll" rowspan="2">Lp.</td>
                      <td class="center borderAll" colspan="11">Liczba spraw niezałatwionych pozostających od daty pierwszego wpływu do sądu</td>
                  </tr>
                  <tr>
                      <td class="center borderAll">razem (kol. 2, 3)</td>
                      <td class="center borderAll">do 3 miesięcy</td>
                      <td class="center borderAll">suma powyżej 3 miesięcy (kol. od 4 do 6)</td>
                      <td class="center borderAll">powyżej 3 do 6 miesięcy </td>
                      <td class="center borderAll">powyżej 6 do 12 miesięcy</td>
                      <td class="center borderAll">suma powyżej 12 miesięcy (kol. od 7 do 11)</td>
                      <td class="center borderAll">powyżej 12 miesięcy do 2 lat</td>
                      <td class="center borderAll">powyżej 2 do 3 lat</td>
                      <td class="center borderAll">powyżej 3 do 5 lat</td>
                      <td class="center borderAll">powyżej 5 do 8 lat</td>
                      <td class="center borderAll">ponad 8 lat</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="4">0</td>
                      <td class="center borderAll">1</td>
                      <td class="center borderAll">2</td>
                      <td class="center borderAll">3</td>
                      <td class="center borderAll">4</td>
                      <td class="center borderAll">5</td>
                      <td class="center borderAll">6</td>
                      <td class="center borderAll">7</td>
                      <td class="center borderAll">8</td>
                      <td class="center borderAll">9</td>
                      <td class="center borderAll">10</td>
                      <td class="center borderAll">11</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">ogółem</td>
                      <td class="borderAll wciecie">--</td>
                      <td class="borderAll col_36">1</td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.a!1!4')">
                          <asp:Label ID="tab_2_11_a_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.a!2!4')">
                          <asp:Label ID="tab_2_11_a_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.a!3!4')">
                          <asp:Label ID="tab_2_11_a_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.a!4!4')">
                          <asp:Label ID="tab_2_11_a_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.a!5!4')">
                          <asp:Label ID="tab_2_11_a_w01_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.a!6!4')">
                          <asp:Label ID="tab_2_11_a_w01_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.a!7!4')">
                          <asp:Label ID="tab_2_11_a_w01_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.a!8!4')">
                          <asp:Label ID="tab_2_11_a_w01_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.a!9!4')">
                          <asp:Label ID="tab_2_11_a_w01_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.a!10!4')">
                          <asp:Label ID="tab_2_11_a_w01_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.a!11!4')">
                          <asp:Label ID="tab_2_11_a_w01_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="4">w tym</td>
                      <td class="borderAll wciecie">RC</td>
                      <td class="borderAll wciecie">--</td>
                      <td class="borderAll col_36">2</td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.a!1!4')">
                          <asp:Label ID="tab_2_11_a_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.a!2!4')">
                          <asp:Label ID="tab_2_11_a_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.a!3!4')">
                          <asp:Label ID="tab_2_11_a_w02_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.a!4!4')">
                          <asp:Label ID="tab_2_11_a_w02_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.a!5!4')">
                          <asp:Label ID="tab_2_11_a_w02_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.a!6!4')">
                          <asp:Label ID="tab_2_11_a_w02_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.a!7!4')">
                          <asp:Label ID="tab_2_11_a_w02_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.a!8!4')">
                          <asp:Label ID="tab_2_11_a_w02_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.a!9!4')">
                          <asp:Label ID="tab_2_11_a_w02_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.a!10!4')">
                          <asp:Label ID="tab_2_11_a_w02_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.a!11!4')">
                          <asp:Label ID="tab_2_11_a_w02_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">RNs</td>
                      <td class="borderAll wciecie">--</td>
                      <td class="borderAll col_36">3</td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.a!1!4')">
                          <asp:Label ID="tab_2_11_a_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.a!2!4')">
                          <asp:Label ID="tab_2_11_a_w03_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.a!3!4')">
                          <asp:Label ID="tab_2_11_a_w03_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.a!4!4')">
                          <asp:Label ID="tab_2_11_a_w03_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.a!5!4')">
                          <asp:Label ID="tab_2_11_a_w03_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.a!6!4')">
                          <asp:Label ID="tab_2_11_a_w03_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.a!7!4')">
                          <asp:Label ID="tab_2_11_a_w03_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.a!8!4')">
                          <asp:Label ID="tab_2_11_a_w03_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.a!9!4')">
                          <asp:Label ID="tab_2_11_a_w03_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.a!10!4')">
                          <asp:Label ID="tab_2_11_a_w03_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.a!11!4')">
                          <asp:Label ID="tab_2_11_a_w03_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Nsm</td>
                      <td class="borderAll wciecie">--</td>
                      <td class="borderAll col_36">4</td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.1.a!1!4')">
                          <asp:Label ID="tab_2_11_a_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.1.a!2!4')">
                          <asp:Label ID="tab_2_11_a_w04_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.1.a!3!4')">
                          <asp:Label ID="tab_2_11_a_w04_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.1.a!4!4')">
                          <asp:Label ID="tab_2_11_a_w04_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.1.a!5!4')">
                          <asp:Label ID="tab_2_11_a_w04_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.1.a!6!4')">
                          <asp:Label ID="tab_2_11_a_w04_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.1.a!7!4')">
                          <asp:Label ID="tab_2_11_a_w04_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.1.a!8!4')">
                          <asp:Label ID="tab_2_11_a_w04_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.1.a!9!4')">
                          <asp:Label ID="tab_2_11_a_w04_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.1.a!10!4')">
                          <asp:Label ID="tab_2_11_a_w04_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.1.a!11!4')">
                          <asp:Label ID="tab_2_11_a_w04_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                 <tr>
                      <td class="borderAll wciecie">Nkd</td>
                      <td class="borderAll wciecie">--</td>
                      <td class="borderAll col_36">4</td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.1.a!1!4')">
                          <asp:Label ID="tab_2_11_a_w05_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.1.a!2!4')">
                          <asp:Label ID="tab_2_11_a_w05_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.1.a!3!4')">
                          <asp:Label ID="tab_2_11_a_w05_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.1.a!4!4')">
                          <asp:Label ID="tab_2_11_a_w05_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.1.a!5!4')">
                          <asp:Label ID="tab_2_11_a_w05_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.1.a!6!4')">
                          <asp:Label ID="tab_2_11_a_w05_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.1.a!7!4')">
                          <asp:Label ID="tab_2_11_a_w05_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.1.a!8!4')">
                          <asp:Label ID="tab_2_11_a_w05_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.1.a!9!4')">
                          <asp:Label ID="tab_2_11_a_w05_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.1.a!10!4')">
                          <asp:Label ID="tab_2_11_a_w05_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.1.a!11!4')">
                          <asp:Label ID="tab_2_11_a_w05_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>

                 </tr>
              </table>
          </div>       
       <br />
          <div id="2.1.1.1.1" class="page-break">
              <strong>Dział 2.1.1.1.1</strong> Sprawy od dnia pierwotnego wpisu do repertorium
             <table  style="width: 100%; ">
                  <tr>
                      <td class="center borderAll" rowspan="2" colspan="2">SPRAWY według
                          <br />
                          repertoriów</td>
                      <td class="center borderAll" rowspan="2">Symbol </td>
                      <td class="center borderAll" rowspan="2">Lp.</td>
                      <td class="center borderAll" colspan="11">Liczba spraw niezałatwionych pozostających od daty pierwszego wpływu do sądu</td>
                  </tr>
                  <tr>
                      <td class="center borderAll">razem (kol. 2, 3)</td>
                      <td class="center borderAll">do 3 miesięcy</td>
                      <td class="center borderAll">suma powyżej 3 miesięcy (kol. od 4 do 6)</td>
                      <td class="center borderAll">powyżej 3 do 6 miesięcy </td>
                      <td class="center borderAll">powyżej 6 do 12 miesięcy</td>
                      <td class="center borderAll">suma powyżej 12 miesięcy (kol. od 7 do 11)</td>
                      <td class="center borderAll">powyżej 12 miesięcy do 2 lat</td>
                      <td class="center borderAll">powyżej 2 do 3 lat</td>
                      <td class="center borderAll">powyżej 3 do 5 lat</td>
                      <td class="center borderAll">powyżej 5 do 8 lat</td>
                      <td class="center borderAll">ponad 8 lat</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="4">0</td>
                      <td class="center borderAll">1</td>
                      <td class="center borderAll">2</td>
                      <td class="center borderAll">3</td>
                      <td class="center borderAll">4</td>
                      <td class="center borderAll">5</td>
                      <td class="center borderAll">6</td>
                      <td class="center borderAll">7</td>
                      <td class="center borderAll">8</td>
                      <td class="center borderAll">9</td>
                      <td class="center borderAll">10</td>
                      <td class="center borderAll">11</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">ogółem</td>
                      <td class="borderAll wciecie">--</td>
                      <td class="borderAll col_36">1</td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.1!1!4')">
                          <asp:Label ID="tab_2_1_1_1_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.1!2!4')">
                          <asp:Label ID="tab_2_1_1_1_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.1!3!4')">
                          <asp:Label ID="tab_2_1_1_1_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.1!4!4')">
                          <asp:Label ID="tab_2_1_1_1_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.1!5!4')">
                          <asp:Label ID="tab_2_1_1_1_w01_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.1!6!4')">
                          <asp:Label ID="tab_2_1_1_1_w01_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.1!7!4')">
                          <asp:Label ID="tab_2_1_1_1_w01_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.1!8!4')">
                          <asp:Label ID="tab_2_1_1_1_w01_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.1!9!4')">
                          <asp:Label ID="tab_2_1_1_1_w01_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.1!10!4')">
                          <asp:Label ID="tab_2_1_1_1_w01_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.1!11!4')">
                          <asp:Label ID="tab_2_1_1_1_w01_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="4">w tym</td>
                      <td class="borderAll wciecie">RC</td>
                      <td class="borderAll wciecie">--</td>
                      <td class="borderAll col_36">2</td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.1!1!4')">
                          <asp:Label ID="tab_2_1_1_1_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.1!2!4')">
                          <asp:Label ID="tab_2_1_1_1_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.1!3!4')">
                          <asp:Label ID="tab_2_1_1_1_w02_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.1!4!4')">
                          <asp:Label ID="tab_2_1_1_1_w02_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.1!5!4')">
                          <asp:Label ID="tab_2_1_1_1_w02_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.1!6!4')">
                          <asp:Label ID="tab_2_1_1_1_w02_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.1!7!4')">
                          <asp:Label ID="tab_2_1_1_1_w02_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.1!8!4')">
                          <asp:Label ID="tab_2_1_1_1_w02_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.1!9!4')">
                          <asp:Label ID="tab_2_1_1_1_w02_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.1!10!4')">
                          <asp:Label ID="tab_2_1_1_1_w02_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.1!11!4')">
                          <asp:Label ID="tab_2_1_1_1_w02_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">RNs</td>
                      <td class="borderAll wciecie">--</td>
                      <td class="borderAll col_36">3</td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.1!1!4')">
                          <asp:Label ID="tab_2_1_1_1_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.1!2!4')">
                          <asp:Label ID="tab_2_1_1_1_w03_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.1!3!4')">
                          <asp:Label ID="tab_2_1_1_1_w03_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.1!4!4')">
                          <asp:Label ID="tab_2_1_1_1_w03_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.1!5!4')">
                          <asp:Label ID="tab_2_1_1_1_w03_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.1!6!4')">
                          <asp:Label ID="tab_2_1_1_1_w03_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.1!7!4')">
                          <asp:Label ID="tab_2_1_1_1_w03_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.1!8!4')">
                          <asp:Label ID="tab_2_1_1_1_w03_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.1!9!4')">
                          <asp:Label ID="tab_2_1_1_1_w03_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.1!10!4')">
                          <asp:Label ID="tab_2_1_1_1_w03_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.1!11!4')">
                          <asp:Label ID="tab_2_1_1_1_w03_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Nsm</td>
                      <td class="borderAll wciecie">--</td>
                      <td class="borderAll col_36">4</td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.1.1!1!4')">
                          <asp:Label ID="tab_2_1_1_1_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.1.1!2!4')">
                          <asp:Label ID="tab_2_1_1_1_w04_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.1.1!3!4')">
                          <asp:Label ID="tab_2_1_1_1_w04_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.1.1!4!4')">
                          <asp:Label ID="tab_2_1_1_1_w04_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.1.1!5!4')">
                          <asp:Label ID="tab_2_1_1_1_w04_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.1.1!6!4')">
                          <asp:Label ID="tab_2_1_1_1_w04_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.1.1!7!4')">
                          <asp:Label ID="tab_2_1_1_1_w04_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.1.1!8!4')">
                          <asp:Label ID="tab_2_1_1_1_w04_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.1.1!9!4')">
                          <asp:Label ID="tab_2_1_1_1_w04_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.1.1!10!4')">
                          <asp:Label ID="tab_2_1_1_1_w04_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.1.1!11!4')">
                          <asp:Label ID="tab_2_1_1_1_w04_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                 <tr>
                      <td class="borderAll wciecie">Nkd</td>
                      <td class="borderAll wciecie">--</td>
                      <td class="borderAll col_36">4</td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.1.1!1!4')">
                          <asp:Label ID="tab_2_1_1_1_w05_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.1.1!2!4')">
                          <asp:Label ID="tab_2_1_1_1_w05_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.1.1!3!4')">
                          <asp:Label ID="tab_2_1_1_1_w05_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.1.1!4!4')">
                          <asp:Label ID="tab_2_1_1_1_w05_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.1.1!5!4')">
                          <asp:Label ID="tab_2_1_1_1_w05_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.1.1!6!4')">
                          <asp:Label ID="tab_2_1_1_1_w05_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.1.1!7!4')">
                          <asp:Label ID="tab_2_1_1_1_w05_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.1.1!8!4')">
                          <asp:Label ID="tab_2_1_1_1_w05_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.1.1!9!4')">
                          <asp:Label ID="tab_2_1_1_1_w05_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.1.1!10!4')">
                          <asp:Label ID="tab_2_1_1_1_w05_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.1.1!11!4')">
                          <asp:Label ID="tab_2_1_1_1_w05_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>

                 </tr>
              </table>
          </div>
       <br />
<div id="2.1.2" class="page-break">
              <strong>Dział 2.1.2</strong> Liczba spraw zakreślonych w urządzeniu ewidencyjnym w wyniku zawieszenia postępowania (łącznie z czasem trwania mediacji)
             <table  style="width: 100%; ">
                  <tr>
                      <td class="center borderAll" rowspan="2">SPRAWY według
                          <br />
                          repertoriów</td>
                      <td class="center borderAll" rowspan="2">Symbol </td>
                      <td class="center borderAll" rowspan="2">Lp.</td>
                      <td class="center borderAll" colspan="11">Liczba spraw niezałatwionych pozostających od daty pierwszego wpływu do sądu</td>
                  </tr>
                  <tr>
                      <td class="center borderAll">razem (kol. 2, 3)</td>
                      <td class="center borderAll">do 3 miesięcy</td>
                      <td class="center borderAll">suma powyżej 3 miesięcy (kol. od 4 do 6)</td>
                      <td class="center borderAll">powyżej 3 do 6 miesięcy </td>
                      <td class="center borderAll">powyżej 6 do 12 miesięcy</td>
                      <td class="center borderAll">suma powyżej 12 miesięcy (kol. od 7 do 11)</td>
                      <td class="center borderAll">powyżej 12 miesięcy do 2 lat</td>
                      <td class="center borderAll">powyżej 2 do 3 lat</td>
                      <td class="center borderAll">powyżej 3 do 5 lat</td>
                      <td class="center borderAll">powyżej 5 do 8 lat</td>
                      <td class="center borderAll">ponad 8 lat</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="3">0</td>
                      <td class="center borderAll">1</td>
                      <td class="center borderAll">2</td>
                      <td class="center borderAll">3</td>
                      <td class="center borderAll">4</td>
                      <td class="center borderAll">5</td>
                      <td class="center borderAll">6</td>
                      <td class="center borderAll">7</td>
                      <td class="center borderAll">8</td>
                      <td class="center borderAll">9</td>
                      <td class="center borderAll">10</td>
                      <td class="center borderAll">11</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">ogółem</td>
                      <td class="borderAll col_36">1</td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.2!1!4')">
                          <asp:Label ID="tab_2_1_2_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.2!2!4')">
                          <asp:Label ID="tab_2_1_2_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.2!3!4')">
                          <asp:Label ID="tab_2_1_2_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.2!4!4')">
                          <asp:Label ID="tab_2_1_2_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.2!5!4')">
                          <asp:Label ID="tab_2_1_2_w01_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.2!6!4')">
                          <asp:Label ID="tab_2_1_2_w01_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.2!7!4')">
                          <asp:Label ID="tab_2_1_2_w01_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.2!8!4')">
                          <asp:Label ID="tab_2_1_2_w01_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.2!9!4')">
                          <asp:Label ID="tab_2_1_2_w01_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.2!10!4')">
                          <asp:Label ID="tab_2_1_2_w01_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.2!11!4')">
                          <asp:Label ID="tab_2_1_2_w01_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="4">w tym</td>
                      <td class="borderAll wciecie">RC</td>
                      <td class="borderAll col_36">2</td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.2!1!4')">
                          <asp:Label ID="tab_2_1_2_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.2!2!4')">
                          <asp:Label ID="tab_2_1_2_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.2!3!4')">
                          <asp:Label ID="tab_2_1_2_w02_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.2!4!4')">
                          <asp:Label ID="tab_2_1_2_w02_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.2!5!4')">
                          <asp:Label ID="tab_2_1_2_w02_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.2!6!4')">
                          <asp:Label ID="tab_2_1_2_w02_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.2!7!4')">
                          <asp:Label ID="tab_2_1_2_w02_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.2!8!4')">
                          <asp:Label ID="tab_2_1_2_w02_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.2!9!4')">
                          <asp:Label ID="tab_2_1_2_w02_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.2!10!4')">
                          <asp:Label ID="tab_2_1_2_w02_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.2!11!4')">
                          <asp:Label ID="tab_2_1_2_w02_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">RNs</td>
                      <td class="borderAll col_36">3</td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.2!1!4')">
                          <asp:Label ID="tab_2_1_2_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.2!2!4')">
                          <asp:Label ID="tab_2_1_2_w03_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.2!3!4')">
                          <asp:Label ID="tab_2_1_2_w03_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.2!4!4')">
                          <asp:Label ID="tab_2_1_2_w03_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.2!5!4')">
                          <asp:Label ID="tab_2_1_2_w03_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.2!6!4')">
                          <asp:Label ID="tab_2_1_2_w03_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.2!7!4')">
                          <asp:Label ID="tab_2_1_2_w03_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.2!8!4')">
                          <asp:Label ID="tab_2_1_2_w03_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.2!9!4')">
                          <asp:Label ID="tab_2_1_2_w03_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.2!10!4')">
                          <asp:Label ID="tab_2_1_2_w03_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.2!11!4')">
                          <asp:Label ID="tab_2_1_2_w03_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Nsm</td>
                      <td class="borderAll col_36">4</td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.2!1!4')">
                          <asp:Label ID="tab_2_1_2_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.2!2!4')">
                          <asp:Label ID="tab_2_1_2_w04_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.2!3!4')">
                          <asp:Label ID="tab_2_1_2_w04_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.2!4!4')">
                          <asp:Label ID="tab_2_1_2_w04_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.2!5!4')">
                          <asp:Label ID="tab_2_1_2_w04_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.2!6!4')">
                          <asp:Label ID="tab_2_1_2_w04_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.2!7!4')">
                          <asp:Label ID="tab_2_1_2_w04_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.2!8!4')">
                          <asp:Label ID="tab_2_1_2_w04_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.2!9!4')">
                          <asp:Label ID="tab_2_1_2_w04_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.2!10!4')">
                          <asp:Label ID="tab_2_1_2_w04_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.2!11!4')">
                          <asp:Label ID="tab_2_1_2_w04_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                 <tr>
                      <td class="borderAll wciecie">Nkd</td>
                      <td class="borderAll col_36">5</td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.2!1!4')">
                          <asp:Label ID="tab_2_1_2_w05_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.2!2!4')">
                          <asp:Label ID="tab_2_1_2_w05_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.2!3!4')">
                          <asp:Label ID="tab_2_1_2_w05_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.2!4!4')">
                          <asp:Label ID="tab_2_1_2_w05_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.2!5!4')">
                          <asp:Label ID="tab_2_1_2_w05_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.2!6!4')">
                          <asp:Label ID="tab_2_1_2_w05_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.2!7!4')">
                          <asp:Label ID="tab_2_1_2_w05_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.2!8!4')">
                          <asp:Label ID="tab_2_1_2_w05_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.2!9!4')">
                          <asp:Label ID="tab_2_1_2_w05_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.2!10!4')">
                          <asp:Label ID="tab_2_1_2_w05_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.2!11!4')">
                          <asp:Label ID="tab_2_1_2_w05_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>

                 </tr>
                 </table>
          </div>
          <br />

          <div id="2.2" class="page-break">
              <strong>Dział 2.2</strong> Czas trwania postępowania sądowego od dnia pierwszej rejestracji do dnia uprawomocnienia się sprawy w I instancji (łącznie z czasem trwania mediacji)
             <table  style="width: 100%; ">
                  <tr>
                      <td class="center borderAll" colspan="2">SPRAWY wg repertoriów</td>
                      <td class="center borderAll">Razem<br />
&nbsp;(suma kolumn 2 do 9)</td>
                      <td class="center borderAll">Do 3 miesięcy</td>
                      <td class="center borderAll">Powyżej 3 do 6 miesięcy</td>
                      <td class="center borderAll">powyżej 6 do 12 miesięcy</td>
                      <td class="center borderAll">powyżej 12 miesięcy do 2 lat</td>
                      <td class="center borderAll">powyżej 2 do 3 lat</td>
                      <td class="center borderAll">powyżej 3 do 5 lat</td>
                      <td class="center borderAll">powyżej 5 do 8 lat</td>
                      <td class="center borderAll">ponad 8 lat</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="2">0</td>
                      <td class="center borderAll">1</td>
                      <td class="center borderAll">2</td>
                      <td class="center borderAll">3</td>
                      <td class="center borderAll">4</td>
                      <td class="center borderAll">5</td>
                      <td class="center borderAll">6</td>
                      <td class="center borderAll">7</td>
                      <td class="center borderAll">8</td>
                      <td class="center borderAll">9</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">RC</td>
                      <td class="borderAll col_36">1</td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.2!1!4')">
                          <asp:Label ID="tab_2_2_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.2!2!4')">
                          <asp:Label ID="tab_2_2_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.2!3!4')">
                          <asp:Label ID="tab_2_2_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.2!4!4')">
                          <asp:Label ID="tab_2_2_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.2!5!4')">
                          <asp:Label ID="tab_2_2_w01_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.2!6!4')">
                          <asp:Label ID="tab_2_2_w01_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.2!7!4')">
                          <asp:Label ID="tab_2_2_w01_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.2!8!4')">
                          <asp:Label ID="tab_2_2_w01_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.2!9!4')">
                          <asp:Label ID="tab_2_2_w01_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">RNs</td>
                      <td class="borderAll col_36">2</td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.2!1!4')">
                          <asp:Label ID="tab_2_2_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.2!2!4')">
                          <asp:Label ID="tab_2_2_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.2!3!4')">
                          <asp:Label ID="tab_2_2_w02_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.2!4!4')">
                          <asp:Label ID="tab_2_2_w02_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.2!5!4')">
                          <asp:Label ID="tab_2_2_w02_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.2!6!4')">
                          <asp:Label ID="tab_2_2_w02_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.2!7!4')">
                          <asp:Label ID="tab_2_2_w02_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.2!8!4')">
                          <asp:Label ID="tab_2_2_w02_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.2!9!4')">
                          <asp:Label ID="tab_2_2_w02_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Nsm</td>
                      <td class="borderAll col_36">3</td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.2!1!4')">
                          <asp:Label ID="tab_2_2_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.2!2!4')">
                          <asp:Label ID="tab_2_2_w03_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.2!3!4')">
                          <asp:Label ID="tab_2_2_w03_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.2!4!4')">
                          <asp:Label ID="tab_2_2_w03_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.2!5!4')">
                          <asp:Label ID="tab_2_2_w03_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.2!6!4')">
                          <asp:Label ID="tab_2_2_w03_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.2!7!4')">
                          <asp:Label ID="tab_2_2_w03_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.2!8!4')">
                          <asp:Label ID="tab_2_2_w03_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.2!9!4')">
                          <asp:Label ID="tab_2_2_w03_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Nkd</td>
                      <td class="borderAll col_36">4</td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.2!1!4')">
                          <asp:Label ID="tab_2_2_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.2!2!4')">
                          <asp:Label ID="tab_2_2_w04_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.2!3!4')">
                          <asp:Label ID="tab_2_2_w04_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.2!4!4')">
                          <asp:Label ID="tab_2_2_w04_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.2!5!4')">
                          <asp:Label ID="tab_2_2_w04_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.2!6!4')">
                          <asp:Label ID="tab_2_2_w04_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.2!7!4')">
                          <asp:Label ID="tab_2_2_w04_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.2!8!4')">
                          <asp:Label ID="tab_2_2_w04_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.2!9!4')">
                          <asp:Label ID="tab_2_2_w04_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
              </table>
          </div>
          <br />
         
          
          <div id="2.2.a"  class="page-break">

           <asp:Label ID="tabela4Label" runat="server">2.2.a Czas trwania postępowania sądowego od dnia pierwszej rejestracji do dnia uprawomocnienia się sprawy merytorycznie zakończonej (wyrokiem, orzeczeniem) w I instancji (łącznie z czasem trwania mediacji)</asp:Label>

        <table  class="dxflInternalEditorTable_MaterialCompact">
            <tr>
                <td class="center" colspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_155">SPRAWY
wg repertoriów
                </td>
                <td class="center borderAll">Razem<br />
                    (kol. 2 do 9)</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_112">Do 3 miesięcy</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_112">Powyżej 3
                    <br />
                    do 6 mies.</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_112">Powyżej 6 do<br />
                    12
                    miesięcy.</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_112">Powyżej 12<br />
                    miesięcy do 2 lat</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_112">Powyżej 2
                    <br />
                    do&nbsp;3
                    lat.</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_112">Powyżej 3
                    <br />
                    do&nbsp;5
                    lat.</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_112">Powyżej 5 <br />
                    do&nbsp;8
                    lat.</td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" class="col_112">Ponad 8 lat</td>
            </tr>
            <tr>
                <td class="center" colspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_155">0</td>
                <td class="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666; width: 142px;" class="col_112">1</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_112">2</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_112">3</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_112">4</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_112">5</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_112">6</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_112">7</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_112">8</td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666; width: 142px;" class="col_112">9</td>
            </tr>
            <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;" class="auto-style8">RC </td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #000000;" class="auto-style9 col_36">01</td>
                <td class="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #000000; border-bottom: 0px solid #666666; width: 142px;" class="col_112"> <a href="javascript:openPopup('popup.aspx?sesja=1!2.2.a!1!4')"><asp:Label CssClass="normal" ID="tab_22a_w01_col01" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_112"> <a href="javascript:openPopup('popup.aspx?sesja=1!2.2.a!2!4')"><asp:Label CssClass="normal" ID="tab_22a_w01_col02" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_112"> <a href="javascript:openPopup('popup.aspx?sesja=1!2.2.a!3!4')"><asp:Label CssClass="normal" ID="tab_22a_w01_col03" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_112"> <a href="javascript:openPopup('popup.aspx?sesja=1!2.2.a!4!4')"><asp:Label CssClass="normal" ID="tab_22a_w01_col04" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_112"> <a href="javascript:openPopup('popup.aspx?sesja=1!2.2.a!5!4')"><asp:Label CssClass="normal" ID="tab_22a_w01_col05" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_112"> <a href="javascript:openPopup('popup.aspx?sesja=1!2.2.a!6!4')"><asp:Label CssClass="normal" ID="tab_22a_w01_col06" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_112"> <a href="javascript:openPopup('popup.aspx?sesja=1!2.2.a!7!4')"><asp:Label CssClass="normal" ID="tab_22a_w01_col07" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_112"> <a href="javascript:openPopup('popup.aspx?sesja=1!2.2.a!8!4')"><asp:Label CssClass="normal" ID="tab_22a_w01_col08" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #000000 #000000 #666666 #666666;" class="col_112"> <a href="javascript:openPopup('popup.aspx?sesja=1!2.2.a!9!4')"><asp:Label CssClass="normal" ID="tab_22a_w01_col09" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666; padding-left: 30px;" class="auto-style8">RNs</td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;" class="auto-style9 col_36">02</td>
                <td class="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: thin solid #000000; border-width: thin 0px 0px thin; width: 142px;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.a!1!4')"><asp:Label CssClass="normal" ID="tab_22a_w02_col01" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.a!2!4')"><asp:Label CssClass="normal" ID="tab_22a_w02_col02" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.a!3!4')"><asp:Label CssClass="normal" ID="tab_22a_w02_col03" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.a!4!4')"><asp:Label CssClass="normal" ID="tab_22a_w02_col04" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.a!5!4')"><asp:Label CssClass="normal" ID="tab_22a_w02_col05" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.a!6!4')"><asp:Label CssClass="normal" ID="tab_22a_w02_col06" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.a!7!4')"><asp:Label CssClass="normal" ID="tab_22a_w02_col07" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.a!8!4')"><asp:Label CssClass="normal" ID="tab_22a_w02_col08" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.a!9!4')"><asp:Label CssClass="normal" ID="tab_22a_w02_col09" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666; padding-left: 30px;" class="auto-style8">Nsm</td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;" class="auto-style9 col_36">03</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.a!1!4')"><asp:Label CssClass="normal" ID="tab_22a_w03_col01" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.a!2!4')"><asp:Label CssClass="normal" ID="tab_22a_w03_col02" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.a!3!4')"><asp:Label CssClass="normal" ID="tab_22a_w03_col03" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.a!4!4')"><asp:Label CssClass="normal" ID="tab_22a_w03_col04" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.a!5!4')"><asp:Label CssClass="normal" ID="tab_22a_w03_col05" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.a!6!4')"><asp:Label CssClass="normal" ID="tab_22a_w03_col06" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.a!7!4')"><asp:Label CssClass="normal" ID="tab_22a_w03_col07" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.a!8!4')"><asp:Label CssClass="normal" ID="tab_22a_w03_col08" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.a!9!4')"><asp:Label CssClass="normal" ID="tab_22a_w03_col09" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666; padding-left: 30px;" class="auto-style8">Nkd</td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;" class="auto-style9 col_36">04</td>
                <td class="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: thin solid #000000; width: 142px;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.a!1!4')"><asp:Label CssClass="normal" ID="tab_22a_w04_col01" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.a!2!4')"><asp:Label CssClass="normal" ID="tab_22a_w04_col02" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.a!3!4')"><asp:Label CssClass="normal" ID="tab_22a_w04_col03" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.a!4!4')"><asp:Label CssClass="normal" ID="tab_22a_w04_col04" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.a!5!4')"><asp:Label CssClass="normal" ID="tab_22a_w04_col05" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.a!6!4')"><asp:Label CssClass="normal" ID="tab_22a_w04_col06" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.a!7!4')"><asp:Label CssClass="normal" ID="tab_22a_w04_col07" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.a!8!4')"><asp:Label CssClass="normal" ID="tab_22a_w04_col08" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.a!9!4')"><asp:Label CssClass="normal" ID="tab_22a_w04_col09" runat="server" Text="0"></asp:Label></a></td>
            </tr>
        </table>

              <br />
              <br />
              <div id="Div11"  class="page-break">

           <asp:Label ID="Label3" runat="server">2.2.1 </asp:Label>

        <table  class="dxflInternalEditorTable_MaterialCompact">
            <tr>
                <td class="center" colspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_155">SPRAWY
wg repertoriów
                </td>
                <td class="center borderAll">Razem<br />
                    (kol. 2 do 9)</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_112">Do 3 miesięcy</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_112">Powyżej 3
                    <br />
                    do 6 mies.</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_112">Powyżej 6 do<br />
                    12
                    miesięcy.</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_112">Powyżej 12<br />
                    miesięcy do 2 lat</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_112">Powyżej 2
                    <br />
                    do&nbsp;3
                    lat.</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_112">Powyżej 3
                    <br />
                    do&nbsp;5
                    lat.</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_112">Powyżej 5 <br />
                    do&nbsp;8
                    lat.</td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" class="col_112">Ponad 8 lat</td>
            </tr>
            <tr>
                <td class="center" colspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_155">0</td>
                <td class="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666; width: 142px;" class="col_112">1</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_112">2</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_112">3</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_112">4</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_112">5</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_112">6</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_112">7</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_112">8</td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666; width: 142px;" class="col_112">9</td>
            </tr>
            <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;" class="auto-style8">RC </td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #000000;" class="auto-style9 col_36">01</td>
                <td class="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #000000; border-bottom: 0px solid #666666; width: 142px;" class="col_112"> <a href="javascript:openPopup('popup.aspx?sesja=1!2.2.1!1!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_w01_col01" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_112"> <a href="javascript:openPopup('popup.aspx?sesja=1!2.2.1!2!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_w01_col02" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_112"> <a href="javascript:openPopup('popup.aspx?sesja=1!2.2.1!3!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_w01_col03" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_112"> <a href="javascript:openPopup('popup.aspx?sesja=1!2.2.1!4!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_w01_col04" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_112"> <a href="javascript:openPopup('popup.aspx?sesja=1!2.2.1!5!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_w01_col05" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_112"> <a href="javascript:openPopup('popup.aspx?sesja=1!2.2.1!6!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_w01_col06" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_112"> <a href="javascript:openPopup('popup.aspx?sesja=1!2.2.1!7!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_w01_col07" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_112"> <a href="javascript:openPopup('popup.aspx?sesja=1!2.2.1!8!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_w01_col08" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #000000 #000000 #666666 #666666;" class="col_112"> <a href="javascript:openPopup('popup.aspx?sesja=1!2.2.1!9!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_w01_col09" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666; padding-left: 30px;" class="auto-style8">RNs</td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;" class="auto-style9 col_36">02</td>
                <td class="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: thin solid #000000; border-width: thin 0px 0px thin; width: 142px;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.1!1!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_w02_col01" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.1!2!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_w02_col02" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.1!3!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_w02_col03" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.1!4!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_w02_col04" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.1!5!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_w02_col05" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.1!6!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_w02_col06" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.1!7!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_w02_col07" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.1!8!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_w02_col08" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.1!9!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_w02_col09" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666; padding-left: 30px;" class="auto-style8">Nsm</td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;" class="auto-style9 col_36">03</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.1!1!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_w03_col01" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.1!2!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_w03_col02" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.1!3!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_w03_col03" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.1!4!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_w03_col04" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.1!5!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_w03_col05" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.1!6!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_w03_col06" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.1!7!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_w03_col07" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.1!8!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_w03_col08" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.1!9!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_w03_col09" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666; padding-left: 30px;" class="auto-style8">Nkd</td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;" class="auto-style9 col_36">04</td>
                <td class="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: thin solid #000000; width: 142px;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.1!1!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_w04_col01" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.1!2!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_w04_col02" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.1!3!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_w04_col03" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.1!4!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_w04_col04" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.1!5!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_w04_col05" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.1!6!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_w04_col06" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.1!7!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_w04_col07" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.1!8!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_w04_col08" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.1!9!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_w04_col09" runat="server" Text="0"></asp:Label></a></td>
            </tr>
        </table>

              <br />
              <div id="Div11"  class="page-break">

           <asp:Label ID="Label7" runat="server">2.2.1.a </asp:Label>

        <table  class="dxflInternalEditorTable_MaterialCompact">
            <tr>
                <td class="center" colspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_155">SPRAWY
wg repertoriów
                </td>
                <td class="center borderAll">Razem<br />
                    (kol. 2 do 9)</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_112">Do 3 miesięcy</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_112">Powyżej 3
                    <br />
                    do 6 mies.</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_112">Powyżej 6 do<br />
                    12
                    miesięcy.</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_112">Powyżej 12<br />
                    miesięcy do 2 lat</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_112">Powyżej 2
                    <br />
                    do&nbsp;3
                    lat.</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_112">Powyżej 3
                    <br />
                    do&nbsp;5
                    lat.</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_112">Powyżej 5 <br />
                    do&nbsp;8
                    lat.</td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" class="col_112">Ponad 8 lat</td>
            </tr>
            <tr>
                <td class="center" colspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_155">0</td>
                <td class="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666; width: 142px;" class="col_112">1</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_112">2</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_112">3</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_112">4</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_112">5</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_112">6</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_112">7</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_112">8</td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666; width: 142px;" class="col_112">9</td>
            </tr>
            <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;" class="auto-style8">RC </td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #000000;" class="auto-style9 col_36">01</td>
                <td class="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #000000; border-bottom: 0px solid #666666; width: 142px;" class="col_112"> <a href="javascript:openPopup('popup.aspx?sesja=1!2.2.1.a!1!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_a_w01_col01" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_112"> <a href="javascript:openPopup('popup.aspx?sesja=1!2.2.1.a!2!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_a_w01_col02" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_112"> <a href="javascript:openPopup('popup.aspx?sesja=1!2.2.1.a!3!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_a_w01_col03" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_112"> <a href="javascript:openPopup('popup.aspx?sesja=1!2.2.1.a!4!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_a_w01_col04" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_112"> <a href="javascript:openPopup('popup.aspx?sesja=1!2.2.1.a!5!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_a_w01_col05" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_112"> <a href="javascript:openPopup('popup.aspx?sesja=1!2.2.1.a!6!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_a_w01_col06" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_112"> <a href="javascript:openPopup('popup.aspx?sesja=1!2.2.1.a!7!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_a_w01_col07" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_112"> <a href="javascript:openPopup('popup.aspx?sesja=1!2.2.1.a!8!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_a_w01_col08" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #000000 #000000 #666666 #666666;" class="col_112"> <a href="javascript:openPopup('popup.aspx?sesja=1!2.2.1.a!9!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_a_w01_col09" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666; padding-left: 30px;" class="auto-style8">RNs</td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;" class="auto-style9 col_36">02</td>
                <td class="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: thin solid #000000; border-width: thin 0px 0px thin; width: 142px;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.1.a!1!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_a_w02_col01" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.1.a!2!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_a_w02_col02" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.1.a!3!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_a_w02_col03" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.1.a!4!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_a_w02_col04" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.1.a!5!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_a_w02_col05" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.1.a!6!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_a_w02_col06" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.1.a!7!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_a_w02_col07" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.1.a!8!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_a_w02_col08" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.1.a!9!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_a_w02_col09" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666; padding-left: 30px;" class="auto-style8">Nsm</td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;" class="auto-style9 col_36">03</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.1.a!1!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_a_w03_col01" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.1.a!2!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_a_w03_col02" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.1.a!3!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_a_w03_col03" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.1.a!4!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_a_w03_col04" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.1.a!5!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_a_w03_col05" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.1.a!6!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_a_w03_col06" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.1.a!7!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_a_w03_col07" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.1.a!8!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_a_w03_col08" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.1.a!9!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_a_w03_col09" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666; padding-left: 30px;" class="auto-style8">Nkd</td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;" class="auto-style9 col_36">04</td>
                <td class="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: thin solid #000000; width: 142px;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.1.a!1!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_a_w04_col01" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.1.a!2!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_a_w04_col02" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.1.a!3!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_a_w04_col03" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.1.a!4!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_a_w04_col04" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.1.a!5!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_a_w04_col05" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.1.a!6!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_a_w04_col06" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.1.a!7!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_a_w04_col07" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.1.a!8!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_a_w04_col08" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.1.a!9!4')"><asp:Label CssClass="normal" ID="tab_2_2_1_a_w04_col09" runat="server" Text="0"></asp:Label></a></td>
            </tr>
        </table>

              <br />
              <div id='2.3' class="page-break">
 <strong> Dział 2.3</strong> Czas trwania wszystkich mediacji w sprawie od dnia wydania postanowienia o skierowaniu stron do mediacji do dnia zakończenia mediacji
   <table  style="width: 100%; ">
 <tr>    <td  class="center borderAll" colspan="2"> SPRAWY wg repertoriów</td>    <td class="center borderAll"> Razem<br />
&nbsp;(kol. 2 do 7)</td>
<td class="center borderAll">Do 1 miesiąca</td>
<td class="center borderAll">Powyżej 1 do 2 miesięcy</td>
<td class="center borderAll">Powyżej 2do 3 miesięcy</td>
<td class="center borderAll">Powyżej 3do 6 miesięcy</td>
<td class="center borderAll">Powyżej 6 do 9 miesięcy</td>
<td class="center borderAll">Ponad 9 miesięcy</td>
</tr>
 <tr>    <td  class="center borderAll" colspan="2">0</td>    <td class="col_120 borderAll center">1</td>
<td class="col_120 borderAll center">2</td>
<td class="col_120 borderAll center">3</td>
<td class="col_120 borderAll center">4</td>
<td class="col_120 borderAll center">5</td>
<td class="col_120 borderAll center">6</td>
<td class="col_120 borderAll center">7</td>
</tr>
  <tr>
    <td  class="borderAll wciecie">Rc</td>
  <td  class="borderAll col_36">1</td>
    <td  class="col_120 borderAll center"><a href="javascript:openPopup('popup.aspx?sesja=1!2.3!1!4')"><asp:Label CssClass="normal" ID="tab_2_3_w01_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 borderAll center"><a href="javascript:openPopup('popup.aspx?sesja=1!2.3!2!4')"><asp:Label CssClass="normal" ID="tab_2_3_w01_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 borderAll center"><a href="javascript:openPopup('popup.aspx?sesja=1!2.3!3!4')"><asp:Label CssClass="normal" ID="tab_2_3_w01_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 borderAll center"><a href="javascript:openPopup('popup.aspx?sesja=1!2.3!4!4')"><asp:Label CssClass="normal" ID="tab_2_3_w01_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 borderAll center"><a href="javascript:openPopup('popup.aspx?sesja=1!2.3!5!4')"><asp:Label CssClass="normal" ID="tab_2_3_w01_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 borderAll center"><a href="javascript:openPopup('popup.aspx?sesja=1!2.3!6!4')"><asp:Label CssClass="normal" ID="tab_2_3_w01_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 borderAll center"><a href="javascript:openPopup('popup.aspx?sesja=1!2.3!7!4')"><asp:Label CssClass="normal" ID="tab_2_3_w01_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">Nkd</td>
  <td  class="borderAll col_36">2</td>
    <td  class="col_120 borderAll center"><a href="javascript:openPopup('popup.aspx?sesja=2!2.3!1!4')"><asp:Label CssClass="normal" ID="tab_2_3_w02_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 borderAll center"><a href="javascript:openPopup('popup.aspx?sesja=2!2.3!2!4')"><asp:Label CssClass="normal" ID="tab_2_3_w02_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 borderAll center"><a href="javascript:openPopup('popup.aspx?sesja=2!2.3!3!4')"><asp:Label CssClass="normal" ID="tab_2_3_w02_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 borderAll center"><a href="javascript:openPopup('popup.aspx?sesja=2!2.3!4!4')"><asp:Label CssClass="normal" ID="tab_2_3_w02_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 borderAll center"><a href="javascript:openPopup('popup.aspx?sesja=2!2.3!5!4')"><asp:Label CssClass="normal" ID="tab_2_3_w02_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 borderAll center"><a href="javascript:openPopup('popup.aspx?sesja=2!2.3!6!4')"><asp:Label CssClass="normal" ID="tab_2_3_w02_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 borderAll center"><a href="javascript:openPopup('popup.aspx?sesja=2!2.3!7!4')"><asp:Label CssClass="normal" ID="tab_2_3_w02_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
    </table>
 </div>

        <br />
        </div>
        </div>
        <br />
        </div>
        <br />
       <div id='2.3.1' class="page-break">
 <strong> Dział 2.3.1</strong> . Czas trwania mediacji niezakończonych w sprawie od dnia wydania postanowienia o skierowaniu stron do mediacji do ostatniego dnia okresu sprawozdawczego
   <table  style="width: 100%; ">
        <tr>
            <td  class="center borderAll" colspan="2"> SPRAWY wg repertoriów</td>    <td class="center borderAll"> Razem<br />
&nbsp;(kol. 2 do 7)</td>
<td class="center borderAll">Do 1 miesiąca</td>
<td class="center borderAll">Powyżej 1 do 2 miesięcy</td>
<td class="center borderAll">Powyżej 2do 3 miesięcy</td>
<td class="center borderAll">Powyżej 3do 6 miesięcy</td>
<td class="center borderAll">Powyżej 6 do 9 miesięcy</td>
<td class="center borderAll">Ponad 9 miesięcy</td>
        </tr>
 <tr>    <td  class="center borderAll" colspan="2">0</td>    <td class="center borderAll">1</td>
<td class="center borderAll">2</td>
<td class="center borderAll">3</td>
<td class="center borderAll">4</td>
<td class="center borderAll">5</td>
<td class="center borderAll">6</td>
<td class="center borderAll">7</td>
</tr>
  <tr>
    <td  class="borderAll wciecie">Rc</td>
  <td  class="borderAll col_36">1</td>
    <td  class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.3.1!1!4')"><asp:Label CssClass="normal" ID="tab_2_3_1_w01_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.3.1!2!4')"><asp:Label CssClass="normal" ID="tab_2_3_1_w01_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.3.1!3!4')"><asp:Label CssClass="normal" ID="tab_2_3_1_w01_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.3.1!4!4')"><asp:Label CssClass="normal" ID="tab_2_3_1_w01_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.3.1!5!4')"><asp:Label CssClass="normal" ID="tab_2_3_1_w01_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.3.1!6!4')"><asp:Label CssClass="normal" ID="tab_2_3_1_w01_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.3.1!7!4')"><asp:Label CssClass="normal" ID="tab_2_3_1_w01_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">Nkd</td>
  <td  class="borderAll col_36">2</td>
    <td  class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.3.1!1!4')"><asp:Label CssClass="normal" ID="tab_2_3_1_w02_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.3.1!2!4')"><asp:Label CssClass="normal" ID="tab_2_3_1_w02_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.3.1!3!4')"><asp:Label CssClass="normal" ID="tab_2_3_1_w02_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.3.1!4!4')"><asp:Label CssClass="normal" ID="tab_2_3_1_w02_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.3.1!5!4')"><asp:Label CssClass="normal" ID="tab_2_3_1_w02_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.3.1!6!4')"><asp:Label CssClass="normal" ID="tab_2_3_1_w02_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_120 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.3.1!7!4')"><asp:Label CssClass="normal" ID="tab_2_3_1_w02_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
    </table>
 </div>

       <br />
        <div id='3' class="page-break">
 <strong> Dział 3</strong> Wyznaczenie pierwszej rozprawy / posiedzenia spraw (od dnia wpływu/wpisu sprawy, wraz ze sprawami zawieszonymi poprzednio za-kreślonymi, do dnia, w którym odbyła się pierwsza rozprawa/posiedzenie).
   <table  style="width: 100%; ">
 <tr>    <td  class="center borderAll" colspan="2" rowspan="2"> Sprawy z repertorium</td>    <td class="center borderAll" colspan="8"> Od daty wpływu sprawy w danym lub poprzednim okresie sprawozdawczym do pierwszej rozprawy (posiedzenia) w okresie sprawozdawczym upłynął okres</td>
</tr>
 <tr>    <td class="center borderAll"> razem
     <br />
     (kol. 2 do 8)</td>
<td class="center borderAll">do 1 mies.</td>
<td class="center borderAll">pow. 1 do 2 mies.</td>
<td class="center borderAll">pow. 1 do 2 mies.</td>
<td class="center borderAll">pow. 3 do 4 mies.</td>
<td class="center borderAll">pow. 4 do 6 mies.</td>
<td class="center borderAll">pow. 6 do 12 miesięcy</td>
<td class="center borderAll">ponad 12 miesięcy</td>
</tr>
 <tr>    <td  class="center borderAll" colspan="2">0</td>    <td class="center borderAll">1</td>
<td class="center borderAll">2</td>
<td class="center borderAll">3</td>
<td class="center borderAll">4</td>
<td class="center borderAll">5</td>
<td class="center borderAll">6</td>
<td class="center borderAll">7</td>
<td class="center borderAll">8</td>
</tr>
  <tr>
    <td  class="borderAll wciecie">RC</td>
  <td  class="borderAll col_36">1</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!3!1!4')"><asp:Label CssClass="normal" ID="tab_3_w01_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!3!2!4')"><asp:Label CssClass="normal" ID="tab_3_w01_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!3!3!4')"><asp:Label CssClass="normal" ID="tab_3_w01_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!3!4!4')"><asp:Label CssClass="normal" ID="tab_3_w01_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!3!5!4')"><asp:Label CssClass="normal" ID="tab_3_w01_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!3!6!4')"><asp:Label CssClass="normal" ID="tab_3_w01_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!3!7!4')"><asp:Label CssClass="normal" ID="tab_3_w01_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!3!8!4')"><asp:Label CssClass="normal" ID="tab_3_w01_c08" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">Rns</td>
  <td  class="borderAll col_36">2</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!3!1!4')"><asp:Label CssClass="normal" ID="tab_3_w02_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!3!2!4')"><asp:Label CssClass="normal" ID="tab_3_w02_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!3!3!4')"><asp:Label CssClass="normal" ID="tab_3_w02_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!3!4!4')"><asp:Label CssClass="normal" ID="tab_3_w02_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!3!5!4')"><asp:Label CssClass="normal" ID="tab_3_w02_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!3!6!4')"><asp:Label CssClass="normal" ID="tab_3_w02_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!3!7!4')"><asp:Label CssClass="normal" ID="tab_3_w02_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!3!8!4')"><asp:Label CssClass="normal" ID="tab_3_w02_c08" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">Nsm</td>
  <td  class="borderAll col_36">3</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!3!1!4')"><asp:Label CssClass="normal" ID="tab_3_w03_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!3!2!4')"><asp:Label CssClass="normal" ID="tab_3_w03_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!3!3!4')"><asp:Label CssClass="normal" ID="tab_3_w03_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!3!4!4')"><asp:Label CssClass="normal" ID="tab_3_w03_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!3!5!4')"><asp:Label CssClass="normal" ID="tab_3_w03_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!3!6!4')"><asp:Label CssClass="normal" ID="tab_3_w03_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!3!7!4')"><asp:Label CssClass="normal" ID="tab_3_w03_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!3!8!4')"><asp:Label CssClass="normal" ID="tab_3_w03_c08" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">Nkd</td>
  <td  class="borderAll col_36">4</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!3!1!4')"><asp:Label CssClass="normal" ID="tab_3_w04_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!3!2!4')"><asp:Label CssClass="normal" ID="tab_3_w04_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!3!3!4')"><asp:Label CssClass="normal" ID="tab_3_w04_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!3!4!4')"><asp:Label CssClass="normal" ID="tab_3_w04_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!3!5!4')"><asp:Label CssClass="normal" ID="tab_3_w04_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!3!6!4')"><asp:Label CssClass="normal" ID="tab_3_w04_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!3!7!4')"><asp:Label CssClass="normal" ID="tab_3_w04_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!3!8!4')"><asp:Label CssClass="normal" ID="tab_3_w04_c08" runat="server" Text="0"></asp:Label></a></td>
  </tr>
    </table>
 </div>

       <br /><strong>Dział 4.</strong> Zezwolenie na wyjazd dzieci za granicę (nie dotyczy przysposobień przez osoby zamieszkałe za granicą) (należy podać liczbę dzieci w ciągu okresu sprawozdawczego): <br />
          <table style="width:100%;">
              <tr>
                  <td class="col_36">&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
              </tr>
              <tr>
                  <td class="col_36">&nbsp;</td>
                  <td>Wpłynęło wniosków </td>
                 <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!4!1!4')"><asp:Label CssClass="normal" ID="tab_4_w01_c01" runat="server" Text="0"></asp:Label></a></td>
              </tr>
              <tr>
                  <td class="col_36">&nbsp;</td>
                  <td>Zezwolono na wyjazd </td>
                      <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!4!1!4')"><asp:Label CssClass="normal" ID="tab_4_w02_c01" runat="server" Text="0"></asp:Label></a></td>
              </tr>
          </table>
          <br />
          <br />
          <div id="5" class="page-break">
              <strong>Dział 5</strong> Prawomocne orzeczenia w sprawach o alimenty poza alimentami orzeczonymi w trakcie rozwodu (sprawy)
             <table  style="width: 100%; ">
                  <tr>
                      <td class="center borderAll" colspan="3" rowspan="3">RODZAJE SPRAW O ALIMENTY </td>
                      <td class="center borderAll" rowspan="3">Ogółem (kol. 2 do 5) </td>
                      <td class="center borderAll" colspan="4">Liczba spraw, w których powództwo</td>
                      <td class="center borderAll" rowspan="3">Wysokość zasądzonych alimentów (ogólna kwota w złotych) </td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="2">uwzględniono w całości, w części i ponad żądanie zawarto ugodę </td>
                      <td class="center borderAll" colspan="2">zawarto ugodę</td>
                  </tr>
                  <tr>
                      <td class="center borderAll">o zasądzenie pierwszy raz</td>
                      <td class="center borderAll">o zmianę wy-sokości</td>
                      <td class="center borderAll">o zasądzenie pierwszy raz</td>
                      <td class="center borderAll">o zmianę wy-sokości</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="3">0</td>
                      <td class="center borderAll">1</td>
                      <td class="center borderAll">2</td>
                      <td class="center borderAll">3</td>
                      <td class="center borderAll">4</td>
                      <td class="center borderAll">5</td>
                      <td class="center borderAll">6</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">Razem (wiersz 2 do 7)</td>
                      <td class="borderAll col_36">1</td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5!1!4')">
                          <asp:Label ID="tab_5_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5!2!4')">
                          <asp:Label ID="tab_5_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5!3!4')">
                          <asp:Label ID="tab_5_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5!4!4')">
                          <asp:Label ID="tab_5_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5!5!4')">
                          <asp:Label ID="tab_5_w01_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!5!6!4')">
                          <asp:Label ID="tab_5_w01_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="6">z powodu</td>
                      <td class="borderAll wciecie">dzieci (w tym małoletnich) </td>
                      <td class="borderAll col_36">2</td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!5!1!4')">
                          <asp:Label ID="tab_5_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!5!2!4')">
                          <asp:Label ID="tab_5_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!5!3!4')">
                          <asp:Label ID="tab_5_w02_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!5!4!4')">
                          <asp:Label ID="tab_5_w02_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!5!5!4')">
                          <asp:Label ID="tab_5_w02_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!5!6!4')">
                          <asp:Label ID="tab_5_w02_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">rodziców </td>
                      <td class="borderAll col_36">3</td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!5!1!4')">
                          <asp:Label ID="tab_5_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!5!2!4')">
                          <asp:Label ID="tab_5_w03_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!5!3!4')">
                          <asp:Label ID="tab_5_w03_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!5!4!4')">
                          <asp:Label ID="tab_5_w03_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!5!5!4')">
                          <asp:Label ID="tab_5_w03_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!5!6!4')">
                          <asp:Label ID="tab_5_w03_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">małżonków </td>
                      <td class="borderAll col_36">4</td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!5!1!4')">
                          <asp:Label ID="tab_5_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!5!2!4')">
                          <asp:Label ID="tab_5_w04_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!5!3!4')">
                          <asp:Label ID="tab_5_w04_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!5!4!4')">
                          <asp:Label ID="tab_5_w04_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!5!5!4')">
                          <asp:Label ID="tab_5_w04_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!5!6!4')">
                          <asp:Label ID="tab_5_w04_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">małżonków i ich dzieci </td>
                      <td class="borderAll col_36">5</td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!5!1!4')">
                          <asp:Label ID="tab_5_w05_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!5!2!4')">
                          <asp:Label ID="tab_5_w05_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!5!3!4')">
                          <asp:Label ID="tab_5_w05_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!5!4!4')">
                          <asp:Label ID="tab_5_w05_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!5!5!4')">
                          <asp:Label ID="tab_5_w05_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!5!6!4')">
                          <asp:Label ID="tab_5_w05_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">o ustalenie ojcostwa </td>
                      <td class="borderAll col_36">6</td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!5!1!4')">
                          <asp:Label ID="tab_5_w06_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!5!2!4')">
                          <asp:Label ID="tab_5_w06_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!5!3!4')">
                          <asp:Label ID="tab_5_w06_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!5!4!4')">
                          <asp:Label ID="tab_5_w06_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!5!5!4')">
                          <asp:Label ID="tab_5_w06_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!5!6!4')">
                          <asp:Label ID="tab_5_w06_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">innych osób </td>
                      <td class="borderAll col_36">7</td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!5!1!4')">
                          <asp:Label ID="tab_5_w07_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!5!2!4')">
                          <asp:Label ID="tab_5_w07_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!5!3!4')">
                          <asp:Label ID="tab_5_w07_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!5!4!4')">
                          <asp:Label ID="tab_5_w07_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!5!5!4')">
                          <asp:Label ID="tab_5_w07_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!5!6!4')">
                          <asp:Label ID="tab_5_w07_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
              </table>
          </div>
          <br />
          <div id="6.1.a" class="page-break">
              <strong>Dział 6.1.a</strong> Prawomocne orzeczenia w sprawach o alimenty poza alimentami orzeczonymi w trakcie rozwodu (sprawy)
             <table  style="width: 100%; ">
                  <tr>
                      <td class="center borderAll" colspan="5">Sądowe</td>
                      <td class="center borderAll">Liczba</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="5">0</td>
                      <td class="center borderAll">1</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="5">wpływ</td>
                      <td class="borderAll wciecie" rowspan="5">Liczba</td>
                      <td class="borderAll wciecie" rowspan="3">spraw w których</td>
                      <td class="borderAll wciecie">przeprowadzono spotkanie informacyjne (art. 183 8 § 4 kpc)</td>
                      <td class="borderAll col_36">1</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.1.a!1!4')">
                          <asp:Label ID="tab_6_1_a_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">strony skierowano do mediacji po udziale w spotkaniu informacyjnym</td>
                      <td class="borderAll col_36">2</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.1.a!1!4')">
                          <asp:Label ID="tab_6_1_a_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">strony skierowano do mediacji na podstawie postanowienia sądu (art. 183 8 § 1 kpc) </td>
                      <td class="borderAll col_36">3</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.1.a!1!4')">
                          <asp:Label ID="tab_6_1_a_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">mediacji ogółem (w jednej sprawie może być więcej niż jedna mediacja) </td>
                      <td class="borderAll col_36">4</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!6.1.a!1!4')">
                          <asp:Label ID="tab_6_1_a_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">protokołów złożonych przez mediatorów po podjęciu mediacji przez strony (art. 183 13 § 2 kpc) </td>
                      <td class="borderAll col_36">5</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!6.1.a!1!4')">
                          <asp:Label ID="tab_6_1_a_w05_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="8">Rozstrzy-gnięcie<br />
&nbsp;przed</td>
                      <td class="borderAll wciecie" rowspan="3">sądem</td>
                      <td class="borderAll wciecie" rowspan="3">w sprawach skierowanych w trybie (art. 183 <sup>8</sup> § 1 kpc) - liczba </td>
                      <td class="borderAll wciecie">ugód zawartych przed mediatorem </td>
                      <td class="borderAll col_36">6</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!6.1.a!1!4')">
                          <asp:Label ID="tab_6_1_a_w06_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">spraw, w których nie zawarto ugody przed mediatorem</td>
                      <td class="borderAll col_36">7</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!6.1.a!1!4')">
                          <asp:Label ID="tab_6_1_a_w07_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">spraw, w których postępowanie mediacyjne przed mediatorem zakończyło się w inny sposób niż wykazany w w . 06 i 07</td>
                      <td class="borderAll col_36">8</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!6.1.a!1!4')">
                          <asp:Label ID="tab_6_1_a_w08_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="5">Mediatorem</td>
                      <td class="borderAll wciecie" colspan="2">Zatwierdzono ugodę (liczba spraw w których sąd zatwierdził ugodę lecz nie umorzył postępowania) </td>
                      <td class="borderAll col_36">9</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!6.1.a!1!4')">
                          <asp:Label ID="tab_6_1_a_w09_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">w tym nadano klauzulę wykonalności w trybie art. 183<sup>14</sup>§2 kpc</td>
                      <td class="borderAll col_36">10</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!6.1.a!1!4')">
                          <asp:Label ID="tab_6_1_a_w10_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">Zatwierdzono ugodę i umorzono postępowanie (art. 183 <sup>14</sup> § 1 i 2 kpc) </td>
                      <td class="borderAll col_36">11</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!6.1.a!1!4')">
                          <asp:Label ID="tab_6_1_a_w11_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">w tym nadano klauzulę wykonalności w trybie art. 183<sup>14</sup>§2 kpc</td>
                      <td class="borderAll col_36">12</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!6.1.a!1!4')">
                          <asp:Label ID="tab_6_1_a_w12_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">Odmówiono zatwierdzenia ugody w trybie (art. 183<sup>14 </sup>§ 3 kpc) </td>
                      <td class="borderAll col_36">13</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!6.1.a!1!4')">
                          <asp:Label ID="tab_6_1_a_w13_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
    <td  class="borderAll wciecie" colspan="5">Pozasądowe</td>
    <td  class="borderAll center">Liczba</td>
  </tr>
                  <tr>
    <td  class="borderAll wciecie" colspan="4">Liczba wniosków o zatwierdzenie ugody złożonych przez stronę </td>
  <td  class="borderAll col_36">14</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!6.1.a!1!4')"><asp:Label CssClass="normal" ID="tab_6_1_a_w14_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="4">Liczba protokołów złożonych przez mediatorów po podjęciu mediacji przez strony, zawierających ugody (art. 183 13 § 1 kpc) </td>
  <td  class="borderAll col_36">15</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!6.1.a!1!4')"><asp:Label CssClass="normal" ID="tab_6_1_a_w15_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="4">Zatwierdzono ugodę </td>
  <td  class="borderAll col_36">16</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!6.1.a!1!4')"><asp:Label CssClass="normal" ID="tab_6_1_a_w16_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="4">w tym przez nadanie klauzuli wykonalności (art. 183 14 § 2 kpc) </td>
  <td  class="borderAll col_36">17</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!6.1.a!1!4')"><asp:Label CssClass="normal" ID="tab_6_1_a_w17_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="4">Odmówiono zatwierdzenia ugody w trybie (art. 18314 § 3 kpc)</td>
  <td  class="borderAll col_36">18</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!6.1.a!1!4')"><asp:Label CssClass="normal" ID="tab_6_1_a_w18_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
              </table>
          </div>
          <br />
          <br />
          <div id="6.1.b" class="page-break">
              <strong>Dział 6.1.b</strong> Prawomocne orzeczenia w sprawach o alimenty poza alimentami orzeczonymi w trakcie rozwodu (sprawy)
             <table  style="width: 100%; ">
                  <tr>
                      <td class="center borderAll" colspan="3" rowspan="2">Zakres ugody</td>
                      <td class="center borderAll" colspan="2">Z mediacji</td>
                  </tr>
                  <tr>
                      <td class="center borderAll">sądowej </td>
                      <td class="center borderAll">pozasądowej</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="3">0</td>
                      <td class="center borderAll">1</td>
                      <td class="center borderAll">2</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">OGÓŁEM (wiersze 02 do 06+09)</td>
                      <td class="borderAll col_36">1</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.1.b!1!4')">
                          <asp:Label ID="tab_6_1_b_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.1.b!2!4')">
                          <asp:Label ID="tab_6_1_b_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">Ustalono wysokość alimentów </td>
                      <td class="borderAll col_36">2</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.1.b!1!4')">
                          <asp:Label ID="tab_6_1_b_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.1.b!2!4')">
                          <asp:Label ID="tab_6_1_b_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">Ustalono kontakty z dzieckiem </td>
                      <td class="borderAll col_36">3</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.1.b!1!4')">
                          <asp:Label ID="tab_6_1_b_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.1.b!2!4')">
                          <asp:Label ID="tab_6_1_b_w03_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">Ustalono miejsce zamieszkania małoletniego </td>
                      <td class="borderAll col_36">4</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!6.1.b!1!4')">
                          <asp:Label ID="tab_6_1_b_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!6.1.b!2!4')">
                          <asp:Label ID="tab_6_1_b_w04_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">Sposób wykonywania władzy rodzicielskiej (art. 97 § 2, art. 106, art. 107 kro) </td>
                      <td class="borderAll col_36">5</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!6.1.b!1!4')">
                          <asp:Label ID="tab_6_1_b_w05_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!6.1.b!2!4')">
                          <asp:Label ID="tab_6_1_b_w05_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">Sprawy w trybie Konwencji haskiej z 1980 r. dot. uprowadzenia (w. 07+w. 08) </td>
                      <td class="borderAll col_36">6</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!6.1.b!1!4')">
                          <asp:Label ID="tab_6_1_b_w06_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!6.1.b!2!4')">
                          <asp:Label ID="tab_6_1_b_w06_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="2">w tym</td>
                      <td class="borderAll wciecie">o powrót dziecka</td>
                      <td class="borderAll col_36">7</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!6.1.b!1!4')">
                          <asp:Label ID="tab_6_1_b_w07_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!6.1.b!2!4')">
                          <asp:Label ID="tab_6_1_b_w07_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">o wykonywanie kontaktów</td>
                      <td class="borderAll col_36">8</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!6.1.b!1!4')">
                          <asp:Label ID="tab_6_1_b_w08_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!6.1.b!2!4')">
                          <asp:Label ID="tab_6_1_b_w08_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">inne</td>
                      <td class="borderAll col_36">9</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!6.1.b!1!4')">
                          <asp:Label ID="tab_6_1_b_w09_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!6.1.b!2!4')">
                          <asp:Label ID="tab_6_1_b_w09_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
              </table>
          </div>
          <br />
          <div id="6.2" class="page-break">
              <strong>Dział 6.2</strong> 2 Ewidencja i wyniki postępowania mediacyjnego w sprawach nieletnich (proszę podać liczbę spraw, w których postępowanie zakończyło się ugodą lub w inny sposób)
             <table  style="width: 100%; ">
                  <tr>
                      <td class="center borderAll" colspan="2">Wyszczególnienie </td>
                      <td class="center borderAll">Razem</td>
                      <td class="center borderAll">Ugoda </td>
                      <td class="center borderAll">Brak ugody</td>
                      <td class="center borderAll">Inny sposób</td>
                      <td class="center borderAll">Liczba</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="2">0</td>
                      <td class="center borderAll">1</td>
                      <td class="center borderAll">2</td>
                      <td class="center borderAll">3</td>
                      <td class="center borderAll">4</td>
                      <td class="center borderAll">5</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">OGÓŁEM (wiersze 02 do 03)</td>
                      <td class="borderAll col_36">1</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.2!1!4')">
                          <asp:Label ID="tab_6_2_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.2!2!4')">
                          <asp:Label ID="tab_6_2_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.2!3!4')">
                          <asp:Label ID="tab_6_2_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.2!4!4')">
                          <asp:Label ID="tab_6_2_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!6.2!5!4')">
                          <asp:Label ID="tab_6_2_w01_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Prowadzonego przez instytucje</td>
                      <td class="borderAll col_36">2</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.2!1!4')">
                          <asp:Label ID="tab_6_2_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.2!2!4')">
                          <asp:Label ID="tab_6_2_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.2!3!4')">
                          <asp:Label ID="tab_6_2_w02_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.2!4!4')">
                          <asp:Label ID="tab_6_2_w02_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!6.2!5!4')">
                          <asp:Label ID="tab_6_2_w02_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Prowadzonego przez osoby uprawnione</td>
                      <td class="borderAll col_36">3</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.2!1!4')">
                          <asp:Label ID="tab_6_2_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.2!2!4')">
                          <asp:Label ID="tab_6_2_w03_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.2!3!4')">
                          <asp:Label ID="tab_6_2_w03_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.2!4!4')">
                          <asp:Label ID="tab_6_2_w03_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!6.2!5!4')">
                          <asp:Label ID="tab_6_2_w03_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Liczba mediacji wpisanych w okresie statystycznym do Wykazu Med</td>
                      <td class="borderAll col_36">4</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!6.2!1!4')">
                          <asp:Label ID="tab_6_2_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!6.2!2!4')">
                          <asp:Label ID="tab_6_2_w04_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!6.2!3!4')">
                          <asp:Label ID="tab_6_2_w04_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!6.2!4!4')">
                          <asp:Label ID="tab_6_2_w04_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!6.2!5!4')">
                          <asp:Label ID="tab_6_2_w04_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Liczba zakończonych postępowań mediacyjnych (zakreślonych pozycji w wykazie mediacji bez względu na przyczynę zakreślenia)</td>
                      <td class="borderAll col_36">5</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!6.2!1!4')">
                          <asp:Label ID="tab_6_2_w05_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!6.2!2!4')">
                          <asp:Label ID="tab_6_2_w05_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!6.2!3!4')">
                          <asp:Label ID="tab_6_2_w05_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!6.2!4!4')">
                          <asp:Label ID="tab_6_2_w05_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!6.2!5!4')">
                          <asp:Label ID="tab_6_2_w05_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">warunki ugody</td>
                      <td class="borderAll center" colspan="5">Liczby rodzajów form</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Zadośćuczynienie lub odszkodowanie (finansowe)dla pokrzywdzonego </td>
                      <td class="borderAll col_36">6</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!6.2!1!4')">
                          <asp:Label ID="tab_6_2_w06_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td colspan="4" rowspan="6">&nbsp;</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Świadczenie pieniężne na cele społeczne </td>
                      <td class="borderAll col_36">7</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!6.2!1!4')">
                          <asp:Label ID="tab_6_2_w07_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Przeproszenie pokrzywdzonego </td>
                      <td class="borderAll col_36">8</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!6.2!1!4')">
                          <asp:Label ID="tab_6_2_w08_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Wykonanie pracy na rzecz pokrzywdzonego </td>
                      <td class="borderAll col_36">9</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!6.2!1!4')">
                          <asp:Label ID="tab_6_2_w09_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Wykonanie pracy na cele społeczne </td>
                      <td class="borderAll col_36">10</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!6.2!1!4')">
                          <asp:Label ID="tab_6_2_w10_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Inne </td>
                      <td class="borderAll col_36">11</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!6.2!1!4')">
                          <asp:Label ID="tab_6_2_w11_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
              </table>
          </div>
          <br />
          <div id="7" class="page-break">
              <strong>Dział 7</strong> Stan wykazu Opm (stan w ostatnim dniu okresu sprawozdawczego)
             <table  style="width: 100%; ">
                  <tr>
                      <td class="center borderAll" rowspan="3">Ogółem</td>
                      <td class="center borderAll" colspan="4" rowspan="2">Liczba małoletnich pod opieką</td>
                      <td class="center borderAll" rowspan="3">Liczba małoletnich, których rodzicom ograniczono władzę rodzicielską </td>
                      <td class="center borderAll" rowspan="3">W tym (rubr. 6) przez stałą kontrolę kuratora sądowego </td>
                      <td class="center borderAll" rowspan="3">Liczba małoletnich matek</td>
                      <td class="center borderAll" colspan="2">Liczba małoletnich </td>
                  </tr>
                  <tr>
                      <td class="center borderAll">wobec których zarządzono umieszczenie</td>
                      <td class="center borderAll">którzy oczekują na umieszczenie</td>
                  </tr>
                  <tr>
                      <td class="center borderAll">ogółem <br />
                          (rubr. 3 do 5)</td>
                      <td class="center borderAll">których rodziców pozbawiono władzy rodzicielskiej</td>
                      <td class="center borderAll">których rodzicom zawieszono władzę rodzicielską</td>
                      <td class="center borderAll">sieroty naturalne</td>
                      <td class="center borderAll" colspan="2">w rodzinie zastępczej</td>
                  </tr>
                  <tr>
                      <td class="center borderAll">1</td>
                      <td class="center borderAll">2</td>
                      <td class="center borderAll">3</td>
                      <td class="center borderAll">4</td>
                      <td class="center borderAll">5</td>
                      <td class="center borderAll">6</td>
                      <td class="center borderAll">7</td>
                      <td class="center borderAll">8</td>
                      <td class="center borderAll">9</td>
                      <td class="center borderAll">10</td>
                  </tr>
                  <tr>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7!1!4')">
                          <asp:Label ID="tab_7_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7!2!4')">
                          <asp:Label ID="tab_7_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7!3!4')">
                          <asp:Label ID="tab_7_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7!4!4')">
                          <asp:Label ID="tab_7_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7!5!4')">
                          <asp:Label ID="tab_7_w01_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7!6!4')">
                          <asp:Label ID="tab_7_w01_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7!7!4')">
                          <asp:Label ID="tab_7_w01_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7!8!4')">
                          <asp:Label ID="tab_7_w01_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7!9!4')">
                          <asp:Label ID="tab_7_w01_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!7!10!4')">
                          <asp:Label ID="tab_7_w01_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
              </table>
          </div>
          <br />
          <br />
          <div id="8" class="page-break">
              <strong>Dział 8</strong> Wykonywane orzeczenia sądu o umieszczeniu małoletnich w placówkach opiekuńczo-wychowawczych (liczba małoletnich)
             <table  style="width: 100%; ">
                  <tr>
                      <td class="center borderAll" rowspan="2">Liczba orzeczeń wykonywanych wg stanu w ostatnim dniu poprzedniego okresu sprawozdawczego</td>
                      <td class="center borderAll" colspan="2">PRZTBYŁO</td>
                      <td class="center borderAll" colspan="6">UBYŁO Z POWODU</td>
                      <td class="center borderAll" rowspan="2">Stan w ostatnim dniu okresu sprawozdawczego (orzeczenia do wykon.) (przebywający + oczekujący) (rubr. 1+2+3) – – (rubr. 4 do 9) </td>
                      <td class="center borderAll" rowspan="2">W tym ocze- kujących na umieszczenie (orzeczenia dotychczas niewykonane) </td>
                      <td class="center borderAll" rowspan="2">W tym powyżej 3 miesięcy </td>
                  </tr>
                  <tr>
                      <td class="center borderAll">wydano orzeczeń</td>
                      <td class="center borderAll">z innych sądów</td>
                      <td class="center borderAll">powrotu do zresocjalizo-wanego środowiska rodzinnego</td>
                      <td class="center borderAll">przekazania do rodziny zastępczej</td>
                      <td class="center borderAll">przysposo-bienia</td>
                      <td class="center borderAll">skierowania do rodzinnego domu dziecka</td>
                      <td class="center borderAll">przesłania do innych sądów</td>
                      <td class="center borderAll">innego</td>
                  </tr>
                  <tr>
                      <td class="center borderAll">1</td>
                      <td class="center borderAll">2</td>
                      <td class="center borderAll">3</td>
                      <td class="center borderAll">4</td>
                      <td class="center borderAll">5</td>
                      <td class="center borderAll">6</td>
                      <td class="center borderAll">7</td>
                      <td class="center borderAll">8</td>
                      <td class="center borderAll">9</td>
                      <td class="center borderAll">10</td>
                      <td class="center borderAll">11</td>
                      <td class="center borderAll">12</td>
                  </tr>
                  <tr>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8!1!4')">
                          <asp:Label ID="tab_8_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8!2!4')">
                          <asp:Label ID="tab_8_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8!3!4')">
                          <asp:Label ID="tab_8_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8!4!4')">
                          <asp:Label ID="tab_8_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8!5!4')">
                          <asp:Label ID="tab_8_w01_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8!6!4')">
                          <asp:Label ID="tab_8_w01_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8!7!4')">
                          <asp:Label ID="tab_8_w01_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8!8!4')">
                          <asp:Label ID="tab_8_w01_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8!9!4')">
                          <asp:Label ID="tab_8_w01_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8!10!4')">
                          <asp:Label ID="tab_8_w01_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8!11!4')">
                          <asp:Label ID="tab_8_w01_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!8!12!4')">
                          <asp:Label ID="tab_8_w01_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
              </table>
          </div>
          <br />
          <div id="9" class="page-break">
              <strong>Dział 9</strong> Stan wykazu „ALK” (stan w ostatnim dniu okresu sprawozdawczego)
             <table  style="width: 100%; ">
                  <tr>
                      <td class="center borderAll" rowspan="3"></td>
                      <td class="center borderAll" colspan="4">Liczba osób, wobec których wykonywane są orzeczenia o obowiązku poddania się leczeniu </td>
                      <td class="center borderAll" rowspan="3">Liczba osób oczekujących na umieszczenie w zakładzie stacjonarnym</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" rowspan="2">w zakładzie niestacjonarnym</td>
                      <td class="center borderAll" rowspan="2">w zakładzie stacjonarnym </td>
                      <td class="center borderAll" colspan="2">wobec których orzeczono nadzór kuratora*) i jest wykonywany przez kuratora</td>
                  </tr>
                  <tr>
                      <td class="center borderAll">Zawodowego </td>
                      <td class="center borderAll">społecznego</td>
                  </tr>
                  <tr>
                      <td class="center borderAll">1</td>
                      <td class="center borderAll">2</td>
                      <td class="center borderAll">3</td>
                      <td class="center borderAll">4</td>
                      <td class="center borderAll">5</td>
                      <td class="center borderAll">6</td>
                  </tr>
                  <tr>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!9!1!4')">
                          <asp:Label ID="tab_9_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!9!2!4')">
                          <asp:Label ID="tab_9_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!9!3!4')">
                          <asp:Label ID="tab_9_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!9!4!4')">
                          <asp:Label ID="tab_9_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!9!5!4')">
                          <asp:Label ID="tab_9_w01_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!9!6!4')">
                          <asp:Label ID="tab_9_w01_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
              </table>
          </div>
          *) Niezależnie od rodzaju zakładu.<br />
          <br />
          <strong>Dział 10.</strong> Liczba osób ubezwłasnowolnionych (wykaz Op) (stan w ostatnim dniu okresu sprawozdawczego)
          <br />
          <table style="width:100%;">
              <tr>
                  <td>pod opieką </td>
                 <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!10!1!4')">
                          <asp:Label ID="tab_10_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  <td>pod kuratelą </td>
                   <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!10!2!4')">
                          <asp:Label ID="tab_10_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
              </tr>
              <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
              </tr>
          </table>
          <br />
          <div id="Div11_1"  class="page-break">
              &nbsp;<br />
     <asp:Label ID="tabela5Label" runat="server">Dział 11.1. Terminowość postępowania międzyinstancyjnego  w pierwszej instancji</asp:Label>
     <br />
        <table  style="width:100%;">
            <tr>
                <td class="center" colspan="2" rowspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">Środki odwoławcze, które zostały przekazane do rozpoznania sądowi II instancji</td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" colspan="7">Z tego od daty orzeczenia sądu rejonowego do daty przekazania do sądu II instancji upłynął okres</td>
            </tr>
            <tr>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;">Ogółem
                    (kol. 2 do 7)</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;">do 2 mies.</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;">pow. 2 do 3 mies.</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;">pow. 3 do&nbsp; 6<br />
                    miesięcy.</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">pow. 6 do&nbsp; 12<br />
                    miesięcy.</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">pow. 12 do&nbsp;2<br />
                    lat.</td>
                <td class="borderAll center">ponad 2 lata</td>
            </tr>
            <tr>
                <td class="center" colspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">0</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="mssGrayMiddle">1</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">2</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">3</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">4</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;">5</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;">6</td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666; width: 142px;">7</td>
            </tr>
            <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;">Apelacje </td>
                <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #000000;" class="col_36">01</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="mssGrayMiddle"> <a href="javascript:openPopup('popup.aspx?sesja=1!11.1!1!4')"><asp:Label CssClass="normal" ID="tab_111_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;"> <a href="javascript:openPopup('popup.aspx?sesja=1!11.1!2!4')"><asp:Label CssClass="normal" ID="tab_111_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;"> <a href="javascript:openPopup('popup.aspx?sesja=1!11.1!3!4')"><asp:Label CssClass="normal" ID="tab_111_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;"> <a href="javascript:openPopup('popup.aspx?sesja=1!11.1!4!4')"><asp:Label CssClass="normal" ID="tab_111_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;"> <a href="javascript:openPopup('popup.aspx?sesja=1!11.1!5!4')"><asp:Label CssClass="normal" ID="tab_111_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;"> <a href="javascript:openPopup('popup.aspx?sesja=1!11.1!6!4')"><asp:Label CssClass="normal" ID="tab_111_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #000000 #000000 #666666 #666666;"> <a href="javascript:openPopup('popup.aspx?sesja=1!11.1!7!4')"><asp:Label CssClass="normal" ID="tab_111_w01_c07" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666; padding-left: 30px;">Zażalenia</td>
                <td style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;" class="col_36">02</td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="mssGrayMiddle"><a href="javascript:openPopup('popup.aspx?sesja=2!11.1!1!4')"><asp:Label CssClass="normal" ID="tab_111_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;"><a href="javascript:openPopup('popup.aspx?sesja=2!11.1!2!4')"><asp:Label CssClass="normal" ID="tab_111_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;"><a href="javascript:openPopup('popup.aspx?sesja=2!11.1!3!4')"><asp:Label CssClass="normal" ID="tab_111_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;"><a href="javascript:openPopup('popup.aspx?sesja=2!11.1!4!4')"><asp:Label CssClass="normal" ID="tab_111_w02_c04" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;"><a href="javascript:openPopup('popup.aspx?sesja=2!11.1!5!4')"><asp:Label CssClass="normal" ID="tab_111_w02_c05" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;"><a href="javascript:openPopup('popup.aspx?sesja=2!11.1!6!4')"><asp:Label CssClass="normal" ID="tab_111_w02_c06" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin; border-color: #666666 #000000 #000000 #666666;"><a href="javascript:openPopup('popup.aspx?sesja=2!11.1!7!4')"><asp:Label CssClass="normal" ID="tab_111_w02_c07" runat="server" Text="0"></asp:Label></a></td>
            </tr>
        </table>
        <br />
            <br />
            </div>
           <div>

               <p class="auto-style5">
                   <span style="mso-bidi-font-weight:normal"><span style="font-size: 12.0pt; mso-fareast-font-family: Symbol; mso-highlight: yellow" class="auto-style3">Dział 11.2.</span></span><span style="mso-bidi-font-weight:
normal"><span style="font-size:12.0pt;mso-fareast-font-family:Symbol"> Kontrolka skarg</span></span><span style="mso-bidi-font-weight:normal"><span style="mso-fareast-font-family:Symbol"> (w wydziale, którego<span style="mso-spacerun:yes">&nbsp; </span>sprawy skarga dotyczy) <span style="mso-bidi-font-weight:bold">(§ 448<sup>5 </sup><span  >ust. 1</span></span></span></span><span style="font-size:8.0pt;mso-fareast-font-family:Symbol"> </span><span style="mso-fareast-font-family:Symbol">Zarządzenie</span><span style="mso-bidi-font-weight:normal"><span style="mso-fareast-font-family:Symbol"> Ministra Sprawiedliwości z dnia 12 grudnia 2003 roku w sprawie organizacji i zakresu działania sekretariatów sądowych oraz innych działów administracji sądowej (Dz. Urz. MS. z 2003 r. Nr 5, poz.22, z późn. zm.)</span></span></p>
        <table  style="width:100%;">
            <tr>
                <td class="center" colspan="2" rowspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">Wyszczególnienie</td>
                <td class="center" rowspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="mssGrayMiddle">Wpłynęło</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" rowspan="2">Przesłano do sądu właściwego</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" colspan="3">Rozpoznanie skargi</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" rowspan="2">Zarządzono wypłatę przez Skarb Państwa</td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" rowspan="2">

        Kwota
                    (w złotych)</td>
            </tr>
            <tr>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;">uwzględniono</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;">oddalono</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">inne</td>
            </tr>
            <tr>
                <td class="center" colspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">0</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="mssGrayMiddle">1</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">2</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">3</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">4</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;">5</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;">6</td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666; width: 142px;">7</td>
            </tr>
            <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666; padding-left: 30px;">Skargi na pracę sądu</td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #666666 #000000;" class="col_36">01</td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #666666 #666666;" class="mssGrayMiddle"> <a href="javascript:openPopup('popup.aspx?sesja=1!11.2!1!4')"><asp:Label CssClass="normal" ID="tab_11_2_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #666666 #666666;"> <a href="javascript:openPopup('popup.aspx?sesja=1!11.2!2!4')"><asp:Label CssClass="normal" ID="tab_11_2_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #666666 #666666;"> <a href="javascript:openPopup('popup.aspx?sesja=1!11.2!3!4')"><asp:Label CssClass="normal" ID="tab_11_2_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #666666 #666666;"> <a href="javascript:openPopup('popup.aspx?sesja=1!11.2!4!4')"><asp:Label CssClass="normal" ID="tab_11_2_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #666666 #666666;"> <a href="javascript:openPopup('popup.aspx?sesja=1!11.2!5!4')"><asp:Label CssClass="normal" ID="tab_11_2_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #666666 #666666;"> <a href="javascript:openPopup('popup.aspx?sesja=1!11.2!6!4')"><asp:Label CssClass="normal" ID="tab_11_2_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin; border-color: #000000 #000000 #666666 #666666;"> <a href="javascript:openPopup('popup.aspx?sesja=1!11.2!7!4')"><asp:Label CssClass="normal" ID="tab_11_2_w01_c07" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            </table>
           <br />
           <br />
       </div>

         <div id='12' class="page-break">
 <strong> Dział 12</strong> Terminowość postępowania międzyinstancyjnego  w pierwszej instancji
   <table  style="width: 100%; ">
 <tr>    <td  class="center borderAll" colspan="4" rowspan="2"> Sprawy z rep.</td>    <td class="center borderAll" colspan="4"> Sprawy rodzinne nieletnich wielotomowe - liczba spraw </td>
</tr>
 <tr>    <td class="center borderAll"> zbiorczo pow. 5 tomów (kol. od 2 do 4)</td>
<td class="center borderAll">pow. 5 do 10 tomów</td>
<td class="center borderAll">pow. 10 do 20 tomów</td>
<td class="center borderAll">powyżej 20 tomów</td>
</tr>
 <tr>    <td  class="center borderAll" colspan="4">0</td>    <td class="center borderAll">1</td>
<td class="center borderAll">2</td>
<td class="center borderAll">3</td>
<td class="center borderAll">4</td>
</tr>
  <tr>
    <td  class="borderAll wciecie" rowspan="7">RC</td>
    <td  class="borderAll wciecie" colspan="2">Wpływ w okresie sprawozdawczym </td>
  <td  class="borderAll col_36">1</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!12!1!4')"><asp:Label CssClass="normal" ID="tab_12__w01_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!12!2!4')"><asp:Label CssClass="normal" ID="tab_12__w01_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!12!3!4')"><asp:Label CssClass="normal" ID="tab_12__w01_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!12!4!4')"><asp:Label CssClass="normal" ID="tab_12__w01_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" rowspan="2">w tym</td>
    <td  class="borderAll wciecie">wpływ w wyniku przekazania z innej jednostki</td>
  <td  class="borderAll col_36">2</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!12!1!4')"><asp:Label CssClass="normal" ID="tab_12__w02_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!12!2!4')"><asp:Label CssClass="normal" ID="tab_12__w02_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!12!3!4')"><asp:Label CssClass="normal" ID="tab_12__w02_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!12!4!4')"><asp:Label CssClass="normal" ID="tab_12__w02_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">w wyniku zwrotu pozwu/wniosku</td>
  <td  class="borderAll col_36">3</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!12!1!4')"><asp:Label CssClass="normal" ID="tab_12__w03_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!12!2!4')"><asp:Label CssClass="normal" ID="tab_12__w03_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!12!3!4')"><asp:Label CssClass="normal" ID="tab_12__w03_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!12!4!4')"><asp:Label CssClass="normal" ID="tab_12__w03_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">Załatwienie w okresie sprawozdawczym </td>
  <td  class="borderAll col_36">4</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!12!1!4')"><asp:Label CssClass="normal" ID="tab_12__w04_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!12!2!4')"><asp:Label CssClass="normal" ID="tab_12__w04_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!12!3!4')"><asp:Label CssClass="normal" ID="tab_12__w04_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!12!4!4')"><asp:Label CssClass="normal" ID="tab_12__w04_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" rowspan="2">w tym</td>
    <td  class="borderAll wciecie">załatwienie w wyniku przekazania do innej jednostki</td>
  <td  class="borderAll col_36">5</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!12!1!4')"><asp:Label CssClass="normal" ID="tab_12__w05_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!12!2!4')"><asp:Label CssClass="normal" ID="tab_12__w05_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!12!3!4')"><asp:Label CssClass="normal" ID="tab_12__w05_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!12!4!4')"><asp:Label CssClass="normal" ID="tab_12__w05_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">w wyniku zwrotu pozwu/wniosku </td>
  <td  class="borderAll col_36">6</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!12!1!4')"><asp:Label CssClass="normal" ID="tab_12__w06_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!12!2!4')"><asp:Label CssClass="normal" ID="tab_12__w06_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!12!3!4')"><asp:Label CssClass="normal" ID="tab_12__w06_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!12!4!4')"><asp:Label CssClass="normal" ID="tab_12__w06_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">Pozostało na następny okres sprawozdawczy</td>
  <td  class="borderAll col_36">7</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!12!1!4')"><asp:Label CssClass="normal" ID="tab_12__w07_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!12!2!4')"><asp:Label CssClass="normal" ID="tab_12__w07_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!12!3!4')"><asp:Label CssClass="normal" ID="tab_12__w07_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!12!4!4')"><asp:Label CssClass="normal" ID="tab_12__w07_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" rowspan="7">RNs</td>
    <td  class="borderAll wciecie" colspan="2">Wpływ w okresie sprawozdawczym </td>
  <td  class="borderAll col_36">8</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!12!1!4')"><asp:Label CssClass="normal" ID="tab_12__w08_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!12!2!4')"><asp:Label CssClass="normal" ID="tab_12__w08_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!12!3!4')"><asp:Label CssClass="normal" ID="tab_12__w08_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!12!4!4')"><asp:Label CssClass="normal" ID="tab_12__w08_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" rowspan="2">w tym</td>
    <td  class="borderAll wciecie">wpływ w wyniku przekazania z innej jednostki</td>
  <td  class="borderAll col_36">9</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!12!1!4')"><asp:Label CssClass="normal" ID="tab_12__w09_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!12!2!4')"><asp:Label CssClass="normal" ID="tab_12__w09_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!12!3!4')"><asp:Label CssClass="normal" ID="tab_12__w09_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!12!4!4')"><asp:Label CssClass="normal" ID="tab_12__w09_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">w wyniku zwrotu pozwu/wniosku</td>
  <td  class="borderAll col_36">10</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!12!1!4')"><asp:Label CssClass="normal" ID="tab_12__w10_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!12!2!4')"><asp:Label CssClass="normal" ID="tab_12__w10_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!12!3!4')"><asp:Label CssClass="normal" ID="tab_12__w10_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!12!4!4')"><asp:Label CssClass="normal" ID="tab_12__w10_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">Załatwienie w okresie sprawozdawczym </td>
  <td  class="borderAll col_36">11</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!12!1!4')"><asp:Label CssClass="normal" ID="tab_12__w11_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!12!2!4')"><asp:Label CssClass="normal" ID="tab_12__w11_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!12!3!4')"><asp:Label CssClass="normal" ID="tab_12__w11_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!12!4!4')"><asp:Label CssClass="normal" ID="tab_12__w11_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" rowspan="2">w tym</td>
    <td  class="borderAll wciecie">załatwienie w wyniku przekazania do innej jednostki</td>
  <td  class="borderAll col_36">12</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!12!1!4')"><asp:Label CssClass="normal" ID="tab_12__w12_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!12!2!4')"><asp:Label CssClass="normal" ID="tab_12__w12_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!12!3!4')"><asp:Label CssClass="normal" ID="tab_12__w12_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!12!4!4')"><asp:Label CssClass="normal" ID="tab_12__w12_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">w wyniku zwrotu pozwu/wniosku </td>
  <td  class="borderAll col_36">13</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!12!1!4')"><asp:Label CssClass="normal" ID="tab_12__w13_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!12!2!4')"><asp:Label CssClass="normal" ID="tab_12__w13_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!12!3!4')"><asp:Label CssClass="normal" ID="tab_12__w13_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!12!4!4')"><asp:Label CssClass="normal" ID="tab_12__w13_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">Pozostało na następny okres sprawozdawczy</td>
  <td  class="borderAll col_36">14</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!12!1!4')"><asp:Label CssClass="normal" ID="tab_12__w14_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!12!2!4')"><asp:Label CssClass="normal" ID="tab_12__w14_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!12!3!4')"><asp:Label CssClass="normal" ID="tab_12__w14_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!12!4!4')"><asp:Label CssClass="normal" ID="tab_12__w14_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" rowspan="7">Nsm</td>
    <td  class="borderAll wciecie" colspan="2">Wpływ w okresie sprawozdawczym </td>
  <td  class="borderAll col_36">15</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!12!1!4')"><asp:Label CssClass="normal" ID="tab_12__w15_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!12!2!4')"><asp:Label CssClass="normal" ID="tab_12__w15_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!12!3!4')"><asp:Label CssClass="normal" ID="tab_12__w15_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!12!4!4')"><asp:Label CssClass="normal" ID="tab_12__w15_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" rowspan="2">w tym</td>
    <td  class="borderAll wciecie">wpływ w wyniku przekazania z innej jednostki</td>
  <td  class="borderAll col_36">16</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!12!1!4')"><asp:Label CssClass="normal" ID="tab_12__w16_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!12!2!4')"><asp:Label CssClass="normal" ID="tab_12__w16_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!12!3!4')"><asp:Label CssClass="normal" ID="tab_12__w16_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!12!4!4')"><asp:Label CssClass="normal" ID="tab_12__w16_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">w wyniku zwrotu pozwu/wniosku</td>
  <td  class="borderAll col_36">17</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!12!1!4')"><asp:Label CssClass="normal" ID="tab_12__w17_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!12!2!4')"><asp:Label CssClass="normal" ID="tab_12__w17_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!12!3!4')"><asp:Label CssClass="normal" ID="tab_12__w17_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!12!4!4')"><asp:Label CssClass="normal" ID="tab_12__w17_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">Załatwienie w okresie sprawozdawczym </td>
  <td  class="borderAll col_36">18</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!12!1!4')"><asp:Label CssClass="normal" ID="tab_12__w18_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!12!2!4')"><asp:Label CssClass="normal" ID="tab_12__w18_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!12!3!4')"><asp:Label CssClass="normal" ID="tab_12__w18_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!12!4!4')"><asp:Label CssClass="normal" ID="tab_12__w18_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" rowspan="2">w tym</td>
    <td  class="borderAll wciecie">załatwienie w wyniku przekazania do innej jednostki</td>
  <td  class="borderAll col_36">19</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!12!1!4')"><asp:Label CssClass="normal" ID="tab_12__w19_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!12!2!4')"><asp:Label CssClass="normal" ID="tab_12__w19_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!12!3!4')"><asp:Label CssClass="normal" ID="tab_12__w19_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!12!4!4')"><asp:Label CssClass="normal" ID="tab_12__w19_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">w wyniku zwrotu pozwu/wniosku </td>
  <td  class="borderAll col_36">20</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!12!1!4')"><asp:Label CssClass="normal" ID="tab_12__w20_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!12!2!4')"><asp:Label CssClass="normal" ID="tab_12__w20_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!12!3!4')"><asp:Label CssClass="normal" ID="tab_12__w20_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!12!4!4')"><asp:Label CssClass="normal" ID="tab_12__w20_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">Pozostało na następny okres sprawozdawczy</td>
  <td  class="borderAll col_36">21</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!12!1!4')"><asp:Label CssClass="normal" ID="tab_12__w21_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!12!2!4')"><asp:Label CssClass="normal" ID="tab_12__w21_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!12!3!4')"><asp:Label CssClass="normal" ID="tab_12__w21_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!12!4!4')"><asp:Label CssClass="normal" ID="tab_12__w21_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" rowspan="7">Nkd</td>
    <td  class="borderAll wciecie" colspan="2">Wpływ w okresie sprawozdawczym </td>
  <td  class="borderAll col_36">22</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!12!1!4')"><asp:Label CssClass="normal" ID="tab_12__w22_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!12!2!4')"><asp:Label CssClass="normal" ID="tab_12__w22_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!12!3!4')"><asp:Label CssClass="normal" ID="tab_12__w22_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!12!4!4')"><asp:Label CssClass="normal" ID="tab_12__w22_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" rowspan="2">w tym</td>
    <td  class="borderAll wciecie">wpływ w wyniku przekazania z innej jednostki</td>
  <td  class="borderAll col_36">23</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!12!1!4')"><asp:Label CssClass="normal" ID="tab_12__w23_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!12!2!4')"><asp:Label CssClass="normal" ID="tab_12__w23_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!12!3!4')"><asp:Label CssClass="normal" ID="tab_12__w23_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!12!4!4')"><asp:Label CssClass="normal" ID="tab_12__w23_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">w wyniku zwrotu pozwu/wniosku</td>
  <td  class="borderAll col_36">24</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!12!1!4')"><asp:Label CssClass="normal" ID="tab_12__w24_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!12!2!4')"><asp:Label CssClass="normal" ID="tab_12__w24_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!12!3!4')"><asp:Label CssClass="normal" ID="tab_12__w24_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!12!4!4')"><asp:Label CssClass="normal" ID="tab_12__w24_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">Załatwienie w okresie sprawozdawczym </td>
  <td  class="borderAll col_36">25</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!12!1!4')"><asp:Label CssClass="normal" ID="tab_12__w25_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!12!2!4')"><asp:Label CssClass="normal" ID="tab_12__w25_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!12!3!4')"><asp:Label CssClass="normal" ID="tab_12__w25_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!12!4!4')"><asp:Label CssClass="normal" ID="tab_12__w25_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" rowspan="2">w tym</td>
    <td  class="borderAll wciecie">załatwienie w wyniku przekazania do innej jednostki</td>
  <td  class="borderAll col_36">26</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!12!1!4')"><asp:Label CssClass="normal" ID="tab_12__w26_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!12!2!4')"><asp:Label CssClass="normal" ID="tab_12__w26_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!12!3!4')"><asp:Label CssClass="normal" ID="tab_12__w26_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!12!4!4')"><asp:Label CssClass="normal" ID="tab_12__w26_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">w wyniku zwrotu pozwu/wniosku </td>
  <td  class="borderAll col_36">27</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!12!1!4')"><asp:Label CssClass="normal" ID="tab_12__w27_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!12!2!4')"><asp:Label CssClass="normal" ID="tab_12__w27_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!12!3!4')"><asp:Label CssClass="normal" ID="tab_12__w27_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!12!4!4')"><asp:Label CssClass="normal" ID="tab_12__w27_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">Pozostało na następny okres sprawozdawczy</td>
  <td  class="borderAll col_36">28</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!12!1!4')"><asp:Label CssClass="normal" ID="tab_12__w28_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!12!2!4')"><asp:Label CssClass="normal" ID="tab_12__w28_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!12!3!4')"><asp:Label CssClass="normal" ID="tab_12__w28_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!12!4!4')"><asp:Label CssClass="normal" ID="tab_12__w28_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
    </table>
 </div>

       <br />
        <div id='13.1' class="page-break">
 <strong> Dział 13.1</strong> . Limity etatów i obsada Sądu (Wydziału)
   <table  style="width: 100%; ">
 <tr>    <td  class="center borderAll" colspan="2"> </td>    <td class="center borderAll"> Licz-ba sę-dziów SR i waku-ją-cych sta-no-wisk sę-dziowskich w ra-mach limitu (na ostatni dzień okre-su sta-ty-stycznego) </td>
<td class="center borderAll">Liczba sę-dziów SR  i wa-ku-ją-cych stano-wisk sę-dziowskich w ra-mach li-mi-tu (w okresie sta-ty-stycznym)</td>
<td class="center borderAll">Obsada średniookresowa sędziowie SR z wyłączeniem sędziów funkcyjnych oraz delegowanych do pełnienia czynności w Ministerstwie Sprawiedliwości, KSSiP, a także delegowanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekający w pełnym wymiarze w SO i delegowanych do pełnienia czynności orzeczniczych w pełnym wymiarze w innym sądzie rejonowym</td>
<td class="center borderAll">Liczba sędziów SR z wyłączeniem sędziów funkcyjnych oraz delegowanych do pełnienia czynności w Ministerstwie Sprawiedliwości, KSSiP,a także delegowanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekających w pełnym wymiarze w SO i delegowanych do pełnienia czynności orzeczniczych w pełnym wymiarze w innym sądzie rejonowym</td>
<td class="center borderAll">Ob-sada średnioo-kre-sowa sę-dzio-wie SO dele-go-wa-nych do peł-nie-nia czyn-ności orzeczni-czych w peł-nym lub nie-peł-nym wy-mia-rze w da-nym są-dzie,  w trybie art. 77 § 1 usp na czas nieo-kre-ślony lub na czas okre-ślony  </td>
<td class="center borderAll">Licz-ba sę-dziów SO dele-go-wa-nych do peł-nie-nia czyn-ności orzeczni-czych w peł-nym lub nie-peł-nym wy-mia-rze w da-nym są-dzie w trybie art. 77 § 1 usp na czas okre-ślony lub nieo-kre-ślony </td>
<td class="center borderAll">Ob-sa-da sę-dziów da-ne-go SR de-le-go-wa-nych do pełnienia czynności orzeczniczych w pełnym wymiarze  w in-nym są-dzie re-jo-no-wym</td>
<td class="center borderAll">Liczba sę-dziów  da-ne-go SR de-le-go-wa-nych do pełnienia czynności orzeczniczych w pełnym wymiarze w in-nym są-dzie re-jo-no-wym</td>
<td class="center borderAll">Ob-sa-da sę-dziów in-ne-go SR de-le-go-wa-nych do pełnienia  czynności orzeczniczych w pełnym lub niepełnym wymiarze w da-nym są-dzie re-jo-no-wym</td>
<td class="center borderAll">Liczba sę-dziów in-ne-go SR de-le-go-wa-nych do pełnienia   czynności orzeczniczych w pełnym lub niepełnym wymiarze w  da-nym są-dzie re-jo-no-wym</td>
<td class="center borderAll">Ob-sa-da średnioo-kreso-wa (sędziowie  funkcyjni SR) - I wersja</td>
<td class="center borderAll">Ob-sa-da średnioo-kreso-wa (sędziowie  funkcyjni SR) - II wersja</td>
<td class="center borderAll">Liczba sę-dziów (funkcyjnych SR tego są-du </td>
<td class="center borderAll">Liczba sędziów SR  w ramach limitu (na ostatni dzień okresu staty-stycz-nego delego-wanych do peł-nienia czynno-ści w Mini-ster-stwie Spra-wiedli-wości </td>
<td class="center borderAll">Licz-ba sę-dziów dele-go-wa-nych w trybie art. 77 § 1 usp na czas nieo-kre-ślony lub na czas okre-ślony do peł-nie-nia czynności w Mini-ster-stwie Sprawie-dli-wo-ści  </td>
<td class="center borderAll">Ob-sada sę-dziów dele-go-wa-nych do KSSiP w ra-mach limitu (w ostatnim dniu okre-su sta-ty-stycznego)</td>
<td class="center borderAll">Liczba sędziów de-le-gowanych do KSSiP w ramach li-mi-tu (w ostat-nim dniu okresu staty-stycznego)</td>
<td class="center borderAll">Obsada średniookre-sowa sę-dziów SR dele-gowa-nych w trybie art. 77 § 1 usp na czas nieo-kreślo-ny lub na czas okre-ślony orzeka-jących w peł-nym wymia-rze w SO</td>
<td class="center borderAll">Licz-ba sę-dziów SR dele-go-wa-nych w trybie art. 77 § 1 usp na czas nieo-kre-ślony lub na czas okre-ślony orze-kają-cych w peł-nym wy-mia-rze w SO</td>
<td class="center borderAll">Obsa-da średniookre-sowa  sę-dziów dele-gowa-nych w trybie art. 77 § 9 usp do SO</td>
<td class="center borderAll">Liczba sędziów delegowanych w trybie art. 77 § 9 usp do SO</td>
<td class="center borderAll">Łączna liczba sesji w da-nym okresie statystycz-nym (rozprawy i posiedzenia) sędziów SR z wyłączeniem sędziów funk-cyjnych, sę-dziów dele-gowanych do KSSiP oraz delegowa-nych w trybie art. 77 § 1 usp na czas nieo-kreślony lub na czas okre-ślony orzeka-jący w peł-nym wymiarze w SO i sę-dziów SR delegowa-nych do peł-nienia czyn-ności orzecz-niczych do innego i z innego sądu rejonowego</td>
<td class="center borderAll">Średniookresowa liczba sesji w danym okresie statystycz-nym (rozprawy i po-siedzenia) jednego sędziego SR z wyłą-czeniem sędziów funkcyjnych, sędziów delegowanych do KSSiP oraz  delego-wanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orze-kający w pełnym wymiarze w SO i sędziów SR delego-wanych do pełnienia czynności orzeczni-czych do innego i z innego sądu rejono-wego</td>
<td class="center borderAll">Liczba obsadzonych etatów (na ostatni dzień okresu statystycznego)</td>
<td class="center borderAll">Liczba obsadzonych etatów (w okresie statystycznym)</td>
</tr>
 <tr>    <td  class="center borderAll" colspan="2">0</td>    <td class="center borderAll">1</td>
<td class="center borderAll">2</td>
<td class="center borderAll">3</td>
<td class="center borderAll">4</td>
<td class="center borderAll">5</td>
<td class="center borderAll">6</td>
<td class="center borderAll">7</td>
<td class="center borderAll">8</td>
<td class="center borderAll">9</td>
<td class="center borderAll">10</td>
<td class="center borderAll">11</td>
<td class="center borderAll">12</td>
<td class="center borderAll">13</td>
<td class="center borderAll">14</td>
<td class="center borderAll">15</td>
<td class="center borderAll">16</td>
<td class="center borderAll">17</td>
<td class="center borderAll">18</td>
<td class="center borderAll">19</td>
<td class="center borderAll">20</td>
<td class="center borderAll">21</td>
<td class="center borderAll">22</td>
<td class="center borderAll">23</td>
<td class="center borderAll">24</td>
<td class="center borderAll">25</td>
</tr>
  <tr>
    <td  class="borderAll wciecie"></td>
  <td  class="borderAll col_36">1</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!13.1!1!4')"><asp:Label CssClass="normal" ID="tab_13_1__w01_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!13.1!2!4')"><asp:Label CssClass="normal" ID="tab_13_1__w01_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!13.1!3!4')"><asp:Label CssClass="normal" ID="tab_13_1__w01_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!13.1!4!4')"><asp:Label CssClass="normal" ID="tab_13_1__w01_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!13.1!5!4')"><asp:Label CssClass="normal" ID="tab_13_1__w01_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!13.1!6!4')"><asp:Label CssClass="normal" ID="tab_13_1__w01_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!13.1!7!4')"><asp:Label CssClass="normal" ID="tab_13_1__w01_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!13.1!8!4')"><asp:Label CssClass="normal" ID="tab_13_1__w01_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!13.1!9!4')"><asp:Label CssClass="normal" ID="tab_13_1__w01_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!13.1!10!4')"><asp:Label CssClass="normal" ID="tab_13_1__w01_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!13.1!11!4')"><asp:Label CssClass="normal" ID="tab_13_1__w01_c11" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!13.1!12!4')"><asp:Label CssClass="normal" ID="tab_13_1__w01_c12" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!13.1!13!4')"><asp:Label CssClass="normal" ID="tab_13_1__w01_c13" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!13.1!14!4')"><asp:Label CssClass="normal" ID="tab_13_1__w01_c14" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!13.1!15!4')"><asp:Label CssClass="normal" ID="tab_13_1__w01_c15" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!13.1!16!4')"><asp:Label CssClass="normal" ID="tab_13_1__w01_c16" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!13.1!17!4')"><asp:Label CssClass="normal" ID="tab_13_1__w01_c17" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!13.1!18!4')"><asp:Label CssClass="normal" ID="tab_13_1__w01_c18" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!13.1!19!4')"><asp:Label CssClass="normal" ID="tab_13_1__w01_c19" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!13.1!20!4')"><asp:Label CssClass="normal" ID="tab_13_1__w01_c20" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!13.1!21!4')"><asp:Label CssClass="normal" ID="tab_13_1__w01_c21" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!13.1!22!4')"><asp:Label CssClass="normal" ID="tab_13_1__w01_c22" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!13.1!23!4')"><asp:Label CssClass="normal" ID="tab_13_1__w01_c23" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!13.1!24!4')"><asp:Label CssClass="normal" ID="tab_13_1__w01_c24" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!13.1!25!4')"><asp:Label CssClass="normal" ID="tab_13_1__w01_c25" runat="server" Text="0"></asp:Label></a></td>
  </tr>
    </table>
 </div>
 <br />
          <div id='13.2' class="page-break">
 <strong> Dział 13.2</strong> Obsada Sądu (Wydziału)
   <table  style="width: 100%; ">
 <tr>    <td  class="center borderAll" colspan="3"> Treść </td>    <td class="center borderAll"> Liczba według limitu etatów na ostatni dzień okresu statystycznego</td>
<td class="center borderAll">Liczba według limitu etatów w okresie statystycznym</td>
<td class="center borderAll">Obsada średniookresowa</td>
<td class="center borderAll">w tym obsada osób świadczących usługi na rzecz e-sądu</td>
<td class="center borderAll">Liczba obsadzonych etatów na ostatni dzień okresu statystycznego</td>
<td class="center borderAll">Liczba obsadzonych etatów w okresie statystycznym)</td>
</tr>
 <tr>    <td  class="center borderAll" colspan="3">0</td>    <td class="center borderAll">1</td>
<td class="center borderAll">2</td>
<td class="center borderAll">3</td>
<td class="center borderAll">4</td>
<td class="center borderAll">5</td>
<td class="center borderAll">6</td>
</tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">Referendarze</td>
  <td  class="borderAll col_36">1</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!13.2!1!4')"><asp:Label CssClass="normal" ID="tab_13_2__w01_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!13.2!2!4')"><asp:Label CssClass="normal" ID="tab_13_2__w01_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!13.2!3!4')"><asp:Label CssClass="normal" ID="tab_13_2__w01_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!13.2!4!4')"><asp:Label CssClass="normal" ID="tab_13_2__w01_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!13.2!5!4')"><asp:Label CssClass="normal" ID="tab_13_2__w01_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!13.2!6!4')"><asp:Label CssClass="normal" ID="tab_13_2__w01_c06" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" rowspan="2">Pracownicy administracyjni</td>
    <td  class="borderAll wciecie">urzędnicy</td>
  <td  class="borderAll col_36">2</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!13.2!1!4')"><asp:Label CssClass="normal" ID="tab_13_2__w02_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!13.2!2!4')"><asp:Label CssClass="normal" ID="tab_13_2__w02_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!13.2!3!4')"><asp:Label CssClass="normal" ID="tab_13_2__w02_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!13.2!4!4')"><asp:Label CssClass="normal" ID="tab_13_2__w02_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!13.2!5!4')"><asp:Label CssClass="normal" ID="tab_13_2__w02_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!13.2!6!4')"><asp:Label CssClass="normal" ID="tab_13_2__w02_c06" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">asystenci sędziów</td>
  <td  class="borderAll col_36">3</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!13.2!1!4')"><asp:Label CssClass="normal" ID="tab_13_2__w03_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!13.2!2!4')"><asp:Label CssClass="normal" ID="tab_13_2__w03_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!13.2!3!4')"><asp:Label CssClass="normal" ID="tab_13_2__w03_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!13.2!4!4')"><asp:Label CssClass="normal" ID="tab_13_2__w03_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!13.2!5!4')"><asp:Label CssClass="normal" ID="tab_13_2__w03_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!13.2!6!4')"><asp:Label CssClass="normal" ID="tab_13_2__w03_c06" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">Inni pracownicy</td>
  <td  class="borderAll col_36">4</td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!13.2!1!4')"><asp:Label CssClass="normal" ID="tab_13_2__w04_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!13.2!2!4')"><asp:Label CssClass="normal" ID="tab_13_2__w04_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!13.2!3!4')"><asp:Label CssClass="normal" ID="tab_13_2__w04_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!13.2!4!4')"><asp:Label CssClass="normal" ID="tab_13_2__w04_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!13.2!5!4')"><asp:Label CssClass="normal" ID="tab_13_2__w04_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!13.2!6!4')"><asp:Label CssClass="normal" ID="tab_13_2__w04_c06" runat="server" Text="0"></asp:Label></a></td>
  </tr>
    </table>
 </div>

           <br />
           <br />
           <br />
           <br />
       <div>

           <asp:Label ID="tabela8Label" runat="server" Text="Dział 14.1. Liczba biegłych/podmiotów wydających opinie w sprawach  (z wył. tłumaczy przysięgłych)"></asp:Label>
&nbsp;<br />
        <table  style="width:100%;">
            <tr>
                <td class="center" colspan="2" rowspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">Sprawy wg repertoriów
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" colspan="4">Z tego od daty orzeczenia sądu rejonowego do daty przekazania do sądu II instancji upłynął okres</td>
            </tr>
            <tr>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; " class="col_246">do 2 mies.</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; " class="col_246">pow. 2 do 3 mies.</td>
                <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; " class="col_246">pow. 3 do&nbsp; 6<br />
                    miesięcy.</td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" class="col_246">pow. 6 do&nbsp; 12<br />
                    miesięcy.</td>
            </tr>
            <tr>
                <td class="center" colspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">0</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 250px;" class="col_246">1</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 250px;" class="col_246">2</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 250px;" class="col_246">3</td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666; width: 250px;" class="col_246">4</td>
            </tr>
            <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;" class="col_121">Ogółem (w. 02 do 06)</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #000000;" class="col_36">01</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_246"> <a href="javascript:openPopup('popup.aspx?sesja=1!14.1!1!4')"><asp:Label CssClass="normal" ID="tab_141_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_246"> <a href="javascript:openPopup('popup.aspx?sesja=1!14.1!2!4')"><asp:Label CssClass="normal" ID="tab_141_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_246"> <a href="javascript:openPopup('popup.aspx?sesja=1!14.1!3!4')"><asp:Label CssClass="normal" ID="tab_141_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #000000 #000000 #666666 #666666;" class="col_246"> <a href="javascript:openPopup('popup.aspx?sesja=1!14.1!4!4')"><asp:Label CssClass="normal" ID="tab_141_w01_c04" runat="server" Text="0"></asp:Label></a></td>
            </tr>
             <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;" class="col_121">RC </td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #000000;" class="col_36">02</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_246"> <a href="javascript:openPopup('popup.aspx?sesja=2!14.1!1!4')"><asp:Label CssClass="normal" ID="tab_141_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_246"> <a href="javascript:openPopup('popup.aspx?sesja=2!14.1!2!4')"><asp:Label CssClass="normal" ID="tab_141_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_246"> <a href="javascript:openPopup('popup.aspx?sesja=2!14.1!3!4')"><asp:Label CssClass="normal" ID="tab_141_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #666666 #666666;" class="col_246"> <a href="javascript:openPopup('popup.aspx?sesja=2!14.1!4!4')"><asp:Label CssClass="normal" ID="tab_141_w02_c04" runat="server" Text="0"></asp:Label></a></td>
            </tr>
             <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;" class="col_121">RNs </td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #000000;" class="col_36">03</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_246"> <a href="javascript:openPopup('popup.aspx?sesja=3!14.1!1!4')"><asp:Label CssClass="normal" ID="tab_141_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_246"> <a href="javascript:openPopup('popup.aspx?sesja=3!14.1!2!4')"><asp:Label CssClass="normal" ID="tab_141_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_246"> <a href="javascript:openPopup('popup.aspx?sesja=3!14.1!3!4')"><asp:Label CssClass="normal" ID="tab_141_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #666666 #666666;" class="col_246"> <a href="javascript:openPopup('popup.aspx?sesja=3!14.1!4!4')"><asp:Label CssClass="normal" ID="tab_141_w03_c04" runat="server" Text="0"></asp:Label></a></td>
            </tr>
             <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;" class="col_121">Nsm </td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #000000;" class="col_36">04</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_246"> <a href="javascript:openPopup('popup.aspx?sesja=4!14.1!1!4')"><asp:Label CssClass="normal" ID="tab_141_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_246"> <a href="javascript:openPopup('popup.aspx?sesja=4!14.1!2!4')"><asp:Label CssClass="normal" ID="tab_141_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_246"> <a href="javascript:openPopup('popup.aspx?sesja=4!14.1!3!4')"><asp:Label CssClass="normal" ID="tab_141_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #666666 #666666;" class="col_246"> <a href="javascript:openPopup('popup.aspx?sesja=4!14.1!4!4')"><asp:Label CssClass="normal" ID="tab_141_w04_c04" runat="server" Text="0"></asp:Label></a></td>
            </tr>
             <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;" class="col_121">Nkd </td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #000000;" class="col_36">05</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_246"> <a href="javascript:openPopup('popup.aspx?sesja=5!14.1!1!4')"><asp:Label CssClass="normal" ID="tab_141_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_246"> <a href="javascript:openPopup('popup.aspx?sesja=5!14.1!2!4')"><asp:Label CssClass="normal" ID="tab_141_w05_c02" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_246"> <a href="javascript:openPopup('popup.aspx?sesja=5!14.1!3!4')"><asp:Label CssClass="normal" ID="tab_141_w05_c03" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #666666 #666666;" class="col_246"> <a href="javascript:openPopup('popup.aspx?sesja=5!14.1!4!4')"><asp:Label CssClass="normal" ID="tab_141_w05_c04" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666; padding-left: 30px;" class="col_121">Inne</td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;" class="col_36">06</td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_246"><a href="javascript:openPopup('popup.aspx?sesja=6!14.1!1!4')"><asp:Label CssClass="normal" ID="tab_141_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_246"><a href="javascript:openPopup('popup.aspx?sesja=6!14.1!2!4')"><asp:Label CssClass="normal" ID="tab_141_w06_c02" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_246"><a href="javascript:openPopup('popup.aspx?sesja=6!14.1!3!4')"><asp:Label CssClass="normal" ID="tab_141_w06_c03" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin; border-color: #666666 #000000 #000000 #666666;" class="col_246"><a href="javascript:openPopup('popup.aspx?sesja=6!14.1!4!4')"><asp:Label CssClass="normal" ID="tab_141_w06_c04" runat="server" Text="0"></asp:Label></a></td>
            </tr>
        </table>
          <br />
       </div>
       <div id="Div142"  class="page-break">

           <asp:Label ID="Label1" runat="server">Dział 14.2. Terminowość sporządzania opinii pisemnych (z wył. tłumaczy przysięgłych</asp:Label>

              <br />
        <table  style="width:100%;">
            <tr>
                <td class="center" colspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_155" rowspan="3">Sprawy wg repertoriów</td>
                <td class="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666; border-width: thin thin 0px thin;" class="mssGrayMiddle" colspan="8">Liczba sporządzonych opinii</td>
            </tr>
            <tr>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_100" rowspan="2">razem
                    <br />
                    (kol.1= 2 do 5 =
                    <br />
                    6 do 8)</td>
                <td class="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" class="col_100" rowspan="2">w ustalonym terminie</td>
                <td class="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" colspan="3">po ustalonym terminie </td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" colspan="3">wg czasu wydania opinii</td>
            </tr>
            <tr>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_100">do 30dni</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_100">pow. 1 do 3 miesięcy</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_100">pow. 3 miesięcy</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_100">do 30 dni</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_100">pow. 1 do 3 miesięcy</td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" class="col_100">pow. 3 miesięcy</td>
            </tr>
            <tr>
                <td class="center" colspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_155">0</td>
                <td class="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666; width: 142px;" class="col_123">1</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">2</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">3</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">4</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_123">5</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_123">6</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_123">7</td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666; width: 142px;" class="col_123">8</td>
            </tr>
            <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;" class="col_121">Ogółem (w. 02 do 07)</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #000000;" class="col_36">01</td>
                <td class="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #000000; border-bottom: 0px solid #666666; width: 142px;" class="col_123"> <a href="javascript:openPopup('popup.aspx?sesja=1!14.2!1!4')"><asp:Label CssClass="normal" ID="tab_142_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"> <a href="javascript:openPopup('popup.aspx?sesja=1!14.2!2!4')"><asp:Label CssClass="normal" ID="tab_142_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"> <a href="javascript:openPopup('popup.aspx?sesja=1!14.2!3!4')"><asp:Label CssClass="normal" ID="tab_142_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"> <a href="javascript:openPopup('popup.aspx?sesja=1!14.2!4!4')"><asp:Label CssClass="normal" ID="tab_142_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"> <a href="javascript:openPopup('popup.aspx?sesja=1!14.2!5!4')"><asp:Label CssClass="normal" ID="tab_142_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"> <a href="javascript:openPopup('popup.aspx?sesja=1!14.2!6!4')"><asp:Label CssClass="normal" ID="tab_142_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"> <a href="javascript:openPopup('popup.aspx?sesja=1!14.2!7!4')"><asp:Label CssClass="normal" ID="tab_142_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #000000 #000000 #666666 #666666;" class="col_123"> <a href="javascript:openPopup('popup.aspx?sesja=1!14.2!8!4')"><asp:Label CssClass="normal" ID="tab_142_w01_c08" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;" class="col_121">RC</td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;" class="col_36">02</td>
                <td class="center" style="border-style: solid; border-color: #666666 #666666 #000000 #666666; border-width: thin 0px 0px thin;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!14.2!1!4')"><asp:Label CssClass="normal" ID="tab_142_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!14.2!2!4')"><asp:Label CssClass="normal" ID="tab_142_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!14.2!3!4')"><asp:Label CssClass="normal" ID="tab_142_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!14.2!4!4')"><asp:Label CssClass="normal" ID="tab_142_w02_c04" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!14.2!5!4')"><asp:Label CssClass="normal" ID="tab_142_w02_c05" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!14.2!6!4')"><asp:Label CssClass="normal" ID="tab_142_w02_c06" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!14.2!7!4')"><asp:Label CssClass="normal" ID="tab_142_w02_c07" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #666666 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!14.2!8!4')"><asp:Label CssClass="normal" ID="tab_142_w02_c08" runat="server" Text="0"></asp:Label></a></td>
            </tr>
             <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;" class="col_121">RNs</td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;" class="col_36">03</td>
                <td class="center" style="border-style: solid; border-color: #666666 #666666 #000000 #666666; border-width: thin 0px 0px thin;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!14.2!1!4')"><asp:Label CssClass="normal" ID="tab_142_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!14.2!2!4')"><asp:Label CssClass="normal" ID="tab_142_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!14.2!3!4')"><asp:Label CssClass="normal" ID="tab_142_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!14.2!4!4')"><asp:Label CssClass="normal" ID="tab_142_w03_c04" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!14.2!5!4')"><asp:Label CssClass="normal" ID="tab_142_w03_c05" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!14.2!6!4')"><asp:Label CssClass="normal" ID="tab_142_w03_c06" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!14.2!7!4')"><asp:Label CssClass="normal" ID="tab_142_w03_c07" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #666666 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!14.2!8!4')"><asp:Label CssClass="normal" ID="tab_142_w03_c08" runat="server" Text="0"></asp:Label></a></td>
            </tr>
             <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;" class="col_121">Nsm</td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;" class="col_36">04</td>
                <td class="center" style="border-style: solid; border-color: #666666 #666666 #000000 #666666; border-width: thin 0px 0px thin;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!14.2!1!4')"><asp:Label CssClass="normal" ID="tab_142_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!14.2!2!4')"><asp:Label CssClass="normal" ID="tab_142_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!14.2!3!4')"><asp:Label CssClass="normal" ID="tab_142_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!14.2!4!4')"><asp:Label CssClass="normal" ID="tab_142_w04_c04" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!14.2!5!4')"><asp:Label CssClass="normal" ID="tab_142_w04_c05" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!14.2!6!4')"><asp:Label CssClass="normal" ID="tab_142_w04_c06" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!14.2!7!4')"><asp:Label CssClass="normal" ID="tab_142_w04_c07" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #666666 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!14.2!8!4')"><asp:Label CssClass="normal" ID="tab_142_w04_c08" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;" class="col_121">Nkd</td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;" class="col_36">05</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=5!14.2!1!4')"><asp:Label CssClass="normal" ID="tab_142_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=5!14.2!2!4')"><asp:Label CssClass="normal" ID="tab_142_w05_c02" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=5!14.2!3!4')"><asp:Label CssClass="normal" ID="tab_142_w05_c03" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=5!14.2!4!4')"><asp:Label CssClass="normal" ID="tab_142_w05_c04" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=5!14.2!5!4')"><asp:Label CssClass="normal" ID="tab_142_w05_c05" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=5!14.2!6!4')"><asp:Label CssClass="normal" ID="tab_142_w05_c06" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=5!14.2!7!4')"><asp:Label CssClass="normal" ID="tab_142_w05_c07" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #666666 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=5!14.2!8!4')"><asp:Label CssClass="normal" ID="tab_142_w05_c08" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666; padding-left: 30px;" class="col_121">Inne</td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;" class="col_36">06</td>
                <td class="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: thin solid #000000; width: 142px;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!14.2!1!4')"><asp:Label CssClass="normal" ID="tab_142_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=6!14.2!2!4')"><asp:Label CssClass="normal" ID="tab_142_w06_c02" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=6!14.2!3!4')"><asp:Label CssClass="normal" ID="tab_142_w06_c03" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=6!14.2!4!4')"><asp:Label CssClass="normal" ID="tab_142_w06_c04" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=6!14.2!5!4')"><asp:Label CssClass="normal" ID="tab_142_w06_c05" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=6!14.2!6!4')"><asp:Label CssClass="normal" ID="tab_142_w06_c06" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=6!14.2!7!4')"><asp:Label CssClass="normal" ID="tab_142_w06_c07" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin; border-color: #666666 #000000 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=6!14.2!8!4')"><asp:Label CssClass="normal" ID="tab_142_w06_c08" runat="server" Text="0"></asp:Label></a></td>
            </tr>
        </table>
             <span style="font-size: xx-small; font-family: Arial, Helvetica, sans-serif"> W przypadku złożenia przez biegłego opinii w terminie przedłużonym przez sąd, uznaje się ją za sporządzoną w ustalonym terminie.</span><br />

        <br />
        <br />
        </div>
       <div id="14.3"  class="page-break">

           <asp:Label ID="Label2" runat="server">Dział 14.3. Terminowość przyznawania wynagrodzeń za sporządzenie opinii pisemnych i ustnych oraz za stawiennictwo</asp:Label>

              <br />
        <table  style="width:100%;">
            <tr>
                <td class="center" colspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_155" rowspan="2">Sprawy wg repertoriów</td>
                <td class="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" class="auto-style2" colspan="4">Postanowienia o przyznaniu wynagrodzenia wg czasu od złożenia rachunku</td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #000000 #666666 #666666 #666666;" colspan="4">Skierowanie rachunku do oddziału finansowego
                    <br />
                    wg czasu od postanowienia o przyznaniu wynagrodzenia</td>
            </tr>
            <tr>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_100">razem (kol.2-4) </td>
                <td class="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" class="col_100">do 14 dni</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_100">pow. 14 do 30dni</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_100">pow.yżej miesiąca</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_100">razem (ko. 4-8)</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_100">do 14 dni</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_100">pow. 14 do 30dni</td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_100">powyżej miesiąca</td>
            </tr>
            <tr>
                <td class="center" colspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_155">0</td>
                <td class="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666; width: 142px;" class="col_123">1</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">2</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">3</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">4</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_123">5</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_123">6</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_123">7</td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #000000 #666666 #666666 #666666; " class="col_123">8</td>
            </tr>
            <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;" class="col_121">Ogółem (w. 02 do 07)</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #000000;" class="col_36">01</td>
                <td class="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #000000; border-bottom: 0px solid #666666; width: 142px;" class="col_123"> <a href="javascript:openPopup('popup.aspx?sesja=1!14.3!1!4')"><asp:Label CssClass="normal" ID="tab_143_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"> <a href="javascript:openPopup('popup.aspx?sesja=1!14.3!2!4')"><asp:Label CssClass="normal" ID="tab_143_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"> <a href="javascript:openPopup('popup.aspx?sesja=1!14.3!3!4')"><asp:Label CssClass="normal" ID="tab_143_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"> <a href="javascript:openPopup('popup.aspx?sesja=1!14.3!4!4')"><asp:Label CssClass="normal" ID="tab_143_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"> <a href="javascript:openPopup('popup.aspx?sesja=1!14.3!5!4')"><asp:Label CssClass="normal" ID="tab_143_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"> <a href="javascript:openPopup('popup.aspx?sesja=1!14.3!6!4')"><asp:Label CssClass="normal" ID="tab_143_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"> <a href="javascript:openPopup('popup.aspx?sesja=1!14.3!7!4')"><asp:Label CssClass="normal" ID="tab_143_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"> <a href="javascript:openPopup('popup.aspx?sesja=1!14.3!8!4')"><asp:Label CssClass="normal" ID="tab_143_w01_c08" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;" class="col_121">RC</td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;" class="col_36">02</td>
                <td class="center" style="border-style: solid; border-color: #666666 #666666 #000000 #666666; border-width: thin 0px 0px thin;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!14.3!1!4')"><asp:Label CssClass="normal" ID="tab_143_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!14.3!2!4')"><asp:Label CssClass="normal" ID="tab_143_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!14.3!3!4')"><asp:Label CssClass="normal" ID="tab_143_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!14.3!4!4')"><asp:Label CssClass="normal" ID="tab_143_w02_c04" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!14.3!5!4')"><asp:Label CssClass="normal" ID="tab_143_w02_c05" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!14.3!6!4')"><asp:Label CssClass="normal" ID="tab_143_w02_c06" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!14.3!7!4')"><asp:Label CssClass="normal" ID="tab_143_w02_c07" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!14.3!8!4')"><asp:Label CssClass="normal" ID="tab_143_w02_c08" runat="server" Text="0"></asp:Label></a></td>
            </tr>
             <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;" class="col_121">RNs</td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;" class="col_36">03</td>
                <td class="center" style="border-style: solid; border-color: #666666 #666666 #000000 #666666; border-width: thin 0px 0px thin;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!14.3!1!4')"><asp:Label CssClass="normal" ID="tab_143_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!14.3!2!4')"><asp:Label CssClass="normal" ID="tab_143_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!14.3!3!4')"><asp:Label CssClass="normal" ID="tab_143_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!14.3!4!4')"><asp:Label CssClass="normal" ID="tab_143_w03_c04" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!14.3!5!4')"><asp:Label CssClass="normal" ID="tab_143_w03_c05" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!14.3!6!4')"><asp:Label CssClass="normal" ID="tab_143_w03_c06" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!14.3!7!4')"><asp:Label CssClass="normal" ID="tab_143_w03_c07" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!14.3!8!4')"><asp:Label CssClass="normal" ID="tab_143_w03_c08" runat="server" Text="0"></asp:Label></a></td>
            </tr>
             <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;" class="col_121">Nsm</td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;" class="col_36">04</td>
                <td class="center" style="border-style: solid; border-color: #666666 #666666 #000000 #666666; border-width: thin 0px 0px thin;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!14.3!1!4')"><asp:Label CssClass="normal" ID="tab_143_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!14.3!2!4')"><asp:Label CssClass="normal" ID="tab_143_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!14.3!3!4')"><asp:Label CssClass="normal" ID="tab_143_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!14.3!4!4')"><asp:Label CssClass="normal" ID="tab_143_w04_c04" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!14.3!5!4')"><asp:Label CssClass="normal" ID="tab_143_w04_c05" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!14.3!6!4')"><asp:Label CssClass="normal" ID="tab_143_w04_c06" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!14.3!7!4')"><asp:Label CssClass="normal" ID="tab_143_w04_c07" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!14.3!8!4')"><asp:Label CssClass="normal" ID="tab_143_w04_c08" runat="server" Text="0"></asp:Label></a></td>
            </tr>
             <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;" class="col_121">Nkd</td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;" class="col_36">05</td>
                <td class="center" style="border-style: solid; border-color: #666666 #666666 #000000 #666666; border-width: thin 0px 0px thin;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=5!14.3!1!4')"><asp:Label CssClass="normal" ID="tab_143_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=5!14.3!2!4')"><asp:Label CssClass="normal" ID="tab_143_w05_c02" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=5!14.3!3!4')"><asp:Label CssClass="normal" ID="tab_143_w05_c03" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=5!14.3!4!4')"><asp:Label CssClass="normal" ID="tab_143_w05_c04" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=5!14.3!5!4')"><asp:Label CssClass="normal" ID="tab_143_w05_c05" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=5!14.3!6!4')"><asp:Label CssClass="normal" ID="tab_143_w05_c06" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=5!14.3!7!4')"><asp:Label CssClass="normal" ID="tab_143_w05_c07" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=5!14.3!8!4')"><asp:Label CssClass="normal" ID="tab_143_w05_c08" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666; padding-left: 30px;" class="col_121">Inne</td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;" class="col_36">06</td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=6!14.3!1!4')"><asp:Label CssClass="normal" ID="tab_143_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=6!14.3!2!4')"><asp:Label CssClass="normal" ID="tab_143_w06_c02" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=6!14.3!3!4')"><asp:Label CssClass="normal" ID="tab_143_w06_c03" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=6!14.3!4!4')"><asp:Label CssClass="normal" ID="tab_143_w06_c04" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=6!14.3!5!4')"><asp:Label CssClass="normal" ID="tab_143_w06_c05" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=6!14.3!6!4')"><asp:Label CssClass="normal" ID="tab_143_w06_c06" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=6!14.3!7!4')"><asp:Label CssClass="normal" ID="tab_143_w06_c07" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin; border-color: #666666 #000000 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=6!14.3!8!4')"><asp:Label CssClass="normal" ID="tab_143_w06_c08" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            </table>
             <span style="font-size: xx-small; font-family: Arial, Helvetica, sans-serif">W przypadku wezwania biegłego do uzupełnienia rachunku, za datę złożenia rachunku uznaje się datę jego uzupełnienia</span><br />

        <br />
        <br />
        </div>

              <div id="15.1"  class="page-break">

                  <table style="width:100%;">
                      <tr>
                          <td style="width: 1000px"><strong>Dział 15.1 Liczba powołań tłumaczy </strong></td>
                          <td>
                              <a href="javascript:openPopup('popup.aspx?sesja=1!15.1!1!4')">
                              <asp:TextBox ID="tab_151_w01_c01" runat="server" ReadOnly="True" CssClass="col_155">0</asp:TextBox>
                                  </a>
                          </td>
                      </tr>
                      </table>
                  <br />
                  </div>

       <div id="Div11"  class="page-break">

           <asp:Label ID="Label5" runat="server">Dział 15.2 Terminowość sporządzania tłumaczeń pisemnych </asp:Label>

              <br />
        <table  style="width:100%;">
            <tr>
                <td class="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666; border-width: thin thin 0px thin;" class="mssGrayMiddle" colspan="8">Liczba sporządzonych tłumaczeń pisemnych</td>
            </tr>
            <tr>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_140" rowspan="2">razem
                    <br />
                    (kol.1= 2 do 5 =
                    <br />
                    6 do 8)</td>
                <td class="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" class="col_140" rowspan="2">w ustalonym terminie</td>
                <td class="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" colspan="3">po ustalonym terminie </td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" colspan="3">wg czasu wydania opinii</td>
            </tr>
            <tr>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_140">do 30dni</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_140">pow. 1 do 3 miesięcy</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_140">pow. 3 miesięcy</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_140">do 30 dni</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_140">pow. 1 do 3 miesięcy</td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" class="col_140">pow. 3 miesięcy</td>
            </tr>
            <tr>
                <td class="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666; width: 142px;" class="col_140">1</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_140">2</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_140">3</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_140">4</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_140">5</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_140">6</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_140">7</td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666; width: 142px;" class="col_140">8</td>
            </tr>
            <tr>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #000000 #000000;" class="col_140"> <a href="javascript:openPopup('popup.aspx?sesja=1!15.2!1!4')"><asp:Label CssClass="normal" ID="tab_152_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #000000 #666666;" class="col_140"> <a href="javascript:openPopup('popup.aspx?sesja=1!15.2!2!4')"><asp:Label CssClass="normal" ID="tab_152_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #000000 #666666;" class="col_140"> <a href="javascript:openPopup('popup.aspx?sesja=1!15.2!3!4')"><asp:Label CssClass="normal" ID="tab_152_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #000000 #666666;" class="col_140"> <a href="javascript:openPopup('popup.aspx?sesja=1!15.2!4!4')"><asp:Label CssClass="normal" ID="tab_152_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #000000 #666666;" class="col_140"> <a href="javascript:openPopup('popup.aspx?sesja=1!15.2!5!4')"><asp:Label CssClass="normal" ID="tab_152_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #000000 #666666;" class="col_140"> <a href="javascript:openPopup('popup.aspx?sesja=1!15.2!6!4')"><asp:Label CssClass="normal" ID="tab_152_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #000000 #666666;" class="col_140"> <a href="javascript:openPopup('popup.aspx?sesja=1!15.2!7!4')"><asp:Label CssClass="normal" ID="tab_152_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin; border-color: #000000 #666666 #666666 #666666;" class="col_140"> <a href="javascript:openPopup('popup.aspx?sesja=1!15.2!8!4')"><asp:Label CssClass="normal" ID="tab_152_w01_c08" runat="server" Text="0"></asp:Label></a></td>
            </tr>
        </table>
             <br />

        <br />
        </div>

       <div id="Div11"  class="page-break">

           <asp:Label ID="Label17" runat="server">Dział 15.3 Terminowość przyznawania wynagrodzeń za sporządzenie tłumaczeń pisemnych i ustnych oraz za stawiennictwo</asp:Label>

              <br />
        <table  style="width:100%;">
            <tr>
                <td class="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" class="auto-style2" colspan="4">Postanowienia o przyznaniu wynagrodzenia wg czasu od złożenia rachunku</td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #000000 #666666 #666666 #666666;" colspan="4">Skierowanie rachunku do oddziału finansowego
                    <br />
                    wg czasu od postanowienia o przyznaniu wynagrodzenia</td>
            </tr>
            <tr>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_140">razem (kol.2-4) </td>
                <td class="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" class="col_140">do 14 dni</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_140">pow. 14 do 30dni</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_140">pow.yżej miesiąca</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_140">razem (ko. 4-8)</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_140">do 14 dni</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_140">pow. 14 do 30dni</td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_140">powyżej miesiąca</td>
            </tr>
            <tr>
                <td class="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666; " class="auto-style10">1</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="auto-style11">2</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="auto-style11">3</td>
                <td class="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="auto-style11">4</td>
                <td class="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" class="auto-style10">5</td>
                <td class="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" class="auto-style10">6</td>
                <td class="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" class="auto-style10">7</td>
                <td class="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #000000 #666666 #666666 #666666; " class="auto-style10">8</td>
            </tr>
            <tr>
                <td class="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #000000; border-bottom: 0px solid #666666; width: 142px; border-color: #000000 #666666 #000000 #666666; border-width: thin 0px thin thin;" class="col_140"> <a href="javascript:openPopup('popup.aspx?sesja=1!15.3!1!4')"><asp:Label CssClass="normal" ID="tab_153_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #000000 #666666;" class="col_140"> <a href="javascript:openPopup('popup.aspx?sesja=1!15.3!2!4')"><asp:Label CssClass="normal" ID="tab_153_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #000000 #666666;" class="col_140"> <a href="javascript:openPopup('popup.aspx?sesja=1!15.3!3!4')"><asp:Label CssClass="normal" ID="tab_153_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #000000 #666666;" class="col_140"> <a href="javascript:openPopup('popup.aspx?sesja=1!15.3!4!4')"><asp:Label CssClass="normal" ID="tab_153_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #000000 #666666;" class="col_140"> <a href="javascript:openPopup('popup.aspx?sesja=1!15.3!5!4')"><asp:Label CssClass="normal" ID="tab_153_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #000000 #666666;" class="col_140"> <a href="javascript:openPopup('popup.aspx?sesja=1!15.3!6!4')"><asp:Label CssClass="normal" ID="tab_153_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #000000 #666666;" class="col_140"> <a href="javascript:openPopup('popup.aspx?sesja=1!15.3!7!4')"><asp:Label CssClass="normal" ID="tab_153_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                <td class="center" style="border-style: solid; border-width: thin; border-color: #000000 #666666 #666666 #666666;" class="col_140"> <a href="javascript:openPopup('popup.aspx?sesja=1!15.3!8!4')"><asp:Label CssClass="normal" ID="tab_153_w01_c08" runat="server" Text="0"></asp:Label></a></td>
            </tr>
        </table>
             <span style="font-size: xx-small; font-family: Arial, Helvetica, sans-serif">W przypadku wezwania biegłego do uzupełnienia rachunku, za datę złożenia rachunku uznaje się datę jego uzupełnienia</span><br />

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

        <asp:Label ID="Label11" runat="server"></asp:Label>
        </div>

    <br />
  </div>
</asp:Content>