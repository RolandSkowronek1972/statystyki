﻿<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="stat2018.test" %>

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
        <table style="width: 100%; "> 
   <tr> 
  <td class="col_200 borderAll wciecie"> 
      &nbsp;</td > 
  <td class="borderAll center"> 
  </td > 
  <td class="borderAll center"> 
      &nbsp;</td > 
  <td class="borderAll center"> 
      wpływ</td > 
  <td class="borderAll center"> 
      załatwienia</td > 
  <td class="borderAll center"> 
      pozostałość</td > 
  <td> 
  </td > 
  <td> 
      &nbsp;</td > 
  <td class="borderAll center"> 
      Ogółem</td > 
  <td class="borderAll center"> 
      Pow. 12 m-cy</td > 
   </tr> 
   <tr> 
  <td class="col_200 borderAll wciecie"> 
      wskaźnik opanowania wpływu spraw rozpatrywanych przez sądy I instancji</td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!1!1!3')"><asp:Label CssClass="normal" ID="tab_1_w01_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll gray"> 
      Cywilny</td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!1!2!3')"><asp:Label CssClass="normal" ID="tab_1_w01_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!1!3!3')"><asp:Label CssClass="normal" ID="tab_1_w01_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!1!4!3')"><asp:Label CssClass="normal" ID="tab_1_w01_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!1!5!3')"><asp:Label CssClass="normal" ID="tab_1_w01_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll gray"> 
      C</td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!1!6!3')"><asp:Label CssClass="normal" ID="tab_1_w01_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!1!7!3')"><asp:Label CssClass="normal" ID="tab_1_w01_c07" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="col_200 borderAll wciecie"> 
      średni czas trwania postępowania w sprawach cywilnych, pracy, rodzinnych, ubezpieczeń spłecznych, karnych i gospodarczych (z wyłączeniem spraw wieczystoksięgowych i rejestrowych)(w miesiącach)</td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!1!1!3')"><asp:Label CssClass="normal" ID="tab_1_w02_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll gray"> 
      Karny</td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!1!2!3')"><asp:Label CssClass="normal" ID="tab_1_w02_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!1!3!3')"><asp:Label CssClass="normal" ID="tab_1_w02_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!1!4!3')"><asp:Label CssClass="normal" ID="tab_1_w02_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!1!5!3')"><asp:Label CssClass="normal" ID="tab_1_w02_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll gray"> 
      Ns</td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!1!6!3')"><asp:Label CssClass="normal" ID="tab_1_w02_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!1!7!3')"><asp:Label CssClass="normal" ID="tab_1_w02_c07" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="col_200 borderAll wciecie"> 
      odsetek spraw rozpatrywanych przez sądy I instancji, w których czas trwania postępowania przekracza 12 m-cy</td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!1!1!3')"><asp:Label CssClass="normal" ID="tab_1_w03_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll gray"> 
      Pracy</td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!1!2!3')"><asp:Label CssClass="normal" ID="tab_1_w03_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!1!3!3')"><asp:Label CssClass="normal" ID="tab_1_w03_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!1!4!3')"><asp:Label CssClass="normal" ID="tab_1_w03_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!1!5!3')"><asp:Label CssClass="normal" ID="tab_1_w03_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll gray"> 
      Nc</td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!1!6!3')"><asp:Label CssClass="normal" ID="tab_1_w03_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!1!7!3')"><asp:Label CssClass="normal" ID="tab_1_w03_c07" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="col_200 borderAll wciecie"> 
      liczba etatów asystenckich na etat sędziego</td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!1!1!3')"><asp:Label CssClass="normal" ID="tab_1_w04_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll gray"> 
      Rodzinny</td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!1!2!3')"><asp:Label CssClass="normal" ID="tab_1_w04_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!1!3!3')"><asp:Label CssClass="normal" ID="tab_1_w04_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!1!4!3')"><asp:Label CssClass="normal" ID="tab_1_w04_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!1!5!3')"><asp:Label CssClass="normal" ID="tab_1_w04_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll gray"> 
      K</td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!1!6!3')"><asp:Label CssClass="normal" ID="tab_1_w04_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!1!7!3')"><asp:Label CssClass="normal" ID="tab_1_w04_c07" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="col_200 borderAll wciecie"> 
      liczba spraw (w wybranych kategoriach) załatwionych przez referendarzy przypadająca na jeden etat referendarski</td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=5!1!1!3')"><asp:Label CssClass="normal" ID="tab_1_w05_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll gray"> 
      &nbsp;</td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=5!1!2!3')"><asp:Label CssClass="normal" ID="tab_1_w05_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=5!1!3!3')"><asp:Label CssClass="normal" ID="tab_1_w05_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=5!1!4!3')"><asp:Label CssClass="normal" ID="tab_1_w05_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=5!1!5!3')"><asp:Label CssClass="normal" ID="tab_1_w05_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll gray"> 
      Kp</td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=5!1!6!3')"><asp:Label CssClass="normal" ID="tab_1_w05_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=5!1!7!3')"><asp:Label CssClass="normal" ID="tab_1_w05_c07" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="col_200 borderAll wciecie"> 
      liczba spraw zakończonych w okresie sprawozdawczym przypadających na jednego kuratora zawodowego</td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=6!1!1!3')"><asp:Label CssClass="normal" ID="tab_1_w06_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll gray"> 
      Kw</td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=6!1!2!3')"><asp:Label CssClass="normal" ID="tab_1_w06_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=6!1!3!3')"><asp:Label CssClass="normal" ID="tab_1_w06_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=6!1!4!3')"><asp:Label CssClass="normal" ID="tab_1_w06_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=6!1!5!3')"><asp:Label CssClass="normal" ID="tab_1_w06_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll gray"> 
      W</td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=6!1!6!3')"><asp:Label CssClass="normal" ID="tab_1_w06_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=6!1!7!3')"><asp:Label CssClass="normal" ID="tab_1_w06_c07" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="col_200 borderAll wciecie"> 
      liczba osób, wobec których sądy orzekły wypłatę odszkodowań za naruszenie prawa strony do rozpoznania sprawy w postępowaniu sądowym bez nieuzasadnionej zwłoki</td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=7!1!1!3')"><asp:Label CssClass="normal" ID="tab_1_w07_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll gray"> 
      Bez kw</td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=7!1!2!3')"><asp:Label CssClass="normal" ID="tab_1_w07_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=7!1!3!3')"><asp:Label CssClass="normal" ID="tab_1_w07_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=7!1!4!3')"><asp:Label CssClass="normal" ID="tab_1_w07_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=7!1!5!3')"><asp:Label CssClass="normal" ID="tab_1_w07_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll gray"> 
      P.Np.</td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=7!1!6!3')"><asp:Label CssClass="normal" ID="tab_1_w07_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=7!1!7!3')"><asp:Label CssClass="normal" ID="tab_1_w07_c07" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="col_200 borderAll wciecie"> 
      wskaźnik opanowania wpływu głównych kategorii spraw rozpatrywanych przez sądy I instancji*</td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=8!1!1!3')"><asp:Label CssClass="normal" ID="tab_1_w08_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll gray"> 
      Suma</td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=8!1!2!3')"><asp:Label CssClass="normal" ID="tab_1_w08_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=8!1!3!3')"><asp:Label CssClass="normal" ID="tab_1_w08_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=8!1!4!3')"><asp:Label CssClass="normal" ID="tab_1_w08_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=8!1!5!3')"><asp:Label CssClass="normal" ID="tab_1_w08_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll gray"> 
      RC</td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=8!1!6!3')"><asp:Label CssClass="normal" ID="tab_1_w08_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=8!1!7!3')"><asp:Label CssClass="normal" ID="tab_1_w08_c07" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="col_200 borderAll wciecie"> 
      odsetek spraw rozpatrywanych przez sądy I instancji, w których czas trwania postępowania przekracza 3 lata</td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=9!1!1!3')"><asp:Label CssClass="normal" ID="tab_1_w09_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class=" "> 
      &nbsp;</td>
  <td class=" "> 
      &nbsp;</td>
  <td class=" "> 
      &nbsp;</td>
  <td class=" "> 
      &nbsp;</td>
  <td class=" "> 
      &nbsp;</td>
  <td class="col_81 borderAll gray"> 
      RNs</td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=9!1!6!3')"><asp:Label CssClass="normal" ID="tab_1_w09_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=9!1!7!3')"><asp:Label CssClass="normal" ID="tab_1_w09_c07" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="col_200 borderAll wciecie"> 
      odsetek spraw skierowanych do mediacji w stosunku do wszystkich spraw wpływających do sądu, w których mediacja może być zastosowana</td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=10!1!1!3')"><asp:Label CssClass="normal" ID="tab_1_w10_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class=" "> 
      &nbsp;</td>
  <td class=" "> 
      &nbsp;</td>
  <td class=" "> 
      &nbsp;</td>
  <td class=" "> 
      &nbsp;</td>
  <td class=" "> 
      &nbsp;</td>
  <td class="col_81 borderAll gray"> 
      Nsm</td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=10!1!6!3')"><asp:Label CssClass="normal" ID="tab_1_w10_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=10!1!7!3')"><asp:Label CssClass="normal" ID="tab_1_w10_c07" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="col_200 borderAll wciecie"> 
      &nbsp;</td>
  <td class="col_81 borderAll"> 
      &nbsp;</td>
  <td class=" "> 
      &nbsp;</td>
  <td class=" "> 
      &nbsp;</td>
  <td class=" "> 
      &nbsp;</td>
  <td class=" "> 
      &nbsp;</td>
  <td class=" "> 
      &nbsp;</td>
  <td class="col_81 borderAll gray"> 
      Ogółem</td>
 <td class="col_81 borderAll gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=11!1!6!3')"><asp:Label CssClass="normal" ID="tab_1_w11_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=11!1!7!3')"><asp:Label CssClass="normal" ID="tab_1_w11_c07" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   </tr> 
   <tr> 
  <td class=" "> 
      &nbsp;</td>
  <td class=" "> 
      &nbsp;</td>
  <td class=" "> 
      &nbsp;</td>
  <td class=" "> 
      &nbsp;</td>
  <td class=" "> 
      &nbsp;</td>
  <td class=" "> 
      &nbsp;</td>
  <td class=" "> 
      &nbsp;</td>
  <td> 
      &nbsp;</td>
 <td> 
     &nbsp;</td>
  <td> 
      &nbsp;</td>
   </tr> 
   </table>
        <br />
        <br />
  <div id='Zastosowanie środków zapobiegania i zwalczania demoralizacji i przestępczości nieletnich (art. 26 i 27 ustawy)*)' class="page-break" >
 <br/>
 <strong> Dział Zastosowanie środków zapobiegania i zwalczania demoralizacji i przestępczości nieletnich (art. 26 i 27 ustawy)*)</strong> 
    <table  style="width: 100%; ">
 <tr>    <td  class="center borderAll" colspan="3"> Wyszczególnienie</td>    <td class="center borderAll"> Liczba</td>
