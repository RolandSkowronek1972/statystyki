﻿<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="akrc.aspx.cs" Inherits="stat2018.akrc" %>

<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.13.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


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

          @media print {
            
              @page {
                  font-size: 7.5pt;
                  size: 29cm 21.7cm;
                  margin: 5mm 5mm 5mm 5mm;             
              }
   
              div {
                  transform: translate(0mm, 0);
                  -webkit-transform: translate(0mm, 0 ) ; /* Saf3.1+, Chrome */
                  -moz-transform: translate(0mm, 0) ; /* FF3.5+ */
                  break-after:column;
              }            
          }
              </style>
      <script src="Scripts/rls.js"></script>
    
     <div id="menu" class="manu_back noprint" style="height:40px;" > 
   
                  
   <table >
        <tr>
            <td style="width:auto;padding-left:5px;">
                <asp:Label ID="Label4" runat="server" Text="Proszę wybrać zakres:"></asp:Label>
            </td>
            <td style="width:auto;padding-left:5px;">

                <dx:ASPxDateEdit ID="Date1" runat="server" Theme="Moderno">
                </dx:ASPxDateEdit>
              


            </td>
            <td style="width:auto;padding-left:5px;">
               
                       <dx:ASPxDateEdit ID="Date2" runat="server" Theme="Moderno">
                </dx:ASPxDateEdit></td>
            <td style="width:auto;padding-left:5px;" >
                <asp:LinkButton ID="LinkButton54" runat="server" class="ax_box" OnClick="Odswiez">  Odśwież</asp:LinkButton>
            </td>
            <td style="width:auto;padding-left:5px;">
                           <input id="Button1" class="ax_box" style="border-style: none; padding: 2px" type="button" onclick="JavaScript: window.print();" value="Drukuj" /></td>
       
           
            <td style="width:auto;padding-left:5px;">
                 <asp:LinkButton ID="LinkButton57" runat="server" CssClass="ax_box" OnClick="tworzPlikExcell">Zapisz do Excel</asp:LinkButton>
            </td>
        </tr>
    
    </table>
      </div>
       <div style="width:1150px; margin: 0 auto 0 auto; position:relative;top:30px;" >
           <br />
               <div>
