﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="mss1o.aspx.cs" Inherits="stat2018.mss1o" %>

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
			<H2 CLASS="auto-style2">MS-S1o</H2>
			<P CLASS="western" ALIGN=CENTER><FONT FACE="Arial, sans-serif"><FONT SIZE=3><B>SPRAWOZDANIE</B></FONT></FONT></P>
			<P CLASS="western" ALIGN=CENTER><FONT FACE="Arial, sans-serif"><FONT SIZE=3><B>w
			sprawach cywilnych</B></FONT></FONT></P>
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
        
     </div>
        



 
          <br />
          <br />

          <table style="width:100%;">
              <tr>
                  <td><strong>Dział 1.1.1.1.</strong> Załatwione sprawy Dział 1.1.1. (kol. 3) o rozwód (wiersz 4 do 8) w wypadku gdy pierwotnie wpłynęła sprawa o separację</td>
                  <td class="borderAll center col_90">
                       <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.1!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_1_1_w01_c01" runat="server" Text="0"></asp:Label></a>

                  </td>
              </tr>
          </table>
          <br />
          <table style="width:100%;">
              <tr>
                  <td><strong>Dział 1.1.1.2.</strong> Załatwione sprawy Dział 1.1.1. (kol. 3) o separację (wiersz 9 do 13) w wypadku gdy pierwotnie wpłynęła sprawa o rozwód </td>
                  <td class="borderAll center col_90">
                       <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.2!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_1_2_w01_c01" runat="server" Text="0"></asp:Label></a>

                  </td>
              </tr>
          </table>
       W wypadku gdy wpłynęła sprawa o separację i została zarejestrowana w rep. Ns, a w trakcie postępowania orzeczono rozwód, to sprawę w rep. Ns należy uznać  za załatwioną  w inny 
sposób, a w rep. C wpisać ją pod nowym numerem, w tym także jako ponownie wpisaną. Ponadto należy  wykazać  ją w następujący sposób:
       <table style="width:100%;">
              <tr>
                  <td><strong>Dział 1.1.1.3.</strong> Załatwione sprawy Dział 1.1.1. (kol.. 3) o rozwód (wiersz 4 do 8) w wypadku, gdy pierwotnie wpłynął wniosek o separację  </td>
                  <td class="borderAll center col_90">
                       <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.3!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_1_3_w01_c01" runat="server" Text="0"></asp:Label></a>

                  </td>
              </tr>
          </table>
          <br />
           <div id='1.1.a' class="page -break" >
 <strong> Dział 1.1.a</strong> Pozwy zbiorowe rep. C
    <table cellpadding="0" cellspacing="0" style="width: 100 %; ">
 <tr>    <td  class="center borderAll" colspan="3"> Wyszczególnienie </td>    <td class="center borderAll"> Liczby spraw</td>
</tr>
 <tr>    <td  class="center borderAll col_200" colspan="3">0</td>    <td class="center borderAll">1</td>
</tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">Wpłynęło </td>
  <td  class="borderAll col_36">1</td>
    <td  class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.a!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_a_w01_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">Załatwiono</td>
  <td  class="borderAll col_36">2</td>
    <td  class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.a!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_a_w02_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" rowspan="3">w tym</td>
    <td  class="borderAll wciecie">odrzucono</td>
  <td  class="borderAll col_36">3</td>
    <td  class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.a!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_a_w03_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">oddalono</td>
  <td  class="borderAll col_36">4</td>
    <td  class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.a!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_a_w04_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">zwrócono</td>
  <td  class="borderAll col_36">5</td>
    <td  class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.a!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_a_w05_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">Pozostało</td>
  <td  class="borderAll col_36">6</td>
    <td  class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.a!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_a_w06_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
    </table>
 </div>

          <br />
          <div id="1.1.b" class="page -break">
              <strong>Dział 1.1.b</strong> W tym
              <table cellpadding="0" cellspacing="0" style="width: 100 %; ">
                  <tr>
                      <td  class="center borderAll" colspan="4"> Wyszczególnienie </td>    <td class="center borderAll"> Liczby spraw</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="4">0</td>
                      <td class="center borderAll">1</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="6">W związku z art. 58</td>
                      <td class="borderAll wciecie" rowspan="4">§ 1 bez zdania pierwszego i § 1a k.r.o</td>
                      <td class="borderAll wciecie">o rozwód</td>
                      <td class="borderAll col_36">1</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.b!1!4')">
                          <asp:Label ID="tab_1_1_b_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">w tym w wyniku porozumienia</td>
                      <td class="borderAll col_36">2</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.b!1!4')">
                          <asp:Label ID="tab_1_1_b_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">o separację</td>
                      <td class="borderAll col_36">3</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.b!1!4')">
                          <asp:Label ID="tab_1_1_b_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">w tym w wyniku porozumienia</td>
                      <td class="borderAll col_36">4</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.b!1!4')">
                          <asp:Label ID="tab_1_1_b_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="2">§ 2 bez zdania pierwszego i drugiego i § 3 k.r.o. </td>
                      <td class="borderAll wciecie">o rozwód</td>
                      <td class="borderAll col_36">5</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.b!1!4')">
                          <asp:Label ID="tab_1_1_b_w05_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">o separację</td>
                      <td class="borderAll col_36">6</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.b!1!4')">
                          <asp:Label ID="tab_1_1_b_w06_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2" rowspan="2">Udzielono zabezpieczenia w trybie art. 445 kpc w sprawach o </td>
                      <td class="borderAll wciecie">o rozwód</td>
                      <td class="borderAll col_36">7</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.b!1!4')">
                          <asp:Label ID="tab_1_1_b_w07_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">o separację</td>
                      <td class="borderAll col_36">8</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.b!1!4')">
                          <asp:Label ID="tab_1_1_b_w08_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2" rowspan="2">Liczba spraw, w których orzeczono eksmisję</td>
                      <td class="borderAll wciecie">o rozwód</td>
                      <td class="borderAll col_36">9</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.b!1!4')">
                          <asp:Label ID="tab_1_1_b_w09_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">o separację</td>
                      <td class="borderAll col_36">10</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.b!1!4')">
                          <asp:Label ID="tab_1_1_b_w10_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="3">Liczba ojców, którzy złożyli wniosek o powierzenie wykonywania władzy rodzicielskiej</td>
                      <td class="borderAll col_36">11</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.b!1!4')">
                          <asp:Label ID="tab_1_1_b_w11_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="3">w tym liczba ojców, których wniosek sąd uwzględnił</td>
                      <td class="borderAll col_36">12</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.b!1!4')">
                          <asp:Label ID="tab_1_1_b_w12_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="3">Liczba spraw, w których rodzice przedstawili porozumienie o sposobie wykonywania władzy rodzicielskiej i utrzymywaniu kontaktów z dzieckiem</td>
                      <td class="borderAll col_36">13</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.b!1!4')">
                          <asp:Label ID="tab_1_1_b_w13_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="3">w tym liczba spraw, w których sąd uwzględnił porozumienie </td>
                      <td class="borderAll col_36">14</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.1.b!1!4')">
                          <asp:Label ID="tab_1_1_b_w14_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
              </table>
          </div>
          <br />
          <div id="1.1.c" class="page -break">
              <strong>Dział 1.1.c</strong>&nbsp; O opróżnienie lokalu mieszkalnego rep. C (Dz.1.1.1. w. 16 rubr. 3)
              <table cellpadding="0" cellspacing="0" style="width: 100 %; ">
                  <tr>
                      <td class=" wciecie">- z orzeczeniem prawa do lokalu socjalnego </td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.c!1!4')">
                          <asp:Label ID="tab_1_1_c_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_125 center ">&nbsp;</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.c!3!4')">
                          <asp:Label ID="tab_1_1_c_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class=" wciecie">- bez prawa do lokalu socjalnego</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.c!1!4')">
                          <asp:Label ID="tab_1_1_c_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_125 center ">&nbsp;</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.c!3!4')">
                          <asp:Label ID="tab_1_1_c_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class=" wciecie">- bez orzeczenia o prawie do lokalu socjalnego </td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.c!1!4')">
                          <asp:Label ID="tab_1_1_c_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_125 center ">&nbsp;</td>
                      <td class="col_125 center ">&nbsp;</td>
                  </tr>
              </table>
          </div>
          <br />
          <br />
          <div id="1.1.e" class="page -break">
              <strong>Dział 1.1.e</strong> Orzeczono ubezwłasnowolnienie
              <table cellpadding="0" cellspacing="0" style="width: 100 %; ">
                  <tr>
                      <td class="wciecie ">całkowite&nbsp;&nbsp; </td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.d!1!4')">
                          <asp:Label ID="tab_1_1_e_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="wciecie ">cześciowe</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.d!2!4')">
                          &nbsp;<asp:Label ID="tab_1_1_e_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class=" wciecie" colspan="5">- liczba wniosków o ubezwłasnowolnienie złożonych przez: </td>
                  </tr>
                  <tr>
                      <td class=" wciecie">małżonka osoby, której dotyczy wniosek</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.d!1!4')">
                          <asp:Label ID="tab_1_1_e_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="wciecie col_110">jej krewnych w linii prostej oraz rodzeństwo</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.d!2!4')">
                          <asp:Label ID="tab_1_1_e_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="wciecie">jej przedstawiciela ustawowego</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.d!3!4')">
                          <asp:Label ID="tab_1_1_e_w02_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class=" wciecie">- oddanie pod obserwację w zakładzie leczniczym ogółem</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.d!1!4')">
                          <asp:Label ID="tab_1_1_e_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="wciecie">do 1 mies.</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.d!2!4')">
                          <asp:Label ID="tab_1_1_e_w03_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td>pow. 1 do 3 mies.</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.d!3!4')">
                          <asp:Label ID="tab_1_1_e_w03_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td>ponad 3 mies.</td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.d!4!4')">
                          <asp:Label ID="tab_1_1_e_w03_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class=" wciecie">- ustanowienie doradcy tymczasowego </td>
                      <td class="col_125 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.d!1!4')">
                          <asp:Label ID="tab_1_1_e_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
              </table>
          </div>
          <br />
           <div id='1.1.f' class="page -break" >
 <strong> Dział 1.1.f</strong>&nbsp; Ns-rej. Stan rejestru i zmiany             
    <table cellpadding="0" cellspacing="0" style="width: 100 %; ">
 <tr>    <td  class="center borderAll" colspan="2"> Wyszczególnienie </td>    <td class="center borderAll"> Stan rejestru na koniec poprzedniego okresu statystycznego</td>
<td class="center borderAll">liczba pozycji zarejestrowanych w okresie statystycznym</td>
<td class="center borderAll">liczba pozycji wykreślonych w okresie statystycznym</td>
<td class="center borderAll">Stan rejestru na koniec obecnego okresu statystycznego</td>
</tr>
 <tr>    <td  class="center borderAll" colspan="2">0</td>    <td class="center borderAll">1</td>
