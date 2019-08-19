<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adm.aspx.cs" Inherits="stat2018.adm" %>
<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register src="UserControlls/Rodzaje.ascx" tagname="Rodzaje" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="ident" EnableTheming="True" Theme="PlasticBlue" Width="100%" OnRowUpdated="zapisDanych">
        <SettingsEditing Mode="Batch">
        </SettingsEditing>
        <EditFormLayoutProperties ColCount="2">
            <Items>
                <dx:GridViewColumnLayoutItem ColumnName="login">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="imie">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="nazwisko">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="login_domenowy">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="admin">
                </dx:GridViewColumnLayoutItem>
                 <dx:GridViewColumnLayoutItem ColumnName="miesieczne">
                </dx:GridViewColumnLayoutItem>
                  <dx:GridViewColumnLayoutItem ColumnName="mss">
                </dx:GridViewColumnLayoutItem>
                  <dx:GridViewColumnLayoutItem ColumnName="kof">
                </dx:GridViewColumnLayoutItem>
  <dx:GridViewColumnLayoutItem ColumnName="kontrolka">
                </dx:GridViewColumnLayoutItem>
  <dx:GridViewColumnLayoutItem ColumnName="wyszukiwarka">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="pracownik">
                </dx:GridViewColumnLayoutItem>
               
            </Items>
        </EditFormLayoutProperties>
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
    
            <dx:GridViewDataCheckColumn FieldName="miesieczne" VisibleIndex="8">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataCheckColumn FieldName="mss" VisibleIndex="9">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataCheckColumn FieldName="kof" VisibleIndex="10">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataCheckColumn FieldName="kontrolka" VisibleIndex="11">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataCheckColumn FieldName="wyszukiwarka" VisibleIndex="12">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataCheckColumn FieldName="pracownik" VisibleIndex="13">
            </dx:GridViewDataCheckColumn>
    
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" DeleteCommand="DELETE FROM uzytkownik WHERE (ident = @ident)" InsertCommand="INSERT INTO uzytkownik(imie, nazwisko, login, password, login_domenowy, admin) VALUES (@imie, @nazwisko, @login, @password, @login_domenowy, @admin)" SelectCommand="SELECT DISTINCT ident, imie, nazwisko, login, password, login_domenowy, admin, (SELECT COUNT(*) AS Expr1 FROM uprawnienia WHERE (rodzaj = 1) AND (id_uzytkownika = uzytkownik.ident)) AS miesieczne, (SELECT COUNT(*) AS Expr1 FROM uprawnienia AS uprawnienia_1 WHERE (rodzaj = 2) AND (id_uzytkownika = uzytkownik.ident)) AS mss, (SELECT COUNT(*) AS Expr1 FROM uprawnienia AS uprawnienia_1 WHERE (rodzaj = 3) AND (id_uzytkownika = uzytkownik.ident)) AS kof, (SELECT COUNT(*) AS Expr1 FROM uprawnienia AS uprawnienia_1 WHERE (rodzaj = 4) AND (id_uzytkownika = uzytkownik.ident)) AS kontrolka, (SELECT COUNT(*) AS Expr1 FROM uprawnienia AS uprawnienia_1 WHERE (rodzaj = 5) AND (id_uzytkownika = uzytkownik.ident)) AS wyszukiwarka, (SELECT COUNT(*) AS Expr1 FROM uprawnienia AS uprawnienia_1 WHERE (rodzaj = 6) AND (id_uzytkownika = uzytkownik.ident)) AS pracownik FROM uzytkownik ORDER BY nazwisko" UpdateCommand="UPDATE uzytkownik SET imie = @imie, nazwisko = @nazwisko, login_domenowy = @login_domenowy, admin = @admin WHERE (login = @login)
UPDATE  uprawnienia SET       id_uzytkownika =@ident,  id_wydzialu =1, rodzaj =@rodzaj">
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
            <asp:Parameter Name="ident" />
            <asp:Parameter Name="rodzaj" />
        </UpdateParameters>
    </asp:SqlDataSource>
  
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
