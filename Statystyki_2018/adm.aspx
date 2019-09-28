<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adm.aspx.cs" Inherits="stat2018.adm" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register src="UserControlls/ZarzadzanieFormularzami.ascx" tagname="ZarzadzanieFormularzami" tagprefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableTheming="True" KeyFieldName="ident" Theme="PlasticBlue" Width="100%" OnStartRowEditing="startEdycji">
        <SettingsEditing Mode="EditForm">
        </SettingsEditing>
        <Settings ShowFilterRow="True" />
          <Templates>
        <EditForm>
              <dx:ASPxGridViewTemplateReplacement ID="Editors" ReplacementType="EditFormEditors"
                                            runat="server">
                                        </dx:ASPxGridViewTemplateReplacement>
    <uc3:ZarzadzanieFormularzami ID="ZarzadzanieFormularzami1" runat="server" />      
            
                <div style="text-align: right; padding: 2px">
                    <dx:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                        runat="server">
                    </dx:ASPxGridViewTemplateReplacement>
                    <dx:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                        runat="server">
                    </dx:ASPxGridViewTemplateReplacement>
                </div>
        </EditForm>
    </Templates>
        <SettingsBehavior ConfirmDelete="True" />
        <EditFormLayoutProperties ColCount="5">
            <Items>
                <dx:GridViewColumnLayoutItem ColumnName="imie">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="nazwisko">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="login">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="login_domenowy">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="admin">
                </dx:GridViewColumnLayoutItem>
                <dx:EditModeCommandLayoutItem ColSpan="2" HorizontalAlign="Right">
                </dx:EditModeCommandLayoutItem>
            </Items>
        </EditFormLayoutProperties>
        <Columns>
            <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0" ShowCancelButton="True" ShowNewButton="True" ShowUpdateButton="True">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="ident" ReadOnly="True" Visible="False" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="imie" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="nazwisko" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="login" ReadOnly="True" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="password" Visible="False" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="login_domenowy" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn FieldName="admin" VisibleIndex="7">
            </dx:GridViewDataCheckColumn>
        </Columns>
    </dx:ASPxGridView>
    <div style="max-height:1px; height: 1px; width: 1px;">
   </div>
        <br />
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
    <br />
    <br />
</asp:Content>