<td class="center borderAll">2</td>
<td class="center borderAll">3</td>
<td class="center borderAll">4</td>
</tr>
  <tr>
    <td  class="borderAll wciecie">Prasy</td>
  <td  class="borderAll col_36">1</td>
    <td  class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.f!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_f_w01_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.f!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_f_w01_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.f!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_f_w01_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.f!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_f_w01_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">Partii</td>
  <td  class="borderAll col_36">2</td>
    <td  class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.f!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_f_w02_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.f!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_f_w02_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.f!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_f_w02_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.f!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_f_w02_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">Funduszy Emerytalnych</td>
  <td  class="borderAll col_36">3</td>
    <td  class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.f!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_f_w03_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.f!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_f_w03_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.f!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_f_w03_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.f!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_f_w03_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">Funduszy Inwestycyjnych</td>
  <td  class="borderAll col_36">4</td>
    <td  class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.f!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_f_w04_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.f!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_f_w04_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.f!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_f_w04_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.f!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_f_w04_c04" runat="server" Text="0"></asp:Label></a></td>
  </tr>
    </table>
 </div>

          <br />
          <div id="1.1.g" class="page -break">
              <strong>Dział 1.1.g</strong> (Dział 1.1.1. wiersz 3 i 140 kolumna 4 lit. g)
              <table cellpadding="0" cellspacing="0" style="width: 100 %; ">
                  <tr>
                      <td class="center borderAll" colspan="3" rowspan="2">Wyszczególnienie </td>
                      <td class="center borderAll" colspan="2">Liczby spraw</td>
                  </tr>
                  <tr>
                      <td class="center borderAll">C</td>
                      <td class="center borderAll">Nc</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="3">0</td>
                      <td class="center borderAll">1</td>
                      <td class="center borderAll">2</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="3">Wydano nakaz zapłaty</td>
                      <td class="borderAll wciecie">w postępowaniu nakazowym</td>
                      <td class="borderAll col_36">1</td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.g!1!4')">
                          <asp:Label ID="tab_1_1_g_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.g!2!4')">
                          <asp:Label ID="tab_1_1_g_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">w postępowaniu upominawczym</td>
                      <td class="borderAll col_36">2</td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.g!1!4')">
                          <asp:Label ID="tab_1_1_g_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.g!2!4')">
                          <asp:Label ID="tab_1_1_g_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">w europejskim postępowaniu nakazowym </td>
                      <td class="borderAll col_36">3</td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.g!1!4')">
                          <asp:Label ID="tab_1_1_g_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.g!2!4')">
                          <asp:Label ID="tab_1_1_g_w03_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
              </table>
          </div>
          <br />
          <div id="1.1.h" class="page -break">
              <strong>Dział 1.1.h</strong> (skarga o stwierdzenie niezgodności z prawem łącznie I i II instancja) - (Dział 1.1.1. wiersz 197 + Dział 1.1.2. wiersz 193 kolumna 3 lit. h)
              <table cellpadding="0" cellspacing="0" style="width: 100 %; ">
                  <tr>
                      <td class="center borderAll" colspan="3">Wyszczególnienie </td>
                      <td class="center borderAll">Liczby spraw</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="3">0</td>
                      <td class="center borderAll">1</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">Przekazanych Sądowi Najwyższemu ze skargą o stwierdzenie niezgodności z prawem prawomocnego orzeczenia</td>
                      <td class="borderAll col_36">1</td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.h!1!4')">
                          <asp:Label ID="tab_1_1_h_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">Przesłanych z Sądu Najwyższego w okresie sprawozdawczym (w.02 =w. 03 do 07) </td>
                      <td class="borderAll col_36">2</td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.h!1!4')">
                          <asp:Label ID="tab_1_1_h_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="5">w których Sąd Najwyższy</td>
                      <td class="borderAll wciecie">odmówił przyjęcia skargi do rozpoznania (art.424<sup>9</sup> kpc)</td>
                      <td class="borderAll col_36">3</td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.h!1!4')">
                          <asp:Label ID="tab_1_1_h_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">odrzucił skargę (art.424<sup>8</sup> kpc) </td>
                      <td class="borderAll col_36">4</td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.h!1!4')">
                          <asp:Label ID="tab_1_1_h_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">oddalił skargę (art.424<sup>11</sup> §1 kpc)</td>
                      <td class="borderAll col_36">5</td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.h!1!4')">
                          <asp:Label ID="tab_1_1_h_w05_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">uwzględnił skargę (art.424<sup>11</sup> §2 kpc)</td>
                      <td class="borderAll col_36">6</td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.h!1!4')">
                          <asp:Label ID="tab_1_1_h_w06_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">załatwił w inny sposób</td>
                      <td class="borderAll col_36">7</td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.h!1!4')">
                          <asp:Label ID="tab_1_1_h_w07_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
              </table>
          </div>
          <br />
          <div id="1.1.i" class="page -break">
              <strong>Dział 1.1.i</strong> Zażalenia w ramach właściwości poziomej
              <table cellpadding="0" cellspacing="0" style="width: 100 %; ">
                  <tr>
                      <td class="center borderAll" colspan="2">Zażalenia rozpoznane w trybie art. 394<sup>2</sup>§1 kpc w sprawach:</td>
                      <td class="center borderAll">Pozostało z ubiegłego roku</td>
                      <td class="center borderAll">Wpłynęło </td>
                      <td class="center borderAll">Załatwiono </td>
                      <td class="center borderAll">Pozostało na okres następny</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="2">0</td>
                      <td class="center borderAll">1</td>
                      <td class="center borderAll">2</td>
                      <td class="center borderAll">3</td>
                      <td class="center borderAll">4</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Razem (w02+03)</td>
                      <td class="borderAll col_36">1</td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.i!1!4')">
                          <asp:Label ID="tab_1_1_i_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.i!2!4')">
                          <asp:Label ID="tab_1_1_i_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.i!3!4')">
                          <asp:Label ID="tab_1_1_i_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.i!4!4')">
                          <asp:Label ID="tab_1_1_i_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Ca</td>
                      <td class="borderAll col_36">2</td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.i!1!4')">
                          <asp:Label ID="tab_1_1_i_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.i!2!4')">
                          <asp:Label ID="tab_1_1_i_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.i!3!4')">
                          <asp:Label ID="tab_1_1_i_w02_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.i!4!4')">
                          <asp:Label ID="tab_1_1_i_w02_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Cz</td>
                      <td class="borderAll col_36">3</td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.i!1!4')">
                          <asp:Label ID="tab_1_1_i_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.i!2!4')">
                          <asp:Label ID="tab_1_1_i_w03_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.i!3!4')">
                          <asp:Label ID="tab_1_1_i_w03_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.i!4!4')">
                          <asp:Label ID="tab_1_1_i_w03_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
              </table>
          </div>
          <br />
          <div id="1.1.j" class="page -break">
              <strong>Dział 1.1.j</strong> (skarga kasacyjna) (Dział 1.1.2. wiersz 192 kolumna 3 lit. j)
              <table cellpadding="0" cellspacing="0" style="width: 100 %; ">
                  <tr>
                      <td class="center borderAll" colspan="3">Wyszczególnienie </td>
                      <td class="center borderAll">Liczby spraw</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="3">0</td>
                      <td class="center borderAll">1</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">Przekazanych Sądowi Najwyższemu ze skargą kasacyjną w okresie sprawozdawczym</td>
                      <td class="borderAll col_36">1</td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.j!1!4')">
                          <asp:Label ID="tab_1_1_j_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">Przesłanych z Sądu Najwyższego w okresie sprawozdawczym (w. 02 = w. 03 do 09)</td>
                      <td class="borderAll col_36">2</td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.j!1!4')">
                          <asp:Label ID="tab_1_1_j_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="7">w których
                          <br />
                          Sąd Najwyższy</td>
                      <td class="borderAll wciecie">odmówił przyjęcia skargi do rozpoznania (art. 398<sup>9</sup> kpc)</td>
                      <td class="borderAll col_36">3</td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.j!1!4')">
                          <asp:Label ID="tab_1_1_j_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">odrzucił skargę</td>
                      <td class="borderAll col_36">4</td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.j!1!4')">
                          <asp:Label ID="tab_1_1_j_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">oddalił skargę (art.398<sup>14</sup> kpc)</td>
                      <td class="borderAll col_36">5</td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.j!1!4')">
                          <asp:Label ID="tab_1_1_j_w05_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">uwzględnił skargę poprzez zmianę orzeczenia (art.398<sup>16</sup> kpc)</td>
                      <td class="borderAll col_36">6</td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.j!1!4')">
                          <asp:Label ID="tab_1_1_j_w06_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">uchylił orzeczenie i przekazał sprawę sądowi I lub II instancji do ponownego rozpoznania (art.398<sup>15</sup> kpc)</td>
                      <td class="borderAll col_36">7</td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.j!1!4')">
                          <asp:Label ID="tab_1_1_j_w07_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">uchylił wydane orzeczenie i odrzucił pozew (art.398<sup>19</sup> kpc)</td>
                      <td class="borderAll col_36">8</td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.j!1!4')">
                          <asp:Label ID="tab_1_1_j_w08_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">załatwił w inny sposób</td>
                      <td class="borderAll col_36">9</td>
                      <td class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.j!1!4')">
                          <asp:Label ID="tab_1_1_j_w09_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
              </table>
          </div>
          <br />
          <br />
          <div id="1.1.k" class="page -break">
              <strong>Dział 1.1.k</strong> Ustanowienie pełnomocnika z urzędu
              <table cellpadding="0" cellspacing="0" style="width: 100 %; ">
                  <tr>
                      <td class="center borderAll" colspan="2">Repertorium lub wykaz</td>
                      <td class="center borderAll">Liczba spraw w których doszło do ustanowienia pełnomocnika z urzędu (radca prawny, adwokat) </td>
                      <td class="center borderAll">Liczba ustanowionych pełnomocników z urzędu (radca prawny, adwokat) </td>
                      <td class="center borderAll">W tym liczba wyznaczonych pełnomocników w wyniku zwolnienia poprzedniego pełnomocnika</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="2">0</td>
                      <td class="center borderAll">1</td>
                      <td class="center borderAll">2</td>
                      <td class="center borderAll">3</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">C</td>
                      <td class="borderAll col_36">1</td>
                      <td class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.k!1!4')">
                          <asp:Label ID="tab_1_1_k_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.k!2!4')">
                          <asp:Label ID="tab_1_1_k_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.k!3!4')">
                          <asp:Label ID="tab_1_1_k_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Ns</td>
                      <td class="borderAll col_36">2</td>
                      <td class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.k!1!4')">
                          <asp:Label ID="tab_1_1_k_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.k!2!4')">
                          <asp:Label ID="tab_1_1_k_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.k!3!4')">
                          <asp:Label ID="tab_1_1_k_w02_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Ca</td>
                      <td class="borderAll col_36">3</td>
                      <td class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.k!1!4')">
                          <asp:Label ID="tab_1_1_k_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.k!2!4')">
                          <asp:Label ID="tab_1_1_k_w03_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.k!3!4')">
                          <asp:Label ID="tab_1_1_k_w03_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
              </table>
          </div>
          <br />
          <div id="1.1.l.1" class="page -break">
              <strong>Dział 1.1.l.1</strong> Sprawy mediacyjne
              <table cellpadding="0" cellspacing="0" style="width: 100 %; ">
                  <tr>
                      <td class="center borderAll" colspan="5" rowspan="2">Sądowe</td>
                      <td class="center borderAll" colspan="2">Sprawy w I instancji</td>
                      <td class="center borderAll">Sprawy w II instancji</td>
                  </tr>
                  <tr>
                      <td class="center borderAll">razem</td>
                      <td class="center borderAll">w tym o rozwód i separację</td>
                      <td class="center borderAll">razem</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="5">0</td>
                      <td class="center borderAll">1</td>
                      <td class="center borderAll">2</td>
                      <td class="center borderAll">3</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="5">wpływ</td>
                      <td class="borderAll wciecie" rowspan="5">Liczba</td>
                      <td class="borderAll wciecie" rowspan="3">spraw w których</td>
                      <td class="borderAll wciecie">przeprowadzono spotkanie informacyjne (art. 183 <sup>8</sup> § 4 kpc)</td>
                      <td class="borderAll col_36">1</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.l.1!1!4')">
                          <asp:Label ID="tab_1_1_l_1_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.l.1!2!4')">
                          <asp:Label ID="tab_1_1_l_1_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.l.1!3!4')">
                          <asp:Label ID="tab_1_1_l_1_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">strony skierowano do mediacji po udziale w spotkaniu informacyjnym</td>
                      <td class="borderAll col_36">2</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.l.1!1!4')">
                          <asp:Label ID="tab_1_1_l_1_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.l.1!2!4')">
                          <asp:Label ID="tab_1_1_l_1_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.l.1!3!4')">
                          <asp:Label ID="tab_1_1_l_1_w02_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">strony skierowano do mediacji na podstawie postanowienia sądu (art. 183 <sup>8</sup> § 1 kpc)</td>
                      <td class="borderAll col_36">3</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.l.1!1!4')">
                          <asp:Label ID="tab_1_1_l_1_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.l.1!2!4')">
                          <asp:Label ID="tab_1_1_l_1_w03_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.l.1!3!4')">
                          <asp:Label ID="tab_1_1_l_1_w03_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">mediacji ogółem (w jednej sprawie może być więcej niż jedna mediacja)</td>
                      <td class="borderAll col_36">4</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.l.1!1!4')">
                          <asp:Label ID="tab_1_1_l_1_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.l.1!2!4')">
                          <asp:Label ID="tab_1_1_l_1_w04_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.l.1!3!4')">
                          <asp:Label ID="tab_1_1_l_1_w04_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">protokołów złożonych przez mediatorów po podjęciu mediacji przez strony (art. 183 <sup>13</sup> § 2 kpc)</td>
                      <td class="borderAll col_36">5</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.l.1!1!4')">
                          <asp:Label ID="tab_1_1_l_1_w05_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.l.1!2!4')">
                          <asp:Label ID="tab_1_1_l_1_w05_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.l.1!3!4')">
                          <asp:Label ID="tab_1_1_l_1_w05_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="8">Rozstrzygnięcie przed</td>
                      <td class="borderAll wciecie" rowspan="3">mediatorem</td>
                      <td class="borderAll wciecie" rowspan="3">w sprawach skierowanych w trybie (art. 183 <sup>8 </sup>§ 1 kpc) - liczba </td>
                      <td class="borderAll wciecie">ugód zawartych przed mediatorem</td>
                      <td class="borderAll col_36">6</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.l.1!1!4')">
                          <asp:Label ID="tab_1_1_l_1_w06_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.l.1!2!4')">
                          <asp:Label ID="tab_1_1_l_1_w06_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.l.1!3!4')">
                          <asp:Label ID="tab_1_1_l_1_w06_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">spraw, w których nie zawarto ugody przed mediatorem</td>
                      <td class="borderAll col_36">7</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.l.1!1!4')">
                          <asp:Label ID="tab_1_1_l_1_w07_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.l.1!2!4')">
                          <asp:Label ID="tab_1_1_l_1_w07_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.l.1!3!4')">
                          <asp:Label ID="tab_1_1_l_1_w07_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">spraw, w których postępowanie mediacyjne przed mediatorem zakończyło się w inny sposób niż wykazany w w . 06 i 07</td>
                      <td class="borderAll col_36">8</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.l.1!1!4')">
                          <asp:Label ID="tab_1_1_l_1_w08_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.l.1!2!4')">
                          <asp:Label ID="tab_1_1_l_1_w08_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.l.1!3!4')">
                          <asp:Label ID="tab_1_1_l_1_w08_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="5">sądem</td>
                      <td class="borderAll wciecie" colspan="2">zatwierdzono ugodę (liczba spraw w których sąd zatwierdził ugodę lecz nie umorzył postępowania)</td>
                      <td class="borderAll col_36">9</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.l.1!1!4')">
                          <asp:Label ID="tab_1_1_l_1_w09_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.l.1!2!4')">
                          <asp:Label ID="tab_1_1_l_1_w09_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.l.1!3!4')">
                          <asp:Label ID="tab_1_1_l_1_w09_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">w tym nadano klauzulę wykonalności w trybie art. 183<sup>14</sup>§2 kpc</td>
                      <td class="borderAll col_36">10</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.l.1!1!4')">
                          <asp:Label ID="tab_1_1_l_1_w10_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.l.1!2!4')">
                          <asp:Label ID="tab_1_1_l_1_w10_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.l.1!3!4')">
                          <asp:Label ID="tab_1_1_l_1_w10_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">zatwierdzono ugodę i umorzono postępowanie (art. 183 <sup>14</sup> § 1 i 2 kpc) </td>
                      <td class="borderAll col_36">11</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.l.1!1!4')">
                          <asp:Label ID="tab_1_1_l_1_w11_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.l.1!2!4')">
                          <asp:Label ID="tab_1_1_l_1_w11_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.l.1!3!4')">
                          <asp:Label ID="tab_1_1_l_1_w11_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">w tym nadano klauzulę wykonalności w trybie art. 183<sup>14</sup>§2 kpc</td>
                      <td class="borderAll col_36">12</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.l.1!1!4')">
                          <asp:Label ID="tab_1_1_l_1_w12_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.l.1!2!4')">
                          <asp:Label ID="tab_1_1_l_1_w12_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.l.1!3!4')">
                          <asp:Label ID="tab_1_1_l_1_w12_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">odmówiono zatwierdzenia ugody w trybie (art. 183<sup>14</sup> § 3 kpc)</td>
                      <td class="borderAll col_36">13</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.l.1!1!4')">
                          <asp:Label ID="tab_1_1_l_1_w13_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.l.1!2!4')">
                          <asp:Label ID="tab_1_1_l_1_w13_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.l.1!3!4')">
                          <asp:Label ID="tab_1_1_l_1_w13_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="5">Pozasądowe w I instancji</td>
                      <td class="center borderAll" colspan="3">Liczba</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="2">wpływ</td>
                      <td class="borderAll wciecie" colspan="3">liczba wniosków o zatwierdzenie ugody złożonych przez stronę</td>
                      <td class="borderAll col_36">14</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.1.l.1!1!4')">
                          <asp:Label ID="tab_1_1_l_1_w14_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.1.l.1!2!4')">
                          <asp:Label ID="tab_1_1_l_1_w14_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.1.l.1!3!4')">
                          <asp:Label ID="tab_1_1_l_1_w14_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="3">liczba protokołów złożonych przez mediatorów po podjęciu mediacji przez strony, zawierających ugody (art. 183 <sup>13</sup> § 1 kpc)</td>
                      <td class="borderAll col_36">15</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.1.l.1!1!4')">
                          <asp:Label ID="tab_1_1_l_1_w15_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.1.l.1!2!4')">
                          <asp:Label ID="tab_1_1_l_1_w15_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.1.l.1!3!4')">
                          <asp:Label ID="tab_1_1_l_1_w15_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="3">Rozstrzygnięcie </td>
                      <td class="borderAll wciecie" colspan="3">zatwierdzono ugodę</td>
                      <td class="borderAll col_36">16</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.1.l.1!1!4')">
                          <asp:Label ID="tab_1_1_l_1_w16_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.1.l.1!2!4')">
                          <asp:Label ID="tab_1_1_l_1_w16_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.1.l.1!3!4')">
                          <asp:Label ID="tab_1_1_l_1_w16_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="3">nadano klauzulę wykonalności (art. 183 <sup>14</sup> § 2 kpc)</td>
                      <td class="borderAll col_36">17</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.1.l.1!1!4')">
                          <asp:Label ID="tab_1_1_l_1_w17_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.1.l.1!2!4')">
                          <asp:Label ID="tab_1_1_l_1_w17_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.1.l.1!3!4')">
                          <asp:Label ID="tab_1_1_l_1_w17_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="3">odmówiono zatwierdzenia ugody w trybie (art. 183<sup>14</sup> § 3 kpc)</td>
                      <td class="borderAll col_36">18</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.1.l.1!1!4')">
                          <asp:Label ID="tab_1_1_l_1_w18_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.1.l.1!2!4')">
                          <asp:Label ID="tab_1_1_l_1_w18_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.1.l.1!3!4')">
                          <asp:Label ID="tab_1_1_l_1_w18_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
              </table>
          </div>
          <br />
          <div id="1.1.l.2" class="page -break">
              <strong>Dział 1.1.l.2</strong> Sprawy mediacyjne w sprawach o rozwód i separację
              <table cellpadding="0" cellspacing="0" style="width: 100 %; ">
                  <tr>
                      <td class="center borderAll" colspan="3" rowspan="5">Sprawy</td>
                      <td class="center borderAll" colspan="12">Postępowanie sądowe</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" rowspan="4">Pozostało z ubiegłego roku</td>
                      <td class="center borderAll" colspan="4">wpłynęło</td>
                      <td class="center borderAll" colspan="6">załatwiono w postępowaniu mediacyjnym</td>
                      <td class="center borderAll" rowspan="4">pozostało na okres następny</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" rowspan="3">razem</td>
                      <td class="center borderAll" colspan="3">w tym</td>
                      <td class="center borderAll" rowspan="3">razem</td>
                      <td class="center borderAll" colspan="2" rowspan="2">wynik postępowania mediacyjnego</td>
                      <td class="center borderAll" rowspan="3">liczba porozumień rodzicie-lskich</td>
                      <td class="center borderAll" rowspan="3">umorzono postępo-wanie w wyniku pojednania </td>
                      <td class="center borderAll" rowspan="3">w inny sposób (np. odmowa lub cofnięcie zgody, cofnięcie powództwa, śmierć strony itd.)</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="2">liczba spraw skierowanych na podstawie</td>
                      <td class="center borderAll" rowspan="2">strony wniosły o przed-łużenie mediacji</td>
                  </tr>
                  <tr>
                      <td class="center borderAll">art. 436 § 1 kpc</td>
                      <td class="center borderAll">art. 445² kpc</td>
                      <td class="center borderAll">ugoda</td>
                      <td class="center borderAll">brak ugody</td>
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
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">o rozwód</td>
                      <td class="borderAll col_36">1</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.l.2!1!4')">
                          <asp:Label ID="tab_1_1_l_2_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.l.2!2!4')">
                          <asp:Label ID="tab_1_1_l_2_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.l.2!3!4')">
                          <asp:Label ID="tab_1_1_l_2_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.l.2!4!4')">
                          <asp:Label ID="tab_1_1_l_2_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.l.2!5!4')">
                          <asp:Label ID="tab_1_1_l_2_w01_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.l.2!6!4')">
                          <asp:Label ID="tab_1_1_l_2_w01_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.l.2!7!4')">
                          <asp:Label ID="tab_1_1_l_2_w01_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.l.2!8!4')">
                          <asp:Label ID="tab_1_1_l_2_w01_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.l.2!9!4')">
                          <asp:Label ID="tab_1_1_l_2_w01_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.l.2!10!4')">
                          <asp:Label ID="tab_1_1_l_2_w01_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.l.2!11!4')">
                          <asp:Label ID="tab_1_1_l_2_w01_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.l.2!12!4')">
                          <asp:Label ID="tab_1_1_l_2_w01_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="2">o separację </td>
                      <td class="borderAll wciecie">rep. C procesowe</td>
                      <td class="borderAll col_36">2</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.l.2!1!4')">
                          <asp:Label ID="tab_1_1_l_2_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.l.2!2!4')">
                          <asp:Label ID="tab_1_1_l_2_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.l.2!3!4')">
                          <asp:Label ID="tab_1_1_l_2_w02_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.l.2!4!4')">
                          <asp:Label ID="tab_1_1_l_2_w02_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.l.2!5!4')">
                          <asp:Label ID="tab_1_1_l_2_w02_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.l.2!6!4')">
                          <asp:Label ID="tab_1_1_l_2_w02_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.l.2!7!4')">
                          <asp:Label ID="tab_1_1_l_2_w02_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.l.2!8!4')">
                          <asp:Label ID="tab_1_1_l_2_w02_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.l.2!9!4')">
                          <asp:Label ID="tab_1_1_l_2_w02_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.l.2!10!4')">
                          <asp:Label ID="tab_1_1_l_2_w02_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.l.2!11!4')">
                          <asp:Label ID="tab_1_1_l_2_w02_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.l.2!12!4')">
                          <asp:Label ID="tab_1_1_l_2_w02_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">rep. Ns nieprocesowe</td>
                      <td class="borderAll col_36">3</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.l.2!1!4')">
                          <asp:Label ID="tab_1_1_l_2_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.l.2!2!4')">
                          <asp:Label ID="tab_1_1_l_2_w03_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.l.2!3!4')">
                          <asp:Label ID="tab_1_1_l_2_w03_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.l.2!4!4')">
                          <asp:Label ID="tab_1_1_l_2_w03_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.l.2!5!4')">
                          <asp:Label ID="tab_1_1_l_2_w03_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.l.2!6!4')">
                          <asp:Label ID="tab_1_1_l_2_w03_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.l.2!7!4')">
                          <asp:Label ID="tab_1_1_l_2_w03_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.l.2!8!4')">
                          <asp:Label ID="tab_1_1_l_2_w03_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.l.2!9!4')">
                          <asp:Label ID="tab_1_1_l_2_w03_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.l.2!10!4')">
                          <asp:Label ID="tab_1_1_l_2_w03_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.l.2!11!4')">
                          <asp:Label ID="tab_1_1_l_2_w03_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.l.2!12!4')">
                          <asp:Label ID="tab_1_1_l_2_w03_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
              </table>
          </div>
          <br />
          <div id="1.1.m" class="page -break">
              <strong>Dział 1.1.m</strong> Wpływ skarg o wznowienie postępowania
              <table cellpadding="0" cellspacing="0" style="width: 100 %; ">
                  <tr>
                      <td class="center borderAll" colspan="2">Repertorium lub wykaz</td>
                      <td class="center borderAll">Wpływ spraw</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="2">0</td>
                      <td class="center borderAll">1</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">C</td>
                      <td class="borderAll col_36">1</td>
                      <td class="col_200 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.m!1!4')">
                          <asp:Label ID="tab_1_1_m_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Ns</td>
                      <td class="borderAll col_36">2</td>
                      <td class="col_200 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.m!1!4')">
                          <asp:Label ID="tab_1_1_m_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Nc</td>
                      <td class="borderAll col_36">3</td>
                      <td class="col_200 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.m!1!4')">
                          <asp:Label ID="tab_1_1_m_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
              </table>
          </div>
          <br />
          <table style="width:100%;">
              <tr>
                  <td><strong>Dział 1.1.n</strong> Sprawy, w których doszło do nabycia nieruchomości przez cudzoziemców na podstawie prawomocnego orzeczenia sądowego [art.8a ust. 2 ustawy z dnia 24 marca 1920 r. o nabywaniu nieru-chomości przez cudzoziemców (Dz. U. z 2017 r. poz. 2278 )]– załatwienia (dotyczy wszystkich urządzeń ewidencyjnych)</td>
                  <td class="col_60 center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.n!1!4')">
                          <asp:Label ID="tab_1_1_n_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
              </tr>
          </table>
       UWAGA : w każdej sprawie, w której zapadło prawomocne orzeczenie o nabyciu ( zarówno w postępowaniu procesowym jak i nieprocesowym) nieruchomości przez cudzoziemca przesyła się niezwłocznie odpis orzeczenia do MSW. Przez nabycie należy rozumieć każdy rodzaj orzeczenia, na podstawie którego cudzoziemiec stał się właścicielem nieruchomości, np. w trybie zniesienia współwłasności, działu spadku, podziału majątku, zasiedzenia, ustalenia własności, uzgodnienia treści księgi wieczystej itd.<br />
&nbsp;<br />
           <div id='1.1.o' class="page -break" >
 <strong> Dział 1.1.o</strong> Ewidencja  spraw ogółem i przyczyny ponownych wpisów oraz rodzaje szczególnych załatwień spraw cywilnych 
    <table cellpadding="0" cellspacing="0" style="width: 100 %; ">
 <tr>    <td  class="center borderAll" colspan="4" rowspan="3"> Wyszczególnienie </td>    <td class="center borderAll" colspan="11"> Repertorium/wykaz</td>
</tr>
 <tr>    <td class="center borderAll" rowspan="2"> Ogółem I&nbsp; i II instancja</td>
<td class="center borderAll" rowspan="2">Ogółem I&nbsp;&nbsp; instancja</td>
<td class="center borderAll" colspan="6">w tym</td>
<td class="center borderAll" rowspan="2"></td>
<td class="center borderAll" colspan="2">w tym</td>
</tr>
 <tr>    
