<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="mss16r.aspx.cs" Inherits="stat2018.mss16r" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
  
#menu {
    position:relative;
}
#menu.scrolling {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
}


    </style>
      <script src="Scripts/jquery-1.8.3.js"></script>
       <script src="Scripts/rls.js"></script>

  
    <div class="noprint" >
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
            <td style="width: 100px" >
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
			<H2 CLASS="auto-style2">MS-S16/18</H2>
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
       <table cellpadding="0" cellspacing="0" style="width:100%;">
           <tr>
               <td align="center" colspan="6" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666; border-width: thin thin 0px thin;">Liczba spraw, w których nastąpiło przekroczenie terminu 14 dni od dnia wpływu wniosku lub zawiadomienia o przyjęciu do szpitala psychiatrychnego</td>
           </tr>
           <tr>
               <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 191px;">Razem&nbsp; (kol. 2 fo 6)</td>
               <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 191px;">do 7 dni </td>
               <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 191px;">powyżej 7 do 14 dni</td>
               <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 191px;">powyżej 14 do 21 dni</td>
               <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 191px;">powyżej 21 do30 dni</td>
               <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666; width: 191px;">Ponad 30 dni</td>
           </tr>
           <tr>
               <td align="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666; " class="auto-style6">1</td>
               <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 191px;" class="mssGrayMiddle">2</td>
               <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 191px;" class="mssGrayMiddle">3</td>
               <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 191px;" class="mssGrayMiddle">4</td>
               <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 191px;" class="mssGrayMiddle">5</td>
               <td align="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666; border-width: thin thin 0px thin;" class="auto-style6">6</td>
           </tr>
           <tr>
               <td align="center" style="border: thin solid #000000;" class=""><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.a.1!1!4')"><asp:Label CssClass="normal" ID="tab_111a1_w01_col01" runat="server" Text="0"></asp:Label></a></td>
               <td align="center" style="border: thin solid #000000;" class=""><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.a.1!2!4')"><asp:Label CssClass="normal" ID="tab_111a1_w01_col02" runat="server" Text="0"></asp:Label></a></td>
               <td align="center" style="border: thin solid #000000;" class=""><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.a.1!3!4')"><asp:Label CssClass="normal" ID="tab_111a1_w01_col03" runat="server" Text="0"></asp:Label></a></td>
               <td align="center" style="border: thin solid #000000;" class=""><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.a.1!4!4')"><asp:Label CssClass="normal" ID="tab_111a1_w01_col04" runat="server" Text="0"></asp:Label></a></td>
               <td align="center" style="border: thin solid #000000;" class=""><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.a.1!5!4')"><asp:Label CssClass="normal" ID="tab_111a1_w01_col05" runat="server" Text="0"></asp:Label></a></td>
               <td align="center" style="border: thin solid #000000;" class=""><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.a.1!6!4')"><asp:Label CssClass="normal" ID="tab_111a1_w01_col06" runat="server" Text="0"></asp:Label></a></td>
           </tr>
           </table>
       <br />
    <br />
       </div>
    <div id="wyznaczenia"  class="page-break"> 
        <table style="width:100%;" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 1000px">
    

                    <strong>Dział 1.1.1.a.2.</strong> Liczba spraw o umieszczenie w szpitalu psychiatrycznym bez zgody, w których wydano zarządzenie o doprowadzeniu osoby pozostającej w szpitalu, a której postępowanie bezpośrednio dotyczy na rozprawę, stosownie do możliwości przewidzianej w przepisie art. 46 ust. 1a ustawy z dnia 19 sierpnia 1994 r. o ochronie zdrowia psychicznego (Dz. U. z 2017 r., poz. 882)    
                    


                   
                </td>
                 <td valign="top" align="center">
                    <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.a.2!1!4')"> <asp:TextBox ID="tab_111a2_w01_col01" runat="server" ReadOnly="True" CssClass="col_155"></asp:TextBox></a>
                   
                </td>
            </tr>
        </table>
        <br />
        <table style="width:100%;" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 1000px">
    

                    <strong>Dział 1.1.1.b.</strong> w tym (dz. 1.1.1. w. 47 lit. b) orzeczono przysposobienie, na które rodzice wcześniej wyrazili zgodę</td>
                 <td valign="top" align="center">
                    <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.b!1!4')"> <asp:TextBox ID="tab_111b_w01_col01" runat="server" ReadOnly="True" CssClass="col_155"></asp:TextBox></a>
                   
                </td>
            </tr>
        </table>
        <br />
        <table style="width:100%;" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 1000px">
    

                    <strong>Dział 1.1.1.c</strong>. w tym (dz. 1.1.1. w. 47 lit. c) przez osoby zamieszkałe za granicą</td>
                 <td valign="top" align="center">
                    <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.c!1!4')"> <asp:TextBox ID="tab_111c_w01_col01" runat="server" ReadOnly="True" CssClass="col_155"></asp:TextBox></a>
                   
                </td>
            </tr>
        </table>
        <br />
    

                    <strong>Dział 1.1.1.d</strong>. Przysposobienie według wieku małoletnich (liczby osób)<br />
        <br />
         <div id='1.1.1.d' >
    <table cellpadding="0" cellspacing="0" style="width: 100 %; ">
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
         <div id='1.1.1.e' >
    <table cellpadding="0" cellspacing="0" style="width: 100 %; ">
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
    

                    <strong>Dział 1.1.1.f.</strong> w tym (dz. 1.1.1. w. 48 lit. f)<div id='1.1.1.f' >
    <table cellpadding="0" cellspacing="0" style="width: 100 %; ">
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
        <div id='1.1.1.g' >
    

                    <strong>Dział 1.1.1.g. </strong>
            <h3 class="western"><font size="2">Rodzaje orzeczeń wydanych w okresie statystycznym w sprawach dotyczących wykonywania kontaktów z dzieckiem (art. 598</font><sup><font size="2">15 </font></sup>i nast. K.p.c.)</h3>
            <br />
    <table cellpadding="0" cellspacing="0" style="width: 100 %; ">
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
        <table style="width:100%;" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 1000px">
    

                    <strong>Dział 1.1.1.g.1</strong>. </td>
                 <td valign="top" align="center">
                    <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.c!1!4')"> <asp:TextBox ID="tab_111g1_w01_col01" runat="server" ReadOnly="True" CssClass="col_155"></asp:TextBox></a>
                   
                </td>
            </tr>
        </table>
        <table style="width:100%;" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 1000px" class="wciecie">
    

                    Sprawy dotyczące wykonywania orzeczeń o odebranie osoby podlegającej władzy rodzicielskiej lub pozostającej pod opieką, wydanych na podstawie art. 5981- 5985 kpc </td>
                 <td valign="top" align="center">
                    <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.c!1!4')"> <asp:TextBox ID="tab_111g1_w02_col01" runat="server" ReadOnly="True" CssClass="col_155"></asp:TextBox></a>
                   
                </td>
            </tr>
        </table>
        <table style="width:100%;" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 1000px" class="wciecie">
    

                    Sprawy dotyczące wykonywania orzeczeń o odebranie osoby podlegającej władzy rodzicielskiej lub pozostającej pod opieką, wydanych na podstawie art. 5986- 59812 kpc w zw. z art. 59813 </td>
                 <td valign="top" align="center">
                    <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.c!1!4')"> <asp:TextBox ID="tab_111g1_w03_col01" runat="server" ReadOnly="True" CssClass="col_155"></asp:TextBox></a>
                   
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
                <td valign="bottom" align="center">
                    <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.h!1!4')"> <asp:TextBox ID="tab_111h1_w01_col01" runat="server" ReadOnly="True" CssClass="col_155"></asp:TextBox></a>
                   
                </td>
            </tr>
            </table>
        <br />
        </div>
       <div id="Div11"  class="page-break"> 
           <br />
        <table style="width:100%;">
            <tr>
                <td style="width: 1000px">
    
                        <font face="Arial, sans-serif"><font size="2" style="font-size: 11pt"><font size="2" style="font-size: 9pt"><b>Dział 1.1.1.i. Liczba spraw, w których orzeczono obniżenie alimentów wyłącznie z uwagi na okoliczność uzyskania świadczenia wychowawczego przez uprawniony podmiot na podstawie ustawy z dnia 11 lutego 2016 r. </b><i><b>O pomocy państwa w wychowaniu dzieci</b></i><b> (Dz. U. poz. 195) symbol 003o</b></font></font></font>
                </td>
                <td valign="bottom" align="center">
                         <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.i!1!4')"> <asp:TextBox ID="tab_111i_w01_col01" runat="server" ReadOnly="True" CssClass="col_155"></asp:TextBox></a>
                    
                </td>
            </tr>
            <tr>
                <td style="width: 1000px">
                   
                        <font size="2" style="font-size: 9pt"><span class="auto-style4" >Dział 1.1.1.j. Liczba zarządzeń sędziego o natychmiastowe wypisanie ze szpitala psychiatrycznego i umorzenie postępowania</span></font>
                        <br class="auto-style3" />
                        
                            <font face="Arial, sans-serif"><font size="2" style="font-size: 9pt"><font size="1"><span class="auto-style3" >[art. 45 ust. 2 ustawy z dnia 19 sierpnia 1994 r. o ochronie zdrowia psychicznego </span></font><font class="auto-style3"><font size="1" style="font-size: 6pt"><span >(Dz. U. z 2016 r., poz. 546</span></font><font size="1"><span >)]</span></font></font></font></font>
                    
                </td>
                <td valign="bottom" align="center">
                   

                       <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.i!1!4')">  <asp:TextBox ID="tab_111j_w01_col01" runat="server" ReadOnly="True" CssClass="col_155"></asp:TextBox></a>
                    

                </td>
            </tr>
            </table>
    &nbsp;&nbsp;
    &nbsp;<br />
        </div>
    

                        <strong>Dział 1.1.2</strong> Ewidencja spraw nieletnich<br />
        <div id='1.1.2' >
    <table cellpadding="0" cellspacing="0" style="width: 100 %; ">
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
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2!1!4')"><asp:Label CssClass="normal" ID="Label3" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2!2!4')"><asp:Label CssClass="normal" ID="Label7" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2!3!4')"><asp:Label CssClass="normal" ID="Label8" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2!4!4')"><asp:Label CssClass="normal" ID="Label10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2!5!4')"><asp:Label CssClass="normal" ID="Label12" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2!6!4')"><asp:Label CssClass="normal" ID="Label13" runat="server" Text="0"></asp:Label></a></td>
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


                        <strong>
          <br />
          Dział 1.1.2.a </strong>&nbsp;Ewidencja popełnionych czynów karalnych przez nieletnich w odniesieniu do osób<div id='1.1.2.a' >
    <table cellpadding="0" cellspacing="0" style="width: 100 %; ">
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


                        <strong>
          Dział 1.1.2.b </strong>&nbsp;Stwierdzone czyny karalne przypisane nieletniemu w orzeczeniu kończącym postępowanie <div id='1.1.2.b' >
    <table cellpadding="0" cellspacing="0" style="width: 100 %; ">
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
          Dział 1.1.2.c </strong>&nbsp;Załatwiono w odniesieniu do osób (z wyłączeniem orzeczeń zmienionych w czasie wykonywania orzeczeń) Rep. Nkd<div id='1.1.2.c' >
    <table cellpadding="0" cellspacing="0" style="width: 100 %; ">
  <tr>
    <td  class="borderAll center" colspan="3">Wyszczególnienia</td>
    <td  class="col_90 center borderAll ">ogółem</td>
    <td  class="col_90 center borderAll ">Demoralizacja</td>
    <td  class="col_90 center borderAll ">Czyny karalne</td>
  </tr>
  <tr>
    <td  class="borderAll center" colspan="3">0</td>
    <td  class="col_90 center borderAll ">1</td>
    <td  class="col_90 center borderAll ">2</td>
    <td  class="col_90 center borderAll ">3</td>
  </tr>
  <tr>
    <td colspan="2" class="borderAll wciecie">Załatwiono ogółem (w. 2 do 5+10+23+32+33+37) </td>
  <td  class="borderAll col_36">1</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w01_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w01_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w01_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td colspan="2" class="borderAll wciecie">Nie wszczęto postępowania </td>
  <td  class="borderAll col_36">2</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w02_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w02_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w02_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_100 borderAll " rowspan="2">Umorzono z powodu </td>
    <td  class="borderAll wciecie">niecelowości ze wzgl. na orzeczone środki w innej sprawie </td>
  <td  class="borderAll col_36">3</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w03_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w03_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w03_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">innego </td>
  <td  class="borderAll col_36">4</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w04_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w04_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w04_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_100 borderAll " rowspan="5">Przekazano </td>
    <td  class="borderAll wciecie">ogółem (w. 6–9) </td>
  <td  class="borderAll col_36">5</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w05_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w05_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w05_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">innemu sądowi </td>
  <td  class="borderAll col_36">6</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w06_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w06_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w06_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">prokuratorowi </td>
  <td  class="borderAll col_36">7</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w07_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w07_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w07_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">szkole i organizacji </td>
  <td  class="borderAll col_36">8</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w08_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w08_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w08_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">innemu organowi </td>
  <td  class="borderAll col_36">9</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w09_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w09_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w09_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td class="borderAll wciecie" colspan="2">Orzeczono środki wychowawcze wobec osób </td>
  <td  class="borderAll col_36">10</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w10_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w10_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w10_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="2">Środki wychowawcze – ogółem a) (art. 6 ustawy) *) (w. 12 do 22) </td>
  <td  class="borderAll col_36">11</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w11_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w11_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w11_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="2">Upomnienie (pkt. 1) </td>
  <td  class="borderAll col_36">12</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w12_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w12_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w12_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="2">Zobowiązanie do określonego postępowania (pkt. 2) </td>
  <td  class="borderAll col_36">13</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w13_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w13_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w13_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="2">Nadzór odpowiedzialny rodziców lub opiekuna (p. 3) </td>
  <td  class="borderAll col_36">14</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w14_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w14_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w14_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="2">Nadzór organizacji, zakładu pracy, osoby godnej zaufania (p.4) </td>
  <td  class="borderAll col_36">15</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w15_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w15_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w15_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="2">Nadzór kuratora (p. 5) </td>
  <td  class="borderAll col_36">16</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w16_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w16_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w16_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="2">Skierowanie do ośrodka kuratorskiego (p. 6) </td>
  <td  class="borderAll col_36">17</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w17_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w17_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w17_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="2">Zakaz prowadzenia pojazdów (p. 7) </td>
  <td  class="borderAll col_36">18</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w18_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w18_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w18_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
