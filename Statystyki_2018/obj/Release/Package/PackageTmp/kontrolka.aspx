﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="kontrolka.aspx.cs" Inherits="stat2018.kontrolka" culture="auto" meta:resourcekey="PageResource1" uiculture="auto"  MaintainScrollPositionOnPostback="true" %>

<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <style>#menu {
    position:relative;
}
#menu.scrolling {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
}
         .gridviewWidth {
           /*  width:100%;
             max-width:1150px;*/
         }
         </style>

  
   
    <script src="Scripts/rls.js"></script>

      
    <div class="noprint" style="margin-left:auto; margin-right :auto;">
        <div id="menu" style="background-color: #f7f7f7;">
        <div class="manu_back" style="height: 40px; margin: 0 auto 0 auto; position:relative;  width: 1050px;    left: 0px;">
            
            <table >
                <tr>
                    
                    <td style="padding:0 5px 0 5px" >Data od :</td>
                 
                    <td style="padding:0 5px 0 5px" >
                        <dx:ASPxDateEdit ID="data1" runat="server" Width="100%" meta:resourcekey="data1Resource1" Theme="Moderno"></dx:ASPxDateEdit>
                    </td>
                  
                    <td style="padding:0 5px 0 5px">Data do :</td>
                  
                    <td style="padding:0 5px 0 5px">
                        <dx:ASPxDateEdit ID="data2" runat="server" Width="100%" meta:resourcekey="data2Resource1" Theme="Moderno">                        </dx:ASPxDateEdit>
                    </td>
                  
                    <td style="padding:0 5px 0 5px"><asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn_search" OnClick="szukaj" meta:resourcekey="LinkButton1Resource1">Szukaj</asp:LinkButton> </td>
                   
                    <td style="padding:0 5px 0 5px">
                        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn_search" OnClick="Druk" meta:resourcekey="LinkButton2Resource1">Drukuj</asp:LinkButton>
                    </td>
                </tr>

            </table>
           


        </div>
            </div> 
    </div>

    

        <div >
      
          <dx:ASPxGridView ID="ASPxGridView1" runat="server" ClientInstanceName="grid"  AutoGenerateColumns="False" Theme="Moderno" EnableCallbackAnimation="True" OnDataBinding="GridDataBinding" ViewStateMode="Disabled" >
              <SettingsPager AlwaysShowPager="True" NumericButtonCount="200" PageSize="1000">
              </SettingsPager>
            <Settings ShowFilterRow="True" EnableFilterControlPopupMenuScrolling="True" ShowFilterBar="Auto" ShowFilterRowMenu="True" ShowGroupFooter="VisibleAlways"/>
              <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
              <Styles>
                  <Header Wrap="True">
                  </Header>
                  <Cell Wrap="False">
                  </Cell>
              </Styles>
        </dx:ASPxGridView>
        
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="SELECT TOP (0) ident, nazwa, rodzaj FROM funkcje"></asp:SqlDataSource>

         
                   <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="ASPxGridView1" PaperKind="A4" ExportedRowType="All" PrintSelectCheckBox="True">
                       <Styles>
                           <Header Wrap="True">
                           </Header>
                       </Styles>
            </dx:ASPxGridViewExporter>

            
       </div>
      <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1"></asp:Label>





</asp:Content>

