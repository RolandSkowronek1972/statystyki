﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="kontrolkaX.aspx.cs" Inherits="stat2018.kontrolkaX"  MaintainScrollPositionOnPostback="true" %>

<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <script src="Scripts/jquery-1.8.3.js"></script>
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
                  
                    <td style="padding:0 5px 0 5px"><asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn_search" OnClick="szukaj">Szukaj</asp:LinkButton> </td>
                   
                    <td style="padding:0 5px 0 5px">
                        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn_search" OnClick="Druk" meta:resourcekey="LinkButton2Resource1">Drukuj</asp:LinkButton>
                    </td>
                </tr>

            </table>
           


        </div>
            </div>
          <div class="container ">
            <br />
            <br />
            <dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="SqlDataSource1" EnableTheming="True" Theme="Moderno" Width="100%">
                <SettingsPager PageSize="300">
                </SettingsPager>
                <Settings ShowFilterRow="True" ShowFilterBar="Auto" />
                <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
            </dx:ASPxGridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
            <br />
            <br />
            </div> 
    </div>


</asp:Content>
