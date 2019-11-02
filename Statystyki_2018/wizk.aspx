<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="wizk.aspx.cs" Inherits="stat2018.wizk" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.15.0,  Culture=neutral,  PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        #menu {
            position: relative;
        }

            #menu.scrolling {
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
            }
    </style>

    <div id="menu" class="manu_back noprint" style="height: 40px;">

        <table>
            <tr>
                <td style="width: auto; padding-left: 5px;">
                    <asp:Label ID="Label4" runat="server" Text="Proszę wybrać zakres:"></asp:Label>
                </td>
                <td style="width: auto; padding-left: 5px;">

                    <dx:ASPxDateEdit ID="Date1" runat="server" Theme="Moderno">
                    </dx:ASPxDateEdit>
                </td>
                <td style="width: auto; padding-left: 5px;">

                    <dx:ASPxDateEdit ID="Date2" runat="server" Theme="Moderno">
                    </dx:ASPxDateEdit>
                </td>
                <td style="width: auto; padding-left: 5px;">
                    <asp:LinkButton ID="LinkButton54" runat="server" class="ax_box" OnClick="Odswiez">  Odśwież</asp:LinkButton>
                </td>
                <td style="width: auto; padding-left: 5px;">
                    <asp:LinkButton ID="LinkButton55" runat="server" class="ax_box" CssClass="ax_box"> Drukuj </asp:LinkButton>
                </td>

                <td style="width: auto; padding-left: 5px;">
                    <asp:LinkButton ID="LinkButton57" runat="server" CssClass="ax_box" OnClick="tworzPlikExcell">Zapisz do Excel</asp:LinkButton>
                </td>
            </tr>
        </table>
    </div>
    <div style="width: 1150px; margin: 0 auto 0 auto; position: relative; top: 30px;">

        <div>

            <asp:Label ID="infoLabel01" runat="server" Text="dział 1 \/\/\/" Visible="False"></asp:Label>
            <br />
            <table style="width: 100%;">
                <tr>
                    <td class="gray center borderAll" colspan="2">

                        <asp:Label ID="d1Label" runat="server" Text="Dział I"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="col_500 wciecie borderAll">I.1. Podstawa prawna przeprowadzenia wizytacji</td>
                    <td class="borderAll wciecie">
                        <asp:TextBox ID="tab_1_w01_c01" runat="server" Width="90%" BorderStyle="None"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="col_500 wciecie borderAll">1.4. Osoba/osoby przeprowadzająca/e wizytacjęI.2. Prezes sądu odpowiedzialny za przeprowadzenie wizytacji</td>
                    <td class="borderAll wciecie">
                        <asp:TextBox ID="tab_1_w02_c01" runat="server" Rows="4" Width="90%" BorderStyle="None"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="col_500 wciecie borderAll">I.3. Wizytowany wydział sądu</td>
                    <td class="borderAll wciecie">
                        <asp:TextBox ID="tab_1_w03_c01" runat="server" Width="90%" BorderStyle="None"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="col_500 wciecie borderAll">1.4. Osoba/osoby przeprowadzająca/e wizytację</td>
                    <td class="borderAll wciecie">
                        <asp:TextBox ID="tab_1_w04_c01" runat="server" Width="90%" BorderStyle="None"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="col_500 wciecie borderAll">I.5. Termin przeprowadzenia wizytacji</td>
                    <td class="borderAll wciecie">
                        <dx:ASPxDateEdit ID="tab_1_w05_c01" runat="server" Theme="Moderno" OnInit="tab_1_w02_c01_dateInit">
                        </dx:ASPxDateEdit>
                    </td>
                </tr>
                <tr>
                    <td class="col_500 wciecie borderAll">I.6. Okres objęty wizytacją</td>
                    <td class="borderAll wciecie">
                        <asp:TextBox ID="tab_1_w06_c01" runat="server" Width="90%" BorderStyle="None"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
        <div class="page-break">
            &nbsp;<br />
            <asp:Label ID="InfoLabel2" runat="server" Text="dział 2 \/\/\/" Visible="False"></asp:Label>
            <br />
            <table style="width: 100%;">
                <tr>
                    <td class="borderAll gray center" colspan="2">
                        <asp:Label ID="d1Label0" runat="server" Text="Dział II"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="col_500 wciecie borderAll">II.1. Termin przeprowadzenia poprzedniej wizytacji</td>
                    <td class="borderAll wciecie">
                        <dx:ASPxDateEdit ID="tab_2_w01_c01" runat="server" Theme="Moderno" OnInit="tab_2_w01_c01_dateInit">
                        </dx:ASPxDateEdit>
                    </td>
                </tr>
                <tr>
                    <td class="col_500 wciecie borderAll">II.2. Osoba/osoby przeprowadzająca/e poprzednią wizytację</td>
                    <td class="borderAll wciecie">
                        <asp:TextBox ID="tab_2_w02_c01" runat="server" Rows="4" TextMode="MultiLine" Width="90%" BorderStyle="None"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="col_500 wciecie borderAll">III.3. Okres objęty poprzednia wizytacją </td>
                    <td class="borderAll wciecie">
                        <asp:TextBox ID="tab_2_w03_c01" runat="server" Width="90%" BorderStyle="None"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="col_500 wciecie borderAll">II.4. Wykonanie zarządzeń nadzorczych wydanych w wyniku przeprowadzenia poprzedniej wizytacji</td>
                    <td class="borderAll wciecie">
                        <asp:TextBox ID="tab_2_w04_c01" runat="server" Rows="4" TextMode="MultiLine" Width="90%" BorderStyle="None"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="col_500 wciecie borderAll">II.5. Czynności nadzorcze podjęte po zakonczeniu poprzedniej wizytacji</td>
                    <td class="borderAll wciecie">
                        <asp:TextBox ID="tab_2_w05_c01" runat="server" Rows="4" TextMode="MultiLine" Width="90%" BorderStyle="None"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="col_500 wciecie borderAll">II.6. Wykonanie zarządzeń nadzorczych wydanych w wyniku czynności nadzorczych, o których mowa w II.5.</td>
                    <td class="borderAll wciecie">
                        <asp:TextBox ID="tab_2_w06_c01" runat="server" Rows="4" TextMode="MultiLine" Width="90%" BorderStyle="None"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>

        <div class="page-break">

            <br />

            <asp:Label ID="Label17" runat="server" Text="III.1. Sędziowie (wg objaśnień: w zestawieniu należy uwzględnić także sędziów delegowanych)"></asp:Label>
            &nbsp;&nbsp;&nbsp;
           <asp:Label ID="Label18" runat="server" Text="tabela  3 \/\/\/" Visible="True"></asp:Label>
            <br />
            <asp:PlaceHolder runat="server" ID="PlaceHolderTB3"></asp:PlaceHolder>
            <br />
            <br />
        </div>
        <div class="page-break">

            <asp:Label ID="Label1" runat="server" Text="III.1. Sędziowie (wg objaśnień: w zestawieniu należy uwzględnić także sędziów delegowanych)"></asp:Label>
            &nbsp;&nbsp;&nbsp;
           <asp:Label ID="Label3" runat="server" Text="tabela  4 \/\/\/" Visible="True"></asp:Label>
            <br />
            <asp:PlaceHolder runat="server" ID="PlaceHolderTB4"></asp:PlaceHolder>
            <br />
            <br />
        </div>
        <div class="page-break">

            <asp:Label ID="Label19" runat="server" Text="III.2. Referendarze sądowi (wg objaśnień: w zestawieniu należy uwzględnić także referendarzy sądowych delegowanych)"></asp:Label>
            &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel5" runat="server" Text="tabela  5 \/\/\/" Visible="True"></asp:Label>
            <br />
            <asp:PlaceHolder runat="server" ID="PlaceHolderTB5"></asp:PlaceHolder>
            <br />
        </div>

        <div class="page-break">

            <asp:Label ID="Label6" runat="server" Text="III.2. Referendarze sądowi (wg objaśnień: w zestawieniu należy uwzględnić także referendarzy sądowych delegowanych)"></asp:Label>
            &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel6" runat="server" Text="tabela  6 \/\/\/" Visible="True"></asp:Label>
            <br />
            <asp:PlaceHolder runat="server" ID="PlaceHolderTB6"></asp:PlaceHolder>
            <br />
        </div>
        <div class="page-break">

            <asp:Label ID="Label2" runat="server" Text="III.2. Referendarze sądowi (wg objaśnień: w zestawieniu należy uwzględnić także referendarzy sądowych delegowanych)"></asp:Label>
            &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel7" runat="server" Text="tabela  7 \/\/\/" Visible="True"></asp:Label>
            <br />
            <asp:PlaceHolder runat="server" ID="PlaceHolderTB7"></asp:PlaceHolder>
            <br />
        </div>
        <div class="page-break">

            <asp:Label ID="Label7" runat="server" Text="III.4. Zmiany limitów i obsad we wszystkich grupach zatrudnienia"></asp:Label>
            &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel8" runat="server" Text="tabela  8 \/\/\/" Visible="True"></asp:Label>
            <br />

            <table style="width: 100%;">
                <tr>
                    <td class="borderAll center" rowspan="2">rok</td>
                    <td class="borderAll center" colspan="3">Sędziowie</td>
                    <td class="borderAll center" colspan="3">referendarze sądowi</td>
                    <td class="borderAll center" colspan="3">asystenci sędziów</td>
                    <td class="borderAll center" colspan="3">urzędnicy sądowi</td>
                    <td class="borderAll center" colspan="2">relacje etatów</td>
                </tr>
                <tr>
                    <td class="borderAll center">liczba sędziów i wakujących stanowisk sędziowskich w ramach limitu w okresie statys-tycznym</td>
                    <td class="borderAll center">obsada średnio-okresowa</td>
                    <td class="borderAll center">% do limitu</td>
                    <td class="borderAll center">liczba referen-darzy w ramach limitu w okresie statys-tycznym</td>
                    <td class="borderAll center">obsada średnio-okresowa</td>
                    <td class="borderAll center">% do limitu</td>
                    <td class="borderAll center">liczba asys-tentów w ramach limitu w okresie statys-tycznym</td>
                    <td class="borderAll center">obsada średnio-okresowa</td>
                    <td class="borderAll center">% do limitu</td>
                    <td class="borderAll center">liczba urzędników w okresie statys-tycznym</td>
                    <td class="borderAll center">obsada średnio-okresowa</td>
                    <td class="borderAll center">% do limitu</td>
                    <td class="borderAll center">liczba asys-tentów sędziów przypa-dająca na jednego sędziego</td>
                    <td class="borderAll center">liczba etatów urzęd-niczych przypa-dająca na jeden etat orzeczniczy </td>
                </tr>
                <tr>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!6!1!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!6!2!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!6!3!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!6!4!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!6!5!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!6!6!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!6!7!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!6!8!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w01_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!6!9!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w01_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!6!10!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w01_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!6!11!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w01_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!6!12!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w01_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!6!13!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w01_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!6!14!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w01_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!6!15!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w01_c15" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!6!1!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!6!2!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!6!3!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!6!4!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w02_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!6!5!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w02_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!6!6!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w02_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!6!7!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w02_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!6!8!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w02_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!6!9!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w02_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!6!10!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w02_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!6!11!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w02_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!6!12!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w02_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!6!13!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w02_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!6!14!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w02_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!6!15!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w02_c15" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!6!1!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!6!2!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!6!3!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!6!4!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w03_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!6!5!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w03_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!6!6!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w03_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!6!7!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w03_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!6!8!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w03_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!6!9!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w03_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!6!10!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w03_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!6!11!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w03_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!6!12!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w03_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!6!13!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w03_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!6!14!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w03_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!6!15!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w03_c15" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!6!1!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!6!2!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!6!3!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!6!4!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w04_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!6!5!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w04_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!6!6!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w04_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!6!7!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w04_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!6!8!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w04_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!6!9!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w04_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!6!10!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w04_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!6!11!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w04_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!6!12!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w04_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!6!13!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w04_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!6!14!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w04_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!6!15!3')">
                            <asp:Label CssClass="normal" ID="tab_8_w04_c15" runat="server" Text="0"></asp:Label></a></td>
                </tr>
            </table>

            <br />
        </div>
        <div id="TABELA9" class="page -break">
            <table style="width: 100%;">
                <tr>
                    <td class="col_250 center borderAll">III.5. Liczba osób wykonujących czynności na innej podstawie niż stosunek pracy, w tym stażyści z urzędów pracy ( podstawa zatrudnienia, okres wykonywania czynności)</td>
                    <td class="col_500F center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!9!1!3')">
                            <asp:TextBox CssClass="normal" ID="tab_9_w01_c01" runat="server" Text="0"></asp:TextBox></a></td>
                </tr>
                <tr>
                    <td class="col_250 center borderAll">III.6. Warunki pracy (liczba sal rozpraw itp., uwagi)</td>
                    <td class="col_500F center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!9!1!3')">
                            <asp:TextBox CssClass="normal" ID="tab_9_w02_c01" runat="server" Text="0"></asp:TextBox></a></td>
                </tr>
                <tr>
                    <td class="col_250 center borderAll">III.7. Wnioski</td>
                    <td class="col_500F center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!9!1!3')">
                            <asp:TextBox CssClass="normal" ID="tab_9_w03_c01" runat="server" Text="0"></asp:TextBox></a></td>
                </tr>
            </table>
            <br />
        </div>
        <div id="TABELA10" class="page -break">
            <asp:Label ID="Label8" runat="server" Text=" IV.1. Ruch spraw i obciążenie sędziów i referendarzy sądowych w wydziale (ogółem)"></asp:Label>
            &nbsp;&nbsp;&nbsp;
           <asp:Label ID="Label9" runat="server" Text="tabela  10 \/\/\/" Visible="True"></asp:Label>
            <br />

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
                    <td class="borderAll col_81" rowspan="3">K</td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!1!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!2!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!3!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!4!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!5!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!6!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!7!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!8!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!9!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!10!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!11!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!12!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!13!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!14!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!15!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!16!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!17!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!18!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!19!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!20!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!21!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!22!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!23!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!24!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c24" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!25!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!26!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!27!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!28!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!29!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!30!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!31!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!32!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!33!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!34!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!35!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!36!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c36" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81" rowspan="3">Kp</td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!1!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!2!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!3!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!4!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w02_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!5!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w02_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!6!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w02_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!7!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w02_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!8!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w02_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!9!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w02_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!10!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w02_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!11!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w02_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!12!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w02_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81">

                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!13!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w02_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!14!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w02_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!15!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w02_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!16!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w02_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!17!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w02_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!18!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w02_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!19!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w02_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!20!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w02_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!21!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w02_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!22!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w02_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!23!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w02_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!24!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w02_c24" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!25!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w02_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!26!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w02_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!27!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w02_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!28!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w02_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!29!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w02_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!30!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w02_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!31!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w02_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!32!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w02_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!33!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w02_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!34!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w02_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!35!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w02_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!36!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w02_c36" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81" rowspan="3">Ko</td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!1!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!2!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!3!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!4!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w03_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!5!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w03_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!6!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w03_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!7!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w03_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!8!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w03_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!9!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w03_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!10!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w03_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!11!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w03_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!12!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w03_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!13!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w03_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!14!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w03_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!15!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w03_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!16!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w03_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!17!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w03_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!18!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w03_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!19!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w03_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!20!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w03_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!21!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w03_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!22!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w03_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!23!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w03_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!24!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w03_c24" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!25!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w03_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!26!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w03_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!27!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w03_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!28!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w03_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!29!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w03_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!30!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w03_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!31!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w03_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!32!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w03_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!33!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w03_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!34!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w03_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!35!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w03_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!36!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w03_c36" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81" rowspan="3">W</td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!1!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!2!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!3!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!4!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w04_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!5!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w04_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!6!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w04_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!7!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w04_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!8!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w04_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!9!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w04_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!10!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w04_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!11!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w04_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!12!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w04_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!13!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w04_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!14!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w04_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!15!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w04_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!16!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w04_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!17!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w04_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!18!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w04_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!19!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w04_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!20!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w04_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!21!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w04_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!22!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w04_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!23!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w04_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!24!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w04_c24" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!25!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w04_c25" runat="server" Text="0"></asp:Label></a></td>

                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!26!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w04_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!27!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w04_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!28!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w04_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!29!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w04_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!30!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w04_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!31!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w04_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!32!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w04_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!33!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w04_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!34!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w04_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!35!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w04_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!36!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w04_c36" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81" rowspan="3">Kop</td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!1!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!2!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w05_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!3!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w05_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!4!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w05_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!5!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w05_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!6!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w05_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!7!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w05_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!8!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w05_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!9!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w05_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!10!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w05_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!11!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w05_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!12!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w05_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!13!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w05_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!14!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w05_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!15!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w05_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!16!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w05_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!17!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w05_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!18!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w05_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!19!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w05_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!20!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w05_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!21!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w05_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!22!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w05_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!23!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w05_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!24!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w05_c24" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!25!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w05_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!26!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w05_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!27!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w05_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!28!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w05_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!29!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w05_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!30!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w05_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!31!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w05_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!32!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w05_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!33!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w05_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!34!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w05_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!35!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w05_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!36!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w05_c36" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81" rowspan="3"></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!1!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!2!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w06_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!3!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w06_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!4!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w06_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!5!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w06_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!6!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w06_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!7!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w06_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!8!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w06_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!9!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w06_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!10!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w06_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!11!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w06_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!12!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w06_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!13!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w06_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!14!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w06_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!15!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w06_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!16!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w06_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!17!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w06_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!18!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w06_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!19!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w06_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!20!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w06_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!21!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w06_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!22!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w06_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!23!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w06_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!24!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w06_c24" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!25!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w06_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!26!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w06_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!27!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w06_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!28!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w06_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!29!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w06_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!30!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w06_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!31!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w06_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!32!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w06_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!33!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w06_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!34!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w06_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!35!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w06_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!36!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w06_c36" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81 gray" rowspan="3">Razem</td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!1!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w07_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!2!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w07_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!3!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w07_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!4!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w07_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!5!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w07_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!6!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w07_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!7!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w07_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!8!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w07_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!9!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w07_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!10!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w07_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!11!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w07_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!12!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w07_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!13!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w07_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!14!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w07_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!15!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w07_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!16!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w07_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!17!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w07_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!18!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w07_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!19!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w07_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!20!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w07_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!21!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w07_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!22!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w07_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!23!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w07_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!24!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w07_c24" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!25!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w07_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!26!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w07_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!27!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w07_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!28!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w07_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!29!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w07_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!30!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w07_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!31!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w07_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!32!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w07_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!33!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w07_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!34!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w07_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!35!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w07_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!36!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w07_c36" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81 gray">Ogółem za okres oceny</td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!10!1!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w08_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!10!2!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w08_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!10!3!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w08_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!10!4!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w08_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!10!5!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w08_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!10!6!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w08_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!10!7!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w08_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!10!8!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w08_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!10!9!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w08_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!10!10!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w08_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!10!11!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w08_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!10!12!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w08_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
            </table>
        </div>
        <div class="page-break">
            <br />
            <asp:Label ID="Label5" runat="server" Text="IV.2.1 Wielkość (stan) referatów sędziów"></asp:Label>
            &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel11" runat="server" Text="tabela  11 \/\/\/" Visible="True"></asp:Label>
            <br />
            <asp:PlaceHolder runat="server" ID="PlaceHolderTB11"></asp:PlaceHolder>
            <br />
        </div>

        <div class="page-break">
            <br />
            <asp:Label ID="Label10" runat="server" Text="IV.2.2. Wielkość (stan) referatów referendarzy sądowych"></asp:Label>
            &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel12" runat="server" Text="tabela  12 \/\/\/" Visible="True"></asp:Label>
            <br />
            <asp:PlaceHolder runat="server" ID="PlaceHolderTB12"></asp:PlaceHolder>
            <br />
        </div>
        <div class="page-break">
            <br />
            <asp:Label ID="Label11" runat="server" Text="Dział IV.2.3. Ruch spraw i obciążenie poszczególnych sędziów"></asp:Label>
            &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel13" runat="server" Text="tabela  13 \/\/\/" Visible="True"></asp:Label>
            <br />
            <asp:PlaceHolder runat="server" ID="PlaceHolderTB13"></asp:PlaceHolder>
            <br />
        </div>
        
          <div class="page-break">
            <br />
            <asp:Label ID="Label12" runat="server" Text="Dział IV.2.3. Ruch spraw i obciążenie poszczególnych sędziów"></asp:Label>
            &nbsp;&nbsp;&nbsp;
           <asp:Label ID="Label13" runat="server" Text="tabela  14 \/\/\/" Visible="True"></asp:Label>
            <br />
            <table style="width: 100%; "> 
   <tr> 
  <td class="borderAll center" rowspan="19"> 
      OGÓŁEM SSR 
  </td > 
  <td class="borderAll center"> 
      kategoria spraw</td > 
  <td class="borderAll center"> 
      rok</td > 
  <td class="borderAll center"> 
      wpływ</td > 
  <td class="borderAll center"> 
      załatwienia</td > 
  <td class="borderAll center"> 
      pozostałość</td > 
  <td class="borderAll center"> 
      sprawy zawieszone</td > 
  <td class="borderAll center"> 
      wpływ na sędziego według liczby sędziów i wakujących stanowisk sędziowskich w ramach limitu (w okresie statystycznym)</td > 
  <td class="borderAll center"> 
      załatwienia na sędziego według liczby sędziów i wakujących stanowisk sędziowskich w ramach limitu (w okresie statystycznym)</td > 
  <td class="borderAll center"> 
      pozostałość na sędziego według liczby sędziów i wakujących stanowisk sędziowskich w ramach limitu (w okresie statystycznym)</td > 
  <td class="borderAll center"> 
      wpływ na sędziego według obsady średniookresowej (efektywnego czasu pracy)</td > 
  <td class="borderAll center"> 
      załatwienia na sędziego według obsady średniookresowej (efektywnego czasu pracy)</td > 
  <td class="borderAll center"> 
      pozostałość na sędziego według obsady średniookresowej (wg limitu w okresie statystycznym)</td > 
  <td class="borderAll center"> 
      wskaźnik pozostałości</td > 
  <td class="borderAll center"> 
      efektywny czas pracy</td > 
   </tr> 
   <tr> 
  <td class="borderAll col_50" rowspan="3"> 
      K</td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!14!1!3')"><asp:Label CssClass="normal" ID="tab_14_w01_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!14!2!3')"><asp:Label CssClass="normal" ID="tab_14_w01_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!14!3!3')"><asp:Label CssClass="normal" ID="tab_14_w01_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!14!4!3')"><asp:Label CssClass="normal" ID="tab_14_w01_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!14!5!3')"><asp:Label CssClass="normal" ID="tab_14_w01_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!14!6!3')"><asp:Label CssClass="normal" ID="tab_14_w01_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!14!7!3')"><asp:Label CssClass="normal" ID="tab_14_w01_c07" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!14!8!3')"><asp:Label CssClass="normal" ID="tab_14_w01_c08" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!14!9!3')"><asp:Label CssClass="normal" ID="tab_14_w01_c09" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!14!10!3')"><asp:Label CssClass="normal" ID="tab_14_w01_c10" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!14!11!3')"><asp:Label CssClass="normal" ID="tab_14_w01_c11" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!14!12!3')"><asp:Label CssClass="normal" ID="tab_14_w01_c12" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!14!13!3')"><asp:Label CssClass="normal" ID="tab_14_w01_c13" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!14!1!3')"><asp:Label CssClass="normal" ID="tab_14_w02_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!14!2!3')"><asp:Label CssClass="normal" ID="tab_14_w02_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!14!3!3')"><asp:Label CssClass="normal" ID="tab_14_w02_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!14!4!3')"><asp:Label CssClass="normal" ID="tab_14_w02_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!14!5!3')"><asp:Label CssClass="normal" ID="tab_14_w02_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!14!6!3')"><asp:Label CssClass="normal" ID="tab_14_w02_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!14!7!3')"><asp:Label CssClass="normal" ID="tab_14_w02_c07" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!14!8!3')"><asp:Label CssClass="normal" ID="tab_14_w02_c08" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!14!9!3')"><asp:Label CssClass="normal" ID="tab_14_w02_c09" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!14!10!3')"><asp:Label CssClass="normal" ID="tab_14_w02_c10" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!14!11!3')"><asp:Label CssClass="normal" ID="tab_14_w02_c11" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!14!12!3')"><asp:Label CssClass="normal" ID="tab_14_w02_c12" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!14!13!3')"><asp:Label CssClass="normal" ID="tab_14_w02_c13" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!14!1!3')"><asp:Label CssClass="normal" ID="tab_14_w03_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!14!2!3')"><asp:Label CssClass="normal" ID="tab_14_w03_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!14!3!3')"><asp:Label CssClass="normal" ID="tab_14_w03_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!14!4!3')"><asp:Label CssClass="normal" ID="tab_14_w03_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!14!5!3')"><asp:Label CssClass="normal" ID="tab_14_w03_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!14!6!3')"><asp:Label CssClass="normal" ID="tab_14_w03_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!14!7!3')"><asp:Label CssClass="normal" ID="tab_14_w03_c07" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!14!8!3')"><asp:Label CssClass="normal" ID="tab_14_w03_c08" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!14!9!3')"><asp:Label CssClass="normal" ID="tab_14_w03_c09" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!14!10!3')"><asp:Label CssClass="normal" ID="tab_14_w03_c10" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!14!11!3')"><asp:Label CssClass="normal" ID="tab_14_w03_c11" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!14!12!3')"><asp:Label CssClass="normal" ID="tab_14_w03_c12" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!14!13!3')"><asp:Label CssClass="normal" ID="tab_14_w03_c13" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="borderAll col_50" rowspan="3"> 
      Kp</td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!14!1!3')"><asp:Label CssClass="normal" ID="tab_14_w04_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!14!2!3')"><asp:Label CssClass="normal" ID="tab_14_w04_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!14!3!3')"><asp:Label CssClass="normal" ID="tab_14_w04_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!14!4!3')"><asp:Label CssClass="normal" ID="tab_14_w04_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!14!5!3')"><asp:Label CssClass="normal" ID="tab_14_w04_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!14!6!3')"><asp:Label CssClass="normal" ID="tab_14_w04_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!14!7!3')"><asp:Label CssClass="normal" ID="tab_14_w04_c07" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!14!8!3')"><asp:Label CssClass="normal" ID="tab_14_w04_c08" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!14!9!3')"><asp:Label CssClass="normal" ID="tab_14_w04_c09" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!14!10!3')"><asp:Label CssClass="normal" ID="tab_14_w04_c10" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!14!11!3')"><asp:Label CssClass="normal" ID="tab_14_w04_c11" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!14!12!3')"><asp:Label CssClass="normal" ID="tab_14_w04_c12" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!14!13!3')"><asp:Label CssClass="normal" ID="tab_14_w04_c13" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=5!14!1!3')"><asp:Label CssClass="normal" ID="tab_14_w05_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=5!14!2!3')"><asp:Label CssClass="normal" ID="tab_14_w05_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=5!14!3!3')"><asp:Label CssClass="normal" ID="tab_14_w05_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=5!14!4!3')"><asp:Label CssClass="normal" ID="tab_14_w05_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=5!14!5!3')"><asp:Label CssClass="normal" ID="tab_14_w05_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=5!14!6!3')"><asp:Label CssClass="normal" ID="tab_14_w05_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=5!14!7!3')"><asp:Label CssClass="normal" ID="tab_14_w05_c07" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=5!14!8!3')"><asp:Label CssClass="normal" ID="tab_14_w05_c08" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=5!14!9!3')"><asp:Label CssClass="normal" ID="tab_14_w05_c09" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=5!14!10!3')"><asp:Label CssClass="normal" ID="tab_14_w05_c10" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=5!14!11!3')"><asp:Label CssClass="normal" ID="tab_14_w05_c11" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=5!14!12!3')"><asp:Label CssClass="normal" ID="tab_14_w05_c12" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=5!14!13!3')"><asp:Label CssClass="normal" ID="tab_14_w05_c13" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=6!14!1!3')"><asp:Label CssClass="normal" ID="tab_14_w06_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=6!14!2!3')"><asp:Label CssClass="normal" ID="tab_14_w06_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=6!14!3!3')"><asp:Label CssClass="normal" ID="tab_14_w06_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=6!14!4!3')"><asp:Label CssClass="normal" ID="tab_14_w06_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=6!14!5!3')"><asp:Label CssClass="normal" ID="tab_14_w06_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=6!14!6!3')"><asp:Label CssClass="normal" ID="tab_14_w06_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=6!14!7!3')"><asp:Label CssClass="normal" ID="tab_14_w06_c07" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=6!14!8!3')"><asp:Label CssClass="normal" ID="tab_14_w06_c08" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=6!14!9!3')"><asp:Label CssClass="normal" ID="tab_14_w06_c09" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=6!14!10!3')"><asp:Label CssClass="normal" ID="tab_14_w06_c10" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=6!14!11!3')"><asp:Label CssClass="normal" ID="tab_14_w06_c11" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=6!14!12!3')"><asp:Label CssClass="normal" ID="tab_14_w06_c12" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=6!14!13!3')"><asp:Label CssClass="normal" ID="tab_14_w06_c13" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="borderAll col_50" rowspan="3"> 
      Ko</td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=7!14!1!3')"><asp:Label CssClass="normal" ID="tab_14_w07_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=7!14!2!3')"><asp:Label CssClass="normal" ID="tab_14_w07_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=7!14!3!3')"><asp:Label CssClass="normal" ID="tab_14_w07_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=7!14!4!3')"><asp:Label CssClass="normal" ID="tab_14_w07_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=7!14!5!3')"><asp:Label CssClass="normal" ID="tab_14_w07_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=7!14!6!3')"><asp:Label CssClass="normal" ID="tab_14_w07_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=7!14!7!3')"><asp:Label CssClass="normal" ID="tab_14_w07_c07" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=7!14!8!3')"><asp:Label CssClass="normal" ID="tab_14_w07_c08" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=7!14!9!3')"><asp:Label CssClass="normal" ID="tab_14_w07_c09" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=7!14!10!3')"><asp:Label CssClass="normal" ID="tab_14_w07_c10" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=7!14!11!3')"><asp:Label CssClass="normal" ID="tab_14_w07_c11" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=7!14!12!3')"><asp:Label CssClass="normal" ID="tab_14_w07_c12" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=7!14!13!3')"><asp:Label CssClass="normal" ID="tab_14_w07_c13" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=8!14!1!3')"><asp:Label CssClass="normal" ID="tab_14_w08_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=8!14!2!3')"><asp:Label CssClass="normal" ID="tab_14_w08_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=8!14!3!3')"><asp:Label CssClass="normal" ID="tab_14_w08_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=8!14!4!3')"><asp:Label CssClass="normal" ID="tab_14_w08_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=8!14!5!3')"><asp:Label CssClass="normal" ID="tab_14_w08_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=8!14!6!3')"><asp:Label CssClass="normal" ID="tab_14_w08_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=8!14!7!3')"><asp:Label CssClass="normal" ID="tab_14_w08_c07" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=8!14!8!3')"><asp:Label CssClass="normal" ID="tab_14_w08_c08" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=8!14!9!3')"><asp:Label CssClass="normal" ID="tab_14_w08_c09" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=8!14!10!3')"><asp:Label CssClass="normal" ID="tab_14_w08_c10" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=8!14!11!3')"><asp:Label CssClass="normal" ID="tab_14_w08_c11" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=8!14!12!3')"><asp:Label CssClass="normal" ID="tab_14_w08_c12" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=8!14!13!3')"><asp:Label CssClass="normal" ID="tab_14_w08_c13" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=9!14!1!3')"><asp:Label CssClass="normal" ID="tab_14_w09_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=9!14!2!3')"><asp:Label CssClass="normal" ID="tab_14_w09_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=9!14!3!3')"><asp:Label CssClass="normal" ID="tab_14_w09_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=9!14!4!3')"><asp:Label CssClass="normal" ID="tab_14_w09_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=9!14!5!3')"><asp:Label CssClass="normal" ID="tab_14_w09_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=9!14!6!3')"><asp:Label CssClass="normal" ID="tab_14_w09_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=9!14!7!3')"><asp:Label CssClass="normal" ID="tab_14_w09_c07" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=9!14!8!3')"><asp:Label CssClass="normal" ID="tab_14_w09_c08" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=9!14!9!3')"><asp:Label CssClass="normal" ID="tab_14_w09_c09" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=9!14!10!3')"><asp:Label CssClass="normal" ID="tab_14_w09_c10" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=9!14!11!3')"><asp:Label CssClass="normal" ID="tab_14_w09_c11" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=9!14!12!3')"><asp:Label CssClass="normal" ID="tab_14_w09_c12" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=9!14!13!3')"><asp:Label CssClass="normal" ID="tab_14_w09_c13" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="borderAll col_50" rowspan="3"> 
      W</td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=10!14!1!3')"><asp:Label CssClass="normal" ID="tab_14_w10_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=10!14!2!3')"><asp:Label CssClass="normal" ID="tab_14_w10_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=10!14!3!3')"><asp:Label CssClass="normal" ID="tab_14_w10_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=10!14!4!3')"><asp:Label CssClass="normal" ID="tab_14_w10_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=10!14!5!3')"><asp:Label CssClass="normal" ID="tab_14_w10_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=10!14!6!3')"><asp:Label CssClass="normal" ID="tab_14_w10_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=10!14!7!3')"><asp:Label CssClass="normal" ID="tab_14_w10_c07" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=10!14!8!3')"><asp:Label CssClass="normal" ID="tab_14_w10_c08" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=10!14!9!3')"><asp:Label CssClass="normal" ID="tab_14_w10_c09" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=10!14!10!3')"><asp:Label CssClass="normal" ID="tab_14_w10_c10" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=10!14!11!3')"><asp:Label CssClass="normal" ID="tab_14_w10_c11" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=10!14!12!3')"><asp:Label CssClass="normal" ID="tab_14_w10_c12" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=10!14!13!3')"><asp:Label CssClass="normal" ID="tab_14_w10_c13" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=11!14!1!3')"><asp:Label CssClass="normal" ID="tab_14_w11_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=11!14!2!3')"><asp:Label CssClass="normal" ID="tab_14_w11_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=11!14!3!3')"><asp:Label CssClass="normal" ID="tab_14_w11_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=11!14!4!3')"><asp:Label CssClass="normal" ID="tab_14_w11_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=11!14!5!3')"><asp:Label CssClass="normal" ID="tab_14_w11_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=11!14!6!3')"><asp:Label CssClass="normal" ID="tab_14_w11_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=11!14!7!3')"><asp:Label CssClass="normal" ID="tab_14_w11_c07" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=11!14!8!3')"><asp:Label CssClass="normal" ID="tab_14_w11_c08" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=11!14!9!3')"><asp:Label CssClass="normal" ID="tab_14_w11_c09" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=11!14!10!3')"><asp:Label CssClass="normal" ID="tab_14_w11_c10" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=11!14!11!3')"><asp:Label CssClass="normal" ID="tab_14_w11_c11" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=11!14!12!3')"><asp:Label CssClass="normal" ID="tab_14_w11_c12" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=11!14!13!3')"><asp:Label CssClass="normal" ID="tab_14_w11_c13" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=12!14!1!3')"><asp:Label CssClass="normal" ID="tab_14_w12_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=12!14!2!3')"><asp:Label CssClass="normal" ID="tab_14_w12_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=12!14!3!3')"><asp:Label CssClass="normal" ID="tab_14_w12_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=12!14!4!3')"><asp:Label CssClass="normal" ID="tab_14_w12_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=12!14!5!3')"><asp:Label CssClass="normal" ID="tab_14_w12_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=12!14!6!3')"><asp:Label CssClass="normal" ID="tab_14_w12_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=12!14!7!3')"><asp:Label CssClass="normal" ID="tab_14_w12_c07" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=12!14!8!3')"><asp:Label CssClass="normal" ID="tab_14_w12_c08" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=12!14!9!3')"><asp:Label CssClass="normal" ID="tab_14_w12_c09" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=12!14!10!3')"><asp:Label CssClass="normal" ID="tab_14_w12_c10" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=12!14!11!3')"><asp:Label CssClass="normal" ID="tab_14_w12_c11" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=12!14!12!3')"><asp:Label CssClass="normal" ID="tab_14_w12_c12" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=12!14!13!3')"><asp:Label CssClass="normal" ID="tab_14_w12_c13" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="borderAll col_50" rowspan="3"> 
      Kop</td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=13!14!1!3')"><asp:Label CssClass="normal" ID="tab_14_w13_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=13!14!2!3')"><asp:Label CssClass="normal" ID="tab_14_w13_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=13!14!3!3')"><asp:Label CssClass="normal" ID="tab_14_w13_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=13!14!4!3')"><asp:Label CssClass="normal" ID="tab_14_w13_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=13!14!5!3')"><asp:Label CssClass="normal" ID="tab_14_w13_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=13!14!6!3')"><asp:Label CssClass="normal" ID="tab_14_w13_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=13!14!7!3')"><asp:Label CssClass="normal" ID="tab_14_w13_c07" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=13!14!8!3')"><asp:Label CssClass="normal" ID="tab_14_w13_c08" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=13!14!9!3')"><asp:Label CssClass="normal" ID="tab_14_w13_c09" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=13!14!10!3')"><asp:Label CssClass="normal" ID="tab_14_w13_c10" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=13!14!11!3')"><asp:Label CssClass="normal" ID="tab_14_w13_c11" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=13!14!12!3')"><asp:Label CssClass="normal" ID="tab_14_w13_c12" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=13!14!13!3')"><asp:Label CssClass="normal" ID="tab_14_w13_c13" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=14!14!1!3')"><asp:Label CssClass="normal" ID="tab_14_w14_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=14!14!2!3')"><asp:Label CssClass="normal" ID="tab_14_w14_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=14!14!3!3')"><asp:Label CssClass="normal" ID="tab_14_w14_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=14!14!4!3')"><asp:Label CssClass="normal" ID="tab_14_w14_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=14!14!5!3')"><asp:Label CssClass="normal" ID="tab_14_w14_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=14!14!6!3')"><asp:Label CssClass="normal" ID="tab_14_w14_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=14!14!7!3')"><asp:Label CssClass="normal" ID="tab_14_w14_c07" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=14!14!8!3')"><asp:Label CssClass="normal" ID="tab_14_w14_c08" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=14!14!9!3')"><asp:Label CssClass="normal" ID="tab_14_w14_c09" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=14!14!10!3')"><asp:Label CssClass="normal" ID="tab_14_w14_c10" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=14!14!11!3')"><asp:Label CssClass="normal" ID="tab_14_w14_c11" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=14!14!12!3')"><asp:Label CssClass="normal" ID="tab_14_w14_c12" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=14!14!13!3')"><asp:Label CssClass="normal" ID="tab_14_w14_c13" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=15!14!1!3')"><asp:Label CssClass="normal" ID="tab_14_w15_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=15!14!2!3')"><asp:Label CssClass="normal" ID="tab_14_w15_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=15!14!3!3')"><asp:Label CssClass="normal" ID="tab_14_w15_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=15!14!4!3')"><asp:Label CssClass="normal" ID="tab_14_w15_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=15!14!5!3')"><asp:Label CssClass="normal" ID="tab_14_w15_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=15!14!6!3')"><asp:Label CssClass="normal" ID="tab_14_w15_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=15!14!7!3')"><asp:Label CssClass="normal" ID="tab_14_w15_c07" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=15!14!8!3')"><asp:Label CssClass="normal" ID="tab_14_w15_c08" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=15!14!9!3')"><asp:Label CssClass="normal" ID="tab_14_w15_c09" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=15!14!10!3')"><asp:Label CssClass="normal" ID="tab_14_w15_c10" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=15!14!11!3')"><asp:Label CssClass="normal" ID="tab_14_w15_c11" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=15!14!12!3')"><asp:Label CssClass="normal" ID="tab_14_w15_c12" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=15!14!13!3')"><asp:Label CssClass="normal" ID="tab_14_w15_c13" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="borderAll col_50" rowspan="3"> 
      &nbsp;</td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=16!14!1!3')"><asp:Label CssClass="normal" ID="tab_14_w16_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=16!14!2!3')"><asp:Label CssClass="normal" ID="tab_14_w16_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=16!14!3!3')"><asp:Label CssClass="normal" ID="tab_14_w16_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=16!14!4!3')"><asp:Label CssClass="normal" ID="tab_14_w16_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=16!14!5!3')"><asp:Label CssClass="normal" ID="tab_14_w16_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=16!14!6!3')"><asp:Label CssClass="normal" ID="tab_14_w16_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=16!14!7!3')"><asp:Label CssClass="normal" ID="tab_14_w16_c07" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=16!14!8!3')"><asp:Label CssClass="normal" ID="tab_14_w16_c08" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=16!14!9!3')"><asp:Label CssClass="normal" ID="tab_14_w16_c09" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=16!14!10!3')"><asp:Label CssClass="normal" ID="tab_14_w16_c10" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=16!14!11!3')"><asp:Label CssClass="normal" ID="tab_14_w16_c11" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=16!14!12!3')"><asp:Label CssClass="normal" ID="tab_14_w16_c12" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=16!14!13!3')"><asp:Label CssClass="normal" ID="tab_14_w16_c13" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=17!14!1!3')"><asp:Label CssClass="normal" ID="tab_14_w17_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=17!14!2!3')"><asp:Label CssClass="normal" ID="tab_14_w17_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=17!14!3!3')"><asp:Label CssClass="normal" ID="tab_14_w17_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=17!14!4!3')"><asp:Label CssClass="normal" ID="tab_14_w17_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=17!14!5!3')"><asp:Label CssClass="normal" ID="tab_14_w17_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=17!14!6!3')"><asp:Label CssClass="normal" ID="tab_14_w17_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=17!14!7!3')"><asp:Label CssClass="normal" ID="tab_14_w17_c07" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=17!14!8!3')"><asp:Label CssClass="normal" ID="tab_14_w17_c08" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=17!14!9!3')"><asp:Label CssClass="normal" ID="tab_14_w17_c09" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=17!14!10!3')"><asp:Label CssClass="normal" ID="tab_14_w17_c10" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=17!14!11!3')"><asp:Label CssClass="normal" ID="tab_14_w17_c11" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=17!14!12!3')"><asp:Label CssClass="normal" ID="tab_14_w17_c12" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=17!14!13!3')"><asp:Label CssClass="normal" ID="tab_14_w17_c13" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=18!14!1!3')"><asp:Label CssClass="normal" ID="tab_14_w18_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=18!14!2!3')"><asp:Label CssClass="normal" ID="tab_14_w18_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=18!14!3!3')"><asp:Label CssClass="normal" ID="tab_14_w18_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=18!14!4!3')"><asp:Label CssClass="normal" ID="tab_14_w18_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=18!14!5!3')"><asp:Label CssClass="normal" ID="tab_14_w18_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=18!14!6!3')"><asp:Label CssClass="normal" ID="tab_14_w18_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=18!14!7!3')"><asp:Label CssClass="normal" ID="tab_14_w18_c07" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=18!14!8!3')"><asp:Label CssClass="normal" ID="tab_14_w18_c08" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=18!14!9!3')"><asp:Label CssClass="normal" ID="tab_14_w18_c09" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=18!14!10!3')"><asp:Label CssClass="normal" ID="tab_14_w18_c10" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=18!14!11!3')"><asp:Label CssClass="normal" ID="tab_14_w18_c11" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=18!14!12!3')"><asp:Label CssClass="normal" ID="tab_14_w18_c12" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50"> 
  <a href="javascript: openPopup('popup.aspx?sesja=18!14!13!3')"><asp:Label CssClass="normal" ID="tab_14_w18_c13" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="borderAll col_50 gray" rowspan="3"> 
      RAZEM</td>
  <td class="borderAll col_50 gray" colspan="2"> 
  <a href="javascript: openPopup('popup.aspx?sesja=19!14!1!3')"><asp:Label CssClass="normal" ID="tab_14_w19_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=19!14!2!3')"><asp:Label CssClass="normal" ID="tab_14_w19_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=19!14!3!3')"><asp:Label CssClass="normal" ID="tab_14_w19_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=19!14!4!3')"><asp:Label CssClass="normal" ID="tab_14_w19_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=19!14!5!3')"><asp:Label CssClass="normal" ID="tab_14_w19_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=19!14!6!3')"><asp:Label CssClass="normal" ID="tab_14_w19_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=19!14!7!3')"><asp:Label CssClass="normal" ID="tab_14_w19_c07" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=19!14!8!3')"><asp:Label CssClass="normal" ID="tab_14_w19_c08" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=19!14!9!3')"><asp:Label CssClass="normal" ID="tab_14_w19_c09" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=19!14!10!3')"><asp:Label CssClass="normal" ID="tab_14_w19_c10" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=19!14!11!3')"><asp:Label CssClass="normal" ID="tab_14_w19_c11" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=19!14!12!3')"><asp:Label CssClass="normal" ID="tab_14_w19_c12" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=19!14!13!3')"><asp:Label CssClass="normal" ID="tab_14_w19_c13" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="borderAll col_50 gray" colspan="2"> 
  <a href="javascript: openPopup('popup.aspx?sesja=20!14!1!3')"><asp:Label CssClass="normal" ID="tab_14_w20_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=20!14!2!3')"><asp:Label CssClass="normal" ID="tab_14_w20_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=20!14!3!3')"><asp:Label CssClass="normal" ID="tab_14_w20_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=20!14!4!3')"><asp:Label CssClass="normal" ID="tab_14_w20_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=20!14!5!3')"><asp:Label CssClass="normal" ID="tab_14_w20_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=20!14!6!3')"><asp:Label CssClass="normal" ID="tab_14_w20_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=20!14!7!3')"><asp:Label CssClass="normal" ID="tab_14_w20_c07" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=20!14!8!3')"><asp:Label CssClass="normal" ID="tab_14_w20_c08" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=20!14!9!3')"><asp:Label CssClass="normal" ID="tab_14_w20_c09" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=20!14!10!3')"><asp:Label CssClass="normal" ID="tab_14_w20_c10" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=20!14!11!3')"><asp:Label CssClass="normal" ID="tab_14_w20_c11" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=20!14!12!3')"><asp:Label CssClass="normal" ID="tab_14_w20_c12" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=20!14!13!3')"><asp:Label CssClass="normal" ID="tab_14_w20_c13" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="borderAll col_50 gray" colspan="2"> 
  <a href="javascript: openPopup('popup.aspx?sesja=21!14!1!3')"><asp:Label CssClass="normal" ID="tab_14_w21_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=21!14!2!3')"><asp:Label CssClass="normal" ID="tab_14_w21_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=21!14!3!3')"><asp:Label CssClass="normal" ID="tab_14_w21_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=21!14!4!3')"><asp:Label CssClass="normal" ID="tab_14_w21_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=21!14!5!3')"><asp:Label CssClass="normal" ID="tab_14_w21_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=21!14!6!3')"><asp:Label CssClass="normal" ID="tab_14_w21_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=21!14!7!3')"><asp:Label CssClass="normal" ID="tab_14_w21_c07" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=21!14!8!3')"><asp:Label CssClass="normal" ID="tab_14_w21_c08" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=21!14!9!3')"><asp:Label CssClass="normal" ID="tab_14_w21_c09" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=21!14!10!3')"><asp:Label CssClass="normal" ID="tab_14_w21_c10" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=21!14!11!3')"><asp:Label CssClass="normal" ID="tab_14_w21_c11" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=21!14!12!3')"><asp:Label CssClass="normal" ID="tab_14_w21_c12" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=21!14!13!3')"><asp:Label CssClass="normal" ID="tab_14_w21_c13" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="borderAll col_50 gray"> 
      OGÓŁEM za okres oceny</td>
  <td class="borderAll col_50 gray" colspan="2"> 
  <a href="javascript: openPopup('popup.aspx?sesja=22!14!1!3')"><asp:Label CssClass="normal" ID="tab_14_w22_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=22!14!2!3')"><asp:Label CssClass="normal" ID="tab_14_w22_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=22!14!3!3')"><asp:Label CssClass="normal" ID="tab_14_w22_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=22!14!4!3')"><asp:Label CssClass="normal" ID="tab_14_w22_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=22!14!5!3')"><asp:Label CssClass="normal" ID="tab_14_w22_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=22!14!6!3')"><asp:Label CssClass="normal" ID="tab_14_w22_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=22!14!7!3')"><asp:Label CssClass="normal" ID="tab_14_w22_c07" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=22!14!8!3')"><asp:Label CssClass="normal" ID="tab_14_w22_c08" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=22!14!9!3')"><asp:Label CssClass="normal" ID="tab_14_w22_c09" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=22!14!10!3')"><asp:Label CssClass="normal" ID="tab_14_w22_c10" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=22!14!11!3')"><asp:Label CssClass="normal" ID="tab_14_w22_c11" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=22!14!12!3')"><asp:Label CssClass="normal" ID="tab_14_w22_c12" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_50 gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=22!14!13!3')"><asp:Label CssClass="normal" ID="tab_14_w22_c13" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
 </table> 

            <br />
        </div>

        <div>
            Raport statystyczny
                    <asp:Label ID="Label27" runat="server"></asp:Label>
            &nbsp;Sporzadzone dn.
            <asp:Label ID="Label29" runat="server"></asp:Label>&nbsp;przez&nbsp;
&nbsp;&nbsp;
            <asp:Label ID="Label28" runat="server"></asp:Label>
            &nbsp;<asp:Label ID="Label30" runat="server"></asp:Label>
            <br />

            <asp:Label ID="Label16" runat="server"></asp:Label>
        </div>
    </div>
</asp:Content>