<td  class="borderAll wciecie" colspan="2">Przepadek rzeczy (p.8) </td>
  <td  class="borderAll col_36">19</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w19_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w19_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w19_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_100 borderAll " rowspan="2">Art. 6 pkt 9 umieszczono w</td>
    <td  class="borderAll wciecie">rodzinie zastępczej zawodowej (p. 9) </td>
  <td  class="borderAll col_36">20</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w20_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w20_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w20_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">młodzieżowym ośrodku wychowawczym </td>
  <td  class="borderAll col_36">21</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w21_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w21_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w21_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="wciecie borderAll" colspan="2">Inny środek wychowawczy (pkt. 11) </td>
  <td  class="borderAll col_36">22</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w22_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w22_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w22_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2"</td>
        Orzeczono środki poprawcze ogółem (w. 24 do 25)
<td  class="borderAll col_36">23</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w23_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w23_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w23_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">Zakład poprawczy bez zawieszenia </td>
  <td  class="borderAll col_36">24</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w24_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w24_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w24_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">Zakład poprawczy z zawieszeniem </td>
  <td  class="borderAll col_36">25</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w25_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w25_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w25_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_100 borderAll " rowspan="6">Środki w okresie zawieszenia zakładu poprawczego b) </td>
    <td  class="borderAll wciecie">nadzór kuratora </td>
  <td  class="borderAll col_36">26</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w26_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w26_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w26_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">skierowanie do kuratorskiego ośrodka </td>
  <td  class="borderAll col_36">27</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w27_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w27_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w27_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">umieszczenie w rodzinie zastęp. </td>
  <td  class="borderAll col_36">28</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w28_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w28_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w28_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">nadzór organizacji, zakładu pracy, osoby godnej zaufania </td>
  <td  class="borderAll col_36">29</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w29_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w29_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w29_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">umieszczenie w młodzieżowym ośrodku wychowawczym </td>
  <td  class="borderAll col_36">30</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w30_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w30_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w30_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">inne środki </td>
  <td  class="borderAll col_36">31</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w31_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w31_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w31_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">Orzeczono karę </td>
  <td  class="borderAll col_36">32</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w32_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w32_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w32_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">Środki leczniczo-wychowawcze (art. 26*)) </td>
  <td  class="borderAll col_36">33</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w33_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w33_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w33_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="col_100 borderAll " rowspan="3">w tym umieszczenie w </td>
    <td  class="borderAll wciecie">zakładzie leczniczym </td>
  <td  class="borderAll col_36">34</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w34_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w34_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w34_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">młodzieżowym ośrodku wychowawczym </td>
  <td  class="borderAll col_36">35</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w35_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w35_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w35_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">domu pomocy społecznej </td>
  <td  class="borderAll col_36">36</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w36_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w36_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w36_c03" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">domu pomocy społecznej </td>
  <td  class="borderAll col_36">37</td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.1.2.c!1!4')"><asp:Label CssClass="normal" ID="tab_112c_w37_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.1.2.c!2!4')"><asp:Label CssClass="normal" ID="tab_112c_w37_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.1.2.c!3!4')"><asp:Label CssClass="normal" ID="tab_112c_w37_c03" runat="server" Text="0"></asp:Label></a></td>
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
          <div id='1.1.4' >
 <strong> Dział 1.1.4</strong> Obciążenie kosztami postępowania we wszystkich sprawach  Nw, Nkd – łącznie (art. 32  ustawy)*)
    <table cellpadding="0" cellspacing="0" style="width: 100 %; ">
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

          <br />
          <div id="1.1.6">
              <strong>Dział 1.1.6</strong> Nieletni oczekujący na umieszczenie i umieszczeni
              <table cellpadding="0" cellspacing="0" style="width: 100 %; ">
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
              <table cellpadding="0" cellspacing="0" style="width: 100 %; ">
                  <tr>
                      <td class="center borderAll" colspan="2" rowspan="4">Wykonywane środki </td>
                      <td class="center borderAll" rowspan="4">Stan w ostatnim dniu poprzedniego okresu sprawoz-dawczego </td>
                      <td class="center borderAll" rowspan="4">Przybyło</td>
                      <td class="center borderAll" colspan="10">U B Y Ł O&nbsp;&nbsp; Z&nbsp;&nbsp; P O W O D U</td>
                      <td class="center borderAll" rowspan="4">Stan w ostatnim dniu okresu sprawoz-dawczego</td>
                      <td class="center borderAll" rowspan="4">Wykonywane środki</td>
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
              <table cellpadding="0" cellspacing="0" style="width: 100 %; ">
                  <tr>
                      <td class="center borderAll" colspan="2" rowspan="2">Wykonywane środki – umieszczenie w </td>
                      <td class="center borderAll" rowspan="2">Stan w ostatnim dniu poprzedniego okresu sprawoz-dawczego </td>
                      <td class="center borderAll" rowspan="2">Przybyło</td>
                      <td class="center borderAll" colspan="8">U B Y Ł O Z P O W O D U</td>
                      <td class="center borderAll" rowspan="2">Stan w ostatnim dniu okresu sprawozdawczego</td>
                      <td class="center borderAll" rowspan="2">Wykonywane środki</td>
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
          <br />

        <br />
          <div id="Div11"  class="page-break"> 
    


           <asp:Label ID="tabela4Label" runat="server">2.2.a</asp:Label>
    
        <table cellpadding="0" cellspacing="0" class="dxflInternalEditorTable_MaterialCompact">
            <tr>
                <td align="center" colspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_155">SPRAWY