<td class="center borderAll">C</td>
<td class="center borderAll">CG-G</td>
<td class="center borderAll">Ns</td>
<td class="center borderAll">Ns-rej</td>
<td class="center borderAll">Nc</td>
<td class="center borderAll">Co</td>
<td class="center borderAll">Ca</td>
<td class="center borderAll">Cz</td>
</tr>
 <tr>    <td  class="center borderAll" colspan="4">0</td>    <td class="center borderAll">1</td>
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
    <td  class="borderAll wciecie" colspan="3">Pozostało z ubiegłego roku (w.01=dz.1.1.1. r.1 odpowiednie wiersze)</td>
  <td  class="borderAll col_36">1</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w01_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w01_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w01_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w01_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w01_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w01_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w01_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w01_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w01_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w01_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w01_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="3">Wpłynęło ogółem (w.02=dz.1.1.1. r.2 odpowiednie wiersze = w03+28)</td>
  <td  class="borderAll col_36">2</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w02_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w02_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w02_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w02_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w02_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w02_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w02_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w02_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w02_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w02_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w02_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" rowspan="15">W tym ponownie wpisane</td>
    <td  class="borderAll wciecie" colspan="2">razem (w. 03 = w.04 do 14 + 16 do 27) ponownie wpisane </td>
  <td  class="borderAll col_36">3</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w03_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w03_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w03_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w03_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w03_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w03_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w03_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w03_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w03_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w03_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w03_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">zwrot pozwu / wniosku / skargi</td>
  <td  class="borderAll col_36">4</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w04_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w04_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w04_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w04_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w04_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w04_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w04_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w04_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w04_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w04_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w04_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">przekazanie z innych jednostek na podstawie art. 200§1 kpc (z wyjątkiem zmian organizacyjnych)</td>
  <td  class="borderAll col_36">5</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w05_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w05_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w05_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w05_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w05_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w05_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w05_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w05_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w05_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w05_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w05_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">wyłączenie sprawy do odrębnego rozpoznania – poprzednio połączonej na podstawie art. 219 kpc</td>
  <td  class="borderAll col_36">6</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w06_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w06_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w06_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w06_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w06_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w06_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w06_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w06_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w06_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w06_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w06_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">wyłączenie roszczenia do odrębnego postępowania</td>
  <td  class="borderAll col_36">7</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w07_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w07_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w07_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w07_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w07_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w07_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w07_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w07_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w07_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w07_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w07_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">sprawy zawieszone zakreślone, które podjęto</td>
  <td  class="borderAll col_36">8</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w08_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w08_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w08_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w08_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w08_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w08_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w08_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w08_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w08_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w08_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w08_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">wpisane na podstawie art. 486 kpc i art. 498§2 kpc</td>
  <td  class="borderAll col_36">9</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w09_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w09_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w09_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w09_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w09_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w09_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w09_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w09_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w09_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w09_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w09_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">wpisane na podstawie art. 495§1 kpc</td>
  <td  class="borderAll col_36">10</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w10_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w10_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w10_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w10_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w10_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w10_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w10_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w10_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w10_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w10_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w10_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">wpisane na podstawie art. 505§1 kpc</td>
  <td  class="borderAll col_36">11</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w11_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w11_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w11_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w11_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w11_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w11_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w11_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w11_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w11_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w11_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w11_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">przekazano sprawy w ramach sądu pomiędzy wydziałami tego samego pionu</td>
  <td  class="borderAll col_36">12</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w12_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w12_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w12_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w12_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w12_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w12_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w12_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w12_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w12_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w12_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w12_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">przekazano sprawy w ramach sądu pomiędzy wydziałami różnych pionów</td>
  <td  class="borderAll col_36">13</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w13_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w13_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w13_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w13_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w13_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w13_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w13_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w13_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w13_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w13_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w13_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">przekazano przez SR Lublin-Zachód (<strong>e-sąd</strong>) </td>
  <td  class="borderAll col_36">14</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w14_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w14_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w14_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w14_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w14_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w14_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w14_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w14_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w14_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w14_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w14_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">w tym przekazane na podstawie art. 505<sup>33</sup> §1 kpc</td>
  <td  class="borderAll col_36">15</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w15_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w15_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w15_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w15_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w15_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w15_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w15_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w15_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w15_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w15_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w15_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">wpisane w wyniku przywrócenia terminu do wniesienia środka zaskarżenia </td>
  <td  class="borderAll col_36">16</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w16_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w16_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w16_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w16_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w16_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w16_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w16_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w16_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w16_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w16_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w16_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">po uchyleniu orzeczenia i przekazaniu sprawy do ponownego rozpoznania </td>
  <td  class="borderAll col_36">17</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w17_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w17_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w17_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w17_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w17_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w17_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w17_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w17_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w17_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w17_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w17_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" rowspan="10"></td>
    <td  class="borderAll wciecie" colspan="2">w wyniku zmian zarządzenia MS o biurowości</td>
  <td  class="borderAll col_36">18</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w18_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w18_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w18_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w18_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w18_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w18_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w18_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w18_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w18_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w18_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w18_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" rowspan="2">zmiany organizacyjne związane z utworzeniem lub likwidacją</td>
    <td  class="borderAll wciecie">wydziału (ów)</td>
  <td  class="borderAll col_36">19</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w19_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w19_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w19_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w19_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w19_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w19_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w19_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w19_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w19_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w19_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w19_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">sądu (ów)</td>
  <td  class="borderAll col_36">20</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w20_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w20_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w20_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w20_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w20_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w20_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w20_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w20_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w20_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w20_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w20_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" rowspan="2">w związku ze zmianą obszaru właściwości miejscowej</td>
    <td  class="borderAll wciecie">wydziału (ów)</td>
  <td  class="borderAll col_36">21</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w21_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w21_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w21_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w21_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w21_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w21_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w21_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w21_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w21_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w21_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w21_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">sądu (ów)</td>
  <td  class="borderAll col_36">22</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w22_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w22_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w22_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w22_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w22_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w22_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w22_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w22_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w22_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w22_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w22_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">w wyniku zmiany trybu lub rodzaju postępowania (art. 201 § 1 i 2 kpc)</td>
  <td  class="borderAll col_36">23</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w23_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w23_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w23_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w23_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w23_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w23_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w23_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w23_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w23_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w23_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w23_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">dokonano omyłkowego wpisu</td>
  <td  class="borderAll col_36">24</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w24_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w24_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w24_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w24_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w24_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w24_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w24_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w24_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w24_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w24_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w24_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" rowspan="2">ponowny przydział spraw</td>
    <td  class="borderAll wciecie">w związku z funkcjonowaniem § 43 Regulaminu</td>
  <td  class="borderAll col_36">25</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w25_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w25_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w25_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w25_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w25_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w25_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w25_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w25_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w25_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w25_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w25_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">w związku ze wspólnym wpływem §54 ust.2 Regulaminu</td>
  <td  class="borderAll col_36">26</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w26_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w26_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w26_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w26_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w26_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w26_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w26_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w26_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w26_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w26_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w26_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">inne ponownie wpisane</td>
  <td  class="borderAll col_36">27</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w27_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w27_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w27_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w27_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w27_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w27_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w27_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w27_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w27_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w27_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w27_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="3">Wpływ pozostałych spraw</td>
  <td  class="borderAll col_36">28</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w28_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w28_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w28_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w28_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w28_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w28_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w28_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w28_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w28_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w28_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w28_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="3">Załatwiono ogółem (w.29=dz.1.1.1. r.3 odpowiednie wiersze =w.30+58)</td>
  <td  class="borderAll col_36">29</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w29_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w29_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w29_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w29_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w29_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w29_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w29_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w29_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w29_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w29_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w29_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" rowspan="16"></td>
    <td  class="borderAll wciecie" colspan="2">razem (w. 30 = w.31 do 57) szczególne rodzaje załatwień </td>
  <td  class="borderAll col_36">30</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w30_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w30_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w30_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w30_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w30_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w30_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w30_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w30_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w30_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w30_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w30_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">zwrot pozwu / wniosku / skargi</td>
  <td  class="borderAll col_36">31</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w31_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w31_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w31_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w31_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w31_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w31_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w31_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w31_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w31_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w31_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w31_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">przekazanie do innych jednostek na podstawie art. 200§1 kpc (z wyjątkiem zmian organizacyjnych)</td>
  <td  class="borderAll col_36">32</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w32_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w32_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w32_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w32_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w32_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w32_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w32_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w32_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w32_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w32_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w32_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">zakończono w trybie art. 339 kpc</td>
  <td  class="borderAll col_36">33</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w33_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w33_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w33_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w33_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w33_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w33_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w33_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w33_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w33_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w33_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w33_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">zakończono w trybie art. 341 kpc</td>
  <td  class="borderAll col_36">34</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w34_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w34_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w34_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w34_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w34_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w34_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w34_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w34_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w34_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w34_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w34_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">zakreślono na podstawie art. 486 kpc</td>
  <td  class="borderAll col_36">35</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w35_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w35_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w35_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w35_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w35_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w35_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w35_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w35_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w35_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w35_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w35_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">zakreślono na podstawie art. 498 § 2 kpc</td>
  <td  class="borderAll col_36">36</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w36_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w36_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w36_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w36_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w36_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w36_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w36_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w36_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w36_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w36_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w36_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">w wyniku zmian zarządzenia MS o biurowości</td>
  <td  class="borderAll col_36">37</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w37_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w37_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w37_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w37_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w37_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w37_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w37_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w37_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w37_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w37_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w37_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">w wyniku przekazania sprawy w ramach sądu pomiędzy wydziałami tego samego pionu</td>
  <td  class="borderAll col_36">38</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=38!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w38_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=38!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w38_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=38!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w38_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=38!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w38_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=38!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w38_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=38!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w38_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=38!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w38_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=38!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w38_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=38!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w38_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=38!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w38_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=38!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w38_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">w wyniku przekazania sprawy w ramach sądu pomiędzy wydziałami różnych pionów</td>
  <td  class="borderAll col_36">39</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=39!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w39_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=39!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w39_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=39!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w39_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=39!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w39_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=39!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w39_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=39!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w39_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=39!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w39_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=39!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w39_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=39!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w39_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=39!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w39_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=39!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w39_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" rowspan="2">zmiany organizacyjne związane z utworzeniem lub likwidacją</td>
    <td  class="borderAll wciecie">wydziału (ów)</td>
  <td  class="borderAll col_36">40</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=40!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w40_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=40!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w40_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=40!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w40_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=40!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w40_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=40!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w40_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=40!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w40_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=40!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w40_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=40!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w40_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=40!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w40_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=40!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w40_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=40!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w40_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">sądu (ów)</td>
  <td  class="borderAll col_36">41</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=41!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w41_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=41!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w41_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=41!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w41_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=41!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w41_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=41!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w41_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=41!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w41_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=41!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w41_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=41!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w41_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=41!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w41_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=41!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w41_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=41!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w41_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" rowspan="2">w związku ze zmianą obszaru właściwości miejscowej</td>
    <td  class="borderAll wciecie">wydziału (ów)</td>
  <td  class="borderAll col_36">42</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=42!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w42_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=42!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w42_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=42!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w42_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=42!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w42_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=42!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w42_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=42!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w42_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=42!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w42_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=42!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w42_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=42!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w42_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=42!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w42_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=42!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w42_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">sądu (ów)</td>
  <td  class="borderAll col_36">43</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=43!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w43_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=43!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w43_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=43!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w43_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=43!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w43_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=43!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w43_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=43!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w43_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=43!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w43_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=43!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w43_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=43!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w43_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=43!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w43_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=43!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w43_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">połączono do łącznego rozpoznania na podstawie art. 219 kpc</td>
  <td  class="borderAll col_36">44</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=44!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w44_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=44!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w44_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=44!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w44_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=44!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w44_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=44!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w44_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=44!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w44_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=44!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w44_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=44!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w44_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=44!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w44_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=44!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w44_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=44!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w44_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">zakreślone w wyniku zmiany trybu lub rodzaju postępowania (art. 201 § 1 i 2 kpc)</td>
  <td  class="borderAll col_36">45</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=45!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w45_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=45!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w45_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=45!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w45_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=45!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w45_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=45!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w45_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=45!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w45_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=45!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w45_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=45!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w45_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=45!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w45_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=45!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w45_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=45!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w45_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" rowspan="12"></td>
    <td  class="borderAll wciecie" rowspan="2">zakreślono na podstawie art. 174 §1</td>
    <td  class="borderAll wciecie">pkt 1 kpc</td>
  <td  class="borderAll col_36">46</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=46!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w46_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=46!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w46_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=46!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w46_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=46!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w46_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=46!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w46_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=46!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w46_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=46!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w46_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=46!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w46_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=46!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w46_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=46!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w46_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=46!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w46_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">pkt 4 kpc</td>
  <td  class="borderAll col_36">47</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=47!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w47_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=47!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w47_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=47!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w47_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=47!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w47_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=47!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w47_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=47!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w47_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=47!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w47_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=47!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w47_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=47!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w47_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=47!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w47_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=47!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w47_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">zakreślenie omyłkowych wpisów </td>
  <td  class="borderAll col_36">48</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=48!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w48_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=48!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w48_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=48!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w48_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=48!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w48_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=48!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w48_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=48!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w48_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=48!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w48_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=48!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w48_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=48!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w48_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=48!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w48_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=48!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w48_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">odrzucono pozew / wniosek / skargę/apelację/ zażalenie </td>
  <td  class="borderAll col_36">49</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=49!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w49_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=49!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w49_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=49!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w49_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=49!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w49_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=49!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w49_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=49!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w49_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=49!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w49_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=49!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w49_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=49!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w49_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=49!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w49_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=49!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w49_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">umorzenie na skutek cofnięcia pozwu, wniosku (wykazujemy I i II instancję), środka odwoławczego lub, skargi przed sądem II instancji</td>
  <td  class="borderAll col_36">50</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=50!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w50_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=50!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w50_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=50!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w50_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=50!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w50_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=50!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w50_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=50!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w50_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=50!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w50_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=50!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w50_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=50!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w50_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=50!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w50_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=50!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w50_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">umorzenie na podstawie art. 505<sup>37</sup> §1 kpc</td>
  <td  class="borderAll col_36">51</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=51!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w51_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=51!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w51_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=51!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w51_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=51!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w51_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=51!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w51_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=51!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w51_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=51!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w51_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=51!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w51_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=51!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w51_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=51!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w51_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=51!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w51_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">w trybie § 110 ust. 3 Zarządzenia Ministra Sprawiedliwości z dnia 12 grudnia 2003 r. w sprawie organizacji i zakresu działania sekretariatów sądowych oraz innych działów administracji sądowej (Dz. Urz. MS. Nr 5, poz. 22, z późn. zm.)</td>
  <td  class="borderAll col_36">52</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=52!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w52_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=52!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w52_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=52!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w52_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=52!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w52_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=52!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w52_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=52!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w52_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=52!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w52_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=52!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w52_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=52!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w52_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=52!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w52_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=52!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w52_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">zakończono w trybie art.148<sup>1</sup> §1 kpc</td>
  <td  class="borderAll col_36">53</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=53!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w53_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=53!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w53_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=53!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w53_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=53!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w53_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=53!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w53_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=53!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w53_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=53!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w53_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=53!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w53_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=53!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w53_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=53!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w53_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=53!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w53_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">wydano nakaz zapłaty</td>
  <td  class="borderAll col_36">54</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=54!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w54_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=54!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w54_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=54!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w54_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=54!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w54_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=54!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w54_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=54!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w54_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=54!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w54_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=54!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w54_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=54!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w54_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=54!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w54_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=54!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w54_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" rowspan="2">ponowny przydział spraw</td>
    <td  class="borderAll wciecie">w związku z funkcjonowaniem § 43 Regulaminu</td>
  <td  class="borderAll col_36">55</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=55!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w55_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=55!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w55_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=55!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w55_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=55!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w55_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=55!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w55_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=55!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w55_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=55!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w55_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=55!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w55_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=55!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w55_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=55!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w55_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=55!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w55_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">w związku ze wspólnym wpływem §54 ust.2 Regulaminu</td>
  <td  class="borderAll col_36">56</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=56!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w56_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=56!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w56_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=56!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w56_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=56!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w56_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=56!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w56_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=56!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w56_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=56!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w56_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=56!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w56_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=56!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w56_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=56!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w56_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=56!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w56_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">inne nie wymienione wyżej szczególne rodzaje załatwień</td>
  <td  class="borderAll col_36">57</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=57!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w57_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=57!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w57_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=57!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w57_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=57!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w57_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=57!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w57_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=57!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w57_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=57!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w57_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=57!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w57_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=57!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w57_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=57!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w57_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=57!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w57_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="3">Załatwienie pozostałych spraw</td>
  <td  class="borderAll col_36">58</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=58!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w58_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=58!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w58_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=58!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w58_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=58!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w58_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=58!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w58_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=58!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w58_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=58!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w58_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=58!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w58_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=58!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w58_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=58!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w58_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=58!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w58_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="3">Pozostało na okres następny (w.59=dz.1.1.1. r.15 odpowiednie wiersze)</td>
  <td  class="borderAll col_36">59</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=59!1.1.o!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w59_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=59!1.1.o!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w59_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=59!1.1.o!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w59_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=59!1.1.o!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w59_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=59!1.1.o!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w59_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=59!1.1.o!6!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w59_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=59!1.1.o!7!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w59_c07" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=59!1.1.o!8!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w59_c08" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=59!1.1.o!9!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w59_c09" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=59!1.1.o!10!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w59_c10" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=59!1.1.o!11!4')"><asp:Label CssClass="normal" ID="tab_1_1_0_w59_c11" runat="server" Text="0"></asp:Label></a></td>
  </tr>
    </table>
 </div>

          <br />

          <table style="width:100%;">
              <tr>
                  <td><strong>Dział 1.1.p</strong> Liczba wyznaczonych ławników (osoby)</td>
                  <td class="borderAll center col_90">
                       <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.1!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_p_w01_c01" runat="server" Text="0"></asp:Label></a>

                  </td>
              </tr>
          </table>
          <br />

          <table style="width:100%;">
              <tr>
                  <td><strong>Dział 1.1.r</strong> W tym liczba spraw w II instancji o alimenty zagranicą (dot. uprawnionego lub zobowiązanego)</td>
                  <td class="borderAll center col_90">
                       <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.1!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_r_w01_c01" runat="server" Text="0"></asp:Label></a>

                  </td>
              </tr>
          </table>
          <br />
          <div id="1.1.s" class="page -break">
              <strong>Dział 1.1.s</strong> Przyznanie kompensaty (ustawa z 7 lipca 2005 r. o państwowej kompensacie przysługującej ofiarom niektórych czynów zabronionych) (Dz. U. z 2016 r., poz. 325)
              <table cellpadding="0" cellspacing="0" style="width: 100 %; ">
                  <tr>
                      <td class=" wciecie">- Liczba spraw, w których przyznano kompensatę</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.s!1!4')">
                          <asp:Label ID="tab_1_1_s_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td>Łączna wysokość przyznanych kompensat (zł) (wartość w zaokrągleniu w górę do pełnego złotego)</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.s!2!4')">
                          <asp:Label ID="tab_1_1_s_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
              </table>
          </div>
          <br />
          <div id="1.1.t" class="page -break">
              <strong>Dział 1.1.t</strong> Prawomocne orzeczenia w sprawach o alimenty przy sprawach rozwodowych (sprawy)
              <table cellpadding="0" cellspacing="0" style="width: 100 %; ">
                  <tr>
                      <td class="center borderAll" colspan="3" rowspan="3">ROSZCZENIA ALIMENTACYJNE</td>
                      <td class="center borderAll" rowspan="3">Ogółem (kol. 2 do 5) </td>
                      <td class="center borderAll" colspan="4">Liczba spraw, w których roszczenie w zakresie alimentów</td>
                      <td class="center borderAll" rowspan="3">Wysokość zasądzonych alimentów (ogólna kwota w złotych) </td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="2">uwzględniono w całości, w częścii ponad żądanie </td>
                      <td class="center borderAll" colspan="2">zawarto ugodę</td>
                  </tr>
                  <tr>
                      <td class="center borderAll">o zasądzenie pierwszy raz</td>
                      <td class="center borderAll">o zmianę wysokości</td>
                      <td class="center borderAll">o zasądzenie pierwszy raz</td>
                      <td class="center borderAll">o zmianę wysokości</td>
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
                      <td class="borderAll wciecie" colspan="2">Razem (wiersz 2 do 4)</td>
                      <td class="borderAll col_36">1</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.t!1!4')">
                          <asp:Label ID="tab_1_1_t_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.t!2!4')">
                          <asp:Label ID="tab_1_1_t_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.t!3!4')">
                          <asp:Label ID="tab_1_1_t_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.t!4!4')">
                          <asp:Label ID="tab_1_1_t_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.t!5!4')">
                          <asp:Label ID="tab_1_1_t_w01_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.t!6!4')">
                          <asp:Label ID="tab_1_1_t_w01_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="3">Zasądzone na rzecz</td>
                      <td class="borderAll wciecie">dzieci (w tym małoletnich)</td>
                      <td class="borderAll col_36">2</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.t!1!4')">
                          <asp:Label ID="tab_1_1_t_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.t!2!4')">
                          <asp:Label ID="tab_1_1_t_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.t!3!4')">
                          <asp:Label ID="tab_1_1_t_w02_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.t!4!4')">
                          <asp:Label ID="tab_1_1_t_w02_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.t!5!4')">
                          <asp:Label ID="tab_1_1_t_w02_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.t!6!4')">
                          <asp:Label ID="tab_1_1_t_w02_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">małżonków</td>
                      <td class="borderAll col_36">3</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.t!1!4')">
                          <asp:Label ID="tab_1_1_t_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.t!2!4')">
                          <asp:Label ID="tab_1_1_t_w03_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.t!3!4')">
                          <asp:Label ID="tab_1_1_t_w03_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.t!4!4')">
                          <asp:Label ID="tab_1_1_t_w03_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.t!5!4')">
                          <asp:Label ID="tab_1_1_t_w03_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.t!6!4')">
                          <asp:Label ID="tab_1_1_t_w03_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">małżonków i ich dzieci</td>
                      <td class="borderAll col_36">4</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.t!1!4')">
                          <asp:Label ID="tab_1_1_t_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.t!2!4')">
                          <asp:Label ID="tab_1_1_t_w04_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.t!3!4')">
                          <asp:Label ID="tab_1_1_t_w04_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.t!4!4')">
                          <asp:Label ID="tab_1_1_t_w04_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.t!5!4')">
                          <asp:Label ID="tab_1_1_t_w04_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.t!6!4')">
                          <asp:Label ID="tab_1_1_t_w04_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
              </table>
          </div>
          <br />
          <div id="1.1.u" class="page -break">
              <strong>Dział 1.1.u</strong> . W tym na podstawie Ustawy z dnia 22 listopada 2013 r. o postępowaniu wobec osób z zaburzeniami psychicznymi stwarzających zagrożenie życia, zdrowia lub wolności seksualnej innych osób (Dz. U. 2014 poz. 24 ze zm.)
              <table cellpadding="0" cellspacing="0" style="width: 100 %; ">
                  <tr>
                      <td class="center borderAll" colspan="4">Wyszczególnienie </td>
                      <td class="center borderAll">Liczby spraw</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="4">0</td>
                      <td class="center borderAll">1</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="3">Lit. u) (Dział 1.1.1. wiersz 136 kolumna 2) liczba wniosków o uznanie osoby za stwarzającą zagrożenie</td>
                      <td class="borderAll col_36">1</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.u!1!4')">
                          <asp:Label ID="tab_1_1_u_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="2">Lit. u) (Dział 1.1.1. wiersz 136 kolumna 3)</td>
                      <td class="borderAll wciecie" rowspan="2">liczba osób wobec których orzeczono</td>
                      <td class="borderAll wciecie">nadzór prewencyjny </td>
                      <td class="borderAll col_36">2</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.u!1!4')">
                          <asp:Label ID="tab_1_1_u_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">umieszczenie w Krajowym Ośrodku Zapobiegania Zachowaniom Dyssocjalnym</td>
                      <td class="borderAll col_36">3</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.u!1!4')">
                          <asp:Label ID="tab_1_1_u_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
              </table>
          </div>
          <br />
          <div id="1.1.v" class="page -break">
              <strong>Dział 1.1.v</strong> w tym powództwo w następstwie decyzji organu ochrony konkurencji
              <table cellpadding="0" cellspacing="0" style="width: 100 %; ">
                  <tr>
                      <td class="center borderAll" colspan="2">Wyszczególnienie </td>
                      <td class="center borderAll">Liczby spraw</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="2">0</td>
                      <td class="center borderAll">1</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Prezesa UOKiK</td>
                      <td class="borderAll col_36">1</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.v!1!4')">
                          <asp:Label ID="tab_1_1_v_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Krajowego organu ochrony konkurencji innego państwa członkowskiego UE</td>
                      <td class="borderAll col_36">2</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.v!1!4')">
                          <asp:Label ID="tab_1_1_v_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Komisji Europejskiej</td>
                      <td class="borderAll col_36">3</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.v!1!4')">
                          <asp:Label ID="tab_1_1_v_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
              </table>
          </div>
          <br />
          <br />
          <div id="1.1.w" class="page -break">
              <strong>Dział 1.1.w</strong> w tym w wyniku sprzeciwu od nakazu wydanego w elektronicznym postępowaniu upominawczym
              <table cellpadding="0" cellspacing="0" style="width: 100 %; ">
                  <tr>
                      <td class="center borderAll" colspan="3">Wyszczególnienie </td>
                      <td class="center borderAll">Liczby spraw</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="3">0</td>
                      <td class="center borderAll">1</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">Wpłynęło </td>
                      <td class="borderAll col_36">1</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.w!1!4')">
                          <asp:Label ID="tab_1_1_w_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">Załatwiono</td>
                      <td class="borderAll col_36">2</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.w!1!4')">
                          <asp:Label ID="tab_1_1_w_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="2">w tym </td>
                      <td class="borderAll wciecie">uwzględniono w całości lub w części</td>
                      <td class="borderAll col_36">3</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.w!1!4')">
                          <asp:Label ID="tab_1_1_w_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">oddalono</td>
                      <td class="borderAll col_36">4</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.w!1!4')">
                          <asp:Label ID="tab_1_1_w_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">pozostało</td>
                      <td class="borderAll col_36">5</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.w!1!4')">
                          <asp:Label ID="tab_1_1_w_w05_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
              </table>
          </div>
          <br />
          <div id="1.1.y" class="page -break">
              <strong>Dział 1.1.y</strong> . (dz. 1.1.1 w. 55, 56,155,156 i dz. 1.1.2 w. 39 i 40 lit. y) Liczba postępowań sądowych, których stronami są konsumenci (w rozumieniu art. 22<sup>1</sup> ustawy kodeks cywilny)<sup>1</sup> będący kredy-tobiorcami kredytów hipotecznych waloryzowanych/denominowanych/indeksowanych do walut obcych, oraz banki
              <table cellpadding="0" cellspacing="0" style="width: 100 %; ">
                  <tr>
                      <td class="center borderAll" colspan="4">Wyszczególnienie </td>
                      <td class="center borderAll">Liczby spraw</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="4">0</td>
                      <td class="center borderAll">1</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="3">Ogółem*</td>
                      <td class="borderAll col_36">1</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.y!1!4')">
                          <asp:Label ID="tab_1_1_y_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="3">w tym do franka szwajcarskiego (CHF)</td>
                      <td class="borderAll col_36">2</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.y!1!4')">
                          <asp:Label ID="tab_1_1_y_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="8">w tym</td>
                      <td class="borderAll wciecie" rowspan="8">przedmiot
                          <br />
                          postępowania o</td>
                      <td class="borderAll wciecie">zapłatę</td>
                      <td class="borderAll col_36">3</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.y!1!4')">
                          <asp:Label ID="tab_1_1_y_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">w tym do (CHF)</td>
                      <td class="borderAll col_36">4</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.y!1!4')">
                          <asp:Label ID="tab_1_1_y_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">ustalenie treści stosunku wiążącego strony</td>
                      <td class="borderAll col_36">5</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.y!1!4')">
                          <asp:Label ID="tab_1_1_y_w05_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">w tym do (CHF)</td>
                      <td class="borderAll col_36">6</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.y!1!4')">
                          <asp:Label ID="tab_1_1_y_w06_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">unieważnienie bankowego tytułu egzekucyjnego</td>
                      <td class="borderAll col_36">7</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.1.y!1!4')">
                          <asp:Label ID="tab_1_1_y_w07_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">w tym do (CHF)</td>
                      <td class="borderAll col_36">8</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.1.y!1!4')">
                          <asp:Label ID="tab_1_1_y_w08_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">inne</td>
                      <td class="borderAll col_36">9</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.1.y!1!4')">
                          <asp:Label ID="tab_1_1_y_w09_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">w tym do (CHF)</td>
                      <td class="borderAll col_36">10</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.1.y!1!4')">
                          <asp:Label ID="tab_1_1_y_w10_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2" rowspan="4">z tego (z w. 01) kredytobiorca jest</td>
                      <td class="borderAll wciecie">pozwanym</td>
                      <td class="borderAll col_36">11</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.1.y!1!4')">
                          <asp:Label ID="tab_1_1_y_w11_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">w tym kredyt w (CHF)</td>
                      <td class="borderAll col_36">12</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.1.y!1!4')">
                          <asp:Label ID="tab_1_1_y_w12_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">powodem</td>
                      <td class="borderAll col_36">13</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.1.y!1!4')">
                          <asp:Label ID="tab_1_1_y_w13_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">w tym kredyt w (CHF)</td>
                      <td class="borderAll col_36">14</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.1.y!1!4')">
                          <asp:Label ID="tab_1_1_y_w14_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="2">w tym</td>
                      <td class="borderAll wciecie" colspan="2">(z w. 01) pozwy złożone przez większą grupę osób (co najmniej 10)</td>
                      <td class="borderAll col_36">15</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.1.y!1!4')">
                          <asp:Label ID="tab_1_1_y_w15_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">w tym kredyt w (CHF)</td>
                      <td class="borderAll col_36">16</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.1.y!1!4')">
                          <asp:Label ID="tab_1_1_y_w16_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
              </table>
              1) Art. 221 ustawy kodeks cywilny [Pojęcie konsumenta] Za konsumenta uważa się osobę fizyczną dokonującą z przedsiębiorcą czynności prawnej niezwiązanej bezpośrednio z jej działalnością gospodarczą lub zawodową.
          </div>
          <br />

          <table style="width:100%;">
              <tr>
                  <td><strong>Dział 1.1.z</strong> w tym: - liczba zażaleń na postanowienie o udzielenie zabezpieczenia (art. 33) (dz. 1.1.1. w. 190, k.4)</td>
                  <td class="borderAll center col_90">
                       <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.1.1!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_z_w01_c01" runat="server" Text="0"></asp:Label></a>

                  </td>
              </tr>
          </table>
          <br />
          <div id='1.1.3' class="page -break" >
 <strong> Dział 1.1.3</strong>    . Skład orzekający w sprawach Ca<table cellpadding="0" cellspacing="0" style="width: 100 %; ">
 <tr>    <td  class="center borderAll" colspan="2" rowspan="3"> Wyszczególnienie </td>    <td class="center borderAll" rowspan="3"> Liczba zakończonych spraw Ca (rubr. 2+4)</td>
<td class="center borderAll" colspan="4">W tym liczba zakończonych spraw Ca w składzie</td>
</tr>
 <tr>    
<td class="center borderAll" colspan="2">3 sędziów</td>
<td class="center borderAll" colspan="2">1 sędziego</td>
</tr>
 <tr>    
<td class="center borderAll">ogółem </td>
<td class="center borderAll">w tym załatwionych przez sędziów SO</td>
<td class="center borderAll">ogółem </td>
<td class="center borderAll">w tym załatwionych przez sędziów SO</td>
</tr>
 <tr>    <td  class="center borderAll" colspan="2">0</td>    <td class="center borderAll">1</td>
<td class="center borderAll">2</td>
<td class="center borderAll">3</td>
<td class="center borderAll">4</td>
<td class="center borderAll">5</td>
</tr>
  <tr>
    <td  class="borderAll wciecie">Rep. Ca </td>
  <td  class="borderAll col_36">1</td>
    <td  class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.3!1!4')"><asp:Label CssClass="normal" ID="tab_1_1_3_w01_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.3!2!4')"><asp:Label CssClass="normal" ID="tab_1_1_3_w01_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.3!3!4')"><asp:Label CssClass="normal" ID="tab_1_1_3_w01_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.3!4!4')"><asp:Label CssClass="normal" ID="tab_1_1_3_w01_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_160 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.3!5!4')"><asp:Label CssClass="normal" ID="tab_1_1_3_w01_c05" runat="server" Text="0"></asp:Label></a></td>
  </tr>
    </table>
 </div>

          <br />
          <br />
          <div id="1.2.1" class="page -break">
              <strong>Dział 1.2.1</strong> Liczba sesji i wyznaczonych spraw
              <table cellpadding="0" cellspacing="0" style="width: 100 %; ">
                  <tr>
                      <td  class="center borderAll" colspan="3" rowspan="4"> SPRAWY
     <br />
     według repertoriów i wykazów</td>    <td  class="center borderAll" rowspan="4"> L.p.</td>    <td class="center borderAll" rowspan="4"> Liczba sesji (rozprawy i posiedzenia) - wokandy </td>