&nbsp;<asp:Label ID="Label1" runat="server" Text="Ruch spraw"></asp:Label>
           &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel1" runat="server" Text="tabela  1" Visible="False"></asp:Label>
                   <br />
          <div id="TABELA5"  class="page -break" > 
 <table style="width: 100%; "> 
   <tr> 
  <td class="borderAll center" rowspan="3"> 
      Ruch spraw</td > 
  <td class="borderAll center" colspan="15"> 
      Sprawy według repertoriów i wykazów</td > 
   </tr> 
   <tr> 
  <td class="borderAll center" colspan="3"> 
      C</td > 
  <td class="borderAll center" rowspan="2"> 
      CGG</td > 
  <td class="borderAll center" colspan="2"> 
      Ns</td > 
  <td class="borderAll center" rowspan="2"> 
      Co</td > 
  <td class="borderAll center" rowspan="2"> 
      Nc 
  </td > 
  <td class="borderAll center" rowspan="2"> 
      Rejestr prasy</td > 
  <td class="borderAll center" rowspan="2"> 
      Ca 
  </td > 
  <td class="borderAll center" rowspan="2"> 
      Cz</td > 
  <td class="borderAll center" colspan="2"> 
      WSC</td > 
  <td class="borderAll center" rowspan="2"> 
      S</td > 
  <td class="borderAll center" rowspan="2"> 
      Łącznie</td > 
   </tr> 
   <tr> 
  <td class="borderAll center"> 
      Razem C</td > 
  <td class="borderAll center"> 
      w tym rozwód</td > 
  <td class="borderAll center"> 
      w tym separacja</td > 
  <td class="borderAll center"> 
      Razem Ns</td > 
  <td class="borderAll center"> 
      w tym separacja</td > 
  <td class="borderAll center"> 
      skarga kasacyjna</td > 
  <td class="borderAll center"> 
      skarga o stwier-dzenie niezgod-ności z prawem</td > 
   </tr> 
   <tr> 
  <td class="wciecie borderAll"> 
      Pozostało z ubiegłego miesiąca</td>
  <td class="center borderAll col_50"> <a href="javascript: openPopup('popup.aspx?sesja=1!1!1!3')"><asp:Label CssClass="normal" ID="tab_1_w01_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!1!2!3')"><asp:Label CssClass="normal" ID="tab_1_w01_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!1!3!3')"><asp:Label CssClass="normal" ID="tab_1_w01_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!1!4!3')"><asp:Label CssClass="normal" ID="tab_1_w01_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!1!5!3')"><asp:Label CssClass="normal" ID="tab_1_w01_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!1!6!3')"><asp:Label CssClass="normal" ID="tab_1_w01_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!1!7!3')"><asp:Label CssClass="normal" ID="tab_1_w01_c07" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!1!8!3')"><asp:Label CssClass="normal" ID="tab_1_w01_c08" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!1!9!3')"><asp:Label CssClass="normal" ID="tab_1_w01_c09" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!1!10!3')"><asp:Label CssClass="normal" ID="tab_1_w01_c10" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!1!11!3')"><asp:Label CssClass="normal" ID="tab_1_w01_c11" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!1!12!3')"><asp:Label CssClass="normal" ID="tab_1_w01_c12" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!1!13!3')"><asp:Label CssClass="normal" ID="tab_1_w01_c13" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!1!14!3')"><asp:Label CssClass="normal" ID="tab_1_w01_c14" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50  gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!1!15!3')"><asp:Label CssClass="normal" ID="tab_1_w01_c15" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="wciecie borderAll"> 
      Wpływ od początku roku do końca bieżącego miesiąca </td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!1!1!3')"><asp:Label CssClass="normal" ID="tab_1_w02_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!1!2!3')"><asp:Label CssClass="normal" ID="tab_1_w02_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!1!3!3')"><asp:Label CssClass="normal" ID="tab_1_w02_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!1!4!3')"><asp:Label CssClass="normal" ID="tab_1_w02_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!1!5!3')"><asp:Label CssClass="normal" ID="tab_1_w02_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!1!6!3')"><asp:Label CssClass="normal" ID="tab_1_w02_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!1!7!3')"><asp:Label CssClass="normal" ID="tab_1_w02_c07" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!1!8!3')"><asp:Label CssClass="normal" ID="tab_1_w02_c08" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!1!9!3')"><asp:Label CssClass="normal" ID="tab_1_w02_c09" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!1!10!3')"><asp:Label CssClass="normal" ID="tab_1_w02_c10" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!1!11!3')"><asp:Label CssClass="normal" ID="tab_1_w02_c11" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!1!12!3')"><asp:Label CssClass="normal" ID="tab_1_w02_c12" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!1!13!3')"><asp:Label CssClass="normal" ID="tab_1_w02_c13" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!1!14!3')"><asp:Label CssClass="normal" ID="tab_1_w02_c14" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50  gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!1!15!3')"><asp:Label CssClass="normal" ID="tab_1_w02_c15" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="wciecie borderAll"> 
      Wpływ za miesiąc bieżący</td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!1!1!3')"><asp:Label CssClass="normal" ID="tab_1_w03_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!1!2!3')"><asp:Label CssClass="normal" ID="tab_1_w03_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!1!3!3')"><asp:Label CssClass="normal" ID="tab_1_w03_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!1!4!3')"><asp:Label CssClass="normal" ID="tab_1_w03_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!1!5!3')"><asp:Label CssClass="normal" ID="tab_1_w03_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!1!6!3')"><asp:Label CssClass="normal" ID="tab_1_w03_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!1!7!3')"><asp:Label CssClass="normal" ID="tab_1_w03_c07" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!1!8!3')"><asp:Label CssClass="normal" ID="tab_1_w03_c08" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!1!9!3')"><asp:Label CssClass="normal" ID="tab_1_w03_c09" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!1!10!3')"><asp:Label CssClass="normal" ID="tab_1_w03_c10" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!1!11!3')"><asp:Label CssClass="normal" ID="tab_1_w03_c11" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!1!12!3')"><asp:Label CssClass="normal" ID="tab_1_w03_c12" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!1!13!3')"><asp:Label CssClass="normal" ID="tab_1_w03_c13" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!1!14!3')"><asp:Label CssClass="normal" ID="tab_1_w03_c14" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50  gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!1!15!3')"><asp:Label CssClass="normal" ID="tab_1_w03_c15" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="wciecie borderAll"> 
      Załatwienia od początku roku do końca bieżącego miesiąca </td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!1!1!3')"><asp:Label CssClass="normal" ID="tab_1_w04_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!1!2!3')"><asp:Label CssClass="normal" ID="tab_1_w04_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!1!3!3')"><asp:Label CssClass="normal" ID="tab_1_w04_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!1!4!3')"><asp:Label CssClass="normal" ID="tab_1_w04_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!1!5!3')"><asp:Label CssClass="normal" ID="tab_1_w04_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!1!6!3')"><asp:Label CssClass="normal" ID="tab_1_w04_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!1!7!3')"><asp:Label CssClass="normal" ID="tab_1_w04_c07" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!1!8!3')"><asp:Label CssClass="normal" ID="tab_1_w04_c08" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!1!9!3')"><asp:Label CssClass="normal" ID="tab_1_w04_c09" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!1!10!3')"><asp:Label CssClass="normal" ID="tab_1_w04_c10" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!1!11!3')"><asp:Label CssClass="normal" ID="tab_1_w04_c11" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!1!12!3')"><asp:Label CssClass="normal" ID="tab_1_w04_c12" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!1!13!3')"><asp:Label CssClass="normal" ID="tab_1_w04_c13" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!1!14!3')"><asp:Label CssClass="normal" ID="tab_1_w04_c14" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50  gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!1!15!3')"><asp:Label CssClass="normal" ID="tab_1_w04_c15" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="wciecie borderAll"> 
      Załatwienia w bieżącym miesiącu </td>
  <td class="borderAll center gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=5!1!1!3')"><asp:Label CssClass="normal" ID="tab_1_w05_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll center gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=5!1!2!3')"><asp:Label CssClass="normal" ID="tab_1_w05_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll center gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=5!1!3!3')"><asp:Label CssClass="normal" ID="tab_1_w05_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll center gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=5!1!4!3')"><asp:Label CssClass="normal" ID="tab_1_w05_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll center gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=5!1!5!3')"><asp:Label CssClass="normal" ID="tab_1_w05_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll center gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=5!1!6!3')"><asp:Label CssClass="normal" ID="tab_1_w05_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll center gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=5!1!7!3')"><asp:Label CssClass="normal" ID="tab_1_w05_c07" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll center gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=5!1!8!3')"><asp:Label CssClass="normal" ID="tab_1_w05_c08" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll center gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=5!1!9!3')"><asp:Label CssClass="normal" ID="tab_1_w05_c09" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll center gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=5!1!10!3')"><asp:Label CssClass="normal" ID="tab_1_w05_c10" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll center gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=5!1!11!3')"><asp:Label CssClass="normal" ID="tab_1_w05_c11" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll center gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=5!1!12!3')"><asp:Label CssClass="normal" ID="tab_1_w05_c12" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll center gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=5!1!13!3')"><asp:Label CssClass="normal" ID="tab_1_w05_c13" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll center gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=5!1!14!3')"><asp:Label CssClass="normal" ID="tab_1_w05_c14" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll center gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=5!1!15!3')"><asp:Label CssClass="normal" ID="tab_1_w05_c15" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="wciecie borderAll"> 
      Pozostało na następny miesiąc (w tym powyżej) </td>
  <td class="borderAll center gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=6!1!1!3')"><asp:Label CssClass="normal" ID="tab_1_w06_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll center gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=6!1!2!3')"><asp:Label CssClass="normal" ID="tab_1_w06_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll center gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=6!1!3!3')"><asp:Label CssClass="normal" ID="tab_1_w06_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll center gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=6!1!4!3')"><asp:Label CssClass="normal" ID="tab_1_w06_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll center gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=6!1!5!3')"><asp:Label CssClass="normal" ID="tab_1_w06_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll center gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=6!1!6!3')"><asp:Label CssClass="normal" ID="tab_1_w06_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll center gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=6!1!7!3')"><asp:Label CssClass="normal" ID="tab_1_w06_c07" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll center gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=6!1!8!3')"><asp:Label CssClass="normal" ID="tab_1_w06_c08" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll center gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=6!1!9!3')"><asp:Label CssClass="normal" ID="tab_1_w06_c09" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll center gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=6!1!10!3')"><asp:Label CssClass="normal" ID="tab_1_w06_c10" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll center gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=6!1!11!3')"><asp:Label CssClass="normal" ID="tab_1_w06_c11" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll center gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=6!1!12!3')"><asp:Label CssClass="normal" ID="tab_1_w06_c12" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll center gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=6!1!13!3')"><asp:Label CssClass="normal" ID="tab_1_w06_c13" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll center gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=6!1!14!3')"><asp:Label CssClass="normal" ID="tab_1_w06_c14" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll center gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=6!1!15!3')"><asp:Label CssClass="normal" ID="tab_1_w06_c15" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="wciecie borderAll"> 
      3 - 6 miesięcy </td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=7!1!1!3')"><asp:Label CssClass="normal" ID="tab_1_w07_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=7!1!2!3')"><asp:Label CssClass="normal" ID="tab_1_w07_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=7!1!3!3')"><asp:Label CssClass="normal" ID="tab_1_w07_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=7!1!4!3')"><asp:Label CssClass="normal" ID="tab_1_w07_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=7!1!5!3')"><asp:Label CssClass="normal" ID="tab_1_w07_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=7!1!6!3')"><asp:Label CssClass="normal" ID="tab_1_w07_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=7!1!7!3')"><asp:Label CssClass="normal" ID="tab_1_w07_c07" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=7!1!8!3')"><asp:Label CssClass="normal" ID="tab_1_w07_c08" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=7!1!9!3')"><asp:Label CssClass="normal" ID="tab_1_w07_c09" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=7!1!10!3')"><asp:Label CssClass="normal" ID="tab_1_w07_c10" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=7!1!11!3')"><asp:Label CssClass="normal" ID="tab_1_w07_c11" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=7!1!12!3')"><asp:Label CssClass="normal" ID="tab_1_w07_c12" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=7!1!13!3')"><asp:Label CssClass="normal" ID="tab_1_w07_c13" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=7!1!14!3')"><asp:Label CssClass="normal" ID="tab_1_w07_c14" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50  gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=7!1!15!3')"><asp:Label CssClass="normal" ID="tab_1_w07_c15" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="wciecie borderAll"> 
      6 - 12 miesięcy </td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=8!1!1!3')"><asp:Label CssClass="normal" ID="tab_1_w08_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=8!1!2!3')"><asp:Label CssClass="normal" ID="tab_1_w08_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=8!1!3!3')"><asp:Label CssClass="normal" ID="tab_1_w08_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=8!1!4!3')"><asp:Label CssClass="normal" ID="tab_1_w08_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=8!1!5!3')"><asp:Label CssClass="normal" ID="tab_1_w08_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=8!1!6!3')"><asp:Label CssClass="normal" ID="tab_1_w08_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=8!1!7!3')"><asp:Label CssClass="normal" ID="tab_1_w08_c07" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=8!1!8!3')"><asp:Label CssClass="normal" ID="tab_1_w08_c08" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=8!1!9!3')"><asp:Label CssClass="normal" ID="tab_1_w08_c09" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=8!1!10!3')"><asp:Label CssClass="normal" ID="tab_1_w08_c10" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=8!1!11!3')"><asp:Label CssClass="normal" ID="tab_1_w08_c11" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=8!1!12!3')"><asp:Label CssClass="normal" ID="tab_1_w08_c12" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=8!1!13!3')"><asp:Label CssClass="normal" ID="tab_1_w08_c13" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=8!1!14!3')"><asp:Label CssClass="normal" ID="tab_1_w08_c14" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50  gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=8!1!15!3')"><asp:Label CssClass="normal" ID="tab_1_w08_c15" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="wciecie borderAll"> 
      12 - 36 miesięcy </td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=9!1!1!3')"><asp:Label CssClass="normal" ID="tab_1_w09_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=9!1!2!3')"><asp:Label CssClass="normal" ID="tab_1_w09_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=9!1!3!3')"><asp:Label CssClass="normal" ID="tab_1_w09_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=9!1!4!3')"><asp:Label CssClass="normal" ID="tab_1_w09_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=9!1!5!3')"><asp:Label CssClass="normal" ID="tab_1_w09_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=9!1!6!3')"><asp:Label CssClass="normal" ID="tab_1_w09_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=9!1!7!3')"><asp:Label CssClass="normal" ID="tab_1_w09_c07" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=9!1!8!3')"><asp:Label CssClass="normal" ID="tab_1_w09_c08" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=9!1!9!3')"><asp:Label CssClass="normal" ID="tab_1_w09_c09" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=9!1!10!3')"><asp:Label CssClass="normal" ID="tab_1_w09_c10" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=9!1!11!3')"><asp:Label CssClass="normal" ID="tab_1_w09_c11" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=9!1!12!3')"><asp:Label CssClass="normal" ID="tab_1_w09_c12" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=9!1!13!3')"><asp:Label CssClass="normal" ID="tab_1_w09_c13" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=9!1!14!3')"><asp:Label CssClass="normal" ID="tab_1_w09_c14" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50  gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=9!1!15!3')"><asp:Label CssClass="normal" ID="tab_1_w09_c15" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="wciecie borderAll"> 
      powyżej 36 miesięcy </td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=10!1!1!3')"><asp:Label CssClass="normal" ID="tab_1_w10_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=10!1!2!3')"><asp:Label CssClass="normal" ID="tab_1_w10_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=10!1!3!3')"><asp:Label CssClass="normal" ID="tab_1_w10_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=10!1!4!3')"><asp:Label CssClass="normal" ID="tab_1_w10_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=10!1!5!3')"><asp:Label CssClass="normal" ID="tab_1_w10_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=10!1!6!3')"><asp:Label CssClass="normal" ID="tab_1_w10_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=10!1!7!3')"><asp:Label CssClass="normal" ID="tab_1_w10_c07" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=10!1!8!3')"><asp:Label CssClass="normal" ID="tab_1_w10_c08" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=10!1!9!3')"><asp:Label CssClass="normal" ID="tab_1_w10_c09" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=10!1!10!3')"><asp:Label CssClass="normal" ID="tab_1_w10_c10" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=10!1!11!3')"><asp:Label CssClass="normal" ID="tab_1_w10_c11" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=10!1!12!3')"><asp:Label CssClass="normal" ID="tab_1_w10_c12" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=10!1!13!3')"><asp:Label CssClass="normal" ID="tab_1_w10_c13" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=10!1!14!3')"><asp:Label CssClass="normal" ID="tab_1_w10_c14" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50  gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=10!1!15!3')"><asp:Label CssClass="normal" ID="tab_1_w10_c15" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="wciecie borderAll"> 
      &quot;w tym 3 do 5 lat&quot; </td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=11!1!1!3')"><asp:Label CssClass="normal" ID="tab_1_w11_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=11!1!2!3')"><asp:Label CssClass="normal" ID="tab_1_w11_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=11!1!3!3')"><asp:Label CssClass="normal" ID="tab_1_w11_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=11!1!4!3')"><asp:Label CssClass="normal" ID="tab_1_w11_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=11!1!5!3')"><asp:Label CssClass="normal" ID="tab_1_w11_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=11!1!6!3')"><asp:Label CssClass="normal" ID="tab_1_w11_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=11!1!7!3')"><asp:Label CssClass="normal" ID="tab_1_w11_c07" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=11!1!8!3')"><asp:Label CssClass="normal" ID="tab_1_w11_c08" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=11!1!9!3')"><asp:Label CssClass="normal" ID="tab_1_w11_c09" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=11!1!10!3')"><asp:Label CssClass="normal" ID="tab_1_w11_c10" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=11!1!11!3')"><asp:Label CssClass="normal" ID="tab_1_w11_c11" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=11!1!12!3')"><asp:Label CssClass="normal" ID="tab_1_w11_c12" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=11!1!13!3')"><asp:Label CssClass="normal" ID="tab_1_w11_c13" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=11!1!14!3')"><asp:Label CssClass="normal" ID="tab_1_w11_c14" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50  gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=11!1!15!3')"><asp:Label CssClass="normal" ID="tab_1_w11_c15" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="wciecie borderAll"> 
      ponad 5 lat </td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=12!1!1!3')"><asp:Label CssClass="normal" ID="tab_1_w12_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=12!1!2!3')"><asp:Label CssClass="normal" ID="tab_1_w12_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=12!1!3!3')"><asp:Label CssClass="normal" ID="tab_1_w12_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=12!1!4!3')"><asp:Label CssClass="normal" ID="tab_1_w12_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=12!1!5!3')"><asp:Label CssClass="normal" ID="tab_1_w12_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=12!1!6!3')"><asp:Label CssClass="normal" ID="tab_1_w12_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=12!1!7!3')"><asp:Label CssClass="normal" ID="tab_1_w12_c07" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=12!1!8!3')"><asp:Label CssClass="normal" ID="tab_1_w12_c08" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=12!1!9!3')"><asp:Label CssClass="normal" ID="tab_1_w12_c09" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=12!1!10!3')"><asp:Label CssClass="normal" ID="tab_1_w12_c10" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=12!1!11!3')"><asp:Label CssClass="normal" ID="tab_1_w12_c11" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=12!1!12!3')"><asp:Label CssClass="normal" ID="tab_1_w12_c12" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=12!1!13!3')"><asp:Label CssClass="normal" ID="tab_1_w12_c13" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=12!1!14!3')"><asp:Label CssClass="normal" ID="tab_1_w12_c14" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll col_50  gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=12!1!15!3')"><asp:Label CssClass="normal" ID="tab_1_w12_c15" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
 </table> 


  

               </div>
           <br />
           <div class="page-break">
