﻿<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="aopcN.aspx.cs" Inherits="stat2018.aopcN" %>

<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.15.0,  Culture=neutral,  PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


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
                 
                 
                 size: 29cm 21.7cm;
                  margin: 0mm 0mm 0mm 0mm;
               
              }

              div {
                  transform: translate(0, 0);
                  -webkit-transform: translate(0, 0 ); /* Saf3.1+, Chrome */
                  -moz-transform: translate(0, 0); /* FF3.5+ */
                
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
                  <td style="width:auto;padding-left:5px;">
                  <input id="Button1" class="ax_box" style="border-style: none; padding: 0px" type="button" onclick="JavaScript: window.print();" value="Drukuj" /></td>
            </td>
           
            <td style="width:auto;padding-left:5px;">
                 <asp:LinkButton ID="LinkButton57" runat="server" CssClass="ax_box" OnClick="tworzPlikExcell">Zapisz do Excel</asp:LinkButton>
            </td>
        </tr>
    
    </table>
      </div>
       <div  margin: 0 auto 0 auto; position:relative;top:30px;" >
             <div style="margin-left:auto;margin-right:auto;text-align: center; width:auto; "> 
            <asp:Label ID="LabelNazwaSadu" runat="server" Text="Sąd " style="font-weight: 700"></asp:Label>
     <br />
         </div> 
  
           <br />
               <div style="margin-left:auto; margin-right:auto; display:table;">
&nbsp;<asp:Label ID="Label1" runat="server" Text="Uzasadnienia"></asp:Label>
           &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel1" runat="server" Text="tabela  1" Visible="False"></asp:Label>
           <br />
                    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" OnCustomSummaryCalculate="Suma" Theme="MetropolisBlue">
                        <SettingsPager PageSize="10100">
                        </SettingsPager>
                        <Settings HorizontalScrollBarMode="Visible" />
      
                        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
     
				<Settings ShowFooter="True" />
                        <Styles>
                            <Footer CssClass="borderAll  gray" HorizontalAlign="Center">
                            </Footer>
                        
            <AlternatingRow BackColor="#DCDCDC">
            </AlternatingRow>
        </Styles>
                   </dx:ASPxGridView>

                   <br />
    
               </div>
           <br />
         
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
    
</asp:Content>
