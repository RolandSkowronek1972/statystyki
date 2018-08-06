<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="stat2018.WebForm2" %>
<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:wcywConnectionString %>" SelectCommand="SELECT  [miejscowosc], [d_kreacji], [d_modyfikacji], [typ], [kraj] FROM [adres]"></asp:SqlDataSource>

          <dx:ASPxGridView ID="ASPxGridView1" runat="server" ClientInstanceName="grid"
            DataSourceID="SqlDataSource1"  AutoGenerateColumns="True" OnDataBound="ASPxGridView1_DataBound">
            <Settings ShowHeaderFilterButton="true"/>
        </dx:ASPxGridView>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [BirthDate] FROM [Employees]"
            InsertCommand="INSERT INTO [Employees] ([EmployeeID], [LastName], [FirstName], [BirthDate]) VALUES (?, ?, ?, ?)"
            UpdateCommand="UPDATE [Employees] SET [LastName] = ?, [FirstName] = ?, [BirthDate] = ? WHERE [EmployeeID] = ?"
            DeleteCommand="DELETE FROM [Employees] WHERE [EmployeeID] = ?">
            <DeleteParameters>
                <asp:Parameter Name="EmployeeID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="EmployeeID" Type="Int32" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="BirthDate" Type="DateTime"></asp:Parameter>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="BirthDate" Type="DateTime" />
                <asp:Parameter Name="EmployeeID" Type="Int32" />
            </UpdateParameters>
        </asp:AccessDataSource>
    </div>
    </form>
</body>
</html>