wg repertoriów

                lign="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_112">Razem<br />
                    (kol. 2 do 9)</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_112">Do 3 miesięcy</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_112">Powyżej 3
                    <br />
                    do 6 mies.</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_112">Powyżej 6 do<br />
                    12
                    miesięcy.</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_112">Powyżej 12<br />
                    miesięcy do 2 lat</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_112">Powyżej 2 
                    <br />
                    do&nbsp;3
                    lat.</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_112">Powyżej 3
                    <br />
                    do&nbsp;5
                    lat.</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_112">Powyżej 5 <br />
                    do&nbsp;8
                    lat.</td>
                <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" class="col_112">Ponad 8 lat</td>
            </tr>
            <tr>
                <td align="center" colspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_155">0</td>
                <td align="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666; width: 142px;" class="col_112">1</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_112">2</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_112">3</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_112">4</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_112">5</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_112">6</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_112">7</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_112">8</td>
                <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666; width: 142px;" class="col_112">9</td>
            </tr>
            <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;" class="auto-style8">RC </td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #000000;" class="auto-style9 col_36">01</td>
                <td align="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #000000; border-bottom: 0px solid #666666; width: 142px;" class="col_112"> <a href="javascript:openPopup('popup.aspx?sesja=1!2.2.a!1!4')"><asp:Label CssClass="normal" ID="tab_22a_w01_col01" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_112"> <a href="javascript:openPopup('popup.aspx?sesja=1!2.2.a!2!4')"><asp:Label CssClass="normal" ID="tab_22a_w01_col02" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_112"> <a href="javascript:openPopup('popup.aspx?sesja=1!2.2.a!3!4')"><asp:Label CssClass="normal" ID="tab_22a_w01_col03" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_112"> <a href="javascript:openPopup('popup.aspx?sesja=1!2.2.a!4!4')"><asp:Label CssClass="normal" ID="tab_22a_w01_col04" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_112"> <a href="javascript:openPopup('popup.aspx?sesja=1!2.2.a!5!4')"><asp:Label CssClass="normal" ID="tab_22a_w01_col05" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_112"> <a href="javascript:openPopup('popup.aspx?sesja=1!2.2.a!6!4')"><asp:Label CssClass="normal" ID="tab_22a_w01_col06" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_112"> <a href="javascript:openPopup('popup.aspx?sesja=1!2.2.a!7!4')"><asp:Label CssClass="normal" ID="tab_22a_w01_col07" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_112"> <a href="javascript:openPopup('popup.aspx?sesja=1!2.2.a!8!4')"><asp:Label CssClass="normal" ID="tab_22a_w01_col08" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #000000 #000000 #666666 #666666;" class="col_112"> <a href="javascript:openPopup('popup.aspx?sesja=1!2.2.a!9!4')"><asp:Label CssClass="normal" ID="tab_22a_w01_col09" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666; padding-left: 30px;" class="auto-style8">RNs</td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;" class="auto-style9 col_36">02</td>
                <td align="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: thin solid #000000; border-width: thin 0px 0px thin; width: 142px;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.a!1!4')"><asp:Label CssClass="normal" ID="tab_22a_w02_col01" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.a!2!4')"><asp:Label CssClass="normal" ID="tab_22a_w02_col02" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.a!3!4')"><asp:Label CssClass="normal" ID="tab_22a_w02_col03" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.a!4!4')"><asp:Label CssClass="normal" ID="tab_22a_w02_col04" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.a!5!4')"><asp:Label CssClass="normal" ID="tab_22a_w02_col05" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.a!6!4')"><asp:Label CssClass="normal" ID="tab_22a_w02_col06" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.a!7!4')"><asp:Label CssClass="normal" ID="tab_22a_w02_col07" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.a!8!4')"><asp:Label CssClass="normal" ID="tab_22a_w02_col08" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.a!9!4')"><asp:Label CssClass="normal" ID="tab_22a_w02_col09" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666; padding-left: 30px;" class="auto-style8">Nsm</td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;" class="auto-style9 col_36">03</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.a!1!4')"><asp:Label CssClass="normal" ID="tab_22a_w03_col01" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.a!2!4')"><asp:Label CssClass="normal" ID="tab_22a_w03_col02" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.a!3!4')"><asp:Label CssClass="normal" ID="tab_22a_w03_col03" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.a!4!4')"><asp:Label CssClass="normal" ID="tab_22a_w03_col04" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.a!5!4')"><asp:Label CssClass="normal" ID="tab_22a_w03_col05" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.a!6!4')"><asp:Label CssClass="normal" ID="tab_22a_w03_col06" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.a!7!4')"><asp:Label CssClass="normal" ID="tab_22a_w03_col07" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.a!8!4')"><asp:Label CssClass="normal" ID="tab_22a_w03_col08" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.a!9!4')"><asp:Label CssClass="normal" ID="tab_22a_w03_col09" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666; padding-left: 30px;" class="auto-style8">Nkd</td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;" class="auto-style9 col_36">04</td>
                <td align="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: thin solid #000000; width: 142px;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.a!1!4')"><asp:Label CssClass="normal" ID="tab_22a_w04_col01" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.a!2!4')"><asp:Label CssClass="normal" ID="tab_22a_w04_col02" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.a!3!4')"><asp:Label CssClass="normal" ID="tab_22a_w04_col03" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.a!4!4')"><asp:Label CssClass="normal" ID="tab_22a_w04_col04" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.a!5!4')"><asp:Label CssClass="normal" ID="tab_22a_w04_col05" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.a!6!4')"><asp:Label CssClass="normal" ID="tab_22a_w04_col06" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.a!7!4')"><asp:Label CssClass="normal" ID="tab_22a_w04_col07" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.a!8!4')"><asp:Label CssClass="normal" ID="tab_22a_w04_col08" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin; border-color: #666666 #666666 #000000 #666666;" class="col_112"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.a!9!4')"><asp:Label CssClass="normal" ID="tab_22a_w04_col09" runat="server" Text="0"></asp:Label></a></td>
            </tr>
        </table>
    
              <br />
              <br />

        <br />
        <br />
        </div>

 <div id="Div11_1"  class="page-break"> 
    &nbsp;&nbsp;<br />
     <asp:Label ID="tabela5Label" runat="server">Dział 11.1. Terminowość postępowania międzyinstancyjnego  w pierwszej instancji</asp:Label>
     <br />
        <table cellpadding="0" cellspacing="0" style="width:100%;">
            <tr>
                <td align="center" colspan="2" rowspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">Środki odwoławcze, które zostały przekazane do rozpoznania sądowi II instancji</td>
                <td align="center" rowspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="mssGrayMiddle">Ogółem<br />
                    (kol. 2 do 7)</td>
                <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" colspan="6">Z tego od daty orzeczenia sądu rejonowego do daty przekazania do sądu II instancji upłynął okres</td>
            </tr>
            <tr>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;">do 2 mies.</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;">pow. 2 do 3 mies.</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;">pow. 3 do&nbsp; 6<br />
                    miesięcy.</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">pow. 6 do&nbsp; 12<br />
                    miesięcy.</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">pow. 12 do&nbsp;2<br />
                    lat.</td>
                <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;">ponad 2 lata</td>
            </tr>
            <tr>
                <td align="center" colspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">0</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="mssGrayMiddle">1</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">2</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">3</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">4</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;">5</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;">6</td>
                <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666; width: 142px;">7</td>
            </tr>
            <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;">Apelacje </td>
                <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #000000;" class="col_36">01</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="mssGrayMiddle"> <a href="javascript:openPopup('popup.aspx?sesja=1!11.1!1!4')"><asp:Label CssClass="normal" ID="tab_111_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;"> <a href="javascript:openPopup('popup.aspx?sesja=1!11.1!2!4')"><asp:Label CssClass="normal" ID="tab_111_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;"> <a href="javascript:openPopup('popup.aspx?sesja=1!11.1!3!4')"><asp:Label CssClass="normal" ID="tab_111_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;"> <a href="javascript:openPopup('popup.aspx?sesja=1!11.1!4!4')"><asp:Label CssClass="normal" ID="tab_111_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;"> <a href="javascript:openPopup('popup.aspx?sesja=1!11.1!5!4')"><asp:Label CssClass="normal" ID="tab_111_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;"> <a href="javascript:openPopup('popup.aspx?sesja=1!11.1!6!4')"><asp:Label CssClass="normal" ID="tab_111_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #000000 #000000 #666666 #666666;"> <a href="javascript:openPopup('popup.aspx?sesja=1!11.1!7!4')"><asp:Label CssClass="normal" ID="tab_111_w01_c07" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666; padding-left: 30px;">Zażalenia</td>
                <td style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;" class="col_36">02</td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="mssGrayMiddle"><a href="javascript:openPopup('popup.aspx?sesja=2!11.1!1!4')"><asp:Label CssClass="normal" ID="tab_111_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;"><a href="javascript:openPopup('popup.aspx?sesja=2!11.1!2!4')"><asp:Label CssClass="normal" ID="tab_111_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;"><a href="javascript:openPopup('popup.aspx?sesja=2!11.1!3!4')"><asp:Label CssClass="normal" ID="tab_111_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;"><a href="javascript:openPopup('popup.aspx?sesja=2!11.1!4!4')"><asp:Label CssClass="normal" ID="tab_111_w02_c04" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;"><a href="javascript:openPopup('popup.aspx?sesja=2!11.1!5!4')"><asp:Label CssClass="normal" ID="tab_111_w02_c05" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;"><a href="javascript:openPopup('popup.aspx?sesja=2!11.1!6!4')"><asp:Label CssClass="normal" ID="tab_111_w02_c06" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin; border-color: #666666 #000000 #000000 #666666;"><a href="javascript:openPopup('popup.aspx?sesja=2!11.1!7!4')"><asp:Label CssClass="normal" ID="tab_111_w02_c07" runat="server" Text="0"></asp:Label></a></td>
            </tr>
        </table>
        <br />
            <br />
            </div>
           <div>

               <p class="auto-style5">
                   <span style="mso-bidi-font-weight:normal"><span style="font-size: 12.0pt; mso-fareast-font-family: Symbol; mso-highlight: yellow" class="auto-style3">Dział 11.2.</span></span><span style="mso-bidi-font-weight:
normal"><span style="font-size:12.0pt;mso-fareast-font-family:Symbol"> Kontrolka skarg</span></span><span style="mso-bidi-font-weight:normal"><span style="mso-fareast-font-family:Symbol"> (w wydziale, którego<span style="mso-spacerun:yes">&nbsp; </span>sprawy skarga dotyczy) <span style="mso-bidi-font-weight:bold">(§ 448<sup>5 </sup><span  >ust. 1</span></span></span></span><span style="font-size:8.0pt;mso-fareast-font-family:Symbol"> </span><span style="mso-fareast-font-family:Symbol">Zarządzenie</span><span style="mso-bidi-font-weight:normal"><span style="mso-fareast-font-family:Symbol"> Ministra Sprawiedliwości z dnia 12 grudnia 2003 roku w sprawie organizacji i zakresu działania sekretariatów sądowych oraz innych działów administracji sądowej (Dz. Urz. MS. z 2003 r. Nr 5, poz.22, z późn. zm.)</span></span></p>
        <table cellpadding="0" cellspacing="0" style="width:100%;">
            <tr>
                <td align="center" colspan="2" rowspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">Wyszczególnienie</td>
                <td align="center" rowspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="mssGrayMiddle">Wpłynęło</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" rowspan="2">Przesłano do sądu właściwego</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" colspan="3">Rozpoznanie skargi</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" rowspan="2">Zarządzono wypłatę przez Skarb Państwa</td>
                <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" rowspan="2">
             
        Kwota
                    (w złotych)</td>
            </tr>
            <tr>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;">uwzględniono</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;">oddalono</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">inne</td>
            </tr>
            <tr>
                <td align="center" colspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">0</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="mssGrayMiddle">1</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">2</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">3</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">4</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;">5</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;">6</td>
                <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666; width: 142px;">7</td>
            </tr>
            <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666; padding-left: 30px;">Skargi na pracę sądu</td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #666666 #000000;" class="col_36">01</td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #666666 #666666;" class="mssGrayMiddle"> <a href="javascript:openPopup('popup.aspx?sesja=1!11.1!1!4')"><asp:Label CssClass="normal" ID="tab_112_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #666666 #666666;"> <a href="javascript:openPopup('popup.aspx?sesja=1!11.1!2!4')"><asp:Label CssClass="normal" ID="tab_112_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #666666 #666666;"> <a href="javascript:openPopup('popup.aspx?sesja=1!11.1!3!4')"><asp:Label CssClass="normal" ID="tab_112_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #666666 #666666;"> <a href="javascript:openPopup('popup.aspx?sesja=1!11.1!4!4')"><asp:Label CssClass="normal" ID="tab_112_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #666666 #666666;"> <a href="javascript:openPopup('popup.aspx?sesja=1!11.1!5!4')"><asp:Label CssClass="normal" ID="tab_112_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #666666 #666666;"> <a href="javascript:openPopup('popup.aspx?sesja=1!11.1!6!4')"><asp:Label CssClass="normal" ID="tab_112_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin; border-color: #000000 #000000 #666666 #666666;"> <a href="javascript:openPopup('popup.aspx?sesja=1!11.1!7!4')"><asp:Label CssClass="normal" ID="tab_112_w01_c07" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            </table>
           <br />
           <br />

       </div>
       <div>
           <br />
           <asp:Label ID="tabela8Label" runat="server" Text="Dział 14.1. Liczba biegłych/podmiotów wydających opinie w sprawach  (z wył. tłumaczy przysięgłych)"></asp:Label>
