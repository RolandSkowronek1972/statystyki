<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adm.aspx.cs" Inherits="stat2018.adm" %>
<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="ident" EnableTheming="True" Theme="PlasticBlue" Width="100%">
        <SettingsEditing Mode="Batch">
        </SettingsEditing>
        <Columns>
            <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="ident" VisibleIndex="2" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="imie" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="nazwisko" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="login" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="password" VisibleIndex="5" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="login_domenowy" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn FieldName="admin" ShowInCustomizationForm="True" VisibleIndex="7">
            </dx:GridViewDataCheckColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" DeleteCommand="DELETE FROM uzytkownik WHERE (ident = @ident)" InsertCommand="INSERT INTO uzytkownik(imie, nazwisko, login, password, login_domenowy, admin) VALUES (@imie, @nazwisko, @login, @password, @login_domenowy, @admin)" SelectCommand="SELECT DISTINCT * FROM [uzytkownik] ORDER BY [nazwisko]" UpdateCommand="UPDATE uzytkownik SET imie = @imie, nazwisko = @nazwisko, login_domenowy = @login_domenowy, admin = @admin WHERE (login = @login)">
        <DeleteParameters>
            <asp:Parameter Name="ident" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="imie" />
            <asp:Parameter Name="nazwisko" />
            <asp:Parameter Name="login" />
            <asp:Parameter Name="password" />
            <asp:Parameter Name="login_domenowy" />
            <asp:Parameter Name="admin" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="imie" />
            <asp:Parameter Name="nazwisko" />
            <asp:Parameter Name="login_domenowy" />
            <asp:Parameter Name="admin" />
            <asp:Parameter Name="login" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <br />
    <br />
</asp:Content>