<asp:Label ID="Label7" runat="server" Text="Informacja o ruchu spraw"></asp:Label>
           &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel2" runat="server" Text="tabela 2" Visible="False"></asp:Label>
               <br />
        
               <asp:GridView ID="gwTabela2" runat="server" OnRowCreated="naglowekTabeli_gwTabela2"  AutoGenerateColumns="False"  OnRowDataBound="stopkaTabeli_gwTabela2"  Width = "100%" ShowHeader = "False" ShowFooter = "True"  >
        <Columns>
    <asp:BoundField DataField = "id" HeaderText = "L.p." SortExpression = "id" >
                <ItemStyle Width = "15px" />
                  </asp:BoundField >

             
                        <asp:TemplateField HeaderText = "imie" SortExpression = "imie" >
                                          <ItemTemplate >
                                   
                                           <asp:Label ID = "Label12"  runat = "server" Text = '<%# Bind("nazwisko") %>' ></asp:Label >
                                                            </ItemTemplate >
                                                            <ItemStyle  CssClass = "t2_nazwisko" />
                                                        </asp:TemplateField >
               <asp:TemplateField HeaderText = "imie" SortExpression = "imie" >
                                          <ItemTemplate >
                                              <asp:Label ID = "Label8" runat = "server" Text = '<%# Eval("imie") %>' ></asp:Label >
                                      
                                                            </ItemTemplate >
                                                            <ItemStyle  CssClass = "t2_nazwisko" />
                                                        </asp:TemplateField >
       <asp:TemplateField HeaderText = "d_01" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')" ><asp:Label ID = "Label_gwTabela2101" runat = "server" Text = '<%# Eval("d_01")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "borderAll center col_40"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_02" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')" ><asp:Label ID = "Label_gwTabela2102" runat = "server" Text = '<%# Eval("d_02")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "borderAll center col_40"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_03" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')" ><asp:Label ID = "Label_gwTabela2103" runat = "server" Text = '<%# Eval("d_03")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "borderAll center col_40"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_04" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')" ><asp:Label ID = "Label_gwTabela2104" runat = "server" Text = '<%# Eval("d_04")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "borderAll center col_40"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_05" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')" ><asp:Label ID = "Label_gwTabela2105" runat = "server" Text = '<%# Eval("d_05")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "borderAll center col_40"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_06" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')" ><asp:Label ID = "Label_gwTabela2106" runat = "server" Text = '<%# Eval("d_06")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "borderAll center col_40"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_07" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')" ><asp:Label ID = "Label_gwTabela2107" runat = "server" Text = '<%# Eval("d_07")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "borderAll center col_40"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_08" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')" ><asp:Label ID = "Label_gwTabela2108" runat = "server" Text = '<%# Eval("d_08")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "borderAll center col_40"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_09" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')" ><asp:Label ID = "Label_gwTabela2109" runat = "server" Text = '<%# Eval("d_09")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "borderAll center col_40"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_10" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')" ><asp:Label ID = "Label_gwTabela2110" runat = "server" Text = '<%# Eval("d_10")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "borderAll center col_40"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_11" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!2"%>')" ><asp:Label ID = "Label_gwTabela2111" runat = "server" Text = '<%# Eval("d_11")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "borderAll center col_40"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_12" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!2"%>')" ><asp:Label ID = "Label_gwTabela2112" runat = "server" Text = '<%# Eval("d_12")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "borderAll center col_40"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_13" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!13!2"%>')" ><asp:Label ID = "Label_gwTabela2113" runat = "server" Text = '<%# Eval("d_13")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "borderAll center col_40"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_14" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!14!2"%>')" ><asp:Label ID = "Label_gwTabela2114" runat = "server" Text = '<%# Eval("d_14")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "borderAll center col_40"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_15" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!15!2"%>')" ><asp:Label ID = "Label_gwTabela2115" runat = "server" Text = '<%# Eval("d_15")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "borderAll center col_40"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_16" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!16!2"%>')" ><asp:Label ID = "Label_gwTabela2116" runat = "server" Text = '<%# Eval("d_16")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "borderAll center col_40"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_17" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!17!2"%>')" ><asp:Label ID = "Label_gwTabela2117" runat = "server" Text = '<%# Eval("d_17")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "borderAll center col_40"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_18" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!18!2"%>')" ><asp:Label ID = "Label_gwTabela2118" runat = "server" Text = '<%# Eval("d_18")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "borderAll center col_40"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_19" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!19!2"%>')" ><asp:Label ID = "Label_gwTabela2119" runat = "server" Text = '<%# Eval("d_19")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "borderAll center col_40"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_20" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!20!2"%>')" ><asp:Label ID = "Label_gwTabela2120" runat = "server" Text = '<%# Eval("d_20")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "borderAll center col_40"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_21" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!21!2"%>')" ><asp:Label ID = "Label_gwTabela2121" runat = "server" Text = '<%# Eval("d_21")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "borderAll center col_40"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_22" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!22!2"%>')" ><asp:Label ID = "Label_gwTabela2122" runat = "server" Text = '<%# Eval("d_22")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "borderAll center col_40"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_23" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!23!2"%>')" ><asp:Label ID = "Label_gwTabela2123" runat = "server" Text = '<%# Eval("d_23")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "borderAll center col_40"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_24" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!24!2"%>')" ><asp:Label ID = "Label_gwTabela2124" runat = "server" Text = '<%# Eval("d_24")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "borderAll center col_40"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_25" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!25!2"%>')" ><asp:Label ID = "Label_gwTabela2125" runat = "server" Text = '<%# Eval("d_25")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "borderAll center col_40"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_26" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!26!2"%>')" ><asp:Label ID = "Label_gwTabela2126" runat = "server" Text = '<%# Eval("d_26")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "borderAll center col_40"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_27" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!27!2"%>')" ><asp:Label ID = "Label_gwTabela2127" runat = "server" Text = '<%# Eval("d_27")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "borderAll center col_40"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_28" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!28!2"%>')" ><asp:Label ID = "Label_gwTabela2128" runat = "server" Text = '<%# Eval("d_28")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "borderAll center col_40"/>
                </asp:TemplateField>
   
        </Columns>
    </asp:GridView>