<td class="center borderAll" rowspan="4">Suma wyznaczonych spraw (suma kol. 4 i 22,) </td>
<td class="center borderAll" rowspan="4">Łączna liczba dni na które wyznaczono sesje-wokandy</td>
<td class="center borderAll" rowspan="4">Razem wyznaczonych na rozprawę sędziów (suma kol. 5,17, 21)</td>
<td class="center borderAll" colspan="17">Liczba wyznaczonych spraw na rozprawę, dotyczy:</td>
<td class="center borderAll" rowspan="4">Razem wyznaczonych na posiedzenie sędziów i referendarze (suma kol.23,35,39,40)</td>
<td class="center borderAll" colspan="18">Liczba wyznaczonych spraw na posiedzenia, dotyczy:</td>
                  </tr>
                  <tr>
<td class="center borderAll" colspan="12">Sędziowie SO</td>
<td class="center borderAll" rowspan="3">Razem wyznaczonych na rozprawę sędziowie SR (suma kol. 18,19,20)</td>
<td class="center borderAll" colspan="3">sędziowie SR</td>
<td class="center borderAll" rowspan="3">inni sędziowie</td>
<td class="center borderAll" colspan="12">sędziowie SO</td>
<td class="center borderAll" rowspan="3">Razem wyznaczonych na posiedzenie sędziowie SR (suma kol. 36,37,38)</td>
<td class="center borderAll" colspan="3" rowspan="2">sędziowie SR</td>
<td class="center borderAll" rowspan="3">inni sędziowie</td>
<td class="center borderAll" rowspan="3">referndarze</td>
                  </tr>
                  <tr>
<td class="center borderAll" rowspan="2">Razem wyznaczonych spraw na rozprawę sędziowie SO (suma kol.6,7,16)</td>
<td class="center borderAll" rowspan="2">sędziów SO z wyłączeniem sędziów funkcyjnych</td>
<td class="center borderAll" rowspan="2">sędziów funkcyjnych SO (suma kol. od 8 do 15)</td>
<td class="center borderAll" colspan="8">z tego</td>
<td class="center borderAll" rowspan="2">inni</td>
<td class="center borderAll" rowspan="2">sędziów SR delegowanych w trybie art. 77 §1 usp na czas nieokreślony lub na czas określony, orzekających w pełnym wymiarze </td>
<td class="center borderAll" rowspan="2">sędziów SR delegowanych w trybie art. 77 §1 usp na czas nieokreślony lub na czas określony, orzekających w niepełnym wymiarze</td>
<td class="center borderAll" rowspan="2">sędziów SR delegowanych w trybie art. 77 § 9 usp</td>
<td class="center borderAll" rowspan="2">Razem wyznaczonych spraw na posiedzenie sędziowie SO (suma kol.24,25,34) </td>
<td class="center borderAll" rowspan="2">sędziów SO z wyłączeniem sędziów funkcyjnych</td>
<td class="center borderAll" rowspan="2">sędziów funkcyjnych SO (suma kol. od 26 do 33)</td>
<td class="center borderAll" colspan="8">z tego</td>
<td class="center borderAll" rowspan="2">inni</td>
                  </tr>
                  <tr>
