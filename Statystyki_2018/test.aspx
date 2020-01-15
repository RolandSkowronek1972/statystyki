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
        <table style="width: 100%;">
            <tr>
                <td class="col_200 borderAll wciecie">&nbsp;</td>
                <td class="borderAll center"></td>
                <td class="borderAll center">&nbsp;</td>
                <td class="borderAll center">wpływ</td>
                <td class="borderAll center">załatwienia</td>
                <td class="borderAll center">pozostałość</td>
                <td></td>
                <td>&nbsp;</td>
                <td class="borderAll center">Ogółem</td>
                <td class="borderAll center">Pow. 12 m-cy</td>
            </tr>
            <tr>
                <td class="col_200 borderAll wciecie">wskaźnik opanowania wpływu spraw rozpatrywanych przez sądy I instancji</td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=1!1!1!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll gray">Cywilny</td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=1!1!2!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=1!1!3!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=1!1!4!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=1!1!5!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll gray">C</td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=1!1!6!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=1!1!7!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w01_c07" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td class="col_200 borderAll wciecie">średni czas trwania postępowania w sprawach cywilnych, pracy, rodzinnych, ubezpieczeń spłecznych, karnych i gospodarczych (z wyłączeniem spraw wieczystoksięgowych i rejestrowych)(w miesiącach)</td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=2!1!1!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll gray">Karny</td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=2!1!2!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=2!1!3!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=2!1!4!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w02_c04" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=2!1!5!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w02_c05" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll gray">Ns</td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=2!1!6!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w02_c06" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=2!1!7!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w02_c07" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td class="col_200 borderAll wciecie">odsetek spraw rozpatrywanych przez sądy I instancji, w których czas trwania postępowania przekracza 12 m-cy</td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=3!1!1!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll gray">Pracy</td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=3!1!2!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=3!1!3!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=3!1!4!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w03_c04" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=3!1!5!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w03_c05" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll gray">Nc</td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=3!1!6!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w03_c06" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=3!1!7!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w03_c07" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td class="col_200 borderAll wciecie">liczba etatów asystenckich na etat sędziego</td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=4!1!1!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll gray">Rodzinny</td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=4!1!2!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=4!1!3!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=4!1!4!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w04_c04" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=4!1!5!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w04_c05" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll gray">K</td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=4!1!6!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w04_c06" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=4!1!7!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w04_c07" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td class="col_200 borderAll wciecie">liczba spraw (w wybranych kategoriach) załatwionych przez referendarzy przypadająca na jeden etat referendarski</td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=5!1!1!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll gray">&nbsp;</td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=5!1!2!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w05_c02" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=5!1!3!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w05_c03" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=5!1!4!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w05_c04" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=5!1!5!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w05_c05" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll gray">Kp</td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=5!1!6!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w05_c06" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=5!1!7!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w05_c07" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td class="col_200 borderAll wciecie">liczba spraw zakończonych w okresie sprawozdawczym przypadających na jednego kuratora zawodowego</td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=6!1!1!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll gray">Kw</td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=6!1!2!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w06_c02" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=6!1!3!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w06_c03" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=6!1!4!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w06_c04" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=6!1!5!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w06_c05" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll gray">W</td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=6!1!6!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w06_c06" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=6!1!7!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w06_c07" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td class="col_200 borderAll wciecie">liczba osób, wobec których sądy orzekły wypłatę odszkodowań za naruszenie prawa strony do rozpoznania sprawy w postępowaniu sądowym bez nieuzasadnionej zwłoki</td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=7!1!1!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w07_c01" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll gray">Bez kw</td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=7!1!2!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w07_c02" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=7!1!3!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w07_c03" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=7!1!4!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w07_c04" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=7!1!5!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w07_c05" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll gray">P.Np.</td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=7!1!6!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w07_c06" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=7!1!7!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w07_c07" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td class="col_200 borderAll wciecie">wskaźnik opanowania wpływu głównych kategorii spraw rozpatrywanych przez sądy I instancji*</td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=8!1!1!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w08_c01" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll gray">Suma</td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=8!1!2!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w08_c02" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=8!1!3!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w08_c03" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=8!1!4!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w08_c04" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=8!1!5!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w08_c05" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll gray">RC</td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=8!1!6!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w08_c06" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=8!1!7!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w08_c07" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td class="col_200 borderAll wciecie">odsetek spraw rozpatrywanych przez sądy I instancji, w których czas trwania postępowania przekracza 3 lata</td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=9!1!1!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w09_c01" runat="server" Text="0"></asp:Label></a></td>
                <td class=" ">&nbsp;</td>
                <td class=" ">&nbsp;</td>
                <td class=" ">&nbsp;</td>
                <td class=" ">&nbsp;</td>
                <td class=" ">&nbsp;</td>
                <td class="col_81 borderAll gray">RNs</td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=9!1!6!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w09_c06" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=9!1!7!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w09_c07" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td class="col_200 borderAll wciecie">odsetek spraw skierowanych do mediacji w stosunku do wszystkich spraw wpływających do sądu, w których mediacja może być zastosowana</td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=10!1!1!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w10_c01" runat="server" Text="0"></asp:Label></a></td>
                <td class=" ">&nbsp;</td>
                <td class=" ">&nbsp;</td>
                <td class=" ">&nbsp;</td>
                <td class=" ">&nbsp;</td>
                <td class=" ">&nbsp;</td>
                <td class="col_81 borderAll gray">Nsm</td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=10!1!6!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w10_c06" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll">
                    <a href="javascript: openPopup('popup.aspx?sesja=10!1!7!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w10_c07" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            <tr>
                <td class="col_200 borderAll wciecie">&nbsp;</td>
                <td class="col_81 borderAll">&nbsp;</td>
                <td class=" ">&nbsp;</td>
                <td class=" ">&nbsp;</td>
                <td class=" ">&nbsp;</td>
                <td class=" ">&nbsp;</td>
                <td class=" ">&nbsp;</td>
                <td class="col_81 borderAll gray">Ogółem</td>
                <td class="col_81 borderAll gray">
                    <a href="javascript: openPopup('popup.aspx?sesja=11!1!6!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w11_c06" runat="server" Text="0"></asp:Label></a></td>
                <td class="col_81 borderAll gray">
                    <a href="javascript: openPopup('popup.aspx?sesja=11!1!7!3')">
                        <asp:Label CssClass="normal" ID="tab_1_w11_c07" runat="server" Text="0"></asp:Label></a></td>
            </tr>
            </tr>
   <tr>
       <td class=" ">&nbsp;</td>
       <td class=" ">&nbsp;</td>
       <td class=" ">&nbsp;</td>
       <td class=" ">&nbsp;</td>
       <td class=" ">&nbsp;</td>
       <td class=" ">&nbsp;</td>
       <td class=" ">&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
   </tr>
        </table>
        <br />
        <div id="TABELA5" class="page -break">
            <table style="width: 100%;">
                <tr>
                    <td class="borderAll col_81">kategoria spraw</td>
                    <td class="borderAll col_81">rok</td>
                    <td class="borderAll col_81">wpływ</td>
                    <td class="borderAll col_81">załatwienia</td>
                    <td class="borderAll col_81">pozostałość</td>
                    <td class="borderAll col_81">liczba spraw zawie-szonych</td>
                    <td class="borderAll col_81">wpływ na sędziego / referendarza sądowego według liczby sędziów/ referendarzy i wakujących stanowisk sędziowskich / referendarskich w ramach limitu (w okresie statystycznym)</td>
                    <td class="borderAll col_81">załatwienia na sędziego / referendarza sądowego według liczby sędziów/ referendarzy i wakujących stanowisk sędziowskich / referendarskich w ramach limitu (w okresie statystycznym)</td>
                    <td class="borderAll col_81">pozostałość na sędziego / referendarza sądowego według liczby sędziów/ referendarzy i wakujących stanowisk sędziowskich / referendarskich w ramach limitu (w okresie statystycznym)</td>
                    <td class="borderAll col_81">wpływ na sędziego<br />
                        /referendarza sądowego według obsady średniookresowej (efektywnego czasu pracy)</td>
                    <td class="borderAll col_81">załatwienia na sędziego/ referendarza sądowego według obsady średniookresowej (efektywnego czasu pracy)</td>
                    <td class="borderAll col_81">pozostałość na sędziego<br />
                        /referendarza sądowego według obsady średniookresowej (wg limitu w okresie statystycznym)</td>
                    <td class="borderAll col_81">wskaźnik pozostałości</td>
                </tr>
                <tr>
                    <td class="borderAll center" rowspan="3">K</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!11!1!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!11!2!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!11!3!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!11!4!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!11!5!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!11!6!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!11!7!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!11!8!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!11!9!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!11!10!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!11!11!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!11!12!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!11!1!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!11!2!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!11!3!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!11!4!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!11!5!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!11!6!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!11!7!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!11!8!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!11!9!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!11!10!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!11!11!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!11!12!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!11!1!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!11!2!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!11!3!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!11!4!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!11!5!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!11!6!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!11!7!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!11!8!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!11!9!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!11!10!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!11!11!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!11!12!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81" rowspan="3">Kp</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!11!1!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!11!2!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!11!3!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!11!4!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!11!5!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!11!6!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!11!7!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!11!8!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!11!9!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!11!10!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!11!11!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!11!12!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!11!1!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!11!2!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!11!3!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!11!4!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!11!5!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!11!6!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!11!7!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!11!8!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!11!9!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!11!10!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!11!11!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!11!12!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!11!1!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!11!2!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!11!3!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!11!4!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!11!5!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!11!6!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!11!7!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!11!8!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!11!9!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!11!10!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!11!11!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!11!12!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81" rowspan="3">Ko</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!11!1!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!11!2!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!11!3!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!11!4!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!11!5!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!11!6!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!11!7!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!11!8!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!11!9!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!11!10!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!11!11!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!11!12!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!11!1!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w08_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!11!2!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w08_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!11!3!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w08_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!11!4!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w08_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!11!5!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w08_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!11!6!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w08_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!11!7!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w08_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!11!8!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w08_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!11!9!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w08_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!11!10!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w08_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!11!11!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w08_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!11!12!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w08_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!11!1!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w09_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!11!2!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w09_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!11!3!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w09_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!11!4!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w09_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!11!5!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w09_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!11!6!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w09_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!11!7!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w09_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!11!8!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w09_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!11!9!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w09_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!11!10!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w09_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!11!11!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w09_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!11!12!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w09_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81" rowspan="3">W</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!11!1!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w10_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!11!2!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w10_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!11!3!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w10_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!11!4!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w10_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!11!5!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w10_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!11!6!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w10_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!11!7!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w10_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!11!8!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w10_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!11!9!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w10_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!11!10!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w10_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!11!11!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w10_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!11!12!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w10_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!11!1!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w11_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!11!2!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w11_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!11!3!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w11_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!11!4!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w11_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!11!5!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w11_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!11!6!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w11_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!11!7!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w11_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!11!8!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w11_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!11!9!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w11_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!11!10!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w11_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!11!11!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w11_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!11!12!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w11_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!11!1!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w12_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!11!2!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w12_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!11!3!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w12_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!11!4!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w12_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!11!5!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w12_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!11!6!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w12_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!11!7!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w12_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!11!8!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w12_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!11!9!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w12_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!11!10!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w12_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!11!11!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w12_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!11!12!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w12_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81" rowspan="3">Kop</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!11!1!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w13_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!11!2!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w13_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!11!3!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w13_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!11!4!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w13_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!11!5!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w13_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!11!6!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w13_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!11!7!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w13_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!11!8!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w13_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!11!9!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w13_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!11!10!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w13_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!11!11!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w13_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!11!12!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w13_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!11!1!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w14_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!11!2!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w14_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!11!3!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w14_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!11!4!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w14_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!11!5!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w14_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!11!6!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w14_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!11!7!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w14_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!11!8!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w14_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!11!9!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w14_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!11!10!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w14_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!11!11!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w14_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!11!12!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w14_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!11!1!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w15_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!11!2!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w15_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!11!3!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w15_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!11!4!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w15_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!11!5!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w15_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!11!6!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w15_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!11!7!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w15_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!11!8!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w15_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!11!9!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w15_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!11!10!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w15_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!11!11!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w15_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!11!12!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w15_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center" rowspan="3">&nbsp;</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!11!1!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w16_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!11!2!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w16_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!11!3!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w16_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!11!4!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w16_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!11!5!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w16_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!11!6!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w16_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!11!7!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w16_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!11!8!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w16_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!11!9!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w16_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!11!10!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w16_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!11!11!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w16_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!11!12!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w16_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!11!1!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w17_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!11!2!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w17_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!11!3!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w17_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!11!4!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w17_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!11!5!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w17_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!11!6!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w17_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!11!7!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w17_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!11!8!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w17_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!11!9!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w17_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!11!10!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w17_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!11!11!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w17_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!11!12!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w17_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!11!1!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w18_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!11!2!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w18_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!11!3!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w18_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!11!4!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w18_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!11!5!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w18_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!11!6!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w18_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!11!7!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w18_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!11!8!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w18_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!11!9!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w18_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!11!10!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w18_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!11!11!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w18_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!11!12!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w18_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81 gray" rowspan="3">Razem</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!11!1!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w19_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!11!2!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w19_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!11!3!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w19_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!11!4!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w19_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!11!5!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w19_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!11!6!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w19_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!11!7!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w19_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!11!8!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w19_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!11!9!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w19_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!11!10!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w19_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!11!11!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w19_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!11!12!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w19_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!11!1!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w20_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!11!2!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w20_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!11!3!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w20_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!11!4!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w20_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!11!5!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w20_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!11!6!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w20_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!11!7!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w20_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!11!8!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w20_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!11!9!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w20_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!11!10!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w20_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!11!11!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w20_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!11!12!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w20_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!11!1!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w21_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!11!2!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w21_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!11!3!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w21_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!11!4!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w21_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!11!5!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w21_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!11!6!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w21_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!11!7!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w21_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!11!8!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w21_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!11!9!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w21_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!11!10!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w21_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!11!11!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w21_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!11!12!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w21_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81 gray">Ogółem za okres oceny</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!11!1!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w22_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!11!2!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w22_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!11!3!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w22_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!11!4!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w22_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!11!5!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w22_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!11!6!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w22_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!11!7!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w22_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!11!8!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w22_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!11!9!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w22_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!11!10!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w22_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!11!11!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w22_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!11!12!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w22_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
            </table>
        </div>
</asp:Content>