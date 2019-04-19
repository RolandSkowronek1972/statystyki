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
    
<div id="2.1.1.a" class="page-break">
              <strong>Dział 2.1.1.a</strong> Sprawy zawieszone nie zakreślone od dnia pierwotnego wpisu do repertorium (wykazane w dziale 2.1.1.) (łącznie z czasem trwania mediacji)
             <table  style="width: 100%; ">
                  <tr>
                      <td class="center borderAll" rowspan="2" colspan="2">SPRAWY według
                          <br />
                          repertoriów</td>
                      <td class="center borderAll" rowspan="2">Symbol </td>
                      <td class="center borderAll" rowspan="2">Lp.</td>
                      <td class="center borderAll" colspan="11">Liczba spraw niezałatwionych pozostających od daty pierwszego wpływu do sądu</td>
                  </tr>
                  <tr>
                      <td class="center borderAll">razem (kol. 2, 3)</td>
                      <td class="center borderAll">do 3 miesięcy</td>
                      <td class="center borderAll">suma powyżej 3 miesięcy (kol. od 4 do 6)</td>
                      <td class="center borderAll">powyżej 3 do 6 miesięcy </td>
                      <td class="center borderAll">powyżej 6 do 12 miesięcy</td>
                      <td class="center borderAll">suma powyżej 12 miesięcy (kol. od 7 do 11)</td>
                      <td class="center borderAll">powyżej 12 miesięcy do 2 lat</td>
                      <td class="center borderAll">powyżej 2 do 3 lat</td>
                      <td class="center borderAll">powyżej 3 do 5 lat</td>
                      <td class="center borderAll">powyżej 5 do 8 lat</td>
                      <td class="center borderAll">ponad 8 lat</td>
                  </tr>
                  <tr>
                      <td class="center borderAll" colspan="4">0</td>
                      <td class="center borderAll">1</td>
                      <td class="center borderAll">2</td>
                      <td class="center borderAll">3</td>
                      <td class="center borderAll">4</td>
                      <td class="center borderAll">5</td>
                      <td class="center borderAll">6</td>
                      <td class="center borderAll">7</td>
                      <td class="center borderAll">8</td>
                      <td class="center borderAll">9</td>
                      <td class="center borderAll">10</td>
                      <td class="center borderAll">11</td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" colspan="2">ogółem</td>
                      <td class="borderAll wciecie">--</td>
                      <td class="borderAll col_36">1</td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.a!1!4')">
                          <asp:Label ID="tab_2_11_a_w01_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.a!2!4')">
                          <asp:Label ID="tab_2_11_a_w01_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.a!3!4')">
                          <asp:Label ID="tab_2_11_a_w01_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.a!4!4')">
                          <asp:Label ID="tab_2_11_a_w01_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.a!5!4')">
                          <asp:Label ID="tab_2_11_a_w01_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.a!6!4')">
                          <asp:Label ID="tab_2_11_a_w01_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.a!7!4')">
                          <asp:Label ID="tab_2_11_a_w01_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.a!8!4')">
                          <asp:Label ID="tab_2_11_a_w01_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.a!9!4')">
                          <asp:Label ID="tab_2_11_a_w01_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.a!10!4')">
                          <asp:Label ID="tab_2_11_a_w01_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!2.1.1.a!11!4')">
                          <asp:Label ID="tab_2_11_a_w01_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie" rowspan="4">w tym</td>
                      <td class="borderAll wciecie">RC</td>
                      <td class="borderAll wciecie">--</td>
                      <td class="borderAll col_36">2</td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.a!1!4')">
                          <asp:Label ID="tab_2_11_a_w02_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.a!2!4')">
                          <asp:Label ID="tab_2_11_a_w02_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.a!3!4')">
                          <asp:Label ID="tab_2_11_a_w02_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.a!4!4')">
                          <asp:Label ID="tab_2_11_a_w02_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.a!5!4')">
                          <asp:Label ID="tab_2_11_a_w02_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.a!6!4')">
                          <asp:Label ID="tab_2_11_a_w02_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.a!7!4')">
                          <asp:Label ID="tab_2_11_a_w02_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.a!8!4')">
                          <asp:Label ID="tab_2_11_a_w02_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.a!9!4')">
                          <asp:Label ID="tab_2_11_a_w02_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.a!10!4')">
                          <asp:Label ID="tab_2_11_a_w02_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!2.1.1.a!11!4')">
                          <asp:Label ID="tab_2_11_a_w02_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">RNs</td>
                      <td class="borderAll wciecie">--</td>
                      <td class="borderAll col_36">3</td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.a!1!4')">
                          <asp:Label ID="tab_2_11_a_w03_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.a!2!4')">
                          <asp:Label ID="tab_2_11_a_w03_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.a!3!4')">
                          <asp:Label ID="tab_2_11_a_w03_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.a!4!4')">
                          <asp:Label ID="tab_2_11_a_w03_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.a!5!4')">
                          <asp:Label ID="tab_2_11_a_w03_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.a!6!4')">
                          <asp:Label ID="tab_2_11_a_w03_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.a!7!4')">
                          <asp:Label ID="tab_2_11_a_w03_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.a!8!4')">
                          <asp:Label ID="tab_2_11_a_w03_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.a!9!4')">
                          <asp:Label ID="tab_2_11_a_w03_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.a!10!4')">
                          <asp:Label ID="tab_2_11_a_w03_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!2.1.1.a!11!4')">
                          <asp:Label ID="tab_2_11_a_w03_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                  <tr>
                      <td class="borderAll wciecie">Nsm</td>
                      <td class="borderAll wciecie">--</td>
                      <td class="borderAll col_36">4</td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.1.a!1!4')">
                          <asp:Label ID="tab_2_11_a_w04_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.1.a!2!4')">
                          <asp:Label ID="tab_2_11_a_w04_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.1.a!3!4')">
                          <asp:Label ID="tab_2_11_a_w04_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.1.a!4!4')">
                          <asp:Label ID="tab_2_11_a_w04_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.1.a!5!4')">
                          <asp:Label ID="tab_2_11_a_w04_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.1.a!6!4')">
                          <asp:Label ID="tab_2_11_a_w04_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.1.a!7!4')">
                          <asp:Label ID="tab_2_11_a_w04_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.1.a!8!4')">
                          <asp:Label ID="tab_2_11_a_w04_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.1.a!9!4')">
                          <asp:Label ID="tab_2_11_a_w04_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.1.a!10!4')">
                          <asp:Label ID="tab_2_11_a_w04_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!2.1.1.a!11!4')">
                          <asp:Label ID="tab_2_11_a_w04_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                  </tr>
                 <tr>
                      <td class="borderAll wciecie">Nkd</td>
                      <td class="borderAll wciecie">--</td>
                      <td class="borderAll col_36">4</td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.1.a!1!4')">
                          <asp:Label ID="tab_2_11_a_w05_c01" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.1.a!2!4')">
                          <asp:Label ID="tab_2_11_a_w05_c02" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.1.a!3!4')">
                          <asp:Label ID="tab_2_11_a_w05_c03" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.1.a!4!4')">
                          <asp:Label ID="tab_2_11_a_w05_c04" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.1.a!5!4')">
                          <asp:Label ID="tab_2_11_a_w05_c05" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.1.a!6!4')">
                          <asp:Label ID="tab_2_11_a_w05_c06" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.1.a!7!4')">
                          <asp:Label ID="tab_2_11_a_w05_c07" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.1.a!8!4')">
                          <asp:Label ID="tab_2_11_a_w05_c08" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.1.a!9!4')">
                          <asp:Label ID="tab_2_11_a_w05_c09" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.1.a!10!4')">
                          <asp:Label ID="tab_2_11_a_w05_c10" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>
                      <td class="col_90 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!2.1.1.a!11!4')">
                          <asp:Label ID="tab_2_11_a_w05_c11" runat="server" CssClass="normal" Text="0"></asp:Label>
                          </a></td>

                 </tr>
              </table>
          </div>
  
            
       



 <div id='Dział 1.2.b. Struktura załatwień spraw' class="page-break" >
 <br/>
     <strong> Dział 1.2.b. Struktura załatwień spraw</strong> 
    <table  style="width: 100%; ">