<td class="center borderAll">prezesa</td>
<td class="center borderAll">wiceprezesa </td>
<td class="center borderAll">przewodniczącego wydziału</td>
<td class="center borderAll">zastępcę przewodniczącego wydziału</td>
<td class="center borderAll">kierownika sekcji</td>
<td class="center borderAll">wizytatorów </td>
<td class="center borderAll">innych funkcyjnych tego sądu z tego pionu</td>
<td class="center borderAll">innych funkcyjnych tego sądu z innych pionów</td>
<td class="center borderAll">prezesa</td>
<td class="center borderAll">wiceprezesa </td>
<td class="center borderAll">przewodniczącego wydziału</td>
<td class="center borderAll">zastępcę przewodniczącego wydziału</td>
<td class="center borderAll">kierownika sekcji</td>
<td class="center borderAll">wizytatorów </td>
<td class="center borderAll">innych funkcyjnych tego sądu z tego pionu</td>
<td class="center borderAll">innych funkcyjnych tego sądu z innych pionów</td>
<td class="center borderAll">sędziów SR delegowanych w trybie art. 77 §1 usp na czas nieokreślony lub na czas określony, orzekających w pełnym wymiarze</td>
<td class="center borderAll">sędziów SR delegowanych w trybie art. 77 §1 usp na czas nieokreślony lub na czas określony, orzekających w niepełnym wymiarze </td>
<td class="center borderAll">sędziów SR delegowanych w trybie art. 77 § 9 usp</td>
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
                      <td class="center borderAll">27</td>
                      <td class="center borderAll">28</td>
                      <td class="center borderAll">29</td>
                      <td class="center borderAll">30</td>
                      <td class="center borderAll">31</td>
                      <td class="center borderAll">32</td>
                      <td class="center borderAll">33</td>
                      <td class="center borderAll">34</td>
                      <td class="center borderAll">35</td>
                      <td class="center borderAll">36</td>
                      <td class="center borderAll">37</td>
                      <td class="center borderAll">38</td>
                      <td class="center borderAll">39</td>
                      <td class="center borderAll">40</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">Ogółem sprawy cywilne (suma wierszy 02, 05, 06, 08 do 17)</td>
                      <td class="borderAll col_36">1</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!1!4')">
                          <asp:Label ID="tab_1_2_1_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!2!4')">
                          <asp:Label ID="tab_1_2_1_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!3!4')">
                          <asp:Label ID="tab_1_2_1_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!4!4')">
                          <asp:Label ID="tab_1_2_1_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!5!4')">
                          <asp:Label ID="tab_1_2_1_w01_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!6!4')">
                          <asp:Label ID="tab_1_2_1_w01_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!7!4')">
                          <asp:Label ID="tab_1_2_1_w01_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!8!4')">
                          <asp:Label ID="tab_1_2_1_w01_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!9!4')">
                          <asp:Label ID="tab_1_2_1_w01_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!10!4')">
                          <asp:Label ID="tab_1_2_1_w01_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!11!4')">
                          <asp:Label ID="tab_1_2_1_w01_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!12!4')">
                          <asp:Label ID="tab_1_2_1_w01_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!13!4')">
                          <asp:Label ID="tab_1_2_1_w01_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!14!4')">
                          <asp:Label ID="tab_1_2_1_w01_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!15!4')">
                          <asp:Label ID="tab_1_2_1_w01_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!16!4')">
                          <asp:Label ID="tab_1_2_1_w01_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!17!4')">
                          <asp:Label ID="tab_1_2_1_w01_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!18!4')">
                          <asp:Label ID="tab_1_2_1_w01_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!19!4')">
                          <asp:Label ID="tab_1_2_1_w01_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!20!4')">
                          <asp:Label ID="tab_1_2_1_w01_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!21!4')">
                          <asp:Label ID="tab_1_2_1_w01_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!22!4')">
                          <asp:Label ID="tab_1_2_1_w01_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!23!4')">
                          <asp:Label ID="tab_1_2_1_w01_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!24!4')">
                          <asp:Label ID="tab_1_2_1_w01_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!25!4')">
                          <asp:Label ID="tab_1_2_1_w01_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!26!4')">
                          <asp:Label ID="tab_1_2_1_w01_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!27!4')">
                          <asp:Label ID="tab_1_2_1_w01_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!28!4')">
                          <asp:Label ID="tab_1_2_1_w01_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!29!4')">
                          <asp:Label ID="tab_1_2_1_w01_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!30!4')">
                          <asp:Label ID="tab_1_2_1_w01_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!31!4')">
                          <asp:Label ID="tab_1_2_1_w01_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!32!4')">
                          <asp:Label ID="tab_1_2_1_w01_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!33!4')">
                          <asp:Label ID="tab_1_2_1_w01_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!34!4')">
                          <asp:Label ID="tab_1_2_1_w01_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!35!4')">
                          <asp:Label ID="tab_1_2_1_w01_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!36!4')">
                          <asp:Label ID="tab_1_2_1_w01_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!37!4')">
                          <asp:Label ID="tab_1_2_1_w01_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!38!4')">
                          <asp:Label ID="tab_1_2_1_w01_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!39!4')">
                          <asp:Label ID="tab_1_2_1_w01_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.1!40!4')">
                          <asp:Label ID="tab_1_2_1_w01_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">C</td>
                      <td class="borderAll col_36">2</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!1!4')">
                          <asp:Label ID="tab_1_2_1_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!2!4')">
                          <asp:Label ID="tab_1_2_1_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!3!4')">
                          <asp:Label ID="tab_1_2_1_w02_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!4!4')">
                          <asp:Label ID="tab_1_2_1_w02_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!5!4')">
                          <asp:Label ID="tab_1_2_1_w02_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!6!4')">
                          <asp:Label ID="tab_1_2_1_w02_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!7!4')">
                          <asp:Label ID="tab_1_2_1_w02_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!8!4')">
                          <asp:Label ID="tab_1_2_1_w02_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!9!4')">
                          <asp:Label ID="tab_1_2_1_w02_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!10!4')">
                          <asp:Label ID="tab_1_2_1_w02_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!11!4')">
                          <asp:Label ID="tab_1_2_1_w02_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!12!4')">
                          <asp:Label ID="tab_1_2_1_w02_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!13!4')">
                          <asp:Label ID="tab_1_2_1_w02_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!14!4')">
                          <asp:Label ID="tab_1_2_1_w02_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!15!4')">
                          <asp:Label ID="tab_1_2_1_w02_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!16!4')">
                          <asp:Label ID="tab_1_2_1_w02_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!17!4')">
                          <asp:Label ID="tab_1_2_1_w02_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!18!4')">
                          <asp:Label ID="tab_1_2_1_w02_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!19!4')">
                          <asp:Label ID="tab_1_2_1_w02_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!20!4')">
                          <asp:Label ID="tab_1_2_1_w02_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!21!4')">
                          <asp:Label ID="tab_1_2_1_w02_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!22!4')">
                          <asp:Label ID="tab_1_2_1_w02_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!23!4')">
                          <asp:Label ID="tab_1_2_1_w02_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!24!4')">
                          <asp:Label ID="tab_1_2_1_w02_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!25!4')">
                          <asp:Label ID="tab_1_2_1_w02_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!26!4')">
                          <asp:Label ID="tab_1_2_1_w02_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!27!4')">
                          <asp:Label ID="tab_1_2_1_w02_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!28!4')">
                          <asp:Label ID="tab_1_2_1_w02_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!29!4')">
                          <asp:Label ID="tab_1_2_1_w02_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!30!4')">
                          <asp:Label ID="tab_1_2_1_w02_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!31!4')">
                          <asp:Label ID="tab_1_2_1_w02_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!32!4')">
                          <asp:Label ID="tab_1_2_1_w02_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!33!4')">
                          <asp:Label ID="tab_1_2_1_w02_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!34!4')">
                          <asp:Label ID="tab_1_2_1_w02_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!35!4')">
                          <asp:Label ID="tab_1_2_1_w02_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!36!4')">
                          <asp:Label ID="tab_1_2_1_w02_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!37!4')">
                          <asp:Label ID="tab_1_2_1_w02_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!38!4')">
                          <asp:Label ID="tab_1_2_1_w02_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!39!4')">
                          <asp:Label ID="tab_1_2_1_w02_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.1!40!4')">
                          <asp:Label ID="tab_1_2_1_w02_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="2">w tym sprawy o</td>
                      <td class="borderAll wciecie">rozwód</td>
                      <td class="borderAll col_36">3</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!1!4')">
                          <asp:Label ID="tab_1_2_1_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!2!4')">
                          <asp:Label ID="tab_1_2_1_w03_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!3!4')">
                          <asp:Label ID="tab_1_2_1_w03_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!4!4')">
                          <asp:Label ID="tab_1_2_1_w03_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!5!4')">
                          <asp:Label ID="tab_1_2_1_w03_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!6!4')">
                          <asp:Label ID="tab_1_2_1_w03_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!7!4')">
                          <asp:Label ID="tab_1_2_1_w03_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!8!4')">
                          <asp:Label ID="tab_1_2_1_w03_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!9!4')">
                          <asp:Label ID="tab_1_2_1_w03_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!10!4')">
                          <asp:Label ID="tab_1_2_1_w03_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!11!4')">
                          <asp:Label ID="tab_1_2_1_w03_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!12!4')">
                          <asp:Label ID="tab_1_2_1_w03_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!13!4')">
                          <asp:Label ID="tab_1_2_1_w03_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!14!4')">
                          <asp:Label ID="tab_1_2_1_w03_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!15!4')">
                          <asp:Label ID="tab_1_2_1_w03_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!16!4')">
                          <asp:Label ID="tab_1_2_1_w03_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!17!4')">
                          <asp:Label ID="tab_1_2_1_w03_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!18!4')">
                          <asp:Label ID="tab_1_2_1_w03_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!19!4')">
                          <asp:Label ID="tab_1_2_1_w03_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!20!4')">
                          <asp:Label ID="tab_1_2_1_w03_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!21!4')">
                          <asp:Label ID="tab_1_2_1_w03_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!22!4')">
                          <asp:Label ID="tab_1_2_1_w03_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!23!4')">
                          <asp:Label ID="tab_1_2_1_w03_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!24!4')">
                          <asp:Label ID="tab_1_2_1_w03_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!25!4')">
                          <asp:Label ID="tab_1_2_1_w03_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!26!4')">
                          <asp:Label ID="tab_1_2_1_w03_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!27!4')">
                          <asp:Label ID="tab_1_2_1_w03_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!28!4')">
                          <asp:Label ID="tab_1_2_1_w03_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!29!4')">
                          <asp:Label ID="tab_1_2_1_w03_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!30!4')">
                          <asp:Label ID="tab_1_2_1_w03_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!31!4')">
                          <asp:Label ID="tab_1_2_1_w03_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!32!4')">
                          <asp:Label ID="tab_1_2_1_w03_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!33!4')">
                          <asp:Label ID="tab_1_2_1_w03_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!34!4')">
                          <asp:Label ID="tab_1_2_1_w03_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!35!4')">
                          <asp:Label ID="tab_1_2_1_w03_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!36!4')">
                          <asp:Label ID="tab_1_2_1_w03_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!37!4')">
                          <asp:Label ID="tab_1_2_1_w03_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!38!4')">
                          <asp:Label ID="tab_1_2_1_w03_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!39!4')">
                          <asp:Label ID="tab_1_2_1_w03_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.1!40!4')">
                          <asp:Label ID="tab_1_2_1_w03_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">separacęj</td>
                      <td class="borderAll col_36">4</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!1!4')">
                          <asp:Label ID="tab_1_2_1_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!2!4')">
                          <asp:Label ID="tab_1_2_1_w04_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!3!4')">
                          <asp:Label ID="tab_1_2_1_w04_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!4!4')">
                          <asp:Label ID="tab_1_2_1_w04_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!5!4')">
                          <asp:Label ID="tab_1_2_1_w04_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!6!4')">
                          <asp:Label ID="tab_1_2_1_w04_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!7!4')">
                          <asp:Label ID="tab_1_2_1_w04_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!8!4')">
                          <asp:Label ID="tab_1_2_1_w04_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!9!4')">
                          <asp:Label ID="tab_1_2_1_w04_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!10!4')">
                          <asp:Label ID="tab_1_2_1_w04_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!11!4')">
                          <asp:Label ID="tab_1_2_1_w04_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!12!4')">
                          <asp:Label ID="tab_1_2_1_w04_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!13!4')">
                          <asp:Label ID="tab_1_2_1_w04_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!14!4')">
                          <asp:Label ID="tab_1_2_1_w04_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!15!4')">
                          <asp:Label ID="tab_1_2_1_w04_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!16!4')">
                          <asp:Label ID="tab_1_2_1_w04_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!17!4')">
                          <asp:Label ID="tab_1_2_1_w04_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!18!4')">
                          <asp:Label ID="tab_1_2_1_w04_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!19!4')">
                          <asp:Label ID="tab_1_2_1_w04_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!20!4')">
                          <asp:Label ID="tab_1_2_1_w04_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!21!4')">
                          <asp:Label ID="tab_1_2_1_w04_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!22!4')">
                          <asp:Label ID="tab_1_2_1_w04_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!23!4')">
                          <asp:Label ID="tab_1_2_1_w04_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!24!4')">
                          <asp:Label ID="tab_1_2_1_w04_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!25!4')">
                          <asp:Label ID="tab_1_2_1_w04_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!26!4')">
                          <asp:Label ID="tab_1_2_1_w04_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!27!4')">
                          <asp:Label ID="tab_1_2_1_w04_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!28!4')">
                          <asp:Label ID="tab_1_2_1_w04_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!29!4')">
                          <asp:Label ID="tab_1_2_1_w04_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!30!4')">
                          <asp:Label ID="tab_1_2_1_w04_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!31!4')">
                          <asp:Label ID="tab_1_2_1_w04_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!32!4')">
                          <asp:Label ID="tab_1_2_1_w04_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!33!4')">
                          <asp:Label ID="tab_1_2_1_w04_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!34!4')">
                          <asp:Label ID="tab_1_2_1_w04_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!35!4')">
                          <asp:Label ID="tab_1_2_1_w04_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!36!4')">
                          <asp:Label ID="tab_1_2_1_w04_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!37!4')">
                          <asp:Label ID="tab_1_2_1_w04_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!38!4')">
                          <asp:Label ID="tab_1_2_1_w04_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!39!4')">
                          <asp:Label ID="tab_1_2_1_w04_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.1!40!4')">
                          <asp:Label ID="tab_1_2_1_w04_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">CG-G</td>
                      <td class="borderAll col_36">5</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!1!4')">
                          <asp:Label ID="tab_1_2_1_w05_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!2!4')">
                          <asp:Label ID="tab_1_2_1_w05_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!3!4')">
                          <asp:Label ID="tab_1_2_1_w05_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!4!4')">
                          <asp:Label ID="tab_1_2_1_w05_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!5!4')">
                          <asp:Label ID="tab_1_2_1_w05_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!6!4')">
                          <asp:Label ID="tab_1_2_1_w05_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!7!4')">
                          <asp:Label ID="tab_1_2_1_w05_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!8!4')">
                          <asp:Label ID="tab_1_2_1_w05_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!9!4')">
                          <asp:Label ID="tab_1_2_1_w05_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!10!4')">
                          <asp:Label ID="tab_1_2_1_w05_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!11!4')">
                          <asp:Label ID="tab_1_2_1_w05_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!12!4')">
                          <asp:Label ID="tab_1_2_1_w05_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!13!4')">
                          <asp:Label ID="tab_1_2_1_w05_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!14!4')">
                          <asp:Label ID="tab_1_2_1_w05_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!15!4')">
                          <asp:Label ID="tab_1_2_1_w05_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!16!4')">
                          <asp:Label ID="tab_1_2_1_w05_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!17!4')">
                          <asp:Label ID="tab_1_2_1_w05_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!18!4')">
                          <asp:Label ID="tab_1_2_1_w05_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!19!4')">
                          <asp:Label ID="tab_1_2_1_w05_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!20!4')">
                          <asp:Label ID="tab_1_2_1_w05_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!21!4')">
                          <asp:Label ID="tab_1_2_1_w05_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!22!4')">
                          <asp:Label ID="tab_1_2_1_w05_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!23!4')">
                          <asp:Label ID="tab_1_2_1_w05_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!24!4')">
                          <asp:Label ID="tab_1_2_1_w05_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!25!4')">
                          <asp:Label ID="tab_1_2_1_w05_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!26!4')">
                          <asp:Label ID="tab_1_2_1_w05_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!27!4')">
                          <asp:Label ID="tab_1_2_1_w05_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!28!4')">
                          <asp:Label ID="tab_1_2_1_w05_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!29!4')">
                          <asp:Label ID="tab_1_2_1_w05_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!30!4')">
                          <asp:Label ID="tab_1_2_1_w05_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!31!4')">
                          <asp:Label ID="tab_1_2_1_w05_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!32!4')">
                          <asp:Label ID="tab_1_2_1_w05_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!33!4')">
                          <asp:Label ID="tab_1_2_1_w05_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!34!4')">
                          <asp:Label ID="tab_1_2_1_w05_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!35!4')">
                          <asp:Label ID="tab_1_2_1_w05_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!36!4')">
                          <asp:Label ID="tab_1_2_1_w05_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!37!4')">
                          <asp:Label ID="tab_1_2_1_w05_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!38!4')">
                          <asp:Label ID="tab_1_2_1_w05_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!39!4')">
                          <asp:Label ID="tab_1_2_1_w05_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.1!40!4')">
                          <asp:Label ID="tab_1_2_1_w05_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">Ns z wył. rejestrowych </td>
                      <td class="borderAll col_36">6</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!1!4')">
                          <asp:Label ID="tab_1_2_1_w06_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!2!4')">
                          <asp:Label ID="tab_1_2_1_w06_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!3!4')">
                          <asp:Label ID="tab_1_2_1_w06_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!4!4')">
                          <asp:Label ID="tab_1_2_1_w06_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!5!4')">
                          <asp:Label ID="tab_1_2_1_w06_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!6!4')">
                          <asp:Label ID="tab_1_2_1_w06_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!7!4')">
                          <asp:Label ID="tab_1_2_1_w06_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!8!4')">
                          <asp:Label ID="tab_1_2_1_w06_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!9!4')">
                          <asp:Label ID="tab_1_2_1_w06_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!10!4')">
                          <asp:Label ID="tab_1_2_1_w06_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!11!4')">
                          <asp:Label ID="tab_1_2_1_w06_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!12!4')">
                          <asp:Label ID="tab_1_2_1_w06_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!13!4')">
                          <asp:Label ID="tab_1_2_1_w06_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!14!4')">
                          <asp:Label ID="tab_1_2_1_w06_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!15!4')">
                          <asp:Label ID="tab_1_2_1_w06_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!16!4')">
                          <asp:Label ID="tab_1_2_1_w06_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!17!4')">
                          <asp:Label ID="tab_1_2_1_w06_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!18!4')">
                          <asp:Label ID="tab_1_2_1_w06_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!19!4')">
                          <asp:Label ID="tab_1_2_1_w06_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!20!4')">
                          <asp:Label ID="tab_1_2_1_w06_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!21!4')">
                          <asp:Label ID="tab_1_2_1_w06_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!22!4')">
                          <asp:Label ID="tab_1_2_1_w06_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!23!4')">
                          <asp:Label ID="tab_1_2_1_w06_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!24!4')">
                          <asp:Label ID="tab_1_2_1_w06_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!25!4')">
                          <asp:Label ID="tab_1_2_1_w06_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!26!4')">
                          <asp:Label ID="tab_1_2_1_w06_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!27!4')">
                          <asp:Label ID="tab_1_2_1_w06_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!28!4')">
                          <asp:Label ID="tab_1_2_1_w06_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!29!4')">
                          <asp:Label ID="tab_1_2_1_w06_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!30!4')">
                          <asp:Label ID="tab_1_2_1_w06_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!31!4')">
                          <asp:Label ID="tab_1_2_1_w06_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!32!4')">
                          <asp:Label ID="tab_1_2_1_w06_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!33!4')">
                          <asp:Label ID="tab_1_2_1_w06_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!34!4')">
                          <asp:Label ID="tab_1_2_1_w06_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!35!4')">
                          <asp:Label ID="tab_1_2_1_w06_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!36!4')">
                          <asp:Label ID="tab_1_2_1_w06_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!37!4')">
                          <asp:Label ID="tab_1_2_1_w06_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!38!4')">
                          <asp:Label ID="tab_1_2_1_w06_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!39!4')">
                          <asp:Label ID="tab_1_2_1_w06_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.1!40!4')">
                          <asp:Label ID="tab_1_2_1_w06_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">W tym spraw o separację </td>
                      <td class="borderAll col_36">7</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!1!4')">
                          <asp:Label ID="tab_1_2_1_w07_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!2!4')">
                          <asp:Label ID="tab_1_2_1_w07_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!3!4')">
                          <asp:Label ID="tab_1_2_1_w07_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!4!4')">
                          <asp:Label ID="tab_1_2_1_w07_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!5!4')">
                          <asp:Label ID="tab_1_2_1_w07_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!6!4')">
                          <asp:Label ID="tab_1_2_1_w07_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!7!4')">
                          <asp:Label ID="tab_1_2_1_w07_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!8!4')">
                          <asp:Label ID="tab_1_2_1_w07_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!9!4')">
                          <asp:Label ID="tab_1_2_1_w07_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!10!4')">
                          <asp:Label ID="tab_1_2_1_w07_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!11!4')">
                          <asp:Label ID="tab_1_2_1_w07_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!12!4')">
                          <asp:Label ID="tab_1_2_1_w07_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!13!4')">
                          <asp:Label ID="tab_1_2_1_w07_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!14!4')">
                          <asp:Label ID="tab_1_2_1_w07_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!15!4')">
                          <asp:Label ID="tab_1_2_1_w07_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!16!4')">
                          <asp:Label ID="tab_1_2_1_w07_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!17!4')">
                          <asp:Label ID="tab_1_2_1_w07_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!18!4')">
                          <asp:Label ID="tab_1_2_1_w07_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!19!4')">
                          <asp:Label ID="tab_1_2_1_w07_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!20!4')">
                          <asp:Label ID="tab_1_2_1_w07_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!21!4')">
                          <asp:Label ID="tab_1_2_1_w07_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!22!4')">
                          <asp:Label ID="tab_1_2_1_w07_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!23!4')">
                          <asp:Label ID="tab_1_2_1_w07_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!24!4')">
                          <asp:Label ID="tab_1_2_1_w07_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!25!4')">
                          <asp:Label ID="tab_1_2_1_w07_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!26!4')">
                          <asp:Label ID="tab_1_2_1_w07_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!27!4')">
                          <asp:Label ID="tab_1_2_1_w07_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!28!4')">
                          <asp:Label ID="tab_1_2_1_w07_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!29!4')">
                          <asp:Label ID="tab_1_2_1_w07_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!30!4')">
                          <asp:Label ID="tab_1_2_1_w07_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!31!4')">
                          <asp:Label ID="tab_1_2_1_w07_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!32!4')">
                          <asp:Label ID="tab_1_2_1_w07_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!33!4')">
                          <asp:Label ID="tab_1_2_1_w07_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!34!4')">
                          <asp:Label ID="tab_1_2_1_w07_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!35!4')">
                          <asp:Label ID="tab_1_2_1_w07_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!36!4')">
                          <asp:Label ID="tab_1_2_1_w07_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!37!4')">
                          <asp:Label ID="tab_1_2_1_w07_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!38!4')">
                          <asp:Label ID="tab_1_2_1_w07_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!39!4')">
                          <asp:Label ID="tab_1_2_1_w07_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.1!40!4')">
                          <asp:Label ID="tab_1_2_1_w07_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">Ns rejestrowe </td>
                      <td class="borderAll col_36">8</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!1!4')">
                          <asp:Label ID="tab_1_2_1_w08_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!2!4')">
                          <asp:Label ID="tab_1_2_1_w08_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!3!4')">
                          <asp:Label ID="tab_1_2_1_w08_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!4!4')">
                          <asp:Label ID="tab_1_2_1_w08_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!5!4')">
                          <asp:Label ID="tab_1_2_1_w08_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!6!4')">
                          <asp:Label ID="tab_1_2_1_w08_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!7!4')">
                          <asp:Label ID="tab_1_2_1_w08_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!8!4')">
                          <asp:Label ID="tab_1_2_1_w08_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!9!4')">
                          <asp:Label ID="tab_1_2_1_w08_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!10!4')">
                          <asp:Label ID="tab_1_2_1_w08_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!11!4')">
                          <asp:Label ID="tab_1_2_1_w08_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!12!4')">
                          <asp:Label ID="tab_1_2_1_w08_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!13!4')">
                          <asp:Label ID="tab_1_2_1_w08_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!14!4')">
                          <asp:Label ID="tab_1_2_1_w08_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!15!4')">
                          <asp:Label ID="tab_1_2_1_w08_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!16!4')">
                          <asp:Label ID="tab_1_2_1_w08_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!17!4')">
                          <asp:Label ID="tab_1_2_1_w08_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!18!4')">
                          <asp:Label ID="tab_1_2_1_w08_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!19!4')">
                          <asp:Label ID="tab_1_2_1_w08_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!20!4')">
                          <asp:Label ID="tab_1_2_1_w08_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!21!4')">
                          <asp:Label ID="tab_1_2_1_w08_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!22!4')">
                          <asp:Label ID="tab_1_2_1_w08_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!23!4')">
                          <asp:Label ID="tab_1_2_1_w08_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!24!4')">
                          <asp:Label ID="tab_1_2_1_w08_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!25!4')">
                          <asp:Label ID="tab_1_2_1_w08_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!26!4')">
                          <asp:Label ID="tab_1_2_1_w08_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!27!4')">
                          <asp:Label ID="tab_1_2_1_w08_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!28!4')">
                          <asp:Label ID="tab_1_2_1_w08_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!29!4')">
                          <asp:Label ID="tab_1_2_1_w08_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!30!4')">
                          <asp:Label ID="tab_1_2_1_w08_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!31!4')">
                          <asp:Label ID="tab_1_2_1_w08_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!32!4')">
                          <asp:Label ID="tab_1_2_1_w08_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!33!4')">
                          <asp:Label ID="tab_1_2_1_w08_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!34!4')">
                          <asp:Label ID="tab_1_2_1_w08_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!35!4')">
                          <asp:Label ID="tab_1_2_1_w08_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!36!4')">
                          <asp:Label ID="tab_1_2_1_w08_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!37!4')">
                          <asp:Label ID="tab_1_2_1_w08_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!38!4')">
                          <asp:Label ID="tab_1_2_1_w08_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!39!4')">
                          <asp:Label ID="tab_1_2_1_w08_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.1!40!4')">
                          <asp:Label ID="tab_1_2_1_w08_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">Nc </td>
                      <td class="borderAll col_36">9</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!1!4')">
                          <asp:Label ID="tab_1_2_1_w09_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!2!4')">
                          <asp:Label ID="tab_1_2_1_w09_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!3!4')">
                          <asp:Label ID="tab_1_2_1_w09_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!4!4')">
                          <asp:Label ID="tab_1_2_1_w09_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!5!4')">
                          <asp:Label ID="tab_1_2_1_w09_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!6!4')">
                          <asp:Label ID="tab_1_2_1_w09_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!7!4')">
                          <asp:Label ID="tab_1_2_1_w09_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!8!4')">
                          <asp:Label ID="tab_1_2_1_w09_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!9!4')">
                          <asp:Label ID="tab_1_2_1_w09_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!10!4')">
                          <asp:Label ID="tab_1_2_1_w09_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!11!4')">
                          <asp:Label ID="tab_1_2_1_w09_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!12!4')">
                          <asp:Label ID="tab_1_2_1_w09_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!13!4')">
                          <asp:Label ID="tab_1_2_1_w09_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!14!4')">
                          <asp:Label ID="tab_1_2_1_w09_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!15!4')">
                          <asp:Label ID="tab_1_2_1_w09_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!16!4')">
                          <asp:Label ID="tab_1_2_1_w09_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!17!4')">
                          <asp:Label ID="tab_1_2_1_w09_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!18!4')">
                          <asp:Label ID="tab_1_2_1_w09_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!19!4')">
                          <asp:Label ID="tab_1_2_1_w09_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!20!4')">
                          <asp:Label ID="tab_1_2_1_w09_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!21!4')">
                          <asp:Label ID="tab_1_2_1_w09_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!22!4')">
                          <asp:Label ID="tab_1_2_1_w09_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!23!4')">
                          <asp:Label ID="tab_1_2_1_w09_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!24!4')">
                          <asp:Label ID="tab_1_2_1_w09_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!25!4')">
                          <asp:Label ID="tab_1_2_1_w09_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!26!4')">
                          <asp:Label ID="tab_1_2_1_w09_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!27!4')">
                          <asp:Label ID="tab_1_2_1_w09_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!28!4')">
                          <asp:Label ID="tab_1_2_1_w09_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!29!4')">
                          <asp:Label ID="tab_1_2_1_w09_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!30!4')">
                          <asp:Label ID="tab_1_2_1_w09_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!31!4')">
                          <asp:Label ID="tab_1_2_1_w09_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!32!4')">
                          <asp:Label ID="tab_1_2_1_w09_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!33!4')">
                          <asp:Label ID="tab_1_2_1_w09_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!34!4')">
                          <asp:Label ID="tab_1_2_1_w09_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!35!4')">
                          <asp:Label ID="tab_1_2_1_w09_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!36!4')">
                          <asp:Label ID="tab_1_2_1_w09_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!37!4')">
                          <asp:Label ID="tab_1_2_1_w09_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!38!4')">
                          <asp:Label ID="tab_1_2_1_w09_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!39!4')">
                          <asp:Label ID="tab_1_2_1_w09_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.1!40!4')">
                          <asp:Label ID="tab_1_2_1_w09_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">Co I instancja </td>
                      <td class="borderAll col_36">10</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!1!4')">
                          <asp:Label ID="tab_1_2_1_w10_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!2!4')">
                          <asp:Label ID="tab_1_2_1_w10_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!3!4')">
                          <asp:Label ID="tab_1_2_1_w10_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!4!4')">
                          <asp:Label ID="tab_1_2_1_w10_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!5!4')">
                          <asp:Label ID="tab_1_2_1_w10_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!6!4')">
                          <asp:Label ID="tab_1_2_1_w10_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!7!4')">
                          <asp:Label ID="tab_1_2_1_w10_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!8!4')">
                          <asp:Label ID="tab_1_2_1_w10_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!9!4')">
                          <asp:Label ID="tab_1_2_1_w10_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!10!4')">
                          <asp:Label ID="tab_1_2_1_w10_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!11!4')">
                          <asp:Label ID="tab_1_2_1_w10_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!12!4')">
                          <asp:Label ID="tab_1_2_1_w10_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!13!4')">
                          <asp:Label ID="tab_1_2_1_w10_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!14!4')">
                          <asp:Label ID="tab_1_2_1_w10_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!15!4')">
                          <asp:Label ID="tab_1_2_1_w10_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!16!4')">
                          <asp:Label ID="tab_1_2_1_w10_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!17!4')">
                          <asp:Label ID="tab_1_2_1_w10_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!18!4')">
                          <asp:Label ID="tab_1_2_1_w10_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!19!4')">
                          <asp:Label ID="tab_1_2_1_w10_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!20!4')">
                          <asp:Label ID="tab_1_2_1_w10_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!21!4')">
                          <asp:Label ID="tab_1_2_1_w10_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!22!4')">
                          <asp:Label ID="tab_1_2_1_w10_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!23!4')">
                          <asp:Label ID="tab_1_2_1_w10_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!24!4')">
                          <asp:Label ID="tab_1_2_1_w10_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!25!4')">
                          <asp:Label ID="tab_1_2_1_w10_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!26!4')">
                          <asp:Label ID="tab_1_2_1_w10_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!27!4')">
                          <asp:Label ID="tab_1_2_1_w10_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!28!4')">
                          <asp:Label ID="tab_1_2_1_w10_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!29!4')">
                          <asp:Label ID="tab_1_2_1_w10_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!30!4')">
                          <asp:Label ID="tab_1_2_1_w10_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!31!4')">
                          <asp:Label ID="tab_1_2_1_w10_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!32!4')">
                          <asp:Label ID="tab_1_2_1_w10_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!33!4')">
                          <asp:Label ID="tab_1_2_1_w10_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!34!4')">
                          <asp:Label ID="tab_1_2_1_w10_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!35!4')">
                          <asp:Label ID="tab_1_2_1_w10_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!36!4')">
                          <asp:Label ID="tab_1_2_1_w10_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!37!4')">
                          <asp:Label ID="tab_1_2_1_w10_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!38!4')">
                          <asp:Label ID="tab_1_2_1_w10_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!39!4')">
                          <asp:Label ID="tab_1_2_1_w10_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.1!40!4')">
                          <asp:Label ID="tab_1_2_1_w10_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">Co II&nbsp; instancja </td>
                      <td class="borderAll col_36">11</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.1!1!4')">
                          <asp:Label ID="tab_1_2_1_w11_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.1!2!4')">
                          <asp:Label ID="tab_1_2_1_w11_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.1!3!4')">
                          <asp:Label ID="tab_1_2_1_w11_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.1!4!4')">
                          <asp:Label ID="tab_1_2_1_w11_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.1!5!4')">
                          <asp:Label ID="tab_1_2_1_w11_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.1!6!4')">
                          <asp:Label ID="tab_1_2_1_w11_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.1!7!4')">
                          <asp:Label ID="tab_1_2_1_w11_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.1!8!4')">
                          <asp:Label ID="tab_1_2_1_w11_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.1!9!4')">
                          <asp:Label ID="tab_1_2_1_w11_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.1!10!4')">
                          <asp:Label ID="tab_1_2_1_w11_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.1!11!4')">
                          <asp:Label ID="tab_1_2_1_w11_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.1!12!4')">
                          <asp:Label ID="tab_1_2_1_w11_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.1!13!4')">
                          <asp:Label ID="tab_1_2_1_w11_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.1!14!4')">
                          <asp:Label ID="tab_1_2_1_w11_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.1!15!4')">
                          <asp:Label ID="tab_1_2_1_w11_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.1!16!4')">
                          <asp:Label ID="tab_1_2_1_w11_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.1!17!4')">
                          <asp:Label ID="tab_1_2_1_w11_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.1!18!4')">
                          <asp:Label ID="tab_1_2_1_w11_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.1!19!4')">
                          <asp:Label ID="tab_1_2_1_w11_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.1!20!4')">
                          <asp:Label ID="tab_1_2_1_w11_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.1!21!4')">
                          <asp:Label ID="tab_1_2_1_w11_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.1!22!4')">
                          <asp:Label ID="tab_1_2_1_w11_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.1!23!4')">
                          <asp:Label ID="tab_1_2_1_w11_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.1!24!4')">
                          <asp:Label ID="tab_1_2_1_w11_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.1!25!4')">
                          <asp:Label ID="tab_1_2_1_w11_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.1!26!4')">
                          <asp:Label ID="tab_1_2_1_w11_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.1!27!4')">
                          <asp:Label ID="tab_1_2_1_w11_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.1!28!4')">
                          <asp:Label ID="tab_1_2_1_w11_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.1!29!4')">
                          <asp:Label ID="tab_1_2_1_w11_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.1!30!4')">
                          <asp:Label ID="tab_1_2_1_w11_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.1!31!4')">
                          <asp:Label ID="tab_1_2_1_w11_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.1!32!4')">
                          <asp:Label ID="tab_1_2_1_w11_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.1!33!4')">
                          <asp:Label ID="tab_1_2_1_w11_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.1!34!4')">
                          <asp:Label ID="tab_1_2_1_w11_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.1!35!4')">
                          <asp:Label ID="tab_1_2_1_w11_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.1!36!4')">
                          <asp:Label ID="tab_1_2_1_w11_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.1!37!4')">
                          <asp:Label ID="tab_1_2_1_w11_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.1!38!4')">
                          <asp:Label ID="tab_1_2_1_w11_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.1!39!4')">
                          <asp:Label ID="tab_1_2_1_w11_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.1!40!4')">
                          <asp:Label ID="tab_1_2_1_w11_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">Ca</td>
                      <td class="borderAll col_36">12</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.1!1!4')">
                          <asp:Label ID="tab_1_2_1_w12_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.1!2!4')">
                          <asp:Label ID="tab_1_2_1_w12_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.1!3!4')">
                          <asp:Label ID="tab_1_2_1_w12_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.1!4!4')">
                          <asp:Label ID="tab_1_2_1_w12_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.1!5!4')">
                          <asp:Label ID="tab_1_2_1_w12_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.1!6!4')">
                          <asp:Label ID="tab_1_2_1_w12_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.1!7!4')">
                          <asp:Label ID="tab_1_2_1_w12_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.1!8!4')">
                          <asp:Label ID="tab_1_2_1_w12_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.1!9!4')">
                          <asp:Label ID="tab_1_2_1_w12_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.1!10!4')">
                          <asp:Label ID="tab_1_2_1_w12_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.1!11!4')">
                          <asp:Label ID="tab_1_2_1_w12_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.1!12!4')">
                          <asp:Label ID="tab_1_2_1_w12_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.1!13!4')">
                          <asp:Label ID="tab_1_2_1_w12_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.1!14!4')">
                          <asp:Label ID="tab_1_2_1_w12_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.1!15!4')">
                          <asp:Label ID="tab_1_2_1_w12_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.1!16!4')">
                          <asp:Label ID="tab_1_2_1_w12_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.1!17!4')">
                          <asp:Label ID="tab_1_2_1_w12_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.1!18!4')">
                          <asp:Label ID="tab_1_2_1_w12_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.1!19!4')">
                          <asp:Label ID="tab_1_2_1_w12_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.1!20!4')">
                          <asp:Label ID="tab_1_2_1_w12_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.1!21!4')">
                          <asp:Label ID="tab_1_2_1_w12_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.1!22!4')">
                          <asp:Label ID="tab_1_2_1_w12_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.1!23!4')">
                          <asp:Label ID="tab_1_2_1_w12_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.1!24!4')">
                          <asp:Label ID="tab_1_2_1_w12_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.1!25!4')">
                          <asp:Label ID="tab_1_2_1_w12_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.1!26!4')">
                          <asp:Label ID="tab_1_2_1_w12_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.1!27!4')">
                          <asp:Label ID="tab_1_2_1_w12_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.1!28!4')">
                          <asp:Label ID="tab_1_2_1_w12_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.1!29!4')">
                          <asp:Label ID="tab_1_2_1_w12_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.1!30!4')">
                          <asp:Label ID="tab_1_2_1_w12_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.1!31!4')">
                          <asp:Label ID="tab_1_2_1_w12_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.1!32!4')">
                          <asp:Label ID="tab_1_2_1_w12_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.1!33!4')">
                          <asp:Label ID="tab_1_2_1_w12_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.1!34!4')">
                          <asp:Label ID="tab_1_2_1_w12_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.1!35!4')">
                          <asp:Label ID="tab_1_2_1_w12_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.1!36!4')">
                          <asp:Label ID="tab_1_2_1_w12_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.1!37!4')">
                          <asp:Label ID="tab_1_2_1_w12_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.1!38!4')">
                          <asp:Label ID="tab_1_2_1_w12_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.1!39!4')">
                          <asp:Label ID="tab_1_2_1_w12_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.1!40!4')">
                          <asp:Label ID="tab_1_2_1_w12_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">Cz</td>
                      <td class="borderAll col_36">13</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.1!1!4')">
                          <asp:Label ID="tab_1_2_1_w13_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.1!2!4')">
                          <asp:Label ID="tab_1_2_1_w13_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.1!3!4')">
                          <asp:Label ID="tab_1_2_1_w13_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.1!4!4')">
                          <asp:Label ID="tab_1_2_1_w13_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.1!5!4')">
                          <asp:Label ID="tab_1_2_1_w13_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.1!6!4')">
                          <asp:Label ID="tab_1_2_1_w13_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.1!7!4')">
                          <asp:Label ID="tab_1_2_1_w13_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.1!8!4')">
                          <asp:Label ID="tab_1_2_1_w13_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.1!9!4')">
                          <asp:Label ID="tab_1_2_1_w13_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.1!10!4')">
                          <asp:Label ID="tab_1_2_1_w13_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.1!11!4')">
                          <asp:Label ID="tab_1_2_1_w13_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.1!12!4')">
                          <asp:Label ID="tab_1_2_1_w13_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.1!13!4')">
                          <asp:Label ID="tab_1_2_1_w13_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.1!14!4')">
                          <asp:Label ID="tab_1_2_1_w13_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.1!15!4')">
                          <asp:Label ID="tab_1_2_1_w13_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.1!16!4')">
                          <asp:Label ID="tab_1_2_1_w13_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.1!17!4')">
                          <asp:Label ID="tab_1_2_1_w13_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.1!18!4')">
                          <asp:Label ID="tab_1_2_1_w13_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.1!19!4')">
                          <asp:Label ID="tab_1_2_1_w13_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.1!20!4')">
                          <asp:Label ID="tab_1_2_1_w13_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.1!21!4')">
                          <asp:Label ID="tab_1_2_1_w13_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.1!22!4')">
                          <asp:Label ID="tab_1_2_1_w13_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.1!23!4')">
                          <asp:Label ID="tab_1_2_1_w13_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.1!24!4')">
                          <asp:Label ID="tab_1_2_1_w13_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.1!25!4')">
                          <asp:Label ID="tab_1_2_1_w13_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.1!26!4')">
                          <asp:Label ID="tab_1_2_1_w13_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.1!27!4')">
                          <asp:Label ID="tab_1_2_1_w13_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.1!28!4')">
                          <asp:Label ID="tab_1_2_1_w13_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.1!29!4')">
                          <asp:Label ID="tab_1_2_1_w13_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.1!30!4')">
                          <asp:Label ID="tab_1_2_1_w13_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.1!31!4')">
                          <asp:Label ID="tab_1_2_1_w13_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.1!32!4')">
                          <asp:Label ID="tab_1_2_1_w13_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.1!33!4')">
                          <asp:Label ID="tab_1_2_1_w13_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.1!34!4')">
                          <asp:Label ID="tab_1_2_1_w13_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.1!35!4')">
                          <asp:Label ID="tab_1_2_1_w13_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.1!36!4')">
                          <asp:Label ID="tab_1_2_1_w13_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.1!37!4')">
                          <asp:Label ID="tab_1_2_1_w13_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.1!38!4')">
                          <asp:Label ID="tab_1_2_1_w13_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.1!39!4')">
                          <asp:Label ID="tab_1_2_1_w13_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.1!40!4')">
                          <asp:Label ID="tab_1_2_1_w13_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">WSC (skarga kasacyjna)</td>
                      <td class="borderAll col_36">14</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.1!1!4')">
                          <asp:Label ID="tab_1_2_1_w14_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.1!2!4')">
                          <asp:Label ID="tab_1_2_1_w14_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.1!3!4')">
                          <asp:Label ID="tab_1_2_1_w14_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.1!4!4')">
                          <asp:Label ID="tab_1_2_1_w14_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.1!5!4')">
                          <asp:Label ID="tab_1_2_1_w14_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.1!6!4')">
                          <asp:Label ID="tab_1_2_1_w14_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.1!7!4')">
                          <asp:Label ID="tab_1_2_1_w14_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.1!8!4')">
                          <asp:Label ID="tab_1_2_1_w14_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.1!9!4')">
                          <asp:Label ID="tab_1_2_1_w14_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.1!10!4')">
                          <asp:Label ID="tab_1_2_1_w14_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.1!11!4')">
                          <asp:Label ID="tab_1_2_1_w14_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.1!12!4')">
                          <asp:Label ID="tab_1_2_1_w14_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.1!13!4')">
                          <asp:Label ID="tab_1_2_1_w14_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.1!14!4')">
                          <asp:Label ID="tab_1_2_1_w14_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.1!15!4')">
                          <asp:Label ID="tab_1_2_1_w14_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.1!16!4')">
                          <asp:Label ID="tab_1_2_1_w14_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.1!17!4')">
                          <asp:Label ID="tab_1_2_1_w14_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.1!18!4')">
                          <asp:Label ID="tab_1_2_1_w14_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.1!19!4')">
                          <asp:Label ID="tab_1_2_1_w14_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.1!20!4')">
                          <asp:Label ID="tab_1_2_1_w14_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.1!21!4')">
                          <asp:Label ID="tab_1_2_1_w14_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.1!22!4')">
                          <asp:Label ID="tab_1_2_1_w14_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.1!23!4')">
                          <asp:Label ID="tab_1_2_1_w14_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.1!24!4')">
                          <asp:Label ID="tab_1_2_1_w14_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.1!25!4')">
                          <asp:Label ID="tab_1_2_1_w14_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.1!26!4')">
                          <asp:Label ID="tab_1_2_1_w14_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.1!27!4')">
                          <asp:Label ID="tab_1_2_1_w14_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.1!28!4')">
                          <asp:Label ID="tab_1_2_1_w14_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.1!29!4')">
                          <asp:Label ID="tab_1_2_1_w14_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.1!30!4')">
                          <asp:Label ID="tab_1_2_1_w14_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.1!31!4')">
                          <asp:Label ID="tab_1_2_1_w14_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.1!32!4')">
                          <asp:Label ID="tab_1_2_1_w14_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.1!33!4')">
                          <asp:Label ID="tab_1_2_1_w14_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.1!34!4')">
                          <asp:Label ID="tab_1_2_1_w14_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.1!35!4')">
                          <asp:Label ID="tab_1_2_1_w14_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.1!36!4')">
                          <asp:Label ID="tab_1_2_1_w14_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.1!37!4')">
                          <asp:Label ID="tab_1_2_1_w14_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.1!38!4')">
                          <asp:Label ID="tab_1_2_1_w14_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.1!39!4')">
                          <asp:Label ID="tab_1_2_1_w14_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.1!40!4')">
                          <asp:Label ID="tab_1_2_1_w14_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">WSC (skarga o stwierdzenie niezgodności z prawem) – I instancja </td>
                      <td class="borderAll col_36">15</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.1!1!4')">
                          <asp:Label ID="tab_1_2_1_w15_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.1!2!4')">
                          <asp:Label ID="tab_1_2_1_w15_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.1!3!4')">
                          <asp:Label ID="tab_1_2_1_w15_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.1!4!4')">
                          <asp:Label ID="tab_1_2_1_w15_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.1!5!4')">
                          <asp:Label ID="tab_1_2_1_w15_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.1!6!4')">
                          <asp:Label ID="tab_1_2_1_w15_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.1!7!4')">
                          <asp:Label ID="tab_1_2_1_w15_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.1!8!4')">
                          <asp:Label ID="tab_1_2_1_w15_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.1!9!4')">
                          <asp:Label ID="tab_1_2_1_w15_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.1!10!4')">
                          <asp:Label ID="tab_1_2_1_w15_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.1!11!4')">
                          <asp:Label ID="tab_1_2_1_w15_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.1!12!4')">
                          <asp:Label ID="tab_1_2_1_w15_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.1!13!4')">
                          <asp:Label ID="tab_1_2_1_w15_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.1!14!4')">
                          <asp:Label ID="tab_1_2_1_w15_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.1!15!4')">
                          <asp:Label ID="tab_1_2_1_w15_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.1!16!4')">
                          <asp:Label ID="tab_1_2_1_w15_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.1!17!4')">
                          <asp:Label ID="tab_1_2_1_w15_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.1!18!4')">
                          <asp:Label ID="tab_1_2_1_w15_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.1!19!4')">
                          <asp:Label ID="tab_1_2_1_w15_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.1!20!4')">
                          <asp:Label ID="tab_1_2_1_w15_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.1!21!4')">
                          <asp:Label ID="tab_1_2_1_w15_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.1!22!4')">
                          <asp:Label ID="tab_1_2_1_w15_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.1!23!4')">
                          <asp:Label ID="tab_1_2_1_w15_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.1!24!4')">
                          <asp:Label ID="tab_1_2_1_w15_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.1!25!4')">
                          <asp:Label ID="tab_1_2_1_w15_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.1!26!4')">
                          <asp:Label ID="tab_1_2_1_w15_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.1!27!4')">
                          <asp:Label ID="tab_1_2_1_w15_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.1!28!4')">
                          <asp:Label ID="tab_1_2_1_w15_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.1!29!4')">
                          <asp:Label ID="tab_1_2_1_w15_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.1!30!4')">
                          <asp:Label ID="tab_1_2_1_w15_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.1!31!4')">
                          <asp:Label ID="tab_1_2_1_w15_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.1!32!4')">
                          <asp:Label ID="tab_1_2_1_w15_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.1!33!4')">
                          <asp:Label ID="tab_1_2_1_w15_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.1!34!4')">
                          <asp:Label ID="tab_1_2_1_w15_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.1!35!4')">
                          <asp:Label ID="tab_1_2_1_w15_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.1!36!4')">
                          <asp:Label ID="tab_1_2_1_w15_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.1!37!4')">
                          <asp:Label ID="tab_1_2_1_w15_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.1!38!4')">
                          <asp:Label ID="tab_1_2_1_w15_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.1!39!4')">
                          <asp:Label ID="tab_1_2_1_w15_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.1!40!4')">
                          <asp:Label ID="tab_1_2_1_w15_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">WSC (skarga o stwierdzenie niezgodności z prawem) – II instancja </td>
                      <td class="borderAll col_36">16</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.1!1!4')">
                          <asp:Label ID="tab_1_2_1_w16_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.1!2!4')">
                          <asp:Label ID="tab_1_2_1_w16_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.1!3!4')">
                          <asp:Label ID="tab_1_2_1_w16_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.1!4!4')">
                          <asp:Label ID="tab_1_2_1_w16_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.1!5!4')">
                          <asp:Label ID="tab_1_2_1_w16_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.1!6!4')">
                          <asp:Label ID="tab_1_2_1_w16_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.1!7!4')">
                          <asp:Label ID="tab_1_2_1_w16_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.1!8!4')">
                          <asp:Label ID="tab_1_2_1_w16_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.1!9!4')">
                          <asp:Label ID="tab_1_2_1_w16_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.1!10!4')">
                          <asp:Label ID="tab_1_2_1_w16_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.1!11!4')">
                          <asp:Label ID="tab_1_2_1_w16_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.1!12!4')">
                          <asp:Label ID="tab_1_2_1_w16_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.1!13!4')">
                          <asp:Label ID="tab_1_2_1_w16_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.1!14!4')">
                          <asp:Label ID="tab_1_2_1_w16_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.1!15!4')">
                          <asp:Label ID="tab_1_2_1_w16_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.1!16!4')">
                          <asp:Label ID="tab_1_2_1_w16_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.1!17!4')">
                          <asp:Label ID="tab_1_2_1_w16_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.1!18!4')">
                          <asp:Label ID="tab_1_2_1_w16_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.1!19!4')">
                          <asp:Label ID="tab_1_2_1_w16_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.1!20!4')">
                          <asp:Label ID="tab_1_2_1_w16_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.1!21!4')">
                          <asp:Label ID="tab_1_2_1_w16_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.1!22!4')">
                          <asp:Label ID="tab_1_2_1_w16_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.1!23!4')">
                          <asp:Label ID="tab_1_2_1_w16_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.1!24!4')">
                          <asp:Label ID="tab_1_2_1_w16_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.1!25!4')">
                          <asp:Label ID="tab_1_2_1_w16_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.1!26!4')">
                          <asp:Label ID="tab_1_2_1_w16_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.1!27!4')">
                          <asp:Label ID="tab_1_2_1_w16_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.1!28!4')">
                          <asp:Label ID="tab_1_2_1_w16_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.1!29!4')">
                          <asp:Label ID="tab_1_2_1_w16_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.1!30!4')">
                          <asp:Label ID="tab_1_2_1_w16_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.1!31!4')">
                          <asp:Label ID="tab_1_2_1_w16_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.1!32!4')">
                          <asp:Label ID="tab_1_2_1_w16_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.1!33!4')">
                          <asp:Label ID="tab_1_2_1_w16_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.1!34!4')">
                          <asp:Label ID="tab_1_2_1_w16_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.1!35!4')">
                          <asp:Label ID="tab_1_2_1_w16_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.1!36!4')">
                          <asp:Label ID="tab_1_2_1_w16_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.1!37!4')">
                          <asp:Label ID="tab_1_2_1_w16_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.1!38!4')">
                          <asp:Label ID="tab_1_2_1_w16_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.1!39!4')">
                          <asp:Label ID="tab_1_2_1_w16_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.1!40!4')">
                          <asp:Label ID="tab_1_2_1_w16_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">Skarga na postępowanie sądowe Wykaz S* </td>
                      <td class="borderAll col_36">17</td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.1!1!4')">
                          <asp:Label ID="tab_1_2_1_w17_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.1!2!4')">
                          <asp:Label ID="tab_1_2_1_w17_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.1!3!4')">
                          <asp:Label ID="tab_1_2_1_w17_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.1!4!4')">
                          <asp:Label ID="tab_1_2_1_w17_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.1!5!4')">
                          <asp:Label ID="tab_1_2_1_w17_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.1!6!4')">
                          <asp:Label ID="tab_1_2_1_w17_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.1!7!4')">
                          <asp:Label ID="tab_1_2_1_w17_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.1!8!4')">
                          <asp:Label ID="tab_1_2_1_w17_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.1!9!4')">
                          <asp:Label ID="tab_1_2_1_w17_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.1!10!4')">
                          <asp:Label ID="tab_1_2_1_w17_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.1!11!4')">
                          <asp:Label ID="tab_1_2_1_w17_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.1!12!4')">
                          <asp:Label ID="tab_1_2_1_w17_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.1!13!4')">
                          <asp:Label ID="tab_1_2_1_w17_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.1!14!4')">
                          <asp:Label ID="tab_1_2_1_w17_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.1!15!4')">
                          <asp:Label ID="tab_1_2_1_w17_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.1!16!4')">
                          <asp:Label ID="tab_1_2_1_w17_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.1!17!4')">
                          <asp:Label ID="tab_1_2_1_w17_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.1!18!4')">
                          <asp:Label ID="tab_1_2_1_w17_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.1!19!4')">
                          <asp:Label ID="tab_1_2_1_w17_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.1!20!4')">
                          <asp:Label ID="tab_1_2_1_w17_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.1!21!4')">
                          <asp:Label ID="tab_1_2_1_w17_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.1!22!4')">
                          <asp:Label ID="tab_1_2_1_w17_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.1!23!4')">
                          <asp:Label ID="tab_1_2_1_w17_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.1!24!4')">
                          <asp:Label ID="tab_1_2_1_w17_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.1!25!4')">
                          <asp:Label ID="tab_1_2_1_w17_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.1!26!4')">
                          <asp:Label ID="tab_1_2_1_w17_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.1!27!4')">
                          <asp:Label ID="tab_1_2_1_w17_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.1!28!4')">
                          <asp:Label ID="tab_1_2_1_w17_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.1!29!4')">
                          <asp:Label ID="tab_1_2_1_w17_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.1!30!4')">
                          <asp:Label ID="tab_1_2_1_w17_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.1!31!4')">
                          <asp:Label ID="tab_1_2_1_w17_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.1!32!4')">
                          <asp:Label ID="tab_1_2_1_w17_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.1!33!4')">
                          <asp:Label ID="tab_1_2_1_w17_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.1!34!4')">
                          <asp:Label ID="tab_1_2_1_w17_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.1!35!4')">
                          <asp:Label ID="tab_1_2_1_w17_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.1!36!4')">
                          <asp:Label ID="tab_1_2_1_w17_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.1!37!4')">
                          <asp:Label ID="tab_1_2_1_w17_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.1!38!4')">
                          <asp:Label ID="tab_1_2_1_w17_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.1!39!4')">
                          <asp:Label ID="tab_1_2_1_w17_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_110 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.1!40!4')">
                          <asp:Label ID="tab_1_2_1_w17_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
              </table>
          </div>
          <br />
             <div id="1.2.2" class="page -break">
              <strong>Dział 1.2.2</strong> Liczba odbytych sesji i załatwionych spraw
              <table cellpadding="0" cellspacing="0" style="width: 100 %; ">
                  <tr>
                      <td  class="center borderAll" colspan="5" rowspan="4"> SPRAWY
     <br />
     według repertoriów i wykazów</td>    <td  class="center borderAll" rowspan="4"> L.p.</td>    <td class="center borderAll" rowspan="4"> Liczba sesji (rozprawy i posiedzenia) - wokandy </td>