</tr>
 <tr>    <td  class="center borderAll" colspan="3">0</td>    <td class="center borderAll">1</td>
</tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">Umieszczenie w schronisku dla nieletnich</td>
  <td  class="borderAll col_36">1</td>
    <td  class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.3!1!4')"><asp:Label CssClass="normal" ID="tab_113_w01_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">Nadzór organizacji młodzieżowej, społecznej, zakładu pracy, osoby godnej zaufania</td>
  <td  class="borderAll col_36">2</td>
    <td  class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.3!1!4')"><asp:Label CssClass="normal" ID="tab_113_w02_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" colspan="2">Nadzór kuratora</td>
  <td  class="borderAll col_36">3</td>
    <td  class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.3!1!4')"><asp:Label CssClass="normal" ID="tab_113_w03_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie" rowspan="3">Nadzór kuratora</td>
    <td  class="borderAll wciecie">zakładzie leczniczym</td>
  <td  class="borderAll col_36">4</td>
    <td  class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.3!1!4')"><asp:Label CssClass="normal" ID="tab_113_w04_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">młodzieżowym ośrodku wychowawczym</td>
  <td  class="borderAll col_36">5</td>
    <td  class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.3!1!4')"><asp:Label CssClass="normal" ID="tab_113_w05_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">domu pomocy społecznej</td>
  <td  class="borderAll col_36">6</td>
    <td  class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=6!1.1.3!1!4')"><asp:Label CssClass="normal" ID="tab_113_w06_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
    </table>
 </div>


         <div id='Środki zobowiązujące rodziców (opiekunów)   (art. 7  ustawy)*)' class="page-break" >
 <br/>
 <strong> Dział Środki zobowiązujące rodziców (opiekunów)   (art. 7  ustawy)*)</strong> 
    <table  style="width: 100%; ">
 <tr>    <td  class="center borderAll" colspan="3"> Wyszczególnienie</td>    <td class="center borderAll"> Liczba</td>