&nbsp;<br />
        <table cellpadding="0" cellspacing="0" style="width:100%;">
            <tr>
                <td align="center" colspan="2" rowspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">Sprawy wg repertoriów</td>
                <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" colspan="4">Z tego od daty orzeczenia sądu rejonowego do daty przekazania do sądu II instancji upłynął okres</td>
            </tr>
            <tr>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; " class="col_246">do 2 mies.</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; " class="col_246">pow. 2 do 3 mies.</td>
                <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; " class="col_246">pow. 3 do&nbsp; 6<br />
                    miesięcy.</td>
                <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" class="col_246">pow. 6 do&nbsp; 12<br />
                    miesięcy.</td>
            </tr>
            <tr>
                <td align="center" colspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">0</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 250px;" class="col_246">1</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 250px;" class="col_246">2</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 250px;" class="col_246">3</td>
                <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666; width: 250px;" class="col_246">4</td>
            </tr>
            <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;" class="col_121">Ogółem (w. 02 do 06)</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #000000;" class="col_36">01</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_246"> <a href="javascript:openPopup('popup.aspx?sesja=1!14.1!1!4')"><asp:Label CssClass="normal" ID="tab_141_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_246"> <a href="javascript:openPopup('popup.aspx?sesja=1!14.1!2!4')"><asp:Label CssClass="normal" ID="tab_141_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_246"> <a href="javascript:openPopup('popup.aspx?sesja=1!14.1!3!4')"><asp:Label CssClass="normal" ID="tab_141_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #000000 #000000 #666666 #666666;" class="col_246"> <a href="javascript:openPopup('popup.aspx?sesja=1!14.1!4!4')"><asp:Label CssClass="normal" ID="tab_141_w01_c04" runat="server" Text="0"></asp:Label></a></td>
            </tr>
             <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;" class="col_121">RC </td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #000000;" class="col_36">02</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_246"> <a href="javascript:openPopup('popup.aspx?sesja=2!14.1!1!4')"><asp:Label CssClass="normal" ID="tab_141_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_246"> <a href="javascript:openPopup('popup.aspx?sesja=2!14.1!2!4')"><asp:Label CssClass="normal" ID="tab_141_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_246"> <a href="javascript:openPopup('popup.aspx?sesja=2!14.1!3!4')"><asp:Label CssClass="normal" ID="tab_141_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #666666 #666666;" class="col_246"> <a href="javascript:openPopup('popup.aspx?sesja=2!14.1!4!4')"><asp:Label CssClass="normal" ID="tab_141_w02_c04" runat="server" Text="0"></asp:Label></a></td>
            </tr>
             <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;" class="col_121">RNs </td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #000000;" class="col_36">03</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_246"> <a href="javascript:openPopup('popup.aspx?sesja=3!14.1!1!4')"><asp:Label CssClass="normal" ID="tab_141_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_246"> <a href="javascript:openPopup('popup.aspx?sesja=3!14.1!2!4')"><asp:Label CssClass="normal" ID="tab_141_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_246"> <a href="javascript:openPopup('popup.aspx?sesja=3!14.1!3!4')"><asp:Label CssClass="normal" ID="tab_141_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #666666 #666666;" class="col_246"> <a href="javascript:openPopup('popup.aspx?sesja=3!14.1!4!4')"><asp:Label CssClass="normal" ID="tab_141_w03_c04" runat="server" Text="0"></asp:Label></a></td>
            </tr>
             <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;" class="col_121">Nsm </td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #000000;" class="col_36">04</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_246"> <a href="javascript:openPopup('popup.aspx?sesja=4!14.1!1!4')"><asp:Label CssClass="normal" ID="tab_141_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_246"> <a href="javascript:openPopup('popup.aspx?sesja=4!14.1!2!4')"><asp:Label CssClass="normal" ID="tab_141_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_246"> <a href="javascript:openPopup('popup.aspx?sesja=4!14.1!3!4')"><asp:Label CssClass="normal" ID="tab_141_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #666666 #666666;" class="col_246"> <a href="javascript:openPopup('popup.aspx?sesja=4!14.1!4!4')"><asp:Label CssClass="normal" ID="tab_141_w04_c04" runat="server" Text="0"></asp:Label></a></td>
            </tr>
             <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;" class="col_121">Nkd </td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #000000;" class="col_36">05</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_246"> <a href="javascript:openPopup('popup.aspx?sesja=5!14.1!1!4')"><asp:Label CssClass="normal" ID="tab_141_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_246"> <a href="javascript:openPopup('popup.aspx?sesja=5!14.1!2!4')"><asp:Label CssClass="normal" ID="tab_141_w05_c02" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_246"> <a href="javascript:openPopup('popup.aspx?sesja=5!14.1!3!4')"><asp:Label CssClass="normal" ID="tab_141_w05_c03" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #666666 #666666;" class="col_246"> <a href="javascript:openPopup('popup.aspx?sesja=5!14.1!4!4')"><asp:Label CssClass="normal" ID="tab_141_w05_c04" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666; padding-left: 30px;" class="col_121">Inne</td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;" class="col_36">06</td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_246"><a href="javascript:openPopup('popup.aspx?sesja=6!14.1!1!4')"><asp:Label CssClass="normal" ID="tab_141_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_246"><a href="javascript:openPopup('popup.aspx?sesja=6!14.1!2!4')"><asp:Label CssClass="normal" ID="tab_141_w06_c02" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_246"><a href="javascript:openPopup('popup.aspx?sesja=6!14.1!3!4')"><asp:Label CssClass="normal" ID="tab_141_w06_c03" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin; border-color: #666666 #000000 #000000 #666666;" class="col_246"><a href="javascript:openPopup('popup.aspx?sesja=6!14.1!4!4')"><asp:Label CssClass="normal" ID="tab_141_w06_c04" runat="server" Text="0"></asp:Label></a></td>
            </tr>
        </table>
          <br />

       </div>
       <div id="Div142"  class="page-break"> 
    


           <asp:Label ID="Label1" runat="server">Dział 14.2. Terminowość sporządzania opinii pisemnych (z wył. tłumaczy przysięgłych</asp:Label>
    
              <br />
        <table cellpadding="0" cellspacing="0" style="width:100%;">
            <tr>
                <td align="center" colspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_155" rowspan="3">Sprawy wg repertoriów</td>
                <td align="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666; border-width: thin thin 0px thin;" class="mssGrayMiddle" colspan="8">Liczba sporządzonych opinii</td>
            </tr>
            <tr>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_100" rowspan="2">razem
                    <br />
                    (kol.1= 2 do 5 =
                    <br />
                    6 do 8)</td>
                <td align="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" class="col_100" rowspan="2">w ustalonym terminie</td>
                <td align="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" colspan="3">po ustalonym terminie </td>
                <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" colspan="3">wg czasu wydania opinii</td>
            </tr>
            <tr>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_100">do 30dni</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_100">pow. 1 do 3 miesięcy</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_100">pow. 3 miesięcy</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_100">do 30 dni</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_100">pow. 1 do 3 miesięcy</td>
                <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" class="col_100">pow. 3 miesięcy</td>
            </tr>
            <tr>
                <td align="center" colspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_155">0</td>
                <td align="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666; width: 142px;" class="col_123">1</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">2</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">3</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">4</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_123">5</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_123">6</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_123">7</td>
                <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666; width: 142px;" class="col_123">8</td>
            </tr>
            <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;" class="col_121">Ogółem (w. 02 do 07)</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #000000;" class="col_36">01</td>
                <td align="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #000000; border-bottom: 0px solid #666666; width: 142px;" class="col_123"> <a href="javascript:openPopup('popup.aspx?sesja=1!14.2!1!4')"><asp:Label CssClass="normal" ID="tab_142_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"> <a href="javascript:openPopup('popup.aspx?sesja=1!14.2!2!4')"><asp:Label CssClass="normal" ID="tab_142_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"> <a href="javascript:openPopup('popup.aspx?sesja=1!14.2!3!4')"><asp:Label CssClass="normal" ID="tab_142_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"> <a href="javascript:openPopup('popup.aspx?sesja=1!14.2!4!4')"><asp:Label CssClass="normal" ID="tab_142_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"> <a href="javascript:openPopup('popup.aspx?sesja=1!14.2!5!4')"><asp:Label CssClass="normal" ID="tab_142_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"> <a href="javascript:openPopup('popup.aspx?sesja=1!14.2!6!4')"><asp:Label CssClass="normal" ID="tab_142_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"> <a href="javascript:openPopup('popup.aspx?sesja=1!14.2!7!4')"><asp:Label CssClass="normal" ID="tab_142_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #000000 #000000 #666666 #666666;" class="col_123"> <a href="javascript:openPopup('popup.aspx?sesja=1!14.2!8!4')"><asp:Label CssClass="normal" ID="tab_142_w01_c08" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;" class="col_121">RC</td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;" class="col_36">02</td>
                <td align="center" style="border-style: solid; border-color: #666666 #666666 #000000 #666666; border-width: thin 0px 0px thin;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!14.2!1!4')"><asp:Label CssClass="normal" ID="tab_142_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!14.2!2!4')"><asp:Label CssClass="normal" ID="tab_142_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!14.2!3!4')"><asp:Label CssClass="normal" ID="tab_142_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!14.2!4!4')"><asp:Label CssClass="normal" ID="tab_142_w02_c04" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!14.2!5!4')"><asp:Label CssClass="normal" ID="tab_142_w02_c05" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!14.2!6!4')"><asp:Label CssClass="normal" ID="tab_142_w02_c06" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!14.2!7!4')"><asp:Label CssClass="normal" ID="tab_142_w02_c07" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #666666 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!14.2!8!4')"><asp:Label CssClass="normal" ID="tab_142_w02_c08" runat="server" Text="0"></asp:Label></a></td>
            </tr>
             <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;" class="col_121">RNs</td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;" class="col_36">03</td>
                <td align="center" style="border-style: solid; border-color: #666666 #666666 #000000 #666666; border-width: thin 0px 0px thin;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!14.2!1!4')"><asp:Label CssClass="normal" ID="tab_142_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!14.2!2!4')"><asp:Label CssClass="normal" ID="tab_142_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!14.2!3!4')"><asp:Label CssClass="normal" ID="tab_142_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!14.2!4!4')"><asp:Label CssClass="normal" ID="tab_142_w03_c04" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!14.2!5!4')"><asp:Label CssClass="normal" ID="tab_142_w03_c05" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!14.2!6!4')"><asp:Label CssClass="normal" ID="tab_142_w03_c06" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!14.2!7!4')"><asp:Label CssClass="normal" ID="tab_142_w03_c07" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #666666 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!14.2!8!4')"><asp:Label CssClass="normal" ID="tab_142_w03_c08" runat="server" Text="0"></asp:Label></a></td>
            </tr>
             <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;" class="col_121">Nsm</td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;" class="col_36">04</td>
                <td align="center" style="border-style: solid; border-color: #666666 #666666 #000000 #666666; border-width: thin 0px 0px thin;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!14.2!1!4')"><asp:Label CssClass="normal" ID="tab_142_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!14.2!2!4')"><asp:Label CssClass="normal" ID="tab_142_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!14.2!3!4')"><asp:Label CssClass="normal" ID="tab_142_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!14.2!4!4')"><asp:Label CssClass="normal" ID="tab_142_w04_c04" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!14.2!5!4')"><asp:Label CssClass="normal" ID="tab_142_w04_c05" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!14.2!6!4')"><asp:Label CssClass="normal" ID="tab_142_w04_c06" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!14.2!7!4')"><asp:Label CssClass="normal" ID="tab_142_w04_c07" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #666666 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!14.2!8!4')"><asp:Label CssClass="normal" ID="tab_142_w04_c08" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;" class="col_121">Nkd</td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;" class="col_36">05</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=5!14.2!1!4')"><asp:Label CssClass="normal" ID="tab_142_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=5!14.2!2!4')"><asp:Label CssClass="normal" ID="tab_142_w05_c02" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=5!14.2!3!4')"><asp:Label CssClass="normal" ID="tab_142_w05_c03" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=5!14.2!4!4')"><asp:Label CssClass="normal" ID="tab_142_w05_c04" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=5!14.2!5!4')"><asp:Label CssClass="normal" ID="tab_142_w05_c05" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=5!14.2!6!4')"><asp:Label CssClass="normal" ID="tab_142_w05_c06" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=5!14.2!7!4')"><asp:Label CssClass="normal" ID="tab_142_w05_c07" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #666666 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=5!14.2!8!4')"><asp:Label CssClass="normal" ID="tab_142_w05_c08" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666; padding-left: 30px;" class="col_121">Inne</td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;" class="col_36">06</td>
                <td align="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: thin solid #000000; width: 142px;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!14.2!1!4')"><asp:Label CssClass="normal" ID="tab_142_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=6!14.2!2!4')"><asp:Label CssClass="normal" ID="tab_142_w06_c02" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=6!14.2!3!4')"><asp:Label CssClass="normal" ID="tab_142_w06_c03" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=6!14.2!4!4')"><asp:Label CssClass="normal" ID="tab_142_w06_c04" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=6!14.2!5!4')"><asp:Label CssClass="normal" ID="tab_142_w06_c05" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=6!14.2!6!4')"><asp:Label CssClass="normal" ID="tab_142_w06_c06" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=6!14.2!7!4')"><asp:Label CssClass="normal" ID="tab_142_w06_c07" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin; border-color: #666666 #000000 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=6!14.2!8!4')"><asp:Label CssClass="normal" ID="tab_142_w06_c08" runat="server" Text="0"></asp:Label></a></td>
            </tr>
        </table>
             <span style="font-size: xx-small; font-family: Arial, Helvetica, sans-serif"> W przypadku złożenia przez biegłego opinii w terminie przedłużonym przez sąd, uznaje się ją za sporządzoną w ustalonym terminie.</span><br />

        <br />
        <br />
        </div>
       <div id="Div11"  class="page-break"> 
    


           <asp:Label ID="Label2" runat="server">Dział 14.3. Terminowość przyznawania wynagrodzeń za sporządzenie opinii pisemnych i ustnych oraz za stawiennictwo</asp:Label>
    
              <br />
        <table cellpadding="0" cellspacing="0" style="width:100%;">
            <tr>
                <td align="center" colspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_155" rowspan="2">Sprawy wg repertoriów</td>
                <td align="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" class="auto-style2" colspan="4">Postanowienia o przyznaniu wynagrodzenia wg czasu od złożenia rachunku</td>
                <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #000000 #666666 #666666 #666666;" colspan="4">Skierowanie rachunku do oddziału finansowego
                    <br />
                    wg czasu od postanowienia o przyznaniu wynagrodzenia</td>
            </tr>
            <tr>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_100">razem (kol.2-4) </td>
                <td align="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" class="col_100">do 14 dni</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_100">pow. 14 do 30dni</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_100">pow.yżej miesiąca</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_100">razem (ko. 4-8)</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_100">do 14 dni</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_100">pow. 14 do 30dni</td>
                <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_100">powyżej miesiąca</td>
            </tr>
            <tr>
                <td align="center" colspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_155">0</td>
                <td align="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666; width: 142px;" class="col_123">1</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">2</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">3</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">4</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_123">5</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_123">6</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_123">7</td>
                <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #000000 #666666 #666666 #666666; " class="col_123">8</td>
            </tr>
            <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;" class="col_121">Ogółem (w. 02 do 07)</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #000000;" class="col_36">01</td>
                <td align="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #000000; border-bottom: 0px solid #666666; width: 142px;" class="col_123"> <a href="javascript:openPopup('popup.aspx?sesja=1!14.3!1!4')"><asp:Label CssClass="normal" ID="tab_143_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"> <a href="javascript:openPopup('popup.aspx?sesja=1!14.3!2!4')"><asp:Label CssClass="normal" ID="tab_143_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"> <a href="javascript:openPopup('popup.aspx?sesja=1!14.3!3!4')"><asp:Label CssClass="normal" ID="tab_143_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"> <a href="javascript:openPopup('popup.aspx?sesja=1!14.3!4!4')"><asp:Label CssClass="normal" ID="tab_143_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"> <a href="javascript:openPopup('popup.aspx?sesja=1!14.3!5!4')"><asp:Label CssClass="normal" ID="tab_143_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"> <a href="javascript:openPopup('popup.aspx?sesja=1!14.3!6!4')"><asp:Label CssClass="normal" ID="tab_143_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"> <a href="javascript:openPopup('popup.aspx?sesja=1!14.3!7!4')"><asp:Label CssClass="normal" ID="tab_143_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"> <a href="javascript:openPopup('popup.aspx?sesja=1!14.3!8!4')"><asp:Label CssClass="normal" ID="tab_143_w01_c08" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;" class="col_121">RC</td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;" class="col_36">02</td>
                <td align="center" style="border-style: solid; border-color: #666666 #666666 #000000 #666666; border-width: thin 0px 0px thin;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!14.3!1!4')"><asp:Label CssClass="normal" ID="tab_143_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!14.3!2!4')"><asp:Label CssClass="normal" ID="tab_143_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!14.3!3!4')"><asp:Label CssClass="normal" ID="tab_143_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!14.3!4!4')"><asp:Label CssClass="normal" ID="tab_143_w02_c04" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!14.3!5!4')"><asp:Label CssClass="normal" ID="tab_143_w02_c05" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!14.3!6!4')"><asp:Label CssClass="normal" ID="tab_143_w02_c06" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!14.3!7!4')"><asp:Label CssClass="normal" ID="tab_143_w02_c07" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!14.3!8!4')"><asp:Label CssClass="normal" ID="tab_143_w02_c08" runat="server" Text="0"></asp:Label></a></td>
            </tr>
             <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;" class="col_121">RNs</td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;" class="col_36">03</td>
                <td align="center" style="border-style: solid; border-color: #666666 #666666 #000000 #666666; border-width: thin 0px 0px thin;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!14.3!1!4')"><asp:Label CssClass="normal" ID="tab_143_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!14.3!2!4')"><asp:Label CssClass="normal" ID="tab_143_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!14.3!3!4')"><asp:Label CssClass="normal" ID="tab_143_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!14.3!4!4')"><asp:Label CssClass="normal" ID="tab_143_w03_c04" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!14.3!5!4')"><asp:Label CssClass="normal" ID="tab_143_w03_c05" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!14.3!6!4')"><asp:Label CssClass="normal" ID="tab_143_w03_c06" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!14.3!7!4')"><asp:Label CssClass="normal" ID="tab_143_w03_c07" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!14.3!8!4')"><asp:Label CssClass="normal" ID="tab_143_w03_c08" runat="server" Text="0"></asp:Label></a></td>
            </tr>
             <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;" class="col_121">Nsm</td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;" class="col_36">04</td>
                <td align="center" style="border-style: solid; border-color: #666666 #666666 #000000 #666666; border-width: thin 0px 0px thin;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!14.3!1!4')"><asp:Label CssClass="normal" ID="tab_143_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!14.3!2!4')"><asp:Label CssClass="normal" ID="tab_143_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!14.3!3!4')"><asp:Label CssClass="normal" ID="tab_143_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!14.3!4!4')"><asp:Label CssClass="normal" ID="tab_143_w04_c04" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!14.3!5!4')"><asp:Label CssClass="normal" ID="tab_143_w04_c05" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!14.3!6!4')"><asp:Label CssClass="normal" ID="tab_143_w04_c06" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!14.3!7!4')"><asp:Label CssClass="normal" ID="tab_143_w04_c07" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!14.3!8!4')"><asp:Label CssClass="normal" ID="tab_143_w04_c08" runat="server" Text="0"></asp:Label></a></td>
            </tr>
             <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;" class="col_121">Nkd</td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;" class="col_36">05</td>
                <td align="center" style="border-style: solid; border-color: #666666 #666666 #000000 #666666; border-width: thin 0px 0px thin;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=5!14.3!1!4')"><asp:Label CssClass="normal" ID="tab_143_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=5!14.3!2!4')"><asp:Label CssClass="normal" ID="tab_143_w05_c02" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=5!14.3!3!4')"><asp:Label CssClass="normal" ID="tab_143_w05_c03" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=5!14.3!4!4')"><asp:Label CssClass="normal" ID="tab_143_w05_c04" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=5!14.3!5!4')"><asp:Label CssClass="normal" ID="tab_143_w05_c05" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=5!14.3!6!4')"><asp:Label CssClass="normal" ID="tab_143_w05_c06" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=5!14.3!7!4')"><asp:Label CssClass="normal" ID="tab_143_w05_c07" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=5!14.3!8!4')"><asp:Label CssClass="normal" ID="tab_143_w05_c08" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td align="justify" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666; padding-left: 30px;" class="col_121">Inne</td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;" class="col_36">06</td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=6!14.3!1!4')"><asp:Label CssClass="normal" ID="tab_143_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=6!14.3!2!4')"><asp:Label CssClass="normal" ID="tab_143_w06_c02" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=6!14.3!3!4')"><asp:Label CssClass="normal" ID="tab_143_w06_c03" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=6!14.3!4!4')"><asp:Label CssClass="normal" ID="tab_143_w06_c04" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=6!14.3!5!4')"><asp:Label CssClass="normal" ID="tab_143_w06_c05" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=6!14.3!6!4')"><asp:Label CssClass="normal" ID="tab_143_w06_c06" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=6!14.3!7!4')"><asp:Label CssClass="normal" ID="tab_143_w06_c07" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin; border-color: #666666 #000000 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=6!14.3!8!4')"><asp:Label CssClass="normal" ID="tab_143_w06_c08" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            </table>
             <span style="font-size: xx-small; font-family: Arial, Helvetica, sans-serif">W przypadku wezwania biegłego do uzupełnienia rachunku, za datę złożenia rachunku uznaje się datę jego uzupełnienia</span><br />

        <br />
        <br />
        </div>

              <div id="Div11"  class="page-break"> 



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
        <table cellpadding="0" cellspacing="0" style="width:100%;">
            <tr>
                <td align="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666; border-width: thin thin 0px thin;" class="mssGrayMiddle" colspan="8">Liczba sporządzonych tłumaczeń pisemnych</td>
            </tr>
            <tr>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_140" rowspan="2">razem
                    <br />
                    (kol.1= 2 do 5 =
                    <br />
                    6 do 8)</td>
                <td align="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" class="col_140" rowspan="2">w ustalonym terminie</td>
                <td align="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" colspan="3">po ustalonym terminie </td>
                <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" colspan="3">wg czasu wydania opinii</td>
            </tr>
            <tr>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_140">do 30dni</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_140">pow. 1 do 3 miesięcy</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_140">pow. 3 miesięcy</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_140">do 30 dni</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_140">pow. 1 do 3 miesięcy</td>
                <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" class="col_140">pow. 3 miesięcy</td>
            </tr>
            <tr>
                <td align="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666; width: 142px;" class="col_140">1</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_140">2</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_140">3</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_140">4</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_140">5</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_140">6</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_140">7</td>
                <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666; width: 142px;" class="col_140">8</td>
            </tr>
            <tr>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #000000 #000000;" class="col_140"> <a href="javascript:openPopup('popup.aspx?sesja=1!15.2!1!4')"><asp:Label CssClass="normal" ID="tab_152_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #000000 #666666;" class="col_140"> <a href="javascript:openPopup('popup.aspx?sesja=1!15.2!2!4')"><asp:Label CssClass="normal" ID="tab_152_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #000000 #666666;" class="col_140"> <a href="javascript:openPopup('popup.aspx?sesja=1!15.2!3!4')"><asp:Label CssClass="normal" ID="tab_152_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #000000 #666666;" class="col_140"> <a href="javascript:openPopup('popup.aspx?sesja=1!15.2!4!4')"><asp:Label CssClass="normal" ID="tab_152_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #000000 #666666;" class="col_140"> <a href="javascript:openPopup('popup.aspx?sesja=1!15.2!5!4')"><asp:Label CssClass="normal" ID="tab_152_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #000000 #666666;" class="col_140"> <a href="javascript:openPopup('popup.aspx?sesja=1!15.2!6!4')"><asp:Label CssClass="normal" ID="tab_152_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #000000 #666666;" class="col_140"> <a href="javascript:openPopup('popup.aspx?sesja=1!15.2!7!4')"><asp:Label CssClass="normal" ID="tab_152_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin; border-color: #000000 #666666 #666666 #666666;" class="col_140"> <a href="javascript:openPopup('popup.aspx?sesja=1!15.2!8!4')"><asp:Label CssClass="normal" ID="tab_152_w01_c08" runat="server" Text="0"></asp:Label></a></td>
            </tr>
           
          
        </table>
             <br />

        <br />
        </div>


       <div id="Div11"  class="page-break"> 
    


           <asp:Label ID="Label17" runat="server">Dział 15.3 Terminowość przyznawania wynagrodzeń za sporządzenie tłumaczeń pisemnych i ustnych oraz za stawiennictwo</asp:Label>
    
              <br />
        <table cellpadding="0" cellspacing="0" style="width:100%;">
            <tr>
                <td align="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" class="auto-style2" colspan="4">Postanowienia o przyznaniu wynagrodzenia wg czasu od złożenia rachunku</td>
                <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #000000 #666666 #666666 #666666;" colspan="4">Skierowanie rachunku do oddziału finansowego
                    <br />
                    wg czasu od postanowienia o przyznaniu wynagrodzenia</td>
            </tr>
            <tr>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_140">razem (kol.2-4) </td>
                <td align="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" class="col_140">do 14 dni</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_140">pow. 14 do 30dni</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 142px;" class="col_140">pow.yżej miesiąca</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_140">razem (ko. 4-8)</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_140">do 14 dni</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_140">pow. 14 do 30dni</td>
                <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_140">powyżej miesiąca</td>
            </tr>
            <tr>
                <td align="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666; " class="auto-style10">1</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="auto-style11">2</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="auto-style11">3</td>
                <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="auto-style11">4</td>
                <td align="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" class="auto-style10">5</td>
                <td align="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" class="auto-style10">6</td>
                <td align="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" class="auto-style10">7</td>
                <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #000000 #666666 #666666 #666666; " class="auto-style10">8</td>
            </tr>
            <tr>
                <td align="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #000000; border-bottom: 0px solid #666666; width: 142px; border-color: #000000 #666666 #000000 #666666; border-width: thin 0px thin thin;" class="col_140"> <a href="javascript:openPopup('popup.aspx?sesja=1!14.3!1!4')"><asp:Label CssClass="normal" ID="tab_153_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #000000 #666666;" class="col_140"> <a href="javascript:openPopup('popup.aspx?sesja=1!15.3!2!4')"><asp:Label CssClass="normal" ID="tab_153_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #000000 #666666;" class="col_140"> <a href="javascript:openPopup('popup.aspx?sesja=1!15.3!3!4')"><asp:Label CssClass="normal" ID="tab_153_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #000000 #666666;" class="col_140"> <a href="javascript:openPopup('popup.aspx?sesja=1!15.3!4!4')"><asp:Label CssClass="normal" ID="tab_153_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #000000 #666666;" class="col_140"> <a href="javascript:openPopup('popup.aspx?sesja=1!15.3!5!4')"><asp:Label CssClass="normal" ID="tab_153_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #000000 #666666;" class="col_140"> <a href="javascript:openPopup('popup.aspx?sesja=1!15.3!6!4')"><asp:Label CssClass="normal" ID="tab_153_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #000000 #666666 #000000 #666666;" class="col_140"> <a href="javascript:openPopup('popup.aspx?sesja=1!15.3!7!4')"><asp:Label CssClass="normal" ID="tab_153_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                <td align="center" style="border-style: solid; border-width: thin; border-color: #000000 #666666 #666666 #666666;" class="col_140"> <a href="javascript:openPopup('popup.aspx?sesja=1!15.3!8!4')"><asp:Label CssClass="normal" ID="tab_153_w01_c08" runat="server" Text="0"></asp:Label></a></td>
            </tr>
     
        </table>
             <span style="font-size: xx-small; font-family: Arial, Helvetica, sans-serif">W przypadku wezwania biegłego do uzupełnienia rachunku, za datę złożenia rachunku uznaje się datę jego uzupełnienia</span><br />

        <br />
        <br />
        </div>
    <div id="debag" >
     
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