<td class="center borderAll" rowspan="4">Suma wyznaczonych spraw (suma kol. 4 i 22,) </td>
<td class="center borderAll" rowspan="4">Łączna liczba dni na które wyznaczono sesje-wokandy</td>
<td class="center borderAll" rowspan="4">Razem wyznaczonych na rozprawę sędziów (suma kol. 5,17, 21)</td>
<td class="center borderAll" colspan="17">Liczba wyznaczonych spraw na rozprawę, dotyczy:</td>
<td class="center borderAll" rowspan="4">Razem wyznaczonych na posiedzenie sędziów i referendarze (suma kol.23,35,39,40)</td>
<td class="center borderAll" colspan="18">Liczba wyznaczonych spraw na posiedzenia, dotyczy:</td>
                  </tr>
                  <tr>
<td class="center borderAll" colspan="12">Sędziowie SO</td>
<td class="center borderAll" rowspan="3">Razem wyznaczonych na rozprawę sędziowie SR (suma kol. 18,19,20)</td>
<td class="center borderAll" colspan="3">sędziowie SR</td>
<td class="center borderAll" rowspan="3">inni sędziowie</td>
<td class="center borderAll" colspan="12">sędziowie SO</td>
<td class="center borderAll" rowspan="3">Razem wyznaczonych na posiedzenie sędziowie SR (suma kol. 36,37,38)</td>
<td class="center borderAll" colspan="3" rowspan="2">sędziowie SR</td>
<td class="center borderAll" rowspan="3">inni sędziowie</td>
<td class="center borderAll" rowspan="3">referndarze</td>
                  </tr>
                  <tr>
<td class="center borderAll" rowspan="2">Razem wyznaczonych spraw na rozprawę sędziowie SO (suma kol.6,7,16)</td>
<td class="center borderAll" rowspan="2">sędziów SO z wyłączeniem sędziów funkcyjnych</td>
<td class="center borderAll" rowspan="2">sędziów funkcyjnych SO (suma kol. od 8 do 15)</td>
<td class="center borderAll" colspan="8">z tego</td>
<td class="center borderAll" rowspan="2">inni</td>
<td class="center borderAll" rowspan="2">sędziów SR delegowanych w trybie art. 77 §1 usp na czas nieokreślony lub na czas określony, orzekających w pełnym wymiarze </td>
<td class="center borderAll" rowspan="2">sędziów SR delegowanych w trybie art. 77 §1 usp na czas nieokreślony lub na czas określony, orzekających w niepełnym wymiarze</td>
<td class="center borderAll" rowspan="2">sędziów SR delegowanych w trybie art. 77 § 9 usp</td>
<td class="center borderAll" rowspan="2">Razem wyznaczonych spraw na posiedzenie sędziowie SO (suma kol.24,25,34) </td>
<td class="center borderAll" rowspan="2">sędziów SO z wyłączeniem sędziów funkcyjnych</td>
<td class="center borderAll" rowspan="2">sędziów funkcyjnych SO (suma kol. od 26 do 33)</td>
<td class="center borderAll" colspan="8">z tego</td>
<td class="center borderAll" rowspan="2">inni</td>
                  </tr>
                  <tr>
