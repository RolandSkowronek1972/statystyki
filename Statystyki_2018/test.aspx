<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="stat2018.test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script src="Scripts/jquery-1.8.3.js"></script>
    <script src="Scripts/rls.js"></script>
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
    <br />
    <br />

    <div id='tab2'>

        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="sprawdzenie plików" />
        <br />
        <br />
        <asp:Label ID="Label2" runat="server"></asp:Label>
        <br />
        <asp:Label ID="Label3" runat="server"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox1" runat="server" Height="165px" TextMode="MultiLine" Width="1012px"></asp:TextBox>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
                 
 <div id='17. Obciążenia administracyjne respondentów' class="page-break" >
 <br/>
 <strong> Dział 17. Obciążenia administracyjne respondentów</strong> 
    <table  style="width: 100%; ">
 <tr>    <td  class="wciecie" colspan="2"> Proszę podać czas (w minutach) przeznaczony na:</td>    
</tr>
  <tr>
    <td  class="borderAll wciecie">przygotowanie danych dla potrzeb wypełnianego formularza</td>
    <td  class=" center borderAll col_120"><a href="javascript:openPopup('popup.aspx?sesja=1!17!1!4')"><asp:Label CssClass="normal" ID="tab_17_w01_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">wypełnienie formularza</td>
    <td  class=" center borderAll col_120"><a href="javascript:openPopup('popup.aspx?sesja=2!17!1!4')"><asp:Label CssClass="normal" ID="tab_17_w02_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
    </table>
 </div>

        









        <div id="debag">

            <br />
            <br />
        </div>
    </div>
</asp:Content>