</tr>
 <tr>    <td  class="center borderAll" colspan="3">0</td>    <td class="center borderAll">1</td>
</tr>
  <tr>
    <td  class="borderAll wciecie" rowspan="3">Zobowiązano rodziców (opiekuna) do</td>
    <td  class="borderAll wciecie">Poprawy określonych warunków nieletniego</td>
  <td  class="borderAll col_36">1</td>
    <td  class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=1!1.1.5!1!4')"><asp:Label CssClass="normal" ID="tab_115_w01_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">naprawienia szkody wyrządzonej przez nieletniego</td>
  <td  class="borderAll col_36">2</td>
    <td  class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.5!1!4')"><asp:Label CssClass="normal" ID="tab_115_w02_c01" runat="server" Text="0"></asp:Label></a></td>
  </tr>
  <tr>
    <td  class="borderAll wciecie">inne</td>
  <td  class="borderAll col_36">3</td>
    <td  class="col_250 center borderAll "><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.5!1!4')"><asp:Label CssClass="normal" ID="tab_115_w03_c01" runat="server" Text="0"></asp:Label></a></td>
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
           <div id="tabela17" class="page-break">
                                    &nbsp;<asp:Label ID="Label60_17" runat="server">REFERENTARZE LICZBA POSIEDZEŃ JAWNYCH</asp:Label>
                                    &nbsp;<asp:Label ID="infoLabel16" runat="server" Text="tabela 17  \/\/\/" Visible="False"></asp:Label>
                                    <br />
                                    <asp:GridView ID="gwTabela17" runat="server" OnRowCreated="naglowekTabeli_gwTabela8" AutoGenerateColumns="False" OnRowDataBound="stopkaTabeli_gwTabela17" Width="100%" ShowHeader="False" ShowFooter="True">
                                        <Columns>

                                            <asp:TemplateField HeaderText="imie" SortExpression="imie">
                                                <ItemTemplate>
                                                    <asp:Label ID="nazwisko" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                                                    <asp:Label ID="imie" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="t2_nazwisko" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')">
                                                        <asp:Label ID="Label5_17" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="col_80" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')">
                                                        <asp:Label ID="Label8_17" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="col_80" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')">
                                                        <asp:Label ID="Label12_17" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="col_80" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')">
                                                        <asp:Label ID="Label14_17" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="col_80" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')">
                                                        <asp:Label ID="Label16_17" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="col_80" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')">
                                                        <asp:Label ID="Label18_17" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="col_80" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')">
                                                        <asp:Label ID="Label19_17" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="col_80" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_08" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')">
                                                        <asp:Label ID="Label20_17" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="col_80" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_09" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')">
                                                        <asp:Label ID="Label22_17" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="col_80" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_10" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')">
                                                        <asp:Label ID="Label23_17" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="col_80" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_11" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!2"%>')">
                                                        <asp:Label ID="Label24_17" runat="server" Text='<%# Eval("d_11")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="col_80" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_12" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!2"%>')">
                                                        <asp:Label ID="Label31_17" runat="server" Text='<%# Eval("d_12")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="col_80" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_12" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!13!2"%>')">
                                                        <asp:Label ID="Label33_17" runat="server" Text='<%# Eval("d_13")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="col_80 gray" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <FooterStyle BackColor="#CCCCCC" />
                                    </asp:GridView>

                                    <br />
                                </div>

        <div id="debag">

            <br />
            <br />
        </div>
    </div>
</asp:Content>