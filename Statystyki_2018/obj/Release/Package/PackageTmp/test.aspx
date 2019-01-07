<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="stat2018.test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


      <script src="Scripts/jquery-1.8.3.js"></script>
       <script src="Scripts/rls.js"></script>
      <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
      <br />
<br/>


   <div id='tab2' >
  
   
       <asp:GridView ID="GridView1" runat="server" OnRowCreated="GridView1_RowCreated" OnRowDataBound="GridView1_RowDataBound">
       </asp:GridView>
  
   
       <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="sprawdzenie plików" />
       <br />
       <br />
       <asp:Label ID="Label2" runat="server"></asp:Label>
       <br />
       <asp:Label ID="Label3" runat="server"></asp:Label>
       <br />
       <br />

        
        
        
        
        <br />
       <br />
  
   
   </div>



</asp:Content>