<tr>    
     <td  class="center borderAll" colspan="4" rowspan="3"> Wyszczególnienie</td>    <td class="center borderAll" colspan="7"> Repertorium / wykaz</td>
</tr>
 <tr>    <td class="center borderAll" rowspan="2"> Ogółem</td>
<td class="center borderAll" colspan="6">wtym</td>
</tr>
 <tr>    
<td class="center borderAll">RC</td>
<td class="center borderAll">RNs</td>
<td class="center borderAll">Nsm</td>
<td class="center borderAll">RCo</td>
<td class="center borderAll">Nmo</td>
<td class="center borderAll">Nkd</td>
</tr>
 <tr>    <td  class="center borderAll" colspan="4">0</td>    <td class="center borderAll">1</td>
<td class="center borderAll">2</td>
<td class="center borderAll">3</td>
<td class="center borderAll">4</td>
<td class="center borderAll">5</td>
<td class="center borderAll">6</td>
<td class="center borderAll">7</td>
</tr>
  <tr>
    <td  class="borderAll wciecie" colspan="3">Załatwiono ogółem (w.01 = dz.1.1.1. kol.3 + dz. 1.1.2. kol. 4 odpowiednie wiersze = w.02+23)</td>
  <td  class="borderAll col_36">1</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w01_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w01_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w01_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w01_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w01_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w01_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w01_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" rowspan="21">W tym szczególne rodzaje załatwień</td>
    <td  class="borderAll wciecie" colspan="2">razem (w. 02 = w.03 do 22)</td>
  <td  class="borderAll col_36">2</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w02_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w02_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w02_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w02_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w02_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w02_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w02_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">zwrot pozwu/wniosku/skargi (art. 130 kpc)</td>
  <td  class="borderAll col_36">3</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w03_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w03_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w03_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w03_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w03_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w03_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w03_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">zwrot pozwu/wniosku/skargi (art. 1301 kpc)</td>
  <td  class="borderAll col_36">4</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w04_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w04_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w04_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w04_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w04_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w04_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w04_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">przekazanie do innych jednostek na podstawie art. 200§1 kpc (z wyjątkiem zmian organizacyjnych)</td>
  <td  class="borderAll col_36">5</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w05_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w05_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w05_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w05_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w05_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w05_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w05_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">zakończono w trybie art. 339 kpc</td>
  <td  class="borderAll col_36">6</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w06_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w06_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w06_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w06_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w06_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w06_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w06_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">zakończono w trybie art. 341 kpc</td>
  <td  class="borderAll col_36">7</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w07_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w07_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w07_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w07_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w07_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w07_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=7!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w07_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">w wyniku zmian zarządzenia MS o biurowości</td>
  <td  class="borderAll col_36">8</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w08_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w08_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w08_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w08_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w08_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w08_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=8!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w08_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">w wyniku przekazania sprawy w ramach sądu pomiędzy wydziałami tego samego pionu</td>
  <td  class="borderAll col_36">9</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w09_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w09_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w09_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w09_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w09_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w09_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=9!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w09_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">w wyniku przekazania sprawy w ramach sądu pomiędzy wydziałami różnych pionów</td>
  <td  class="borderAll col_36">10</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w10_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w10_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w10_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w10_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w10_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w10_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=10!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w10_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" rowspan="2">zmiany organizacyjne związane z utworzeniem lub likwidacją</td>
    <td  class="borderAll wciecie">wydziału (łów) / sekcji </td>
  <td  class="borderAll col_36">11</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w11_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w11_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w11_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w11_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w11_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w11_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=11!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w11_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">sądu (dów)</td>
  <td  class="borderAll col_36">12</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w12_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w12_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w12_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w12_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w12_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w12_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=12!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w12_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" rowspan="2">w związku ze zmianą obszaru właściwości miejscowej</td>
    <td  class="borderAll wciecie">wydziału (łów)</td>
  <td  class="borderAll col_36">13</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w13_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w13_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w13_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w13_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w13_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w13_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=13!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w13_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">sądu (dów)</td>
  <td  class="borderAll col_36">14</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w14_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w14_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w14_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w14_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w14_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w14_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=14!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w14_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">połączono do łącznego rozpoznania na podstawie art. 219 kpc</td>
  <td  class="borderAll col_36">15</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w15_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w15_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w15_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w15_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w15_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w15_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=15!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w15_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">przekazanie do innego trybu na podstawie art. 201§1 i 2 kpc lub do odrębnego postępowania</td>
  <td  class="borderAll col_36">16</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w16_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w16_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w16_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w16_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w16_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w16_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=16!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w16_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">zakreślono na podstawie art. 174 §1 pkt 1 kpc</td>
  <td  class="borderAll col_36">17</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w17_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w17_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w17_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w17_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w17_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w17_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=17!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w17_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">umorzenie na skutek cofnięcia pozwu, wniosku, skargi</td>
  <td  class="borderAll col_36">18</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w18_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w18_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w18_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w18_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w18_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w18_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=18!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w18_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">zakończono w trybie art.1481 §1 kpc</td>
  <td  class="borderAll col_36">19</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w19_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w19_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w19_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w19_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w19_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w19_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=19!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w19_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" rowspan="2">zakreślenie spraw </td>
    <td  class="borderAll wciecie">w związku z funkcjonowaniem § 43 Regulaminu</td>
  <td  class="borderAll col_36">20</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w20_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w20_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w20_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w20_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w20_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w20_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=20!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w20_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">w związku ze wspólnym wpływem § 54 ust.2 Regulaminu</td>
  <td  class="borderAll col_36">21</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w21_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w21_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w21_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w21_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w21_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w21_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=21!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w21_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">inne formalne (w tym odrzucenia pozwu/wniosku/skargi) (= w.16 k.3 + w.17 k.3 dz.1.2.2.)</td>
  <td  class="borderAll col_36">22</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w22_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w22_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w22_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w22_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w22_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w22_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=22!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w22_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="3">Załatwienia merytoryczne pozostałych spraw</td>
  <td  class="borderAll col_36">23</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w23_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w23_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w23_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w23_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w23_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w23_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=23!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w23_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="3">Pozostało na okres następny (w.24 = dz.1.1.1. kol.18 + dz. 1.1.2. kol. 6 odpowiednie wiersze)</td>
  <td  class="borderAll col_36">24</td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.b!1!4')"><asp:Label CssClass="normal" ID="tab_12b_w24_c01" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.b!2!4')"><asp:Label CssClass="normal" ID="tab_12b_w24_c02" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.b!3!4')"><asp:Label CssClass="normal" ID="tab_12b_w24_c03" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.b!4!4')"><asp:Label CssClass="normal" ID="tab_12b_w24_c04" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.b!5!4')"><asp:Label CssClass="normal" ID="tab_12b_w24_c05" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.b!6!4')"><asp:Label CssClass="normal" ID="tab_12b_w24_c06" runat="server" Text="0"></asp:Label></a></td>
    <td  class="col_60 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=24!1.2.b!7!4')"><asp:Label CssClass="normal" ID="tab_12b_w24_c07" runat="server" Text="0"></asp:Label></a></td>
  </tr>
    </table>
 </div>

        <div id="debag">

            <br />
            <br />
        </div>
    </div>
</asp:Content>