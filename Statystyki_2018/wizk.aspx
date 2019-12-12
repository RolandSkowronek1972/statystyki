﻿<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="wizk.aspx.cs" Inherits="stat2018.wizk" %>

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

            <asp:Label ID="Label3" runat="server"></asp:Label>
            <br />
            <br />
            <br />

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
                        <asp:TextBox ID="tab_1_w01_c01" runat="server" Width="90%" BorderStyle="None" Height="60px" TextMode="MultiLine">0</asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="col_500 wciecie borderAll">1.4. Osoba/osoby przeprowadzająca/e wizytacjęI.2. Prezes sądu odpowiedzialny za przeprowadzenie wizytacji</td>
                    <td class="borderAll wciecie">
                        <asp:TextBox ID="tab_1_w02_c01" runat="server" Rows="4" Width="90%" BorderStyle="None" Height="60px" TextMode="MultiLine">0</asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="col_500 wciecie borderAll">I.3. Wizytowany wydział sądu</td>
                    <td class="borderAll wciecie">
                        <asp:TextBox ID="tab_1_w03_c01" runat="server" Width="90%" BorderStyle="None" Height="60px" TextMode="MultiLine">0</asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="col_500 wciecie borderAll">1.4. Osoba/osoby przeprowadzająca/e wizytację</td>
                    <td class="borderAll wciecie">
                        <asp:TextBox ID="tab_1_w04_c01" runat="server" Width="90%" BorderStyle="None" Height="60px" TextMode="MultiLine">0</asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="col_500 wciecie borderAll">I.5. Termin przeprowadzenia wizytacji</td>
                    <td class="borderAll wciecie">
                        <asp:TextBox ID="tab_1_w05_c01" runat="server" Width="90%" BorderStyle="None" Height="60px" TextMode="MultiLine">0</asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="col_500 wciecie borderAll">I.6. Okres objęty wizytacją</td>
                    <td class="borderAll wciecie">
                        <asp:TextBox ID="tab_1_w06_c01" runat="server" Width="90%" BorderStyle="None" Height="60px" TextMode="MultiLine"></asp:TextBox>
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
                        <asp:TextBox ID="tab_2_w01_c01" runat="server" Rows="4" TextMode="MultiLine" Width="90%" BorderStyle="None" Height="60px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="col_500 wciecie borderAll">II.2. Osoba/osoby przeprowadzająca/e poprzednią wizytację</td>
                    <td class="borderAll wciecie">
                        <asp:TextBox ID="tab_2_w02_c01" runat="server" Rows="4" TextMode="MultiLine" Width="90%" BorderStyle="None" Height="60px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="col_500 wciecie borderAll">III.3. Okres objęty poprzednia wizytacją </td>
                    <td class="borderAll wciecie">
                        <asp:TextBox ID="tab_2_w03_c01" runat="server" Width="90%" BorderStyle="None" Height="60px" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="col_500 wciecie borderAll">II.4. Wykonanie zarządzeń nadzorczych wydanych w wyniku przeprowadzenia poprzedniej wizytacji</td>
                    <td class="borderAll wciecie">
                        <asp:TextBox ID="tab_2_w04_c01" runat="server" Rows="4" TextMode="MultiLine" Width="90%" BorderStyle="None" Height="60px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="col_500 wciecie borderAll">II.5. Czynności nadzorcze podjęte po zakonczeniu poprzedniej wizytacji</td>
                    <td class="borderAll wciecie">
                        <asp:TextBox ID="tab_2_w05_c01" runat="server" Rows="4" TextMode="MultiLine" Width="90%" BorderStyle="None" Height="60px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="col_500 wciecie borderAll">II.6. Wykonanie zarządzeń nadzorczych wydanych w wyniku czynności nadzorczych, o których mowa w II.5.</td>
                    <td class="borderAll wciecie">
                        <asp:TextBox ID="tab_2_w06_c01" runat="server" Rows="4" TextMode="MultiLine" Width="90%" BorderStyle="None" Height="60px"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>

        <div class="page-break">

            <br />

            <asp:PlaceHolder runat="server" ID="PlaceHolderTB3"></asp:PlaceHolder>
            <br />
            <br />
        </div>
        <div class="page-break">

            &nbsp;&nbsp;&nbsp;
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

            <asp:Label ID="Label1" runat="server" Text="III.2. Referendarze sądowi (wg objaśnień: w zestawieniu należy uwzględnić także referendarzy sądowych delegowanych)"></asp:Label>
            &nbsp;&nbsp;&nbsp;
           <asp:Label ID="Label17" runat="server" Text="tabela  7 \/\/\/" Visible="True"></asp:Label>
            <br />
            <table>
                <tr><td>
                    III.3.2. Obowiązujące w wydziale zasady przydziału pracy asystenom sędziów
                    </td></tr>
                <tr><td>
                                            <a href="javascript: openPopup('popup.aspx?sesja=1!7!1!3')">
                            <asp:Label CssClass="normal" ID="tab_7_w01_c01" runat="server" Text="0"></asp:Label></a>
                    </td></tr>
                <tr><td>
                    Uwagi:
                    </td></tr>
                <tr><td>
                                            <a href="javascript: openPopup('popup.aspx?sesja=2!7!1!3')">
                            <asp:Label CssClass="normal" ID="tab_7_w02_c01" runat="server" Text="0"></asp:Label></a>
                    </td></tr>
                <tr><td>

                    </td></tr>

            </table>
            <br />
        </div>
        <div class="page-break">

            <asp:Label ID="Label2" runat="server" Text="III.2. Referendarze sądowi (wg objaśnień: w zestawieniu należy uwzględnić także referendarzy sądowych delegowanych)"></asp:Label>
            &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel7" runat="server" Text="tabela  8 \/\/\/" Visible="True"></asp:Label>
            <br />
            <asp:PlaceHolder runat="server" ID="PlaceHolderTB7"></asp:PlaceHolder>
            <br />
        </div>
        <div class="page-break">

            <asp:Label ID="Label7" runat="server" Text="III.4. Zmiany limitów i obsad we wszystkich grupach zatrudnienia"></asp:Label>
            &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel8" runat="server" Text="tabela  9 \/\/\/" Visible="True"></asp:Label>
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
        <div id="TABELA9" class="page-break">
            <br />
            <table style="width: 100%;">
                <tr>
                    <td class="wciecie borderAll">III.5. Liczba osób wykonujących czynności na innej podstawie niż stosunek pracy, w tym stażyści z urzędów pracy ( podstawa zatrudnienia, okres wykonywania czynności)</td>
                    <td class="col_500F center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!1!3')">
                            <asp:TextBox CssClass="normal" ID="tab_10_w01_c01" runat="server" Text="0" Width="90%" Height="60px" TextMode="MultiLine"></asp:TextBox></a></td>
                </tr>
                <tr>
                    <td class="wciecie borderAll">III.6. Warunki pracy (liczba sal rozpraw itp., uwagi)</td>
                    <td class="col_500F center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!1!3')">
                            <asp:TextBox CssClass="normal" ID="tab_10_w02_c01" runat="server" Text="0" Width="90%" Height="60px" TextMode="MultiLine"></asp:TextBox></a></td>
                </tr>
                <tr>
                    <td class="wciecie borderAll">III.7. Wnioski</td>
                    <td class="col_500F center borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!1!3')">
                            <asp:TextBox CssClass="normal" ID="tab_10_w03_c01" runat="server" Text="0" Width="90%" Height="60px" TextMode="MultiLine"></asp:TextBox></a></td>
                </tr>
            </table>
            <br />
        </div>
        <div id="TABELA10" class="page-break">
            <asp:Label ID="Label8" runat="server" Text=" IV.1. Ruch spraw i obciążenie sędziów i referendarzy sądowych w wydziale (ogółem)"></asp:Label>
            &nbsp;&nbsp;&nbsp;
           <asp:Label ID="Label9" runat="server" Text="tabela  11 \/\/\/" Visible="True"></asp:Label>
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
                            <asp:Label CssClass="normal" ID="tab_11_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!2!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!3!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!4!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!5!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!6!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!7!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!8!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!9!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!10!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!11!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!12!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!13!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!14!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!15!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!16!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!17!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!18!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!19!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!20!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!21!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!22!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!23!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!24!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c24" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!25!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!27!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!27!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!28!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!29!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!30!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!31!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!32!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!33!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!34!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!35!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!10!36!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w01_c36" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81" rowspan="3">Kp</td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!1!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!2!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!3!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!4!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!5!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!6!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!7!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!8!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!9!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!10!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!11!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!12!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81">

                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!13!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!14!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!15!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!16!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!17!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!18!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!19!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!20!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!21!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!22!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!23!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!24!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c24" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!25!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!27!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!28!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!28!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!29!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!30!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!31!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!32!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!33!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!34!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!35!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!10!36!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w02_c36" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81" rowspan="3">Ko</td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!1!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!2!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!3!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!4!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!5!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!6!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!7!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!8!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!9!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!10!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!11!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!12!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!13!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!14!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!15!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!16!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!17!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!18!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!19!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!20!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!21!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!22!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!23!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!24!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c24" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!25!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!27!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!28!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!28!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!29!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!30!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!31!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!32!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!33!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!34!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!35!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!10!36!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w03_c36" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81" rowspan="3">W</td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!1!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!2!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!3!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!4!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!5!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!6!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!7!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!8!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!9!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!10!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!11!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!12!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!13!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!14!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!15!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!16!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!17!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!18!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!19!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!20!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!21!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!22!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!23!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!24!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c24" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!25!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c25" runat="server" Text="0"></asp:Label></a></td>

                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!27!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!28!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!28!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!29!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!30!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!31!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!32!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!33!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!34!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!35!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!10!36!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w04_c36" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81" rowspan="3">Kop</td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!1!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!2!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!3!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!4!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!5!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!6!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!7!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!8!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!9!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!10!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!11!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!12!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!13!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!14!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!15!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!16!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!17!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!18!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!19!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!20!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!21!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!22!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!23!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!24!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c24" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!25!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!27!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!28!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!28!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!29!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!30!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!31!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!32!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!33!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!34!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!35!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!10!36!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w05_c36" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81" rowspan="3"></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!1!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!2!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!3!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!4!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!5!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!6!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!7!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!8!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!9!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!10!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!11!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!12!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!13!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!14!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!15!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!16!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!17!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!18!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!19!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!20!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!21!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!22!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!23!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!24!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c24" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!25!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!27!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!28!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!28!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!29!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!30!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!31!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!32!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!33!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!34!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!35!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!10!36!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w06_c36" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81 gray" rowspan="3">Razem</td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!1!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!2!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!3!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!4!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!5!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!6!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!7!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!8!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!9!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!10!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!11!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!12!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!13!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c13" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!14!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c14" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!15!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c15" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!16!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c16" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!17!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c17" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!18!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c18" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!19!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c19" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!20!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c20" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!21!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c21" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!22!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c22" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!23!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c23" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!24!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c24" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!25!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c25" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!27!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c26" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!28!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c27" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!28!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c28" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!29!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c29" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!30!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c30" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!31!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c31" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!32!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c32" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!33!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c33" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!34!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c34" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!35!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c35" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!10!36!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w07_c36" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_81 gray">Ogółem za okres oceny</td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!10!1!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w08_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!10!2!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w08_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!10!3!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w08_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!10!4!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w08_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!10!5!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w08_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!10!6!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w08_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!10!7!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w08_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!10!8!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w08_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!10!9!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w08_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!10!10!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w08_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!10!11!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w08_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_81 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!10!12!3')">
                            <asp:Label CssClass="normal" ID="tab_11_w08_c12" runat="server" Text="0"></asp:Label></a></td>
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
           <asp:Label ID="infoLabel13" runat="server" Text="tabela  14 \/\/\/" Visible="True"></asp:Label>
            <br />
            <asp:PlaceHolder runat="server" ID="PlaceHolderTB13"></asp:PlaceHolder>
            <br />
        </div>

        <div class="page-break">
            <br />
            <asp:Label ID="Label12" runat="server" Text="Dział IV.2.3. Ruch spraw i obciążenie poszczególnych sędziów"></asp:Label>
            &nbsp;&nbsp;&nbsp;
           <asp:Label ID="InfoLabel14" runat="server" Text="tabela  15 \/\/\/" Visible="True"></asp:Label>
            <br />
            <table style="width: 100%;">
                <tr>
                    <td class="borderAll center" rowspan="19">OGÓŁEM SSR
                    </td>
                    <td class="borderAll center">kategoria spraw</td>
                    <td class="borderAll center">rok</td>
                    <td class="borderAll center">wpływ</td>
                    <td class="borderAll center">załatwienia</td>
                    <td class="borderAll center">pozostałość</td>
                    <td class="borderAll center">sprawy zawieszone</td>
                    <td class="borderAll center">wpływ na sędziego według liczby sędziów i wakujących stanowisk sędziowskich w ramach limitu (w okresie statystycznym)</td>
                    <td class="borderAll center">załatwienia na sędziego według liczby sędziów i wakujących stanowisk sędziowskich w ramach limitu (w okresie statystycznym)</td>
                    <td class="borderAll center">pozostałość na sędziego według liczby sędziów i wakujących stanowisk sędziowskich w ramach limitu (w okresie statystycznym)</td>
                    <td class="borderAll center">wpływ na sędziego według obsady średniookresowej (efektywnego czasu pracy)</td>
                    <td class="borderAll center">załatwienia na sędziego według obsady średniookresowej (efektywnego czasu pracy)</td>
                    <td class="borderAll center">pozostałość na sędziego według obsady średniookresowej (wg limitu w okresie statystycznym)</td>
                    <td class="borderAll center">wskaźnik pozostałości</td>
                    <td class="borderAll center">efektywny czas pracy</td>
                </tr>
                <tr>
                    <td class="borderAll col_50" rowspan="3">K</td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!15!1!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!15!2!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!15!3!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!15!4!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!15!5!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!15!6!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!15!7!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!15!8!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w01_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!15!9!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w01_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!15!10!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w01_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!15!11!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w01_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!15!12!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w01_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!15!13!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w01_c13" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!15!1!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!15!2!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!15!3!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!15!4!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w02_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!15!5!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w02_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!15!6!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w02_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!15!7!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w02_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!15!8!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w02_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!15!9!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w02_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!15!10!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w02_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!15!11!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w02_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!15!12!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w02_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!15!13!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w02_c13" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!15!1!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!15!2!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!15!3!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!15!4!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w03_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!15!5!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w03_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!15!6!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w03_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!15!7!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w03_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!15!8!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w03_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!15!9!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w03_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!15!10!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w03_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!15!11!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w03_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!15!12!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w03_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!15!13!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w03_c13" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_50" rowspan="3">Kp</td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!15!1!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!15!2!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!15!3!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!15!4!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w04_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!15!5!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w04_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!15!6!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w04_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!15!7!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w04_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!15!8!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w04_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!15!9!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w04_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!15!10!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w04_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!15!11!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w04_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!15!12!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w04_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!15!13!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w04_c13" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!15!1!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!15!2!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w05_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!15!3!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w05_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!15!4!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w05_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!15!5!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w05_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!15!6!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w05_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!15!7!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w05_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!15!8!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w05_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!15!9!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w05_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!15!10!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w05_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!15!11!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w05_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!15!12!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w05_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!15!13!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w05_c13" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!15!1!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!15!2!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w06_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!15!3!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w06_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!15!4!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w06_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!15!5!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w06_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!15!6!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w06_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!15!7!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w06_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!15!8!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w06_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!15!9!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w06_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!15!10!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w06_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!15!11!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w06_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!15!12!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w06_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!15!13!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w06_c13" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_50" rowspan="3">Ko</td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!15!1!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w07_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!15!2!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w07_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!15!3!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w07_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!15!4!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w07_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!15!5!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w07_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!15!6!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w07_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!15!7!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w07_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!15!8!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w07_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!15!9!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w07_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!15!10!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w07_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!15!11!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w07_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!15!12!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w07_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!15!13!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w07_c13" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!15!1!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w08_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!15!2!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w08_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!15!3!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w08_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!15!4!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w08_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!15!5!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w08_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!15!6!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w08_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!15!7!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w08_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!15!8!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w08_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!15!9!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w08_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!15!10!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w08_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!15!11!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w08_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!15!12!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w08_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!15!13!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w08_c13" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!15!1!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w09_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!15!2!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w09_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!15!3!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w09_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!15!4!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w09_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!15!5!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w09_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!15!6!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w09_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!15!7!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w09_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!15!8!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w09_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!15!9!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w09_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!15!10!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w09_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!15!11!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w09_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!15!12!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w09_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!15!13!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w09_c13" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_50" rowspan="3">W</td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!15!1!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w10_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!15!2!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w10_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!15!3!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w10_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!15!4!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w10_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!15!5!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w10_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!15!6!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w10_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!15!7!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w10_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!15!8!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w10_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!15!9!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w10_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!15!10!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w10_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!15!11!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w10_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!15!12!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w10_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!15!13!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w10_c13" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!15!1!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w11_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!15!2!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w11_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!15!3!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w11_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!15!4!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w11_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!15!5!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w11_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!15!6!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w11_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!15!7!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w11_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!15!8!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w11_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!15!9!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w11_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!15!10!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w11_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!15!11!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w11_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!15!12!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w11_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!15!13!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w11_c13" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!15!1!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w12_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!15!2!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w12_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!15!3!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w12_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!15!4!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w12_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!15!5!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w12_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!15!6!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w12_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!15!7!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w12_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!15!8!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w12_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!15!9!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w12_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!15!10!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w12_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!15!11!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w12_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!15!12!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w12_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!15!13!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w12_c13" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_50" rowspan="3">Kop</td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!15!1!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w13_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!15!2!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w13_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!15!3!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w13_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!15!4!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w13_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!15!5!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w13_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!15!6!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w13_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!15!7!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w13_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!15!8!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w13_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!15!9!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w13_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!15!10!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w13_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!15!11!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w13_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!15!12!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w13_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!15!13!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w13_c13" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!15!1!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w14_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!15!2!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w14_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!15!3!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w14_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!15!4!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w14_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!15!5!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w14_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!15!6!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w14_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!15!7!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w14_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!15!8!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w14_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!15!9!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w14_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!15!10!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w14_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!15!11!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w14_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!15!12!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w14_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!15!13!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w14_c13" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!15!1!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w15_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!15!2!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w15_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!15!3!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w15_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!15!4!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w15_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!15!5!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w15_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!15!6!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w15_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!15!7!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w15_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!15!8!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w15_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!15!9!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w15_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!15!10!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w15_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!15!11!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w15_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!15!12!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w15_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!15!13!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w15_c13" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_50" rowspan="3">&nbsp;</td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!15!1!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w16_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!15!2!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w16_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!15!3!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w16_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!15!4!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w16_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!15!5!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w16_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!15!6!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w16_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!15!7!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w16_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!15!8!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w16_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!15!9!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w16_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!15!10!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w16_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!15!11!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w16_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!15!12!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w16_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!15!13!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w16_c13" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!15!1!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w17_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!15!2!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w17_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!15!3!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w17_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!15!4!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w17_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!15!5!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w17_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!15!6!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w17_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!15!7!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w17_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!15!8!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w17_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!15!9!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w17_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!15!10!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w17_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!15!11!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w17_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!15!12!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w17_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!15!13!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w17_c13" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!15!1!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w18_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!15!2!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w18_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!15!3!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w18_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!15!4!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w18_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!15!5!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w18_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!15!6!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w18_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!15!7!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w18_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!15!8!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w18_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!15!9!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w18_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!15!10!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w18_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!15!11!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w18_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!15!12!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w18_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!15!13!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w18_c13" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_50 gray" rowspan="3">RAZEM</td>
                    <td class="borderAll col_50 gray" colspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!15!1!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w19_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!15!2!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w19_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!15!3!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w19_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!15!4!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w19_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!15!5!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w19_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!15!6!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w19_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!15!7!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w19_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!15!8!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w19_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!15!9!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w19_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!15!10!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w19_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!15!11!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w19_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!15!12!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w19_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!15!13!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w19_c13" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_50 gray" colspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!15!1!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w20_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!15!2!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w20_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!15!3!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w20_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!15!4!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w20_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!15!5!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w20_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!15!6!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w20_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!15!7!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w20_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!15!8!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w20_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!15!9!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w20_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!15!10!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w20_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!15!11!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w20_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!15!12!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w20_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!15!13!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w20_c13" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_50 gray" colspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!15!1!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w21_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!15!2!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w21_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!15!3!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w21_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!15!4!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w21_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!15!5!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w21_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!15!6!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w21_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!15!7!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w21_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!15!8!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w21_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!15!9!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w21_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!15!10!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w21_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!15!11!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w21_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!15!12!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w21_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!15!13!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w21_c13" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_50 gray">OGÓŁEM za okres oceny</td>
                    <td class="borderAll col_50 gray" colspan="2">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!15!1!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w22_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!15!2!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w22_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!15!3!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w22_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!15!4!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w22_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!15!5!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w22_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!15!6!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w22_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!15!7!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w22_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!15!8!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w22_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!15!9!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w22_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!15!10!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w22_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!15!11!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w22_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!15!12!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w22_c12" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_50 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!15!13!3')">
                            <asp:Label CssClass="normal" ID="tab_15_w22_c13" runat="server" Text="0"></asp:Label></a></td>
                </tr>
            </table>

            <br />
        </div>

        <div class="page-break">
            <br />
            <asp:Label ID="Label14" runat="server" Text="Dział IV.2.4. Ruch spraw i obciążenie poszczególnych referendarzy sądowych"></asp:Label>
            &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel15" runat="server" Text="tabela  16 \/\/\/" Visible="True"></asp:Label>
            <br />
            <asp:PlaceHolder runat="server" ID="PlaceHolderTB15"></asp:PlaceHolder>
            <br />
        </div>

        <div id="TABELA16" class="page-break">
            <br />
            <asp:Label ID="Label20" runat="server" Text="Dział IV.2.4. Ruch spraw i obciążenie poszczególnych referendarzy sądowych"></asp:Label>
            &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel16" runat="server" Text="tabela  17 \/\/\/" Visible="True"></asp:Label>
            <br />

            <table style="width: 100%;">
                <tr>
                    <td class="borderAll col_500 wciecie">IV.3.1. Prawidłowość przydzielania spraw przez przewodniczącego wydziału oraz przestrzeganie zasady równomiernego obciążania pracą sędziów</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!17!1!3')">
                            <asp:Label CssClass="normal" ID="tab_17_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_500 wciecie">IV.3.2. Prawidłowość przydzielania spraw przez przewodniczącego wydziału oraz przestrzeganie zasady równomiernego obciążania pracą referendarzy sądowych</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!17!1!3')">
                            <asp:Label CssClass="normal" ID="tab_17_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_500 wciecie">IV.3.3. Przestrzeganie zasady równomiernego obciążania pracą asystentów sędziów</td>
                    <td class="borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!17!1!3')">
                            <asp:Label CssClass="normal" ID="tab_17_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                </tr>
            </table>
        </div>

        <div id="TABELA17" class="page-break">
            <br />
            <asp:Label ID="Label13" runat="server" Text="IV. 4.1. Czas trwania postępowania sądowego od dnia pierwszej rejestracji do dnia zakończenia sprawy w danej instancji w wydziale (liczba spraw – ogółem)"></asp:Label>
            &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel17" runat="server" Text="tabela  18 \/\/\/" Visible="True"></asp:Label>

            <table style="width: 100%;">
                <tr>
                    <td class="borderAll center" rowspan="2">Kategoria spraw</td>
                    <td class="borderAll center" colspan="12">SUMA</td>
                </tr>
                <tr>
                    <td class="borderAll center">do 3 miesięcy</td>
                    <td class="borderAll center">suma powyżej 3 miesięcy</td>
                    <td class="borderAll center">powyżej 3 do 6 miesięcy</td>
                    <td class="borderAll center">powyżej 6 do 12 miesięcy</td>
                    <td class="borderAll center">suma powyżej 12 miesięcy</td>
                    <td class="borderAll center">powyżej 12 miesięcy do 2 lat</td>
                    <td class="borderAll center">powyżej 2 do 3 lat</td>
                    <td class="borderAll center">suma powyżej 3 lat</td>
                    <td class="borderAll center">powyżej 3 do 5 lat</td>
                    <td class="borderAll center">powyżej 5 do 8 lat</td>
                    <td class="borderAll center">ponad 8 lat</td>
                    <td class="borderAll center">SUMA</td>
                </tr>
                <tr>
                    <td class="borderAll center col_50" rowspan="3">K</td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!18!1!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!18!2!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!18!3!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!18!4!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!18!5!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!18!6!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!18!7!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!18!8!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w01_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!18!9!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w01_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!18!10!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w01_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!18!11!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w01_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!18!12!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w01_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!18!1!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!18!2!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!18!3!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!18!4!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w02_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!18!5!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w02_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!18!6!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w02_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!18!7!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w02_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!18!8!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w02_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!18!9!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w02_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!18!10!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w02_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!18!11!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w02_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!18!12!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w02_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!18!1!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!18!2!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!18!3!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!18!4!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w03_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!18!5!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w03_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!18!6!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w03_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!18!7!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w03_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!18!8!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w03_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!18!9!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w03_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!18!10!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w03_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!18!11!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w03_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!18!12!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w03_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_50" rowspan="3">Kp<br />
                    </td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!18!1!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!18!2!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!18!3!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!18!4!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w04_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!18!5!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w04_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!18!6!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w04_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!18!7!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w04_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!18!8!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w04_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!18!9!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w04_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!18!10!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w04_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!18!11!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w04_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!18!12!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w04_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!18!1!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!18!2!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w05_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!18!3!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w05_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!18!4!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w05_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!18!5!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w05_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!18!6!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w05_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!18!7!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w05_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!18!8!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w05_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!18!9!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w05_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!18!10!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w05_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!18!11!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w05_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!18!12!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w05_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!18!1!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!18!2!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w06_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!18!3!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w06_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!18!4!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w06_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!18!5!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w06_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!18!6!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w06_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!18!7!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w06_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!18!8!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w06_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!18!9!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w06_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!18!10!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w06_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!18!11!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w06_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!18!12!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w06_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_50" rowspan="3">Ko</td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!18!1!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w07_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!18!2!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w07_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!18!3!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w07_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!18!4!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w07_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!18!5!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w07_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!18!6!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w07_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!18!7!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w07_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!18!8!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w07_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!18!9!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w07_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!18!10!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w07_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!18!11!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w07_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!18!12!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w07_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!18!1!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w08_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!18!2!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w08_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!18!3!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w08_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!18!4!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w08_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!18!5!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w08_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!18!6!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w08_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!18!7!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w08_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!18!8!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w08_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!18!9!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w08_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!18!10!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w08_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!18!11!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w08_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!18!12!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w08_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!18!1!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w09_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!18!2!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w09_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!18!3!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w09_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!18!4!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w09_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!18!5!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w09_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!18!6!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w09_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!18!7!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w09_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!18!8!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w09_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!18!9!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w09_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!18!10!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w09_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!18!11!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w09_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!18!12!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w09_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_50" rowspan="3">W<br />
                    </td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!18!1!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w10_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!18!2!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w10_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!18!3!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w10_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!18!4!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w10_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!18!5!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w10_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!18!6!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w10_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!18!7!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w10_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!18!8!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w10_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!18!9!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w10_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!18!10!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w10_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!18!11!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w10_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!18!12!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w10_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!18!1!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w11_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!18!2!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w11_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!18!3!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w11_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!18!4!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w11_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!18!5!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w11_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!18!6!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w11_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!18!7!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w11_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!18!8!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w11_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!18!9!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w11_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!18!10!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w11_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!18!11!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w11_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!18!12!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w11_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!18!1!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w12_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!18!2!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w12_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!18!3!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w12_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!18!4!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w12_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!18!5!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w12_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!18!6!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w12_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!18!7!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w12_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!18!8!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w12_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!18!9!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w12_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!18!10!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w12_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!18!11!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w12_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!18!12!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w12_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_50" rowspan="3">Kop</td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!18!1!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w13_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!18!2!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w13_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!18!3!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w13_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!18!4!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w13_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!18!5!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w13_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!18!6!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w13_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!18!7!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w13_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!18!8!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w13_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!18!9!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w13_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!18!10!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w13_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!18!11!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w13_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!18!12!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w13_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!18!1!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w14_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!18!2!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w14_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!18!3!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w14_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!18!4!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w14_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!18!5!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w14_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!18!6!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w14_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!18!7!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w14_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!18!8!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w14_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!18!9!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w14_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!18!10!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w14_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!18!11!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w14_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!18!12!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w14_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!18!1!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w15_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!18!2!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w15_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!18!3!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w15_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!18!4!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w15_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!18!5!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w15_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!18!6!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w15_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!18!7!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w15_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!18!8!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w15_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!18!9!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w15_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!18!10!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w15_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!18!11!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w15_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!18!12!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w15_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_50" rowspan="3">&nbsp;</td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!18!1!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w16_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!18!2!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w16_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!18!3!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w16_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!18!4!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w16_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!18!5!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w16_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!18!6!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w16_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!18!7!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w16_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!18!8!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w16_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!18!9!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w16_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!18!10!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w16_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!18!11!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w16_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!18!12!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w16_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!18!1!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w17_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!18!2!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w17_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!18!3!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w17_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!18!4!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w17_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!18!5!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w17_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!18!6!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w17_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!18!7!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w17_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!18!8!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w17_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!18!9!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w17_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!18!10!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w17_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!18!11!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w17_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!18!12!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w17_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!18!1!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w18_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!18!2!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w18_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!18!3!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w18_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!18!4!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w18_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!18!5!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w18_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!18!6!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w18_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!18!7!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w18_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!18!8!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w18_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!18!9!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w18_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!18!10!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w18_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!18!11!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w18_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!18!12!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w18_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_50" rowspan="3">Razem</td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!18!1!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w19_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!18!2!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w19_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!18!3!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w19_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!18!4!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w19_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!18!5!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w19_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!18!6!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w19_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!18!7!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w19_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!18!8!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w19_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!18!9!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w19_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!18!10!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w19_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!18!11!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w19_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!18!12!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w19_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!18!1!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w20_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!18!2!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w20_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!18!3!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w20_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!18!4!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w20_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!18!5!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w20_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!18!6!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w20_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!18!7!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w20_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!18!8!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w20_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!18!9!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w20_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!18!10!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w20_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!18!11!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w20_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!18!12!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w20_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!18!1!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w21_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!18!2!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w21_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!18!3!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w21_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!18!4!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w21_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!18!5!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w21_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!18!6!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w21_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!18!7!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w21_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!18!8!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w21_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!18!9!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w21_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!18!10!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w21_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!18!11!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w21_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!18!12!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w21_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_50" colspan="2" rowspan="2">OGÓŁEM za okres oceny</td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!18!2!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w22_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!18!3!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w22_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!18!4!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w22_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!18!5!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w22_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!18!6!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w22_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!18!7!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w22_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!18!8!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w22_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!18!9!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w22_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!18!10!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w22_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!18!11!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w22_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!18!12!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w22_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!18!2!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w23_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!18!3!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w23_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!18!4!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w23_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!18!5!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w23_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!18!6!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w23_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!18!7!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w23_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!18!8!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w23_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!18!9!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w23_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!18!10!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w23_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!18!11!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w23_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!18!12!3')">
                            <asp:Label CssClass="normal" ID="tab_18_w23_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
            </table>
        </div>
        <div id="TABELA18" class="page-break">
            <br />
            <asp:Label ID="Label15" runat="server" Text="IV. 4.2. Czas trwania postępowania sądowego od dnia pierwszej rejestracji do dnia zakończenia sprawy w danej instancji w wydziale (% – ogółem)"></asp:Label>
            &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel18" runat="server" Text="tabela  19 \/\/\/" Visible="True"></asp:Label>

            <table style="width: 100%;">
                <tr>
                    <td class="borderAll center" rowspan="2">Kategoria spraw</td>
                    <td class="borderAll center" colspan="12">SUMA</td>
                </tr>
                <tr>
                    <td class="borderAll center">do 3 miesięcy</td>
                    <td class="borderAll center">suma powyżej 3 miesięcy</td>
                    <td class="borderAll center">powyżej 3 do 6 miesięcy</td>
                    <td class="borderAll center">powyżej 6 do 12 miesięcy</td>
                    <td class="borderAll center">suma powyżej 12 miesięcy</td>
                    <td class="borderAll center">powyżej 12 miesięcy do 2 lat</td>
                    <td class="borderAll center">powyżej 2 do 3 lat</td>
                    <td class="borderAll center">suma powyżej 3 lat</td>
                    <td class="borderAll center">powyżej 3 do 5 lat</td>
                    <td class="borderAll center">powyżej 5 do 8 lat</td>
                    <td class="borderAll center">ponad 8 lat</td>
                    <td class="borderAll center">SUMA</td>
                </tr>
                <tr>
                    <td class="borderAll center col_50" rowspan="3">K</td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!19!1!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!19!2!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!19!3!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!19!4!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!19!5!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!19!6!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!19!7!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!19!8!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w01_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!19!9!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w01_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!19!10!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w01_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!19!11!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w01_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!19!12!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w01_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!19!1!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!19!2!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!19!3!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!19!4!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w02_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!19!5!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w02_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!19!6!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w02_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!19!7!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w02_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!19!8!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w02_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!19!9!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w02_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!19!10!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w02_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!19!11!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w02_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!19!12!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w02_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!19!1!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!19!2!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!19!3!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!19!4!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w03_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!19!5!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w03_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!19!6!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w03_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!19!7!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w03_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!19!8!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w03_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!19!9!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w03_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!19!10!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w03_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!19!11!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w03_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!19!12!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w03_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_50" rowspan="3">Kp<br />
                    </td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!19!1!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!19!2!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!19!3!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!19!4!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w04_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!19!5!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w04_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!19!6!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w04_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!19!7!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w04_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!19!8!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w04_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!19!9!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w04_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!19!10!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w04_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!19!11!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w04_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!19!12!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w04_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!19!1!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!19!2!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w05_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!19!3!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w05_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!19!4!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w05_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!19!5!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w05_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!19!6!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w05_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!19!7!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w05_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!19!8!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w05_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!19!9!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w05_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!19!10!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w05_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!19!11!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w05_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!19!12!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w05_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!19!1!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!19!2!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w06_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!19!3!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w06_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!19!4!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w06_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!19!5!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w06_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!19!6!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w06_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!19!7!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w06_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!19!8!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w06_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!19!9!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w06_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!19!10!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w06_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!19!11!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w06_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!19!12!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w06_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_50" rowspan="3">Ko</td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!19!1!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w07_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!19!2!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w07_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!19!3!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w07_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!19!4!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w07_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!19!5!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w07_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!19!6!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w07_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!19!7!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w07_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!19!8!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w07_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!19!9!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w07_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!19!10!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w07_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!19!11!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w07_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!19!12!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w07_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!19!1!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w08_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!19!2!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w08_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!19!3!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w08_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!19!4!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w08_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!19!5!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w08_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!19!6!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w08_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!19!7!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w08_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!19!8!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w08_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!19!9!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w08_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!19!10!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w08_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!19!11!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w08_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!19!12!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w08_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!19!1!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w09_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!19!2!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w09_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!19!3!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w09_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!19!4!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w09_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!19!5!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w09_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!19!6!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w09_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!19!7!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w09_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!19!8!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w09_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!19!9!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w09_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!19!10!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w09_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!19!11!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w09_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!19!12!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w09_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_50" rowspan="3">W<br />
                    </td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!19!1!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w10_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!19!2!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w10_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!19!3!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w10_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!19!4!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w10_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!19!5!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w10_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!19!6!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w10_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!19!7!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w10_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!19!8!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w10_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!19!9!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w10_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!19!10!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w10_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!19!11!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w10_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!19!12!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w10_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!19!1!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w11_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!19!2!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w11_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!19!3!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w11_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!19!4!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w11_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!19!5!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w11_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!19!6!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w11_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!19!7!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w11_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!19!8!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w11_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!19!9!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w11_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!19!10!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w11_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!19!11!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w11_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!19!12!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w11_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!19!1!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w12_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!19!2!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w12_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!19!3!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w12_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!19!4!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w12_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!19!5!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w12_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!19!6!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w12_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!19!7!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w12_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!19!8!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w12_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!19!9!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w12_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!19!10!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w12_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!19!11!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w12_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=12!19!12!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w12_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_50" rowspan="3">Kop</td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!19!1!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w13_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!19!2!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w13_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!19!3!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w13_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!19!4!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w13_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!19!5!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w13_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!19!6!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w13_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!19!7!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w13_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!19!8!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w13_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!19!9!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w13_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!19!10!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w13_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!19!11!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w13_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=13!19!12!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w13_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!19!1!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w14_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!19!2!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w14_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!19!3!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w14_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!19!4!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w14_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!19!5!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w14_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!19!6!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w14_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!19!7!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w14_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!19!8!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w14_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!19!9!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w14_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!19!10!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w14_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!19!11!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w14_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=14!19!12!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w14_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!19!1!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w15_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!19!2!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w15_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!19!3!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w15_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!19!4!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w15_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!19!5!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w15_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!19!6!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w15_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!19!7!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w15_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!19!8!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w15_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!19!9!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w15_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!19!10!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w15_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!19!11!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w15_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=15!19!12!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w15_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_50" rowspan="3">&nbsp;</td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!19!1!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w16_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!19!2!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w16_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!19!3!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w16_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!19!4!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w16_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!19!5!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w16_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!19!6!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w16_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!19!7!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w16_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!19!8!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w16_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!19!9!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w16_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!19!10!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w16_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!19!11!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w16_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=16!19!12!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w16_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!19!1!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w17_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!19!2!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w17_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!19!3!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w17_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!19!4!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w17_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!19!5!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w17_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!19!6!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w17_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!19!7!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w17_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!19!8!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w17_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!19!9!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w17_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!19!10!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w17_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!19!11!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w17_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=17!19!12!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w17_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!19!1!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w18_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!19!2!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w18_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!19!3!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w18_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!19!4!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w18_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!19!5!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w18_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!19!6!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w18_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!19!7!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w18_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!19!8!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w18_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!19!9!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w18_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!19!10!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w18_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!19!11!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w18_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=18!19!12!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w18_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_50" rowspan="3">Razem</td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!19!1!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w19_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!19!2!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w19_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!19!3!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w19_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!19!4!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w19_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!19!5!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w19_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!19!6!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w19_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!19!7!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w19_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!19!8!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w19_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!19!9!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w19_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!19!10!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w19_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!19!11!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w19_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=19!19!12!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w19_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!19!1!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w20_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!19!2!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w20_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!19!3!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w20_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!19!4!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w20_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!19!5!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w20_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!19!6!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w20_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!19!7!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w20_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!19!8!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w20_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!19!9!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w20_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!19!10!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w20_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!19!11!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w20_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=20!19!12!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w20_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!19!1!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w21_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!19!2!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w21_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!19!3!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w21_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!19!4!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w21_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!19!5!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w21_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!19!6!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w21_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!19!7!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w21_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!19!8!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w21_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!19!9!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w21_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!19!10!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w21_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!19!11!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w21_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=21!19!12!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w21_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_50" colspan="2" rowspan="2">OGÓŁEM za okres oceny</td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!19!2!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w22_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!19!3!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w22_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!19!4!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w22_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!19!5!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w22_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!19!6!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w22_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!19!7!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w22_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!19!8!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w22_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!19!9!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w22_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!19!10!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w22_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!19!11!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w22_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=22!19!12!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w22_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!19!2!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w23_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!19!3!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w23_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!19!4!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w23_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!19!5!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w23_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!19!6!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w23_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!19!7!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w23_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!19!8!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w23_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!19!9!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w23_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!19!10!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w23_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!19!11!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w23_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_50">
                        <a href="javascript: openPopup('popup.aspx?sesja=23!19!12!3')">
                            <asp:Label CssClass="normal" ID="tab_19_w23_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
            </table>
        </div>

        <div class="page-break">
            <br />
            <asp:Label ID="Label21" runat="server" Text="IV.5.1. Czas trwania postępowania sądowego od dnia pierwszej rejestracji do dnia zakończenia sprawy w danej instancji w referatach poszczególnych sędziów (liczba spraw)"></asp:Label>
            &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel19" runat="server" Text="tabela  20 \/\/\/" Visible="True"></asp:Label>
            <br />
            <asp:PlaceHolder runat="server" ID="PlaceHolderTB19"></asp:PlaceHolder>
            <br />
        </div>
        <div id="TABELA5" class="page-break">
            <br />
            IV.5.5. Inne dane statystyczne, istotne z uwagi na specyfikę rozpoznawanych spraw lub wykonywanych zadań, w tym w szczególności dane dotyczące struktury załatwień

 <table style="width: 100%;">
     <tr>
         <td class="borderAll wciecie col_300">IV.5.6 Istotne czynniki mające wpływ na sprawność postępowań sądowych</td>
         <td class="borderAll col_500 center">
             <a href="javascript: openPopup('popup.aspx?sesja=1!24!1!3')">
                 <asp:Label CssClass="normal" ID="tab_24_w01_c01" runat="server" Text="0"></asp:Label></a></td>
     </tr>
     <tr>
         <td class="borderAll wciecie col_300">IV.5.7 Sprawność postępowania miedzyinstancyjnego</td>
         <td class="borderAll col_500 center">
             <a href="javascript: openPopup('popup.aspx?sesja=2!24!1!3')">
                 <asp:Label CssClass="normal" ID="tab_24_w02_c01" runat="server" Text="0"></asp:Label></a></td>
     </tr>
     <tr>
         <td class="borderAll wciecie col_300">IV.5.8. Liczba spraw zawieszonych (ogółem)</td>
         <td class="borderAll col_500 center">
             <a href="javascript: openPopup('popup.aspx?sesja=3!24!1!3')">
                 <asp:Label CssClass="normal" ID="tab_24_w03_c01" runat="server" Text="0"></asp:Label></a></td>
     </tr>
     <tr>
         <td class="borderAll wciecie col_300">IV.5.9. Prawidłowość kontroli spraw zawieszonych</td>
         <td class="borderAll col_500 center">
             <a href="javascript: openPopup('popup.aspx?sesja=4!24!1!3')">
                 <asp:Label CssClass="normal" ID="tab_24_w04_c01" runat="server" Text="0"></asp:Label></a></td>
     </tr>
 </table>
        </div>
        <div id="TABELA24" class="page-break">
            <br />
            IV.6.1. Terminowość sporządzania uzasadnień i stabilność orzecznictwa w wydziale (ogółem)
 <table style="width: 100%;">
     <tr>
         <td class="borderAll center" rowspan="3">Kategorie spraw</td>
         <td class="borderAll center" colspan="10">liczba sporządzonych uzasadnień</td>
         <td class="borderAll center" colspan="5">roztrzygnięcie II instancji*</td>
     </tr>
     <tr>
         <td class="borderAll center" rowspan="2">ogółem</td>
         <td class="borderAll center" rowspan="2">w terminie ustawowym</td>
         <td class="borderAll center" colspan="8">po upływie terminu ustawowego</td>
         <td class="borderAll center" rowspan="2">liczba spraw poddanych kontroli instancyjnej</td>
         <td class="borderAll center" rowspan="2">utrzymano w mocy</td>
         <td class="borderAll center" rowspan="2">zmieniono</td>
         <td class="borderAll center" rowspan="2">uchylono i przekazano do ponownego roztrzygnięcia</td>
         <td class="borderAll center" rowspan="2">załatwiono w inny sposób</td>
     </tr>
     <tr>
         <td class="borderAll center">1-14 dni</td>
         <td class="borderAll center">w tym nieuspra-wiedli-wione</td>
         <td class="borderAll center">15-30 dni</td>
         <td class="borderAll center">w tym nieuspra-wiedliwione</td>
         <td class="borderAll center">pow.1 do 3 mies.</td>
         <td class="borderAll center">w tym nieuspra-wiedliwione</td>
         <td class="borderAll center">ponad 3 mies.</td>
         <td class="borderAll center">w tym nieuspra-wiedliwione</td>
     </tr>
     <tr>
         <td class="borderAll col_81">W</td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=1!25!1!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w01_c01" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=1!25!2!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w01_c02" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=1!25!3!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w01_c03" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=1!25!4!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w01_c04" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=1!25!5!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w01_c05" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=1!25!6!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w01_c06" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=1!25!7!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w01_c07" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=1!25!8!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w01_c08" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=1!25!9!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w01_c09" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=1!25!10!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w01_c10" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=1!25!11!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w01_c11" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=1!25!12!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w01_c12" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=1!25!13!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w01_c13" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=1!25!14!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w01_c14" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=1!25!15!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w01_c15" runat="server" Text="0"></asp:Label></a></td>
     </tr>
     <tr>
         <td class="borderAll col_81">K</td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=2!25!1!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w02_c01" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=2!25!2!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w02_c02" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=2!25!3!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w02_c03" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=2!25!4!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w02_c04" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=2!25!5!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w02_c05" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=2!25!6!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w02_c06" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=2!25!7!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w02_c07" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=2!25!8!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w02_c08" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=2!25!9!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w02_c09" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=2!25!10!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w02_c10" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=2!25!11!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w02_c11" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=2!25!12!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w02_c12" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=2!25!13!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w02_c13" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=2!25!14!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w02_c14" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=2!25!15!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w02_c15" runat="server" Text="0"></asp:Label></a></td>
     </tr>
     <tr>
         <td class="borderAll col_81">&nbsp;</td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=3!25!1!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w03_c01" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=3!25!2!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w03_c02" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=3!25!3!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w03_c03" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=3!25!4!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w03_c04" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=3!25!5!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w03_c05" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=3!25!6!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w03_c06" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=3!25!7!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w03_c07" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=3!25!8!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w03_c08" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=3!25!9!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w03_c09" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=3!25!10!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w03_c10" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=3!25!11!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w03_c11" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=3!25!12!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w03_c12" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=3!25!13!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w03_c13" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=3!25!14!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w03_c14" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=3!25!15!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w03_c15" runat="server" Text="0"></asp:Label></a></td>
     </tr>
     <tr>
         <td class="borderAll col_81">&nbsp;</td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=4!25!1!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w04_c01" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=4!25!2!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w04_c02" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=4!25!3!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w04_c03" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=4!25!4!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w04_c04" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=4!25!5!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w04_c05" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=4!25!6!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w04_c06" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=4!25!7!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w04_c07" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=4!25!8!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w04_c08" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=4!25!9!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w04_c09" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=4!25!10!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w04_c10" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=4!25!11!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w04_c11" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=4!25!12!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w04_c12" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=4!25!13!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w04_c13" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=4!25!14!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w04_c14" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=4!25!15!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w04_c15" runat="server" Text="0"></asp:Label></a></td>
     </tr>
     <tr>
         <td class="borderAll col_81">&nbsp;</td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=5!25!1!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w05_c01" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=5!25!2!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w05_c02" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=5!25!3!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w05_c03" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=5!25!4!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w05_c04" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=5!25!5!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w05_c05" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=5!25!6!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w05_c06" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=5!25!7!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w05_c07" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=5!25!8!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w05_c08" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=5!25!9!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w05_c09" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=5!25!10!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w05_c10" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=5!25!11!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w05_c11" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=5!25!12!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w05_c12" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=5!25!13!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w05_c13" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=5!25!14!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w05_c14" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=5!25!15!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w05_c15" runat="server" Text="0"></asp:Label></a></td>
     </tr>
     <tr>
         <td class="borderAll col_81">&nbsp;</td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=6!25!1!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w06_c01" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=6!25!2!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w06_c02" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=6!25!3!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w06_c03" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=6!25!4!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w06_c04" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=6!25!5!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w06_c05" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=6!25!6!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w06_c06" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=6!25!7!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w06_c07" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=6!25!8!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w06_c08" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=6!25!9!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w06_c09" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=6!25!10!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w06_c10" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=6!25!11!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w06_c11" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=6!25!12!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w06_c12" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=6!25!13!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w06_c13" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=6!25!14!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w06_c14" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=6!25!15!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w06_c15" runat="server" Text="0"></asp:Label></a></td>
     </tr>
     <tr>
         <td class="borderAll col_81 gray">Razem</td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!25!1!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w07_c01" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!25!2!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w07_c02" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!25!3!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w07_c03" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!25!4!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w07_c04" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!25!5!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w07_c05" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!25!6!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w07_c06" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!25!7!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w07_c07" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!25!8!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w07_c08" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!25!9!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w07_c09" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!25!10!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w07_c10" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!25!11!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w07_c11" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!25!12!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w07_c12" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!25!13!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w07_c13" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!25!14!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w07_c14" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!25!15!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w07_c15" runat="server" Text="0"></asp:Label></a></td>
     </tr>
     <tr>
         <td class="borderAll col_81 gray">Ogółem</td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=8!25!1!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w08_c01" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=8!25!2!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w08_c02" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=8!25!3!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w08_c03" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=8!25!4!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w08_c04" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=8!25!5!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w08_c05" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=8!25!6!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w08_c06" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=8!25!7!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w08_c07" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=8!25!8!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w08_c08" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=8!25!9!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w08_c09" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=8!25!10!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w08_c10" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=8!25!11!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w08_c11" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=8!25!12!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w08_c12" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=8!25!13!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w08_c13" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=8!25!14!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w08_c14" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=8!25!15!3')">
                 <asp:Label CssClass="normal" ID="tab_25_w08_c15" runat="server" Text="0"></asp:Label></a></td>
     </tr>
 </table>
        </div>

        <div class="page-break">
            <br />
            <asp:PlaceHolder runat="server" ID="PlaceHolderTB25"></asp:PlaceHolder>
            <br />
        </div>
        <div id="TABELA26" class="page-break">
            <br />
            IV. 7.1..Struktura pozostałości (wydział ogółem – liczba spraw)
 <table style="width: 100%;">
     <tr>
         <td class="borderAll center" rowspan="2">rodzaje spraw</td>
         <td class="borderAll center" colspan="11">liczba spraw </td>
     </tr>
     <tr>
         <td class="borderAll center">do 3 miesięcy</td>
         <td class="borderAll center">suma powyżej 3 miesięcy</td>
         <td class="borderAll center">powyżej 3 do 6 miesięcy</td>
         <td class="borderAll center">powyżej 6 do 12 miesięcy</td>
         <td class="borderAll center">suma powyżej 12 miesięcy</td>
         <td class="borderAll center">powyżej 12 miesięcy do 2 lata</td>
         <td class="borderAll center">powyżej 2 do 3 lat</td>
         <td class="borderAll center">powyżej 3 do 5 lat</td>
         <td class="borderAll center">powyżej 5 do 8 lat
         </td>
         <td class="borderAll center">ponad 8 lat
         </td>
         <td class="borderAll col_81 gray">SUMA
         </td>
     </tr>
     <tr>
         <td class="borderAll col_81">K</td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=1!27!1!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w01_c01" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=1!27!2!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w01_c02" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=1!27!3!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w01_c03" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=1!27!4!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w01_c04" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=1!27!5!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w01_c05" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=1!27!6!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w01_c06" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=1!27!7!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w01_c07" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=1!27!8!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w01_c08" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=1!27!9!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w01_c09" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=1!27!10!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w01_c10" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=1!27!11!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w01_c11" runat="server" Text="0"></asp:Label></a></td>
     </tr>
     <tr>
         <td class="borderAll col_81">Kp</td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=2!27!1!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w02_c01" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=2!27!2!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w02_c02" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=2!27!3!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w02_c03" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=2!27!4!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w02_c04" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=2!27!5!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w02_c05" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=2!27!6!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w02_c06" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=2!27!7!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w02_c07" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=2!27!8!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w02_c08" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=2!27!9!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w02_c09" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=2!27!10!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w02_c10" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=2!27!11!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w02_c11" runat="server" Text="0"></asp:Label></a></td>
     </tr>
     <tr>
         <td class="borderAll col_81">Ko</td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=3!27!1!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w03_c01" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=3!27!2!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w03_c02" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=3!27!3!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w03_c03" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=3!27!4!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w03_c04" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=3!27!5!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w03_c05" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=3!27!6!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w03_c06" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=3!27!7!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w03_c07" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=3!27!8!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w03_c08" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=3!27!9!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w03_c09" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=3!27!10!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w03_c10" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=3!27!11!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w03_c11" runat="server" Text="0"></asp:Label></a></td>
     </tr>
     <tr>
         <td class="borderAll col_81">W</td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=4!27!1!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w04_c01" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=4!27!2!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w04_c02" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=4!27!3!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w04_c03" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=4!27!4!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w04_c04" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=4!27!5!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w04_c05" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=4!27!6!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w04_c06" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=4!27!7!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w04_c07" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=4!27!8!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w04_c08" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=4!27!9!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w04_c09" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=4!27!10!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w04_c10" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=4!27!11!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w04_c11" runat="server" Text="0"></asp:Label></a></td>
     </tr>
     <tr>
         <td class="borderAll col_81">Kop</td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=5!27!1!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w05_c01" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=5!27!2!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w05_c02" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=5!27!3!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w05_c03" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=5!27!4!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w05_c04" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=5!27!5!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w05_c05" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=5!27!6!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w05_c06" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=5!27!7!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w05_c07" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=5!27!8!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w05_c08" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=5!27!9!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w05_c09" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=5!27!10!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w05_c10" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=5!27!11!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w05_c11" runat="server" Text="0"></asp:Label></a></td>
     </tr>
     <tr>
         <td class="borderAll col_81">&nbsp;</td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=6!27!1!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w06_c01" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=6!27!2!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w06_c02" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=6!27!3!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w06_c03" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=6!27!4!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w06_c04" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=6!27!5!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w06_c05" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=6!27!6!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w06_c06" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=6!27!7!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w06_c07" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=6!27!8!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w06_c08" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=6!27!9!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w06_c09" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=6!27!10!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w06_c10" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=6!27!11!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w06_c11" runat="server" Text="0"></asp:Label></a></td>
     </tr>
     <tr>
         <td class="borderAll col_81 gray">Razem</td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!27!1!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w07_c01" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!27!2!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w07_c02" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!27!3!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w07_c03" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!27!4!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w07_c04" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!27!5!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w07_c05" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!27!6!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w07_c06" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!27!7!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w07_c07" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!27!8!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w07_c08" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!27!9!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w07_c09" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!27!10!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w07_c10" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!27!11!3')">
                 <asp:Label CssClass="normal" ID="tab_27_w07_c11" runat="server" Text="0"></asp:Label></a></td>
     </tr>
 </table>
        </div>
        <div id="TABELA27" class="page-break">
            <br />
            IV. 7.1..Struktura pozostałości (wydział ogółem – liczba spraw)
 <table style="width: 100%;">
     <tr>
         <td class="borderAll center" rowspan="2">rodzaje spraw</td>
         <td class="borderAll center" colspan="11">liczba spraw (obok liczby ogółem należy podać liczbę spraw zawieszonych)</td>
     </tr>
     <tr>
         <td class="borderAll center">do 3 miesięcy</td>
         <td class="borderAll center">suma powyżej 3 miesięcy</td>
         <td class="borderAll center">powyżej 3 do 6 miesięcy</td>
         <td class="borderAll center">powyżej 6 do 12 miesięcy</td>
         <td class="borderAll center">suma powyżej 12 miesięcy</td>
         <td class="borderAll center">powyżej 12 miesięcy do 2 lata</td>
         <td class="borderAll center">powyżej 2 do 3 lat</td>
         <td class="borderAll center">powyżej 3 do 5 lat</td>
         <td class="borderAll center">powyżej 5 do 8 lat
         </td>
         <td class="borderAll center">ponad 8 lat
         </td>
         <td class="borderAll col_81 gray">SUMA
         </td>
     </tr>
     <tr>
         <td class="borderAll col_81">K</td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=1!28!1!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w01_c01" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=1!28!2!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w01_c02" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=1!28!3!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w01_c03" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=1!28!4!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w01_c04" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=1!28!5!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w01_c05" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=1!28!6!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w01_c06" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=1!28!7!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w01_c07" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=1!28!8!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w01_c08" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=1!28!9!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w01_c09" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=1!28!10!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w01_c10" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=1!28!11!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w01_c11" runat="server" Text="0"></asp:Label></a></td>
     </tr>
     <tr>
         <td class="borderAll col_81">Kp</td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=2!28!1!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w02_c01" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=2!28!2!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w02_c02" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=2!28!3!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w02_c03" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=2!28!4!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w02_c04" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=2!28!5!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w02_c05" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=2!28!6!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w02_c06" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=2!28!7!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w02_c07" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=2!28!8!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w02_c08" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=2!28!9!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w02_c09" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=2!28!10!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w02_c10" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=2!28!11!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w02_c11" runat="server" Text="0"></asp:Label></a></td>
     </tr>
     <tr>
         <td class="borderAll col_81">Ko</td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=3!28!1!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w03_c01" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=3!28!2!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w03_c02" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=3!28!3!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w03_c03" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=3!28!4!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w03_c04" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=3!28!5!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w03_c05" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=3!28!6!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w03_c06" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=3!28!7!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w03_c07" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=3!28!8!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w03_c08" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=3!28!9!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w03_c09" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=3!28!10!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w03_c10" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=3!28!11!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w03_c11" runat="server" Text="0"></asp:Label></a></td>
     </tr>
     <tr>
         <td class="borderAll col_81">W</td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=4!28!1!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w04_c01" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=4!28!2!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w04_c02" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=4!28!3!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w04_c03" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=4!28!4!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w04_c04" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=4!28!5!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w04_c05" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=4!28!6!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w04_c06" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=4!28!7!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w04_c07" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=4!28!8!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w04_c08" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=4!28!9!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w04_c09" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=4!28!10!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w04_c10" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=4!28!11!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w04_c11" runat="server" Text="0"></asp:Label></a></td>
     </tr>
     <tr>
         <td class="borderAll col_81">Kop</td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=5!28!1!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w05_c01" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=5!28!2!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w05_c02" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=5!28!3!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w05_c03" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=5!28!4!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w05_c04" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=5!28!5!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w05_c05" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=5!28!6!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w05_c06" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=5!28!7!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w05_c07" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=5!28!8!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w05_c08" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=5!28!9!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w05_c09" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=5!28!10!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w05_c10" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=5!28!11!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w05_c11" runat="server" Text="0"></asp:Label></a></td>
     </tr>
     <tr>
         <td class="borderAll col_81">&nbsp;</td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=6!28!1!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w06_c01" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=6!28!2!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w06_c02" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=6!28!3!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w06_c03" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=6!28!4!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w06_c04" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=6!28!5!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w06_c05" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=6!28!6!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w06_c06" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=6!28!7!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w06_c07" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=6!28!8!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w06_c08" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=6!28!9!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w06_c09" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=6!28!10!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w06_c10" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=6!28!11!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w06_c11" runat="server" Text="0"></asp:Label></a></td>
     </tr>
     <tr>
         <td class="borderAll col_81 gray">Razem</td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!28!1!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w07_c01" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!28!2!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w07_c02" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!28!3!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w07_c03" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!28!4!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w07_c04" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!28!5!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w07_c05" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!28!6!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w07_c06" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!28!7!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w07_c07" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!28!8!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w07_c08" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!28!9!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w07_c09" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!28!10!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w07_c10" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!28!11!3')">
                 <asp:Label CssClass="normal" ID="tab_28_w07_c11" runat="server" Text="0"></asp:Label></a></td>
     </tr>
 </table>
        </div>

        <div id="TABELA28" class="page-break">
            <br />
            IV. 7.1..Struktura pozostałości (wydział ogółem – liczba spraw)
 <table style="width: 100%;">
     <tr>
         <td class="borderAll center" rowspan="2">rodzaje spraw</td>
         <td class="borderAll center" colspan="11">liczba spraw (obok liczby ogółem należy podać liczbę spraw zawieszonych)</td>
     </tr>
     <tr>
         <td class="borderAll center">do 3 miesięcy</td>
         <td class="borderAll center">suma powyżej 3 miesięcy</td>
         <td class="borderAll center">powyżej 3 do 6 miesięcy</td>
         <td class="borderAll center">powyżej 6 do 12 miesięcy</td>
         <td class="borderAll center">suma powyżej 12 miesięcy</td>
         <td class="borderAll center">powyżej 12 miesięcy do 2 lata</td>
         <td class="borderAll center">powyżej 2 do 3 lat</td>
         <td class="borderAll center">powyżej 3 do 5 lat</td>
         <td class="borderAll center">powyżej 5 do 8 lat
         </td>
         <td class="borderAll center">ponad 8 lat
         </td>
         <td class="borderAll col_81 gray">SUMA
         </td>
     </tr>
     <tr>
         <td class="borderAll col_81">K</td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=1!29!1!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w01_c01" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=1!29!2!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w01_c02" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=1!29!3!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w01_c03" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=1!29!4!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w01_c04" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=1!29!5!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w01_c05" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=1!29!6!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w01_c06" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=1!29!7!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w01_c07" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=1!29!8!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w01_c08" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=1!29!9!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w01_c09" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=1!29!10!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w01_c10" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=1!29!11!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w01_c11" runat="server" Text="0"></asp:Label></a></td>
     </tr>
     <tr>
         <td class="borderAll col_81">Kp</td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=2!29!1!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w02_c01" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=2!29!2!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w02_c02" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=2!29!3!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w02_c03" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=2!29!4!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w02_c04" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=2!29!5!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w02_c05" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=2!29!6!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w02_c06" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=2!29!7!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w02_c07" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=2!29!8!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w02_c08" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=2!29!9!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w02_c09" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=2!29!10!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w02_c10" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=2!29!11!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w02_c11" runat="server" Text="0"></asp:Label></a></td>
     </tr>
     <tr>
         <td class="borderAll col_81">Ko</td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=3!29!1!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w03_c01" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=3!29!2!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w03_c02" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=3!29!3!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w03_c03" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=3!29!4!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w03_c04" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=3!29!5!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w03_c05" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=3!29!6!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w03_c06" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=3!29!7!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w03_c07" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=3!29!8!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w03_c08" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=3!29!9!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w03_c09" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=3!29!10!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w03_c10" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=3!29!11!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w03_c11" runat="server" Text="0"></asp:Label></a></td>
     </tr>
     <tr>
         <td class="borderAll col_81">W</td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=4!29!1!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w04_c01" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=4!29!2!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w04_c02" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=4!29!3!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w04_c03" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=4!29!4!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w04_c04" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=4!29!5!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w04_c05" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=4!29!6!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w04_c06" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=4!29!7!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w04_c07" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=4!29!8!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w04_c08" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=4!29!9!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w04_c09" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=4!29!10!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w04_c10" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=4!29!11!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w04_c11" runat="server" Text="0"></asp:Label></a></td>
     </tr>
     <tr>
         <td class="borderAll col_81">Kop</td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=5!29!1!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w05_c01" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=5!29!2!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w05_c02" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=5!29!3!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w05_c03" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=5!29!4!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w05_c04" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=5!29!5!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w05_c05" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=5!29!6!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w05_c06" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=5!29!7!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w05_c07" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=5!29!8!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w05_c08" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=5!29!9!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w05_c09" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=5!29!10!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w05_c10" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=5!29!11!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w05_c11" runat="server" Text="0"></asp:Label></a></td>
     </tr>
     <tr>
         <td class="borderAll col_81">&nbsp;</td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=6!29!1!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w06_c01" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=6!29!2!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w06_c02" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=6!29!3!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w06_c03" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=6!29!4!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w06_c04" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=6!29!5!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w06_c05" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=6!29!6!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w06_c06" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=6!29!7!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w06_c07" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=6!29!8!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w06_c08" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=6!29!9!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w06_c09" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81">
             <a href="javascript: openPopup('popup.aspx?sesja=6!29!10!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w06_c10" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=6!29!11!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w06_c11" runat="server" Text="0"></asp:Label></a></td>
     </tr>
     <tr>
         <td class="borderAll col_81 gray">Razem</td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!29!1!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w07_c01" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!29!2!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w07_c02" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!29!3!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w07_c03" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!29!4!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w07_c04" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!29!5!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w07_c05" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!29!6!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w07_c06" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!29!7!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w07_c07" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!29!8!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w07_c08" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!29!9!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w07_c09" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!29!10!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w07_c10" runat="server" Text="0"></asp:Label></a></td>
         <td class="borderAll col_81 gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!29!11!3')">
                 <asp:Label CssClass="normal" ID="tab_29_w07_c11" runat="server" Text="0"></asp:Label></a></td>
     </tr>
 </table>
        </div>

        <div class="page-break">
            <br />
            <asp:Label ID="Label22" runat="server" Text="IV. 7.3.Struktura pozostałości (referaty poszczególnych sędziów – liczba spraw)"></asp:Label>
            &nbsp;&nbsp;&nbsp;
           <asp:Label ID="Label23" runat="server" Text="tabela  29 \/\/\/" Visible="True"></asp:Label>
            <br />
            <asp:PlaceHolder runat="server" ID="PlaceHolderTB29"></asp:PlaceHolder>
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