<td class="center borderAll">prezesa</td>
<td class="center borderAll">wice-prezesa </td>
<td class="center borderAll">przewod-niczącego wydziału</td>
<td class="center borderAll">zastępcę przewodniczącego wydziału</td>
<td class="center borderAll">kierownika sekcji</td>
<td class="center borderAll">wizytatorów </td>
<td class="center borderAll">innych funkcyjnych tego sądu z tego pionu</td>
<td class="center borderAll">innych funkcyjnych tego sądu z innych pionów</td>
<td class="center borderAll">prezesa</td>
<td class="center borderAll">wiceprezesa </td>
<td class="center borderAll">przewodniczącego wydziału</td>
<td class="center borderAll">zastępcę przewodniczącego wydziału</td>
<td class="center borderAll">kierownika sekcji</td>
<td class="center borderAll">wizytatorów </td>
<td class="center borderAll">innych funkcyjnych tego sądu z tego pionu</td>
<td class="center borderAll">innych funkcyjnych tego sądu z innych pionów</td>
<td class="center borderAll">sędziów SR delegowanych w trybie art. 77 §1 usp na czas nieokreślony lub na czas określony, orzekających w pełnym wymiarze</td>
<td class="center borderAll">sędziów SR delegowanych w trybie art. 77 §1 usp na czas nieokreślony lub na czas określony, orzekających w niepełnym wymiarze </td>
<td class="center borderAll">sędziów SR delegowanych w trybie art. 77 § 9 usp</td>
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
                      <td class="center borderAll">29</td>
                      <td class="center borderAll">30</td>
                      <td class="center borderAll">31</td>
                      <td class="center borderAll">32</td>
                      <td class="center borderAll">33</td>
                      <td class="center borderAll">34</td>
                      <td class="center borderAll">35</td>
                      <td class="center borderAll">36</td>
                      <td class="center borderAll">37</td>
                      <td class="center borderAll">38</td>
                      <td class="center borderAll">39</td>
                      <td class="center borderAll">40</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="3">Ogółem sprawy cywilne (suma wierszy 02, 25, 26, 28 do 37)</td>
                      <td class="borderAll col_36">1</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w01_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w01_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w01_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w01_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w01_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w01_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w01_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w01_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w01_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w01_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w01_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w01_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w01_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w01_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w01_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w01_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w01_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w01_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w01_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w01_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w01_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w01_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!27!4')">
                          <asp:Label ID="tab_1_2_2_w01_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!28!4')">
                          <asp:Label ID="tab_1_2_2_w01_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!29!4')">
                          <asp:Label ID="tab_1_2_2_w01_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!30!4')">
                          <asp:Label ID="tab_1_2_2_w01_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!31!4')">
                          <asp:Label ID="tab_1_2_2_w01_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!32!4')">
                          <asp:Label ID="tab_1_2_2_w01_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!33!4')">
                          <asp:Label ID="tab_1_2_2_w01_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!34!4')">
                          <asp:Label ID="tab_1_2_2_w01_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!35!4')">
                          <asp:Label ID="tab_1_2_2_w01_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!36!4')">
                          <asp:Label ID="tab_1_2_2_w01_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!37!4')">
                          <asp:Label ID="tab_1_2_2_w01_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!38!4')">
                          <asp:Label ID="tab_1_2_2_w01_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!39!4')">
                          <asp:Label ID="tab_1_2_2_w01_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.2!40!4')">
                          <asp:Label ID="tab_1_2_2_w01_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="3">C</td>
                      <td class="borderAll col_36">2</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w02_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w02_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w02_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w02_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w02_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w02_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w02_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w02_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w02_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w02_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w02_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w02_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w02_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w02_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w02_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w02_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w02_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w02_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w02_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w02_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w02_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w02_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w02_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w02_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!27!4')">
                          <asp:Label ID="tab_1_2_2_w02_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!28!4')">
                          <asp:Label ID="tab_1_2_2_w02_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!29!4')">
                          <asp:Label ID="tab_1_2_2_w02_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!30!4')">
                          <asp:Label ID="tab_1_2_2_w02_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!31!4')">
                          <asp:Label ID="tab_1_2_2_w02_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!32!4')">
                          <asp:Label ID="tab_1_2_2_w02_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!33!4')">
                          <asp:Label ID="tab_1_2_2_w02_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!34!4')">
                          <asp:Label ID="tab_1_2_2_w02_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!35!4')">
                          <asp:Label ID="tab_1_2_2_w02_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!36!4')">
                          <asp:Label ID="tab_1_2_2_w02_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!37!4')">
                          <asp:Label ID="tab_1_2_2_w02_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!38!4')">
                          <asp:Label ID="tab_1_2_2_w02_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!39!4')">
                          <asp:Label ID="tab_1_2_2_w02_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.2!40!4')">
                          <asp:Label ID="tab_1_2_2_w02_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2" rowspan="2">w tym spraw o</td>
                      <td class="borderAll wciecie">rozwód</td>
                      <td class="borderAll col_36">3</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w03_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w03_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w03_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w03_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w03_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w03_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w03_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w03_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w03_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w03_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w03_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w03_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w03_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w03_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w03_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w03_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w03_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w03_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w03_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w03_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w03_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w03_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w03_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w03_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w03_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!27!4')">
                          <asp:Label ID="tab_1_2_2_w03_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!28!4')">
                          <asp:Label ID="tab_1_2_2_w03_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!29!4')">
                          <asp:Label ID="tab_1_2_2_w03_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!30!4')">
                          <asp:Label ID="tab_1_2_2_w03_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!31!4')">
                          <asp:Label ID="tab_1_2_2_w03_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!32!4')">
                          <asp:Label ID="tab_1_2_2_w03_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!33!4')">
                          <asp:Label ID="tab_1_2_2_w03_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!34!4')">
                          <asp:Label ID="tab_1_2_2_w03_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!35!4')">
                          <asp:Label ID="tab_1_2_2_w03_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!36!4')">
                          <asp:Label ID="tab_1_2_2_w03_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!37!4')">
                          <asp:Label ID="tab_1_2_2_w03_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!38!4')">
                          <asp:Label ID="tab_1_2_2_w03_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!39!4')">
                          <asp:Label ID="tab_1_2_2_w03_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.2!40!4')">
                          <asp:Label ID="tab_1_2_2_w03_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">separację</td>
                      <td class="borderAll col_36">4</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w04_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w04_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w04_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w04_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w04_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w04_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w04_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w04_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w04_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w04_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w04_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w04_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w04_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w04_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w04_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w04_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w04_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w04_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w04_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w04_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w04_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w04_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w04_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w04_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w04_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!27!4')">
                          <asp:Label ID="tab_1_2_2_w04_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!28!4')">
                          <asp:Label ID="tab_1_2_2_w04_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!29!4')">
                          <asp:Label ID="tab_1_2_2_w04_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!30!4')">
                          <asp:Label ID="tab_1_2_2_w04_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!31!4')">
                          <asp:Label ID="tab_1_2_2_w04_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!32!4')">
                          <asp:Label ID="tab_1_2_2_w04_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!33!4')">
                          <asp:Label ID="tab_1_2_2_w04_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!34!4')">
                          <asp:Label ID="tab_1_2_2_w04_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!35!4')">
                          <asp:Label ID="tab_1_2_2_w04_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!36!4')">
                          <asp:Label ID="tab_1_2_2_w04_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!37!4')">
                          <asp:Label ID="tab_1_2_2_w04_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!38!4')">
                          <asp:Label ID="tab_1_2_2_w04_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!39!4')">
                          <asp:Label ID="tab_1_2_2_w04_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.2!40!4')">
                          <asp:Label ID="tab_1_2_2_w04_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="20"></td>
                      <td class="borderAll wciecie" colspan="2">zwrot pozwu </td>
                      <td class="borderAll col_36">5</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w05_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w05_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w05_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w05_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w05_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w05_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w05_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w05_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w05_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w05_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w05_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w05_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w05_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w05_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w05_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w05_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w05_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w05_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w05_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w05_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w05_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w05_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w05_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w05_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w05_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w05_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!27!4')">
                          <asp:Label ID="tab_1_2_2_w05_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!28!4')">
                          <asp:Label ID="tab_1_2_2_w05_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!29!4')">
                          <asp:Label ID="tab_1_2_2_w05_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!30!4')">
                          <asp:Label ID="tab_1_2_2_w05_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!31!4')">
                          <asp:Label ID="tab_1_2_2_w05_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!32!4')">
                          <asp:Label ID="tab_1_2_2_w05_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!33!4')">
                          <asp:Label ID="tab_1_2_2_w05_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!34!4')">
                          <asp:Label ID="tab_1_2_2_w05_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!35!4')">
                          <asp:Label ID="tab_1_2_2_w05_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!36!4')">
                          <asp:Label ID="tab_1_2_2_w05_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!37!4')">
                          <asp:Label ID="tab_1_2_2_w05_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!38!4')">
                          <asp:Label ID="tab_1_2_2_w05_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!39!4')">
                          <asp:Label ID="tab_1_2_2_w05_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.2!40!4')">
                          <asp:Label ID="tab_1_2_2_w05_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                       <td class="borderAll wciecie" colspan="2">przekazanie do innych jednostek na podstawie art. 200§1 kpc (z wyjątkiem zmian organizacyjnych)</td>
                      <td class="borderAll col_36">6</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w06_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w06_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w06_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w06_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w06_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w06_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w06_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w06_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w06_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w06_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w06_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w06_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w06_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w06_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w06_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w06_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w06_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w06_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w06_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w06_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w06_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w06_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w06_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w06_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w06_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w06_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!27!4')">
                          <asp:Label ID="tab_1_2_2_w06_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!28!4')">
                          <asp:Label ID="tab_1_2_2_w06_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!29!4')">
                          <asp:Label ID="tab_1_2_2_w06_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!30!4')">
                          <asp:Label ID="tab_1_2_2_w06_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!31!4')">
                          <asp:Label ID="tab_1_2_2_w06_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!32!4')">
                          <asp:Label ID="tab_1_2_2_w06_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!33!4')">
                          <asp:Label ID="tab_1_2_2_w06_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!34!4')">
                          <asp:Label ID="tab_1_2_2_w06_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!35!4')">
                          <asp:Label ID="tab_1_2_2_w06_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!36!4')">
                          <asp:Label ID="tab_1_2_2_w06_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!37!4')">
                          <asp:Label ID="tab_1_2_2_w06_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!38!4')">
                          <asp:Label ID="tab_1_2_2_w06_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!39!4')">
                          <asp:Label ID="tab_1_2_2_w06_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.2!40!4')">
                          <asp:Label ID="tab_1_2_2_w06_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                       <td class="borderAll wciecie" colspan="2">zakończono w trybie art. 339 kpc</td>
                      <td class="borderAll col_36">7</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w07_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w07_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w07_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w07_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w07_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w07_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w07_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w07_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w07_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w07_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w07_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w07_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w07_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w07_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w07_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w07_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w07_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w07_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w07_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w07_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w07_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w07_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w07_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w07_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w07_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w07_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!27!4')">
                          <asp:Label ID="tab_1_2_2_w07_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!28!4')">
                          <asp:Label ID="tab_1_2_2_w07_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!29!4')">
                          <asp:Label ID="tab_1_2_2_w07_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!30!4')">
                          <asp:Label ID="tab_1_2_2_w07_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!31!4')">
                          <asp:Label ID="tab_1_2_2_w07_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!32!4')">
                          <asp:Label ID="tab_1_2_2_w07_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!33!4')">
                          <asp:Label ID="tab_1_2_2_w07_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!34!4')">
                          <asp:Label ID="tab_1_2_2_w07_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!35!4')">
                          <asp:Label ID="tab_1_2_2_w07_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!36!4')">
                          <asp:Label ID="tab_1_2_2_w07_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!37!4')">
                          <asp:Label ID="tab_1_2_2_w07_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!38!4')">
                          <asp:Label ID="tab_1_2_2_w07_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!39!4')">
                          <asp:Label ID="tab_1_2_2_w07_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.2!40!4')">
                          <asp:Label ID="tab_1_2_2_w07_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">w wyniku zmian zarządzenia MS o biurowości</td>
                      <td class="borderAll col_36">8</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w08_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w08_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w08_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w08_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w08_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w08_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w08_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w08_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w08_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w08_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w08_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w08_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w08_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w08_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w08_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w08_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w08_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w08_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w08_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w08_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w08_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w08_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w08_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w08_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w08_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w08_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!27!4')">
                          <asp:Label ID="tab_1_2_2_w08_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!28!4')">
                          <asp:Label ID="tab_1_2_2_w08_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!29!4')">
                          <asp:Label ID="tab_1_2_2_w08_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!30!4')">
                          <asp:Label ID="tab_1_2_2_w08_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!31!4')">
                          <asp:Label ID="tab_1_2_2_w08_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!32!4')">
                          <asp:Label ID="tab_1_2_2_w08_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!33!4')">
                          <asp:Label ID="tab_1_2_2_w08_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!34!4')">
                          <asp:Label ID="tab_1_2_2_w08_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!35!4')">
                          <asp:Label ID="tab_1_2_2_w08_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!36!4')">
                          <asp:Label ID="tab_1_2_2_w08_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!37!4')">
                          <asp:Label ID="tab_1_2_2_w08_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!38!4')">
                          <asp:Label ID="tab_1_2_2_w08_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!39!4')">
                          <asp:Label ID="tab_1_2_2_w08_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.2!40!4')">
                          <asp:Label ID="tab_1_2_2_w08_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                       <td class="borderAll wciecie" colspan="2">w wyniku przekazania sprawy w ramach sądu pomiędzy wydziałami tego samego pionu</td>
                      <td class="borderAll col_36">9</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w09_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w09_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w09_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w09_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w09_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w09_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w09_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w09_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w09_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w09_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w09_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w09_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w09_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w09_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w09_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w09_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w09_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w09_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w09_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w09_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w09_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w09_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w09_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w09_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w09_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w09_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!27!4')">
                          <asp:Label ID="tab_1_2_2_w09_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!28!4')">
                          <asp:Label ID="tab_1_2_2_w09_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!29!4')">
                          <asp:Label ID="tab_1_2_2_w09_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!30!4')">
                          <asp:Label ID="tab_1_2_2_w09_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!31!4')">
                          <asp:Label ID="tab_1_2_2_w09_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!32!4')">
                          <asp:Label ID="tab_1_2_2_w09_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!33!4')">
                          <asp:Label ID="tab_1_2_2_w09_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!34!4')">
                          <asp:Label ID="tab_1_2_2_w09_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!35!4')">
                          <asp:Label ID="tab_1_2_2_w09_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!36!4')">
                          <asp:Label ID="tab_1_2_2_w09_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!37!4')">
                          <asp:Label ID="tab_1_2_2_w09_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!38!4')">
                          <asp:Label ID="tab_1_2_2_w09_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!39!4')">
                          <asp:Label ID="tab_1_2_2_w09_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.2!40!4')">
                          <asp:Label ID="tab_1_2_2_w09_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                        <td class="borderAll wciecie" colspan="2">w wyniku przekazania sprawy w ramach sądu pomiędzy wydziałami różnych pionów</td>
                      <td class="borderAll col_36">10</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w10_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w10_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w10_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w10_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w10_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w10_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w10_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w10_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w10_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w10_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w10_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w10_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w10_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w10_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w10_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w10_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w10_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w10_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w10_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w10_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w10_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w10_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w10_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w10_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w10_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w10_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!27!4')">
                          <asp:Label ID="tab_1_2_2_w10_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!28!4')">
                          <asp:Label ID="tab_1_2_2_w10_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!29!4')">
                          <asp:Label ID="tab_1_2_2_w10_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!30!4')">
                          <asp:Label ID="tab_1_2_2_w10_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!31!4')">
                          <asp:Label ID="tab_1_2_2_w10_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!32!4')">
                          <asp:Label ID="tab_1_2_2_w10_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!33!4')">
                          <asp:Label ID="tab_1_2_2_w10_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!34!4')">
                          <asp:Label ID="tab_1_2_2_w10_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!35!4')">
                          <asp:Label ID="tab_1_2_2_w10_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!36!4')">
                          <asp:Label ID="tab_1_2_2_w10_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!37!4')">
                          <asp:Label ID="tab_1_2_2_w10_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!38!4')">
                          <asp:Label ID="tab_1_2_2_w10_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!39!4')">
                          <asp:Label ID="tab_1_2_2_w10_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.2!40!4')">
                          <asp:Label ID="tab_1_2_2_w10_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="2">zmiany organizacyjne związane z utworzeniem lub likwidacją</td>
                      <td class="borderAll wciecie">wydziału(łów)</td>
                      <td class="borderAll col_36">11</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w11_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w11_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w11_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w11_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w11_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w11_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w11_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w11_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w11_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w11_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w11_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w11_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w11_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w11_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w11_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w11_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w11_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w11_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w11_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w11_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w11_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w11_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w11_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w11_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w11_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w11_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!27!4')">
                          <asp:Label ID="tab_1_2_2_w11_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!28!4')">
                          <asp:Label ID="tab_1_2_2_w11_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!29!4')">
                          <asp:Label ID="tab_1_2_2_w11_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!30!4')">
                          <asp:Label ID="tab_1_2_2_w11_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!31!4')">
                          <asp:Label ID="tab_1_2_2_w11_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!32!4')">
                          <asp:Label ID="tab_1_2_2_w11_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!33!4')">
                          <asp:Label ID="tab_1_2_2_w11_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!34!4')">
                          <asp:Label ID="tab_1_2_2_w11_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!35!4')">
                          <asp:Label ID="tab_1_2_2_w11_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!36!4')">
                          <asp:Label ID="tab_1_2_2_w11_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!37!4')">
                          <asp:Label ID="tab_1_2_2_w11_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!38!4')">
                          <asp:Label ID="tab_1_2_2_w11_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!39!4')">
                          <asp:Label ID="tab_1_2_2_w11_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.2!40!4')">
                          <asp:Label ID="tab_1_2_2_w11_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">sądu(dów)</td>
                      <td class="borderAll col_36">12</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w12_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w12_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w12_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w12_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w12_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w12_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w12_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w12_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w12_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w12_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w12_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w12_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w12_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w12_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w12_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w12_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w12_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w12_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w12_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w12_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w12_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w12_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w12_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w12_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w12_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w12_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!27!4')">
                          <asp:Label ID="tab_1_2_2_w12_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!28!4')">
                          <asp:Label ID="tab_1_2_2_w12_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!29!4')">
                          <asp:Label ID="tab_1_2_2_w12_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!30!4')">
                          <asp:Label ID="tab_1_2_2_w12_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!31!4')">
                          <asp:Label ID="tab_1_2_2_w12_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!32!4')">
                          <asp:Label ID="tab_1_2_2_w12_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!33!4')">
                          <asp:Label ID="tab_1_2_2_w12_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!34!4')">
                          <asp:Label ID="tab_1_2_2_w12_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!35!4')">
                          <asp:Label ID="tab_1_2_2_w12_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!36!4')">
                          <asp:Label ID="tab_1_2_2_w12_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!37!4')">
                          <asp:Label ID="tab_1_2_2_w12_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!38!4')">
                          <asp:Label ID="tab_1_2_2_w12_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!39!4')">
                          <asp:Label ID="tab_1_2_2_w12_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.2!40!4')">
                          <asp:Label ID="tab_1_2_2_w12_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="2">w wyniku zmiany obszaru właściwości miejscowej</td>
                      <td class="borderAll wciecie">wydziału(łów)</td>
                      <td class="borderAll col_36">13</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w13_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w13_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w13_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w13_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w13_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w13_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w13_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w13_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w13_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w13_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w13_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w13_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w13_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w13_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w13_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w13_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w13_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w13_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w13_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w13_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w13_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w13_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w13_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w13_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w13_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w13_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!27!4')">
                          <asp:Label ID="tab_1_2_2_w13_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!28!4')">
                          <asp:Label ID="tab_1_2_2_w13_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!29!4')">
                          <asp:Label ID="tab_1_2_2_w13_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!30!4')">
                          <asp:Label ID="tab_1_2_2_w13_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!31!4')">
                          <asp:Label ID="tab_1_2_2_w13_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!32!4')">
                          <asp:Label ID="tab_1_2_2_w13_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!33!4')">
                          <asp:Label ID="tab_1_2_2_w13_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!34!4')">
                          <asp:Label ID="tab_1_2_2_w13_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!35!4')">
                          <asp:Label ID="tab_1_2_2_w13_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!36!4')">
                          <asp:Label ID="tab_1_2_2_w13_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!37!4')">
                          <asp:Label ID="tab_1_2_2_w13_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!38!4')">
                          <asp:Label ID="tab_1_2_2_w13_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!39!4')">
                          <asp:Label ID="tab_1_2_2_w13_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.2!40!4')">
                          <asp:Label ID="tab_1_2_2_w13_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">sądu(dów)</td>
                      <td class="borderAll col_36">14</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w14_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w14_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w14_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w14_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w14_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w14_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w14_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w14_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w14_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w14_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w14_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w14_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w14_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w14_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w14_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w14_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w14_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w14_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w14_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w14_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w14_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w14_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w14_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w14_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w14_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w14_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!27!4')">
                          <asp:Label ID="tab_1_2_2_w14_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!28!4')">
                          <asp:Label ID="tab_1_2_2_w14_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!29!4')">
                          <asp:Label ID="tab_1_2_2_w14_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!30!4')">
                          <asp:Label ID="tab_1_2_2_w14_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!31!4')">
                          <asp:Label ID="tab_1_2_2_w14_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!32!4')">
                          <asp:Label ID="tab_1_2_2_w14_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!33!4')">
                          <asp:Label ID="tab_1_2_2_w14_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!34!4')">
                          <asp:Label ID="tab_1_2_2_w14_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!35!4')">
                          <asp:Label ID="tab_1_2_2_w14_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!36!4')">
                          <asp:Label ID="tab_1_2_2_w14_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!37!4')">
                          <asp:Label ID="tab_1_2_2_w14_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!38!4')">
                          <asp:Label ID="tab_1_2_2_w14_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!39!4')">
                          <asp:Label ID="tab_1_2_2_w14_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.2!40!4')">
                          <asp:Label ID="tab_1_2_2_w14_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">połączono do łącznego rozpoznania na podstawie art. 219 kpc</td>
                      <td class="borderAll col_36">15</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w15_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w15_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w15_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w15_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w15_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w15_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w15_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w15_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w15_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w15_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w15_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w15_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w15_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w15_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w15_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w15_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w15_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w15_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w15_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w15_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w15_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w15_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w15_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w15_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w15_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w15_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!27!4')">
                          <asp:Label ID="tab_1_2_2_w15_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!28!4')">
                          <asp:Label ID="tab_1_2_2_w15_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!29!4')">
                          <asp:Label ID="tab_1_2_2_w15_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!30!4')">
                          <asp:Label ID="tab_1_2_2_w15_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!31!4')">
                          <asp:Label ID="tab_1_2_2_w15_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!32!4')">
                          <asp:Label ID="tab_1_2_2_w15_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!33!4')">
                          <asp:Label ID="tab_1_2_2_w15_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!34!4')">
                          <asp:Label ID="tab_1_2_2_w15_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!35!4')">
                          <asp:Label ID="tab_1_2_2_w15_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!36!4')">
                          <asp:Label ID="tab_1_2_2_w15_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!37!4')">
                          <asp:Label ID="tab_1_2_2_w15_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!38!4')">
                          <asp:Label ID="tab_1_2_2_w15_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!39!4')">
                          <asp:Label ID="tab_1_2_2_w15_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.2!40!4')">
                          <asp:Label ID="tab_1_2_2_w15_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">zakreślone w wyniku zmiany trybu lub rodzaju postępowania (art. 201 § 1 i 2 kpc)</td>
                      <td class="borderAll col_36">16</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w16_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w16_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w16_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w16_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w16_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w16_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w16_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w16_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w16_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w16_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w16_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w16_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w16_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w16_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w16_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w16_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w16_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w16_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w16_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w16_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w16_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w16_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w16_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w16_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w16_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w16_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!27!4')">
                          <asp:Label ID="tab_1_2_2_w16_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!28!4')">
                          <asp:Label ID="tab_1_2_2_w16_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!29!4')">
                          <asp:Label ID="tab_1_2_2_w16_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!30!4')">
                          <asp:Label ID="tab_1_2_2_w16_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!31!4')">
                          <asp:Label ID="tab_1_2_2_w16_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!32!4')">
                          <asp:Label ID="tab_1_2_2_w16_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!33!4')">
                          <asp:Label ID="tab_1_2_2_w16_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!34!4')">
                          <asp:Label ID="tab_1_2_2_w16_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!35!4')">
                          <asp:Label ID="tab_1_2_2_w16_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!36!4')">
                          <asp:Label ID="tab_1_2_2_w16_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!37!4')">
                          <asp:Label ID="tab_1_2_2_w16_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!38!4')">
                          <asp:Label ID="tab_1_2_2_w16_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!39!4')">
                          <asp:Label ID="tab_1_2_2_w16_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.2!40!4')">
                          <asp:Label ID="tab_1_2_2_w16_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">zakreślone w wyniku zmiany trybu lub rodzaju postępowania (art. 201 § 1 i 2 kpc)</td>
                      <td class="borderAll col_36">17</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w17_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w17_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w17_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w17_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w17_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w17_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w17_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w17_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w17_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w17_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w17_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w17_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w17_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w17_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w17_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w17_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w17_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w17_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w17_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w17_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w17_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w17_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w17_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w17_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w17_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w17_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!27!4')">
                          <asp:Label ID="tab_1_2_2_w17_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!28!4')">
                          <asp:Label ID="tab_1_2_2_w17_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!29!4')">
                          <asp:Label ID="tab_1_2_2_w17_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!30!4')">
                          <asp:Label ID="tab_1_2_2_w17_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!31!4')">
                          <asp:Label ID="tab_1_2_2_w17_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!32!4')">
                          <asp:Label ID="tab_1_2_2_w17_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!33!4')">
                          <asp:Label ID="tab_1_2_2_w17_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!34!4')">
                          <asp:Label ID="tab_1_2_2_w17_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!35!4')">
                          <asp:Label ID="tab_1_2_2_w17_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!36!4')">
                          <asp:Label ID="tab_1_2_2_w17_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!37!4')">
                          <asp:Label ID="tab_1_2_2_w17_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!38!4')">
                          <asp:Label ID="tab_1_2_2_w17_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!39!4')">
                          <asp:Label ID="tab_1_2_2_w17_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.2!40!4')">
                          <asp:Label ID="tab_1_2_2_w17_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="2">zakreślono na podstawie art. 174 §1 </td>
                      <td class="borderAll wciecie">pkt 1 kpc</td>
                      <td class="borderAll col_36">18</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w18_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w18_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w18_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w18_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w18_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w18_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w18_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w18_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w18_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w18_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w18_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w18_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w18_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w18_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w18_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w18_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w18_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w18_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w18_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w18_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w18_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w18_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w18_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w18_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w18_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w18_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!27!4')">
                          <asp:Label ID="tab_1_2_2_w18_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!28!4')">
                          <asp:Label ID="tab_1_2_2_w18_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!29!4')">
                          <asp:Label ID="tab_1_2_2_w18_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!30!4')">
                          <asp:Label ID="tab_1_2_2_w18_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!31!4')">
                          <asp:Label ID="tab_1_2_2_w18_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!32!4')">
                          <asp:Label ID="tab_1_2_2_w18_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!33!4')">
                          <asp:Label ID="tab_1_2_2_w18_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!34!4')">
                          <asp:Label ID="tab_1_2_2_w18_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!35!4')">
                          <asp:Label ID="tab_1_2_2_w18_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!36!4')">
                          <asp:Label ID="tab_1_2_2_w18_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!37!4')">
                          <asp:Label ID="tab_1_2_2_w18_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!38!4')">
                          <asp:Label ID="tab_1_2_2_w18_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!39!4')">
                          <asp:Label ID="tab_1_2_2_w18_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.2!40!4')">
                          <asp:Label ID="tab_1_2_2_w18_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">pkt 4 kpc</td>
                      <td class="borderAll col_36">19</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w19_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w19_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w19_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w19_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w19_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w19_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w19_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w19_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w19_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w19_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w19_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w19_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w19_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w19_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w19_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w19_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w19_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w19_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w19_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w19_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w19_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w19_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w19_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w19_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w19_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w19_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!27!4')">
                          <asp:Label ID="tab_1_2_2_w19_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!28!4')">
                          <asp:Label ID="tab_1_2_2_w19_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!29!4')">
                          <asp:Label ID="tab_1_2_2_w19_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!30!4')">
                          <asp:Label ID="tab_1_2_2_w19_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!31!4')">
                          <asp:Label ID="tab_1_2_2_w19_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!32!4')">
                          <asp:Label ID="tab_1_2_2_w19_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!33!4')">
                          <asp:Label ID="tab_1_2_2_w19_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!34!4')">
                          <asp:Label ID="tab_1_2_2_w19_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!35!4')">
                          <asp:Label ID="tab_1_2_2_w19_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!36!4')">
                          <asp:Label ID="tab_1_2_2_w19_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!37!4')">
                          <asp:Label ID="tab_1_2_2_w19_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!38!4')">
                          <asp:Label ID="tab_1_2_2_w19_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!39!4')">
                          <asp:Label ID="tab_1_2_2_w19_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.2!40!4')">
                          <asp:Label ID="tab_1_2_2_w19_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                     <td class="borderAll wciecie" colspan="2">zakreślenie omyłkowych wpisów</td>
                      <td class="borderAll col_36">20</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w20_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w20_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w20_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w20_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w20_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w20_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w20_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w20_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w20_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w20_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w20_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w20_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w20_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w20_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w20_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w20_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w20_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w20_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w20_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w20_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w20_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w20_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w20_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w20_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w20_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w20_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!27!4')">
                          <asp:Label ID="tab_1_2_2_w20_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!28!4')">
                          <asp:Label ID="tab_1_2_2_w20_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!29!4')">
                          <asp:Label ID="tab_1_2_2_w20_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!30!4')">
                          <asp:Label ID="tab_1_2_2_w20_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!31!4')">
                          <asp:Label ID="tab_1_2_2_w20_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!32!4')">
                          <asp:Label ID="tab_1_2_2_w20_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!33!4')">
                          <asp:Label ID="tab_1_2_2_w20_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!34!4')">
                          <asp:Label ID="tab_1_2_2_w20_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!35!4')">
                          <asp:Label ID="tab_1_2_2_w20_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!36!4')">
                          <asp:Label ID="tab_1_2_2_w20_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!37!4')">
                          <asp:Label ID="tab_1_2_2_w20_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!38!4')">
                          <asp:Label ID="tab_1_2_2_w20_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!39!4')">
                          <asp:Label ID="tab_1_2_2_w20_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.2!40!4')">
                          <asp:Label ID="tab_1_2_2_w20_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">odrzucono pozew</td>
                      <td class="borderAll col_36">21</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w21_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w21_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w21_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w21_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w21_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w21_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w21_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w21_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w21_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w21_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w21_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w21_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w21_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w21_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w21_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w21_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w21_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w21_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w21_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w21_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w21_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w21_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w21_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w21_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w21_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w21_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!27!4')">
                          <asp:Label ID="tab_1_2_2_w21_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!28!4')">
                          <asp:Label ID="tab_1_2_2_w21_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!29!4')">
                          <asp:Label ID="tab_1_2_2_w21_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!30!4')">
                          <asp:Label ID="tab_1_2_2_w21_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!31!4')">
                          <asp:Label ID="tab_1_2_2_w21_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!32!4')">
                          <asp:Label ID="tab_1_2_2_w21_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!33!4')">
                          <asp:Label ID="tab_1_2_2_w21_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!34!4')">
                          <asp:Label ID="tab_1_2_2_w21_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!35!4')">
                          <asp:Label ID="tab_1_2_2_w21_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!36!4')">
                          <asp:Label ID="tab_1_2_2_w21_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!37!4')">
                          <asp:Label ID="tab_1_2_2_w21_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!38!4')">
                          <asp:Label ID="tab_1_2_2_w21_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!39!4')">
                          <asp:Label ID="tab_1_2_2_w21_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.2!40!4')">
                          <asp:Label ID="tab_1_2_2_w21_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                     <td class="borderAll wciecie" colspan="2">umorzono na podstawie art. 505<sup>37</sup>§1 kpc</td>
                      <td class="borderAll col_36">22</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w22_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w22_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w22_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w22_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w22_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w22_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w22_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w22_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w22_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w22_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w22_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w22_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w22_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w22_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w22_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w22_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w22_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w22_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w22_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w22_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w22_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w22_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w22_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w22_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w22_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w22_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!27!4')">
                          <asp:Label ID="tab_1_2_2_w22_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!28!4')">
                          <asp:Label ID="tab_1_2_2_w22_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!29!4')">
                          <asp:Label ID="tab_1_2_2_w22_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!30!4')">
                          <asp:Label ID="tab_1_2_2_w22_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!31!4')">
                          <asp:Label ID="tab_1_2_2_w22_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!32!4')">
                          <asp:Label ID="tab_1_2_2_w22_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!33!4')">
                          <asp:Label ID="tab_1_2_2_w22_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!34!4')">
                          <asp:Label ID="tab_1_2_2_w22_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!35!4')">
                          <asp:Label ID="tab_1_2_2_w22_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!36!4')">
                          <asp:Label ID="tab_1_2_2_w22_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!37!4')">
                          <asp:Label ID="tab_1_2_2_w22_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!38!4')">
                          <asp:Label ID="tab_1_2_2_w22_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!39!4')">
                          <asp:Label ID="tab_1_2_2_w22_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.2!40!4')">
                          <asp:Label ID="tab_1_2_2_w22_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">wydano nakaz zapłaty</td>
                      <td class="borderAll col_36">23</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w23_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w23_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w23_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w23_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w23_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w23_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w23_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w23_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w23_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w23_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w23_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w23_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w23_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w23_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w23_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w23_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w23_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w23_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w23_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w23_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w23_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w23_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w23_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w23_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w23_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w23_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!27!4')">
                          <asp:Label ID="tab_1_2_2_w23_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!28!4')">
                          <asp:Label ID="tab_1_2_2_w23_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!29!4')">
                          <asp:Label ID="tab_1_2_2_w23_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!30!4')">
                          <asp:Label ID="tab_1_2_2_w23_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!31!4')">
                          <asp:Label ID="tab_1_2_2_w23_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!32!4')">
                          <asp:Label ID="tab_1_2_2_w23_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!33!4')">
                          <asp:Label ID="tab_1_2_2_w23_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!34!4')">
                          <asp:Label ID="tab_1_2_2_w23_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!35!4')">
                          <asp:Label ID="tab_1_2_2_w23_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!36!4')">
                          <asp:Label ID="tab_1_2_2_w23_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!37!4')">
                          <asp:Label ID="tab_1_2_2_w23_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!38!4')">
                          <asp:Label ID="tab_1_2_2_w23_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!39!4')">
                          <asp:Label ID="tab_1_2_2_w23_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.2!40!4')">
                          <asp:Label ID="tab_1_2_2_w23_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">inne</td>
                      <td class="borderAll col_36">24</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w24_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w24_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w24_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w24_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w24_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w24_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w24_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w24_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w24_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w24_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w24_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w24_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w24_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w24_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w24_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w24_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w24_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w24_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w24_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w24_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w24_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w24_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w24_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w24_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w24_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w24_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!27!4')">
                          <asp:Label ID="tab_1_2_2_w24_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!28!4')">
                          <asp:Label ID="tab_1_2_2_w24_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!29!4')">
                          <asp:Label ID="tab_1_2_2_w24_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!30!4')">
                          <asp:Label ID="tab_1_2_2_w24_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!31!4')">
                          <asp:Label ID="tab_1_2_2_w24_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!32!4')">
                          <asp:Label ID="tab_1_2_2_w24_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!33!4')">
                          <asp:Label ID="tab_1_2_2_w24_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!34!4')">
                          <asp:Label ID="tab_1_2_2_w24_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!35!4')">
                          <asp:Label ID="tab_1_2_2_w24_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!36!4')">
                          <asp:Label ID="tab_1_2_2_w24_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!37!4')">
                          <asp:Label ID="tab_1_2_2_w24_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!38!4')">
                          <asp:Label ID="tab_1_2_2_w24_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!39!4')">
                          <asp:Label ID="tab_1_2_2_w24_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.2!40!4')">
                          <asp:Label ID="tab_1_2_2_w24_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="3">CG-G</td>
                      <td class="borderAll col_36">25</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w25_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w25_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w25_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w25_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w25_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w25_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w25_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w25_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w25_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w25_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w25_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w25_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w25_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w25_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w25_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w25_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w25_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w25_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w25_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w25_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w25_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w25_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w25_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w25_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w25_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w25_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!27!4')">
                          <asp:Label ID="tab_1_2_2_w25_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!28!4')">
                          <asp:Label ID="tab_1_2_2_w25_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!29!4')">
                          <asp:Label ID="tab_1_2_2_w25_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!30!4')">
                          <asp:Label ID="tab_1_2_2_w25_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!31!4')">
                          <asp:Label ID="tab_1_2_2_w25_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!32!4')">
                          <asp:Label ID="tab_1_2_2_w25_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!33!4')">
                          <asp:Label ID="tab_1_2_2_w25_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!34!4')">
                          <asp:Label ID="tab_1_2_2_w25_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!35!4')">
                          <asp:Label ID="tab_1_2_2_w25_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!36!4')">
                          <asp:Label ID="tab_1_2_2_w25_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!37!4')">
                          <asp:Label ID="tab_1_2_2_w25_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!38!4')">
                          <asp:Label ID="tab_1_2_2_w25_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!39!4')">
                          <asp:Label ID="tab_1_2_2_w25_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=25!1.2.2!40!4')">
                          <asp:Label ID="tab_1_2_2_w25_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="3">Ns z wył. rejestrowych</td>
                      <td class="borderAll col_36">26</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w26_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w26_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w26_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w26_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w26_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w26_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w26_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w26_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w26_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w26_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w26_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w26_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w26_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w26_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w26_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w26_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w26_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w26_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w26_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w26_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w26_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w26_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w26_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w26_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w26_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w26_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!27!4')">
                          <asp:Label ID="tab_1_2_2_w26_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!28!4')">
                          <asp:Label ID="tab_1_2_2_w26_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!29!4')">
                          <asp:Label ID="tab_1_2_2_w26_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!30!4')">
                          <asp:Label ID="tab_1_2_2_w26_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!31!4')">
                          <asp:Label ID="tab_1_2_2_w26_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!32!4')">
                          <asp:Label ID="tab_1_2_2_w26_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!33!4')">
                          <asp:Label ID="tab_1_2_2_w26_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!34!4')">
                          <asp:Label ID="tab_1_2_2_w26_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!35!4')">
                          <asp:Label ID="tab_1_2_2_w26_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!36!4')">
                          <asp:Label ID="tab_1_2_2_w26_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!37!4')">
                          <asp:Label ID="tab_1_2_2_w26_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!38!4')">
                          <asp:Label ID="tab_1_2_2_w26_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!39!4')">
                          <asp:Label ID="tab_1_2_2_w26_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=26!1.2.2!40!4')">
                          <asp:Label ID="tab_1_2_2_w26_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="3">W tym spraw o separację</td>
                      <td class="borderAll col_36">27</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w27_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w27_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w27_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w27_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w27_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w27_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w27_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w27_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w27_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w27_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w27_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w27_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w27_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w27_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w27_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w27_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w27_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w27_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w27_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w27_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w27_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w27_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w27_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w27_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w27_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w27_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!27!4')">
                          <asp:Label ID="tab_1_2_2_w27_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!28!4')">
                          <asp:Label ID="tab_1_2_2_w27_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!29!4')">
                          <asp:Label ID="tab_1_2_2_w27_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!30!4')">
                          <asp:Label ID="tab_1_2_2_w27_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!31!4')">
                          <asp:Label ID="tab_1_2_2_w27_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!32!4')">
                          <asp:Label ID="tab_1_2_2_w27_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!33!4')">
                          <asp:Label ID="tab_1_2_2_w27_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!34!4')">
                          <asp:Label ID="tab_1_2_2_w27_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!35!4')">
                          <asp:Label ID="tab_1_2_2_w27_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!36!4')">
                          <asp:Label ID="tab_1_2_2_w27_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!37!4')">
                          <asp:Label ID="tab_1_2_2_w27_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!38!4')">
                          <asp:Label ID="tab_1_2_2_w27_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!39!4')">
                          <asp:Label ID="tab_1_2_2_w27_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=27!1.2.2!40!4')">
                          <asp:Label ID="tab_1_2_2_w27_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="3">Ns rejestrowe</td>
                      <td class="borderAll col_36">28</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w28_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w28_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w28_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w28_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w28_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w28_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w28_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w28_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w28_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w28_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w28_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w28_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w28_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w28_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w28_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w28_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w28_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w28_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w28_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w28_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w28_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w28_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w28_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w28_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w28_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w28_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!27!4')">
                          <asp:Label ID="tab_1_2_2_w28_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!28!4')">
                          <asp:Label ID="tab_1_2_2_w28_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!29!4')">
                          <asp:Label ID="tab_1_2_2_w28_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!30!4')">
                          <asp:Label ID="tab_1_2_2_w28_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!31!4')">
                          <asp:Label ID="tab_1_2_2_w28_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!32!4')">
                          <asp:Label ID="tab_1_2_2_w28_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!33!4')">
                          <asp:Label ID="tab_1_2_2_w28_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!34!4')">
                          <asp:Label ID="tab_1_2_2_w28_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!35!4')">
                          <asp:Label ID="tab_1_2_2_w28_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!36!4')">
                          <asp:Label ID="tab_1_2_2_w28_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!37!4')">
                          <asp:Label ID="tab_1_2_2_w28_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!38!4')">
                          <asp:Label ID="tab_1_2_2_w28_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!39!4')">
                          <asp:Label ID="tab_1_2_2_w28_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=28!1.2.2!40!4')">
                          <asp:Label ID="tab_1_2_2_w28_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="3">N</td>
                      <td class="borderAll col_36">29</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w29_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w29_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w29_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w29_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w29_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w29_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w29_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w29_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w29_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w29_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w29_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w29_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w29_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w29_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w29_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w29_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w29_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w29_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w29_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w29_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w29_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w29_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w29_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w29_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w29_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w29_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!27!4')">
                          <asp:Label ID="tab_1_2_2_w29_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!28!4')">
                          <asp:Label ID="tab_1_2_2_w29_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!29!4')">
                          <asp:Label ID="tab_1_2_2_w29_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!30!4')">
                          <asp:Label ID="tab_1_2_2_w29_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!31!4')">
                          <asp:Label ID="tab_1_2_2_w29_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!32!4')">
                          <asp:Label ID="tab_1_2_2_w29_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!33!4')">
                          <asp:Label ID="tab_1_2_2_w29_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!34!4')">
                          <asp:Label ID="tab_1_2_2_w29_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!35!4')">
                          <asp:Label ID="tab_1_2_2_w29_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!36!4')">
                          <asp:Label ID="tab_1_2_2_w29_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!37!4')">
                          <asp:Label ID="tab_1_2_2_w29_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!38!4')">
                          <asp:Label ID="tab_1_2_2_w29_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!39!4')">
                          <asp:Label ID="tab_1_2_2_w29_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=29!1.2.2!40!4')">
                          <asp:Label ID="tab_1_2_2_w29_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="3">Co I instancja</td>
                      <td class="borderAll col_36">30</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w30_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w30_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w30_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w30_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w30_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w30_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w30_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w30_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w30_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w30_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w30_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w30_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w30_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w30_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w30_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w30_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w30_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w30_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w30_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w30_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w30_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w30_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w30_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w30_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w30_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w30_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!27!4')">
                          <asp:Label ID="tab_1_2_2_w30_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!28!4')">
                          <asp:Label ID="tab_1_2_2_w30_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!29!4')">
                          <asp:Label ID="tab_1_2_2_w30_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!30!4')">
                          <asp:Label ID="tab_1_2_2_w30_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!31!4')">
                          <asp:Label ID="tab_1_2_2_w30_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!32!4')">
                          <asp:Label ID="tab_1_2_2_w30_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!33!4')">
                          <asp:Label ID="tab_1_2_2_w30_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!34!4')">
                          <asp:Label ID="tab_1_2_2_w30_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!35!4')">
                          <asp:Label ID="tab_1_2_2_w30_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!36!4')">
                          <asp:Label ID="tab_1_2_2_w30_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!37!4')">
                          <asp:Label ID="tab_1_2_2_w30_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!38!4')">
                          <asp:Label ID="tab_1_2_2_w30_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!39!4')">
                          <asp:Label ID="tab_1_2_2_w30_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=30!1.2.2!40!4')">
                          <asp:Label ID="tab_1_2_2_w30_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="3">Co II instancja</td>
                      <td class="borderAll col_36">31</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w31_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w31_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w31_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w31_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w31_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w31_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w31_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w31_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w31_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w31_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w31_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w31_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w31_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w31_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w31_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w31_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w31_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w31_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w31_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w31_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w31_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w31_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w31_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w31_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w31_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w31_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!27!4')">
                          <asp:Label ID="tab_1_2_2_w31_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!28!4')">
                          <asp:Label ID="tab_1_2_2_w31_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!29!4')">
                          <asp:Label ID="tab_1_2_2_w31_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!30!4')">
                          <asp:Label ID="tab_1_2_2_w31_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!31!4')">
                          <asp:Label ID="tab_1_2_2_w31_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!32!4')">
                          <asp:Label ID="tab_1_2_2_w31_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!33!4')">
                          <asp:Label ID="tab_1_2_2_w31_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!34!4')">
                          <asp:Label ID="tab_1_2_2_w31_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!35!4')">
                          <asp:Label ID="tab_1_2_2_w31_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!36!4')">
                          <asp:Label ID="tab_1_2_2_w31_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!37!4')">
                          <asp:Label ID="tab_1_2_2_w31_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!38!4')">
                          <asp:Label ID="tab_1_2_2_w31_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!39!4')">
                          <asp:Label ID="tab_1_2_2_w31_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=31!1.2.2!40!4')">
                          <asp:Label ID="tab_1_2_2_w31_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="3">Ca</td>
                      <td class="borderAll col_36">32</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w32_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w32_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w32_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w32_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w32_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w32_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w32_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w32_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w32_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w32_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w32_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w32_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w32_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w32_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w32_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w32_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w32_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w32_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w32_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w32_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w32_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w32_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w32_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w32_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w32_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w32_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!27!4')">
                          <asp:Label ID="tab_1_2_2_w32_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!28!4')">
                          <asp:Label ID="tab_1_2_2_w32_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!29!4')">
                          <asp:Label ID="tab_1_2_2_w32_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!30!4')">
                          <asp:Label ID="tab_1_2_2_w32_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!31!4')">
                          <asp:Label ID="tab_1_2_2_w32_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!32!4')">
                          <asp:Label ID="tab_1_2_2_w32_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!33!4')">
                          <asp:Label ID="tab_1_2_2_w32_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!34!4')">
                          <asp:Label ID="tab_1_2_2_w32_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!35!4')">
                          <asp:Label ID="tab_1_2_2_w32_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!36!4')">
                          <asp:Label ID="tab_1_2_2_w32_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!37!4')">
                          <asp:Label ID="tab_1_2_2_w32_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!38!4')">
                          <asp:Label ID="tab_1_2_2_w32_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!39!4')">
                          <asp:Label ID="tab_1_2_2_w32_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=32!1.2.2!40!4')">
                          <asp:Label ID="tab_1_2_2_w32_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="3">Cz</td>
                      <td class="borderAll col_36">33</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w33_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w33_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w33_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w33_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w33_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w33_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w33_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w33_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w33_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w33_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w33_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w33_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w33_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w33_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w33_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w33_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w33_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w33_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w33_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w33_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w33_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w33_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w33_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w33_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w33_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w33_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!27!4')">
                          <asp:Label ID="tab_1_2_2_w33_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!28!4')">
                          <asp:Label ID="tab_1_2_2_w33_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!29!4')">
                          <asp:Label ID="tab_1_2_2_w33_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!30!4')">
                          <asp:Label ID="tab_1_2_2_w33_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!31!4')">
                          <asp:Label ID="tab_1_2_2_w33_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!32!4')">
                          <asp:Label ID="tab_1_2_2_w33_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!33!4')">
                          <asp:Label ID="tab_1_2_2_w33_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!34!4')">
                          <asp:Label ID="tab_1_2_2_w33_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!35!4')">
                          <asp:Label ID="tab_1_2_2_w33_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!36!4')">
                          <asp:Label ID="tab_1_2_2_w33_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!37!4')">
                          <asp:Label ID="tab_1_2_2_w33_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!38!4')">
                          <asp:Label ID="tab_1_2_2_w33_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!39!4')">
                          <asp:Label ID="tab_1_2_2_w33_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=33!1.2.2!40!4')">
                          <asp:Label ID="tab_1_2_2_w33_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="3">WSC (skarga kasacyjna)</td>
                      <td class="borderAll col_36">34</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w34_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w34_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w34_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w34_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w34_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w34_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w34_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w34_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w34_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w34_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w34_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w34_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w34_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w34_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w34_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w34_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w34_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w34_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w34_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w34_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w34_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w34_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w34_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w34_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w34_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w34_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!27!4')">
                          <asp:Label ID="tab_1_2_2_w34_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!28!4')">
                          <asp:Label ID="tab_1_2_2_w34_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!29!4')">
                          <asp:Label ID="tab_1_2_2_w34_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!30!4')">
                          <asp:Label ID="tab_1_2_2_w34_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!31!4')">
                          <asp:Label ID="tab_1_2_2_w34_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!32!4')">
                          <asp:Label ID="tab_1_2_2_w34_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!33!4')">
                          <asp:Label ID="tab_1_2_2_w34_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!34!4')">
                          <asp:Label ID="tab_1_2_2_w34_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!35!4')">
                          <asp:Label ID="tab_1_2_2_w34_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!36!4')">
                          <asp:Label ID="tab_1_2_2_w34_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!37!4')">
                          <asp:Label ID="tab_1_2_2_w34_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!38!4')">
                          <asp:Label ID="tab_1_2_2_w34_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!39!4')">
                          <asp:Label ID="tab_1_2_2_w34_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=34!1.2.2!40!4')">
                          <asp:Label ID="tab_1_2_2_w34_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="3">WSC (skarga o stwierdzenie niezgodności z prawem) – I instancja</td>
                      <td class="borderAll col_36">35</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w35_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w35_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w35_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w35_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w35_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w35_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w35_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w35_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w35_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w35_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w35_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w35_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w35_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w35_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w35_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w35_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w35_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w35_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w35_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w35_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w35_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w35_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w35_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w35_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w35_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w35_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!27!4')">
                          <asp:Label ID="tab_1_2_2_w35_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!28!4')">
                          <asp:Label ID="tab_1_2_2_w35_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!29!4')">
                          <asp:Label ID="tab_1_2_2_w35_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!30!4')">
                          <asp:Label ID="tab_1_2_2_w35_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!31!4')">
                          <asp:Label ID="tab_1_2_2_w35_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!32!4')">
                          <asp:Label ID="tab_1_2_2_w35_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!33!4')">
                          <asp:Label ID="tab_1_2_2_w35_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!34!4')">
                          <asp:Label ID="tab_1_2_2_w35_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!35!4')">
                          <asp:Label ID="tab_1_2_2_w35_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!36!4')">
                          <asp:Label ID="tab_1_2_2_w35_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!37!4')">
                          <asp:Label ID="tab_1_2_2_w35_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!38!4')">
                          <asp:Label ID="tab_1_2_2_w35_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!39!4')">
                          <asp:Label ID="tab_1_2_2_w35_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=35!1.2.2!40!4')">
                          <asp:Label ID="tab_1_2_2_w35_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="3">WSC (skarga o stwierdzenie niezgodności z prawem) – II instancja</td>
                      <td class="borderAll col_36">36</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w36_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w36_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w36_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w36_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w36_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w36_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w36_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w36_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w36_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w36_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w36_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w36_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w36_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w36_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w36_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w36_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w36_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w36_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w36_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w36_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w36_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w36_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w36_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w36_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w36_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w36_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!27!4')">
                          <asp:Label ID="tab_1_2_2_w36_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!28!4')">
                          <asp:Label ID="tab_1_2_2_w36_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!29!4')">
                          <asp:Label ID="tab_1_2_2_w36_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!30!4')">
                          <asp:Label ID="tab_1_2_2_w36_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!31!4')">
                          <asp:Label ID="tab_1_2_2_w36_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!32!4')">
                          <asp:Label ID="tab_1_2_2_w36_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!33!4')">
                          <asp:Label ID="tab_1_2_2_w36_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!34!4')">
                          <asp:Label ID="tab_1_2_2_w36_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!35!4')">
                          <asp:Label ID="tab_1_2_2_w36_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!36!4')">
                          <asp:Label ID="tab_1_2_2_w36_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!37!4')">
                          <asp:Label ID="tab_1_2_2_w36_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!38!4')">
                          <asp:Label ID="tab_1_2_2_w36_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!39!4')">
                          <asp:Label ID="tab_1_2_2_w36_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=36!1.2.2!40!4')">
                          <asp:Label ID="tab_1_2_2_w36_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="3">Skarga na postępowanie sądowe Wykaz S*</td>
                      <td class="borderAll col_36">37</td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!1!4')">
                          <asp:Label ID="tab_1_2_2_w37_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!2!4')">
                          <asp:Label ID="tab_1_2_2_w37_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!3!4')">
                          <asp:Label ID="tab_1_2_2_w37_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!4!4')">
                          <asp:Label ID="tab_1_2_2_w37_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!5!4')">
                          <asp:Label ID="tab_1_2_2_w37_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!6!4')">
                          <asp:Label ID="tab_1_2_2_w37_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!7!4')">
                          <asp:Label ID="tab_1_2_2_w37_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!8!4')">
                          <asp:Label ID="tab_1_2_2_w37_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!9!4')">
                          <asp:Label ID="tab_1_2_2_w37_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!10!4')">
                          <asp:Label ID="tab_1_2_2_w37_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!11!4')">
                          <asp:Label ID="tab_1_2_2_w37_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!12!4')">
                          <asp:Label ID="tab_1_2_2_w37_c12" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!13!4')">
                          <asp:Label ID="tab_1_2_2_w37_c13" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!14!4')">
                          <asp:Label ID="tab_1_2_2_w37_c14" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!15!4')">
                          <asp:Label ID="tab_1_2_2_w37_c15" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!16!4')">
                          <asp:Label ID="tab_1_2_2_w37_c16" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!17!4')">
                          <asp:Label ID="tab_1_2_2_w37_c17" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!18!4')">
                          <asp:Label ID="tab_1_2_2_w37_c18" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!19!4')">
                          <asp:Label ID="tab_1_2_2_w37_c19" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!20!4')">
                          <asp:Label ID="tab_1_2_2_w37_c20" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!21!4')">
                          <asp:Label ID="tab_1_2_2_w37_c21" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!22!4')">
                          <asp:Label ID="tab_1_2_2_w37_c22" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!23!4')">
                          <asp:Label ID="tab_1_2_2_w37_c23" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!24!4')">
                          <asp:Label ID="tab_1_2_2_w37_c24" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!25!4')">
                          <asp:Label ID="tab_1_2_2_w37_c25" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!26!4')">
                          <asp:Label ID="tab_1_2_2_w37_c26" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!27!4')">
                          <asp:Label ID="tab_1_2_2_w37_c27" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!28!4')">
                          <asp:Label ID="tab_1_2_2_w37_c28" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!29!4')">
                          <asp:Label ID="tab_1_2_2_w37_c29" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!30!4')">
                          <asp:Label ID="tab_1_2_2_w37_c30" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!31!4')">
                          <asp:Label ID="tab_1_2_2_w37_c31" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!32!4')">
                          <asp:Label ID="tab_1_2_2_w37_c32" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!33!4')">
                          <asp:Label ID="tab_1_2_2_w37_c33" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!34!4')">
                          <asp:Label ID="tab_1_2_2_w37_c34" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!35!4')">
                          <asp:Label ID="tab_1_2_2_w37_c35" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!36!4')">
                          <asp:Label ID="tab_1_2_2_w37_c36" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!37!4')">
                          <asp:Label ID="tab_1_2_2_w37_c37" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!38!4')">
                          <asp:Label ID="tab_1_2_2_w37_c38" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!39!4')">
                          <asp:Label ID="tab_1_2_2_w37_c39" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=37!1.2.2!40!4')">
                          <asp:Label ID="tab_1_2_2_w37_c40" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
              </table>
           * Na podstawie ustawy z dnia 17 czerwca 2004 r. o skardze na naruszenie prawa strony do rozpoznania sprawy w postępowaniu przygotowawczym prowadzonym lub nadzorowanym przez prokuratora i postępowaniu sądowym bez nieuzasadnionej zwłoki (Dz. U. z 2016 r., poz. 1259 z późn. zm.).
           <br />
        1) Liczba w wierszu ogółem (w.01)  powinna być zgodna z sumą liczb wykazanych w dz.1.1. w.01. Kol.3).

              <br />

          </div>
          
          <br />
          <br />
          <br />
          <br />
          <br />
          <br />
          <br />
        



 
    <br />
       
  </div>

    
</asp:Content>