<br />
        

                   <br />
        

               </div>
           <div class="page-break">
&nbsp;<asp:Label ID="Label6" runat="server" Text="Informacja o ruchu spraw"></asp:Label>
           &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel3" runat="server" Text="tabela 3" Visible="False"></asp:Label>
           <br />
        


<asp:GridView ID="gwTabela3" runat="server" OnRowCreated="naglowekTabeli_gwTabela3"  AutoGenerateColumns="False"  OnRowDataBound="stopkaTabeli_gwTabela3"  Width = "100%" ShowHeader = "False" ShowFooter = "True"  >
        <Columns>
    <asp:BoundField DataField = "id" HeaderText = "L.p." SortExpression = "id" >
                <ItemStyle Width = "15px" />
                  </asp:BoundField >

                <asp:TemplateField HeaderText = "imie" SortExpression = "imie" >
                                          <ItemTemplate >
                                              <asp:Label ID = "Label14x" runat = "server" Text = '<%# Eval("stanowisko") %>' ></asp:Label >
                                                            </ItemTemplate >
                                                            <ItemStyle  CssClass = "col_60" />
                                                        </asp:TemplateField >
                <asp:TemplateField HeaderText = "imie" SortExpression = "imie" >
                                          <ItemTemplate >
                                              <asp:Label ID = "Label14u" runat = "server" Text = '<%# Eval("funkcja") %>' ></asp:Label >
                                                             </ItemTemplate >
                                                            <ItemStyle  CssClass = "col_60" />
                                                        </asp:TemplateField >

                        <asp:TemplateField HeaderText = "imie" SortExpression = "imie" >
                                          <ItemTemplate >
                                           
                                           <asp:Label ID = "Label15"  runat = "server" Text = '<%# Bind("imie") %>' ></asp:Label >
                                                            </ItemTemplate >
                                                            <ItemStyle  CssClass = "t2_nazwisko" />
                                                        </asp:TemplateField >
                <asp:TemplateField HeaderText = "imie" SortExpression = "imie" >
                                          <ItemTemplate >
                                              <asp:Label ID = "Label14" runat = "server" Text = '<%# Eval("nazwisko") %>' ></asp:Label >
                                           
                                                            </ItemTemplate >
                                                            <ItemStyle  CssClass = "t2_nazwisko" />
                                                        </asp:TemplateField >
       <asp:TemplateField HeaderText = "d_01" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')" ><asp:Label ID = "Label_gwTabela3101" runat = "server" Text = '<%# Eval("d_01")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "borderAll center col_40"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_02" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')" ><asp:Label ID = "Label_gwTabela3102" runat = "server" Text = '<%# Eval("d_02")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "borderAll center col_40"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_03" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')" ><asp:Label ID = "Label_gwTabela3103" runat = "server" Text = '<%# Eval("d_03")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "borderAll center col_40"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_04" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')" ><asp:Label ID = "Label_gwTabela3104" runat = "server" Text = '<%# Eval("d_04")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "borderAll center col_40"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_05" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')" ><asp:Label ID = "Label_gwTabela3105" runat = "server" Text = '<%# Eval("d_05")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "borderAll center col_40"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_06" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')" ><asp:Label ID = "Label_gwTabela3106" runat = "server" Text = '<%# Eval("d_06")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "borderAll center col_40"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_07" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')" ><asp:Label ID = "Label_gwTabela3107" runat = "server" Text = '<%# Eval("d_07")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "borderAll center col_40"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_08" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')" ><asp:Label ID = "Label_gwTabela3108" runat = "server" Text = '<%# Eval("d_08")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "borderAll center col_40"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_09" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')" ><asp:Label ID = "Label_gwTabela3109" runat = "server" Text = '<%# Eval("d_09")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "borderAll center col_40"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_10" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')" ><asp:Label ID = "Label_gwTabela3110" runat = "server" Text = '<%# Eval("d_10")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "borderAll center col_40"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_11" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!2"%>')" ><asp:Label ID = "Label_gwTabela3111" runat = "server" Text = '<%# Eval("d_11")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "borderAll center col_40"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_12" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!2"%>')" ><asp:Label ID = "Label_gwTabela3112" runat = "server" Text = '<%# Eval("d_12")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "borderAll center col_40"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_13" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!13!2"%>')" ><asp:Label ID = "Label_gwTabela3113" runat = "server" Text = '<%# Eval("d_13")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "borderAll center col_40"/>
                </asp:TemplateField>
     
        </Columns>
    </asp:GridView>






                   <br />
        

               </div>
           
           
             <div id="debag" >
          <br />
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
           </div>
    
          </div>
</asp:Content>
