<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="stat2018.WebForm1" %>
<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">





    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Settings ShowFilterRow="True" />
        <Columns>
            <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="ident" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ulica" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="numer" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="kod" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="d_kreacji" VisibleIndex="5">
                <SettingsHeaderFilter Mode="DateRangeCalendar">
                </SettingsHeaderFilter>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="d_modyfikacji" VisibleIndex="6">
                 <SettingsHeaderFilter Mode="DateRangeCalendar">
                </SettingsHeaderFilter>
            </dx:GridViewDataDateColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:wcywConnectionString %>" SelectCommand="SELECT [ident], [ulica], [numer], [kod], [d_kreacji], [d_modyfikacji] FROM [adres]"></asp:SqlDataSource>





</asp:Content>
