<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="mss11r.aspx.cs" Inherits="stat2018.mss11r"  MaintainScrollPositionOnPostback="true" %>

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
    


    <div style="width: 1150px; margin: 0 auto 0 auto; position: relative; top: 60px;" class="content">

      
  &nbsp;<asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:wap %>" 
        
        
        SelectCommand="SELECT DISTINCT id_, opis, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15,id_tabeli FROM tbl_statystyki_tbl_01 WHERE (id_dzialu = @id_dzialu) AND (id_tabeli = 1) ORDER BY id_">
        <SelectParameters>
            <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
        </SelectParameters>
             </asp:SqlDataSource>
   

     <div id="Div2"  style="z-index:10; "> 
        <div style="margin-left:auto;margin-right:auto;text-align: center; width:auto; visibility: hidden;"> 
            <asp:Label ID="Label3" runat="server" Text="Sąd " style="font-weight: 700" Visible="False"></asp:Label>
     <br />
         </div> 
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
		<TD ROWSPAN=3 WIDTH=290 align="center">
			<H2 CLASS="auto-style2">MS-S11r</H2>
			<P CLASS="western" ALIGN=CENTER><FONT FACE="Arial, sans-serif"><FONT SIZE=3><B>SPRAWOZDANIE</B></FONT></FONT></P>
			<p align="CENTER" style="margin-bottom: 0cm">
                <font face="Arial, sans-serif" size="2"><b>z zakresu prawa pracy i ubezpieczeń społecznych </b></font>
            </p>
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
  
     <div id="tab1.1.1.a">
           <br />
<b>Dział 1.1.1.a.</b> w tym: skarga o stwierdzenie niezgodności z prawem (dział 1.1.1. wiersz 23 rubryka 4 lit. a)   
          <br />
             <table cellpadding="0" cellspacing="0" width="50%">
               <tr>
                   <td class="borderTopLeft " colspan="3" align="center">Wyszczególnienie</td>
                   <td class="borderTopLeftRight col_90" align="center">Liczby spraw</td>
               </tr>
               <tr>
                   <td class="borderTopLeft " colspan="3" align="center">0</td>
                   <td class="borderTopLeftRight col_90" align="center">1</td>
               </tr>
               <tr>
                   <td class="borderTopLeft wciecie" colspan="2">Przekazane Sądowi Najwyższemu ze skargą o stwierdzenie niezgodności z prawem </td>
                   <td class="borderTopLeft col_36">01</td>
                   <td class="borderTopLeftRight col_90" align="center"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.a!1!4')">  <asp:Label CssClass="normal" ID="tab_111a_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
                   
               </tr>
               <tr>
                   <td class="borderTopLeft wciecie" colspan="2">Przesłanych z Sądu Najwyższego w okresie sprawozdawczym (w.02 =w. 03 do 07)</td>
                   <td class="borderTopLeft col_36">02</td>
                 <td class="borderTopLeftRight col_90" align="center"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.1.a!1!4')">  <asp:Label CssClass="normal" ID="tab_111a_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
        
               </tr>
               <tr>
                   <td class="borderTopLeftBottom wciecie" rowspan="5">w których Sąd Najwyższy</td>
                   <td class="borderTopLeft wciecie">odmówił przyjęcia skargi (art.4249 kpc) </td>
                   <td class="borderTopLeft col_36">03</td>
                   <td class="borderTopLeftRight col_90" align="center"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.1.a!1!4')">  <asp:Label CssClass="normal" ID="tab_111a_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
        
               </tr>
               <tr>
                   <td class="borderTopLeft wciecie">odrzucił skargę (art.4248 kpc) </td>
                   <td class="borderTopLeft col_36">04</td>
                    <td class="borderTopLeftRight col_90" align="center"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.1.a!1!4')">  <asp:Label CssClass="normal" ID="tab_111a_w04_c01" runat="server" Text="0"></asp:Label>  </a></td>
        
               </tr>
               <tr>
                   <td class="borderTopLeft wciecie">oddalił skargę (art.42411 §1 kpc) </td>
                   <td class="borderTopLeft col_36">05</td>
                   <td class="borderTopLeftRight col_90" align="center"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.1.a!1!4')">  <asp:Label CssClass="normal" ID="tab_111a_w05_c01" runat="server" Text="0"></asp:Label>  </a></td>
        
               </tr>
               <tr>
                   <td class="borderTopLeft wciecie">uwzględnił skargę (art.42411 §2 kpc) </td>
                   <td class="borderTopLeft col_36">06</td>
                   <td class="borderTopLeftRight col_90" align="center"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.1.a!1!4')">  <asp:Label CssClass="normal" ID="tab_111a_w06_c01" runat="server" Text="0"></asp:Label>  </a></td>
        
               </tr>
               <tr>
                   <td class="borderTopLeftBottom  wciecie">załatwił w inny sposób </td>
                   <td class="borderTopLeftBottom col_36">07</td>
                     <td class="borderAll col_90" align="center"><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.1.a!1!4')">  <asp:Label CssClass="normal" ID="tab_111a_w07_c01" runat="server" Text="0"></asp:Label>  </a></td>
         </tr>
               </table>
          
       </div>
       <div class="page-break">



           <strong>Dział 1.1.1.b</strong> Ewidencja spraw z zakresu ubezpieczeń społecznych – wg rodzajów podmiotów<br />




           <table cellpadding="0" cellspacing="0" class="auto-style14">
               <tr>
                   <td class="borderTopLeft" rowspan="3" align="center">SPRAWY wg repertorium</td>
                   <td class="borderTopLeft" rowspan="3" align="center">l.p.</td>
                   <td class="borderTopLeft" rowspan="3" align="center">Pozostało z ubiegłego roku</td>
                   <td class="borderTopLeft" align="center" colspan="2">Wpłynęło</td>
                   <td class="borderTopLeft" align="center" colspan="9">ZAŁATWIONO</td>
                   <td class="borderTopLeft" align="center" rowspan="3">odrzucono</td>
                   <td class="borderTopLeftRight" align="center" rowspan="3">Pozostało na okres następny</td>
               </tr>
               <tr>
                   <td class="borderTopLeft" align="center" rowspan="2">razem</td>
                   <td class="borderTopLeft" align="center" rowspan="2">w tym odwołań od decyzji upraw-nionego organu </td>
                   <td class="borderTopLeft" align="center" rowspan="2">Razem</td>
                   <td class="borderTopLeft" align="center" colspan="3">od decyzji uprawnionego organu</td>
                   <td class="borderTopLeft" align="center" rowspan="2">w związku z niewydaniem decyzji zobowiązano uprawniony organ do wydania decyzji w określonym termini</td>
                   <td class="borderTopLeft" align="center" rowspan="2">uchylono</td>
                   <td class="borderTopLeft" align="center" colspan="2">umorzono</td>
                   <td class="borderTopLeft" align="center" rowspan="2">inne złatwienia</td>
               </tr>
               <tr>
                   <td class="borderTopLeft" align="center">oddalono</td>
                   <td class="borderTopLeft" align="center">mieniono zaskarżoną decyzję w całości lub w części</td>
                   <td class="borderTopLeft" align="center">odrzucono</td>
                   <td class="borderTopLeft" align="center">ogółem</td>
                   <td class="borderTopLeft" align="center">w tym w wyniku cofnięcia pozwu/<br />
                       wniosku/<br />
                       skargi</td>
               </tr>
               <tr>
                   <td class="borderTopLeft col_76" align="center" colspan="2">0</td>
                   <td class="borderTopLeft col_71" align="center">1</td>
                   <td class="borderTopLeft col_71" align="center">2</td>
                   <td class="borderTopLeft col_71" align="center">3</td>
                   <td class="borderTopLeft col_71" align="center">4</td>
                   <td class="borderTopLeft col_71" align="center">5</td>
                   <td class="borderTopLeft col_71" align="center">6</td>
                   <td class="borderTopLeft col_71" align="center">7</td>
                   <td class="borderTopLeft col_71" align="center">8</td>
                   <td class="borderTopLeft col_71" align="center">9</td>
                   <td class="borderTopLeft col_71" align="center">10</td>
                   <td class="borderTopLeft col_71" align="center">11</td>
                   <td class="borderTopLeft col_71" align="center">12</td>
                   <td class="borderTopLeft col_71" align="center">13</td>
                   <td class="borderTopLeftRight col_76" align="center">14</td>
               </tr>
               <tr>
                   <td class="wciecie borderTopLeft ">U razem (w. 02 do 09)</td>
                   <td class="borderTopLeft col_36">01</td>
                  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.b!1!4')">  <asp:Label CssClass="normal" ID="tab_111b_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.b!2!4')">  <asp:Label CssClass="normal" ID="tab_111b_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.b!3!4')">  <asp:Label CssClass="normal" ID="tab_111b_w01_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.b!4!4')">  <asp:Label CssClass="normal" ID="tab_111b_w01_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.b!5!4')">  <asp:Label CssClass="normal" ID="tab_111b_w01_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.b!6!4')">  <asp:Label CssClass="normal" ID="tab_111b_w01_c06" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.b!7!4')">  <asp:Label CssClass="normal" ID="tab_111b_w01_c07" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.b!8!4')">  <asp:Label CssClass="normal" ID="tab_111b_w01_c08" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.b!9!4')">  <asp:Label CssClass="normal" ID="tab_111b_w01_c09" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.b!10!4')">  <asp:Label CssClass="normal" ID="tab_111b_w01_c10" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.b!11!4')">  <asp:Label CssClass="normal" ID="tab_111b_w01_c11" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.b!12!4')">  <asp:Label CssClass="normal" ID="tab_111b_w01_c12" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.b!13!4')">  <asp:Label CssClass="normal" ID="tab_111b_w01_c13" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftRight col_71"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.b!14!4')">  <asp:Label CssClass="normal" ID="tab_111b_w01_c14" runat="server" Text="0"></asp:Label>  </a></td>
                  
                           </tr>
               <tr>
                   <td class="wciecie borderTopLeft ">Oddział Zakładu Ubezpieczeń Społecznych</td>
                   <td class="borderTopLeft col_36">02</td>
                   <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.1.b!1!4')">  <asp:Label CssClass="normal" ID="tab_111b_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.1.b!2!4')">  <asp:Label CssClass="normal" ID="tab_111b_w02_c02" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.1.b!3!4')">  <asp:Label CssClass="normal" ID="tab_111b_w02_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.1.b!4!4')">  <asp:Label CssClass="normal" ID="tab_111b_w02_c04" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.1.b!5!4')">  <asp:Label CssClass="normal" ID="tab_111b_w02_c05" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.1.b!6!4')">  <asp:Label CssClass="normal" ID="tab_111b_w02_c06" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.1.b!7!4')">  <asp:Label CssClass="normal" ID="tab_111b_w02_c07" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.1.b!8!4')">  <asp:Label CssClass="normal" ID="tab_111b_w02_c08" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.1.b!9!4')">  <asp:Label CssClass="normal" ID="tab_111b_w02_c09" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.1.b!10!4')">  <asp:Label CssClass="normal" ID="tab_111b_w02_c10" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.1.b!11!4')">  <asp:Label CssClass="normal" ID="tab_111b_w02_c11" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.1.b!12!4')">  <asp:Label CssClass="normal" ID="tab_111b_w02_c12" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.1.b!13!4')">  <asp:Label CssClass="normal" ID="tab_111b_w02_c13" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeftRight col_76"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.1.b!14!4')">  <asp:Label CssClass="normal" ID="tab_111b_w02_c14" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
               <tr>
                   <td class="wciecie borderTopLeft ">Wojskowy organ emerytalny</td>
                   <td class="borderTopLeft col_36">03</td>
                <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.1.b!1!4')">  <asp:Label CssClass="normal" ID="tab_111b_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.1.b!2!4')">  <asp:Label CssClass="normal" ID="tab_111b_w03_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.1.b!3!4')">  <asp:Label CssClass="normal" ID="tab_111b_w03_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.1.b!4!4')">  <asp:Label CssClass="normal" ID="tab_111b_w03_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.1.b!5!4')">  <asp:Label CssClass="normal" ID="tab_111b_w03_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.1.b!6!4')">  <asp:Label CssClass="normal" ID="tab_111b_w03_c06" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.1.b!7!4')">  <asp:Label CssClass="normal" ID="tab_111b_w03_c07" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.1.b!8!4')">  <asp:Label CssClass="normal" ID="tab_111b_w03_c08" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.1.b!9!4')">  <asp:Label CssClass="normal" ID="tab_111b_w03_c09" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.1.b!10!4')">  <asp:Label CssClass="normal" ID="tab_111b_w03_c10" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.1.b!11!4')">  <asp:Label CssClass="normal" ID="tab_111b_w03_c11" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.1.b!12!4')">  <asp:Label CssClass="normal" ID="tab_111b_w03_c12" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.1.b!13!4')">  <asp:Label CssClass="normal" ID="tab_111b_w03_c13" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftRight col_76"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.1.b!14!4')">  <asp:Label CssClass="normal" ID="tab_111b_w03_c14" runat="server" Text="0"></asp:Label>  </a></td>
      
               </tr>
               <tr>
                   <td class="wciecie borderTopLeft ">Zakład Emerytalno-Rentowy MSWiA</td>
                   <td class="borderTopLeft col_36">04</td>
      <td class="borderTopLeft  col_71"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.1.b!1!4')">  <asp:Label CssClass="normal" ID="tab_111b_w04_c01" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft  col_71"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.1.b!2!4')">  <asp:Label CssClass="normal" ID="tab_111b_w04_c02" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft  col_71"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.1.b!3!4')">  <asp:Label CssClass="normal" ID="tab_111b_w04_c03" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft  col_71"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.1.b!4!4')">  <asp:Label CssClass="normal" ID="tab_111b_w04_c04" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft  col_71"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.1.b!5!4')">  <asp:Label CssClass="normal" ID="tab_111b_w04_c05" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft  col_71"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.1.b!6!4')">  <asp:Label CssClass="normal" ID="tab_111b_w04_c06" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft  col_71"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.1.b!7!4')">  <asp:Label CssClass="normal" ID="tab_111b_w04_c07" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft  col_71"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.1.b!8!4')">  <asp:Label CssClass="normal" ID="tab_111b_w04_c08" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft  col_71"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.1.b!9!4')">  <asp:Label CssClass="normal" ID="tab_111b_w04_c09" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft  col_71"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.1.b!10!4')">  <asp:Label CssClass="normal" ID="tab_111b_w04_c10" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft  col_71"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.1.b!11!4')">  <asp:Label CssClass="normal" ID="tab_111b_w04_c11" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft  col_71"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.1.b!12!4')">  <asp:Label CssClass="normal" ID="tab_111b_w04_c12" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft  col_71"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.1.b!13!4')">  <asp:Label CssClass="normal" ID="tab_111b_w04_c13" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderAll col_76"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.1.b!14!4')">  <asp:Label CssClass="normal" ID="tab_111b_w04_c14" runat="server" Text="0"></asp:Label>  </a></td>         
               </tr>
               <tr>
                   <td class="wciecie borderTopLeft ">Organ emerytalny Służby Więziennej</td>
                   <td class="borderTopLeft col_36">05</td>
                 
   <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.1.b!1!4')">  <asp:Label CssClass="normal" ID="tab_111b_w05_c01" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.1.b!2!4')">  <asp:Label CssClass="normal" ID="tab_111b_w05_c02" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.1.b!3!4')">  <asp:Label CssClass="normal" ID="tab_111b_w05_c03" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.1.b!4!4')">  <asp:Label CssClass="normal" ID="tab_111b_w05_c04" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.1.b!5!4')">  <asp:Label CssClass="normal" ID="tab_111b_w05_c05" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.1.b!6!4')">  <asp:Label CssClass="normal" ID="tab_111b_w05_c06" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.1.b!7!4')">  <asp:Label CssClass="normal" ID="tab_111b_w05_c07" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.1.b!8!4')">  <asp:Label CssClass="normal" ID="tab_111b_w05_c08" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.1.b!9!4')">  <asp:Label CssClass="normal" ID="tab_111b_w05_c09" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.1.b!10!4')">  <asp:Label CssClass="normal" ID="tab_111b_w05_c10" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.1.b!11!4')">  <asp:Label CssClass="normal" ID="tab_111b_w05_c11" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.1.b!12!4')">  <asp:Label CssClass="normal" ID="tab_111b_w05_c12" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.1.b!13!4')">  <asp:Label CssClass="normal" ID="tab_111b_w05_c13" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeftRight col_76"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.1.b!14!4')">  <asp:Label CssClass="normal" ID="tab_111b_w05_c14" runat="server" Text="0"></asp:Label>  </a></td>
      
               </tr>
               <tr>
                   <td class="wciecie borderTopLeft ">Zakład Ubezpieczeń Społecznych (renty zagraniczne)</td>
                   <td class="borderTopLeft col_36">06</td>
               
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.1.b!1!4')">  <asp:Label CssClass="normal" ID="tab_111b_w06_c01" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.1.b!2!4')">  <asp:Label CssClass="normal" ID="tab_111b_w06_c02" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.1.b!3!4')">  <asp:Label CssClass="normal" ID="tab_111b_w06_c03" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.1.b!4!4')">  <asp:Label CssClass="normal" ID="tab_111b_w06_c04" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.1.b!5!4')">  <asp:Label CssClass="normal" ID="tab_111b_w06_c05" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.1.b!6!4')">  <asp:Label CssClass="normal" ID="tab_111b_w06_c06" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.1.b!7!4')">  <asp:Label CssClass="normal" ID="tab_111b_w06_c07" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.1.b!8!4')">  <asp:Label CssClass="normal" ID="tab_111b_w06_c08" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.1.b!9!4')">  <asp:Label CssClass="normal" ID="tab_111b_w06_c09" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.1.b!10!4')">  <asp:Label CssClass="normal" ID="tab_111b_w06_c10" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.1.b!11!4')">  <asp:Label CssClass="normal" ID="tab_111b_w06_c11" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.1.b!12!4')">  <asp:Label CssClass="normal" ID="tab_111b_w06_c12" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.1.b!13!4')">  <asp:Label CssClass="normal" ID="tab_111b_w06_c13" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeftRight col_76"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.1.b!14!4')">  <asp:Label CssClass="normal" ID="tab_111b_w06_c14" runat="server" Text="0"></asp:Label>  </a></td>
      
               </tr>
               <tr>
                   <td class="wciecie borderTopLeft ">Kasa Rolniczego Ubezpieczenia Społecznego </td>
                   <td class="borderTopLeft col_36">07</td>
                  
   <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.1.b!1!4')">  <asp:Label CssClass="normal" ID="tab_111b_w07_c01" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.1.b!2!4')">  <asp:Label CssClass="normal" ID="tab_111b_w07_c02" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.1.b!3!4')">  <asp:Label CssClass="normal" ID="tab_111b_w07_c03" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.1.b!4!4')">  <asp:Label CssClass="normal" ID="tab_111b_w07_c04" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.1.b!5!4')">  <asp:Label CssClass="normal" ID="tab_111b_w07_c05" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.1.b!6!4')">  <asp:Label CssClass="normal" ID="tab_111b_w07_c06" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.1.b!7!4')">  <asp:Label CssClass="normal" ID="tab_111b_w07_c07" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.1.b!8!4')">  <asp:Label CssClass="normal" ID="tab_111b_w07_c08" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.1.b!9!4')">  <asp:Label CssClass="normal" ID="tab_111b_w07_c09" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.1.b!10!4')">  <asp:Label CssClass="normal" ID="tab_111b_w07_c10" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.1.b!11!4')">  <asp:Label CssClass="normal" ID="tab_111b_w07_c11" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.1.b!12!4')">  <asp:Label CssClass="normal" ID="tab_111b_w07_c12" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.1.b!13!4')">  <asp:Label CssClass="normal" ID="tab_111b_w07_c13" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeftRight col_76"><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.1.b!14!4')">  <asp:Label CssClass="normal" ID="tab_111b_w07_c14" runat="server" Text="0"></asp:Label>  </a></td>
      
               </tr>
               <tr>
                   <td class="wciecie borderTopLeft ">Wojewódzki Zespół do spraw Orzekania o Niepełnosprawności </td>
                   <td class="borderTopLeft col_36">08</td>
                 <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.1.b!1!4')">  <asp:Label CssClass="normal" ID="tab_111b_w08_c01" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.1.b!2!4')">  <asp:Label CssClass="normal" ID="tab_111b_w08_c02" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.1.b!3!4')">  <asp:Label CssClass="normal" ID="tab_111b_w08_c03" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.1.b!4!4')">  <asp:Label CssClass="normal" ID="tab_111b_w08_c04" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.1.b!5!4')">  <asp:Label CssClass="normal" ID="tab_111b_w08_c05" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.1.b!6!4')">  <asp:Label CssClass="normal" ID="tab_111b_w08_c06" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.1.b!7!4')">  <asp:Label CssClass="normal" ID="tab_111b_w08_c07" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.1.b!8!4')">  <asp:Label CssClass="normal" ID="tab_111b_w08_c08" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.1.b!9!4')">  <asp:Label CssClass="normal" ID="tab_111b_w08_c09" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.1.b!10!4')">  <asp:Label CssClass="normal" ID="tab_111b_w08_c10" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.1.b!11!4')">  <asp:Label CssClass="normal" ID="tab_111b_w08_c11" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.1.b!12!4')">  <asp:Label CssClass="normal" ID="tab_111b_w08_c12" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.1.b!13!4')">  <asp:Label CssClass="normal" ID="tab_111b_w08_c13" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeftRight col_76"><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.1.b!14!4')">  <asp:Label CssClass="normal" ID="tab_111b_w08_c14" runat="server" Text="0"></asp:Label>  </a></td>
      
               </tr>
               <tr>
                   <td class="wciecie borderTopLeft col_45">Inne</td>
                   <td class="borderTopLeft col_36">09</td>
                   <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.1.b!1!4')">  <asp:Label CssClass="normal" ID="tab_111b_w09_c01" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.1.b!2!4')">  <asp:Label CssClass="normal" ID="tab_111b_w09_c02" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.1.b!3!4')">  <asp:Label CssClass="normal" ID="tab_111b_w09_c03" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.1.b!4!4')">  <asp:Label CssClass="normal" ID="tab_111b_w09_c04" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.1.b!5!4')">  <asp:Label CssClass="normal" ID="tab_111b_w09_c05" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.1.b!6!4')">  <asp:Label CssClass="normal" ID="tab_111b_w09_c06" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.1.b!7!4')">  <asp:Label CssClass="normal" ID="tab_111b_w09_c07" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.1.b!8!4')">  <asp:Label CssClass="normal" ID="tab_111b_w09_c08" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.1.b!9!4')">  <asp:Label CssClass="normal" ID="tab_111b_w09_c09" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.1.b!10!4')">  <asp:Label CssClass="normal" ID="tab_111b_w09_c10" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.1.b!11!4')">  <asp:Label CssClass="normal" ID="tab_111b_w09_c11" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.1.b!12!4')">  <asp:Label CssClass="normal" ID="tab_111b_w09_c12" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.1.b!13!4')">  <asp:Label CssClass="normal" ID="tab_111b_w09_c13" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeftRight col_76"><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.1.b!14!4')">  <asp:Label CssClass="normal" ID="tab_111b_w09_c14" runat="server" Text="0"></asp:Label>  </a></td>
      
               </tr>
               <tr>
                   <td class="wciecie borderTopLeftBottom ">Wojewódzki Zespół do spraw Orzekania o Niepełnosprawności </td>
                   <td class="borderTopLeftBottom col_36">10</td>
             <td class="borderTopLeftBottom col_71"><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.1.b!1!4')">  <asp:Label CssClass="normal" ID="tab_111b_w10_c01" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeftBottom col_71"><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.1.b!2!4')">  <asp:Label CssClass="normal" ID="tab_111b_w10_c02" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeftBottom col_71"><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.1.b!3!4')">  <asp:Label CssClass="normal" ID="tab_111b_w10_c03" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeftBottom col_71"><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.1.b!4!4')">  <asp:Label CssClass="normal" ID="tab_111b_w10_c04" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeftBottom col_71"><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.1.b!5!4')">  <asp:Label CssClass="normal" ID="tab_111b_w10_c05" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeftBottom col_71"><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.1.b!6!4')">  <asp:Label CssClass="normal" ID="tab_111b_w10_c06" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeftBottom col_71"><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.1.b!7!4')">  <asp:Label CssClass="normal" ID="tab_111b_w10_c07" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeftBottom col_71"><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.1.b!8!4')">  <asp:Label CssClass="normal" ID="tab_111b_w10_c08" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeftBottom col_71"><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.1.b!9!4')">  <asp:Label CssClass="normal" ID="tab_111b_w10_c09" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeftBottom col_71"><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.1.b!10!4')">  <asp:Label CssClass="normal" ID="tab_111b_w10_c10" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeftBottom col_71"><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.1.b!11!4')">  <asp:Label CssClass="normal" ID="tab_111b_w10_c11" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeftBottom col_71"><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.1.b!12!4')">  <asp:Label CssClass="normal" ID="tab_111b_w10_c12" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeftBottom col_71"><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.1.b!13!4')">  <asp:Label CssClass="normal" ID="tab_111b_w10_c13" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderAll col_76"><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.1.b!14!4')">  <asp:Label CssClass="normal" ID="tab_111b_w10_c14" runat="server" Text="0"></asp:Label>  </a></td>
      
               </tr>
               </table>
       </div>

       <div class="page-break">
           <br />
          <table style="width:100%;">
            <tr>
                <td><strong>Dział 1.1.2.a.</strong> Wpływ spraw (liczba), w których z roszczeniem wystąpiła większa grupa pracowników (dział 1.1.2. wiersz 2 rubryka 2 lit. a)</td>
                <td class="borderAll col_150"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2.a!1!4')">  <asp:Label CssClass="normal" ID="tab_112a_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td><strong>Dział 1.1.2.b.</strong> Załatwienie spraw (liczba), w których z roszczeniem wystąpiła większa grupa pracowników (dział 1.1.2. wiersz 2 rubryka 3 lit. b) </td>
                 <td class="borderAll col_150"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2.b!1!4')">  <asp:Label CssClass="normal" ID="tab_112b_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
           </tr>
        </table>


       </div>
        <div class="page-break">
           <br />

            Dział 1.1.2.c. (dział 1.1.2. wiersz 90 kolumna 4 lit. c)
            <br />
 <table cellpadding="0" cellspacing="0" style="width: 50%">
     <tr>
   <td class="borderTopLeft" colspan="3" align="center">Wyszczególnienie</td>
   <td class="borderTopLeftRight col_125" align="center">Liczby</td>
     </tr>
     <tr>
   <td class="borderTopLeft" colspan="3" align="center">0</td>
   <td class="borderTopLeftRight" align="center">1</td>
     </tr>
     <tr>
   <td class="borderTopLeftBottom" align="center" rowspan="3">Wydano nakaz zapłaty</td>
   <td class="wciecie borderTopLeft">w postępowaniu nakazowym</td>
   <td class="borderTopLeft col_36" align="center">01</td>
   <td class="borderTopLeftRight " align="center"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2.c!1!4')">  <asp:Label CssClass="normal" ID="tab_112c_w01_c01" runat="server" Text="0"></asp:Label>     </a></td>
     </tr>
     <tr>
   <td class="wciecie borderTopLeft">w postępowaniu upominawczym</td>
   <td class="borderTopLeft col_36" align="center">02</td>
   <td class="borderTopLeftRight " align="center"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.2.c!1!4')">  <asp:Label CssClass="normal" ID="tab_112c_w02_c01" runat="server" Text="0"></asp:Label>     </a></td>
     </tr>
     <tr>
   <td class="wciecie borderTopLeftBottom">w europejskim postępowaniu nakazowym </td>
   <td class="borderTopLeftBottom col_36" align="center">03</td>
   <td class="borderAll" align="center"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.2.c!1!4')">  <asp:Label CssClass="normal" ID="tab_112c_w03_c01" runat="server" Text="0"></asp:Label>     </a></td>
     </tr>
 </table>
 <br />

            </div>
       <div class="page-break">
           <br />

            Dział 1.1.2.d. (dział 1.1.2. wiersz 111 kolumna 3 lit. d) W tym: skarga o stwierdzenie niezgodności z prawem
            <br />
 <table cellpadding="0" cellspacing="0" style="width: 50%">
     <tr>
   <td class="borderTopLeft" colspan="3" align="center">Wyszczególnienie</td>
   <td class="borderTopLeftRight col_125" align="center">Liczby</td>
     </tr>
     <tr>
   <td class="borderTopLeft" colspan="3" align="center">0</td>
   <td class="borderTopLeftRight" align="center">1</td>
     </tr>
     <tr>
   <td class="borderTopLeftBottom" align="center" colspan="2">Przekazane Sądowi Najwyższemu ze skargą o stwierdzenie niezgodności z prawem</td>
   <td class="borderTopLeft col_36" align="center">01</td>
   <td class="borderTopLeftRight " align="center"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2.d!1!4')">  <asp:Label CssClass="normal" ID="tab_112d_w01_c01" runat="server" Text="0"></asp:Label>     </a></td>
     </tr>
     <tr>
   <td class="borderTopLeftBottom" align="center" colspan="2">Przesłanych z Sądu Najwyższego w okresie sprawozdawczym (w.02 =w. 03 do 07) </td>
   <td class="borderTopLeft col_36" align="center">02</td>
   <td class="borderTopLeftRight " align="center"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.2.d!1!4')">  <asp:Label CssClass="normal" ID="tab_112d_w02_c01" runat="server" Text="0"></asp:Label>     </a></td>
     </tr>
     <tr>
   <td class="borderTopLeftBottom" align="center" rowspan="5">w których
       <br />
       Sąd Najwyższy</td>
   <td class="wciecie borderTopLeft">odmówił przyjęcia skargi (art.4249 kpc)</td>
   <td class="borderTopLeft col_36" align="center">03</td>
   <td class="borderTopLeftRight " align="center"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.2.d!1!4')">  <asp:Label CssClass="normal" ID="tab_112d_w03_c01" runat="server" Text="0"></asp:Label>     </a></td>
     </tr>
     <tr>
   <td class="wciecie borderTopLeft">odrzucił skargę (art.4248 kpc)</td>
   <td class="borderTopLeft col_36" align="center">04</td>
   <td class="borderTopLeftRight " align="center"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.2.d!1!4')">  <asp:Label CssClass="normal" ID="tab_112d_w04_c01" runat="server" Text="0"></asp:Label>     </a></td>
     </tr>
     <tr>
   <td class="wciecie borderTopLeft">oddalił skargę (art.42411 §1 kpc)</td>
   <td class="borderTopLeft col_36" align="center">05</td>
   <td class="borderTopLeftRight " align="center"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.2.d!1!4')">  <asp:Label CssClass="normal" ID="tab_112d_w05_c01" runat="server" Text="0"></asp:Label>     </a></td>
     </tr>
     <tr>
   <td class="wciecie borderTopLeft">uwzględnił skargę (art.42411 §2 kpc)</td>
   <td class="borderTopLeft col_36" align="center">06</td>
   <td class="borderTopLeftRight " align="center"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.2.d!1!4')">  <asp:Label CssClass="normal" ID="tab_112d_w06_c01" runat="server" Text="0"></asp:Label>     </a></td>
     </tr>
     <tr>
   <td class="wciecie borderTopLeftBottom">załatwił w inny sposób</td>
   <td class="borderTopLeftBottom col_36" align="center">07</td>
   <td class="borderAll" align="center"><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.2.d!1!4')">  <asp:Label CssClass="normal" ID="tab_112d_w07_c01" runat="server" Text="0"></asp:Label>     </a></td>
     </tr>
 </table>
 <br />

            </div>

       <div id="tab211">

            <br />
            <br />
         <b>    Dział 1.1.2.e.</b> Sprawy mediacyjne
           <table style="width: 100%;" cellpadding="0" cellspacing="0">
               <tr>
                   <td class="borderTopLeft " colspan="3" align="center">Sądowe</td>
                   <td class="borderTopLeft col_90" align="center">Liczba </td>
                   <td class="borderTopLeft" align="center" colspan="2">Pozasądowe </td>
                   <td class="borderTopLeftRight col_90" align="center">Liczba</td>
               </tr>
               <tr>
                   <td class="borderTopLeft " colspan="3" align="center">0</td>
                   <td class="borderTopLeft col_90" align="center">1</td>
                   <td class="borderTopLeft" align="center" colspan="2">0</td>
                   <td class="borderTopLeftRight col_90" align="center">1</td>
               </tr>
               <tr>
                   <td class="borderTopLeft col_90" rowspan="5">Wpływ </td>
                   <td class="borderTopLeft col_350 wciecie">Liczba spraw, w których przeprowadzono spotkanie informacyjne (art. 183 8 § 4 kpc) </td>
                   <td class="borderTopLeft col_36">01</td>
                   <td class="borderTopLeft col_90" align="center"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2.e!1!4')">  <asp:Label CssClass="normal" ID="tab_112e_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_350 wciecie" rowspan="3">Liczba protokołów złożonych przez mediatorów art. 183 13 § 1 kpc </td>
                   <td class="borderTopLeft col_36" align="center" rowspan="3">07</td>
                   <td class="borderTopLeftRight col_90" align="center" rowspan="3"><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.2.e!1!4')">  <asp:Label CssClass="normal" ID="tab_112e_w07_c01" runat="server" Text="0"></asp:Label>  </a></td>
                   
               </tr>
               <tr>
                   <td class="borderTopLeft col_350 wciecie">Liczba spraw, w których strony skierowano do mediacji na podstawie postanowienia sądu art. 183 8 § 1 kpc </td>
                   <td class="borderTopLeft col_36">02</td>
                 <td class="borderTopLeft col_90" align="center"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.2.e!1!4')">  <asp:Label CssClass="normal" ID="tab_112e_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
        
               </tr>
               <tr>
                   <td class="borderTopLeft col_350 wciecie">Liczba mediacji ogółem </td>
                   <td class="borderTopLeft col_36">03</td>
                    <td class="borderTopLeft col_90" align="center"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.2.e!1!4')">  <asp:Label CssClass="normal" ID="tab_112e_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
        
               </tr>
               <tr>
                   <td class="borderTopLeft col_350 wciecie" rowspan="2">Liczba protokołów złożonych przez mediatorów po podjęciu mediacji przez strony art. 183 13 § 2 kpc </td>
                   <td class="borderTopLeft col_36" rowspan="2">04</td>
                    <td class="borderTopLeft col_90" align="center" rowspan="2"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.2.e!1!4')">  <asp:Label CssClass="normal" ID="tab_112e_w04_c01" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_350 wciecie">Liczba wniosków o zatwierdzenie ugody </td>
                   <td class="borderTopLeft col_36" align="center"><a class="auto-style3" href="javascript:openPopup('popup.aspx?sesja=4!1.1.2.e!3!4')">08</a></td>
                   <td class="borderTopLeftRight col_90" align="center"><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.2.e!11!4')">  <asp:Label CssClass="normal" ID="tab_112e_w08_c01" runat="server" Text="0"></asp:Label>  </a></td>
        
               </tr>
               <tr>
                   <td class="borderTopLeft col_350 wciecie">Zatwierdzono ugodę</td>
                   <td class="borderTopLeft col_36" align="center">09</td>
                   <td class="borderTopLeftRight col_90" align="center"><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.2.e!1!4')">  <asp:Label CssClass="normal" ID="tab_112e_w09_c01" runat="server" Text="0"></asp:Label>  </a></td>
        
               </tr>
               <tr>
                   <td class="borderTopLeftBottom col_90" rowspan="2">Rozstrzygnięcie</td>
                   <td class="borderTopLeft col_350 wciecie">Umorzono postępowanie w wyniku zatwierdzenia ugody zawartej przed mediatorem art. 183 14 § 1 i 2 kpc </td>
                   <td class="borderTopLeft col_36">05</td>
                      <td class="borderTopLeft col_90" align="center"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.2.e!1!4')">  <asp:Label CssClass="normal" ID="tab_112e_w05_c01" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_350 wciecie">w tym przez nadanie klauzuli wykonalności art. 183 14 § 2 kpc</td>
                   <td class="borderTopLeft col_36" align="center">10</td>
                   <td class="borderTopLeftRight col_90" align="center"><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.2.e!11!4')">  <asp:Label CssClass="normal" ID="tab_112e_w10_c01" runat="server" Text="0"></asp:Label>  </a></td>
        
               </tr>
               <tr>
                   <td class="borderTopLeftBottom col_350 wciecie">Odmówiono zatwierdzenia ugody w trybie art. 18314 § 3 kpc </td>
                   <td class="borderTopLeftBottom col_36">06</td>
                      <td class="borderTopLeftBottom col_90" align="center"><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.2.e!1!4')">  <asp:Label CssClass="normal" ID="tab_112e_w06_c01" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_350 wciecie">Odmówiono zatwierdzenia ugody w trybie art. 18314 § 3 kpc </td>
                   <td class="borderTopLeftBottom col_36" align="center">11</td>
                   <td class="borderAll col_90" align="center"><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.2.e!1!4')">  <asp:Label CssClass="normal" ID="tab_112e_w11_c01" runat="server" Text="0"></asp:Label>  </a></td>
        
               </tr>
               </table>

       </div>
       <div class="page-break">
       
           <br />
           <br />
            <br />

           <table width="100%">
               <tr>
                   <td >
                        <b>  Dział 1.1.2.f. </b>   Liczba wyznaczonych ławników (osoby) 
                   </td>
                   <td class="borderAll col_125">
                       <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2.f!1!4')">  <asp:Label CssClass="normal" ID="tab_112f_w01_c01" runat="server" Text="0"></asp:Label>  </a>
                   </td>
               </tr>
           </table>


       </div>
       <div class="page-break">
           <br />

            <strong>Dział 1.1.2.g</strong>. w tym w wyniku sprzeciwu od nakazu wydanego w elektronicznym postępowaniu upominawczym<br />
 <table cellpadding="0" cellspacing="0" style="width: 50%">
     <tr>
   <td class="borderTopLeft" colspan="3" align="center">Wyszczególnienie</td>
   <td class="borderTopLeftRight col_125" align="center">Liczba spraw</td>
     </tr>
     <tr>
   <td class="borderTopLeft" colspan="3" align="center">0</td>
   <td class="borderTopLeftRight" align="center">1</td>
     </tr>
     <tr>
   <td class="borderTopLeftBottom wciecie" colspan="2">Wpłynęło</td>
   <td class="borderTopLeft col_36" align="center">01</td>
   <td class="borderTopLeftRight " align="center"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.2.g!1!4')">  <asp:Label CssClass="normal" ID="tab_112g_w01_c01" runat="server" Text="0"></asp:Label>     </a></td>
     </tr>
     <tr>
   <td class="borderTopLeftBottom wciecie" colspan="2">Załatwiono</td>
   <td class="borderTopLeft col_36" align="center">02</td>
   <td class="borderTopLeftRight " align="center"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.2.g!1!4')">  <asp:Label CssClass="normal" ID="tab_112g_w02_c01" runat="server" Text="0"></asp:Label>     </a></td>
     </tr>
     <tr>
   <td class="borderTopLeftBottom" align="center" rowspan="2">w tym</td>
   <td class="wciecie borderTopLeft">uwzględniono w całości lub w części</td>
   <td class="borderTopLeft col_36" align="center">03</td>
   <td class="borderTopLeftRight " align="center"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.2.g!1!4')">  <asp:Label CssClass="normal" ID="tab_112g_w03_c01" runat="server" Text="0"></asp:Label>     </a></td>
     </tr>
     <tr>
   <td class="wciecie borderTopLeft">oddalono</td>
   <td class="borderTopLeft col_36" align="center">04</td>
   <td class="borderTopLeftRight " align="center"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.2.g!1!4')">  <asp:Label CssClass="normal" ID="tab_112g_w04_c01" runat="server" Text="0"></asp:Label>     </a></td>
     </tr>
     <tr>
   <td class="borderTopLeftBottom" colspan="2">Pozostało</td>
   <td class="borderTopLeftBottom col_36" align="center">05</td>
   <td class="borderAll" align="center"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.2.g!1!4')">  <asp:Label CssClass="normal" ID="tab_112g_w05_c01" runat="server" Text="0"></asp:Label>     </a></td>
     </tr>
 </table>
 <br />

            </div>

       <div class="page-break">
           Sprawy z zakresu prawa pracy i ubezpieczeń społecznych – część wspólna<br />
           <br />
           <strong>Dział 1.2.</strong> Ewidencja i przyczyny ponownych wpisów oraz rodzaje załatwień spraw z zakresu prawa pracy i ubezpieczeń społecznych
           <br />
           <br />
            <table cellpadding="0" cellspacing="0" class="borderAll">
                <tr>
                    <td align="center" class="borderTopLeft" colspan="4" rowspan="3">Wyszczególnienie</td>
                    <td align="center" class="borderTopLeftRight" colspan="7">Repetytorium</td>
                </tr>
                <tr>
                    <td align="center" class="borderTopLeft" rowspan="2">ogółem z zakresu ubezpie-czeń</td>
                    <td align="center" class="borderTopLeft" colspan="2">w tym </td>
                    <td align="center" class="borderTopLeft" rowspan="2">ogółem z zakresu prawa pracy</td>
                    <td align="center" class="borderTopLeftRight" colspan="3">w tym</td>
                </tr>
                <tr>
                    <td align="center" class="borderTopLeft">U</td>
                    <td align="center" class="borderTopLeft">Ua</td>
                    <td align="center" class="borderTopLeft">P</td>
                    <td align="center" class="borderTopLeft">Np </td>
                    <td align="center" class="borderTopLeftRight">Po</td>
                </tr>
                <tr>
                    <td align="center" class="borderTopLeft" colspan="4">0</td>
                    <td align="center" class="borderTopLeft col_60">1</td>
                    <td align="center" class="borderTopLeft col_60">2</td>
                    <td align="center" class="borderTopLeft col_60">3</td>
                    <td align="center" class="borderTopLeft col_60">4</td>
                    <td align="center" class="borderTopLeft col_60">5</td>
                    <td align="center" class="borderTopLeft col_60">6</td>
                    <td align="center" class="borderTopLeftRight col_60">7</td>
                </tr>
                <tr>
                    <td class="borderTopLeft" colspan="3">Pozostało z ubiegłego roku<br />
&nbsp;<span class="auto-style4">(w.01=dz.1.1.1 r.1 odpowiednie wiersze i dz.1.1.2 r.1 odpowiednie wiersze)</span></td>
                    <td class="borderTopLeft col_36">01</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=1!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=1!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=1!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w01_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=1!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w01_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=1!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w01_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=1!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w01_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=1!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w01_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft" colspan="3">Wpłynęło ogółem<br />
                        <span class="borderTopLeft">&nbsp;(w. 02 = dz.1.1.1 r.2 odpowiednie wiersze i dz.1.1.2 r.2 odpowiednie wiersze = w.03+26)</span></td>
                    <td class="borderTopLeft col_36">02</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=2!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=2!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w02_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=2!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w02_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=2!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w02_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=2!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w02_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=2!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w02_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=2!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w02_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft " rowspan="23" align="center">
                        <div class="rotate">
                            W tym 
                            <br />
                            ponownie wpisane</div>
                    </td>
                    <td class="wciecie borderTopLeft " colspan="2" align="left">razem (w. 03 = w.04 do 25)</td>
                    <td class="borderTopLeft col_36">03</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=3!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=3!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w03_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=3!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w03_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=3!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w03_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=3!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w03_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=3!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w03_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=3!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w03_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft " colspan="2" align="left">zwrot pozwu/odwołania </td>
                    <td class="borderTopLeft col_36">04</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=4!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w04_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=4!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w04_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=4!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w04_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=4!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w04_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=4!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w04_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=4!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w04_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=4!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w04_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft " colspan="2" align="left">przekazanie z innych jednostek na podstawie art. 200§1 kpc (z wyjątkiem zmian organizacyjnych)</td>
                    <td class="borderTopLeft col_36">05</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=5!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w05_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=5!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w05_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=5!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w05_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=5!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w05_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=5!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w05_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=5!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w05_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=5!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w05_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft " colspan="2" align="left">wyłączenie roszczenia do odrębnego rozpoznania (z wyłączeniem wiersza 06)wyłączenie sprawy do odrębnego rozpoznania – poprzednio połączonej na podstawie art. 219 </td>
                    <td class="borderTopLeft col_36">06</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=6!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w06_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=6!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w06_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=6!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w06_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=6!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w06_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=6!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w06_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=6!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w06_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=6!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w06_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft " colspan="2" align="left">wyłączenie roszczenia do odrębnego rozpoznania (z wyłączeniem wiersza 06)</td>
                    <td class="borderTopLeft col_36">07</td>
                     <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=7!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w07_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=7!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w07_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=7!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w07_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=7!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w07_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=7!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w07_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=7!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w07_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=7!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w07_c07" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
                <tr>
                    <td class="wciecie borderTopLeft " colspan="2">sprawy zawieszone zakreślone, które podjęto</td>
                    <td class="borderTopLeft col_36">08</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=8!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w08_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=8!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w08_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=8!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w08_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=8!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w08_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=8!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w08_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=8!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w08_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=8!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w08_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft " colspan="2">wpisane na podstawie art. 486 kpc i art. 498§2 kpc</td>
                    <td class="borderTopLeft col_36">09</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=9!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w09_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=9!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w09_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=9!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w09_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=9!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w09_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=9!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w09_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=9!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w09_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=9!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w09_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft " colspan="2">wpisane na podstawie art. 495§1 kpc</td>
                    <td class="borderTopLeft col_36">10</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=10!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w10_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=10!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w10_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=10!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w10_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=10!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w10_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=10!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w10_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=10!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w10_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=10!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w10_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft " colspan="2">wpisane na podstawie art. 505§1 kpc</td>
                    <td class="borderTopLeft col_36">11</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=11!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w11_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=11!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w11_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=11!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w11_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=11!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w11_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=11!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w11_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=11!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w11_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=11!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w11_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft " colspan="2">wpisane na podstawie art. 5057 kpc</td>
                    <td class="borderTopLeft col_36">12</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=12!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w12_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=12!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w12_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=12!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w12_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=12!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w12_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=12!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w12_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=12!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w12_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=12!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w12_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft " colspan="2">przekazano sprawy w ramach sądu pomiędzy wydziałami tego samego pionu</td>
                    <td class="borderTopLeft col_36">13</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=13!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w13_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=13!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w13_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=13!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w13_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=13!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w13_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=13!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w13_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=13!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w13_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=13!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w13_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft " colspan="2">przekazano sprawy w ramach sądu pomiędzy wydziałami różnych pionów</td>
                    <td class="borderTopLeft col_36">14</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=14!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w14_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=14!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w14_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=14!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w14_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=14!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w14_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=14!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w14_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=14!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w14_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=14!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w14_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft " colspan="2">przekazane przez SR Lublin-Zachód (e-sąd) na podstawie art. 50533 §1, 50534 §1, 50536 §1 kpc</td>
                    <td class="borderTopLeft col_36">15</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=15!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w15_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=15!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w15_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=15!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w15_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=15!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w15_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=15!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w15_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=15!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w15_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=15!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w15_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft " colspan="2">po uchyleniu orzeczenia i przekazaniu sprawy do ponownego rozpoznania </td>
                    <td class="borderTopLeft col_36">16</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=16!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w16_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=16!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w16_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=16!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w16_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=16!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w16_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=16!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w16_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=16!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w16_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=16!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w16_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft " colspan="2">wpisane w wyniku przywrócenia terminu do wniesienia środka zaskarżenia</td>
                    <td class="borderTopLeft col_36">17</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=17!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w17_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=17!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w17_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=17!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w17_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=17!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w17_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=17!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w17_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=17!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w17_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=17!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w17_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft " colspan="2">w wyniku zmian zarządzenia MS o biurowości</td>
                    <td class="borderTopLeft col_36">18</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=18!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w18_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=18!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w18_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=18!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w18_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=18!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w18_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=18!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w18_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=18!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w18_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=18!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w18_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft  wciecie" rowspan="2">zmiany organizacyjne związane z utworzeniem lub likwidacją</td>
                    <td align="left" class="wciecie  borderTopLeft ">wydziału (ów) </td>
                    <td class="borderTopLeft col_36">19</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=19!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w19_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=19!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w19_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=19!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w19_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=19!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w19_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=19!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w19_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=19!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w19_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=19!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w19_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td align="left" class="wciecie  borderTopLeft ">sądu (ów)</td>
                    <td class="borderTopLeft col_36">20</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=20!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w20_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=20!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w20_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=20!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w20_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=20!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w20_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=20!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w20_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=20!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w20_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=20!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w20_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft  wciecie" rowspan="2">w związku ze zmianą obszaru właściwości miejscowej</td>
                    <td align="left" class="wciecie  borderTopLeft ">wydziału (ów) </td>
                    <td class="borderTopLeft col_36">21</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=21!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w21_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=21!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w21_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=21!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w21_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=21!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w21_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=21!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w21_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=21!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w21_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=21!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w21_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td align="left" class="wciecie  borderTopLeft ">sądu (ów)</td>
                    <td class="borderTopLeft col_36">22</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=22!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w22_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=22!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w22_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=22!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w22_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=22!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w22_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=22!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w22_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=22!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w22_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=22!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w22_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft  wciecie" colspan="2">wpisane w wyniku zmiany trybu lub rodzaju postępowania (art. 201 § 1 i 2 kpc)</td>
                    <td class="borderTopLeft col_36">23</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=23!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w23_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=23!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w23_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=23!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w23_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=23!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w23_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=23!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w23_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=23!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w23_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=23!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w23_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft  wciecie" colspan="2">dokonano omyłkowego wpisu </td>
                    <td class="borderTopLeft col_36">24</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=24!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w24_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=24!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w24_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=24!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w24_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=24!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w24_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=24!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w24_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=24!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w24_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=24!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w24_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft  wciecie" colspan="2">Inne</td>
                    <td class="borderTopLeft col_36">25</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=25!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w25_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=25!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w25_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=25!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w25_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=25!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w25_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=25!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w25_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=25!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w25_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=25!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w25_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                  <tr>
                    <td class="borderTopLeft wciecie" colspan="3">Wpływ pozostałych spraw </td>
                    <td class="borderTopLeft col_36">26</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=26!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w26_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=26!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w26_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=26!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w26_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=26!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w26_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=26!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w26_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=26!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w26_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=26!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w26_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                   <tr>
                    <td class="borderTopLeft wciecie" colspan="3">Załatwiono ogółem (w.27= dz.1.1.1 r.4 odpowiednie wiersze i dz.1.1.2 r.3 odpowiednie wiersze =w.28+54) </td>
                    <td class="borderTopLeftBottom col_36">27</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=27!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w27_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=27!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w27_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=27!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w27_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=27!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w27_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=27!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w27_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=27!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w27_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=27!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w27_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td class=" borderTopLeft " rowspan="26" align="center">
                        <div class="rotate">
                            W tym 
                            <br />
                            ponownie wpisane</div>
                    </td>
                    <td class="wciecie borderTopLeft " colspan="2" align="left">razem (w. 28= w.29 do 53</td>
                    <td class="borderTopLeft col_36">28</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=28!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w28_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=28!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w28_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=28!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w28_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=28!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w28_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=28!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w28_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=28!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w28_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=28!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w28_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft " colspan="2" align="left">zwrot pozwu/odwołania </td>
                    <td class="borderTopLeft col_36">29</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=29!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w29_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=29!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w29_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=29!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w29_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=29!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w29_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=29!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w29_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=29!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w29_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=29!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w29_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   </tr>
                <tr>
                    <td class="wciecie borderTopLeft " colspan="2" align="left">przekazanie z innych jednostek na podstawie art. 200§1 kpc (z wyjątkiem zmian organizacyjnych)</td>
                    <td class="borderTopLeft col_36">30</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=30!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w30_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=30!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w30_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=30!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w30_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=30!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w30_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=30!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w30_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=30!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w30_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=30!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w30_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft " colspan="2" align="left">zakończono w trybie art. 339 kpc </td>
                    <td class="borderTopLeft col_36">31</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=31!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w31_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=31!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w31_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=31!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w31_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=31!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w31_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=31!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w31_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=31!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w31_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=31!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w31_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft " colspan="2" align="left">zakończono w trybie art. 341 kpc </td>
                    <td class="borderTopLeft col_36">32</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=32!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w32_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=32!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w32_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=32!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w32_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=32!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w32_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=32!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w32_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=32!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w32_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=32!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w32_c07" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
                <tr>
                    <td class="wciecie borderTopLeft " colspan="2">zakreślono na podstawie art. 486 kpc </td>
                    <td class="borderTopLeft col_36">33</td>
                     <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=33!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w33_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=33!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w33_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=33!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w33_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=33!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w33_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=33!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w33_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=33!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w33_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=33!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w33_c07" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
                <tr>
                    <td class="wciecie borderTopLeft " colspan="2">zakreślono na podstawie art. 498 §2 kpc </td>
                    <td class="borderTopLeft col_36">34</td>
                       <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=34!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w34_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=34!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w34_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=34!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w34_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=34!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w34_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=34!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w34_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=34!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w34_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=34!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w34_c07" runat="server" Text="0"></asp:Label>  </a></td>
                 </tr>
                <tr>
                    <td class="wciecie borderTopLeft " colspan="2">zakreślono na podstawie art. 50533 §1 kpc </td>
                    <td class="borderTopLeft col_36">35</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=35!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w35_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=35!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w35_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=35!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w35_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=35!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w35_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=35!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w35_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=35!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w35_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=35!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w35_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft " colspan="2">zakreślono na podstawie art. 5057 kpc </td>
                    <td class="borderTopLeft col_36">36</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=36!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w36_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=36!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w36_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=36!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w36_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=36!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w36_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=36!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w36_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=36!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w36_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=36!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w36_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft " colspan="2">w wyniku zmian zarządzenia MS o biurowości </td>
                    <td class="borderTopLeft col_36">37</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=37!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w37_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=37!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w37_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=37!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w37_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=37!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w37_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=37!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w37_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=37!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w37_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=37!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w37_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft " colspan="2">w wyniku przekazania sprawy w ramach sądu pomiędzy wydziałami tego samego pionu </td>
                    <td class="borderTopLeft col_36">38</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=38!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w38_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=38!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w38_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=38!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w38_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=38!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w38_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=38!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w38_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=38!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w38_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=38!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w38_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td class="wciecie borderTopLeft " colspan="2">w wyniku przekazania sprawy w ramach sądu pomiędzy wydziałami różnych pionów </td>
                    <td class="borderTopLeft col_36">39</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=39!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w39_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=39!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w39_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=39!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w39_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=39!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w39_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=39!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w39_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=39!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w39_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=39!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w39_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft  wciecie" rowspan="2">zmiany organizacyjne związane z utworzeniem lub likwidacją</td>
                    <td align="left" class="wciecie  borderTopLeft ">wydziału (ów) </td>
                    <td class="borderTopLeft col_36">40</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=40!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w40_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=40!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w40_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=40!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w40_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=40!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w40_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=40!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w40_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=40!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w40_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=40!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w40_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td align="left" class="wciecie  borderTopLeft ">sądu (ów)</td>
                    <td class="borderTopLeft col_36">41</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=41!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w41_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=41!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w41_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=41!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w41_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=41!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w41_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=41!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w41_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=41!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w41_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=41!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w41_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft  wciecie" rowspan="2">w związku ze zmianą obszaru właściwości miejscowej</td>
                    <td align="left" class="wciecie  borderTopLeft ">wydziału (ów) </td>
                    <td class="borderTopLeft col_36">42</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=42!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w42_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=42!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w42_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=42!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w42_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=42!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w42_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=42!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w42_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=42!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w42_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=42!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w42_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td align="left" class="wciecie  borderTopLeft ">sądu (ów)</td>
                    <td class="borderTopLeft col_36">43</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=43!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w43_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=43!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w43_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=43!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w43_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=43!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w43_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=43!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w43_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=43!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w43_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=43!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w43_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft  wciecie" colspan="2">połączono do wspólnego rozpoznania na podstawie art. 219 kpc</td>
                    <td class="borderTopLeft col_36">44</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=44!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w44_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=44!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w44_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=44!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w44_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=44!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w44_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=44!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w44_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=44!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w44_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=44!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w44_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft  wciecie" colspan="2">zakreślone w wyniku zmiany trybu lub rodzaju postępowania (art. 201 § 1 i 2 kpc) </td>
                    <td class="borderTopLeft col_36">45</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=45!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w45_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=45!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w45_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=45!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w45_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=45!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w45_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=45!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w45_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=45!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w45_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=45!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w45_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                 <tr>
                    <td class="borderTopLeft  wciecie" colspan="2">zakreślono na podstawie art. 174 §1 pkt 1 kpc </td>
                    <td class="borderTopLeft col_36">46</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=46!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w46_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=46!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w46_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=46!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w46_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=46!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w46_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=46!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w46_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=46!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w46_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=46!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w46_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                 <tr>
                    <td class="borderTopLeft  wciecie" colspan="2">zakreślono na podstawie art. 174 §1 pkt 4 kpc </td>
                    <td class="borderTopLeft col_36">47</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=47!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w47_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=47!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w47_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=47!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w47_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=47!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w47_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=47!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w47_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=47!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w47_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=47!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w47_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                 <tr>
                    <td class="borderTopLeft  wciecie" colspan="2">zakreślenie omyłkowych wpisów </td>
                    <td class="borderTopLeft col_36">48</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=48!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w48_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=48!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w48_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=48!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w48_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=48!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w48_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=48!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w48_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=48!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w48_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=48!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w48_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                 <tr>
                    <td class="borderTopLeft  wciecie" colspan="2">odrzucono pozew / wniosek / skargę </td>
                    <td class="borderTopLeft col_36">49</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=49!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w49_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=49!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w49_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=49!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w49_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=49!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w49_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=49!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w49_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=49!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w49_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=49!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w49_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                 <tr>
                    <td class="borderTopLeft  wciecie" colspan="2">umorzenie na skutek cofnięcia pozwu, wniosku, skargi </td>
                    <td class="borderTopLeft col_36">50</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=50!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w50_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=50!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w50_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=50!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w50_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=50!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w50_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=50!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w50_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=50!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w50_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=50!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w50_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                 <tr>
                    <td class="borderTopLeft  wciecie" colspan="2">umorzenie na podstawie art. 50537 §1, kpc </td>
                    <td class="borderTopLeft col_36">51</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=51!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w51_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=51!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w51_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=51!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w51_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=51!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w51_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=51!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w51_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=51!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w51_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=51!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w51_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                 <tr>
                    <td class="borderTopLeft  wciecie" colspan="2">zakończono w trybie art.1481 §1 kpc </td>
                    <td class="borderTopLeft col_36">52</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=52!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w52_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=52!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w52_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=52!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w52_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=52!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w52_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=52!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w52_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=52!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w52_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=52!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w52_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>

                <tr>
                    <td class="borderTopLeft  wciecie" colspan="2">inne</td>
                    <td class="borderTopLeft col_36">53</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=53!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w53_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=53!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w53_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=53!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w53_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=53!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w53_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=53!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w53_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=53!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w53_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=53!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w53_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                  <tr>
                    <td class="borderTopLeft wciecie" colspan="3">Załatwienie pozostałych sprawinne </td>
                    <td class="borderTopLeft col_36">54</td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=54!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w54_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=54!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w54_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=54!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w54_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=54!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w54_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=54!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w54_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeft col_60"><a href="javascript:openPopup('popup.aspx?sesja=54!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w54_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftRight col_60"><a href="javascript:openPopup('popup.aspx?sesja=54!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w54_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                   <tr>
                    <td class="borderTopLeftBottom wciecie" colspan="3">Pozostało na okres następny (w.55= dz.1.1.1 r.15 odpowiednie wiersze i dz.1.1.2 r.15 odpowiednie wiersze)</td>
                    <td class="borderTopLeftBottom col_36">55</td>
                    <td class="borderTopLeftBottom col_60"><a href="javascript:openPopup('popup.aspx?sesja=55!1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_12_w55_c01" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftBottom col_60"><a href="javascript:openPopup('popup.aspx?sesja=55!1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_12_w55_c02" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftBottom col_60"><a href="javascript:openPopup('popup.aspx?sesja=55!1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_12_w55_c03" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftBottom col_60"><a href="javascript:openPopup('popup.aspx?sesja=55!1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_12_w55_c04" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftBottom col_60"><a href="javascript:openPopup('popup.aspx?sesja=55!1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_12_w55_c05" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderTopLeftBottom col_60"><a href="javascript:openPopup('popup.aspx?sesja=55!1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_12_w55_c06" runat="server" Text="0"></asp:Label>  </a></td>
                    <td class="borderAll col_60"><a href="javascript:openPopup('popup.aspx?sesja=55!1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_12_w55_c07" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
              
                </table>
            <br />
            <br />


       </div>
       
       <div class="page-break">



           <strong>Dział 1.2.a </strong>Ustanowienie pełnomocnika z urzędu  <br />


           <table cellpadding="0" cellspacing="0" class="auto-style14">
             
               <tr>
                   <td class="borderTopLeft " align="center" colspan="2">Repertorium lub wykaz</td>
                   <td class="borderTopLeft col_325" align="center">Liczba spraw w których doszło do ustanowienia pełnomocnika z urzędu (radca prawny, adwokat)</td>
                   <td class="borderTopLeft col_325" align="center">Liczba ustanowionych pełnomocników z urzędu (radca prawny, adwokat)</td>
             
                   <td class="borderTopLeftRight " align="center">W tym liczba wyznaczonych pełnomocników w wyniku zwolnienia poprzedniego pełnomocnika (od I 2012)</td>
               </tr>
             
               <tr>
                   <td class="borderTopLeft " align="center" colspan="2">0</td>
                   <td class="borderTopLeft col_325" align="center">1</td>
                   <td class="borderTopLeft col_325" align="center">2</td>
             
                   <td class="borderTopLeftRight " align="center">3</td>
               </tr>
               <tr>
                   <td class="wciecie borderTopLeft ">U razem (w. 02 do 09)</td>
                   <td class="borderTopLeft col_36">01</td>
                  <td class="borderTopLeft col_325"><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.a!1!4')">  <asp:Label CssClass="normal" ID="tab_12a_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_325"><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.a!2!4')">  <asp:Label CssClass="normal" ID="tab_12a_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftRight col_325"><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.a!3!4')">  <asp:Label CssClass="normal" ID="tab_12a_w01_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  
                           </tr>
               <tr>
                   <td class="wciecie borderTopLeftBottom ">Oddział Zakładu Ubezpieczeń Społecznych</td>
                   <td class="borderTopLeftBottom col_36">02</td>
                   <td class="borderTopLeftBottom col_325"><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.a!1!4')">  <asp:Label CssClass="normal" ID="tab_12a_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeftBottom col_325"><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.a!2!4')">  <asp:Label CssClass="normal" ID="tab_12a_w02_c02" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderAll col_325"><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.a!3!4')">  <asp:Label CssClass="normal" ID="tab_12a_w02_c03" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
                     </table>
       </div>

          <br />
<div class="page-break">



           <strong>Dział 1.2.1 </strong> Liczba sesji i wyznaczonych spraw 
           <br />
           <br />
           <br />
           
            <table align="center" cellpadding="0" cellspacing="0">
               <tr>
                   <td class="borderTopLeft "  rowspan="3" align="center">SPRAWY według repertoriów i wykazów</td>
                   <td class="borderTopLeft col_29"  rowspan="3">L.p.</td>
                   <td class="borderTopLeft "  rowspan="3">Liczba sesji (rozprawy i posiedzenia) - wokandy</td>
                   <td class="borderTopLeft "  rowspan="3">Suma wyznaczonych spraw</td>
                   <td class="borderTopLeft "  rowspan="3">Łączna liczba dni na które wyznaczono sesje -wokandy</td>
                   <td class="borderTopLeft "  colspan="11" align="center">Liczba wyznaczonych spraw na rozprawę, dotyczy:</td>
                   <td class="borderTopLeft col_36"  colspan="12"></td>
               </tr>
               <tr>
                   <td class="borderTopLeft "  rowspan="2">Razem wyznaczonych spraw na rozprawę</td>
                   <td class="borderTopLeft "  rowspan="2">sędziów / SR z wyłączeniem sędziów funkcyjnych </td>
                   <td class="borderTopLeft "  rowspan="2">sędziów funkcyjnych SR (suma kol. od 7 do 13)</td>
                   <td class="borderTopLeft "  colspan="7" align="center">z tego</td>
                   <td class="borderTopLeft col_36"  rowspan="2">inni</td>
                   <td class="borderTopLeft col_36"  rowspan="2">Razem wyznaczonych spraw na posiedzenie </td>
                   <td class="borderTopLeft col_36"  rowspan="2">sędziów SR z wyłączeniem sędziów funkcyjnych</td>
                   <td class="borderTopLeft col_36"  rowspan="2">sędziów / funkcyjnych SR (suma kol. od 18 do 24)</td>
                   <td class="borderTopLeft "  colspan="7" align="center">z tego</td>
                   <td class="borderTopLeft col_36"  rowspan="2">inni</td>
                   <td class="borderTopLeftRight col_36"  rowspan="2">referendarzy </td>
               </tr>
               <tr>
                   <td class="borderTopLeft col_36" >prezesa</td>
                   <td class="borderTopLeft col_36" >wice-prezesa</td>
                   <td class="borderTopLeft col_36" >przewodni-czącego wydziału</td>
                   <td class="borderTopLeft col_36" >zastępce przewodni-czącego wydziału</td>
                   <td class="borderTopLeft col_36" >kierownika sekcji</td>
                   <td class="borderTopLeft col_36" >innych funkcyjnych tego sądu z tego pionu</td>
                   <td class="borderTopLeft col_36" >innych funkcyjnych tego sądu z innych pionów</td>
                   <td class="borderTopLeft col_36" >prezesa</td>
                   <td class="borderTopLeft col_36" >wice-prezesa</td>
                   <td class="borderTopLeft col_36" >przewodni-czącego wydziału</td>
                   <td class="borderTopLeft col_36" >zastępce przewodni-czącego wydziału</td>
                   <td class="borderTopLeft col_36" >kierownika sekcji</td>
                   <td class="borderTopLeft col_36" >innych funkcyjnych tego sądu z tego pionu</td>
                   <td class="borderTopLeft col_36" >innych funkcyjnych tego sądu z innych pionów</td>
               </tr>
               <tr>
                   <td class="borderTopLeft "  colspan="2" align="center">0</td>
                   <td class="borderTopLeft col_36" >1</td>
                   <td class="borderTopLeft col_36" >2</td>
                   <td class="borderTopLeft col_36" >3</td>
                   <td class="borderTopLeft col_36" >4</td>
                   <td class="borderTopLeft col_36" >5</td>
                   <td class="borderTopLeft col_36" >6</td>
                   <td class="borderTopLeft col_36" >7</td>
                   <td class="borderTopLeft col_36" >8</td>
                   <td class="borderTopLeft col_36" >9</td>
                   <td class="borderTopLeft col_36" >10</td>
                   <td class="borderTopLeft col_36" >11</td>
                   <td class="borderTopLeft col_36" >12</td>
                   <td class="borderTopLeft col_36" >13</td>
                   <td class="borderTopLeft col_36" >14</td>
                   <td class="borderTopLeft col_36" >15</td>
                   <td class="borderTopLeft col_36" >16</td>
                   <td class="borderTopLeft col_36" >17</td>
                   <td class="borderTopLeft col_36" >18</td>
                   <td class="borderTopLeft col_36" >19</td>
                   <td class="borderTopLeft col_36" >20</td>
                   <td class="borderTopLeft col_36" >21</td>
                   <td class="borderTopLeft col_36" >22</td>
                   <td class="borderTopLeft col_36" >23</td>
                   <td class="borderTopLeft col_36" >24</td>
                   <td class="borderTopLeft col_36" >25</td>
                   <td class="borderTopLeftRight col_36" >26</td>
               </tr>
               <tr>
                   <td class="wciecie borderTopLeft" >Ogółem sprawy z zakresu ubezpieczeń społecznych (wiersze od 02 do 04) </td>
                   <td class="borderTopLeft col_29" >01</td>
          
                   <td class="borderTopLeft col_36" >
                       <a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!1!4')">  <asp:Label CssClass="normal" ID="tab_121_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!3!4')">  <asp:Label CssClass="normal" ID="tab_121_w01_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!4!4')">  <asp:Label CssClass="normal" ID="tab_121_w01_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!5!4')">  <asp:Label CssClass="normal" ID="tab_121_w01_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!6!4')">  <asp:Label CssClass="normal" ID="tab_121_w01_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!7!4')">  <asp:Label CssClass="normal" ID="tab_121_w01_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!8!4')">  <asp:Label CssClass="normal" ID="tab_121_w01_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!9!4')">  <asp:Label CssClass="normal" ID="tab_121_w01_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!10!4')">  <asp:Label CssClass="normal" ID="tab_121_w01_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!11!4')">  <asp:Label CssClass="normal" ID="tab_121_w01_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!12!4')">  <asp:Label CssClass="normal" ID="tab_121_w01_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!13!4')">  <asp:Label CssClass="normal" ID="tab_121_w01_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!14!4')">  <asp:Label CssClass="normal" ID="tab_121_w01_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!15!4')">  <asp:Label CssClass="normal" ID="tab_121_w01_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!16!4')">  <asp:Label CssClass="normal" ID="tab_121_w01_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!17!4')">  <asp:Label CssClass="normal" ID="tab_121_w01_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!18!4')">  <asp:Label CssClass="normal" ID="tab_121_w01_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!19!4')">  <asp:Label CssClass="normal" ID="tab_121_w01_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!20!4')">  <asp:Label CssClass="normal" ID="tab_121_w01_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!21!4')">  <asp:Label CssClass="normal" ID="tab_121_w01_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!22!4')">  <asp:Label CssClass="normal" ID="tab_121_w01_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!23!4')">  <asp:Label CssClass="normal" ID="tab_121_w01_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!24!4')">  <asp:Label CssClass="normal" ID="tab_121_w01_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!25!4')">  <asp:Label CssClass="normal" ID="tab_121_w01_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!26!4')">  <asp:Label CssClass="normal" ID="tab_121_w01_c26" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="wciecie borderTopLeft" >U</td>
                   <td class="borderTopLeft col_29" >02</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!1!4')">  <asp:Label CssClass="normal" ID="tab_121_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderLeft col_36" >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!3!4')">  <asp:Label CssClass="normal" ID="tab_121_w02_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderLeft col_36" >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!5!4')">  <asp:Label CssClass="normal" ID="tab_121_w02_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!6!4')">  <asp:Label CssClass="normal" ID="tab_121_w02_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!7!4')">  <asp:Label CssClass="normal" ID="tab_121_w02_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!8!4')">  <asp:Label CssClass="normal" ID="tab_121_w02_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!9!4')">  <asp:Label CssClass="normal" ID="tab_121_w02_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!10!4')">  <asp:Label CssClass="normal" ID="tab_121_w02_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!11!4')">  <asp:Label CssClass="normal" ID="tab_121_w02_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!12!4')">  <asp:Label CssClass="normal" ID="tab_121_w02_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!13!4')">  <asp:Label CssClass="normal" ID="tab_121_w02_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!14!4')">  <asp:Label CssClass="normal" ID="tab_121_w02_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!15!4')">  <asp:Label CssClass="normal" ID="tab_121_w02_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!16!4')">  <asp:Label CssClass="normal" ID="tab_121_w02_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!17!4')">  <asp:Label CssClass="normal" ID="tab_121_w02_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!18!4')">  <asp:Label CssClass="normal" ID="tab_121_w02_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!19!4')">  <asp:Label CssClass="normal" ID="tab_121_w02_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!20!4')">  <asp:Label CssClass="normal" ID="tab_121_w02_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!21!4')">  <asp:Label CssClass="normal" ID="tab_121_w02_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!22!4')">  <asp:Label CssClass="normal" ID="tab_121_w02_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!23!4')">  <asp:Label CssClass="normal" ID="tab_121_w02_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!24!4')">  <asp:Label CssClass="normal" ID="tab_121_w02_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!25!4')">  <asp:Label CssClass="normal" ID="tab_121_w02_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!26!4')">  <asp:Label CssClass="normal" ID="tab_121_w02_c26" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="wciecie borderTopLeft" >Uo</td>
                   <td class="borderTopLeft col_29" >03</td>
                  <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!1!4')">  <asp:Label CssClass="normal" ID="tab_121_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderLeft col_36" >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!3!4')">  <asp:Label CssClass="normal" ID="tab_121_w03_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderLeft col_36" >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!5!4')">  <asp:Label CssClass="normal" ID="tab_121_w03_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!6!4')">  <asp:Label CssClass="normal" ID="tab_121_w03_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!7!4')">  <asp:Label CssClass="normal" ID="tab_121_w03_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!8!4')">  <asp:Label CssClass="normal" ID="tab_121_w03_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!9!4')">  <asp:Label CssClass="normal" ID="tab_121_w03_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!10!4')">  <asp:Label CssClass="normal" ID="tab_121_w03_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!11!4')">  <asp:Label CssClass="normal" ID="tab_121_w03_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!12!4')">  <asp:Label CssClass="normal" ID="tab_121_w03_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!13!4')">  <asp:Label CssClass="normal" ID="tab_121_w03_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!14!4')">  <asp:Label CssClass="normal" ID="tab_121_w03_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!15!4')">  <asp:Label CssClass="normal" ID="tab_121_w03_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!16!4')">  <asp:Label CssClass="normal" ID="tab_121_w03_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!17!4')">  <asp:Label CssClass="normal" ID="tab_121_w03_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!18!4')">  <asp:Label CssClass="normal" ID="tab_121_w03_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!19!4')">  <asp:Label CssClass="normal" ID="tab_121_w03_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!20!4')">  <asp:Label CssClass="normal" ID="tab_121_w03_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!21!4')">  <asp:Label CssClass="normal" ID="tab_121_w03_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!22!4')">  <asp:Label CssClass="normal" ID="tab_121_w03_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!23!4')">  <asp:Label CssClass="normal" ID="tab_121_w03_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!24!4')">  <asp:Label CssClass="normal" ID="tab_121_w03_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!25!4')">  <asp:Label CssClass="normal" ID="tab_121_w03_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!26!4')">  <asp:Label CssClass="normal" ID="tab_121_w03_c26" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="wciecie borderTopLeft" >WSC (skargi o stwierdzenie niezgodności z prawem)</td>
                   <td class="borderTopLeft col_29" >04</td>
                  <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!1!4')">  <asp:Label CssClass="normal" ID="tab_121_w04_c01" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderLeft col_36" >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!3!4')">  <asp:Label CssClass="normal" ID="tab_121_w04_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderLeft col_36" >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!5!4')">  <asp:Label CssClass="normal" ID="tab_121_w04_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!6!4')">  <asp:Label CssClass="normal" ID="tab_121_w04_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!7!4')">  <asp:Label CssClass="normal" ID="tab_121_w04_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!8!4')">  <asp:Label CssClass="normal" ID="tab_121_w04_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!9!4')">  <asp:Label CssClass="normal" ID="tab_121_w04_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!10!4')">  <asp:Label CssClass="normal" ID="tab_121_w04_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!11!4')">  <asp:Label CssClass="normal" ID="tab_121_w04_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!12!4')">  <asp:Label CssClass="normal" ID="tab_121_w04_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!13!4')">  <asp:Label CssClass="normal" ID="tab_121_w04_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!14!4')">  <asp:Label CssClass="normal" ID="tab_121_w04_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!15!4')">  <asp:Label CssClass="normal" ID="tab_121_w04_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!16!4')">  <asp:Label CssClass="normal" ID="tab_121_w04_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!17!4')">  <asp:Label CssClass="normal" ID="tab_121_w04_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!18!4')">  <asp:Label CssClass="normal" ID="tab_121_w04_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!19!4')">  <asp:Label CssClass="normal" ID="tab_121_w04_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!20!4')">  <asp:Label CssClass="normal" ID="tab_121_w04_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!21!4')">  <asp:Label CssClass="normal" ID="tab_121_w04_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!22!4')">  <asp:Label CssClass="normal" ID="tab_121_w04_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!23!4')">  <asp:Label CssClass="normal" ID="tab_121_w04_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!24!4')">  <asp:Label CssClass="normal" ID="tab_121_w04_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!25!4')">  <asp:Label CssClass="normal" ID="tab_121_w04_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!26!4')">  <asp:Label CssClass="normal" ID="tab_121_w04_c26" runat="server" Text="0"></asp:Label>  </a></td>
               <tr>
                   <td class="wciecie borderTopLeft" >Ogółem sprawy z zakresu prawa pracy (wiersze od 06 do 09)</td>
                   <td class="borderTopLeft col_29" >05</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!1!4')">  <asp:Label CssClass="normal" ID="tab_121_w05_c01" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!3!4')">  <asp:Label CssClass="normal" ID="tab_121_w05_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!5!4')">  <asp:Label CssClass="normal" ID="tab_121_w05_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!6!4')">  <asp:Label CssClass="normal" ID="tab_121_w05_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!7!4')">  <asp:Label CssClass="normal" ID="tab_121_w05_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!8!4')">  <asp:Label CssClass="normal" ID="tab_121_w05_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!9!4')">  <asp:Label CssClass="normal" ID="tab_121_w05_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!10!4')">  <asp:Label CssClass="normal" ID="tab_121_w05_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!11!4')">  <asp:Label CssClass="normal" ID="tab_121_w05_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!12!4')">  <asp:Label CssClass="normal" ID="tab_121_w05_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!13!4')">  <asp:Label CssClass="normal" ID="tab_121_w05_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!14!4')">  <asp:Label CssClass="normal" ID="tab_121_w05_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!15!4')">  <asp:Label CssClass="normal" ID="tab_121_w05_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!16!4')">  <asp:Label CssClass="normal" ID="tab_121_w05_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!17!4')">  <asp:Label CssClass="normal" ID="tab_121_w05_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!18!4')">  <asp:Label CssClass="normal" ID="tab_121_w05_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!19!4')">  <asp:Label CssClass="normal" ID="tab_121_w05_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!20!4')">  <asp:Label CssClass="normal" ID="tab_121_w05_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!21!4')">  <asp:Label CssClass="normal" ID="tab_121_w05_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!22!4')">  <asp:Label CssClass="normal" ID="tab_121_w05_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!23!4')">  <asp:Label CssClass="normal" ID="tab_121_w05_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!24!4')">  <asp:Label CssClass="normal" ID="tab_121_w05_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!25!4')">  <asp:Label CssClass="normal" ID="tab_121_w05_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!26!4')">  <asp:Label CssClass="normal" ID="tab_121_w05_c26" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="wciecie borderTopLeft" >P</td>
                   <td class="borderTopLeft col_29" >06</td>
                 <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!1!4')">  <asp:Label CssClass="normal" ID="tab_121_w06_c01" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderLeft col_36" >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!3!4')">  <asp:Label CssClass="normal" ID="tab_121_w06_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderLeft col_36" >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!5!4')">  <asp:Label CssClass="normal" ID="tab_121_w06_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!6!4')">  <asp:Label CssClass="normal" ID="tab_121_w06_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!7!4')">  <asp:Label CssClass="normal" ID="tab_121_w06_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!8!4')">  <asp:Label CssClass="normal" ID="tab_121_w06_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!9!4')">  <asp:Label CssClass="normal" ID="tab_121_w06_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!10!4')">  <asp:Label CssClass="normal" ID="tab_121_w06_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!11!4')">  <asp:Label CssClass="normal" ID="tab_121_w06_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!12!4')">  <asp:Label CssClass="normal" ID="tab_121_w06_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!13!4')">  <asp:Label CssClass="normal" ID="tab_121_w06_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!14!4')">  <asp:Label CssClass="normal" ID="tab_121_w06_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!15!4')">  <asp:Label CssClass="normal" ID="tab_121_w06_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!16!4')">  <asp:Label CssClass="normal" ID="tab_121_w06_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!17!4')">  <asp:Label CssClass="normal" ID="tab_121_w06_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!18!4')">  <asp:Label CssClass="normal" ID="tab_121_w06_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!19!4')">  <asp:Label CssClass="normal" ID="tab_121_w06_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!20!4')">  <asp:Label CssClass="normal" ID="tab_121_w06_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!21!4')">  <asp:Label CssClass="normal" ID="tab_121_w06_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!22!4')">  <asp:Label CssClass="normal" ID="tab_121_w06_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!23!4')">  <asp:Label CssClass="normal" ID="tab_121_w06_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!24!4')">  <asp:Label CssClass="normal" ID="tab_121_w06_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!25!4')">  <asp:Label CssClass="normal" ID="tab_121_w06_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!26!4')">  <asp:Label CssClass="normal" ID="tab_121_w06_c26" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="wciecie borderTopLeft" >Np</td>
                   <td class="borderTopLeft col_29" >07</td>
                  <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!1!4')">  <asp:Label CssClass="normal" ID="tab_121_w07_c01" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderLeft col_36" >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!3!4')">  <asp:Label CssClass="normal" ID="tab_121_w07_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderLeft col_36" >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!5!4')">  <asp:Label CssClass="normal" ID="tab_121_w07_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!6!4')">  <asp:Label CssClass="normal" ID="tab_121_w07_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!7!4')">  <asp:Label CssClass="normal" ID="tab_121_w07_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!8!4')">  <asp:Label CssClass="normal" ID="tab_121_w07_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!9!4')">  <asp:Label CssClass="normal" ID="tab_121_w07_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!10!4')">  <asp:Label CssClass="normal" ID="tab_121_w07_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!11!4')">  <asp:Label CssClass="normal" ID="tab_121_w07_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!12!4')">  <asp:Label CssClass="normal" ID="tab_121_w07_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!13!4')">  <asp:Label CssClass="normal" ID="tab_121_w07_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!14!4')">  <asp:Label CssClass="normal" ID="tab_121_w07_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!15!4')">  <asp:Label CssClass="normal" ID="tab_121_w07_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!16!4')">  <asp:Label CssClass="normal" ID="tab_121_w07_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!17!4')">  <asp:Label CssClass="normal" ID="tab_121_w07_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!18!4')">  <asp:Label CssClass="normal" ID="tab_121_w07_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!19!4')">  <asp:Label CssClass="normal" ID="tab_121_w07_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!20!4')">  <asp:Label CssClass="normal" ID="tab_121_w07_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!21!4')">  <asp:Label CssClass="normal" ID="tab_121_w07_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!22!4')">  <asp:Label CssClass="normal" ID="tab_121_w07_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!23!4')">  <asp:Label CssClass="normal" ID="tab_121_w07_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!24!4')">  <asp:Label CssClass="normal" ID="tab_121_w07_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!25!4')">  <asp:Label CssClass="normal" ID="tab_121_w07_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!26!4')">  <asp:Label CssClass="normal" ID="tab_121_w07_c26" runat="server" Text="0"></asp:Label>  </a></td>
         </tr>
               <tr>
                   <td class="wciecie borderTopLeft" >Po</td>
                   <td class="borderTopLeft col_29" >08</td>
                    <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!1!4')">  <asp:Label CssClass="normal" ID="tab_121_w08_c01" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderLeft col_36" >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!3!4')">  <asp:Label CssClass="normal" ID="tab_121_w08_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderLeft col_36" >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!5!4')">  <asp:Label CssClass="normal" ID="tab_121_w08_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!6!4')">  <asp:Label CssClass="normal" ID="tab_121_w08_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!7!4')">  <asp:Label CssClass="normal" ID="tab_121_w08_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!8!4')">  <asp:Label CssClass="normal" ID="tab_121_w08_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!9!4')">  <asp:Label CssClass="normal" ID="tab_121_w08_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!10!4')">  <asp:Label CssClass="normal" ID="tab_121_w08_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!11!4')">  <asp:Label CssClass="normal" ID="tab_121_w08_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!12!4')">  <asp:Label CssClass="normal" ID="tab_121_w08_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!13!4')">  <asp:Label CssClass="normal" ID="tab_121_w08_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!14!4')">  <asp:Label CssClass="normal" ID="tab_121_w08_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!15!4')">  <asp:Label CssClass="normal" ID="tab_121_w08_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!16!4')">  <asp:Label CssClass="normal" ID="tab_121_w08_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!17!4')">  <asp:Label CssClass="normal" ID="tab_121_w08_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!18!4')">  <asp:Label CssClass="normal" ID="tab_121_w08_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!19!4')">  <asp:Label CssClass="normal" ID="tab_121_w08_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!20!4')">  <asp:Label CssClass="normal" ID="tab_121_w08_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!21!4')">  <asp:Label CssClass="normal" ID="tab_121_w08_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!22!4')">  <asp:Label CssClass="normal" ID="tab_121_w08_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!23!4')">  <asp:Label CssClass="normal" ID="tab_121_w08_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!24!4')">  <asp:Label CssClass="normal" ID="tab_121_w08_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!25!4')">  <asp:Label CssClass="normal" ID="tab_121_w08_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!26!4')">  <asp:Label CssClass="normal" ID="tab_121_w08_c26" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="wciecie borderTopLeftBottom" >WSC (skargi o stwierdzenie niezgodności z prawem)</td>
                   <td class="borderTopLeftBottom col_29" >09</td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!1!4')">  <asp:Label CssClass="normal" ID="tab_121_w09_c01" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_36" >&nbsp;</td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!3!4')">  <asp:Label CssClass="normal" ID="tab_121_w09_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_36" >&nbsp;</td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!5!4')">  <asp:Label CssClass="normal" ID="tab_121_w09_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!6!4')">  <asp:Label CssClass="normal" ID="tab_121_w09_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!7!4')">  <asp:Label CssClass="normal" ID="tab_121_w09_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!8!4')">  <asp:Label CssClass="normal" ID="tab_121_w09_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!9!4')">  <asp:Label CssClass="normal" ID="tab_121_w09_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!10!4')">  <asp:Label CssClass="normal" ID="tab_121_w09_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!11!4')">  <asp:Label CssClass="normal" ID="tab_121_w09_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!12!4')">  <asp:Label CssClass="normal" ID="tab_121_w09_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!13!4')">  <asp:Label CssClass="normal" ID="tab_121_w09_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!14!4')">  <asp:Label CssClass="normal" ID="tab_121_w09_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!15!4')">  <asp:Label CssClass="normal" ID="tab_121_w09_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!16!4')">  <asp:Label CssClass="normal" ID="tab_121_w09_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!17!4')">  <asp:Label CssClass="normal" ID="tab_121_w09_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!18!4')">  <asp:Label CssClass="normal" ID="tab_121_w09_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!19!4')">  <asp:Label CssClass="normal" ID="tab_121_w09_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!20!4')">  <asp:Label CssClass="normal" ID="tab_121_w09_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!21!4')">  <asp:Label CssClass="normal" ID="tab_121_w09_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!22!4')">  <asp:Label CssClass="normal" ID="tab_121_w09_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!23!4')">  <asp:Label CssClass="normal" ID="tab_121_w09_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!24!4')">  <asp:Label CssClass="normal" ID="tab_121_w09_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!25!4')">  <asp:Label CssClass="normal" ID="tab_121_w09_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderAll col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!26!4')">  <asp:Label CssClass="normal" ID="tab_121_w09_c26" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
           </table>




           </div>

          <div class="page-break">



           <strong>Dział 1.2.2 </strong> Liczba odbytych sesji i załatwionych spraw (dok.)  <br />

   <table cellpadding="0" cellspacing="0" >
	<tbody>
		<tr>
			<td class="borderTopLeft "  rowspan="3" colspan="3" align="center">SPRAWY według repertoriów i wykazów</td>
			<td class="borderTopLeft col_29"  rowspan="3">L.p.</td>
            <td class="borderTopLeft "  rowspan="3">Liczba odbytych sesji (rozprawy i posiedzenia) - wokandy</td>
            <td class="borderTopLeft "  rowspan="3">Liczba dni w których odbyto sesje - wokandy</td>
            <td class="borderTopLeft "  rowspan="3">Załatwienie 1)ogółem (kol. 4, 15)</td>
            <td class="borderTopLeft "  colspan="11" align="center">Liczba wyznaczonych spraw na rozprawę, dotyczy:</td>
            <td class="borderTopLeftRight col_36"  colspan="12"></td>
			
		</tr>
	<tr>
			 <td class="borderTopLeft "  rowspan="2">Razem wyznaczonych spraw na rozprawę</td>
                   <td class="borderTopLeft "  rowspan="2">sędziów / SR z wyłączeniem sędziów funkcyjnych </td>
                   <td class="borderTopLeft "  rowspan="2">sędziów funkcyjnych SR (suma kol. od 7 do 13)</td>
                   <td class="borderTopLeft "  colspan="7" align="center">z tego</td>
                   <td class="borderTopLeft col_36"  rowspan="2">inni</td>
                   <td class="borderTopLeft col_36"  rowspan="2">Razem wyznaczonych spraw na posiedzenie </td>
                   <td class="borderTopLeft col_36"  rowspan="2">sędziów SR z wyłączeniem sędziów funkcyjnych</td>
                   <td class="borderTopLeft col_36"  rowspan="2">sędziów / funkcyjnych SR (suma kol. od 18 do 24)</td>
                   <td class="borderTopLeft "  colspan="7" align="center">z tego</td>
                   <td class="borderTopLeft col_36"  rowspan="2">inni</td>
                   <td class="borderTopLeftRight col_36"  rowspan="2">referendarzy </td>
		</tr>
		<tr>
			 <td class="borderTopLeft col_36" >prezesa</td>
                   <td class="borderTopLeft col_36" >wice-prezesa</td>
                   <td class="borderTopLeft col_36" >przewodni-czącego wydziału</td>
                   <td class="borderTopLeft col_36" >zastępce przewodni-czącego wydziału</td>
                   <td class="borderTopLeft col_36" >kierownika sekcji</td>
                   <td class="borderTopLeft col_36" >innych funkcyjnych tego sądu z tego pionu</td>
                   <td class="borderTopLeft col_36" >innych funkcyjnych tego sądu z innych pionów</td>
                   <td class="borderTopLeft col_36" >prezesa</td>
                   <td class="borderTopLeft col_36" >wice-prezesa</td>
                   <td class="borderTopLeft col_36" >przewodni-czącego wydziału</td>
                   <td class="borderTopLeft col_36" >zastępce przewodni-czącego wydziału</td>
                   <td class="borderTopLeft col_36" >kierownika sekcji</td>
                   <td class="borderTopLeft col_36" >innych funkcyjnych tego sądu z tego pionu</td>
                   <td class="borderTopLeft col_36" >innych funkcyjnych tego sądu z innych pionów</td>
		</tr>
				<tr>
			<td class="borderTopLeft "  colspan="4" align="center">0</td>
                   <td class="borderTopLeft" align="center" >1</td>
                   <td class="borderTopLeft" align="center" >2</td>
                   <td class="borderTopLeft" align="center" >3</td>
                   <td class="borderTopLeft" align="center" >4</td>
                   <td class="borderTopLeft" align="center" >5</td>
                   <td class="borderTopLeft" align="center" >6</td>
                   <td class="borderTopLeft" align="center" >7</td>
                   <td class="borderTopLeft" align="center" >8</td>
                   <td class="borderTopLeft" align="center" >9</td>
                   <td class="borderTopLeft" align="center" >10</td>
                   <td class="borderTopLeft" align="center" >11</td>
                   <td class="borderTopLeft" align="center" >12</td>
                   <td class="borderTopLeft" align="center" >13</td>
                   <td class="borderTopLeft" align="center" >14</td>
                   <td class="borderTopLeft" align="center" >15</td>
                   <td class="borderTopLeft" align="center" >16</td>
                   <td class="borderTopLeft" align="center" >17</td>
                   <td class="borderTopLeft" align="center" >18</td>
                   <td class="borderTopLeft" align="center" >19</td>
                   <td class="borderTopLeft" align="center" >20</td>
                   <td class="borderTopLeft" align="center" >21</td>
                   <td class="borderTopLeft" align="center" >22</td>
                   <td class="borderTopLeft" align="center" >23</td>
                   <td class="borderTopLeft col_36" >24</td>
                   <td class="borderTopLeft col_36" >25</td>
                   <td class="borderTopLeftRight col_36" >26</td>
		</tr>
		<tr><td class="borderTopLeft" colspan="3"> Ogółem sprawy z zakresu ubezpieczeń społecznych (wiersze 02, 20, 21)</td>
			<td class="borderTopLeft col_29" >01</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!1!4')">  <asp:Label CssClass="normal" ID="tab_122_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!2!4')">  <asp:Label CssClass="normal" ID="tab_122_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_122_w01_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_122_w01_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_122_w01_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_122_w01_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_122_w01_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_122_w01_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_122_w01_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!10!4')">  <asp:Label CssClass="normal" ID="tab_122_w01_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!11!4')">  <asp:Label CssClass="normal" ID="tab_122_w01_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!12!4')">  <asp:Label CssClass="normal" ID="tab_122_w01_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!13!4')">  <asp:Label CssClass="normal" ID="tab_122_w01_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!14!4')">  <asp:Label CssClass="normal" ID="tab_122_w01_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!15!4')">  <asp:Label CssClass="normal" ID="tab_122_w01_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!16!4')">  <asp:Label CssClass="normal" ID="tab_122_w01_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!17!4')">  <asp:Label CssClass="normal" ID="tab_122_w01_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!18!4')">  <asp:Label CssClass="normal" ID="tab_122_w01_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!19!4')">  <asp:Label CssClass="normal" ID="tab_122_w01_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!20!4')">  <asp:Label CssClass="normal" ID="tab_122_w01_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!21!4')">  <asp:Label CssClass="normal" ID="tab_122_w01_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!22!4')">  <asp:Label CssClass="normal" ID="tab_122_w01_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!23!4')">  <asp:Label CssClass="normal" ID="tab_122_w01_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!24!4')">  <asp:Label CssClass="normal" ID="tab_122_w01_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!25!4')">  <asp:Label CssClass="normal" ID="tab_122_w01_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!26!4')">  <asp:Label CssClass="normal" ID="tab_122_w01_c26" runat="server" Text="0"></asp:Label>  </a></td>
		</tr>
		<tr><td class="borderTopLeft" colspan="3"> U</td>
			<td class="borderTopLeft col_29" >02</td>
                   <td class="borderTopLeft col_36" >&nbsp;</td>
                   <td >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_122_w02_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_122_w02_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_122_w02_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_122_w02_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_122_w02_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_122_w02_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_122_w02_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!10!4')">  <asp:Label CssClass="normal" ID="tab_122_w02_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!11!4')">  <asp:Label CssClass="normal" ID="tab_122_w02_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!12!4')">  <asp:Label CssClass="normal" ID="tab_122_w02_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!13!4')">  <asp:Label CssClass="normal" ID="tab_122_w02_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!14!4')">  <asp:Label CssClass="normal" ID="tab_122_w02_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!15!4')">  <asp:Label CssClass="normal" ID="tab_122_w02_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!16!4')">  <asp:Label CssClass="normal" ID="tab_122_w02_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!17!4')">  <asp:Label CssClass="normal" ID="tab_122_w02_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!18!4')">  <asp:Label CssClass="normal" ID="tab_122_w02_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!19!4')">  <asp:Label CssClass="normal" ID="tab_122_w02_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!20!4')">  <asp:Label CssClass="normal" ID="tab_122_w02_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!21!4')">  <asp:Label CssClass="normal" ID="tab_122_w02_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!22!4')">  <asp:Label CssClass="normal" ID="tab_122_w02_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!23!4')">  <asp:Label CssClass="normal" ID="tab_122_w02_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!24!4')">  <asp:Label CssClass="normal" ID="tab_122_w02_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!25!4')">  <asp:Label CssClass="normal" ID="tab_122_w02_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!26!4')">  <asp:Label CssClass="normal" ID="tab_122_w02_c26" runat="server" Text="0"></asp:Label>  </a></td>
		</tr>
		<tr><td class="borderTopLeft" rowspan="17"> </td>
					<td class="borderTopLeft wciecie" colspan="2"> przekazanie do innych jednostek na podstawie art. 200§1 kpc ( z wyjątkiem zmian organizacyjnych)</td>
			<td class="borderTopLeft col_29" >03</td>
                   <td class="borderLeft" >&nbsp;</td>
                   <td >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_122_w03_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_122_w03_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_122_w03_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_122_w03_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_122_w03_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_122_w03_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_122_w03_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!10!4')">  <asp:Label CssClass="normal" ID="tab_122_w03_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!11!4')">  <asp:Label CssClass="normal" ID="tab_122_w03_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!12!4')">  <asp:Label CssClass="normal" ID="tab_122_w03_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!13!4')">  <asp:Label CssClass="normal" ID="tab_122_w03_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!14!4')">  <asp:Label CssClass="normal" ID="tab_122_w03_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!15!4')">  <asp:Label CssClass="normal" ID="tab_122_w03_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!16!4')">  <asp:Label CssClass="normal" ID="tab_122_w03_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!17!4')">  <asp:Label CssClass="normal" ID="tab_122_w03_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!18!4')">  <asp:Label CssClass="normal" ID="tab_122_w03_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!19!4')">  <asp:Label CssClass="normal" ID="tab_122_w03_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!20!4')">  <asp:Label CssClass="normal" ID="tab_122_w03_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!21!4')">  <asp:Label CssClass="normal" ID="tab_122_w03_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!22!4')">  <asp:Label CssClass="normal" ID="tab_122_w03_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!23!4')">  <asp:Label CssClass="normal" ID="tab_122_w03_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!24!4')">  <asp:Label CssClass="normal" ID="tab_122_w03_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!25!4')">  <asp:Label CssClass="normal" ID="tab_122_w03_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!26!4')">  <asp:Label CssClass="normal" ID="tab_122_w03_c26" runat="server" Text="0"></asp:Label>  </a></td>
		</tr>
		<tr>
					<td class="borderTopLeft wciecie" colspan="2"> zakończono w trybie art. 339 kpc </td>
			<td class="borderTopLeft col_29" >04</td>
                   <td class="borderLeft" >&nbsp;</td>
                   <td >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_122_w04_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_122_w04_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_122_w04_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_122_w04_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_122_w04_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_122_w04_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_122_w04_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!10!4')">  <asp:Label CssClass="normal" ID="tab_122_w04_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!11!4')">  <asp:Label CssClass="normal" ID="tab_122_w04_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!12!4')">  <asp:Label CssClass="normal" ID="tab_122_w04_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!13!4')">  <asp:Label CssClass="normal" ID="tab_122_w04_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!14!4')">  <asp:Label CssClass="normal" ID="tab_122_w04_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!15!4')">  <asp:Label CssClass="normal" ID="tab_122_w04_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!16!4')">  <asp:Label CssClass="normal" ID="tab_122_w04_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!17!4')">  <asp:Label CssClass="normal" ID="tab_122_w04_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!18!4')">  <asp:Label CssClass="normal" ID="tab_122_w04_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!19!4')">  <asp:Label CssClass="normal" ID="tab_122_w04_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!20!4')">  <asp:Label CssClass="normal" ID="tab_122_w04_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!21!4')">  <asp:Label CssClass="normal" ID="tab_122_w04_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!22!4')">  <asp:Label CssClass="normal" ID="tab_122_w04_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!23!4')">  <asp:Label CssClass="normal" ID="tab_122_w04_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!24!4')">  <asp:Label CssClass="normal" ID="tab_122_w04_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!25!4')">  <asp:Label CssClass="normal" ID="tab_122_w04_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!26!4')">  <asp:Label CssClass="normal" ID="tab_122_w04_c26" runat="server" Text="0"></asp:Label>  </a></td>
		</tr>
		
	<tr>
					<td class="borderTopLeft wciecie" colspan="2"> zakończono w trybie art. 341 kpc </td>
			<td class="borderTopLeft col_29" >05</td>
                   <td class="borderLeft" >&nbsp;</td>
                   <td >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_122_w05_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_122_w05_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_122_w05_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_122_w05_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_122_w05_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_122_w05_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_122_w05_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!10!4')">  <asp:Label CssClass="normal" ID="tab_122_w05_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!11!4')">  <asp:Label CssClass="normal" ID="tab_122_w05_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!12!4')">  <asp:Label CssClass="normal" ID="tab_122_w05_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!13!4')">  <asp:Label CssClass="normal" ID="tab_122_w05_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!14!4')">  <asp:Label CssClass="normal" ID="tab_122_w05_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!15!4')">  <asp:Label CssClass="normal" ID="tab_122_w05_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!16!4')">  <asp:Label CssClass="normal" ID="tab_122_w05_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!17!4')">  <asp:Label CssClass="normal" ID="tab_122_w05_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!18!4')">  <asp:Label CssClass="normal" ID="tab_122_w05_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!19!4')">  <asp:Label CssClass="normal" ID="tab_122_w05_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!20!4')">  <asp:Label CssClass="normal" ID="tab_122_w05_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!21!4')">  <asp:Label CssClass="normal" ID="tab_122_w05_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!22!4')">  <asp:Label CssClass="normal" ID="tab_122_w05_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!23!4')">  <asp:Label CssClass="normal" ID="tab_122_w05_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!24!4')">  <asp:Label CssClass="normal" ID="tab_122_w05_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!25!4')">  <asp:Label CssClass="normal" ID="tab_122_w05_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!26!4')">  <asp:Label CssClass="normal" ID="tab_122_w05_c26" runat="server" Text="0"></asp:Label>  </a></td>
		</tr>
		<tr>
					<td class="borderTopLeft wciecie" colspan="2"> w wyniku zmian zarządzenia MS o biurowości</td>
			<td class="borderTopLeft col_29" >06</td>
                   <td class="borderLeft" >&nbsp;</td>
                   <td >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_122_w06_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_122_w06_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_122_w06_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_122_w06_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_122_w06_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_122_w06_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_122_w06_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!10!4')">  <asp:Label CssClass="normal" ID="tab_122_w06_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!11!4')">  <asp:Label CssClass="normal" ID="tab_122_w06_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!12!4')">  <asp:Label CssClass="normal" ID="tab_122_w06_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!13!4')">  <asp:Label CssClass="normal" ID="tab_122_w06_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!14!4')">  <asp:Label CssClass="normal" ID="tab_122_w06_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!15!4')">  <asp:Label CssClass="normal" ID="tab_122_w06_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!16!4')">  <asp:Label CssClass="normal" ID="tab_122_w06_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!17!4')">  <asp:Label CssClass="normal" ID="tab_122_w06_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!18!4')">  <asp:Label CssClass="normal" ID="tab_122_w06_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!19!4')">  <asp:Label CssClass="normal" ID="tab_122_w06_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!20!4')">  <asp:Label CssClass="normal" ID="tab_122_w06_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!21!4')">  <asp:Label CssClass="normal" ID="tab_122_w06_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!22!4')">  <asp:Label CssClass="normal" ID="tab_122_w06_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!23!4')">  <asp:Label CssClass="normal" ID="tab_122_w06_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!24!4')">  <asp:Label CssClass="normal" ID="tab_122_w06_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!25!4')">  <asp:Label CssClass="normal" ID="tab_122_w06_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!26!4')">  <asp:Label CssClass="normal" ID="tab_122_w06_c26" runat="server" Text="0"></asp:Label>  </a></td>
		</tr>
		<tr>
				<td class="borderTopLeft wciecie" colspan="2"> w wyniku przekazania sprawy w ramach sądu pomiędzy wydziałami tego samego pionu</td>
				<td class="borderTopLeft col_29" >07</td>
			       <td class="borderLeft" >&nbsp;</td>
                   <td >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_122_w07_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_122_w07_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_122_w07_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_122_w07_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_122_w07_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_122_w07_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_122_w07_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!10!4')">  <asp:Label CssClass="normal" ID="tab_122_w07_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!11!4')">  <asp:Label CssClass="normal" ID="tab_122_w07_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!12!4')">  <asp:Label CssClass="normal" ID="tab_122_w07_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!13!4')">  <asp:Label CssClass="normal" ID="tab_122_w07_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!14!4')">  <asp:Label CssClass="normal" ID="tab_122_w07_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!15!4')">  <asp:Label CssClass="normal" ID="tab_122_w07_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!16!4')">  <asp:Label CssClass="normal" ID="tab_122_w07_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!17!4')">  <asp:Label CssClass="normal" ID="tab_122_w07_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!18!4')">  <asp:Label CssClass="normal" ID="tab_122_w07_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!19!4')">  <asp:Label CssClass="normal" ID="tab_122_w07_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!20!4')">  <asp:Label CssClass="normal" ID="tab_122_w07_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!21!4')">  <asp:Label CssClass="normal" ID="tab_122_w07_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!22!4')">  <asp:Label CssClass="normal" ID="tab_122_w07_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!23!4')">  <asp:Label CssClass="normal" ID="tab_122_w07_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!24!4')">  <asp:Label CssClass="normal" ID="tab_122_w07_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!25!4')">  <asp:Label CssClass="normal" ID="tab_122_w07_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!26!4')">  <asp:Label CssClass="normal" ID="tab_122_w07_c26" runat="server" Text="0"></asp:Label>  </a></td>

		</tr>
		<tr>
							<td class="borderTopLeft wciecie" colspan="2"> w wyniku przekazania sprawy w ramach sądu pomiędzy wydziałami różnych pionów</td>
			<td class="borderTopLeft col_29" >08</td>
				   <td class="borderLeft" >&nbsp;</td>
                   <td >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_122_w08_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_122_w08_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_122_w08_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_122_w08_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_122_w08_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_122_w08_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_122_w08_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!10!4')">  <asp:Label CssClass="normal" ID="tab_122_w08_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!11!4')">  <asp:Label CssClass="normal" ID="tab_122_w08_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!12!4')">  <asp:Label CssClass="normal" ID="tab_122_w08_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!13!4')">  <asp:Label CssClass="normal" ID="tab_122_w08_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!14!4')">  <asp:Label CssClass="normal" ID="tab_122_w08_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!15!4')">  <asp:Label CssClass="normal" ID="tab_122_w08_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!16!4')">  <asp:Label CssClass="normal" ID="tab_122_w08_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!17!4')">  <asp:Label CssClass="normal" ID="tab_122_w08_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!18!4')">  <asp:Label CssClass="normal" ID="tab_122_w08_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!19!4')">  <asp:Label CssClass="normal" ID="tab_122_w08_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!20!4')">  <asp:Label CssClass="normal" ID="tab_122_w08_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!21!4')">  <asp:Label CssClass="normal" ID="tab_122_w08_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!22!4')">  <asp:Label CssClass="normal" ID="tab_122_w08_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!23!4')">  <asp:Label CssClass="normal" ID="tab_122_w08_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!24!4')">  <asp:Label CssClass="normal" ID="tab_122_w08_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!25!4')">  <asp:Label CssClass="normal" ID="tab_122_w08_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!26!4')">  <asp:Label CssClass="normal" ID="tab_122_w08_c26" runat="server" Text="0"></asp:Label>  </a></td>

		</tr>
		<tr>
				<td class="borderTopLeft wciecie" rowspan="2"> zmiany organizacyjne związane z utworzeniem </td>
			<td class="borderTopLeft wciecie"> wydziału (ów)</td>
			<td class="borderTopLeft col_29" >09</td>
				   <td class="borderLeft" >&nbsp;</td>
                   <td >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_122_w09_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_122_w09_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_122_w09_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_122_w09_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_122_w09_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_122_w09_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_122_w09_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!10!4')">  <asp:Label CssClass="normal" ID="tab_122_w09_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!11!4')">  <asp:Label CssClass="normal" ID="tab_122_w09_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!12!4')">  <asp:Label CssClass="normal" ID="tab_122_w09_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!13!4')">  <asp:Label CssClass="normal" ID="tab_122_w09_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!14!4')">  <asp:Label CssClass="normal" ID="tab_122_w09_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!15!4')">  <asp:Label CssClass="normal" ID="tab_122_w09_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!16!4')">  <asp:Label CssClass="normal" ID="tab_122_w09_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!17!4')">  <asp:Label CssClass="normal" ID="tab_122_w09_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!18!4')">  <asp:Label CssClass="normal" ID="tab_122_w09_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!19!4')">  <asp:Label CssClass="normal" ID="tab_122_w09_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!20!4')">  <asp:Label CssClass="normal" ID="tab_122_w09_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!21!4')">  <asp:Label CssClass="normal" ID="tab_122_w09_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!22!4')">  <asp:Label CssClass="normal" ID="tab_122_w09_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!23!4')">  <asp:Label CssClass="normal" ID="tab_122_w09_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!24!4')">  <asp:Label CssClass="normal" ID="tab_122_w09_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!25!4')">  <asp:Label CssClass="normal" ID="tab_122_w09_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!26!4')">  <asp:Label CssClass="normal" ID="tab_122_w09_c26" runat="server" Text="0"></asp:Label>  </a></td>

		</tr>
		<tr>
			<td class="borderTopLeft wciecie"> sądu (ów)</td>
			<td class="borderTopLeft col_29" >10</td>
				   <td class="borderLeft" >&nbsp;</td>
                   <td >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_122_w10_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_122_w10_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_122_w10_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_122_w10_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_122_w10_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_122_w10_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_122_w10_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!10!4')">  <asp:Label CssClass="normal" ID="tab_122_w10_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!11!4')">  <asp:Label CssClass="normal" ID="tab_122_w10_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!12!4')">  <asp:Label CssClass="normal" ID="tab_122_w10_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!13!4')">  <asp:Label CssClass="normal" ID="tab_122_w10_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!14!4')">  <asp:Label CssClass="normal" ID="tab_122_w10_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!15!4')">  <asp:Label CssClass="normal" ID="tab_122_w10_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!16!4')">  <asp:Label CssClass="normal" ID="tab_122_w10_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!17!4')">  <asp:Label CssClass="normal" ID="tab_122_w10_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!18!4')">  <asp:Label CssClass="normal" ID="tab_122_w10_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!19!4')">  <asp:Label CssClass="normal" ID="tab_122_w10_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!20!4')">  <asp:Label CssClass="normal" ID="tab_122_w10_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!21!4')">  <asp:Label CssClass="normal" ID="tab_122_w10_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!22!4')">  <asp:Label CssClass="normal" ID="tab_122_w10_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!23!4')">  <asp:Label CssClass="normal" ID="tab_122_w10_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!24!4')">  <asp:Label CssClass="normal" ID="tab_122_w10_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!25!4')">  <asp:Label CssClass="normal" ID="tab_122_w10_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!26!4')">  <asp:Label CssClass="normal" ID="tab_122_w10_c26" runat="server" Text="0"></asp:Label>  </a></td>

		</tr>
		
		<tr>
			<td class="borderTopLeft wciecie" rowspan="2"> w związku ze zmianą obszaru właściwości miejscowej</td>
			<td class="borderTopLeft wciecie"> wydziału (ów)</td>
			<td class="borderTopLeft col_29" >11</td>
                   <td class="borderLeft" >&nbsp;</td>
                   <td >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_122_w11_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_122_w11_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_122_w11_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_122_w11_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_122_w11_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_122_w11_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_122_w11_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!10!4')">  <asp:Label CssClass="normal" ID="tab_122_w11_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!11!4')">  <asp:Label CssClass="normal" ID="tab_122_w11_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!12!4')">  <asp:Label CssClass="normal" ID="tab_122_w11_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!13!4')">  <asp:Label CssClass="normal" ID="tab_122_w11_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!14!4')">  <asp:Label CssClass="normal" ID="tab_122_w11_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!15!4')">  <asp:Label CssClass="normal" ID="tab_122_w11_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!16!4')">  <asp:Label CssClass="normal" ID="tab_122_w11_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!17!4')">  <asp:Label CssClass="normal" ID="tab_122_w11_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!18!4')">  <asp:Label CssClass="normal" ID="tab_122_w11_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!19!4')">  <asp:Label CssClass="normal" ID="tab_122_w11_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!20!4')">  <asp:Label CssClass="normal" ID="tab_122_w11_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!21!4')">  <asp:Label CssClass="normal" ID="tab_122_w11_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!22!4')">  <asp:Label CssClass="normal" ID="tab_122_w11_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!23!4')">  <asp:Label CssClass="normal" ID="tab_122_w11_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!24!4')">  <asp:Label CssClass="normal" ID="tab_122_w11_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!25!4')">  <asp:Label CssClass="normal" ID="tab_122_w11_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!26!4')">  <asp:Label CssClass="normal" ID="tab_122_w11_c26" runat="server" Text="0"></asp:Label>  </a></td>
		</tr>
		<tr>
			<td class="borderTopLeft wciecie"> sądu (ów)</td>
			<td class="borderTopLeft col_29" >12</td>
                   <td class="borderLeft" >&nbsp;</td>
                   <td >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_122_w12_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_122_w12_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_122_w12_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_122_w12_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_122_w12_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_122_w12_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_122_w12_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!10!4')">  <asp:Label CssClass="normal" ID="tab_122_w12_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!11!4')">  <asp:Label CssClass="normal" ID="tab_122_w12_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!12!4')">  <asp:Label CssClass="normal" ID="tab_122_w12_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!13!4')">  <asp:Label CssClass="normal" ID="tab_122_w12_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!14!4')">  <asp:Label CssClass="normal" ID="tab_122_w12_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!15!4')">  <asp:Label CssClass="normal" ID="tab_122_w12_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!16!4')">  <asp:Label CssClass="normal" ID="tab_122_w12_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!17!4')">  <asp:Label CssClass="normal" ID="tab_122_w12_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!18!4')">  <asp:Label CssClass="normal" ID="tab_122_w12_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!19!4')">  <asp:Label CssClass="normal" ID="tab_122_w12_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!20!4')">  <asp:Label CssClass="normal" ID="tab_122_w12_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!21!4')">  <asp:Label CssClass="normal" ID="tab_122_w12_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!22!4')">  <asp:Label CssClass="normal" ID="tab_122_w12_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!23!4')">  <asp:Label CssClass="normal" ID="tab_122_w12_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!24!4')">  <asp:Label CssClass="normal" ID="tab_122_w12_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!25!4')">  <asp:Label CssClass="normal" ID="tab_122_w12_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!26!4')">  <asp:Label CssClass="normal" ID="tab_122_w12_c26" runat="server" Text="0"></asp:Label>  </a></td>
		</tr>
		<tr>
					<td class="borderTopLeft wciecie" colspan="2"> połączono do wspólnego rozpoznania na podstawie art. 219 kpc</td>
			<td class="borderTopLeft col_29" >13</td>
                   <td class="borderLeft" >&nbsp;</td>
                   <td >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_122_w13_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_122_w13_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_122_w13_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_122_w13_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_122_w13_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_122_w13_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_122_w13_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!10!4')">  <asp:Label CssClass="normal" ID="tab_122_w13_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!11!4')">  <asp:Label CssClass="normal" ID="tab_122_w13_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!12!4')">  <asp:Label CssClass="normal" ID="tab_122_w13_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!13!4')">  <asp:Label CssClass="normal" ID="tab_122_w13_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!14!4')">  <asp:Label CssClass="normal" ID="tab_122_w13_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!15!4')">  <asp:Label CssClass="normal" ID="tab_122_w13_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!16!4')">  <asp:Label CssClass="normal" ID="tab_122_w13_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!17!4')">  <asp:Label CssClass="normal" ID="tab_122_w13_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!18!4')">  <asp:Label CssClass="normal" ID="tab_122_w13_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!19!4')">  <asp:Label CssClass="normal" ID="tab_122_w13_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!20!4')">  <asp:Label CssClass="normal" ID="tab_122_w13_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!21!4')">  <asp:Label CssClass="normal" ID="tab_122_w13_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!22!4')">  <asp:Label CssClass="normal" ID="tab_122_w13_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!23!4')">  <asp:Label CssClass="normal" ID="tab_122_w13_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!24!4')">  <asp:Label CssClass="normal" ID="tab_122_w13_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!25!4')">  <asp:Label CssClass="normal" ID="tab_122_w13_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!26!4')">  <asp:Label CssClass="normal" ID="tab_122_w13_c26" runat="server" Text="0"></asp:Label>  </a></td>
		</tr>
		<tr>
					<td class="borderTopLeft wciecie" colspan="2"> zakreślono na podstawie art. 174 §1 pkt 1 kpc</td>
			<td class="borderTopLeft col_29" >14</td>
                   <td class="borderLeft" >&nbsp;</td>
                   <td >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_122_w14_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_122_w14_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_122_w14_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_122_w14_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_122_w14_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_122_w14_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_122_w14_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!10!4')">  <asp:Label CssClass="normal" ID="tab_122_w14_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!11!4')">  <asp:Label CssClass="normal" ID="tab_122_w14_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!12!4')">  <asp:Label CssClass="normal" ID="tab_122_w14_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!13!4')">  <asp:Label CssClass="normal" ID="tab_122_w14_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!14!4')">  <asp:Label CssClass="normal" ID="tab_122_w14_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!15!4')">  <asp:Label CssClass="normal" ID="tab_122_w14_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!16!4')">  <asp:Label CssClass="normal" ID="tab_122_w14_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!17!4')">  <asp:Label CssClass="normal" ID="tab_122_w14_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!18!4')">  <asp:Label CssClass="normal" ID="tab_122_w14_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!19!4')">  <asp:Label CssClass="normal" ID="tab_122_w14_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!20!4')">  <asp:Label CssClass="normal" ID="tab_122_w14_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!21!4')">  <asp:Label CssClass="normal" ID="tab_122_w14_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!22!4')">  <asp:Label CssClass="normal" ID="tab_122_w14_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!23!4')">  <asp:Label CssClass="normal" ID="tab_122_w14_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!24!4')">  <asp:Label CssClass="normal" ID="tab_122_w14_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!25!4')">  <asp:Label CssClass="normal" ID="tab_122_w14_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!26!4')">  <asp:Label CssClass="normal" ID="tab_122_w14_c26" runat="server" Text="0"></asp:Label>  </a></td>
		</tr>
		
	<tr>
					<td class="borderTopLeft wciecie" colspan="2"> zakreślono na podstawie art. 174 §1 pkt 4 kpc</td>
			<td class="borderTopLeft col_29" >15</td>
                   <td class="borderLeft" >&nbsp;</td>
                   <td >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_122_w15_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_122_w15_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_122_w15_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_122_w15_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_122_w15_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_122_w15_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_122_w15_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!10!4')">  <asp:Label CssClass="normal" ID="tab_122_w15_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!11!4')">  <asp:Label CssClass="normal" ID="tab_122_w15_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!12!4')">  <asp:Label CssClass="normal" ID="tab_122_w15_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!13!4')">  <asp:Label CssClass="normal" ID="tab_122_w15_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!14!4')">  <asp:Label CssClass="normal" ID="tab_122_w15_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!15!4')">  <asp:Label CssClass="normal" ID="tab_122_w15_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!16!4')">  <asp:Label CssClass="normal" ID="tab_122_w15_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!17!4')">  <asp:Label CssClass="normal" ID="tab_122_w15_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!18!4')">  <asp:Label CssClass="normal" ID="tab_122_w15_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!19!4')">  <asp:Label CssClass="normal" ID="tab_122_w15_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!20!4')">  <asp:Label CssClass="normal" ID="tab_122_w15_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!21!4')">  <asp:Label CssClass="normal" ID="tab_122_w15_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!22!4')">  <asp:Label CssClass="normal" ID="tab_122_w15_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!23!4')">  <asp:Label CssClass="normal" ID="tab_122_w15_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!24!4')">  <asp:Label CssClass="normal" ID="tab_122_w15_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!25!4')">  <asp:Label CssClass="normal" ID="tab_122_w15_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!26!4')">  <asp:Label CssClass="normal" ID="tab_122_w15_c26" runat="server" Text="0"></asp:Label>  </a></td>
		</tr>
		<tr>
					<td class="borderTopLeft wciecie" colspan="2"> zakreślenie omyłkowych wpisów</td>
			<td class="borderTopLeft col_29" >16</td>
                   <td class="borderLeft" >&nbsp;</td>
                   <td >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_122_w16_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_122_w16_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_122_w16_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_122_w16_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_122_w16_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_122_w16_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_122_w16_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!10!4')">  <asp:Label CssClass="normal" ID="tab_122_w16_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!11!4')">  <asp:Label CssClass="normal" ID="tab_122_w16_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!12!4')">  <asp:Label CssClass="normal" ID="tab_122_w16_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!13!4')">  <asp:Label CssClass="normal" ID="tab_122_w16_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!14!4')">  <asp:Label CssClass="normal" ID="tab_122_w16_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!15!4')">  <asp:Label CssClass="normal" ID="tab_122_w16_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!16!4')">  <asp:Label CssClass="normal" ID="tab_122_w16_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!17!4')">  <asp:Label CssClass="normal" ID="tab_122_w16_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!18!4')">  <asp:Label CssClass="normal" ID="tab_122_w16_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!19!4')">  <asp:Label CssClass="normal" ID="tab_122_w16_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!20!4')">  <asp:Label CssClass="normal" ID="tab_122_w16_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!21!4')">  <asp:Label CssClass="normal" ID="tab_122_w16_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!22!4')">  <asp:Label CssClass="normal" ID="tab_122_w16_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!23!4')">  <asp:Label CssClass="normal" ID="tab_122_w16_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!24!4')">  <asp:Label CssClass="normal" ID="tab_122_w16_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!25!4')">  <asp:Label CssClass="normal" ID="tab_122_w16_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!26!4')">  <asp:Label CssClass="normal" ID="tab_122_w16_c26" runat="server" Text="0"></asp:Label>  </a></td>
		</tr>
		<tr>
				<td class="borderTopLeft wciecie" colspan="2"> umorzono na podstawie art. 50537§1 kpc</td>
				<td class="borderTopLeft col_29" >17</td>
			       <td class="borderLeft" >&nbsp;</td>
                   <td >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_122_w17_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_122_w17_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_122_w17_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_122_w17_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_122_w17_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_122_w17_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_122_w17_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!10!4')">  <asp:Label CssClass="normal" ID="tab_122_w17_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!11!4')">  <asp:Label CssClass="normal" ID="tab_122_w17_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!12!4')">  <asp:Label CssClass="normal" ID="tab_122_w17_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!13!4')">  <asp:Label CssClass="normal" ID="tab_122_w17_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!14!4')">  <asp:Label CssClass="normal" ID="tab_122_w17_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!15!4')">  <asp:Label CssClass="normal" ID="tab_122_w17_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!16!4')">  <asp:Label CssClass="normal" ID="tab_122_w17_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!17!4')">  <asp:Label CssClass="normal" ID="tab_122_w17_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!18!4')">  <asp:Label CssClass="normal" ID="tab_122_w17_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!19!4')">  <asp:Label CssClass="normal" ID="tab_122_w17_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!20!4')">  <asp:Label CssClass="normal" ID="tab_122_w17_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!21!4')">  <asp:Label CssClass="normal" ID="tab_122_w17_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!22!4')">  <asp:Label CssClass="normal" ID="tab_122_w17_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!23!4')">  <asp:Label CssClass="normal" ID="tab_122_w17_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!24!4')">  <asp:Label CssClass="normal" ID="tab_122_w17_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!25!4')">  <asp:Label CssClass="normal" ID="tab_122_w17_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!26!4')">  <asp:Label CssClass="normal" ID="tab_122_w17_c26" runat="server" Text="0"></asp:Label>  </a></td>

		</tr>
		<tr>
							<td class="borderTopLeft wciecie" colspan="2"> odrzucono pozew</td>
			<td class="borderTopLeft col_29" >18</td>
				   <td class="borderLeft" >&nbsp;</td>
                   <td >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_122_w18_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_122_w18_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_122_w18_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_122_w18_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_122_w18_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_122_w18_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_122_w18_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!10!4')">  <asp:Label CssClass="normal" ID="tab_122_w18_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!11!4')">  <asp:Label CssClass="normal" ID="tab_122_w18_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!12!4')">  <asp:Label CssClass="normal" ID="tab_122_w18_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!13!4')">  <asp:Label CssClass="normal" ID="tab_122_w18_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!14!4')">  <asp:Label CssClass="normal" ID="tab_122_w18_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!15!4')">  <asp:Label CssClass="normal" ID="tab_122_w18_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!16!4')">  <asp:Label CssClass="normal" ID="tab_122_w18_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!17!4')">  <asp:Label CssClass="normal" ID="tab_122_w18_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!18!4')">  <asp:Label CssClass="normal" ID="tab_122_w18_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!19!4')">  <asp:Label CssClass="normal" ID="tab_122_w18_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!20!4')">  <asp:Label CssClass="normal" ID="tab_122_w18_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!21!4')">  <asp:Label CssClass="normal" ID="tab_122_w18_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!22!4')">  <asp:Label CssClass="normal" ID="tab_122_w18_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!23!4')">  <asp:Label CssClass="normal" ID="tab_122_w18_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!24!4')">  <asp:Label CssClass="normal" ID="tab_122_w18_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!25!4')">  <asp:Label CssClass="normal" ID="tab_122_w18_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!26!4')">  <asp:Label CssClass="normal" ID="tab_122_w18_c26" runat="server" Text="0"></asp:Label>  </a></td>

		</tr>
		<tr>
				<td class="borderTopLeft wciecie" colspan="2"> inne</td>
			<td class="borderTopLeft col_29" >19</td>
				   <td class="borderLeft" >&nbsp;</td>
                   <td >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_122_w19_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_122_w19_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_122_w19_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_122_w19_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_122_w19_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_122_w19_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_122_w19_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!10!4')">  <asp:Label CssClass="normal" ID="tab_122_w19_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!11!4')">  <asp:Label CssClass="normal" ID="tab_122_w19_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!12!4')">  <asp:Label CssClass="normal" ID="tab_122_w19_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!13!4')">  <asp:Label CssClass="normal" ID="tab_122_w19_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!14!4')">  <asp:Label CssClass="normal" ID="tab_122_w19_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!15!4')">  <asp:Label CssClass="normal" ID="tab_122_w19_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!16!4')">  <asp:Label CssClass="normal" ID="tab_122_w19_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!17!4')">  <asp:Label CssClass="normal" ID="tab_122_w19_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!18!4')">  <asp:Label CssClass="normal" ID="tab_122_w19_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!19!4')">  <asp:Label CssClass="normal" ID="tab_122_w19_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!20!4')">  <asp:Label CssClass="normal" ID="tab_122_w19_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!21!4')">  <asp:Label CssClass="normal" ID="tab_122_w19_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!22!4')">  <asp:Label CssClass="normal" ID="tab_122_w19_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!23!4')">  <asp:Label CssClass="normal" ID="tab_122_w19_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!24!4')">  <asp:Label CssClass="normal" ID="tab_122_w19_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!25!4')">  <asp:Label CssClass="normal" ID="tab_122_w19_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!26!4')">  <asp:Label CssClass="normal" ID="tab_122_w19_c26" runat="server" Text="0"></asp:Label>  </a></td>

		</tr>
			<tr><td class="borderTopLeft wciecie" colspan="3"> Uo</td>
			<td class="borderTopLeft col_29" >20</td>
				   <td class="borderLeft" >&nbsp;</td>
                   <td >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_122_w20_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_122_w20_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_122_w20_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_122_w20_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_122_w20_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_122_w20_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_122_w20_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!10!4')">  <asp:Label CssClass="normal" ID="tab_122_w20_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!11!4')">  <asp:Label CssClass="normal" ID="tab_122_w20_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!12!4')">  <asp:Label CssClass="normal" ID="tab_122_w20_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!13!4')">  <asp:Label CssClass="normal" ID="tab_122_w20_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!14!4')">  <asp:Label CssClass="normal" ID="tab_122_w20_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!15!4')">  <asp:Label CssClass="normal" ID="tab_122_w20_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!16!4')">  <asp:Label CssClass="normal" ID="tab_122_w20_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!17!4')">  <asp:Label CssClass="normal" ID="tab_122_w20_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!18!4')">  <asp:Label CssClass="normal" ID="tab_122_w20_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!19!4')">  <asp:Label CssClass="normal" ID="tab_122_w20_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!20!4')">  <asp:Label CssClass="normal" ID="tab_122_w20_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!21!4')">  <asp:Label CssClass="normal" ID="tab_122_w20_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!22!4')">  <asp:Label CssClass="normal" ID="tab_122_w20_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!23!4')">  <asp:Label CssClass="normal" ID="tab_122_w20_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!24!4')">  <asp:Label CssClass="normal" ID="tab_122_w20_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!25!4')">  <asp:Label CssClass="normal" ID="tab_122_w20_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!26!4')">  <asp:Label CssClass="normal" ID="tab_122_w20_c26" runat="server" Text="0"></asp:Label>  </a></td>

		</tr>
		
		<tr><td class="borderTopLeft wciecie" colspan="3"> WSC (skargi o stwierdzenie niezgodności z prawem)</td>
			<td class="borderTopLeft col_29" >21</td>
                   <td class="borderLeft" >&nbsp;</td>
                   <td >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_122_w21_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_122_w21_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_122_w21_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_122_w21_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_122_w21_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_122_w21_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_122_w21_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!10!4')">  <asp:Label CssClass="normal" ID="tab_122_w21_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!11!4')">  <asp:Label CssClass="normal" ID="tab_122_w21_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!12!4')">  <asp:Label CssClass="normal" ID="tab_122_w21_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!13!4')">  <asp:Label CssClass="normal" ID="tab_122_w21_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!14!4')">  <asp:Label CssClass="normal" ID="tab_122_w21_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!15!4')">  <asp:Label CssClass="normal" ID="tab_122_w21_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!16!4')">  <asp:Label CssClass="normal" ID="tab_122_w21_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!17!4')">  <asp:Label CssClass="normal" ID="tab_122_w21_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!18!4')">  <asp:Label CssClass="normal" ID="tab_122_w21_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!19!4')">  <asp:Label CssClass="normal" ID="tab_122_w21_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!20!4')">  <asp:Label CssClass="normal" ID="tab_122_w21_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!21!4')">  <asp:Label CssClass="normal" ID="tab_122_w21_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!22!4')">  <asp:Label CssClass="normal" ID="tab_122_w21_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!23!4')">  <asp:Label CssClass="normal" ID="tab_122_w21_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!24!4')">  <asp:Label CssClass="normal" ID="tab_122_w21_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!25!4')">  <asp:Label CssClass="normal" ID="tab_122_w21_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!26!4')">  <asp:Label CssClass="normal" ID="tab_122_w21_c26" runat="server" Text="0"></asp:Label>  </a></td>
		</tr>
		<tr><td class="borderTopLeft wciecie" colspan="3"> Ogółem sprawy z zakresu prawa pracy (suma wierszy 23, 43 do 45) </td>
			<td class="borderTopLeft col_29" >22</td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!1!4')">  <asp:Label CssClass="normal" ID="tab_122_w22_c01" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!2!4')">  <asp:Label CssClass="normal" ID="tab_122_w22_c02" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_122_w22_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_122_w22_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_122_w22_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_122_w22_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_122_w22_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_122_w22_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_122_w22_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!10!4')">  <asp:Label CssClass="normal" ID="tab_122_w22_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!11!4')">  <asp:Label CssClass="normal" ID="tab_122_w22_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!12!4')">  <asp:Label CssClass="normal" ID="tab_122_w22_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!13!4')">  <asp:Label CssClass="normal" ID="tab_122_w22_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!14!4')">  <asp:Label CssClass="normal" ID="tab_122_w22_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!15!4')">  <asp:Label CssClass="normal" ID="tab_122_w22_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!16!4')">  <asp:Label CssClass="normal" ID="tab_122_w22_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!17!4')">  <asp:Label CssClass="normal" ID="tab_122_w22_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!18!4')">  <asp:Label CssClass="normal" ID="tab_122_w22_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!19!4')">  <asp:Label CssClass="normal" ID="tab_122_w22_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!20!4')">  <asp:Label CssClass="normal" ID="tab_122_w22_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!21!4')">  <asp:Label CssClass="normal" ID="tab_122_w22_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!22!4')">  <asp:Label CssClass="normal" ID="tab_122_w22_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!23!4')">  <asp:Label CssClass="normal" ID="tab_122_w22_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!24!4')">  <asp:Label CssClass="normal" ID="tab_122_w22_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!25!4')">  <asp:Label CssClass="normal" ID="tab_122_w22_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!26!4')">  <asp:Label CssClass="normal" ID="tab_122_w22_c26" runat="server" Text="0"></asp:Label>  </a></td>
		</tr>
		<tr><td class="borderTopLeft wciecie" colspan="3"> P</td>
			<td class="borderTopLeft col_29" >23</td>
                   <td class="borderLeft col_36" >&nbsp;</td>
                   <td >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_122_w23_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_122_w23_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_122_w23_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_122_w23_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_122_w23_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_122_w23_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_122_w23_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!10!4')">  <asp:Label CssClass="normal" ID="tab_122_w23_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!11!4')">  <asp:Label CssClass="normal" ID="tab_122_w23_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!12!4')">  <asp:Label CssClass="normal" ID="tab_122_w23_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!13!4')">  <asp:Label CssClass="normal" ID="tab_122_w23_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!14!4')">  <asp:Label CssClass="normal" ID="tab_122_w23_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!15!4')">  <asp:Label CssClass="normal" ID="tab_122_w23_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!16!4')">  <asp:Label CssClass="normal" ID="tab_122_w23_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!17!4')">  <asp:Label CssClass="normal" ID="tab_122_w23_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!18!4')">  <asp:Label CssClass="normal" ID="tab_122_w23_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!19!4')">  <asp:Label CssClass="normal" ID="tab_122_w23_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!20!4')">  <asp:Label CssClass="normal" ID="tab_122_w23_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!21!4')">  <asp:Label CssClass="normal" ID="tab_122_w23_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!22!4')">  <asp:Label CssClass="normal" ID="tab_122_w23_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!23!4')">  <asp:Label CssClass="normal" ID="tab_122_w23_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!24!4')">  <asp:Label CssClass="normal" ID="tab_122_w23_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!25!4')">  <asp:Label CssClass="normal" ID="tab_122_w23_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!26!4')">  <asp:Label CssClass="normal" ID="tab_122_w23_c26" runat="server" Text="0"></asp:Label>  </a></td>
		</tr>
		<tr><td class="borderTopLeft" rowspan="19"> </td>
					<td class="borderTopLeft wciecie" colspan="2"> zwrot pozwu </td>
			<td class="borderTopLeft col_29" >24</td>
                   <td class="borderLeft col_36" >&nbsp;</td>
                   <td >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_122_w24_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_122_w24_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_122_w24_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_122_w24_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_122_w24_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_122_w24_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_122_w24_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!10!4')">  <asp:Label CssClass="normal" ID="tab_122_w24_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!11!4')">  <asp:Label CssClass="normal" ID="tab_122_w24_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!12!4')">  <asp:Label CssClass="normal" ID="tab_122_w24_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!13!4')">  <asp:Label CssClass="normal" ID="tab_122_w24_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!14!4')">  <asp:Label CssClass="normal" ID="tab_122_w24_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!15!4')">  <asp:Label CssClass="normal" ID="tab_122_w24_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!16!4')">  <asp:Label CssClass="normal" ID="tab_122_w24_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!17!4')">  <asp:Label CssClass="normal" ID="tab_122_w24_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!18!4')">  <asp:Label CssClass="normal" ID="tab_122_w24_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!19!4')">  <asp:Label CssClass="normal" ID="tab_122_w24_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!20!4')">  <asp:Label CssClass="normal" ID="tab_122_w24_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!21!4')">  <asp:Label CssClass="normal" ID="tab_122_w24_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!22!4')">  <asp:Label CssClass="normal" ID="tab_122_w24_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!23!4')">  <asp:Label CssClass="normal" ID="tab_122_w24_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!24!4')">  <asp:Label CssClass="normal" ID="tab_122_w24_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!25!4')">  <asp:Label CssClass="normal" ID="tab_122_w24_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!26!4')">  <asp:Label CssClass="normal" ID="tab_122_w24_c26" runat="server" Text="0"></asp:Label>  </a></td>
		</tr>
		
	<tr>
					<td class="borderTopLeft wciecie" colspan="2"> przekazanie do innych jednostek na podstawie art. 200§1 kpc (z wyjątkiem zmian organizacyjnych)</td>
			<td class="borderTopLeft col_29" >25</td>
                   <td class="borderLeft col_36" >&nbsp;</td>
                   <td >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_122_w25_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_122_w25_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_122_w25_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_122_w25_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_122_w25_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_122_w25_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_122_w25_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!10!4')">  <asp:Label CssClass="normal" ID="tab_122_w25_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!11!4')">  <asp:Label CssClass="normal" ID="tab_122_w25_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!12!4')">  <asp:Label CssClass="normal" ID="tab_122_w25_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!13!4')">  <asp:Label CssClass="normal" ID="tab_122_w25_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!14!4')">  <asp:Label CssClass="normal" ID="tab_122_w25_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!15!4')">  <asp:Label CssClass="normal" ID="tab_122_w25_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!16!4')">  <asp:Label CssClass="normal" ID="tab_122_w25_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!17!4')">  <asp:Label CssClass="normal" ID="tab_122_w25_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!18!4')">  <asp:Label CssClass="normal" ID="tab_122_w25_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!19!4')">  <asp:Label CssClass="normal" ID="tab_122_w25_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!20!4')">  <asp:Label CssClass="normal" ID="tab_122_w25_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!21!4')">  <asp:Label CssClass="normal" ID="tab_122_w25_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!22!4')">  <asp:Label CssClass="normal" ID="tab_122_w25_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!23!4')">  <asp:Label CssClass="normal" ID="tab_122_w25_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!24!4')">  <asp:Label CssClass="normal" ID="tab_122_w25_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!25!4')">  <asp:Label CssClass="normal" ID="tab_122_w25_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!26!4')">  <asp:Label CssClass="normal" ID="tab_122_w25_c26" runat="server" Text="0"></asp:Label>  </a></td>
		</tr>
		<tr>
					<td class="borderTopLeft wciecie" colspan="2"> zakończono w trybie art. 339 kpc </td>
			<td class="borderTopLeft col_29" >26</td>
                   <td class="borderLeft col_36" >&nbsp;</td>
                   <td >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_122_w26_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_122_w26_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_122_w26_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_122_w26_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_122_w26_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_122_w26_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_122_w26_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!10!4')">  <asp:Label CssClass="normal" ID="tab_122_w26_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!11!4')">  <asp:Label CssClass="normal" ID="tab_122_w26_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!12!4')">  <asp:Label CssClass="normal" ID="tab_122_w26_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!13!4')">  <asp:Label CssClass="normal" ID="tab_122_w26_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!14!4')">  <asp:Label CssClass="normal" ID="tab_122_w26_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!15!4')">  <asp:Label CssClass="normal" ID="tab_122_w26_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!16!4')">  <asp:Label CssClass="normal" ID="tab_122_w26_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!17!4')">  <asp:Label CssClass="normal" ID="tab_122_w26_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!18!4')">  <asp:Label CssClass="normal" ID="tab_122_w26_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!19!4')">  <asp:Label CssClass="normal" ID="tab_122_w26_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!20!4')">  <asp:Label CssClass="normal" ID="tab_122_w26_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!21!4')">  <asp:Label CssClass="normal" ID="tab_122_w26_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!22!4')">  <asp:Label CssClass="normal" ID="tab_122_w26_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!23!4')">  <asp:Label CssClass="normal" ID="tab_122_w26_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!24!4')">  <asp:Label CssClass="normal" ID="tab_122_w26_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!25!4')">  <asp:Label CssClass="normal" ID="tab_122_w26_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!26!4')">  <asp:Label CssClass="normal" ID="tab_122_w26_c26" runat="server" Text="0"></asp:Label>  </a></td>
		</tr>
		<tr>
				<td class="borderTopLeft wciecie" colspan="2"> zakończono w trybie art. 341 kpc</td>
				<td class="borderTopLeft col_29" >27</td>
			       <td class="borderLeft col_36" >&nbsp;</td>
                   <td >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_122_w27_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_122_w27_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_122_w27_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_122_w27_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_122_w27_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_122_w27_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_122_w27_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!10!4')">  <asp:Label CssClass="normal" ID="tab_122_w27_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!11!4')">  <asp:Label CssClass="normal" ID="tab_122_w27_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!12!4')">  <asp:Label CssClass="normal" ID="tab_122_w27_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!13!4')">  <asp:Label CssClass="normal" ID="tab_122_w27_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!14!4')">  <asp:Label CssClass="normal" ID="tab_122_w27_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!15!4')">  <asp:Label CssClass="normal" ID="tab_122_w27_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!16!4')">  <asp:Label CssClass="normal" ID="tab_122_w27_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!17!4')">  <asp:Label CssClass="normal" ID="tab_122_w27_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!18!4')">  <asp:Label CssClass="normal" ID="tab_122_w27_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!19!4')">  <asp:Label CssClass="normal" ID="tab_122_w27_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!20!4')">  <asp:Label CssClass="normal" ID="tab_122_w27_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!21!4')">  <asp:Label CssClass="normal" ID="tab_122_w27_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!22!4')">  <asp:Label CssClass="normal" ID="tab_122_w27_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!23!4')">  <asp:Label CssClass="normal" ID="tab_122_w27_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!24!4')">  <asp:Label CssClass="normal" ID="tab_122_w27_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!25!4')">  <asp:Label CssClass="normal" ID="tab_122_w27_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!26!4')">  <asp:Label CssClass="normal" ID="tab_122_w27_c26" runat="server" Text="0"></asp:Label>  </a></td>

		</tr>
		<tr>
							<td class="borderTopLeft wciecie" colspan="2"> w wyniku zmian zarządzenia MS o biurowości</td>
			<td class="borderTopLeft col_29" >28</td>
				   <td class="borderLeft col_36" >&nbsp;</td>
                   <td >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_122_w28_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_122_w28_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_122_w28_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_122_w28_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_122_w28_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_122_w28_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_122_w28_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!10!4')">  <asp:Label CssClass="normal" ID="tab_122_w28_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!11!4')">  <asp:Label CssClass="normal" ID="tab_122_w28_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!12!4')">  <asp:Label CssClass="normal" ID="tab_122_w28_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!13!4')">  <asp:Label CssClass="normal" ID="tab_122_w28_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!14!4')">  <asp:Label CssClass="normal" ID="tab_122_w28_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!15!4')">  <asp:Label CssClass="normal" ID="tab_122_w28_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!16!4')">  <asp:Label CssClass="normal" ID="tab_122_w28_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!17!4')">  <asp:Label CssClass="normal" ID="tab_122_w28_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!18!4')">  <asp:Label CssClass="normal" ID="tab_122_w28_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!19!4')">  <asp:Label CssClass="normal" ID="tab_122_w28_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!20!4')">  <asp:Label CssClass="normal" ID="tab_122_w28_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!21!4')">  <asp:Label CssClass="normal" ID="tab_122_w28_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!22!4')">  <asp:Label CssClass="normal" ID="tab_122_w28_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!23!4')">  <asp:Label CssClass="normal" ID="tab_122_w28_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!24!4')">  <asp:Label CssClass="normal" ID="tab_122_w28_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!25!4')">  <asp:Label CssClass="normal" ID="tab_122_w28_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!26!4')">  <asp:Label CssClass="normal" ID="tab_122_w28_c26" runat="server" Text="0"></asp:Label>  </a></td>

		</tr>
		<tr>
				<td class="borderTopLeft wciecie" colspan="2"> w wyniku przekazania sprawy w ramach sądu pomiędzy wydziałami tego samego pionu</td>
			<td class="borderTopLeft col_29" >29</td>
				   <td class="borderLeft col_36" >&nbsp;</td>
                   <td >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_122_w29_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_122_w29_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_122_w29_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_122_w29_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_122_w29_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_122_w29_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_122_w29_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!10!4')">  <asp:Label CssClass="normal" ID="tab_122_w29_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!11!4')">  <asp:Label CssClass="normal" ID="tab_122_w29_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!12!4')">  <asp:Label CssClass="normal" ID="tab_122_w29_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!13!4')">  <asp:Label CssClass="normal" ID="tab_122_w29_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!14!4')">  <asp:Label CssClass="normal" ID="tab_122_w29_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!15!4')">  <asp:Label CssClass="normal" ID="tab_122_w29_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!16!4')">  <asp:Label CssClass="normal" ID="tab_122_w29_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!17!4')">  <asp:Label CssClass="normal" ID="tab_122_w29_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!18!4')">  <asp:Label CssClass="normal" ID="tab_122_w29_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!19!4')">  <asp:Label CssClass="normal" ID="tab_122_w29_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!20!4')">  <asp:Label CssClass="normal" ID="tab_122_w29_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!21!4')">  <asp:Label CssClass="normal" ID="tab_122_w29_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!22!4')">  <asp:Label CssClass="normal" ID="tab_122_w29_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!23!4')">  <asp:Label CssClass="normal" ID="tab_122_w29_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!24!4')">  <asp:Label CssClass="normal" ID="tab_122_w29_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!25!4')">  <asp:Label CssClass="normal" ID="tab_122_w29_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!26!4')">  <asp:Label CssClass="normal" ID="tab_122_w29_c26" runat="server" Text="0"></asp:Label>  </a></td>

		</tr>
		
		<tr>
				<td class="borderTopLeft wciecie" colspan="2"> w wyniku przekazania sprawy w ramach sądu pomiędzy wydziałami różnych pionów</td>
			<td class="borderTopLeft col_29" >30</td>
				   <td class="borderLeft col_36" >&nbsp;</td>
                   <td >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_122_w30_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_122_w30_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_122_w30_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_122_w30_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_122_w30_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_122_w30_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_122_w30_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!10!4')">  <asp:Label CssClass="normal" ID="tab_122_w30_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!11!4')">  <asp:Label CssClass="normal" ID="tab_122_w30_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!12!4')">  <asp:Label CssClass="normal" ID="tab_122_w30_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!13!4')">  <asp:Label CssClass="normal" ID="tab_122_w30_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!14!4')">  <asp:Label CssClass="normal" ID="tab_122_w30_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!15!4')">  <asp:Label CssClass="normal" ID="tab_122_w30_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!16!4')">  <asp:Label CssClass="normal" ID="tab_122_w30_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!17!4')">  <asp:Label CssClass="normal" ID="tab_122_w30_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!18!4')">  <asp:Label CssClass="normal" ID="tab_122_w30_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!19!4')">  <asp:Label CssClass="normal" ID="tab_122_w30_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!20!4')">  <asp:Label CssClass="normal" ID="tab_122_w30_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!21!4')">  <asp:Label CssClass="normal" ID="tab_122_w30_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!22!4')">  <asp:Label CssClass="normal" ID="tab_122_w30_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!23!4')">  <asp:Label CssClass="normal" ID="tab_122_w30_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!24!4')">  <asp:Label CssClass="normal" ID="tab_122_w30_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!25!4')">  <asp:Label CssClass="normal" ID="tab_122_w30_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!26!4')">  <asp:Label CssClass="normal" ID="tab_122_w30_c26" runat="server" Text="0"></asp:Label>  </a></td>

		</tr>
		
		<tr>
				<td class="borderTopLeft wciecie" rowspan="2"> zmiany organizacyjne związane z utworzeniem </td>
			<td class="borderTopLeft wciecie"> wydziału (ów)</td>
			<td class="borderTopLeft col_29" >31</td>
                   <td class="borderLeft col_36" >&nbsp;</td>
                   <td >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_122_w31_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_122_w31_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_122_w31_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_122_w31_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_122_w31_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_122_w31_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_122_w31_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!10!4')">  <asp:Label CssClass="normal" ID="tab_122_w31_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!11!4')">  <asp:Label CssClass="normal" ID="tab_122_w31_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!12!4')">  <asp:Label CssClass="normal" ID="tab_122_w31_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!13!4')">  <asp:Label CssClass="normal" ID="tab_122_w31_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!14!4')">  <asp:Label CssClass="normal" ID="tab_122_w31_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!15!4')">  <asp:Label CssClass="normal" ID="tab_122_w31_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!16!4')">  <asp:Label CssClass="normal" ID="tab_122_w31_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!17!4')">  <asp:Label CssClass="normal" ID="tab_122_w31_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!18!4')">  <asp:Label CssClass="normal" ID="tab_122_w31_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!19!4')">  <asp:Label CssClass="normal" ID="tab_122_w31_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!20!4')">  <asp:Label CssClass="normal" ID="tab_122_w31_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!21!4')">  <asp:Label CssClass="normal" ID="tab_122_w31_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!22!4')">  <asp:Label CssClass="normal" ID="tab_122_w31_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!23!4')">  <asp:Label CssClass="normal" ID="tab_122_w31_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!24!4')">  <asp:Label CssClass="normal" ID="tab_122_w31_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!25!4')">  <asp:Label CssClass="normal" ID="tab_122_w31_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!26!4')">  <asp:Label CssClass="normal" ID="tab_122_w31_c26" runat="server" Text="0"></asp:Label>  </a></td>
		</tr>
		<tr>
			<td class="borderTopLeft wciecie"> sądu (ów)</td>
			<td class="borderTopLeft col_29" >32</td>
                   <td class="borderLeft col_36" >&nbsp;</td>
                   <td >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_122_w32_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_122_w32_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_122_w32_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_122_w32_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_122_w32_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_122_w32_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_122_w32_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!10!4')">  <asp:Label CssClass="normal" ID="tab_122_w32_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!11!4')">  <asp:Label CssClass="normal" ID="tab_122_w32_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!12!4')">  <asp:Label CssClass="normal" ID="tab_122_w32_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!13!4')">  <asp:Label CssClass="normal" ID="tab_122_w32_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!14!4')">  <asp:Label CssClass="normal" ID="tab_122_w32_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!15!4')">  <asp:Label CssClass="normal" ID="tab_122_w32_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!16!4')">  <asp:Label CssClass="normal" ID="tab_122_w32_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!17!4')">  <asp:Label CssClass="normal" ID="tab_122_w32_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!18!4')">  <asp:Label CssClass="normal" ID="tab_122_w32_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!19!4')">  <asp:Label CssClass="normal" ID="tab_122_w32_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!20!4')">  <asp:Label CssClass="normal" ID="tab_122_w32_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!21!4')">  <asp:Label CssClass="normal" ID="tab_122_w32_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!22!4')">  <asp:Label CssClass="normal" ID="tab_122_w32_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!23!4')">  <asp:Label CssClass="normal" ID="tab_122_w32_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!24!4')">  <asp:Label CssClass="normal" ID="tab_122_w32_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!25!4')">  <asp:Label CssClass="normal" ID="tab_122_w32_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!26!4')">  <asp:Label CssClass="normal" ID="tab_122_w32_c26" runat="server" Text="0"></asp:Label>  </a></td>
		</tr>
		<tr>
			<td class="borderTopLeft wciecie" rowspan="2"> w związku ze zmianą obszaru właściwości miejscowej</td>
			<td class="borderTopLeft wciecie"> wydziału (ów)</td>
			<td class="borderTopLeft col_29" >33</td>
                   <td class="borderLeft col_36" >&nbsp;</td>
                   <td >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_122_w33_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_122_w33_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_122_w33_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_122_w33_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_122_w33_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_122_w33_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_122_w33_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!10!4')">  <asp:Label CssClass="normal" ID="tab_122_w33_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!11!4')">  <asp:Label CssClass="normal" ID="tab_122_w33_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!12!4')">  <asp:Label CssClass="normal" ID="tab_122_w33_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!13!4')">  <asp:Label CssClass="normal" ID="tab_122_w33_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!14!4')">  <asp:Label CssClass="normal" ID="tab_122_w33_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!15!4')">  <asp:Label CssClass="normal" ID="tab_122_w33_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!16!4')">  <asp:Label CssClass="normal" ID="tab_122_w33_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!17!4')">  <asp:Label CssClass="normal" ID="tab_122_w33_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!18!4')">  <asp:Label CssClass="normal" ID="tab_122_w33_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!19!4')">  <asp:Label CssClass="normal" ID="tab_122_w33_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!20!4')">  <asp:Label CssClass="normal" ID="tab_122_w33_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!21!4')">  <asp:Label CssClass="normal" ID="tab_122_w33_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!22!4')">  <asp:Label CssClass="normal" ID="tab_122_w33_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!23!4')">  <asp:Label CssClass="normal" ID="tab_122_w33_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!24!4')">  <asp:Label CssClass="normal" ID="tab_122_w33_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!25!4')">  <asp:Label CssClass="normal" ID="tab_122_w33_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!26!4')">  <asp:Label CssClass="normal" ID="tab_122_w33_c26" runat="server" Text="0"></asp:Label>  </a></td>
		</tr>
		<tr>
			<td class="borderTopLeft wciecie"> sądu (ów)</td>
			<td class="borderTopLeft col_29" >34</td>
                   <td class="borderLeft col_36" >&nbsp;</td>
                   <td >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_122_w34_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_122_w34_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_122_w34_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_122_w34_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_122_w34_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_122_w34_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_122_w34_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!10!4')">  <asp:Label CssClass="normal" ID="tab_122_w34_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!11!4')">  <asp:Label CssClass="normal" ID="tab_122_w34_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!12!4')">  <asp:Label CssClass="normal" ID="tab_122_w34_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!13!4')">  <asp:Label CssClass="normal" ID="tab_122_w34_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!14!4')">  <asp:Label CssClass="normal" ID="tab_122_w34_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!15!4')">  <asp:Label CssClass="normal" ID="tab_122_w34_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!16!4')">  <asp:Label CssClass="normal" ID="tab_122_w34_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!17!4')">  <asp:Label CssClass="normal" ID="tab_122_w34_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!18!4')">  <asp:Label CssClass="normal" ID="tab_122_w34_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!19!4')">  <asp:Label CssClass="normal" ID="tab_122_w34_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!20!4')">  <asp:Label CssClass="normal" ID="tab_122_w34_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!21!4')">  <asp:Label CssClass="normal" ID="tab_122_w34_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!22!4')">  <asp:Label CssClass="normal" ID="tab_122_w34_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!23!4')">  <asp:Label CssClass="normal" ID="tab_122_w34_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!24!4')">  <asp:Label CssClass="normal" ID="tab_122_w34_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!25!4')">  <asp:Label CssClass="normal" ID="tab_122_w34_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!26!4')">  <asp:Label CssClass="normal" ID="tab_122_w34_c26" runat="server" Text="0"></asp:Label>  </a></td>
		</tr>
		
	<tr>
					<td class="borderTopLeft wciecie" colspan="2"> połączono do wspólnego rozpoznania na podstawie art. 219 kpc</td>
			<td class="borderTopLeft col_29" >35</td>
                   <td class="borderLeft col_36" >&nbsp;</td>
                   <td >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_122_w35_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_122_w35_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_122_w35_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_122_w35_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_122_w35_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_122_w35_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_122_w35_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!10!4')">  <asp:Label CssClass="normal" ID="tab_122_w35_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!11!4')">  <asp:Label CssClass="normal" ID="tab_122_w35_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!12!4')">  <asp:Label CssClass="normal" ID="tab_122_w35_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!13!4')">  <asp:Label CssClass="normal" ID="tab_122_w35_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!14!4')">  <asp:Label CssClass="normal" ID="tab_122_w35_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!15!4')">  <asp:Label CssClass="normal" ID="tab_122_w35_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!16!4')">  <asp:Label CssClass="normal" ID="tab_122_w35_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!17!4')">  <asp:Label CssClass="normal" ID="tab_122_w35_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!18!4')">  <asp:Label CssClass="normal" ID="tab_122_w35_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!19!4')">  <asp:Label CssClass="normal" ID="tab_122_w35_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!20!4')">  <asp:Label CssClass="normal" ID="tab_122_w35_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!21!4')">  <asp:Label CssClass="normal" ID="tab_122_w35_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!22!4')">  <asp:Label CssClass="normal" ID="tab_122_w35_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!23!4')">  <asp:Label CssClass="normal" ID="tab_122_w35_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!24!4')">  <asp:Label CssClass="normal" ID="tab_122_w35_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!25!4')">  <asp:Label CssClass="normal" ID="tab_122_w35_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!26!4')">  <asp:Label CssClass="normal" ID="tab_122_w35_c26" runat="server" Text="0"></asp:Label>  </a></td>
		</tr>
		<tr>
					<td class="borderTopLeft wciecie" colspan="2"> zakreślone w wyniku zmiany trybu lub rodzaju postępowania (art. 201 § 1 i 2 kpc)</td>
			<td class="borderTopLeft col_29" >36</td>
                   <td class="borderLeft col_36" >&nbsp;</td>
                   <td >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_122_w36_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_122_w36_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_122_w36_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_122_w36_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_122_w36_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_122_w36_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_122_w36_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!10!4')">  <asp:Label CssClass="normal" ID="tab_122_w36_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!11!4')">  <asp:Label CssClass="normal" ID="tab_122_w36_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!12!4')">  <asp:Label CssClass="normal" ID="tab_122_w36_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!13!4')">  <asp:Label CssClass="normal" ID="tab_122_w36_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!14!4')">  <asp:Label CssClass="normal" ID="tab_122_w36_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!15!4')">  <asp:Label CssClass="normal" ID="tab_122_w36_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!16!4')">  <asp:Label CssClass="normal" ID="tab_122_w36_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!17!4')">  <asp:Label CssClass="normal" ID="tab_122_w36_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!18!4')">  <asp:Label CssClass="normal" ID="tab_122_w36_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!19!4')">  <asp:Label CssClass="normal" ID="tab_122_w36_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!20!4')">  <asp:Label CssClass="normal" ID="tab_122_w36_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!21!4')">  <asp:Label CssClass="normal" ID="tab_122_w36_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!22!4')">  <asp:Label CssClass="normal" ID="tab_122_w36_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!23!4')">  <asp:Label CssClass="normal" ID="tab_122_w36_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!24!4')">  <asp:Label CssClass="normal" ID="tab_122_w36_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!25!4')">  <asp:Label CssClass="normal" ID="tab_122_w36_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!26!4')">  <asp:Label CssClass="normal" ID="tab_122_w36_c26" runat="server" Text="0"></asp:Label>  </a></td>
		</tr>
		<tr>
				<td class="borderTopLeft wciecie" colspan="2"> zakreślono na podstawie art. 174 §1 pkt 1 kpc</td>
				<td class="borderTopLeft col_29" >37</td>
			       <td class="borderLeft col_36" >&nbsp;</td>
                   <td >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_122_w37_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_122_w37_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_122_w37_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_122_w37_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_122_w37_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_122_w37_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_122_w37_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!10!4')">  <asp:Label CssClass="normal" ID="tab_122_w37_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!11!4')">  <asp:Label CssClass="normal" ID="tab_122_w37_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!12!4')">  <asp:Label CssClass="normal" ID="tab_122_w37_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!13!4')">  <asp:Label CssClass="normal" ID="tab_122_w37_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!14!4')">  <asp:Label CssClass="normal" ID="tab_122_w37_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!15!4')">  <asp:Label CssClass="normal" ID="tab_122_w37_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!16!4')">  <asp:Label CssClass="normal" ID="tab_122_w37_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!17!4')">  <asp:Label CssClass="normal" ID="tab_122_w37_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!18!4')">  <asp:Label CssClass="normal" ID="tab_122_w37_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!19!4')">  <asp:Label CssClass="normal" ID="tab_122_w37_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!20!4')">  <asp:Label CssClass="normal" ID="tab_122_w37_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!21!4')">  <asp:Label CssClass="normal" ID="tab_122_w37_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!22!4')">  <asp:Label CssClass="normal" ID="tab_122_w37_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!23!4')">  <asp:Label CssClass="normal" ID="tab_122_w37_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!24!4')">  <asp:Label CssClass="normal" ID="tab_122_w37_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!25!4')">  <asp:Label CssClass="normal" ID="tab_122_w37_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!26!4')">  <asp:Label CssClass="normal" ID="tab_122_w37_c26" runat="server" Text="0"></asp:Label>  </a></td>

		</tr>
		<tr>
							<td class="borderTopLeft wciecie" colspan="2"> zakreślono na podstawie art. 174 §1 pkt 4 kpc</td>
			<td class="borderTopLeft col_29" >38</td>
				   <td class="borderLeft col_36" >&nbsp;</td>
                   <td >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=38!1.2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_122_w38_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=38!1.2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_122_w38_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=38!1.2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_122_w38_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=38!1.2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_122_w38_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=38!1.2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_122_w38_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=38!1.2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_122_w38_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=38!1.2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_122_w38_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=38!1.2.2!10!4')">  <asp:Label CssClass="normal" ID="tab_122_w38_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=38!1.2.2!11!4')">  <asp:Label CssClass="normal" ID="tab_122_w38_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=38!1.2.2!12!4')">  <asp:Label CssClass="normal" ID="tab_122_w38_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=38!1.2.2!13!4')">  <asp:Label CssClass="normal" ID="tab_122_w38_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=38!1.2.2!14!4')">  <asp:Label CssClass="normal" ID="tab_122_w38_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=38!1.2.2!15!4')">  <asp:Label CssClass="normal" ID="tab_122_w38_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=38!1.2.2!16!4')">  <asp:Label CssClass="normal" ID="tab_122_w38_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=38!1.2.2!17!4')">  <asp:Label CssClass="normal" ID="tab_122_w38_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=38!1.2.2!18!4')">  <asp:Label CssClass="normal" ID="tab_122_w38_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=38!1.2.2!19!4')">  <asp:Label CssClass="normal" ID="tab_122_w38_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=38!1.2.2!20!4')">  <asp:Label CssClass="normal" ID="tab_122_w38_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=38!1.2.2!21!4')">  <asp:Label CssClass="normal" ID="tab_122_w38_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=38!1.2.2!22!4')">  <asp:Label CssClass="normal" ID="tab_122_w38_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=38!1.2.2!23!4')">  <asp:Label CssClass="normal" ID="tab_122_w38_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=38!1.2.2!24!4')">  <asp:Label CssClass="normal" ID="tab_122_w38_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=38!1.2.2!25!4')">  <asp:Label CssClass="normal" ID="tab_122_w38_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=38!1.2.2!26!4')">  <asp:Label CssClass="normal" ID="tab_122_w38_c26" runat="server" Text="0"></asp:Label>  </a></td>

		</tr>
		<tr>
				<td class="borderTopLeft wciecie" colspan="2"> zakreślenie omyłkowych wpisów</td>
			<td class="borderTopLeft col_29" >39</td>
				   <td class="borderLeft col_36" >&nbsp;</td>
                   <td >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=39!1.2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_122_w39_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=39!1.2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_122_w39_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=39!1.2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_122_w39_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=39!1.2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_122_w39_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=39!1.2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_122_w39_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=39!1.2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_122_w39_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=39!1.2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_122_w39_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=39!1.2.2!10!4')">  <asp:Label CssClass="normal" ID="tab_122_w39_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=39!1.2.2!11!4')">  <asp:Label CssClass="normal" ID="tab_122_w39_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=39!1.2.2!12!4')">  <asp:Label CssClass="normal" ID="tab_122_w39_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=39!1.2.2!13!4')">  <asp:Label CssClass="normal" ID="tab_122_w39_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=39!1.2.2!14!4')">  <asp:Label CssClass="normal" ID="tab_122_w39_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=39!1.2.2!15!4')">  <asp:Label CssClass="normal" ID="tab_122_w39_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=39!1.2.2!16!4')">  <asp:Label CssClass="normal" ID="tab_122_w39_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=39!1.2.2!17!4')">  <asp:Label CssClass="normal" ID="tab_122_w39_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=39!1.2.2!18!4')">  <asp:Label CssClass="normal" ID="tab_122_w39_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=39!1.2.2!19!4')">  <asp:Label CssClass="normal" ID="tab_122_w39_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=39!1.2.2!20!4')">  <asp:Label CssClass="normal" ID="tab_122_w39_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=39!1.2.2!21!4')">  <asp:Label CssClass="normal" ID="tab_122_w39_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=39!1.2.2!22!4')">  <asp:Label CssClass="normal" ID="tab_122_w39_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=39!1.2.2!23!4')">  <asp:Label CssClass="normal" ID="tab_122_w39_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=39!1.2.2!24!4')">  <asp:Label CssClass="normal" ID="tab_122_w39_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=39!1.2.2!25!4')">  <asp:Label CssClass="normal" ID="tab_122_w39_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=39!1.2.2!26!4')">  <asp:Label CssClass="normal" ID="tab_122_w39_c26" runat="server" Text="0"></asp:Label>  </a></td>

		</tr>
		
		<tr>
				<td class="borderTopLeft wciecie" colspan="2"> umorzono na podstawie art. 50537§1 kpc</td>
			<td class="borderTopLeft col_29" >40</td>
				   <td class="borderLeft col_36" >&nbsp;</td>
                   <td >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=40!1.2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_122_w40_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=40!1.2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_122_w40_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=40!1.2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_122_w40_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=40!1.2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_122_w40_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=40!1.2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_122_w40_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=40!1.2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_122_w40_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=40!1.2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_122_w40_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=40!1.2.2!10!4')">  <asp:Label CssClass="normal" ID="tab_122_w40_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=40!1.2.2!11!4')">  <asp:Label CssClass="normal" ID="tab_122_w40_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=40!1.2.2!12!4')">  <asp:Label CssClass="normal" ID="tab_122_w40_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=40!1.2.2!13!4')">  <asp:Label CssClass="normal" ID="tab_122_w40_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=40!1.2.2!14!4')">  <asp:Label CssClass="normal" ID="tab_122_w40_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=40!1.2.2!15!4')">  <asp:Label CssClass="normal" ID="tab_122_w40_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=40!1.2.2!16!4')">  <asp:Label CssClass="normal" ID="tab_122_w40_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=40!1.2.2!17!4')">  <asp:Label CssClass="normal" ID="tab_122_w40_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=40!1.2.2!18!4')">  <asp:Label CssClass="normal" ID="tab_122_w40_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=40!1.2.2!19!4')">  <asp:Label CssClass="normal" ID="tab_122_w40_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=40!1.2.2!20!4')">  <asp:Label CssClass="normal" ID="tab_122_w40_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=40!1.2.2!21!4')">  <asp:Label CssClass="normal" ID="tab_122_w40_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=40!1.2.2!22!4')">  <asp:Label CssClass="normal" ID="tab_122_w40_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=40!1.2.2!23!4')">  <asp:Label CssClass="normal" ID="tab_122_w40_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=40!1.2.2!24!4')">  <asp:Label CssClass="normal" ID="tab_122_w40_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=40!1.2.2!25!4')">  <asp:Label CssClass="normal" ID="tab_122_w40_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=40!1.2.2!26!4')">  <asp:Label CssClass="normal" ID="tab_122_w40_c26" runat="server" Text="0"></asp:Label>  </a></td>

		</tr>
		
		<tr>
			<td class="borderTopLeft wciecie" colspan="2"> odrzucono pozew</td>
			<td class="borderTopLeft col_29" >41</td>
                   <td class="borderLeft col_36" >&nbsp;</td>
                   <td >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=41!1.2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_122_w41_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=41!1.2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_122_w41_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=41!1.2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_122_w41_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=41!1.2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_122_w41_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=41!1.2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_122_w41_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=41!1.2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_122_w41_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=41!1.2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_122_w41_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=41!1.2.2!10!4')">  <asp:Label CssClass="normal" ID="tab_122_w41_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=41!1.2.2!11!4')">  <asp:Label CssClass="normal" ID="tab_122_w41_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=41!1.2.2!12!4')">  <asp:Label CssClass="normal" ID="tab_122_w41_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=41!1.2.2!13!4')">  <asp:Label CssClass="normal" ID="tab_122_w41_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=41!1.2.2!14!4')">  <asp:Label CssClass="normal" ID="tab_122_w41_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=41!1.2.2!15!4')">  <asp:Label CssClass="normal" ID="tab_122_w41_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=41!1.2.2!16!4')">  <asp:Label CssClass="normal" ID="tab_122_w41_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=41!1.2.2!17!4')">  <asp:Label CssClass="normal" ID="tab_122_w41_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=41!1.2.2!18!4')">  <asp:Label CssClass="normal" ID="tab_122_w41_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=41!1.2.2!19!4')">  <asp:Label CssClass="normal" ID="tab_122_w41_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=41!1.2.2!20!4')">  <asp:Label CssClass="normal" ID="tab_122_w41_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=41!1.2.2!21!4')">  <asp:Label CssClass="normal" ID="tab_122_w41_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=41!1.2.2!22!4')">  <asp:Label CssClass="normal" ID="tab_122_w41_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=41!1.2.2!23!4')">  <asp:Label CssClass="normal" ID="tab_122_w41_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=41!1.2.2!24!4')">  <asp:Label CssClass="normal" ID="tab_122_w41_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=41!1.2.2!25!4')">  <asp:Label CssClass="normal" ID="tab_122_w41_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=41!1.2.2!26!4')">  <asp:Label CssClass="normal" ID="tab_122_w41_c26" runat="server" Text="0"></asp:Label>  </a></td>
		</tr>
		<tr>
			<td class="borderTopLeft wciecie" colspan="2"> inne</td>
			<td class="borderTopLeft col_29" >42</td>
                   <td class="borderLeft col_36" >&nbsp;</td>
                   <td >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=42!1.2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_122_w42_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=42!1.2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_122_w42_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=42!1.2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_122_w42_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=42!1.2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_122_w42_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=42!1.2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_122_w42_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=42!1.2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_122_w42_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=42!1.2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_122_w42_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=42!1.2.2!10!4')">  <asp:Label CssClass="normal" ID="tab_122_w42_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=42!1.2.2!11!4')">  <asp:Label CssClass="normal" ID="tab_122_w42_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=42!1.2.2!12!4')">  <asp:Label CssClass="normal" ID="tab_122_w42_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=42!1.2.2!13!4')">  <asp:Label CssClass="normal" ID="tab_122_w42_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=42!1.2.2!14!4')">  <asp:Label CssClass="normal" ID="tab_122_w42_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=42!1.2.2!15!4')">  <asp:Label CssClass="normal" ID="tab_122_w42_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=42!1.2.2!16!4')">  <asp:Label CssClass="normal" ID="tab_122_w42_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=42!1.2.2!17!4')">  <asp:Label CssClass="normal" ID="tab_122_w42_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=42!1.2.2!18!4')">  <asp:Label CssClass="normal" ID="tab_122_w42_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=42!1.2.2!19!4')">  <asp:Label CssClass="normal" ID="tab_122_w42_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=42!1.2.2!20!4')">  <asp:Label CssClass="normal" ID="tab_122_w42_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=42!1.2.2!21!4')">  <asp:Label CssClass="normal" ID="tab_122_w42_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=42!1.2.2!22!4')">  <asp:Label CssClass="normal" ID="tab_122_w42_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=42!1.2.2!23!4')">  <asp:Label CssClass="normal" ID="tab_122_w42_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=42!1.2.2!24!4')">  <asp:Label CssClass="normal" ID="tab_122_w42_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=42!1.2.2!25!4')">  <asp:Label CssClass="normal" ID="tab_122_w42_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=42!1.2.2!26!4')">  <asp:Label CssClass="normal" ID="tab_122_w42_c26" runat="server" Text="0"></asp:Label>  </a></td>
		</tr>
		<tr><td class="borderTopLeft wciecie" colspan="3"> Np.</td>
			<td class="borderTopLeft col_29" >43</td>
                   <td class="borderLeft col_36" >&nbsp;</td>
                   <td >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=43!1.2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_122_w43_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=43!1.2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_122_w43_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=43!1.2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_122_w43_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=43!1.2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_122_w43_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=43!1.2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_122_w43_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=43!1.2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_122_w43_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=43!1.2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_122_w43_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=43!1.2.2!10!4')">  <asp:Label CssClass="normal" ID="tab_122_w43_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=43!1.2.2!11!4')">  <asp:Label CssClass="normal" ID="tab_122_w43_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=43!1.2.2!12!4')">  <asp:Label CssClass="normal" ID="tab_122_w43_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=43!1.2.2!13!4')">  <asp:Label CssClass="normal" ID="tab_122_w43_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=43!1.2.2!14!4')">  <asp:Label CssClass="normal" ID="tab_122_w43_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=43!1.2.2!15!4')">  <asp:Label CssClass="normal" ID="tab_122_w43_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=43!1.2.2!16!4')">  <asp:Label CssClass="normal" ID="tab_122_w43_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=43!1.2.2!17!4')">  <asp:Label CssClass="normal" ID="tab_122_w43_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=43!1.2.2!18!4')">  <asp:Label CssClass="normal" ID="tab_122_w43_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=43!1.2.2!19!4')">  <asp:Label CssClass="normal" ID="tab_122_w43_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=43!1.2.2!20!4')">  <asp:Label CssClass="normal" ID="tab_122_w43_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=43!1.2.2!21!4')">  <asp:Label CssClass="normal" ID="tab_122_w43_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=43!1.2.2!22!4')">  <asp:Label CssClass="normal" ID="tab_122_w43_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=43!1.2.2!23!4')">  <asp:Label CssClass="normal" ID="tab_122_w43_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=43!1.2.2!24!4')">  <asp:Label CssClass="normal" ID="tab_122_w43_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=43!1.2.2!25!4')">  <asp:Label CssClass="normal" ID="tab_122_w43_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=43!1.2.2!26!4')">  <asp:Label CssClass="normal" ID="tab_122_w43_c26" runat="server" Text="0"></asp:Label>  </a></td>
		</tr>
		<tr><td class="borderTopLeft wciecie" colspan="3"> Po</td>
			<td class="borderTopLeft col_29" >44</td>
                   <td class="borderLeft col_36" >&nbsp;</td>
                   <td >&nbsp;</td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=44!1.2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_122_w44_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=44!1.2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_122_w44_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=44!1.2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_122_w44_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=44!1.2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_122_w44_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=44!1.2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_122_w44_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=44!1.2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_122_w44_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=44!1.2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_122_w44_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=44!1.2.2!10!4')">  <asp:Label CssClass="normal" ID="tab_122_w44_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=44!1.2.2!11!4')">  <asp:Label CssClass="normal" ID="tab_122_w44_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=44!1.2.2!12!4')">  <asp:Label CssClass="normal" ID="tab_122_w44_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=44!1.2.2!13!4')">  <asp:Label CssClass="normal" ID="tab_122_w44_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=44!1.2.2!14!4')">  <asp:Label CssClass="normal" ID="tab_122_w44_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=44!1.2.2!15!4')">  <asp:Label CssClass="normal" ID="tab_122_w44_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=44!1.2.2!16!4')">  <asp:Label CssClass="normal" ID="tab_122_w44_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=44!1.2.2!17!4')">  <asp:Label CssClass="normal" ID="tab_122_w44_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=44!1.2.2!18!4')">  <asp:Label CssClass="normal" ID="tab_122_w44_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=44!1.2.2!19!4')">  <asp:Label CssClass="normal" ID="tab_122_w44_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=44!1.2.2!20!4')">  <asp:Label CssClass="normal" ID="tab_122_w44_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=44!1.2.2!21!4')">  <asp:Label CssClass="normal" ID="tab_122_w44_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=44!1.2.2!22!4')">  <asp:Label CssClass="normal" ID="tab_122_w44_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=44!1.2.2!23!4')">  <asp:Label CssClass="normal" ID="tab_122_w44_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=44!1.2.2!24!4')">  <asp:Label CssClass="normal" ID="tab_122_w44_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeft col_36" ><a href="javascript:openPopup('popup.aspx?sesja=44!1.2.2!25!4')">  <asp:Label CssClass="normal" ID="tab_122_w44_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftRight col_36" ><a href="javascript:openPopup('popup.aspx?sesja=44!1.2.2!26!4')">  <asp:Label CssClass="normal" ID="tab_122_w44_c26" runat="server" Text="0"></asp:Label>  </a></td>
		</tr>
		
	<tr><td class="borderTopLeftBottom wciecie" colspan="3"> WSC (skargi o stwierdzenie niezgodności z prawem)</td>
			<td class="borderTopLeftBottom" >45</td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=45!1.2.2!1!4')">  <asp:Label CssClass="normal" ID="tab_122_w45_c01" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom"  >&nbsp;</td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=45!1.2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_122_w45_c03" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=45!1.2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_122_w45_c04" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=45!1.2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_122_w45_c05" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=45!1.2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_122_w45_c06" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=45!1.2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_122_w45_c07" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=45!1.2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_122_w45_c08" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=45!1.2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_122_w45_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=45!1.2.2!10!4')">  <asp:Label CssClass="normal" ID="tab_122_w45_c10" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=45!1.2.2!11!4')">  <asp:Label CssClass="normal" ID="tab_122_w45_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=45!1.2.2!12!4')">  <asp:Label CssClass="normal" ID="tab_122_w45_c12" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=45!1.2.2!13!4')">  <asp:Label CssClass="normal" ID="tab_122_w45_c13" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=45!1.2.2!14!4')">  <asp:Label CssClass="normal" ID="tab_122_w45_c14" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=45!1.2.2!15!4')">  <asp:Label CssClass="normal" ID="tab_122_w45_c15" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=45!1.2.2!16!4')">  <asp:Label CssClass="normal" ID="tab_122_w45_c16" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=45!1.2.2!17!4')">  <asp:Label CssClass="normal" ID="tab_122_w45_c17" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=45!1.2.2!18!4')">  <asp:Label CssClass="normal" ID="tab_122_w45_c18" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=45!1.2.2!19!4')">  <asp:Label CssClass="normal" ID="tab_122_w45_c19" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=45!1.2.2!20!4')">  <asp:Label CssClass="normal" ID="tab_122_w45_c20" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=45!1.2.2!21!4')">  <asp:Label CssClass="normal" ID="tab_122_w45_c21" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=45!1.2.2!22!4')">  <asp:Label CssClass="normal" ID="tab_122_w45_c22" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=45!1.2.2!23!4')">  <asp:Label CssClass="normal" ID="tab_122_w45_c23" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=45!1.2.2!24!4')">  <asp:Label CssClass="normal" ID="tab_122_w45_c24" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderTopLeftBottom col_36" ><a href="javascript:openPopup('popup.aspx?sesja=45!1.2.2!25!4')">  <asp:Label CssClass="normal" ID="tab_122_w45_c25" runat="server" Text="0"></asp:Label>  </a></td>
                   <td class="borderAll col_36" ><a href="javascript:openPopup('popup.aspx?sesja=45!1.2.2!26!4')">  <asp:Label CssClass="normal" ID="tab_122_w45_c26" runat="server" Text="0"></asp:Label>  </a></td>
		</tr>
		
		
	</tbody>
</table>

              </div>

       <div class="page-break">







           <strong>
           <br />
           Dział 1.3</strong> Załatwienie spraw przez referendarzy<br />







           <br />







           <table cellpadding="0" cellspacing="0" class="auto-style14">
               <tr>
                   <td class="borderTopLeft " align="center" colspan="2" rowspan="2">Wyszczególnie</td>
                   <td class="borderTopLeftRight" align="center" colspan="10">Liczba spraw załatwionych przez referendarzy</td>
               </tr>
               <tr>
                   <td class="borderTopLeft col_110" align="center">ogółem spraw z zakresu prawa pracy i ubezpieczeń społecznych (kol. 2 + 6)</td>
                   <td class="borderTopLeft col_110" align="center">ogółem sprawy z zakresu ubezpieczeń społecznych (kol. 3 do 5) </td>
                   <td class="borderTopLeft col_110" align="center">rep. U</td>
                   <td class="borderTopLeft col_110" align="center">rep. Uo</td>
                   <td class="borderTopLeft col_110" align="center">inne</td>
                   <td class="borderTopLeft col_110" align="center">ogółem sprawy z zakresu prawa pracy (kol. od 7 do 10) </td>
                   <td class="borderTopLeft col_110" align="center">rep. P</td>
                   <td class="borderTopLeft col_110" align="center">rep. Np</td>
                   <td class="borderTopLeft col_110" align="center">rep. Po</td>
                   <td class="borderTopLeftRight col_110" align="center">inne</td>
               </tr>
               <tr>
                   <td class="borderTopLeft col_76" align="center" colspan="2">0</td>
                   <td class="borderTopLeft col_110" align="center">1</td>
                   <td class="borderTopLeft col_110" align="center">2</td>
                   <td class="borderTopLeft col_110" align="center">3</td>
                   <td class="borderTopLeft col_110" align="center">4</td>
                   <td class="borderTopLeft col_110" align="center">5</td>
                   <td class="borderTopLeft col_110" align="center">6</td>
                   <td class="borderTopLeft col_110" align="center">7</td>
                   <td class="borderTopLeft col_110" align="center">8</td>
                   <td class="borderTopLeft col_110" align="center">9</td>
                   <td class="borderTopLeftRight col_110" align="center">10</td>
               </tr>
               <tr>
                   <td class="wciecie borderTopLeft col_125">U razem (w. 02 do 09)</td>
                   <td class="borderTopLeft col_36">01</td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!1.3!1!4')">  <asp:Label CssClass="normal" ID="tab_13_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!1.3!2!4')">  <asp:Label CssClass="normal" ID="tab_13_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!1.3!3!4')">  <asp:Label CssClass="normal" ID="tab_13_w01_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!1.3!4!4')">  <asp:Label CssClass="normal" ID="tab_13_w01_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!1.3!5!4')">  <asp:Label CssClass="normal" ID="tab_13_w01_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!1.3!6!4')">  <asp:Label CssClass="normal" ID="tab_13_w01_c06" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!1.3!7!4')">  <asp:Label CssClass="normal" ID="tab_13_w01_c07" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!1.3!8!4')">  <asp:Label CssClass="normal" ID="tab_13_w01_c08" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!1.3!9!4')">  <asp:Label CssClass="normal" ID="tab_13_w01_c09" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftRight col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!1.3!10!4')">  <asp:Label CssClass="normal" ID="tab_13_w01_c10" runat="server" Text="0"></asp:Label>  </a></td>
                  
                           </tr>
               <tr>
                   <td class="wciecie borderTopLeft col_125">Oddział Zakładu Ubezpieczeń Społecznych</td>
                   <td class="borderTopLeft col_36">02</td>
                   <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!1.3!1!4')">  <asp:Label CssClass="normal" ID="tab_13_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!1.3!2!4')">  <asp:Label CssClass="normal" ID="tab_13_w02_c02" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!1.3!3!4')">  <asp:Label CssClass="normal" ID="tab_13_w02_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!1.3!4!4')">  <asp:Label CssClass="normal" ID="tab_13_w02_c04" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!1.3!5!4')">  <asp:Label CssClass="normal" ID="tab_13_w02_c05" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!1.3!6!4')">  <asp:Label CssClass="normal" ID="tab_13_w02_c06" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!1.3!7!4')">  <asp:Label CssClass="normal" ID="tab_13_w02_c07" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!1.3!8!4')">  <asp:Label CssClass="normal" ID="tab_13_w02_c08" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!1.3!9!4')">  <asp:Label CssClass="normal" ID="tab_13_w02_c09" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeftRight col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!1.3!10!4')">  <asp:Label CssClass="normal" ID="tab_13_w02_c10" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
               <tr>
                   <td class="wciecie borderTopLeft col_125">Wojskowy organ emerytalny</td>
                   <td class="borderTopLeft col_36">03</td>
                <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!1.3!1!4')">  <asp:Label CssClass="normal" ID="tab_13_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!1.3!2!4')">  <asp:Label CssClass="normal" ID="tab_13_w03_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!1.3!3!4')">  <asp:Label CssClass="normal" ID="tab_13_w03_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!1.3!4!4')">  <asp:Label CssClass="normal" ID="tab_13_w03_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!1.3!5!4')">  <asp:Label CssClass="normal" ID="tab_13_w03_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!1.3!6!4')">  <asp:Label CssClass="normal" ID="tab_13_w03_c06" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!1.3!7!4')">  <asp:Label CssClass="normal" ID="tab_13_w03_c07" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!1.3!8!4')">  <asp:Label CssClass="normal" ID="tab_13_w03_c08" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!1.3!9!4')">  <asp:Label CssClass="normal" ID="tab_13_w03_c09" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftRight col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!1.3!10!4')">  <asp:Label CssClass="normal" ID="tab_13_w03_c10" runat="server" Text="0"></asp:Label>  </a></td>
      
               </tr>
               <tr>
                   <td class="wciecie borderTopLeft col_125">Zakład Emerytalno-Rentowy MSWiA</td>
                   <td class="borderTopLeft col_36">04</td>
      <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!1.3!1!4')">  <asp:Label CssClass="normal" ID="tab_13_w04_c01" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!1.3!2!4')">  <asp:Label CssClass="normal" ID="tab_13_w04_c02" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!1.3!3!4')">  <asp:Label CssClass="normal" ID="tab_13_w04_c03" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!1.3!4!4')">  <asp:Label CssClass="normal" ID="tab_13_w04_c04" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!1.3!5!4')">  <asp:Label CssClass="normal" ID="tab_13_w04_c05" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!1.3!6!4')">  <asp:Label CssClass="normal" ID="tab_13_w04_c06" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!1.3!7!4')">  <asp:Label CssClass="normal" ID="tab_13_w04_c07" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!1.3!8!4')">  <asp:Label CssClass="normal" ID="tab_13_w04_c08" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!1.3!9!4')">  <asp:Label CssClass="normal" ID="tab_13_w04_c09" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeftRight col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!1.3!10!4')">  <asp:Label CssClass="normal" ID="tab_13_w04_c10" runat="server" Text="0"></asp:Label>  </a></td>
               </tr>
               <tr>
                   <td class="wciecie borderTopLeftBottom col_125">Organ emerytalny Służby Więziennej</td>
                   <td class="borderTopLeftBottom col_36">05</td>
                 
   <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!1.3!1!4')">  <asp:Label CssClass="normal" ID="tab_13_w05_c01" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!1.3!2!4')">  <asp:Label CssClass="normal" ID="tab_13_w05_c02" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!1.3!3!4')">  <asp:Label CssClass="normal" ID="tab_13_w05_c03" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!1.3!4!4')">  <asp:Label CssClass="normal" ID="tab_13_w05_c04" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!1.3!5!4')">  <asp:Label CssClass="normal" ID="tab_13_w05_c05" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!1.3!6!4')">  <asp:Label CssClass="normal" ID="tab_13_w05_c06" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!1.3!7!4')">  <asp:Label CssClass="normal" ID="tab_13_w05_c07" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!1.3!8!4')">  <asp:Label CssClass="normal" ID="tab_13_w05_c08" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!1.3!9!4')">  <asp:Label CssClass="normal" ID="tab_13_w05_c09" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderAll col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!1.3!10!4')">  <asp:Label CssClass="normal" ID="tab_13_w05_c10" runat="server" Text="0"></asp:Label>  </a></td>
      
               </tr>
               </table>
       </div>
       <div class="page-break">


           <strong>
           <br />
           Dział 1.4</strong> Terminowość sporządzania uzasadnień<table cellpadding="0" cellspacing="0" class="auto-style14">
               <tr>
                   <td class="borderTopLeft" align="center" colspan="2" rowspan="3">SPRAWY wg repertorium </td>
                   <td class="borderTopLeft col_71" align="center" rowspan="3">Razem (kol.2+3+5+<br />
                       7+9)</td>
                   <td class="borderTopLeft" align="center" colspan="9">Terminowość sporządzania uzasadnień</td>
                   <td class="borderTopLeft col_71" align="center" rowspan="3">Uzasadnienia wygłoszone (art.328 § 1<sup><span class="auto-style7">1</span></sup> kpc)</td>
                   <td class="borderTopLeft col_71" align="center" rowspan="3">Liczba spraw do których wpłynął wniosek o transkrypcję uzasadnień wygłoszonych w trybie art.328 § 1<sup><span class="auto-style7">1</span></sup> kpc</td>
                   <td class="borderTopLeftRight" align="center" colspan="2">Liczba spraw, w których projekt uzasadnienia orzeczenia sporządził asystent</td>
               </tr>
               <tr>
                   <td class="borderTopLeft col_71" align="center" rowspan="2">w terminie ustawowym</td>
                   <td class="borderTopLeft" align="center" colspan="8">po upływie terminu ustawowego <sup><span class="auto-style7">1)</span></sup></td>
                   <td class="borderTopLeft col_71" align="center" rowspan="2">Razem</td>
                   <td class="borderTopLeftRight col_76" align="center" rowspan="2">w tym, w których projekt został zaakceptowany przez sędziego</td>
               </tr>
               <tr>
                   <td class="borderTopLeft col_71" align="center">1-14 dni</td>
                   <td class="borderTopLeft col_71" align="center">w tym nieuspra-<br />
                       wiedliwione</td>
                   <td class="borderTopLeft col_71" align="center">15-30 dni</td>
                   <td class="borderTopLeft col_71" align="center">w tym nieuspra-wiedliwione</td>
                   <td class="borderTopLeft col_71" align="center">pow. 1 do 3 mies.</td>
                   <td class="borderTopLeft col_71" align="center">w tym nieuspra-wiedliwione</td>
                   <td class="borderTopLeft col_71" align="center">ponad 3 mies.</td>
                   <td class="borderTopLeft col_71" align="center">w tym nieuspra-wiedliwione</td>
               </tr>
               <tr>
                   <td class="borderTopLeft " align="center" colspan="2">0</td>
                   <td class="borderTopLeft col_71" align="center">1</td>
                   <td class="borderTopLeft col_71" align="center">2</td>
                   <td class="borderTopLeft col_71" align="center">3</td>
                   <td class="borderTopLeft col_71" align="center">4</td>
                   <td class="borderTopLeft col_71" align="center">5</td>
                   <td class="borderTopLeft col_71" align="center">6</td>
                   <td class="borderTopLeft col_71" align="center">7</td>
                   <td class="borderTopLeft col_71" align="center">8</td>
                   <td class="borderTopLeft col_71" align="center">9</td>
                   <td class="borderTopLeft col_71" align="center">10</td>
                   <td class="borderTopLeft col_71" align="center">11</td>
                   <td class="borderTopLeft col_71" align="center">12</td>
                   <td class="borderTopLeft col_71" align="center">13</td>
                   <td class="borderTopLeftRight col_76" align="center">14</td>
               </tr>
               <tr>
                   <td class="wciecie borderTopLeft col_45">U razem (w. 02 do 09)</td>
                   <td class="borderTopLeft col_36">01</td>
                  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=1!1.4!1!4')">  <asp:Label CssClass="normal" ID="tab_14_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=1!1.4!2!4')">  <asp:Label CssClass="normal" ID="tab_14_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=1!1.4!3!4')">  <asp:Label CssClass="normal" ID="tab_14_w01_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=1!1.4!4!4')">  <asp:Label CssClass="normal" ID="tab_14_w01_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=1!1.4!5!4')">  <asp:Label CssClass="normal" ID="tab_14_w01_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=1!1.4!6!4')">  <asp:Label CssClass="normal" ID="tab_14_w01_c06" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=1!1.4!7!4')">  <asp:Label CssClass="normal" ID="tab_14_w01_c07" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=1!1.4!8!4')">  <asp:Label CssClass="normal" ID="tab_14_w01_c08" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=1!1.4!9!4')">  <asp:Label CssClass="normal" ID="tab_14_w01_c09" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=1!1.4!10!4')">  <asp:Label CssClass="normal" ID="tab_14_w01_c10" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=1!1.4!11!4')">  <asp:Label CssClass="normal" ID="tab_14_w01_c11" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=1!1.4!12!4')">  <asp:Label CssClass="normal" ID="tab_14_w01_c12" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=1!1.4!13!4')">  <asp:Label CssClass="normal" ID="tab_14_w01_c13" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftRight col_71"><a href="javascript:openPopup('popup.aspx?sesja=1!1.4!14!4')">  <asp:Label CssClass="normal" ID="tab_14_w01_c14" runat="server" Text="0"></asp:Label>  </a></td>
                  
                           </tr>
               <tr>
                   <td class="wciecie borderTopLeft col_45">Oddział Zakładu Ubezpieczeń Społecznych</td>
                   <td class="borderTopLeft col_36">02</td>
                   <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=2!1.4!1!4')">  <asp:Label CssClass="normal" ID="tab_14_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=2!1.4!2!4')">  <asp:Label CssClass="normal" ID="tab_14_w02_c02" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=2!1.4!3!4')">  <asp:Label CssClass="normal" ID="tab_14_w02_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=2!1.4!4!4')">  <asp:Label CssClass="normal" ID="tab_14_w02_c04" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=2!1.4!5!4')">  <asp:Label CssClass="normal" ID="tab_14_w02_c05" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=2!1.4!6!4')">  <asp:Label CssClass="normal" ID="tab_14_w02_c06" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=2!1.4!7!4')">  <asp:Label CssClass="normal" ID="tab_14_w02_c07" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=2!1.4!8!4')">  <asp:Label CssClass="normal" ID="tab_14_w02_c08" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=2!1.4!9!4')">  <asp:Label CssClass="normal" ID="tab_14_w02_c09" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=2!1.4!10!4')">  <asp:Label CssClass="normal" ID="tab_14_w02_c10" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=2!1.4!11!4')">  <asp:Label CssClass="normal" ID="tab_14_w02_c11" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=2!1.4!12!4')">  <asp:Label CssClass="normal" ID="tab_14_w02_c12" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=2!1.4!13!4')">  <asp:Label CssClass="normal" ID="tab_14_w02_c13" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeftRight col_76"><a href="javascript:openPopup('popup.aspx?sesja=2!1.4!14!4')">  <asp:Label CssClass="normal" ID="tab_14_w02_c14" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
               <tr>
                   <td class="wciecie borderTopLeft col_45">Wojskowy organ emerytalny</td>
                   <td class="borderTopLeft col_36">03</td>
                <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=3!1.4!1!4')">  <asp:Label CssClass="normal" ID="tab_14_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=3!1.4!2!4')">  <asp:Label CssClass="normal" ID="tab_14_w03_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=3!1.4!3!4')">  <asp:Label CssClass="normal" ID="tab_14_w03_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=3!1.4!4!4')">  <asp:Label CssClass="normal" ID="tab_14_w03_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=3!1.4!5!4')">  <asp:Label CssClass="normal" ID="tab_14_w03_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=3!1.4!6!4')">  <asp:Label CssClass="normal" ID="tab_14_w03_c06" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=3!1.4!7!4')">  <asp:Label CssClass="normal" ID="tab_14_w03_c07" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=3!1.4!8!4')">  <asp:Label CssClass="normal" ID="tab_14_w03_c08" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=3!1.4!9!4')">  <asp:Label CssClass="normal" ID="tab_14_w03_c09" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=3!1.4!10!4')">  <asp:Label CssClass="normal" ID="tab_14_w03_c10" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=3!1.4!11!4')">  <asp:Label CssClass="normal" ID="tab_14_w03_c11" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=3!1.4!12!4')">  <asp:Label CssClass="normal" ID="tab_14_w03_c12" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_71"><a href="javascript:openPopup('popup.aspx?sesja=3!1.4!13!4')">  <asp:Label CssClass="normal" ID="tab_14_w03_c13" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftRight col_76"><a href="javascript:openPopup('popup.aspx?sesja=3!1.4!14!4')">  <asp:Label CssClass="normal" ID="tab_14_w03_c14" runat="server" Text="0"></asp:Label>  </a></td>
      
               </tr>
               <tr>
                   <td class="wciecie borderTopLeftBottom col_45">Zakład Emerytalno-Rentowy MSWiA</td>
                   <td class="borderTopLeftBottom col_36">04</td>
      <td class="borderTopLeftBottom  col_71"><a href="javascript:openPopup('popup.aspx?sesja=4!1.4!1!4')">  <asp:Label CssClass="normal" ID="tab_14_w04_c01" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeftBottom  col_71"><a href="javascript:openPopup('popup.aspx?sesja=4!1.4!2!4')">  <asp:Label CssClass="normal" ID="tab_14_w04_c02" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeftBottom  col_71"><a href="javascript:openPopup('popup.aspx?sesja=4!1.4!3!4')">  <asp:Label CssClass="normal" ID="tab_14_w04_c03" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeftBottom  col_71"><a href="javascript:openPopup('popup.aspx?sesja=4!1.4!4!4')">  <asp:Label CssClass="normal" ID="tab_14_w04_c04" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeftBottom  col_71"><a href="javascript:openPopup('popup.aspx?sesja=4!1.4!5!4')">  <asp:Label CssClass="normal" ID="tab_14_w04_c05" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeftBottom  col_71"><a href="javascript:openPopup('popup.aspx?sesja=4!1.4!6!4')">  <asp:Label CssClass="normal" ID="tab_14_w04_c06" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeftBottom  col_71"><a href="javascript:openPopup('popup.aspx?sesja=4!1.4!7!4')">  <asp:Label CssClass="normal" ID="tab_14_w04_c07" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeftBottom  col_71"><a href="javascript:openPopup('popup.aspx?sesja=4!1.4!8!4')">  <asp:Label CssClass="normal" ID="tab_14_w04_c08" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeftBottom  col_71"><a href="javascript:openPopup('popup.aspx?sesja=4!1.4!9!4')">  <asp:Label CssClass="normal" ID="tab_14_w04_c09" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeftBottom  col_71"><a href="javascript:openPopup('popup.aspx?sesja=4!1.4!10!4')">  <asp:Label CssClass="normal" ID="tab_14_w04_c10" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeftBottom  col_71"><a href="javascript:openPopup('popup.aspx?sesja=4!1.4!11!4')">  <asp:Label CssClass="normal" ID="tab_14_w04_c11" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeftBottom  col_71"><a href="javascript:openPopup('popup.aspx?sesja=4!1.4!12!4')">  <asp:Label CssClass="normal" ID="tab_14_w04_c12" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderTopLeftBottom  col_71"><a href="javascript:openPopup('popup.aspx?sesja=4!1.4!13!4')">  <asp:Label CssClass="normal" ID="tab_14_w04_c13" runat="server" Text="0"></asp:Label>  </a></td>
  <td class="borderAll col_76"><a href="javascript:openPopup('popup.aspx?sesja=4!1.4!14!4')">  <asp:Label CssClass="normal" ID="tab_14_w04_c14" runat="server" Text="0"></asp:Label>  </a></td>         
               </tr>
               </table>


</div>

       <div class="page-break">







           <strong>
           <br />
           Dział 2.1.1. </strong> Sprawy od dnia pierwotnego wpisu do repertorium (łącznie z czasem trwania mediacji)<br />







           <br />







           <table cellpadding="0" cellspacing="0" class="auto-style14">
               <tr>
                   <td class="borderTopLeft " align="center" rowspan="2">Wyszczególnie</td>
                   <td class="borderTopLeft " align="center" rowspan="2">L.p.</td>
                   <td class="borderTopLeftRight" align="center" colspan="11">W tym spraw niezałatwionych pozostających od daty wpływu</td>
               </tr>
               <tr>
                   <td class="borderTopLeft col_110" align="center">razem (kol.2+3)</td>
                   <td class="borderTopLeft col_110" align="center">do 3 miesięcy</td>
                   <td class="borderTopLeft col_110" align="center"><b>suma powyżej 3 miesięcy</b> (kol. od 4 do 6)</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 3 do 6</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 6 do 12 miesięcy</td>
                   <td class="borderTopLeft col_110" align="center"><b>suma powyżej 12 miesięcy </b><br/>(kol. od 7 do 11)</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 12 miesięcy  do 2 lat</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 2 do 3 lat</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 3 do 5 lat</td>
				   <td class="borderTopLeft col_110" align="center">powyżej 5 do 8 lat</td>
                   <td class="borderTopLeftRight col_110" align="center">ponad 8 lat</td>
               </tr>
               <tr>
                   <td class="borderTopLeft col_76" align="center" colspan="2">0</td>
                   <td class="borderTopLeft col_110" align="center">1</td>
                   <td class="borderTopLeft col_110" align="center">2</td>
                   <td class="borderTopLeft col_110" align="center">3</td>
                   <td class="borderTopLeft col_110" align="center">4</td>
                   <td class="borderTopLeft col_110" align="center">5</td>
                   <td class="borderTopLeft col_110" align="center">6</td>
                   <td class="borderTopLeft col_110" align="center">7</td>
                   <td class="borderTopLeft col_110" align="center">8</td>
                   <td class="borderTopLeft col_110" align="center">9</td>
				   <td class="borderTopLeft col_110" align="center">10</td>
                   <td class="borderTopLeftRight col_110" align="center">11</td>
               </tr>
               <tr>
                   <td class="wciecie borderTopLeft col_125">U </td>
                   <td class="borderTopLeft col_36">01</td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1!1!4')">  <asp:Label CssClass="normal" ID="tab_211_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1!2!4')">  <asp:Label CssClass="normal" ID="tab_211_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1!3!4')">  <asp:Label CssClass="normal" ID="tab_211_w01_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1!4!4')">  <asp:Label CssClass="normal" ID="tab_211_w01_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1!5!4')">  <asp:Label CssClass="normal" ID="tab_211_w01_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1!6!4')">  <asp:Label CssClass="normal" ID="tab_211_w01_c06" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1!7!4')">  <asp:Label CssClass="normal" ID="tab_211_w01_c07" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1!8!4')">  <asp:Label CssClass="normal" ID="tab_211_w01_c08" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1!9!4')">  <asp:Label CssClass="normal" ID="tab_211_w01_c09" runat="server" Text="0"></asp:Label>  </a></td>
                 <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1!10!4')">  <asp:Label CssClass="normal" ID="tab_211_w01_c10" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftRight col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1!11!4')">  <asp:Label CssClass="normal" ID="tab_211_w01_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   
                           </tr>
               <tr>
                   <td class="wciecie borderTopLeft col_125">P</td>
                   <td class="borderTopLeft col_36">02</td>
                   <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1!1!4')">  <asp:Label CssClass="normal" ID="tab_211_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1!2!4')">  <asp:Label CssClass="normal" ID="tab_211_w02_c02" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1!3!4')">  <asp:Label CssClass="normal" ID="tab_211_w02_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1!4!4')">  <asp:Label CssClass="normal" ID="tab_211_w02_c04" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1!5!4')">  <asp:Label CssClass="normal" ID="tab_211_w02_c05" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1!6!4')">  <asp:Label CssClass="normal" ID="tab_211_w02_c06" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1!7!4')">  <asp:Label CssClass="normal" ID="tab_211_w02_c07" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1!8!4')">  <asp:Label CssClass="normal" ID="tab_211_w02_c08" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1!9!4')">  <asp:Label CssClass="normal" ID="tab_211_w02_c09" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1!10!4')">  <asp:Label CssClass="normal" ID="tab_211_w02_c10" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftRight col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1!11!4')">  <asp:Label CssClass="normal" ID="tab_211_w02_c11" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
               <tr>
                   <td class="wciecie borderTopLeftBottom col_125">Np</td>
                   <td class="borderTopLeftBottom col_36">03</td>
                <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1!1!4')">  <asp:Label CssClass="normal" ID="tab_211_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1!2!4')">  <asp:Label CssClass="normal" ID="tab_211_w03_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1!3!4')">  <asp:Label CssClass="normal" ID="tab_211_w03_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1!4!4')">  <asp:Label CssClass="normal" ID="tab_211_w03_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1!5!4')">  <asp:Label CssClass="normal" ID="tab_211_w03_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1!6!4')">  <asp:Label CssClass="normal" ID="tab_211_w03_c06" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1!7!4')">  <asp:Label CssClass="normal" ID="tab_211_w03_c07" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1!8!4')">  <asp:Label CssClass="normal" ID="tab_211_w03_c08" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1!9!4')">  <asp:Label CssClass="normal" ID="tab_211_w03_c09" runat="server" Text="0"></asp:Label>  </a></td>
			  <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1!10!4')">  <asp:Label CssClass="normal" ID="tab_211_w03_c10" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderAll  col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1!11!4')">  <asp:Label CssClass="normal" ID="tab_211_w03_c11" runat="server" Text="0"></asp:Label>  </a></td>
      
               </tr>
             
            
               </table>
       </div>

       <div class="page-break">







           <strong>
           <br />
           Dział 2.1.1.1. </strong> Sprawy od dnia pierwotnego wpisu do repertorium (łącznie z czasem trwania mediacji)<br />







           <br />







           <table cellpadding="0" cellspacing="0" class="auto-style14">
               <tr>
                   <td class="borderTopLeft " align="center" rowspan="2">Wyszczególnie</td>
                   <td class="borderTopLeft " align="center" rowspan="2">L.p.</td>
                   <td class="borderTopLeftRight" align="center" colspan="11">W tym spraw niezałatwionych pozostających od daty wpływu</td>
               </tr>
               <tr>
                   <td class="borderTopLeft col_110" align="center">razem (kol.2+3)</td>
                   <td class="borderTopLeft col_110" align="center">do 3 miesięcy</td>
                   <td class="borderTopLeft col_110" align="center"><b>suma powyżej 3 miesięcy</b> (kol. od 4 do 6)</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 3 do 6</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 6 do 12 miesięcy</td>
                   <td class="borderTopLeft col_110" align="center"><b>suma powyżej 12 miesięcy </b><br/>(kol. od 7 do 11)</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 12 miesięcy  do 2 lat</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 2 do 3 lat</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 3 do 5 lat</td>
				   <td class="borderTopLeft col_110" align="center">powyżej 5 do 8 lat</td>
                   <td class="borderTopLeftRight col_110" align="center">ponad 8 lat</td>
               </tr>
               <tr>
                   <td class="borderTopLeft col_76" align="center" colspan="2">0</td>
                   <td class="borderTopLeft col_110" align="center">1</td>
                   <td class="borderTopLeft col_110" align="center">2</td>
                   <td class="borderTopLeft col_110" align="center">3</td>
                   <td class="borderTopLeft col_110" align="center">4</td>
                   <td class="borderTopLeft col_110" align="center">5</td>
                   <td class="borderTopLeft col_110" align="center">6</td>
                   <td class="borderTopLeft col_110" align="center">7</td>
                   <td class="borderTopLeft col_110" align="center">8</td>
                   <td class="borderTopLeft col_110" align="center">9</td>
				   <td class="borderTopLeft col_110" align="center">10</td>
                   <td class="borderTopLeftRight col_110" align="center">11</td>
               </tr>
               <tr>
                   <td class="wciecie borderTopLeft col_125">U </td>
                   <td class="borderTopLeft col_36">01</td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.1!1!4')">  <asp:Label CssClass="normal" ID="tab_2111_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.1!2!4')">  <asp:Label CssClass="normal" ID="tab_2111_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.1!3!4')">  <asp:Label CssClass="normal" ID="tab_2111_w01_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.1!4!4')">  <asp:Label CssClass="normal" ID="tab_2111_w01_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.1!5!4')">  <asp:Label CssClass="normal" ID="tab_2111_w01_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.1!6!4')">  <asp:Label CssClass="normal" ID="tab_2111_w01_c06" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.1!7!4')">  <asp:Label CssClass="normal" ID="tab_2111_w01_c07" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.1!8!4')">  <asp:Label CssClass="normal" ID="tab_2111_w01_c08" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.1!9!4')">  <asp:Label CssClass="normal" ID="tab_2111_w01_c09" runat="server" Text="0"></asp:Label>  </a></td>
                 <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.1!10!4')">  <asp:Label CssClass="normal" ID="tab_2111_w01_c10" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftRight col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.1!11!4')">  <asp:Label CssClass="normal" ID="tab_2111_w01_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   
                           </tr>
               <tr>
                   <td class="wciecie borderTopLeft col_125">P</td>
                   <td class="borderTopLeft col_36">02</td>
                   <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.1!1!4')">  <asp:Label CssClass="normal" ID="tab_2111_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.1!2!4')">  <asp:Label CssClass="normal" ID="tab_2111_w02_c02" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.1!3!4')">  <asp:Label CssClass="normal" ID="tab_2111_w02_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.1!4!4')">  <asp:Label CssClass="normal" ID="tab_2111_w02_c04" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.1!5!4')">  <asp:Label CssClass="normal" ID="tab_2111_w02_c05" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.1!6!4')">  <asp:Label CssClass="normal" ID="tab_2111_w02_c06" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.1!7!4')">  <asp:Label CssClass="normal" ID="tab_2111_w02_c07" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.1!8!4')">  <asp:Label CssClass="normal" ID="tab_2111_w02_c08" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.1!9!4')">  <asp:Label CssClass="normal" ID="tab_2111_w02_c09" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.1!10!4')">  <asp:Label CssClass="normal" ID="tab_2111_w02_c10" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftRight col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.1!11!4')">  <asp:Label CssClass="normal" ID="tab_2111_w02_c11" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
               <tr>
                   <td class="wciecie borderTopLeftBottom col_125">Np</td>
                   <td class="borderTopLeftBottom col_36">03</td>
                <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.1!1!4')">  <asp:Label CssClass="normal" ID="tab_2111_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.1!2!4')">  <asp:Label CssClass="normal" ID="tab_2111_w03_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.1!3!4')">  <asp:Label CssClass="normal" ID="tab_2111_w03_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.1!4!4')">  <asp:Label CssClass="normal" ID="tab_2111_w03_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.1!5!4')">  <asp:Label CssClass="normal" ID="tab_2111_w03_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.1!6!4')">  <asp:Label CssClass="normal" ID="tab_2111_w03_c06" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.1!7!4')">  <asp:Label CssClass="normal" ID="tab_2111_w03_c07" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.1!8!4')">  <asp:Label CssClass="normal" ID="tab_2111_w03_c08" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.1!9!4')">  <asp:Label CssClass="normal" ID="tab_2111_w03_c09" runat="server" Text="0"></asp:Label>  </a></td>
			  <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.1!10!4')">  <asp:Label CssClass="normal" ID="tab_2111_w03_c10" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderAll  col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.1!11!4')">  <asp:Label CssClass="normal" ID="tab_2111_w03_c11" runat="server" Text="0"></asp:Label>  </a></td>
      
               </tr>
             
            
               </table>
       </div>
       <div class="page-break">

           <strong>
           <br />
           Dział 2.1.1.a. </strong> Sprawy zawieszone nie zakreślone od dnia pierwotnego wpisu do repertorium (wykazane w dziale 2.1.1.) (łącznie z czasem trwania mediacji)
		   <br />
            <br />



           <table cellpadding="0" cellspacing="0" class="auto-style14">
               <tr>
                   <td class="borderTopLeft " align="center" rowspan="2">Wyszczególnie</td>
                   <td class="borderTopLeft " align="center" rowspan="2">L.p.</td>
                   <td class="borderTopLeftRight" align="center" colspan="11">W tym spraw niezałatwionych pozostających od daty wpływu</td>
               </tr>
               <tr>
                   <td class="borderTopLeft col_110" align="center">razem (kol.2+3)</td>
                   <td class="borderTopLeft col_110" align="center">do 3 miesięcy</td>
                   <td class="borderTopLeft col_110" align="center"><b>suma powyżej 3 miesięcy</b> (kol. od 4 do 6)</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 3 do 6</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 6 do 12 miesięcy</td>
                   <td class="borderTopLeft col_110" align="center"><b>suma powyżej 12 miesięcy </b><br/>(kol. od 7 do 11)</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 12 miesięcy  do 2 lat</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 2 do 3 lat</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 3 do 5 lat</td>
				   <td class="borderTopLeft col_110" align="center">powyżej 5 do 8 lat</td>
                   <td class="borderTopLeftRight col_110" align="center">ponad 8 lat</td>
               </tr>
               <tr>
                   <td class="borderTopLeft col_76" align="center" colspan="2">0</td>
                   <td class="borderTopLeft col_110" align="center">1</td>
                   <td class="borderTopLeft col_110" align="center">2</td>
                   <td class="borderTopLeft col_110" align="center">3</td>
                   <td class="borderTopLeft col_110" align="center">4</td>
                   <td class="borderTopLeft col_110" align="center">5</td>
                   <td class="borderTopLeft col_110" align="center">6</td>
                   <td class="borderTopLeft col_110" align="center">7</td>
                   <td class="borderTopLeft col_110" align="center">8</td>
                   <td class="borderTopLeft col_110" align="center">9</td>
				   <td class="borderTopLeft col_110" align="center">10</td>
                   <td class="borderTopLeftRight col_110" align="center">11</td>
               </tr>
               <tr>
                   <td class="wciecie borderTopLeft col_125">U </td>
                   <td class="borderTopLeft col_36">01</td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.a!1!4')">  <asp:Label CssClass="normal" ID="tab_211a_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.a!2!4')">  <asp:Label CssClass="normal" ID="tab_211a_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.a!3!4')">  <asp:Label CssClass="normal" ID="tab_211a_w01_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.a!4!4')">  <asp:Label CssClass="normal" ID="tab_211a_w01_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.a!5!4')">  <asp:Label CssClass="normal" ID="tab_211a_w01_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.a!6!4')">  <asp:Label CssClass="normal" ID="tab_211a_w01_c06" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.a!7!4')">  <asp:Label CssClass="normal" ID="tab_211a_w01_c07" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.a!8!4')">  <asp:Label CssClass="normal" ID="tab_211a_w01_c08" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.a!9!4')">  <asp:Label CssClass="normal" ID="tab_211a_w01_c09" runat="server" Text="0"></asp:Label>  </a></td>
                 <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.a!10!4')">  <asp:Label CssClass="normal" ID="tab_211a_w01_c10" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftRight col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.a!11!4')">  <asp:Label CssClass="normal" ID="tab_211a_w01_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   
                           </tr>
               <tr>
                   <td class="wciecie borderTopLeft col_125">P</td>
                   <td class="borderTopLeft col_36">02</td>
                   <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.a!1!4')">  <asp:Label CssClass="normal" ID="tab_211a_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.a!2!4')">  <asp:Label CssClass="normal" ID="tab_211a_w02_c02" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.a!3!4')">  <asp:Label CssClass="normal" ID="tab_211a_w02_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.a!4!4')">  <asp:Label CssClass="normal" ID="tab_211a_w02_c04" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.a!5!4')">  <asp:Label CssClass="normal" ID="tab_211a_w02_c05" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.a!6!4')">  <asp:Label CssClass="normal" ID="tab_211a_w02_c06" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.a!7!4')">  <asp:Label CssClass="normal" ID="tab_211a_w02_c07" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.a!8!4')">  <asp:Label CssClass="normal" ID="tab_211a_w02_c08" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.a!9!4')">  <asp:Label CssClass="normal" ID="tab_211a_w02_c09" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.a!10!4')">  <asp:Label CssClass="normal" ID="tab_211a_w02_c10" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftRight col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.a!11!4')">  <asp:Label CssClass="normal" ID="tab_211a_w02_c11" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
               <tr>
                   <td class="wciecie borderTopLeftBottom col_125">Np</td>
                   <td class="borderTopLeftBottom col_36">03</td>
                <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.a!1!4')">  <asp:Label CssClass="normal" ID="tab_211a_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.a!2!4')">  <asp:Label CssClass="normal" ID="tab_211a_w03_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.a!3!4')">  <asp:Label CssClass="normal" ID="tab_211a_w03_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.a!4!4')">  <asp:Label CssClass="normal" ID="tab_211a_w03_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.a!5!4')">  <asp:Label CssClass="normal" ID="tab_211a_w03_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.a!6!4')">  <asp:Label CssClass="normal" ID="tab_211a_w03_c06" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.a!7!4')">  <asp:Label CssClass="normal" ID="tab_211a_w03_c07" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.a!8!4')">  <asp:Label CssClass="normal" ID="tab_211a_w03_c08" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.a!9!4')">  <asp:Label CssClass="normal" ID="tab_211a_w03_c09" runat="server" Text="0"></asp:Label>  </a></td>
			  <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.a!10!4')">  <asp:Label CssClass="normal" ID="tab_211a_w03_c10" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderAll  col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.a!11!4')">  <asp:Label CssClass="normal" ID="tab_211a_w03_c11" runat="server" Text="0"></asp:Label>  </a></td>
      
               </tr>
             
            
               </table>
       </div>
       <div class="page-break">


           <strong>
           <br />
           Dział 2.1.1.a.1. </strong> Sprawy zawieszone nie zakreślone od dnia pierwotnego wpisu do repertorium (wykazane w dziale 2.1.1.) (bez czasu trwania mediacji w sprawach wszczętych po 1 stycznia 2016r.)
		   <br />


           <br />



           <table cellpadding="0" cellspacing="0" class="auto-style14">
               <tr>
                   <td class="borderTopLeft " align="center" rowspan="2">Wyszczególnie</td>
                   <td class="borderTopLeft " align="center" rowspan="2">L.p.</td>
                   <td class="borderTopLeftRight" align="center" colspan="11">W tym spraw niezałatwionych pozostających od daty wpływu</td>
               </tr>
               <tr>
                   <td class="borderTopLeft col_110" align="center">razem (kol.2+3)</td>
                   <td class="borderTopLeft col_110" align="center">do 3 miesięcy</td>
                   <td class="borderTopLeft col_110" align="center"><b>suma powyżej 3 miesięcy</b> (kol. od 4 do 6)</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 3 do 6</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 6 do 12 miesięcy</td>
                   <td class="borderTopLeft col_110" align="center"><b>suma powyżej 12 miesięcy </b><br/>(kol. od 7 do 11)</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 12 miesięcy  do 2 lat</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 2 do 3 lat</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 3 do 5 lat</td>
				   <td class="borderTopLeft col_110" align="center">powyżej 5 do 8 lat</td>
                   <td class="borderTopLeftRight col_110" align="center">ponad 8 lat</td>
               </tr>
               <tr>
                   <td class="borderTopLeft col_76" align="center" colspan="2">0</td>
                   <td class="borderTopLeft col_110" align="center">1</td>
                   <td class="borderTopLeft col_110" align="center">2</td>
                   <td class="borderTopLeft col_110" align="center">3</td>
                   <td class="borderTopLeft col_110" align="center">4</td>
                   <td class="borderTopLeft col_110" align="center">5</td>
                   <td class="borderTopLeft col_110" align="center">6</td>
                   <td class="borderTopLeft col_110" align="center">7</td>
                   <td class="borderTopLeft col_110" align="center">8</td>
                   <td class="borderTopLeft col_110" align="center">9</td>
				   <td class="borderTopLeft col_110" align="center">10</td>
                   <td class="borderTopLeftRight col_110" align="center">11</td>
               </tr>
               <tr>
                   <td class="wciecie borderTopLeft col_125">U </td>
                   <td class="borderTopLeft col_36">01</td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.a.1!1!4')">  <asp:Label CssClass="normal" ID="tab_211a1_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.a.1!2!4')">  <asp:Label CssClass="normal" ID="tab_211a1_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.a.1!3!4')">  <asp:Label CssClass="normal" ID="tab_211a1_w01_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.a.1!4!4')">  <asp:Label CssClass="normal" ID="tab_211a1_w01_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.a.1!5!4')">  <asp:Label CssClass="normal" ID="tab_211a1_w01_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.a.1!6!4')">  <asp:Label CssClass="normal" ID="tab_211a1_w01_c06" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.a.1!7!4')">  <asp:Label CssClass="normal" ID="tab_211a1_w01_c07" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.a.1!8!4')">  <asp:Label CssClass="normal" ID="tab_211a1_w01_c08" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.a.1!9!4')">  <asp:Label CssClass="normal" ID="tab_211a1_w01_c09" runat="server" Text="0"></asp:Label>  </a></td>
                 <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.a.1!10!4')">  <asp:Label CssClass="normal" ID="tab_211a1_w01_c10" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftRight col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.a.1!11!4')">  <asp:Label CssClass="normal" ID="tab_211a1_w01_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   
                           </tr>
               <tr>
                   <td class="wciecie borderTopLeft col_125">P</td>
                   <td class="borderTopLeft col_36">02</td>
                   <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.a.1!1!4')">  <asp:Label CssClass="normal" ID="tab_211a1_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.a.1!2!4')">  <asp:Label CssClass="normal" ID="tab_211a1_w02_c02" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.a.1!3!4')">  <asp:Label CssClass="normal" ID="tab_211a1_w02_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.a.1!4!4')">  <asp:Label CssClass="normal" ID="tab_211a1_w02_c04" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.a.1!5!4')">  <asp:Label CssClass="normal" ID="tab_211a1_w02_c05" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.a.1!6!4')">  <asp:Label CssClass="normal" ID="tab_211a1_w02_c06" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.a.1!7!4')">  <asp:Label CssClass="normal" ID="tab_211a1_w02_c07" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.a.1!8!4')">  <asp:Label CssClass="normal" ID="tab_211a1_w02_c08" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.a.1!9!4')">  <asp:Label CssClass="normal" ID="tab_211a1_w02_c09" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.a.1!10!4')">  <asp:Label CssClass="normal" ID="tab_211a1_w02_c10" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftRight col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.a.1!11!4')">  <asp:Label CssClass="normal" ID="tab_211a1_w02_c11" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
               <tr>
                   <td class="wciecie borderTopLeftBottom col_125">Np</td>
                   <td class="borderTopLeftBottom col_36">03</td>
                <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.a.1!1!4')">  <asp:Label CssClass="normal" ID="tab_211a1_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.a.1!2!4')">  <asp:Label CssClass="normal" ID="tab_211a1_w03_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.a.1!3!4')">  <asp:Label CssClass="normal" ID="tab_211a1_w03_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.a.1!4!4')">  <asp:Label CssClass="normal" ID="tab_211a1_w03_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.a.1!5!4')">  <asp:Label CssClass="normal" ID="tab_211a1_w03_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.a.1!6!4')">  <asp:Label CssClass="normal" ID="tab_211a1_w03_c06" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.a.1!7!4')">  <asp:Label CssClass="normal" ID="tab_211a1_w03_c07" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.a.1!8!4')">  <asp:Label CssClass="normal" ID="tab_211a1_w03_c08" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.a.1!9!4')">  <asp:Label CssClass="normal" ID="tab_211a1_w03_c09" runat="server" Text="0"></asp:Label>  </a></td>
			  <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.a.1!10!4')">  <asp:Label CssClass="normal" ID="tab_211a1_w03_c10" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderAll  col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.a.1!11!4')">  <asp:Label CssClass="normal" ID="tab_211a1_w03_c11" runat="server" Text="0"></asp:Label>  </a></td>
      
               </tr>
             
            
               </table>
       </div>

       <div class="page-break">


           <strong>
           <br />
           Dział 2.1.2. </strong> Liczba spraw zakreślonych w urządzeniu ewidencyjnym w wyniku zawieszenia postępowania(łącznie z czasem trwania mediacji)
		   <br />
           <br />

           <table cellpadding="0" cellspacing="0" class="auto-style14">
               <tr>
                   <td class="borderTopLeft " align="center" rowspan="2">Wyszczególnie</td>
                   <td class="borderTopLeft " align="center" rowspan="2">L.p.</td>
                   <td class="borderTopLeftRight" align="center" colspan="11">W tym spraw niezałatwionych pozostających od daty wpływu</td>
               </tr>
               <tr>
                   <td class="borderTopLeft col_110" align="center">razem (kol.2+3)</td>
                   <td class="borderTopLeft col_110" align="center">do 3 miesięcy</td>
                   <td class="borderTopLeft col_110" align="center"><b>suma powyżej 3 miesięcy</b> (kol. od 4 do 6)</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 3 do 6</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 6 do 12 miesięcy</td>
                   <td class="borderTopLeft col_110" align="center"><b>suma powyżej 12 miesięcy </b><br/>(kol. od 7 do 11)</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 12 miesięcy  do 2 lat</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 2 do 3 lat</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 3 do 5 lat</td>
				   <td class="borderTopLeft col_110" align="center">powyżej 5 do 8 lat</td>
                   <td class="borderTopLeftRight col_110" align="center">ponad 8 lat</td>
               </tr>
               <tr>
                   <td class="borderTopLeft " align="center" colspan="2">0</td>
                   <td class="borderTopLeft col_110" align="center">1</td>
                   <td class="borderTopLeft col_110" align="center">2</td>
                   <td class="borderTopLeft col_110" align="center">3</td>
                   <td class="borderTopLeft col_110" align="center">4</td>
                   <td class="borderTopLeft col_110" align="center">5</td>
                   <td class="borderTopLeft col_110" align="center">6</td>
                   <td class="borderTopLeft col_110" align="center">7</td>
                   <td class="borderTopLeft col_110" align="center">8</td>
                   <td class="borderTopLeft col_110" align="center">9</td>
				   <td class="borderTopLeft col_110" align="center">10</td>
                   <td class="borderTopLeftRight col_110" align="center">11</td>
               </tr>
               <tr>
                   <td class="wciecie borderTopLeft col_125">U </td>
                   <td class="borderTopLeft col_36">01</td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_212_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_212_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_212_w01_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_212_w01_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_212_w01_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_212_w01_c06" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_212_w01_c07" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.2!8!4')">  <asp:Label CssClass="normal" ID="tab_212_w01_c08" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.2!9!4')">  <asp:Label CssClass="normal" ID="tab_212_w01_c09" runat="server" Text="0"></asp:Label>  </a></td>
                 <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.2!10!4')">  <asp:Label CssClass="normal" ID="tab_212_w01_c10" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftRight col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.2!11!4')">  <asp:Label CssClass="normal" ID="tab_212_w01_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   
                           </tr>
               <tr>
                   <td class="wciecie borderTopLeft col_125">P</td>
                   <td class="borderTopLeft col_36">02</td>
                   <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_212_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_212_w02_c02" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_212_w02_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_212_w02_c04" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_212_w02_c05" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_212_w02_c06" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_212_w02_c07" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.2!8!4')">  <asp:Label CssClass="normal" ID="tab_212_w02_c08" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.2!9!4')">  <asp:Label CssClass="normal" ID="tab_212_w02_c09" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.2!10!4')">  <asp:Label CssClass="normal" ID="tab_212_w02_c10" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftRight col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.2!11!4')">  <asp:Label CssClass="normal" ID="tab_212_w02_c11" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
               <tr>
                   <td class="wciecie borderTopLeftBottom col_125">Np</td>
                   <td class="borderTopLeftBottom col_36">03</td>
                <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.2!1!4')">  <asp:Label CssClass="normal" ID="tab_212_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.2!2!4')">  <asp:Label CssClass="normal" ID="tab_212_w03_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.2!3!4')">  <asp:Label CssClass="normal" ID="tab_212_w03_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.2!4!4')">  <asp:Label CssClass="normal" ID="tab_212_w03_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.2!5!4')">  <asp:Label CssClass="normal" ID="tab_212_w03_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.2!6!4')">  <asp:Label CssClass="normal" ID="tab_212_w03_c06" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.2!7!4')">  <asp:Label CssClass="normal" ID="tab_212_w03_c07" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.2!8!4')">  <asp:Label CssClass="normal" ID="tab_212_w03_c08" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.2!9!4')">  <asp:Label CssClass="normal" ID="tab_212_w03_c09" runat="server" Text="0"></asp:Label>  </a></td>
			  <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.2!10!4')">  <asp:Label CssClass="normal" ID="tab_212_w03_c10" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderAll  col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.2!11!4')">  <asp:Label CssClass="normal" ID="tab_212_w03_c11" runat="server" Text="0"></asp:Label>  </a></td>
      
               </tr>
             
            
               </table>
       </div>

       <div class="page-break">


           <strong>
           <br />
           Dział 2.1.2.1. </strong> Liczba spraw zakreślonych w urządzeniu ewidencyjnym w wyniku zawieszenia postępowania(bez czasu trwania mediacji w sprawach wszczętych po 1 stycznia 2016r.)
		   <br />
           <br />

           <table cellpadding="0" cellspacing="0" class="auto-style14">
               <tr>
                   <td class="borderTopLeft " align="center" rowspan="2">Wyszczególnie</td>
                   <td class="borderTopLeft " align="center" rowspan="2">L.p.</td>
                   <td class="borderTopLeftRight" align="center" colspan="11">W tym spraw niezałatwionych pozostających od daty wpływu</td>
               </tr>
               <tr>
                   <td class="borderTopLeft col_110" align="center">razem (kol.2+3)</td>
                   <td class="borderTopLeft col_110" align="center">do 3 miesięcy</td>
                   <td class="borderTopLeft col_110" align="center"><b>suma powyżej 3 miesięcy</b> (kol. od 4 do 6)</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 3 do 6</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 6 do 12 miesięcy</td>
                   <td class="borderTopLeft col_110" align="center"><b>suma powyżej 12 miesięcy </b><br/>(kol. od 7 do 11)</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 12 miesięcy  do 2 lat</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 2 do 3 lat</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 3 do 5 lat</td>
				   <td class="borderTopLeft col_110" align="center">powyżej 5 do 8 lat</td>
                   <td class="borderTopLeftRight col_110" align="center">ponad 8 lat</td>
               </tr>
               <tr>
                   <td class="borderTopLeft " align="center" colspan="2">0</td>
                   <td class="borderTopLeft col_110" align="center">1</td>
                   <td class="borderTopLeft col_110" align="center">2</td>
                   <td class="borderTopLeft col_110" align="center">3</td>
                   <td class="borderTopLeft col_110" align="center">4</td>
                   <td class="borderTopLeft col_110" align="center">5</td>
                   <td class="borderTopLeft col_110" align="center">6</td>
                   <td class="borderTopLeft col_110" align="center">7</td>
                   <td class="borderTopLeft col_110" align="center">8</td>
                   <td class="borderTopLeft col_110" align="center">9</td>
				   <td class="borderTopLeft col_110" align="center">10</td>
                   <td class="borderTopLeftRight col_110" align="center">11</td>
               </tr>
               <tr>
                   <td class="wciecie borderTopLeft col_125">U </td>
                   <td class="borderTopLeft col_36">01</td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.2.1!1!4')">  <asp:Label CssClass="normal" ID="tab_2121_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.2.1!2!4')">  <asp:Label CssClass="normal" ID="tab_2121_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.2.1!3!4')">  <asp:Label CssClass="normal" ID="tab_2121_w01_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.2.1!4!4')">  <asp:Label CssClass="normal" ID="tab_2121_w01_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.2.1!5!4')">  <asp:Label CssClass="normal" ID="tab_2121_w01_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.2.1!6!4')">  <asp:Label CssClass="normal" ID="tab_2121_w01_c06" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.2.1!7!4')">  <asp:Label CssClass="normal" ID="tab_2121_w01_c07" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.2.1!8!4')">  <asp:Label CssClass="normal" ID="tab_2121_w01_c08" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.2.1!9!4')">  <asp:Label CssClass="normal" ID="tab_2121_w01_c09" runat="server" Text="0"></asp:Label>  </a></td>
                 <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.2.1!10!4')">  <asp:Label CssClass="normal" ID="tab_2121_w01_c10" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftRight col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.2.1!11!4')">  <asp:Label CssClass="normal" ID="tab_2121_w01_c11" runat="server" Text="0"></asp:Label>  </a></td>
                   
                           </tr>
               <tr>
                   <td class="wciecie borderTopLeft col_125">P</td>
                   <td class="borderTopLeft col_36">02</td>
                   <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.2.1!1!4')">  <asp:Label CssClass="normal" ID="tab_2121_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.2.1!2!4')">  <asp:Label CssClass="normal" ID="tab_2121_w02_c02" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.2.1!3!4')">  <asp:Label CssClass="normal" ID="tab_2121_w02_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.2.1!4!4')">  <asp:Label CssClass="normal" ID="tab_2121_w02_c04" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.2.1!5!4')">  <asp:Label CssClass="normal" ID="tab_2121_w02_c05" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.2.1!6!4')">  <asp:Label CssClass="normal" ID="tab_2121_w02_c06" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.2.1!7!4')">  <asp:Label CssClass="normal" ID="tab_2121_w02_c07" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.2.1!8!4')">  <asp:Label CssClass="normal" ID="tab_2121_w02_c08" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.2.1!9!4')">  <asp:Label CssClass="normal" ID="tab_2121_w02_c09" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.2.1!10!4')">  <asp:Label CssClass="normal" ID="tab_2121_w02_c10" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftRight col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.2.1!11!4')">  <asp:Label CssClass="normal" ID="tab_2121_w02_c11" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
               <tr>
                   <td class="wciecie borderTopLeftBottom col_125">Np</td>
                   <td class="borderTopLeftBottom col_36">03</td>
                <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.2.1!1!4')">  <asp:Label CssClass="normal" ID="tab_2121_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.2.1!2!4')">  <asp:Label CssClass="normal" ID="tab_2121_w03_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.2.1!3!4')">  <asp:Label CssClass="normal" ID="tab_2121_w03_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.2.1!4!4')">  <asp:Label CssClass="normal" ID="tab_2121_w03_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.2.1!5!4')">  <asp:Label CssClass="normal" ID="tab_2121_w03_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.2.1!6!4')">  <asp:Label CssClass="normal" ID="tab_2121_w03_c06" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.2.1!7!4')">  <asp:Label CssClass="normal" ID="tab_2121_w03_c07" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.2.1!8!4')">  <asp:Label CssClass="normal" ID="tab_2121_w03_c08" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.2.1!9!4')">  <asp:Label CssClass="normal" ID="tab_2121_w03_c09" runat="server" Text="0"></asp:Label>  </a></td>
			  <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.2.1!10!4')">  <asp:Label CssClass="normal" ID="tab_2121_w03_c10" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderAll  col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.2.1!11!4')">  <asp:Label CssClass="normal" ID="tab_2121_w03_c11" runat="server" Text="0"></asp:Label>  </a></td>
      
               </tr>
             
            
               </table>
       </div>
       <div class="page-break">


           <strong>
           <br />
           Dział 2.2. </strong> Czas trwania postępowania sądowego od dnia pierwszej rejestracji do dnia uprawomocnienia się sprawy w I instancji (łącznie z czasem trwania mediacji)
		   <br />
           <br />

           <table cellpadding="0" cellspacing="0" class="auto-style14">
              
               <tr>
                   <td class="borderTopLeft " align="center">Sprawy wg repertoriów</td>
                   <td class="borderTopLeft col_76" align="center">L.p.</td>
                   <td class="borderTopLeft col_110" align="center">Razem (kol. od 2 do 9) </td>
                   <td class="borderTopLeft col_110" align="center">do 3 miesięcy</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 3 do 6</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 6 do 12 miesięcy</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 12 miesięcy  do 2 lat</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 2 do 3 lat</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 3 do 5 lat</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 5 do 8 lat</td>
                   
                   <td class="borderTopLeftRight col_110" align="center">ponad 8 lat</td>
               </tr>
               <tr>
                   <td class="borderTopLeft " align="center" colspan="2">0</td>
                   <td class="borderTopLeft col_110" align="center">1</td>
                   <td class="borderTopLeft col_110" align="center">2</td>
                   <td class="borderTopLeft col_110" align="center">3</td>
                   <td class="borderTopLeft col_110" align="center">4</td>
                   <td class="borderTopLeft col_110" align="center">5</td>
                   <td class="borderTopLeft col_110" align="center">6</td>
                   <td class="borderTopLeft col_110" align="center">7</td>
                   <td class="borderTopLeft col_110" align="center">8</td>
                   
                   <td class="borderTopLeftRight col_110" align="center">9</td>
               </tr>
               <tr>
                   <td class="wciecie borderTopLeft " align="center">OGÓŁEM
                       <br />
                       (w. 02 do 05)</td>
                   <td class="borderTopLeft col_36">01</td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.2!1!4')">  <asp:Label CssClass="normal" ID="tab_22_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.2!2!4')">  <asp:Label CssClass="normal" ID="tab_22_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_22_w01_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_22_w01_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_22_w01_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_22_w01_c06" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_22_w01_c07" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_22_w01_c08" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftRight col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_22_w01_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   
                           </tr>
               <tr>
                   <td class="wciecie borderTopLeft " align="center">U</td>
                   <td class="borderTopLeft col_36">02</td>
                   <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2!1!4')">  <asp:Label CssClass="normal" ID="tab_22_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2!2!4')">  <asp:Label CssClass="normal" ID="tab_22_w02_c02" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_22_w02_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_22_w02_c04" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_22_w02_c05" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_22_w02_c06" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_22_w02_c07" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_22_w02_c08" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeftRight col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_22_w02_c09" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
               <tr>
                   <td class="wciecie borderTopLeft " align="center">Uo</td>
                   <td class="borderTopLeft col_36">03</td>
                <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2!1!4')">  <asp:Label CssClass="normal" ID="tab_22_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2!2!4')">  <asp:Label CssClass="normal" ID="tab_22_w03_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_22_w03_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_22_w03_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_22_w03_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_22_w03_c06" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_22_w03_c07" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_22_w03_c08" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftRight col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_22_w03_c09" runat="server" Text="0"></asp:Label>  </a></td>
			
               </tr>
             
			     <tr>
                   <td class="wciecie borderTopLeft " align="center">P</td>
                   <td class="borderTopLeft col_36">04</td>
                <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2!1!4')">  <asp:Label CssClass="normal" ID="tab_22_w04_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2!2!4')">  <asp:Label CssClass="normal" ID="tab_22_w04_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_22_w04_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_22_w04_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_22_w04_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_22_w04_c06" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_22_w04_c07" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_22_w04_c08" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftRight col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_22_w04_c09" runat="server" Text="0"></asp:Label>  </a></td>
			
               </tr>
             
                <tr>
                   <td class="wciecie borderTopLeftBottom col_125">Np</td>
                   <td class="borderTopLeftBottom col_36">05</td>
                <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!2.2!1!4')">  <asp:Label CssClass="normal" ID="tab_22_w05_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!2.2!2!4')">  <asp:Label CssClass="normal" ID="tab_22_w05_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!2.2!3!4')">  <asp:Label CssClass="normal" ID="tab_22_w05_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!2.2!4!4')">  <asp:Label CssClass="normal" ID="tab_22_w05_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!2.2!5!4')">  <asp:Label CssClass="normal" ID="tab_22_w05_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!2.2!6!4')">  <asp:Label CssClass="normal" ID="tab_22_w05_c06" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!2.2!7!4')">  <asp:Label CssClass="normal" ID="tab_22_w05_c07" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!2.2!8!4')">  <asp:Label CssClass="normal" ID="tab_22_w05_c08" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderAll col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!2.2!9!4')">  <asp:Label CssClass="normal" ID="tab_22_w05_c09" runat="server" Text="0"></asp:Label>  </a></td>
			
               </tr>
             
            
			 
            
               </table>
       </div>
       <div class="page-break">


           <strong>
           <br />
           Dział 2.2.a. </strong> Czas trwania postępowania sądowego od dnia pierwszej rejestracji do dnia uprawomocnienia się sprawy merytorycznie zakończonej (wyrokiem, orzeczeniem) w I instancji (łącznie z czasem trwania mediacji)
		   <br />
           <br />

           <table cellpadding="0" cellspacing="0" class="auto-style14">
              
               <tr>
                   <td class="borderTopLeft " align="center">Sprawy wg repertoriów</td>
                   <td class="borderTopLeft col_76" align="center">L.p.</td>
                   <td class="borderTopLeft col_110" align="center">Razem (kol. od 2 do 9) </td>
                   <td class="borderTopLeft col_110" align="center">do 3 miesięcy</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 3 do 6</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 6 do 12 miesięcy</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 12 miesięcy  do 2 lat</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 2 do 3 lat</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 3 do 5 lat</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 5 do 8 lat</td>
                   
                   <td class="borderTopLeftRight col_110" align="center">ponad 8 lat</td>
               </tr>
               <tr>
                   <td class="borderTopLeft " align="center" colspan="2">0</td>
                   <td class="borderTopLeft col_110" align="center">1</td>
                   <td class="borderTopLeft col_110" align="center">2</td>
                   <td class="borderTopLeft col_110" align="center">3</td>
                   <td class="borderTopLeft col_110" align="center">4</td>
                   <td class="borderTopLeft col_110" align="center">5</td>
                   <td class="borderTopLeft col_110" align="center">6</td>
                   <td class="borderTopLeft col_110" align="center">7</td>
                   <td class="borderTopLeft col_110" align="center">8</td>
                   
                   <td class="borderTopLeftRight col_110" align="center">9</td>
               </tr>
               <tr>
                   <td class="wciecie borderTopLeft " align="center">OGÓŁEM
                       <br />
                       (w. 02 do 05)</td>
                   <td class="borderTopLeft col_36">01</td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.2.a!1!4')">  <asp:Label CssClass="normal" ID="tab_22a_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.2.a!2!4')">  <asp:Label CssClass="normal" ID="tab_22a_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.2.a!3!4')">  <asp:Label CssClass="normal" ID="tab_22a_w01_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.2.a!4!4')">  <asp:Label CssClass="normal" ID="tab_22a_w01_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.2.a!5!4')">  <asp:Label CssClass="normal" ID="tab_22a_w01_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.2.a!6!4')">  <asp:Label CssClass="normal" ID="tab_22a_w01_c06" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.2.a!7!4')">  <asp:Label CssClass="normal" ID="tab_22a_w01_c07" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.2.a!8!4')">  <asp:Label CssClass="normal" ID="tab_22a_w01_c08" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftRight col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.2.a!9!4')">  <asp:Label CssClass="normal" ID="tab_22a_w01_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   
                           </tr>
               <tr>
                   <td class="wciecie borderTopLeft " align="center">U</td>
                   <td class="borderTopLeft col_36">02</td>
                   <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.a!1!4')">  <asp:Label CssClass="normal" ID="tab_22a_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.a!2!4')">  <asp:Label CssClass="normal" ID="tab_22a_w02_c02" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.a!3!4')">  <asp:Label CssClass="normal" ID="tab_22a_w02_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.a!4!4')">  <asp:Label CssClass="normal" ID="tab_22a_w02_c04" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.a!5!4')">  <asp:Label CssClass="normal" ID="tab_22a_w02_c05" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.a!6!4')">  <asp:Label CssClass="normal" ID="tab_22a_w02_c06" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.a!7!4')">  <asp:Label CssClass="normal" ID="tab_22a_w02_c07" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.a!8!4')">  <asp:Label CssClass="normal" ID="tab_22a_w02_c08" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeftRight col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.a!9!4')">  <asp:Label CssClass="normal" ID="tab_22a_w02_c09" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
               <tr>
                   <td class="wciecie borderTopLeft " align="center">Uo</td>
                   <td class="borderTopLeft col_36">03</td>
                <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.a!1!4')">  <asp:Label CssClass="normal" ID="tab_22a_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.a!2!4')">  <asp:Label CssClass="normal" ID="tab_22a_w03_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.a!3!4')">  <asp:Label CssClass="normal" ID="tab_22a_w03_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.a!4!4')">  <asp:Label CssClass="normal" ID="tab_22a_w03_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.a!5!4')">  <asp:Label CssClass="normal" ID="tab_22a_w03_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.a!6!4')">  <asp:Label CssClass="normal" ID="tab_22a_w03_c06" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.a!7!4')">  <asp:Label CssClass="normal" ID="tab_22a_w03_c07" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.a!8!4')">  <asp:Label CssClass="normal" ID="tab_22a_w03_c08" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftRight col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.a!9!4')">  <asp:Label CssClass="normal" ID="tab_22a_w03_c09" runat="server" Text="0"></asp:Label>  </a></td>
			
               </tr>
             
			     <tr>
                   <td class="wciecie borderTopLeft " align="center">P</td>
                   <td class="borderTopLeft col_36">04</td>
                <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.a!1!4')">  <asp:Label CssClass="normal" ID="tab_22a_w04_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.a!2!4')">  <asp:Label CssClass="normal" ID="tab_22a_w04_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.a!3!4')">  <asp:Label CssClass="normal" ID="tab_22a_w04_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.a!4!4')">  <asp:Label CssClass="normal" ID="tab_22a_w04_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.a!5!4')">  <asp:Label CssClass="normal" ID="tab_22a_w04_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.a!6!4')">  <asp:Label CssClass="normal" ID="tab_22a_w04_c06" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.a!7!4')">  <asp:Label CssClass="normal" ID="tab_22a_w04_c07" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.a!8!4')">  <asp:Label CssClass="normal" ID="tab_22a_w04_c08" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftRight col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.a!9!4')">  <asp:Label CssClass="normal" ID="tab_22a_w04_c09" runat="server" Text="0"></asp:Label>  </a></td>
			
               </tr>
             
                <tr>
                   <td class="wciecie borderTopLeftBottom col_125">Np</td>
                   <td class="borderTopLeftBottom col_36">05</td>
                <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!2.2.a!1!4')">  <asp:Label CssClass="normal" ID="tab_22a_w05_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!2.2.a!2!4')">  <asp:Label CssClass="normal" ID="tab_22a_w05_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!2.2.a!3!4')">  <asp:Label CssClass="normal" ID="tab_22a_w05_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!2.2.a!4!4')">  <asp:Label CssClass="normal" ID="tab_22a_w05_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!2.2.a!5!4')">  <asp:Label CssClass="normal" ID="tab_22a_w05_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!2.2.a!6!4')">  <asp:Label CssClass="normal" ID="tab_22a_w05_c06" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!2.2.a!7!4')">  <asp:Label CssClass="normal" ID="tab_22a_w05_c07" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!2.2.a!8!4')">  <asp:Label CssClass="normal" ID="tab_22a_w05_c08" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderAll col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!2.2.a!9!4')">  <asp:Label CssClass="normal" ID="tab_22a_w05_c09" runat="server" Text="0"></asp:Label>  </a></td>
			
               </tr>
             
            
			 
            
               </table>
       </div>
       <div class="page-break">


           <strong>
           <br />
           Dział 2.2.1. </strong> Czas trwania postępowania sądowego od dnia pierwszej rejestracji do dnia uprawomocnienia się sprawy w I instancji (bez czasu trwania mediacji w sprawach wszczętych po 1 stycznia 2016r.)
		   <br />
           <br />

           <table cellpadding="0" cellspacing="0" class="auto-style14">
              
               <tr>
                   <td class="borderTopLeft " align="center">Sprawy wg repertoriów</td>
                   <td class="borderTopLeft col_76" align="center">L.p.</td>
                   <td class="borderTopLeft col_110" align="center">Razem (kol. od 2 do 9) </td>
                   <td class="borderTopLeft col_110" align="center">do 3 miesięcy</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 3 do 6</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 6 do 12 miesięcy</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 12 miesięcy  do 2 lat</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 2 do 3 lat</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 3 do 5 lat</td>
                   <td class="borderTopLeft col_110" align="center">powyżej 5 do 8 lat</td>
                   
                   <td class="borderTopLeftRight col_110" align="center">ponad 8 lat</td>
               </tr>
               <tr>
                   <td class="borderTopLeft " align="center" colspan="2">0</td>
                   <td class="borderTopLeft col_110" align="center">1</td>
                   <td class="borderTopLeft col_110" align="center">2</td>
                   <td class="borderTopLeft col_110" align="center">3</td>
                   <td class="borderTopLeft col_110" align="center">4</td>
                   <td class="borderTopLeft col_110" align="center">5</td>
                   <td class="borderTopLeft col_110" align="center">6</td>
                   <td class="borderTopLeft col_110" align="center">7</td>
                   <td class="borderTopLeft col_110" align="center">8</td>
                   
                   <td class="borderTopLeftRight col_110" align="center">9</td>
               </tr>
               <tr>
                   <td class="wciecie borderTopLeft " align="center">OGÓŁEM
                       <br />
                       (w. 02 do 05)</td>
                   <td class="borderTopLeft col_36">01</td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.2.1!1!4')">  <asp:Label CssClass="normal" ID="tab_221_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.2.1!2!4')">  <asp:Label CssClass="normal" ID="tab_221_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.2.1!3!4')">  <asp:Label CssClass="normal" ID="tab_221_w01_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.2.1!4!4')">  <asp:Label CssClass="normal" ID="tab_221_w01_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.2.1!5!4')">  <asp:Label CssClass="normal" ID="tab_221_w01_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.2.1!6!4')">  <asp:Label CssClass="normal" ID="tab_221_w01_c06" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.2.1!7!4')">  <asp:Label CssClass="normal" ID="tab_221_w01_c07" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.2.1!8!4')">  <asp:Label CssClass="normal" ID="tab_221_w01_c08" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftRight col_110"><a href="javascript:openPopup('popup.aspx?sesja=1!2.2.1!9!4')">  <asp:Label CssClass="normal" ID="tab_221_w01_c09" runat="server" Text="0"></asp:Label>  </a></td>
                   
                           </tr>
               <tr>
                   <td class="wciecie borderTopLeft " align="center">U</td>
                   <td class="borderTopLeft col_36">02</td>
                   <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.1!1!4')">  <asp:Label CssClass="normal" ID="tab_221_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.1!2!4')">  <asp:Label CssClass="normal" ID="tab_221_w02_c02" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.1!3!4')">  <asp:Label CssClass="normal" ID="tab_221_w02_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.1!4!4')">  <asp:Label CssClass="normal" ID="tab_221_w02_c04" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.1!5!4')">  <asp:Label CssClass="normal" ID="tab_221_w02_c05" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.1!6!4')">  <asp:Label CssClass="normal" ID="tab_221_w02_c06" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.1!7!4')">  <asp:Label CssClass="normal" ID="tab_221_w02_c07" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.1!8!4')">  <asp:Label CssClass="normal" ID="tab_221_w02_c08" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeftRight col_110"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.1!9!4')">  <asp:Label CssClass="normal" ID="tab_221_w02_c09" runat="server" Text="0"></asp:Label>  </a></td>
                </tr>
               <tr>
                   <td class="wciecie borderTopLeft " align="center">Uo</td>
                   <td class="borderTopLeft col_36">03</td>
                <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.1!1!4')">  <asp:Label CssClass="normal" ID="tab_221_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.1!2!4')">  <asp:Label CssClass="normal" ID="tab_221_w03_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.1!3!4')">  <asp:Label CssClass="normal" ID="tab_221_w03_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.1!4!4')">  <asp:Label CssClass="normal" ID="tab_221_w03_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.1!5!4')">  <asp:Label CssClass="normal" ID="tab_221_w03_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.1!6!4')">  <asp:Label CssClass="normal" ID="tab_221_w03_c06" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.1!7!4')">  <asp:Label CssClass="normal" ID="tab_221_w03_c07" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.1!8!4')">  <asp:Label CssClass="normal" ID="tab_221_w03_c08" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftRight col_110"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.1!9!4')">  <asp:Label CssClass="normal" ID="tab_221_w03_c09" runat="server" Text="0"></asp:Label>  </a></td>
			
               </tr>
             
			     <tr>
                   <td class="wciecie borderTopLeft " align="center">P</td>
                   <td class="borderTopLeft col_36">04</td>
                <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.1!1!4')">  <asp:Label CssClass="normal" ID="tab_221_w04_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.1!2!4')">  <asp:Label CssClass="normal" ID="tab_221_w04_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.1!3!4')">  <asp:Label CssClass="normal" ID="tab_221_w04_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.1!4!4')">  <asp:Label CssClass="normal" ID="tab_221_w04_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.1!5!4')">  <asp:Label CssClass="normal" ID="tab_221_w04_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.1!6!4')">  <asp:Label CssClass="normal" ID="tab_221_w04_c06" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.1!7!4')">  <asp:Label CssClass="normal" ID="tab_221_w04_c07" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.1!8!4')">  <asp:Label CssClass="normal" ID="tab_221_w04_c08" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftRight col_110"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.1!9!4')">  <asp:Label CssClass="normal" ID="tab_221_w04_c09" runat="server" Text="0"></asp:Label>  </a></td>
			
               </tr>
             
                <tr>
                   <td class="wciecie borderTopLeftBottom col_125">Np</td>
                   <td class="borderTopLeftBottom col_36">05</td>
                <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!2.2.1!1!4')">  <asp:Label CssClass="normal" ID="tab_221_w05_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!2.2.1!2!4')">  <asp:Label CssClass="normal" ID="tab_221_w05_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!2.2.1!3!4')">  <asp:Label CssClass="normal" ID="tab_221_w05_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!2.2.1!4!4')">  <asp:Label CssClass="normal" ID="tab_221_w05_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!2.2.1!5!4')">  <asp:Label CssClass="normal" ID="tab_221_w05_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!2.2.1!6!4')">  <asp:Label CssClass="normal" ID="tab_221_w05_c06" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!2.2.1!7!4')">  <asp:Label CssClass="normal" ID="tab_221_w05_c07" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!2.2.1!8!4')">  <asp:Label CssClass="normal" ID="tab_221_w05_c08" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderAll col_110"><a href="javascript:openPopup('popup.aspx?sesja=5!2.2.1!9!4')">  <asp:Label CssClass="normal" ID="tab_221_w05_c09" runat="server" Text="0"></asp:Label>  </a></td>
			
               </tr>
             
            
			 
            
               </table>
       </div>

     <div class="page-break">


           <strong>
           <br />
           Dział 2.3. </strong> Czas trwania postępowania sądowego od dnia pierwszej rejestracji do dnia uprawomocnienia się sprawy w I instancji (bez czasu trwania mediacji w sprawach wszczętych po 1 stycznia 2016r.)
		   <br />
           <br />

           <table cellpadding="0" cellspacing="0" class="auto-style14">
              
               <tr>
                   <td class="borderTopLeft " align="center">Sprawy wg repertoriów</td>
                   <td class="borderTopLeft col_76" align="center">L.p.</td>
                   <td class="borderTopLeft col_140" align="center">Razem (kol. od 2 do 7) </td>
                   <td class="borderTopLeft col_140" align="center">Do 1 miesiąca</td>
                   <td class="borderTopLeft col_140" align="center">Powyżej 1 do 2 miesięcy </td>
                   <td class="borderTopLeft col_140" align="center">Powyżej 2 do 3 miesięcy</td>
                   <td class="borderTopLeft col_140" align="center">Powyżej 3 do 6 miesięcy</td>
                   <td class="borderTopLeft col_140" align="center">Powyżej 6 do 9 miesięcy</td>
                   <td class="borderTopLeftRight col_140" align="center">Ponad 9 miesięcy</td>
               </tr>
               <tr>
                   <td class="borderTopLeft " align="center" colspan="2">0</td>
                   <td class="borderTopLeft col_140" align="center">1</td>
                   <td class="borderTopLeft col_140" align="center">2</td>
                   <td class="borderTopLeft col_140" align="center">3</td>
                   <td class="borderTopLeft col_140" align="center">4</td>
                   <td class="borderTopLeft col_140" align="center">5</td>
                   <td class="borderTopLeft col_140" align="center">6</td>
                  
                   
                   <td class="borderTopLeftRight col_140" align="center">7</td>
               </tr>
       
                <tr>
                   <td class="wciecie borderTopLeftBottom col_140">P</td>
                   <td class="borderTopLeftBottom " align="center">01</td>
                <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!2.3!1!4')">  <asp:Label CssClass="normal" ID="tab_23_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!2.3!2!4')">  <asp:Label CssClass="normal" ID="tab_23_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!2.3!3!4')">  <asp:Label CssClass="normal" ID="tab_23_w01_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!2.3!4!4')">  <asp:Label CssClass="normal" ID="tab_23_w01_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!2.3!5!4')">  <asp:Label CssClass="normal" ID="tab_23_w01_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!2.3!6!4')">  <asp:Label CssClass="normal" ID="tab_23_w01_c06" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderAll col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!2.3!7!4')">  <asp:Label CssClass="normal" ID="tab_23_w01_c07" runat="server" Text="0"></asp:Label>  </a></td>
			
               </tr>
             
            
			 
            
               </table>
       </div>


       
     <div class="page-break">


           <strong>
           <br />
           Dział 2.3.1. </strong> Czas trwania mediacji niezakończonych w sprawie od dnia wydania postanowienia o skierowaniu stron do mediacji do ostatniego dnia okresu sprawozdawczego
		   <br />
           <br />

           <table cellpadding="0" cellspacing="0" class="auto-style14">
              
               <tr>
                   <td class="borderTopLeft " align="center">Sprawy wg repertoriów</td>
                   <td class="borderTopLeft col_76" align="center">L.p.</td>
                   <td class="borderTopLeft col_140" align="center">Razem (kol. od 2 do 7) </td>
                   <td class="borderTopLeft col_140" align="center">Do 1 miesiąca</td>
                   <td class="borderTopLeft col_140" align="center">Powyżej 1 do 2 miesięcy </td>
                   <td class="borderTopLeft col_140" align="center">Powyżej 2 do 3 miesięcy</td>
                   <td class="borderTopLeft col_140" align="center">Powyżej 3 do 6 miesięcy</td>
                   <td class="borderTopLeft col_140" align="center">Powyżej 6 do 9 miesięcy</td>
                   <td class="borderTopLeftRight col_140" align="center">Ponad 9 miesięcy</td>
               </tr>
               <tr>
                   <td class="borderTopLeft " align="center" colspan="2">0</td>
                   <td class="borderTopLeft col_140" align="center">1</td>
                   <td class="borderTopLeft col_140" align="center">2</td>
                   <td class="borderTopLeft col_140" align="center">3</td>
                   <td class="borderTopLeft col_140" align="center">4</td>
                   <td class="borderTopLeft col_140" align="center">5</td>
                   <td class="borderTopLeft col_140" align="center">6</td>
                  
                   
                   <td class="borderTopLeftRight col_140" align="center">7</td>
               </tr>
       
                <tr>
                   <td class="wciecie borderTopLeftBottom col_140">P</td>
                   <td class="borderTopLeftBottom " align="center">01</td>
                <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!2.3.1!1!4')">  <asp:Label CssClass="normal" ID="tab_231_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!2.3.1!2!4')">  <asp:Label CssClass="normal" ID="tab_231_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!2.3.1!3!4')">  <asp:Label CssClass="normal" ID="tab_231_w01_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!2.3.1!4!4')">  <asp:Label CssClass="normal" ID="tab_231_w01_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!2.3.1!5!4')">  <asp:Label CssClass="normal" ID="tab_231_w01_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!2.3.1!6!4')">  <asp:Label CssClass="normal" ID="tab_231_w01_c06" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderAll col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!2.3.1!7!4')">  <asp:Label CssClass="normal" ID="tab_231_w01_c07" runat="server" Text="0"></asp:Label>  </a></td>
			
               </tr>
             
            
			 
            
               </table>
       </div>

       <div class="page-break">


           <strong>
           <br />
           Dział 3. </strong> Wyznaczenie pierwszej rozprawy/posiedzenia spraw (od dnia wpływu/wpisu sprawy wraz ze sprawami zawieszonymi poprzednio zakreślonymi do dnia, w którym odbyła się pierwsza rozprawa/posiedzenie)

		   <br />
           <br />

           <table cellpadding="0" cellspacing="0" class="auto-style14">
              
               <tr>
                   <td class="borderTopLeft " align="center">Sprawy wg repertoriów</td>
                   <td class="borderTopLeft col_76" align="center">L.p.</td>
                   <td class="borderTopLeft col_121" align="center">Razem (kol. od 2 do 8) </td>
                   <td class="borderTopLeft col_121" align="center">do 1 mies.</td>
                   <td class="borderTopLeft col_121" align="center">powyżej 3 do 6</td>
                   <td class="borderTopLeft col_121" align="center">powyżej 6 do 12 miesięcy</td>
                   <td class="borderTopLeft col_121" align="center">powyżej 12 miesięcy  do 2 lat</td>
                   <td class="borderTopLeft col_121" align="center">powyżej 2 do 3 lat</td>
                   <td class="borderTopLeft col_121" align="center">powyżej 3 do 5 lat</td>
                   <td class="borderTopLeftRight col_121" align="center">powyżej 5 do 8 lat</td>
                   
               </tr>
               <tr>
                   <td class="borderTopLeft " align="center" colspan="2">0</td>
                   <td class="borderTopLeft col_121" align="center">1</td>
                   <td class="borderTopLeft col_121" align="center">2</td>
                   <td class="borderTopLeft col_121" align="center">3</td>
                   <td class="borderTopLeft col_121" align="center">4</td>
                   <td class="borderTopLeft col_121" align="center">5</td>
                   <td class="borderTopLeft col_121" align="center">6</td>
                   <td class="borderTopLeft col_121" align="center">7</td>
                   
                   
                   <td class="borderTopLeftRight col_121" align="center">8</td>
               </tr>
               <tr>
                   <td class="wciecie borderTopLeft " align="center">U</td>
                   <td class="borderTopLeft col_36">01</td>
                  <td class="borderTopLeft col_121"><a href="javascript:openPopup('popup.aspx?sesja=1!3!1!4')">  <asp:Label CssClass="normal" ID="tab_3_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_121"><a href="javascript:openPopup('popup.aspx?sesja=1!3!2!4')">  <asp:Label CssClass="normal" ID="tab_3_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_121"><a href="javascript:openPopup('popup.aspx?sesja=1!3!3!4')">  <asp:Label CssClass="normal" ID="tab_3_w01_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_121"><a href="javascript:openPopup('popup.aspx?sesja=1!3!4!4')">  <asp:Label CssClass="normal" ID="tab_3_w01_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_121"><a href="javascript:openPopup('popup.aspx?sesja=1!3!5!4')">  <asp:Label CssClass="normal" ID="tab_3_w01_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_121"><a href="javascript:openPopup('popup.aspx?sesja=1!3!6!4')">  <asp:Label CssClass="normal" ID="tab_3_w01_c06" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_121"><a href="javascript:openPopup('popup.aspx?sesja=1!3!7!4')">  <asp:Label CssClass="normal" ID="tab_3_w01_c07" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftRight col_121"><a href="javascript:openPopup('popup.aspx?sesja=1!3!8!4')">  <asp:Label CssClass="normal" ID="tab_3_w01_c08" runat="server" Text="0"></asp:Label>  </a></td>
              
                   
                           </tr>
               <tr>
                   <td class="wciecie borderTopLeft " align="center">P</td>
                   <td class="borderTopLeft col_36">02</td>
                   <td class="borderTopLeft col_121"><a href="javascript:openPopup('popup.aspx?sesja=2!3!1!4')">  <asp:Label CssClass="normal" ID="tab_3_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_121"><a href="javascript:openPopup('popup.aspx?sesja=2!3!2!4')">  <asp:Label CssClass="normal" ID="tab_3_w02_c02" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_121"><a href="javascript:openPopup('popup.aspx?sesja=2!3!3!4')">  <asp:Label CssClass="normal" ID="tab_3_w02_c03" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_121"><a href="javascript:openPopup('popup.aspx?sesja=2!3!4!4')">  <asp:Label CssClass="normal" ID="tab_3_w02_c04" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_121"><a href="javascript:openPopup('popup.aspx?sesja=2!3!5!4')">  <asp:Label CssClass="normal" ID="tab_3_w02_c05" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_121"><a href="javascript:openPopup('popup.aspx?sesja=2!3!6!4')">  <asp:Label CssClass="normal" ID="tab_3_w02_c06" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeft col_121"><a href="javascript:openPopup('popup.aspx?sesja=2!3!7!4')">  <asp:Label CssClass="normal" ID="tab_3_w02_c07" runat="server" Text="0"></asp:Label>  </a></td>
                  <td class="borderTopLeftRight col_121"><a href="javascript:openPopup('popup.aspx?sesja=2!3!8!4')">  <asp:Label CssClass="normal" ID="tab_3_w02_c08" runat="server" Text="0"></asp:Label>  </a></td>
                  
                </tr>
               <tr>
                   <td class="wciecie borderTopLeftBottom " align="center">Np</td>
                   <td class="borderTopLeftBottom col_36">03</td>
                <td class="borderTopLeftBottom col_121"><a href="javascript:openPopup('popup.aspx?sesja=3!3!1!4')">  <asp:Label CssClass="normal" ID="tab_3_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_121"><a href="javascript:openPopup('popup.aspx?sesja=3!3!2!4')">  <asp:Label CssClass="normal" ID="tab_3_w03_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_121"><a href="javascript:openPopup('popup.aspx?sesja=3!3!3!4')">  <asp:Label CssClass="normal" ID="tab_3_w03_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_121"><a href="javascript:openPopup('popup.aspx?sesja=3!3!4!4')">  <asp:Label CssClass="normal" ID="tab_3_w03_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_121"><a href="javascript:openPopup('popup.aspx?sesja=3!3!5!4')">  <asp:Label CssClass="normal" ID="tab_3_w03_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_121"><a href="javascript:openPopup('popup.aspx?sesja=3!3!6!4')">  <asp:Label CssClass="normal" ID="tab_3_w03_c06" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_121"><a href="javascript:openPopup('popup.aspx?sesja=3!3!7!4')">  <asp:Label CssClass="normal" ID="tab_3_w03_c07" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderAll col_121"><a href="javascript:openPopup('popup.aspx?sesja=3!3!8!4')">  <asp:Label CssClass="normal" ID="tab_3_w03_c08" runat="server" Text="0"></asp:Label>  </a></td>
              
			
               </tr>
             
			    
            
			 
            
               </table>
       </div>

       <div class="page-break">


           <strong>
           <br />
           Dział 4.1. </strong> Terminowość postępowania międzyinstancyjnego  w pierwszej instancji
		   <br />
           <br />

           <table cellpadding="0" cellspacing="0" class="auto-style14">
              
               <tr>
                   <td class="borderTopLeft " align="center" colspan="2" rowspan="2">Środki odwoławcze, które zostały przekazane  do rozpoznania sądowi II instancji</td>
                   <td class="borderTopLeft col_140" align="center" rowspan="2">Ogółem<br />
                       (ko. 2 do 7) </td>
                   <td class="borderTopLeftRight" align="center" colspan="6">Z tego od daty orzeczenia sądu rejonowego do daty przekazania do sądu II instancji upłynął okres</td>
               </tr>
              
               <tr>
                   <td class="borderTopLeft col_140" align="center">Do 1 miesiąca</td>
                   <td class="borderTopLeft col_140" align="center">Powyżej 2 do 3 miesięcy </td>
                   <td class="borderTopLeft col_140" align="center">Powyżej 3 do 6 miesięcy</td>
                   <td class="borderTopLeft col_140" align="center">Powyżej 6 do 12 miesięcy</td>
                   <td class="borderTopLeft col_140" align="center">Powyżej 12 mies. do 2 lat</td>
                   <td class="borderTopLeftRight col_140" align="center">Ponad 2 lata</td>
               </tr>
               <tr>
                   <td class="borderTopLeft " align="center" colspan="2">0</td>
                   <td class="borderTopLeft col_140" align="center">1</td>
                   <td class="borderTopLeft col_140" align="center">2</td>
                   <td class="borderTopLeft col_140" align="center">3</td>
                   <td class="borderTopLeft col_140" align="center">4</td>
                   <td class="borderTopLeft col_140" align="center">5</td>
                   <td class="borderTopLeft col_140" align="center">6</td>
                  
                   
                   <td class="borderTopLeftRight col_140" align="center">7</td>
               </tr>
       
                <tr>
                   <td class="wciecie borderTopLeftBottom ">Apelacje</td>
                   <td class="borderTopLeftBottom " align="center">01</td>
                <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!4.1!1!4')">  <asp:Label CssClass="normal" ID="tab_41_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!4.1!2!4')">  <asp:Label CssClass="normal" ID="tab_41_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!4.1!3!4')">  <asp:Label CssClass="normal" ID="tab_41_w01_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!4.1!4!4')">  <asp:Label CssClass="normal" ID="tab_41_w01_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!4.1!5!4')">  <asp:Label CssClass="normal" ID="tab_41_w01_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!4.1!6!4')">  <asp:Label CssClass="normal" ID="tab_41_w01_c06" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderAll col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!4.1!7!4')">  <asp:Label CssClass="normal" ID="tab_41_w01_c07" runat="server" Text="0"></asp:Label>  </a></td>
			
               </tr>
             
            
			 
            
                <tr>
                   <td class="wciecie borderTopLeftBottom ">Zażalenia</td>
                   <td class="borderTopLeftBottom " align="center">02</td>
                <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=2!4.1!1!4')">  <asp:Label CssClass="normal" ID="tab_41_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=2!4.1!2!4')">  <asp:Label CssClass="normal" ID="tab_41_w02_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=2!4.1!3!4')">  <asp:Label CssClass="normal" ID="tab_41_w02_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=2!4.1!4!4')">  <asp:Label CssClass="normal" ID="tab_41_w02_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=21!4.1!5!4')">  <asp:Label CssClass="normal" ID="tab_41_w02_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=2!4.1!6!4')">  <asp:Label CssClass="normal" ID="tab_41_w02_c06" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderAll col_140"><a href="javascript:openPopup('popup.aspx?sesja=2!4.1!7!4')">  <asp:Label CssClass="normal" ID="tab_41_w02_c07" runat="server" Text="0"></asp:Label>  </a></td>
						
               </tr>
             
            
			 
            
               </table>
       </div>

          <div class="page-break">


           <strong>
           <br />
           Dział 4.2. </strong> . Kontrolka skarg (w wydziale, którego sprawy skarga dotyczy) (§ 4485 ust.1. Zarządzenie Ministra Sprawiedliwości z dnia 12 grudnia 2003 r. w sprawie organizacji i zakresu działania sekretariatów sądowych oraz innych działów administracji sądowej (Dz. Urz. MS. Nr 5, poz.22 z późn. zm.)
		   <br />
           <br />

           <table cellpadding="0" cellspacing="0" class="auto-style14">
              
               <tr>
                   <td class="borderTopLeft " align="center" colspan="3" rowspan="2">Środki odwoławcze, które zostały przekazane  do rozpoznania sądowi II instancji</td>
                   <td class="borderTopLeft col_140" align="center" rowspan="2">Wpłynęło</td>
                   <td class="borderTopLeft col_140" align="center" rowspan="2">Przesłano do sądu właściwego</td>
                   <td class="borderTopLeft" align="center" colspan="3">Rozpoznanie skargi</td>
                   <td class="borderTopLeft col_140" align="center" rowspan="2">Zarządzono wypłatę przez Skarb Państwa</td>
                   <td class="borderTopLeftRight col_140" align="center" rowspan="2">Kwota<br />
                       (w złotych)</td>
               </tr>
              
               <tr>
                   <td class="borderTopLeft col_140" align="center">uwzględniono</td>
                   <td class="borderTopLeft col_140" align="center">oddalono</td>
                   <td class="borderTopLeft col_140" align="center">inne</td>
               </tr>
               <tr>
                   <td class="borderTopLeft " align="center" colspan="3">0</td>
                   <td class="borderTopLeft col_140" align="center">1</td>
                   <td class="borderTopLeft col_140" align="center">2</td>
                   <td class="borderTopLeft col_140" align="center">3</td>
                   <td class="borderTopLeft col_140" align="center">4</td>
                   <td class="borderTopLeft col_140" align="center">5</td>
                   <td class="borderTopLeft col_140" align="center">6</td>
                  
                   
                   <td class="borderTopLeftRight col_140" align="center">7</td>
               </tr>
       
                <tr>
                   <td class="wciecie borderTopLeftBottom col_140" rowspan="2">Skargi na pracę sądu</td>
                   <td class="wciecie borderTopLeft col_140">sprawy ubezpieczeń społecznych</td>
                   <td class="borderTopLeft " align="center">01</td>
                <td class="borderTopLeft col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!4.2!1!4')">  <asp:Label CssClass="normal" ID="tab_42_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!4.2!2!4')">  <asp:Label CssClass="normal" ID="tab_42_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!4.2!3!4')">  <asp:Label CssClass="normal" ID="tab_42_w01_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!4.2!4!4')">  <asp:Label CssClass="normal" ID="tab_42_w01_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!4.2!5!4')">  <asp:Label CssClass="normal" ID="tab_42_w01_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!4.2!6!4')">  <asp:Label CssClass="normal" ID="tab_42_w01_c06" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderAll col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!4.2!7!4')">  <asp:Label CssClass="normal" ID="tab_42_w01_c07" runat="server" Text="0"></asp:Label>  </a></td>
			
               </tr>
             
                <tr>
                   <td class="wciecie borderTopLeftBottom col_140">sprawy pracy</td>
                   <td class="borderTopLeftBottom " align="center">02</td>
                <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=2!4.2!1!4')">  <asp:Label CssClass="normal" ID="tab_42_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=2!4.2!2!4')">  <asp:Label CssClass="normal" ID="tab_42_w02_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=2!4.2!3!4')">  <asp:Label CssClass="normal" ID="tab_42_w02_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=2!4.2!4!4')">  <asp:Label CssClass="normal" ID="tab_42_w02_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=2!4.2!5!4')">  <asp:Label CssClass="normal" ID="tab_42_w02_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=2!4.2!6!4')">  <asp:Label CssClass="normal" ID="tab_42_w02_c06" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderAll col_140"><a href="javascript:openPopup('popup.aspx?sesja=2!4.2!7!4')">  <asp:Label CssClass="normal" ID="tab_42_w02_c07" runat="server" Text="0"></asp:Label>  </a></td>
			
               </tr>
            
			 
            
               </table>
       </div>

          <div class="page-break">


           <strong>
           <br />
           Dział 5.1. </strong> Limity etatów i obsada Sądu (Wydziału)
		   <br />
           <br />

          <table style="width: 100%;" cellpadding="0" cellspacing="0">
               <tr>
                   <td colspan="2" class="borderTopLeft">Wyszczególnienie</td>
                   <td class="borderTopLeft " align="center">Liczba sędziów SR i wakujących stanowisk sędziowskich w ramach limitu<br/><em>(na ostatni dzień okresu statystycznego)</em></td>
                   <td class="borderTopLeft ">Liczba sędziów SR  i wakujących stanowisk sędziowskich w ramach limitu 
                       <br/><em>(w okresie statystycznym)</em></td>
                   <td class="borderTopLeft ">Obsada średniookresowa sędziowie SR z wyłączeniem sędziów funkcyjnych oraz delegowanych do pełnienia czynności w Ministerstwie Sprawiedliwości, KSSiP, a także delegowanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekający w pełnym wymiarze w SO i delegowanych do pełnienia czynności orzeczniczych w pełnym wymiarze w innym sądzie rejonowym</td>
                   <td class="borderTopLeft ">Liczba sędziów SR z wyłączeniem sędziów funkcyjnych oraz delegowanych do pełnienia czynności w Ministerstwie Sprawiedliwości, KSSiP,a także delegowanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekających w pełnym wymiarze w SO i delegowanych do pełnienia czynności orzeczniczych w pełnym wymiarze w innym sądzie rejonowym</td>
                   <td class="borderTopLeft ">Obsada średniookresowa sędziowie SO delegowanych do pełnienia czynności orzeczniczych w pełnym lub niepełnym wymiarze w danym sądzie,  w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony  </td>
                   <td class="borderTopLeft ">Liczba sędziów SO delegowanych do pełnienia czynności orzeczniczych w pełnym lub niepełnym wymiarze w danym sądzie w trybie art. 77 § 1 usp na czas określony lub nieokreślony </td>
                   <td class="borderTopLeft ">Obsada sędziów danego SR delegowanych do pełnienia czynności orzeczniczych w pełnym wymiarze  w innym sądzie rejonowym</td>
                   <td class="borderTopLeft ">Liczba sędziów  danego SR delegowanych do pełnienia czynności orzeczniczych w pełnym wymiarze w innym sądzie rejonowym</td>
                   <td class="borderTopLeft ">Obsada sędziów innego SR delegowanych do pełnienia  czynności orzeczniczych w pełnym lub niepełnym wymiarze w danym sądzie rejonowym</td>
                   <td class="borderTopLeft ">Liczba sędziów innego SR delegowanych do pełnienia  czynności orzeczniczych w pełnym lub niepełnym wymiarze w danym sądzie rejonowym</td>
                   <td class="borderTopLeft ">Obsada średniookresowa (sędziowie  funkcyjni SR) - I wersja </td>
                   <td class="borderTopLeft ">Obsada średniookresowa (sędziowie  funkcyjni SR) - II wersja </td>
                   <td class="borderTopLeft ">Liczba sędziów (funkcyjnych SR tego sądu )</td>
                   <td class="borderTopLeft ">Liczba sędziów SR  w ramach limitu (na ostatni dzień okresu statystycznego delegowanych do pełnienia czynności w Ministerstwie Sprawiedliwości)</td>
                   <td class="borderTopLeft ">Liczba sędziów delegowanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony do pełnienia czynności w Ministerstwie Sprawiedliwości </td>
                   <td class="borderTopLeft ">Obsada sędziów delegowanych do KSSiP w ramach limitu (w ostatnim dniu okresu statystycznego)</td>
                   <td class="borderTopLeft ">Liczba sędziów delegowanych do KSSiP w ramach limitu (w ostatnim dniu okresu statystycznego)</td>
                   <td class="borderTopLeft ">Obsada średniookresowa sędziów SR  delegowanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekających w pełnym wymiarze w SO</td>
                   <td class="borderTopLeft ">Liczba sędziów SR  delegowanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekających w pełnym wymiarze w SO</td>
                   <td class="borderTopLeft ">Obsada średniookresowa  sędziów delegowanych w trybie art. 77 § 9usp do SO</td>
                   <td class="borderTopLeft ">Liczba sędziów delegowanych w trybie art. 77 § 9 usp do SO </td>
                   <td class="borderTopLeft ">Łączna liczba sesji w danym okresie statystycznym (rozprawy i posiedzenia) sędziów SR z wyłączeniem sędziów funkcyjnych, sędziów delegowanych do KSSiP oraz delegowanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekający w pełnym wymiarze w SO i sędziów SR delegowanych do pełnienia czynności orzeczniczych do innego i z innego sądu rejonowego</td>
                   <td class="borderTopLeft ">Średniookresowa liczba sesji w danym okresie statystycznym (rozprawy i posiedzenia) jednego sędziego SR z wyłączeniem sędziów funkcyjnych, sędziów delegowanych do KSSiP oraz  delegowanych w trybie art. 77 § 1 usp na czas nieokreślony lub na czas określony orzekający w pełnym wymiarze w SO i sędziów SR delegowanych do pełnienia czynności orzeczniczych do innego i z innego sądu rejonowego</td>
                   <td class="borderTopLeft ">Liczba obsadzonych etatów (na ostatni dzień okresu statystycznego)</td>
                   <td class="borderTopLeftRight ">Liczba obsadzonych etatów (w okresie statystycznym)</td>
               </tr>
               <tr>
                   <td colspan="2" class="borderTopLeft " align="center">0</td>
                   <td class="borderTopLeft " align="center">1</td>
                   <td class="borderTopLeft" align="center">2</td>
                   <td class="borderTopLeft" align="center">3</td>
                   <td class="borderTopLeft" align="center">4</td>
                   <td class="borderTopLeft" align="center">5</td>
                   <td class="borderTopLeft" align="center">6</td>
                   <td class="borderTopLeft" align="center">7</td>
                   <td class="borderTopLeft" align="center">8</td>
                   <td class="borderTopLeft" align="center">9</td>
                   <td class="borderTopLeft" align="center">10</td>
                   <td class="borderTopLeft" align="center">11</td>
                   <td class="borderTopLeft" align="center">12</td>
                   <td class="borderTopLeft" align="center">13</td>
                   <td class="borderTopLeft" align="center">14</td>
                   <td class="borderTopLeft" align="center">15</td>
                   <td class="borderTopLeft" align="center">16</td>
                   <td class="borderTopLeft" align="center">17</td>
                   <td class="borderTopLeft" align="center">18</td>
                   <td class="borderTopLeft" align="center">19</td>
                   <td class="borderTopLeft" align="center">20</td>
                   <td class="borderTopLeft" align="center">21</td>
                   <td class="borderTopLeft" align="center">22</td>
                   <td class="borderTopLeft" align="center">23</td>
                   <td class="borderTopLeft" align="center">24</td>
                   <td class="borderTopLeftRight  " align="center">25</td>
               </tr>
               <tr>
			   
                   <td class="borderTopLeftBottom  wciecie">Sędziowie z wydziałów pracy i ubezpieczeń</td>
                   <td class="borderTopLeftBottom  col_36">01</td>
                   <td class="borderTopLeftBottom  col_36" align="center"><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!1!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w01_c01" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!2!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w01_c02" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!3!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w01_c03" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!4!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w01_c04" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!5!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w01_c05" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!6!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w01_c06" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!7!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w01_c07" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!8!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w01_c08" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!9!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w01_c09" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!10!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w01_c10" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!11!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w01_c11" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!12!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w01_c12" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!13!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w01_c13" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!14!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w01_c14" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!15!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w01_c15" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!16!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w01_c16" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!17!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w01_c17" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!18!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w01_c18" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!19!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w01_c19" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!20!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w01_c20" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!21!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w01_c21" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!22!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w01_c22" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!23!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w01_c23" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!24!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w01_c24" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderAll  col_36"><a href="javascript:openPopup('popup.aspx?sesja=1!5.1!25!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w01_c25" runat="server" Text="0"></asp:Label>
                       </a></td>
               </tr>
            <tr>
			   
                   <td class="borderTopLeftBottom  wciecie">Sędziowie z wydziałów pracy</td>
                   <td class="borderTopLeftBottom  col_36">02</td>
                   <td class="borderTopLeftBottom  col_36" align="center"><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!1!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w02_c01" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!2!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w02_c02" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!3!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w02_c03" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!4!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w02_c04" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!5!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w02_c05" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!6!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w02_c06" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!7!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w02_c07" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!8!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w02_c08" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!9!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w02_c09" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!10!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w02_c10" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!11!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w02_c11" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!12!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w02_c12" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!13!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w02_c13" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!14!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w02_c14" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!15!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w02_c15" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!16!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w02_c16" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!17!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w02_c17" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!18!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w02_c18" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!19!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w02_c19" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!20!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w02_c20" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!21!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w02_c21" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!22!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w02_c22" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!23!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w02_c23" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!24!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w02_c24" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderAll  col_36"><a href="javascript:openPopup('popup.aspx?sesja=2!5.1!25!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w02_c25" runat="server" Text="0"></asp:Label>
                       </a></td>
               </tr>
			    <tr>
			   
                   <td class="borderTopLeftBottom  wciecie">Sędziowie z wydziałów ubezpieczeń</td>
                   <td class="borderTopLeftBottom  col_36">03</td>
                   <td class="borderTopLeftBottom  col_36" align="center"><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!1!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w03_c01" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!2!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w03_c02" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!3!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w03_c03" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!4!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w03_c04" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!5!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w03_c05" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!6!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w03_c06" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!7!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w03_c07" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!8!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w03_c08" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!9!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w03_c09" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!10!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w03_c10" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!11!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w03_c11" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!12!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w03_c12" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!13!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w03_c13" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!14!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w03_c14" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!15!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w03_c15" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!16!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w03_c16" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!17!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w03_c17" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!18!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w03_c18" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!19!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w03_c19" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!20!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w03_c20" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!21!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w03_c21" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!22!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w03_c22" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!23!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w03_c23" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderTopLeftBottom  col_36"><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!24!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w03_c24" runat="server" Text="0"></asp:Label>
                       </a></td>
                   <td class="borderAll  col_36"><a href="javascript:openPopup('popup.aspx?sesja=3!5.1!25!4')">
                       <asp:Label CssClass="normal" ID="tab_51_w03_c25" runat="server" Text="0"></asp:Label>
                       </a></td>
               </tr>
			   
		  </table>
       </div>

              <div class="page-break">


           <strong>
           <br />
           Dział 5.2. </strong> Obsada Sądu (Wydziału)
		   <br />
           <br />

           <table cellpadding="0" cellspacing="0" class="auto-style14">
              
               <tr>
                   <td class="borderTopLeft " align="center" colspan="3">treść</td>
                   <td class="borderTopLeft col_140" align="center">Liczba według limitu etatów na ostatni dzień okresu statystycznego</td>
                   <td class="borderTopLeft col_140" align="center">Liczba według limitu etatów w okresie statystycznym</td>
                   <td class="borderTopLeft col_140" align="center">Obsada średniookresowa</td>
                   <td class="borderTopLeft col_140" align="center">W tym obsada osób świadczących usługi na rzecz e-sądu </td>
                   <td class="borderTopLeft col_140" align="center">Liczba obsadzonych etatów na ostatni dzień okresu statystycznego</td>
                   <td class="borderTopLeftRight col_140" align="center">Liczba obsadzonych etatów w okresie statystycznym)</td>
                   
               </tr>
               <tr>
                   <td class="borderTopLeft " align="center" colspan="3">0</td>
                   <td class="borderTopLeft col_140" align="center">1</td>
                   <td class="borderTopLeft col_140" align="center">2</td>
                   <td class="borderTopLeft col_140" align="center">3</td>
                   <td class="borderTopLeft col_140" align="center">4</td>
                   <td class="borderTopLeft col_140" align="center">5</td>
                   <td class="borderTopLeftRight col_140" align="center">6</td>
                  
                   
               </tr>
       
                <tr>
                   <td class="borderTopLeft" align="center" colspan="2">Referendarze</td>
                   <td class="borderTopLeft " align="center">01</td>
                  <td class="borderTopLeft col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!5.2!1!4')">  <asp:Label CssClass="normal" ID="tab_52_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!5.2!2!4')">  <asp:Label CssClass="normal" ID="tab_52_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!5.2!3!4')">  <asp:Label CssClass="normal" ID="tab_52_w01_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!5.2!4!4')">  <asp:Label CssClass="normal" ID="tab_52_w01_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!5.2!5!4')">  <asp:Label CssClass="normal" ID="tab_52_w01_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftRight col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!5.2!6!4')">  <asp:Label CssClass="normal" ID="tab_52_w01_c06" runat="server" Text="0"></asp:Label>  </a></td>
          	
          	
               </tr>
             
                <tr>
                   <td class="wciecie borderTopLeftBottom col_140" rowspan="2">Pracownicy administracyjni</td>
                   <td class="wciecie borderTopLeft col_140">urzędnicy</td>
                   <td class="borderTopLeft " align="center">02</td>
                <td class="borderTopLeft col_140"><a href="javascript:openPopup('popup.aspx?sesja=2!5.2!1!4')">  <asp:Label CssClass="normal" ID="tab_52_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_140"><a href="javascript:openPopup('popup.aspx?sesja=2!5.2!2!4')">  <asp:Label CssClass="normal" ID="tab_52_w02_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_140"><a href="javascript:openPopup('popup.aspx?sesja=2!5.2!3!4')">  <asp:Label CssClass="normal" ID="tab_52_w02_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_140"><a href="javascript:openPopup('popup.aspx?sesja=2!5.2!4!4')">  <asp:Label CssClass="normal" ID="tab_52_w02_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeft col_140"><a href="javascript:openPopup('popup.aspx?sesja=2!5.2!5!4')">  <asp:Label CssClass="normal" ID="tab_52_w02_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftRight col_140"><a href="javascript:openPopup('popup.aspx?sesja=2!5.2!6!4')">  <asp:Label CssClass="normal" ID="tab_52_w02_c06" runat="server" Text="0"></asp:Label>  </a></td>
          	
               </tr>
             
                <tr>
                   <td class="wciecie borderTopLeftBottom col_140">asystenci sędziów</td>
                   <td class="borderTopLeftBottom " align="center">03</td>
                <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=3!5.2!1!4')">  <asp:Label CssClass="normal" ID="tab_52_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=3!5.2!2!4')">  <asp:Label CssClass="normal" ID="tab_52_w03_c02" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=3!5.2!3!4')">  <asp:Label CssClass="normal" ID="tab_52_w03_c03" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=3!5.2!4!4')">  <asp:Label CssClass="normal" ID="tab_52_w03_c04" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=3!5.2!5!4')">  <asp:Label CssClass="normal" ID="tab_52_w03_c05" runat="server" Text="0"></asp:Label>  </a></td>
              <td class="borderTopLeftBottom col_140"><a href="javascript:openPopup('popup.aspx?sesja=3!5.2!6!4')">  <asp:Label CssClass="normal" ID="tab_52_w03_c06" runat="server" Text="0"></asp:Label>  </a></td>
          
               </tr>
            
			 
            
               </table>
       </div>





    <div id="debag" >
     
          <div class="page-break">


           <strong>
           <br />
           Dział 6. </strong> Prawomocnie zasądzone odszkodowania i zadośćuczynienia (w okresie sprawozdawczym)
		      <br />
              <br />
                  <table style="width:100%;" cellpadding="0" cellspacing="0">
                  <tr>
                      <td align="center" class="borderTopLeft" rowspan="3" colspan="4">Wyszczególnienia</td>
                      <td align="center" class="borderTopLeft" rowspan="3">L.P.</td>
                      <td align="center" class="borderTopLeft" colspan="3">Liczba</td>
                      <td align="center" class="borderTopLeft" rowspan="3">Łączna wysokość odszkodowań (zł)</td>
                      <td align="center" class="borderTopLeftRight" rowspan="3">Łączna wysokość zadośćuczynienia</td>
                  </tr>
                  <tr>
                      <td align="center" class="borderTopLeft" rowspan="2">spraw</td>
                      <td align="center" class="borderTopLeft" colspan="2">osób którym zasądzono</td>
                  </tr>
                  <tr>
                      <td align="center" class="borderTopLeft">odszkodowania</td>
                      <td align="center" class="borderTopLeft">zadośćuczynienia</td>
                  </tr>
                  <tr>
                      <td align="center" class="borderTopLeft" colspan="5">0</td>
                      <td align="center" class="borderTopLeft">1</td>
                      <td align="center" class="borderTopLeft">2</td>
                      <td align="center" class="borderTopLeft">3</td>
                      <td align="center" class="borderTopLeft">4</td>
                      <td align="center" class="borderTopLeftRight">5</td>
                  </tr>
                  <tr>
                    <td class="wciecie borderTopLeft" colspan="4">Ogółem ubezpieczeniowe (w. 02 do 06)</td>
                      <td align="center" class="borderTopLeft col_36">01</td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!6!2!4')">  <asp:Label CssClass="normal" ID="tab_6_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!6!3!4')">  <asp:Label CssClass="normal" ID="tab_6_w01_c03" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!6!4!4')">  <asp:Label CssClass="normal" ID="tab_6_w01_c04" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!6!5!4')">  <asp:Label CssClass="normal" ID="tab_6_w01_c05" runat="server" Text="0"></asp:Label>  </a></td>
             
                  </tr>
                  <tr>
                      <td class="wciecie borderTopLeft" colspan="2" rowspan="2">odszkodowania z tytułu</td>
                      <td class="wciecie borderTopLeft">wypadku przy pracy rolniczej lub rolniczej choroby zawodowej</td>
                      <td align="center" class="borderTopLeft">514</td>
                      <td align="center" class="borderTopLeft col_36">02</td>
        			<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!6!2!4')">  <asp:Label CssClass="normal" ID="tab_6_w02_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!6!3!4')">  <asp:Label CssClass="normal" ID="tab_6_w02_c03" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!6!4!4')">  <asp:Label CssClass="normal" ID="tab_6_w02_c04" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!6!5!4')">  <asp:Label CssClass="normal" ID="tab_6_w02_c05" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="wciecie borderTopLeft">wypadku przy pracy lub choroby zawodowej </td>
                      <td align="center" class="borderTopLeft">516</td>
                      <td align="center" class="borderTopLeft col_36">03</td>
        			<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!6!2!4')">  <asp:Label CssClass="normal" ID="tab_6_w03_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!6!3!4')">  <asp:Label CssClass="normal" ID="tab_6_w03_c03" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!6!4!4')">  <asp:Label CssClass="normal" ID="tab_6_w03_c04" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!6!5!4')">  <asp:Label CssClass="normal" ID="tab_6_w03_c05" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie" colspan="3">Odszkodowania przysługujące w razie wypadków lub chorób pozostających w związku ze służbą wojskową, w Policji, Agencji Bezpieczeństwa Wewnętrznego, Agencji Wywiadu, Służby Kontrwywiadu Wojskowego, Służby Wywiadu Wojskowego, Centralnego Biura Antykorupcyjnego, Biura Ochrony Rządu, Straży Granicznej, Służbie Więziennej, Państwowej Straży Pożarnej i Służbie Celnej</td>
                      <td align="center" class="borderTopLeft">559</td>
                      <td align="center" class="borderTopLeft col_36">04</td>
        			<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w04_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!6!2!4')">  <asp:Label CssClass="normal" ID="tab_6_w04_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!6!3!4')">  <asp:Label CssClass="normal" ID="tab_6_w04_c03" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!6!4!4')">  <asp:Label CssClass="normal" ID="tab_6_w04_c04" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!6!5!4')">  <asp:Label CssClass="normal" ID="tab_6_w04_c05" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie" colspan="3">O odszkodowanie z tytułu wypadku przy pracy lub choroby zawodowej (nie dotyczy gospodarstw rolnych) </td>
                      <td align="center" class="borderTopLeft">-</td>
                      <td align="center" class="borderTopLeft col_36">05</td>
        			<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w05_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!6!2!4')">  <asp:Label CssClass="normal" ID="tab_6_w05_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!6!3!4')">  <asp:Label CssClass="normal" ID="tab_6_w05_c03" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!6!4!4')">  <asp:Label CssClass="normal" ID="tab_6_w05_c04" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!6!5!4')">  <asp:Label CssClass="normal" ID="tab_6_w05_c05" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie" colspan="3">inne</td>
                      <td align="center" class="borderTopLeft">-</td>
                      <td align="center" class="borderTopLeft col_36">06</td>
        			<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w06_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!6!2!4')">  <asp:Label CssClass="normal" ID="tab_6_w06_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!6!3!4')">  <asp:Label CssClass="normal" ID="tab_6_w06_c03" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!6!4!4')">  <asp:Label CssClass="normal" ID="tab_6_w06_c04" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!6!5!4')">  <asp:Label CssClass="normal" ID="tab_6_w06_c05" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie" colspan="4">Ogółem pracy (w. 8 do 23)</td>
                      <td align="center" class="borderTopLeft col_36">07</td>
        			<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=7!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w07_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=7!6!2!4')">  <asp:Label CssClass="normal" ID="tab_6_w07_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=7!6!3!4')">  <asp:Label CssClass="normal" ID="tab_6_w07_c03" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=7!6!4!4')">  <asp:Label CssClass="normal" ID="tab_6_w07_c04" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=7!6!5!4')">  <asp:Label CssClass="normal" ID="tab_6_w07_c05" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie" colspan="3">O odszkodowanie z tytułu niewydania w terminie świadectwa pracy lub wydania niewłaściwego świadectwa pracy</td>
                      <td align="center" class="borderTopLeft">405</td>
                      <td align="center" class="borderTopLeft col_36">08</td>
        			<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w08_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!6!2!4')">  <asp:Label CssClass="normal" ID="tab_6_w08_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!6!3!4')">  <asp:Label CssClass="normal" ID="tab_6_w08_c03" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!6!4!4')">  <asp:Label CssClass="normal" ID="tab_6_w08_c04" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!6!5!4')">  <asp:Label CssClass="normal" ID="tab_6_w08_c05" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie" colspan="3">O odszkodowanie należne pracownikowi za okres obowiązywania zakazu konkurencji </td>
                      <td align="center" class="borderTopLeft">450</td>
                      <td align="center" class="borderTopLeft col_36">09</td>
        			<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=9!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w09_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=9!6!2!4')">  <asp:Label CssClass="normal" ID="tab_6_w09_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=9!6!3!4')">  <asp:Label CssClass="normal" ID="tab_6_w09_c03" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=9!6!4!4')">  <asp:Label CssClass="normal" ID="tab_6_w09_c04" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=9!6!5!4')">  <asp:Label CssClass="normal" ID="tab_6_w09_c05" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie" colspan="3">O odszkodowanie z tytułu wypadku przy pracy lub choroby zawodowej (nie dotyczy wypadku przy pracy w gospodarstwie rolnym) </td>
                      <td align="center" class="borderTopLeft">451</td>
                      <td align="center" class="borderTopLeft col_36">10</td>
        			<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w10_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=10!6!2!4')">  <asp:Label CssClass="normal" ID="tab_6_w10_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=10!6!3!4')">  <asp:Label CssClass="normal" ID="tab_6_w10_c03" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=10!6!4!4')">  <asp:Label CssClass="normal" ID="tab_6_w10_c04" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=10!6!5!4')">  <asp:Label CssClass="normal" ID="tab_6_w10_c05" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie" colspan="2" rowspan="2">O odszkodowanie z tytułu naruszenia zasady równego traktowania w zatrudnieniu dotyczy (art. 183d kp) </td>
                      <td class="borderTopLeft wciecie">kobiet</td>
                      <td align="center" class="borderTopLeft">458dk </td>
                      <td align="center" class="borderTopLeft col_36">11</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w11_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!6!2!4')">  <asp:Label CssClass="normal" ID="tab_6_w11_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!6!3!4')">  <asp:Label CssClass="normal" ID="tab_6_w11_c03" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!6!4!4')">  <asp:Label CssClass="normal" ID="tab_6_w11_c04" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!6!5!4')">  <asp:Label CssClass="normal" ID="tab_6_w11_c05" runat="server" Text="0"></asp:Label>  </a></td>
        
                  <tr>
                      <td class="borderTopLeft wciecie">mężczyzn</td>
                      <td align="center" class="borderTopLeft">458m </td>
                      <td align="center" class="borderTopLeft col_36">12</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w12_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!6!2!4')">  <asp:Label CssClass="normal" ID="tab_6_w12_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!6!3!4')">  <asp:Label CssClass="normal" ID="tab_6_w12_c03" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!6!4!4')">  <asp:Label CssClass="normal" ID="tab_6_w12_c04" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!6!5!4')">  <asp:Label CssClass="normal" ID="tab_6_w12_c05" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie" colspan="2" rowspan="2">O odszkodowanie w związku z molestowaniem seksualnym, jako jedną z form dyskryminacji w miejscu pracy dotyczy (art.183a§ 6 kp w zw. z art. 183d kp) </td>
                      <td class="borderTopLeft wciecie">kobiet</td>
                      <td align="center" class="borderTopLeft">459dk </td>
                      <td align="center" class="borderTopLeft col_36">13</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w13_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!6!2!4')">  <asp:Label CssClass="normal" ID="tab_6_w13_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!6!3!4')">  <asp:Label CssClass="normal" ID="tab_6_w13_c03" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!6!4!4')">  <asp:Label CssClass="normal" ID="tab_6_w13_c04" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!6!5!4')">  <asp:Label CssClass="normal" ID="tab_6_w13_c05" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie">mężczyzn</td>
                      <td align="center" class="borderTopLeft">459dm </td>
                      <td align="center" class="borderTopLeft col_36">14</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=14!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w14_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=14!6!2!4')">  <asp:Label CssClass="normal" ID="tab_6_w14_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=14!6!3!4')">  <asp:Label CssClass="normal" ID="tab_6_w14_c03" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=14!6!4!4')">  <asp:Label CssClass="normal" ID="tab_6_w14_c04" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=14!6!5!4')">  <asp:Label CssClass="normal" ID="tab_6_w14_c05" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie" colspan="2" rowspan="2">O zadośćuczynienie w związku z mobbingiem dotyczy (art. 943§3 kp) </td>
                      <td class="borderTopLeft wciecie">kobiet</td>
                      <td align="center" class="borderTopLeft">462dk </td>
                      <td align="center" class="borderTopLeft col_36">15</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=15!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w15_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=15!6!2!4')">  <asp:Label CssClass="normal" ID="tab_6_w15_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=15!6!3!4')">  <asp:Label CssClass="normal" ID="tab_6_w15_c03" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=15!6!4!4')">  <asp:Label CssClass="normal" ID="tab_6_w15_c04" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=15!6!5!4')">  <asp:Label CssClass="normal" ID="tab_6_w15_c05" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie">mężczyzn</td>
                      <td align="center" class="borderTopLeft">462dm </td>
                      <td align="center" class="borderTopLeft col_36">16</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=16!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w16_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=16!6!2!4')">  <asp:Label CssClass="normal" ID="tab_6_w16_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=16!6!3!4')">  <asp:Label CssClass="normal" ID="tab_6_w16_c03" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=16!6!4!4')">  <asp:Label CssClass="normal" ID="tab_6_w16_c04" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=16!6!5!4')">  <asp:Label CssClass="normal" ID="tab_6_w16_c05" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie" colspan="2" rowspan="2">O odszkodowanie w związku z mobbingiem dotyczy (art. 943§4 kp) </td>
                      <td class="borderTopLeft wciecie">kobiet</td>
                      <td align="center" class="borderTopLeft">463dk </td>
                      <td align="center" class="borderTopLeft col_36">17</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=17!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w17_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=17!6!2!4')">  <asp:Label CssClass="normal" ID="tab_6_w17_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=17!6!3!4')">  <asp:Label CssClass="normal" ID="tab_6_w17_c03" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=17!6!4!4')">  <asp:Label CssClass="normal" ID="tab_6_w17_c04" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=17!6!5!4')">  <asp:Label CssClass="normal" ID="tab_6_w17_c05" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie">mężczyzn</td>
                      <td align="center" class="borderTopLeft">463dk </td>
                      <td align="center" class="borderTopLeft col_36">18</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=18!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w18_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=18!6!2!4')">  <asp:Label CssClass="normal" ID="tab_6_w18_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=18!6!3!4')">  <asp:Label CssClass="normal" ID="tab_6_w18_c03" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=18!6!4!4')">  <asp:Label CssClass="normal" ID="tab_6_w18_c04" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=18!6!5!4')">  <asp:Label CssClass="normal" ID="tab_6_w18_c05" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie" rowspan="4">O odszkodowanie</td>
                      <td class="borderTopLeft wciecie" rowspan="2">za mienie</td>
                      <td class="borderTopLeft wciecie">nie powierzone</td>
                      <td align="center" class="borderTopLeft">415 </td>
                      <td align="center" class="borderTopLeft col_36">19</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=19!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w19_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=19!6!2!4')">  <asp:Label CssClass="normal" ID="tab_6_w19_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=19!6!3!4')">  <asp:Label CssClass="normal" ID="tab_6_w19_c03" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=19!6!4!4')">  <asp:Label CssClass="normal" ID="tab_6_w19_c04" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=19!6!5!4')">  <asp:Label CssClass="normal" ID="tab_6_w19_c05" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie">powierzone łącznie ze sprawami z tytułu odpowiedzialności wspólnej </td>
                      <td align="center" class="borderTopLeft">416 </td>
                      <td align="center" class="borderTopLeft col_36">20</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=20!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w20_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=20!6!2!4')">  <asp:Label CssClass="normal" ID="tab_6_w20_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=20!6!3!4')">  <asp:Label CssClass="normal" ID="tab_6_w20_c03" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=20!6!4!4')">  <asp:Label CssClass="normal" ID="tab_6_w20_c04" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=20!6!5!4')">  <asp:Label CssClass="normal" ID="tab_6_w20_c05" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie" colspan="2">przysługujące pracodawcy w razie nieuzasadnionego rozwiązania przez pracownika umowy o pracę bez wypowiedzenia </td>
                      <td align="center" class="borderTopLeft">417</td>
                      <td align="center" class="borderTopLeft col_36">21</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=21!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w21_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=21!6!2!4')">  <asp:Label CssClass="normal" ID="tab_6_w21_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=21!6!3!4')">  <asp:Label CssClass="normal" ID="tab_6_w21_c03" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=21!6!4!4')">  <asp:Label CssClass="normal" ID="tab_6_w21_c04" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=21!6!5!4')">  <asp:Label CssClass="normal" ID="tab_6_w21_c05" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeft wciecie" colspan="2">z tytułu naruszenia przez pracownika zakazu konkurencji </td>
                      <td align="center" class="borderTopLeft">418</td>
                      <td align="center" class="borderTopLeft col_36">22</td>
                    <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=22!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w22_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=22!6!2!4')">  <asp:Label CssClass="normal" ID="tab_6_w22_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=22!6!3!4')">  <asp:Label CssClass="normal" ID="tab_6_w22_c03" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=22!6!4!4')">  <asp:Label CssClass="normal" ID="tab_6_w22_c04" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeftRight col_100"><a href="javascript:openPopup('popup.aspx?sesja=22!6!5!4')">  <asp:Label CssClass="normal" ID="tab_6_w22_c05" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeftBottom wciecie" colspan="4">inne</td>
                      <td align="center" class="borderTopLeftBottom col_36">23</td>
                    <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=23!6!1!4')">  <asp:Label CssClass="normal" ID="tab_6_w23_c01" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=23!6!2!4')">  <asp:Label CssClass="normal" ID="tab_6_w23_c02" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=23!6!3!4')">  <asp:Label CssClass="normal" ID="tab_6_w23_c03" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=23!6!4!4')">  <asp:Label CssClass="normal" ID="tab_6_w23_c04" runat="server" Text="0"></asp:Label>  </a></td>
					<td class="borderAll col_100"><a href="javascript:openPopup('popup.aspx?sesja=23!6!5!4')">  <asp:Label CssClass="normal" ID="tab_6_w23_c05" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
              </table>
         
		   <br />




              </div>
     

         <div class="page-break">


           <strong>
           <br />
           Dział 7. </strong>Sprawy z zakresu prawa pracy i ubezpieczeń społecznych wielotomowe
		      <br />
		      <br />
       <table style="width:100%;" cellpadding="0" cellspacing="0">
                  <tr>
                      <td colspan="5" rowspan="2" align="center" class="borderTopLeft">SPRAWY z rep.</td>
                      <td colspan="7" align="center" class="borderTopLeftRight">Sprawy z zakresu prawa pracy i ubezpieczeń społecznych wielotomowe Liczba spraw </td>
                  </tr>
                  <tr>
                      <td align="center" class="borderTopLeft">zbiorczo pow. 5 tomów (kol. od 2 do 7) </td>
                      <td align="center" class="borderTopLeft">pow. 5 do 10 tomów</td>
                      <td align="center" class="borderTopLeft">pow. 10 do 20 tomów </td>
                      <td align="center" class="borderTopLeft">pow. 20 do 30 tomów </td>
                      <td align="center" class="borderTopLeft">pow. 30 do 50 tomów </td>
                      <td align="center" class="borderTopLeft">pow. 50 do 100 tomów </td>
                      <td align="center" class="borderTopLeftRight">powyżej 100 tomów </td>
                  </tr>
                  <tr>
                      <td colspan="5" align="center" class="borderTopLeft">0</td>
                      <td align="center" class="borderTopLeft">1</td>
                      <td align="center" class="borderTopLeft">2</td>
                      <td align="center" class="borderTopLeft">3</td>
                      <td align="center" class="borderTopLeft">4</td>
                      <td align="center" class="borderTopLeft">5</td>
                      <td align="center" class="borderTopLeft">6</td>
                      <td align="center" class="borderTopLeftRight">7</td>
                  </tr>
                  <tr>
                      <td rowspan="7" class="borderTopLeft col_36">U</td>
                      <td colspan="3" class="borderTopLeft wciecie">wpływ w okresie sprawozdawczym</td>
                      <td class="borderTopLeft col_36">01</td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!7!1!4')">  <asp:Label CssClass="normal" ID="tab_7_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!7!2!4')">  <asp:Label CssClass="normal" ID="tab_7_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!7!3!4')">  <asp:Label CssClass="normal" ID="tab_7_w01_c03" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!7!4!4')">  <asp:Label CssClass="normal" ID="tab_7_w01_c04" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!7!5!4')">  <asp:Label CssClass="normal" ID="tab_7_w01_c05" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!7!6!4')">  <asp:Label CssClass="normal" ID="tab_7_w01_c06" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeftRight  col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!7!7!4')">  <asp:Label CssClass="normal" ID="tab_7_w01_c07" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td rowspan="2" class="borderTopLeft wciecie">w tym</td>
                      <td colspan="2" class="borderTopLeft wciecie">wpływ w wyniku przekazania z innej jednostki</td>
                      <td class="borderTopLeft col_36">02</td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!7!1!4')">  <asp:Label CssClass="normal" ID="tab_7_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!7!2!4')">  <asp:Label CssClass="normal" ID="tab_7_w02_c02" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!7!3!4')">  <asp:Label CssClass="normal" ID="tab_7_w02_c03" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!7!4!4')">  <asp:Label CssClass="normal" ID="tab_7_w02_c04" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!7!5!4')">  <asp:Label CssClass="normal" ID="tab_7_w02_c05" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!7!6!4')">  <asp:Label CssClass="normal" ID="tab_7_w02_c06" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeftRight  col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!7!7!4')">  <asp:Label CssClass="normal" ID="tab_7_w02_c07" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td colspan="2" class="borderTopLeft wciecie">w wyniku zwrotu pozwu</td>
                      <td class="borderTopLeft col_36">03</td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!7!1!4')">  <asp:Label CssClass="normal" ID="tab_7_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!7!2!4')">  <asp:Label CssClass="normal" ID="tab_7_w03_c02" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!7!3!4')">  <asp:Label CssClass="normal" ID="tab_7_w03_c03" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!7!4!4')">  <asp:Label CssClass="normal" ID="tab_7_w03_c04" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!7!5!4')">  <asp:Label CssClass="normal" ID="tab_7_w03_c05" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!7!6!4')">  <asp:Label CssClass="normal" ID="tab_7_w03_c06" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeftRight  col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!7!7!4')">  <asp:Label CssClass="normal" ID="tab_7_w03_c07" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td colspan="3" class="borderTopLeft wciecie">załatwienie w okresie sprawozdawczym</td>
                      <td class="borderTopLeft col_36">04</td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!7!1!4')">  <asp:Label CssClass="normal" ID="tab_7_w04_c01" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!7!2!4')">  <asp:Label CssClass="normal" ID="tab_7_w04_c02" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!7!3!4')">  <asp:Label CssClass="normal" ID="tab_7_w04_c03" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!7!4!4')">  <asp:Label CssClass="normal" ID="tab_7_w04_c04" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!7!5!4')">  <asp:Label CssClass="normal" ID="tab_7_w04_c05" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!7!6!4')">  <asp:Label CssClass="normal" ID="tab_7_w04_c06" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeftRight  col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!7!7!4')">  <asp:Label CssClass="normal" ID="tab_7_w04_c07" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td rowspan="2" class="borderTopLeft wciecie">w tym</td>
                      <td colspan="2" class="borderTopLeft wciecie">załatwienie w wyniku przekazania do innej jednostki</td>
                      <td class="borderTopLeft col_36">05</td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!7!1!4')">  <asp:Label CssClass="normal" ID="tab_7_w05_c01" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!7!2!4')">  <asp:Label CssClass="normal" ID="tab_7_w05_c02" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!7!3!4')">  <asp:Label CssClass="normal" ID="tab_7_w05_c03" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!7!4!4')">  <asp:Label CssClass="normal" ID="tab_7_w05_c04" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!7!5!4')">  <asp:Label CssClass="normal" ID="tab_7_w05_c05" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!7!6!4')">  <asp:Label CssClass="normal" ID="tab_7_w05_c06" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeftRight  col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!7!7!4')">  <asp:Label CssClass="normal" ID="tab_7_w05_c07" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td colspan="2" class="borderTopLeft wciecie">w wyniku zwrotu pozwu</td>
                      <td class="borderTopLeft col_36">06</td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!7!1!4')">  <asp:Label CssClass="normal" ID="tab_7_w06_c01" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!7!2!4')">  <asp:Label CssClass="normal" ID="tab_7_w06_c02" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!7!3!4')">  <asp:Label CssClass="normal" ID="tab_7_w06_c03" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!7!4!4')">  <asp:Label CssClass="normal" ID="tab_7_w06_c04" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!7!5!4')">  <asp:Label CssClass="normal" ID="tab_7_w06_c05" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!7!6!4')">  <asp:Label CssClass="normal" ID="tab_7_w06_c06" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeftRight  col_100"><a href="javascript:openPopup('popup.aspx?sesja=6!7!7!4')">  <asp:Label CssClass="normal" ID="tab_7_w06_c07" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td colspan="3" class="borderTopLeft wciecie">pozostało na następny okres sprawozdawczy</td>
                      <td class="borderTopLeft col_36">07</td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=7!7!1!4')">  <asp:Label CssClass="normal" ID="tab_7_w07_c01" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=7!7!2!4')">  <asp:Label CssClass="normal" ID="tab_7_w07_c02" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=7!7!3!4')">  <asp:Label CssClass="normal" ID="tab_7_w07_c03" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=7!7!4!4')">  <asp:Label CssClass="normal" ID="tab_7_w07_c04" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=7!7!5!4')">  <asp:Label CssClass="normal" ID="tab_7_w07_c05" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=7!7!6!4')">  <asp:Label CssClass="normal" ID="tab_7_w07_c06" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeftRight  col_100"><a href="javascript:openPopup('popup.aspx?sesja=7!7!7!4')">  <asp:Label CssClass="normal" ID="tab_7_w07_c07" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td rowspan="7" class="borderTopLeftBottom col_36">P</td>
                      <td colspan="3" class="borderTopLeft wciecie">wpływ w okresie sprawozdawczym</td>
                      <td class="borderTopLeft col_36">08</td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!7!1!4')">  <asp:Label CssClass="normal" ID="tab_7_w08_c01" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!7!2!4')">  <asp:Label CssClass="normal" ID="tab_7_w08_c02" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!7!3!4')">  <asp:Label CssClass="normal" ID="tab_7_w08_c03" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!7!4!4')">  <asp:Label CssClass="normal" ID="tab_7_w08_c04" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!7!5!4')">  <asp:Label CssClass="normal" ID="tab_7_w08_c05" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!7!6!4')">  <asp:Label CssClass="normal" ID="tab_7_w08_c06" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeftRight  col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!7!7!4')">  <asp:Label CssClass="normal" ID="tab_7_w08_c07" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td rowspan="2" class="borderTopLeft wciecie">w tym</td>
                      <td colspan="2" class="borderTopLeft wciecie">wpływ w wyniku przekazania z innej jednostki</td>
                      <td class="borderTopLeft col_36">09</td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=9!7!1!4')">  <asp:Label CssClass="normal" ID="tab_7_w09_c01" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=9!7!2!4')">  <asp:Label CssClass="normal" ID="tab_7_w09_c02" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=9!7!3!4')">  <asp:Label CssClass="normal" ID="tab_7_w09_c03" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=9!7!4!4')">  <asp:Label CssClass="normal" ID="tab_7_w09_c04" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=9!7!5!4')">  <asp:Label CssClass="normal" ID="tab_7_w09_c05" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=9!7!6!4')">  <asp:Label CssClass="normal" ID="tab_7_w09_c06" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeftRight  col_100"><a href="javascript:openPopup('popup.aspx?sesja=9!7!7!4')">  <asp:Label CssClass="normal" ID="tab_7_w09_c07" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td colspan="2" class="borderTopLeft wciecie">w wyniku zwrotu pozwu</td>
                      <td class="borderTopLeft col_36">10</td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=10!7!1!4')">  <asp:Label CssClass="normal" ID="tab_7_w10_c01" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=10!7!2!4')">  <asp:Label CssClass="normal" ID="tab_7_w10_c02" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=10!7!3!4')">  <asp:Label CssClass="normal" ID="tab_7_w10_c03" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=10!7!4!4')">  <asp:Label CssClass="normal" ID="tab_7_w10_c04" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=10!7!5!4')">  <asp:Label CssClass="normal" ID="tab_7_w10_c05" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=10!7!6!4')">  <asp:Label CssClass="normal" ID="tab_7_w10_c06" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeftRight  col_100"><a href="javascript:openPopup('popup.aspx?sesja=10!7!7!4')">  <asp:Label CssClass="normal" ID="tab_7_w10_c07" runat="server" Text="0"></asp:Label>  </a></td>
          </tr>
                  <tr>
                      <td colspan="3" class="borderTopLeft wciecie">załatwienie w okresie sprawozdawczym</td>
                      <td class="borderTopLeft col_36">11</td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!7!1!4')">  <asp:Label CssClass="normal" ID="tab_7_w11_c01" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!7!2!4')">  <asp:Label CssClass="normal" ID="tab_7_w11_c02" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!7!3!4')">  <asp:Label CssClass="normal" ID="tab_7_w11_c03" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!7!4!4')">  <asp:Label CssClass="normal" ID="tab_7_w11_c04" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!7!5!4')">  <asp:Label CssClass="normal" ID="tab_7_w11_c05" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!7!6!4')">  <asp:Label CssClass="normal" ID="tab_7_w11_c06" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeftRight  col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!7!7!4')">  <asp:Label CssClass="normal" ID="tab_7_w11_c07" runat="server" Text="0"></asp:Label>  </a></td>
  </tr>
                  <tr>
                      <td rowspan="2" class="borderTopLeft wciecie">w tym</td>
                      <td colspan="2" class="borderTopLeft wciecie">załatwienie w wyniku przekazania do innej jednostki</td>
                      <td class="borderTopLeft col_36">12</td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!7!1!4')">  <asp:Label CssClass="normal" ID="tab_7_w12_c01" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!7!2!4')">  <asp:Label CssClass="normal" ID="tab_7_w12_c02" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!7!3!4')">  <asp:Label CssClass="normal" ID="tab_7_w12_c03" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!7!4!4')">  <asp:Label CssClass="normal" ID="tab_7_w12_c04" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!7!5!4')">  <asp:Label CssClass="normal" ID="tab_7_w12_c05" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!7!6!4')">  <asp:Label CssClass="normal" ID="tab_7_w12_c06" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeftRight  col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!7!7!4')">  <asp:Label CssClass="normal" ID="tab_7_w12_c07" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td colspan="2" class="borderTopLeft wciecie">w wyniku zwrotu pozwu</td>
                      <td class="borderTopLeft col_36">13</td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!7!1!4')">  <asp:Label CssClass="normal" ID="tab_7_w13_c01" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!7!2!4')">  <asp:Label CssClass="normal" ID="tab_7_w13_c02" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!7!3!4')">  <asp:Label CssClass="normal" ID="tab_7_w13_c03" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!7!4!4')">  <asp:Label CssClass="normal" ID="tab_7_w13_c04" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!7!5!4')">  <asp:Label CssClass="normal" ID="tab_7_w13_c05" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!7!6!4')">  <asp:Label CssClass="normal" ID="tab_7_w13_c06" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeftRight  col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!7!7!4')">  <asp:Label CssClass="normal" ID="tab_7_w13_c07" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td colspan="3" class="borderTopLeftBottom wciecie">pozostało na następny okres sprawozdawczy</td>
                      <td class="borderTopLeftBottom col_36">14</td>
                      <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=14!7!1!4')">  <asp:Label CssClass="normal" ID="tab_7_w14_c01" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=14!7!2!4')">  <asp:Label CssClass="normal" ID="tab_7_w14_c02" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=14!7!3!4')">  <asp:Label CssClass="normal" ID="tab_7_w14_c03" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=14!7!4!4')">  <asp:Label CssClass="normal" ID="tab_7_w14_c04" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=14!7!5!4')">  <asp:Label CssClass="normal" ID="tab_7_w14_c05" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=14!7!6!4')">  <asp:Label CssClass="normal" ID="tab_7_w14_c06" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderAll  col_100"><a href="javascript:openPopup('popup.aspx?sesja=14!7!7!4')">  <asp:Label CssClass="normal" ID="tab_7_w14_c07" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
             </table>      <br />
             <br />
              <br />

             </div>


        <div class="page-break">


           <strong>
           <br />
           Dział 9.1. </strong>Liczba biegłych/podmiotów wydających opinie w sprawach  (z wył. tłumaczy przysięgłych)
		      <br />
		      <br />

            <table style="width:100%;" cellpadding="0" cellspacing="0">
                  <tr>
                      <td colspan="3" rowspan="2" align="center" class="borderTopLeft">Sprawy wg repertoriów</td>
                      <td colspan="4" align="center" class="borderTopLeftRight">Liczba powołanych biegłych </td>
                  </tr>
                  <tr>
                      <td align="center" class="col_200 borderTopLeft">Razem (kol. 2-4)</td>
                      <td align="center" class="col_200 borderTopLeft">biegli sądowi</td>
                      <td align="center" class="col_200 borderTopLeft">biegli spoza listy</td>
                      <td align="center" class="col_200 borderTopLeftRight">inne podmioty</td>
                  </tr>
                  <tr>
                      <td colspan="3" align="center" class="borderTopLeft">0</td>
                      <td align="center" class="col_200 borderTopLeft">1</td>
                      <td align="center" class="col_200 borderTopLeft">2</td>
                      <td align="center" class="col_200 borderTopLeft">3</td>
                     
                      <td align="center" class="col_200 borderTopLeftRight">4</td>
                  </tr>
                  <tr>
                      <td colspan="2" class="borderTopLeft wciecie">ogółem</td>
                      <td class="borderTopLeft col_36">01</td>
                      <td class="col_200 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=1!9.1!1!4')">  <asp:Label CssClass="normal" ID="tab_91_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="col_200 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=1!9.1!2!4')">  <asp:Label CssClass="normal" ID="tab_91_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="col_200 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=1!9.1!3!4')">  <asp:Label CssClass="normal" ID="tab_91_w01_c03" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="col_200 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=1!9.1!4!4')">  <asp:Label CssClass="normal" ID="tab_91_w01_c04" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td rowspan="2" class="borderTopLeftBottom wciecie">w tym</td>
                      <td class="borderTopLeft wciecie">U</td>
                      <td class="borderTopLeft col_36">02</td>
                      <td class="col_200 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=2!9.1!1!4')">  <asp:Label CssClass="normal" ID="tab_91_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="col_200 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=2!9.1!2!4')">  <asp:Label CssClass="normal" ID="tab_91_w02_c02" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="col_200 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=2!9.1!3!4')">  <asp:Label CssClass="normal" ID="tab_91_w02_c03" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="col_200 borderTopLeftRight"><a href="javascript:openPopup('popup.aspx?sesja=2!9.1!4!4')">  <asp:Label CssClass="normal" ID="tab_91_w02_c04" runat="server" Text="0"></asp:Label>  </a></td>
                      </tr>
                  <tr>
                      <td class="borderTopLeftBottom wciecie">P</td>
                      <td class="borderTopLeftBottom col_36">03</td>
                      <td class="col_200 borderTopLeftBottom"><a href="javascript:openPopup('popup.aspx?sesja=3!9.1!1!4')">  <asp:Label CssClass="normal" ID="tab_91_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="col_200 borderTopLeftBottom"><a href="javascript:openPopup('popup.aspx?sesja=3!9.1!2!4')">  <asp:Label CssClass="normal" ID="tab_91_w03_c02" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="col_200 borderTopLeftBottom"><a href="javascript:openPopup('popup.aspx?sesja=3!9.1!3!4')">  <asp:Label CssClass="normal" ID="tab_91_w03_c03" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="col_200 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=3!9.1!4!4')">  <asp:Label CssClass="normal" ID="tab_91_w03_c04" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                           </table>

             <br />
              <br />

             </div>
        <div class="page-break">


           <strong>
           <br />
           Dział 9.2. </strong>Terminowość sporządzania opinii pisemnych (z wył. tłumaczy przysięgłych)
		      <br />
		      <br />
       <table style="width:100%;" cellpadding="0" cellspacing="0">
                  <tr>
                      <td colspan="3" rowspan="3" align="center" class="borderTopLeft">Sprawy wg repertoriów</td>
                      <td colspan="8" align="center" class="borderTopLeftRight">Liczba sporządzonych opinii</td>
                  </tr>
                  <tr>
                      <td align="center" class="borderTopLeft" rowspan="2">razem (kol.1= 2 do 5 = 6 do 8)</td>
                      <td align="center" class="borderTopLeft" rowspan="2">w ustalonym terminie</td>
                      <td align="center" class="borderTopLeft" colspan="3">po ustalonym terminie</td>
                      <td align="center" class="borderTopLeftRight" colspan="3">wg czasu wydania opinii</td>
                  </tr>
                  <tr>
                      <td align="center" class="borderTopLeft">do 30 dni </td>
                      <td align="center" class="borderTopLeft">pow. 1 do 3 miesięcy</td>
                      <td align="center" class="borderTopLeft">pow. 3 miesięcy</td>
                      <td align="center" class="borderTopLeft">do 30 dni </td>
                      <td align="center" class="borderTopLeft">pow. 1 do 3 miesięcy</td>
                      <td align="center" class="borderTopLeftRight">pow. 3 miesięcy</td>
                  </tr>
                  <tr>
                      <td colspan="3" align="center" class="borderTopLeftRight">0</td>
                      <td align="center" class="borderTopLeft">1</td>
                      <td align="center" class="borderTopLeft">2</td>
                      <td align="center" class="borderTopLeft">3</td>
                      <td align="center" class="borderTopLeft">4</td>
                      <td align="center" class="borderTopLeft">5</td>
                      <td align="center" class="borderTopLeft">6</td>
					  <td align="center" class="borderTopLeft">7</td>
                      <td align="center" class="borderTopLeftRight">8</td>
                  </tr>
                  <tr>
                      <td colspan="2" class="borderTopLeft wciecie">Ogółem</td>
                      <td class="borderTopLeft col_36">01</td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!9.2!1!4')">  <asp:Label CssClass="normal" ID="tab_92_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!9.2!2!4')">  <asp:Label CssClass="normal" ID="tab_92_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!9.2!3!4')">  <asp:Label CssClass="normal" ID="tab_92_w01_c03" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!9.2!4!4')">  <asp:Label CssClass="normal" ID="tab_92_w01_c04" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!9.2!5!4')">  <asp:Label CssClass="normal" ID="tab_92_w01_c05" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!9.2!6!4')">  <asp:Label CssClass="normal" ID="tab_92_w01_c06" runat="server" Text="0"></asp:Label>  </a></td>
					  <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!9.2!7!4')">  <asp:Label CssClass="normal" ID="tab_92_w01_c07" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeftRight  col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!9.2!8!4')">  <asp:Label CssClass="normal" ID="tab_92_w01_c08" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td rowspan="2" class="borderTopLeftBottom wciecie">w tym</td>
                      <td class="borderTopLeft wciecie">U</td>
                      <td class="borderTopLeft col_36">02</td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!9.2!1!4')">  <asp:Label CssClass="normal" ID="tab_92_w02_c01" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!9.2!2!4')">  <asp:Label CssClass="normal" ID="tab_92_w02_c02" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!9.2!3!4')">  <asp:Label CssClass="normal" ID="tab_92_w02_c03" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!9.2!4!4')">  <asp:Label CssClass="normal" ID="tab_92_w02_c04" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!9.2!5!4')">  <asp:Label CssClass="normal" ID="tab_92_w02_c05" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!9.2!6!4')">  <asp:Label CssClass="normal" ID="tab_92_w02_c06" runat="server" Text="0"></asp:Label>  </a></td>
					  <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!9.2!7!4')">  <asp:Label CssClass="normal" ID="tab_92_w02_c07" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeftRight  col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!9.2!8!4')">  <asp:Label CssClass="normal" ID="tab_92_w02_c08" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>
                  <tr>
                      <td class="borderTopLeftBottom wciecie">P</td>
                      <td class="borderTopLeftBottom col_36">03</td>
                      <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!9.2!1!4')">  <asp:Label CssClass="normal" ID="tab_92_w03_c01" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!9.2!2!4')">  <asp:Label CssClass="normal" ID="tab_92_w03_c02" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!9.2!3!4')">  <asp:Label CssClass="normal" ID="tab_92_w03_c03" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!9.2!4!4')">  <asp:Label CssClass="normal" ID="tab_92_w03_c04" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!9.2!5!4')">  <asp:Label CssClass="normal" ID="tab_92_w03_c05" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!9.2!6!4')">  <asp:Label CssClass="normal" ID="tab_92_w03_c06" runat="server" Text="0"></asp:Label>  </a></td>
                      <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!9.2!7!4')">  <asp:Label CssClass="normal" ID="tab_92_w03_c07" runat="server" Text="0"></asp:Label>  </a></td>
					  <td class="borderAll  col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!9.2!7!4')">  <asp:Label CssClass="normal" ID="tab_92_w03_c08" runat="server" Text="0"></asp:Label>  </a></td>
                  </tr>

             </table>      
            <br />
          

             </div>

          <div class="page-break">
                <strong>
                <br />Dział 9.3. </strong>Terminowość przyznawania wynagrodzeń za sporządzenie opinii pisemnych i ustnych oraz za stawiennictwo (z wył. tłumaczy przysięgłych)
		        <br />
                <br />
                <table style="width:100%;" cellpadding="0" cellspacing="0">
                    <tr>
                        <td colspan="3" rowspan="2" align="center" class="borderTopLeft">SPRAWY z rep.</td>
                        <td colspan="8" align="center" class="borderTopLeftRight">Sprawy z zakresu prawa pracy i ubezpieczeń społecznych wielotomowe Liczba spraw </td>
                    </tr>
                    <tr>
                        <td align="center" class="borderTopLeft">razem
                            <br />
                            (kol.2-4)
</td>
                        <td align="center" class="borderTopLeft">do 14 dni</td>
                        <td align="center" class="borderTopLeft">pow. 14 do 
                            <br />
                            30 dni</td>
                        <td align="center" class="borderTopLeft">pow. powyżej miesiąca </td>
                        <td align="center" class="borderTopLeft">razem<br />
                            (kol.2-4)
</td>
                        <td align="center" class="borderTopLeft">do 14 dni</td>
                        <td align="center" class="borderTopLeft">pow. 14 do 30 dni</td>
                        <td align="center" class="borderTopLeftRight">pow. powyżej miesiąca </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center" class="borderTopLeft">0</td>
                        <td align="center" class="borderTopLeft">1</td>
                        <td align="center" class="borderTopLeft">2</td>
                        <td align="center" class="borderTopLeft">3</td>
                        <td align="center" class="borderTopLeft">4</td>
                        <td align="center" class="borderTopLeft">5</td>
                        <td align="center" class="borderTopLeft">6</td>
                        <td align="center" class="borderTopLeft">7</td>
                        <td align="center" class="borderTopLeftRight">8</td>
                    </tr>
                    <tr>
                        <td colspan="2" class="borderTopLeft wciecie">Ogółem</td>
                        <td class="borderTopLeft col_36">01</td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!9.3!1!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w01_c01" runat="server" Text="0"></asp:Label>
                            </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!9.3!2!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w01_c02" runat="server" Text="0"></asp:Label>
                            </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!9.3!3!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w01_c03" runat="server" Text="0"></asp:Label>
                            </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!9.3!4!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w01_c04" runat="server" Text="0"></asp:Label>
                            </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!9.3!5!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w01_c05" runat="server" Text="0"></asp:Label>
                            </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!9.3!6!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w01_c06" runat="server" Text="0"></asp:Label>
                            </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!9.3!7!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w01_c07" runat="server" Text="0"></asp:Label>
                            </a></td>
                        <td class="borderTopLeftRight  col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!9.3!8!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w01_c08" runat="server" Text="0"></asp:Label>
                            </a></td>
                    </tr>
                    <tr>
                        <td rowspan="2" class="borderTopLeftBottom wciecie">w tym</td>
                        <td class="borderTopLeft wciecie">U</td>
                        <td class="borderTopLeft col_36">02</td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!9.3!1!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w02_c01" runat="server" Text="0"></asp:Label>
                            </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!9.3!2!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w02_c02" runat="server" Text="0"></asp:Label>
                            </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!9.3!3!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w02_c03" runat="server" Text="0"></asp:Label>
                            </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!9.3!4!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w02_c04" runat="server" Text="0"></asp:Label>
                            </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!9.3!5!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w02_c05" runat="server" Text="0"></asp:Label>
                            </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!9.3!6!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w02_c06" runat="server" Text="0"></asp:Label>
                            </a></td>
                        <td class="borderTopLeft col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!9.3!7!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w02_c07" runat="server" Text="0"></asp:Label>
                            </a></td>
                        <td class="borderTopLeftRight  col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!9.3!8!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w02_c08" runat="server" Text="0"></asp:Label>
                            </a></td>
                    </tr>
                    <tr>
                        <td class="borderTopLeftBottom wciecie">P</td>
                        <td class="borderTopLeftBottom col_36">03</td>
                        <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!9.3!1!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w03_c01" runat="server" Text="0"></asp:Label>
                            </a></td>
                        <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!9.3!2!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w03_c02" runat="server" Text="0"></asp:Label>
                            </a></td>
                        <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!9.3!3!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w03_c03" runat="server" Text="0"></asp:Label>
                            </a></td>
                        <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!9.3!4!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w03_c04" runat="server" Text="0"></asp:Label>
                            </a></td>
                        <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!9.3!5!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w03_c05" runat="server" Text="0"></asp:Label>
                            </a></td>
                        <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!9.3!6!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w03_c06" runat="server" Text="0"></asp:Label>
                            </a></td>
                        <td class="borderTopLeftBottom col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!9.3!7!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w03_c07" runat="server" Text="0"></asp:Label>
                            </a></td>
                        <td class="borderAll  col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!9.3!8!4')">
                            <asp:Label CssClass="normal" ID="tab_93_w03_c08" runat="server" Text="0"></asp:Label>
                            </a></td>
                    </tr>
                </table>
                <br />
                <br />
                
            </div>

            <div class="page-break">
                <strong>
                <br /> </strong>
                <br />

		        <table style="width:100%;">
                    <tr>
                        <td>
                <strong>
                            Dział 10.1 </strong>Liczba powołań tłumaczy 

		        </td>
                        <td>&nbsp;</td>
                        <td class="col_200 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!10.1!1!4')">
                            <asp:Label CssClass="normal" ID="tab_101_w01_c01" runat="server" Text="0"></asp:Label>
                            </a></td>
                    </tr>
                  
                </table>
                <br />
                </div>
        <div class="page-break">
                 <strong>
                            Dział 10.2 </strong> Terminowość sporządzania tłumaczeń pisemnych 

                 <br />

                <br />

		    
                 <table style="width:100%;" cellpadding="0" cellspacing="0">
                    <tr>
                        <td colspan="8" align="center" class="borderTopLeftRight">Sprawy z zakresu prawa pracy i ubezpieczeń społecznych wielotomowe Liczba spraw </td>
                    </tr>
                    <tr>
                        <td align="center" class="borderTopLeft" rowspan="2">razem
                            <br />
                            (kol.1= 2 do 5 = 6 do 8)</td>
                        <td align="center" class="borderTopLeft" rowspan="2">w ustalonym terminie</td>
                        <td align="center" class="borderTopLeft" colspan="3">po ustalonym terminie</td>
                        <td align="center" class="borderTopLeftRight" colspan="3">wg czasu wydania tłumaczenia </td>
                    </tr>
                    <tr>
                        <td align="center" class="borderTopLeft">do 30 dni</td>
                        <td align="center" class="borderTopLeft">pow. 1 do 3 miesięcy</td>
                        <td align="center" class="borderTopLeft">pow. 3 miesięcy</td>
                        <td align="center" class="borderTopLeft">do 30 dni</td>
                        <td align="center" class="borderTopLeft">pow. 1 do 3 miesięcy</td>
                        <td align="center" class="borderTopLeftRight">pow. 3 miesięcy</td>
                    </tr>
                    <tr>
                        <td align="center" class="borderTopLeft">1</td>
                        <td align="center" class="borderTopLeft">2</td>
                        <td align="center" class="borderTopLeft">3</td>
                        <td align="center" class="borderTopLeft">4</td>
                        <td align="center" class="borderTopLeft">5</td>
                        <td align="center" class="borderTopLeft">6</td>
                        <td align="center" class="borderTopLeft">7</td>
                        <td align="center" class="borderTopLeftRight">8</td>
                    </tr>
                    <tr>
                        <td class="col_140 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!10.2!1!4')">
                            <asp:Label CssClass="normal" ID="tab_102_w01_c01" runat="server" Text="0"></asp:Label>
                            </a></td>
                        <td class="col_140 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!10.2!2!4')">
                            <asp:Label CssClass="normal" ID="tab_102_w01_c02" runat="server" Text="0"></asp:Label>
                            </a></td>
                        <td class="col_140 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!10.2!3!4')">
                            <asp:Label CssClass="normal" ID="tab_102_w01_c03" runat="server" Text="0"></asp:Label>
                            </a></td>
                        <td class="col_140 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!10.2!4!4')">
                            <asp:Label CssClass="normal" ID="tab_102_w01_c04" runat="server" Text="0"></asp:Label>
                            </a></td>
                        <td class="col_140 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!10.2!5!4')">
                            <asp:Label CssClass="normal" ID="tab_102_w01_c05" runat="server" Text="0"></asp:Label>
                            </a></td>
                        <td class="col_140 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!10.2!6!4')">
                            <asp:Label CssClass="normal" ID="tab_102_w01_c06" runat="server" Text="0"></asp:Label>
                            </a></td>
                        <td class="col_140 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!10.2!7!4')">
                            <asp:Label CssClass="normal" ID="tab_102_w01_c07" runat="server" Text="0"></asp:Label>
                            </a></td>
                        <td class="col_140 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!10.2!8!4')">
                            <asp:Label CssClass="normal" ID="tab_102_w01_c08" runat="server" Text="0"></asp:Label>
                            </a></td>
                    </tr>
                   
                  
                </table>
          
                <br />
                </div>

        <div class="page-break">
                 <strong>
                            Dział 10.3 </strong> Terminowość sporządzania tłumaczeń pisemnych 

                 <br />

                <br />

		    
                 <table style="width:100%;" cellpadding="0" cellspacing="0">
                    <tr>
                        <td colspan="8" align="center" class="borderTopLeftRight">Sprawy z zakresu prawa pracy i ubezpieczeń społecznych wielotomowe Liczba spraw </td>
                    </tr>
                    <tr>
                        <td align="center" class="borderTopLeft" rowspan="2">razem
                            <br />
                            (kol.1= 2 do 5 = 6 do 8)</td>
                        <td align="center" class="borderTopLeft" rowspan="2">w ustalonym terminie</td>
                        <td align="center" class="borderTopLeft" colspan="3">po ustalonym terminie</td>
                        <td align="center" class="borderTopLeftRight" colspan="3">wg czasu wydania tłumaczenia </td>
                    </tr>
                    <tr>
                        <td align="center" class="borderTopLeft">do 30 dni</td>
                        <td align="center" class="borderTopLeft">pow. 1 do 3 miesięcy</td>
                        <td align="center" class="borderTopLeft">pow. 3 miesięcy</td>
                        <td align="center" class="borderTopLeft">do 30 dni</td>
                        <td align="center" class="borderTopLeft">pow. 1 do 3 miesięcy</td>
                        <td align="center" class="borderTopLeftRight">pow. 3 miesięcy</td>
                    </tr>
                    <tr>
                        <td align="center" class="borderTopLeft">1</td>
                        <td align="center" class="borderTopLeft">2</td>
                        <td align="center" class="borderTopLeft">3</td>
                        <td align="center" class="borderTopLeft">4</td>
                        <td align="center" class="borderTopLeft">5</td>
                        <td align="center" class="borderTopLeft">6</td>
                        <td align="center" class="borderTopLeft">7</td>
                        <td align="center" class="borderTopLeftRight">8</td>
                    </tr>
                    <tr>
                        <td class="col_140 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!10.3!1!4')">
                            <asp:Label CssClass="normal" ID="tab_103_w01_c01" runat="server" Text="0"></asp:Label>
                            </a></td>
                        <td class="col_140 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!10.3!2!4')">
                            <asp:Label CssClass="normal" ID="tab_103_w01_c02" runat="server" Text="0"></asp:Label>
                            </a></td>
                        <td class="col_140 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!10.3!3!4')">
                            <asp:Label CssClass="normal" ID="tab_103_w01_c03" runat="server" Text="0"></asp:Label>
                            </a></td>
                        <td class="col_140 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!10.3!4!4')">
                            <asp:Label CssClass="normal" ID="tab_103_w01_c04" runat="server" Text="0"></asp:Label>
                            </a></td>
                        <td class="col_140 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!10.3!5!4')">
                            <asp:Label CssClass="normal" ID="tab_103_w01_c05" runat="server" Text="0"></asp:Label>
                            </a></td>
                        <td class="col_140 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!10.3!6!4')">
                            <asp:Label CssClass="normal" ID="tab_103_w01_c06" runat="server" Text="0"></asp:Label>
                            </a></td>
                        <td class="col_140 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!10.3!7!4')">
                            <asp:Label CssClass="normal" ID="tab_103_w01_c07" runat="server" Text="0"></asp:Label>
                            </a></td>
                        <td class="col_140 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!10.3!8!4')">
                            <asp:Label CssClass="normal" ID="tab_103_w01_c08" runat="server" Text="0"></asp:Label>
                            </a></td>
                    </tr>
                   
                  
                </table>
          
                <br />
                </div>
         <div class="page-break">
                 <strong>
                            Dział 11 </strong>  Obciążenia administracyjne respondentów


                 <br />
                 <br />
                 Proszę podać czas (w minutach) przeznaczony na:<br />
                 <br />


                 <table style="width:100%;">
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
        <div>
     <br />
        Raport statystyczny 
                    <asp:Label ID="Label27" runat="server"></asp:Label>
                &nbsp;Sporzadzone dn.
            <asp:Label ID="Label29" runat="server"></asp:Label>
&nbsp;<np. 21 czerwca 2015>przez
            <asp:Label ID="Label28" runat="server"></asp:Label>
&nbsp;<asp:Label ID="Label30" runat="server"></asp:Label>
        <br />

        <asp:Label ID="Label11" runat="server"></asp:Label>
   
        </div>
    
 
    <br />
       
  </div>

    
</asp:Content>

