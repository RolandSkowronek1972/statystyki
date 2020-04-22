<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="mss1r.aspx.cs" Inherits="stat2018.mss1r" %>

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

    <script src="Scripts/rls.js"></script>

    <div class="noprint">
        <div id="menu" style="background-color: #f7f7f7; z-index: 9999">
            <div class="manu_back" style="height: 43px; margin: 0 auto 0 auto; position: relative; width: 1150px; left: 0px;">

                <table class="tbl_manu">

                    <tr>
                        <td style="width: 90px;">
                            <asp:Label ID="Label4" runat="server" Text="Zakres:"></asp:Label>
                        </td>
                        <td style="width: 80px;">

                            <dx:ASPxDateEdit ID="Date1" runat="server" Theme="Moderno" Height="20px">
                            </dx:ASPxDateEdit>
                        </td>
                        <td style="width: 80px;">
                            <dx:ASPxDateEdit ID="Date2" runat="server" Theme="Moderno" AutoResizeWithContainer="True" Height="20px">
                            </dx:ASPxDateEdit>
                        </td>
                        <td style="width: 100px">
                            <asp:LinkButton ID="LinkButton54" runat="server" class="ax_box" OnClick="LinkButton54_Click">  Odśwież</asp:LinkButton>
                        </td>

                        <td>Id. raportu</td>
                        <td>

                            <asp:TextBox ID="idRaportu" runat="server"></asp:TextBox>
                        </td>
                        <td>Id. Sądu</td>
                        <td>

                            <asp:TextBox ID="idSad" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Button ID="Button1" runat="server" CssClass="ax_box" Text="Twórz plik csv" OnClick="makeCSVFile" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>

    <div style="width: 1150px; margin: 0 auto 0 auto; position: relative;">

        <div id="tabela1" style="z-index: 10;">
            <div style="margin-left: auto; margin-right: auto; text-align: center; width: auto;">
                <asp:Label ID="Label6" runat="server" Text="Sąd " Style="font-weight: 700"></asp:Label>
                <br />
            </div>
            <div style="margin-left: auto; margin-right: auto; text-align: center; width: auto;">
                <asp:Label runat="server" ID="Label9" Visible="False"></asp:Label>
            </div>
            &nbsp;<asp:SqlDataSource ID="SqlDataSource2" runat="server"
                ConnectionString="<%$ ConnectionStrings:wap %>"
                SelectCommand="SELECT DISTINCT id_, opis, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15,id_tabeli FROM tbl_statystyki_tbl_01 WHERE (id_dzialu = @id_dzialu) AND (id_tabeli = 1) ORDER BY id_">
                <SelectParameters>
                    <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>

        <div style="margin: 0 auto 0 auto;">

            <table width="100%" border="1.a" bordercolor="#000000" cellpadding="5" cellspacing="0" style="page-break-before: always">
                <col width="209">
                <col width="191">
                <col width="290">
                <col width="338">
                <tr>
                    <td colspan="4" width="1.a057" valign="TOP" class="auto-style2">
                        <p>
                            <font face="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 11pt">Ministerstwo
			Sprawiedliwości, Al. Ujazdowskie 11, 00-950 Warszawa </FONT></font>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" width="410" height="38" valign="TOP">
                        <p>
                            <font face="Times New Roman, serif"><FONT SIZE=3><FONT FACE="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">Sąd:
			1. Rejonowy*</FONT></FONT><SUP><FONT FACE="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">)</FONT></FONT></SUP></FONT></font>
                        </p>
                        <p>
                            <font face="Times New Roman, serif"><FONT SIZE=3><FONT FACE="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">2.
			Okręgowy*</FONT></FONT><SUP><FONT FACE="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">)</FONT></FONT></SUP></FONT></font>
                        </p>
                        </P>
			<p>
                <font face="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">w
			.......................................................</FONT></font>
            </p>
                    </td>
                    <td rowspan="3" width="290" align="center">
                        <h2 class="auto-style2">MS-S 1r</h2>
                        <p align="CENTER"><font face="Arial, sans-serif"><FONT SIZE=3><B>SPRAWOZDANIE</B></FONT></font></p>
                    </td>
                    <td rowspan="2" width="338">
                        <p><font face="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">Adresaci:</FONT></font></p>
                        <ol>
                            <li>
                                <p>
                                    <font face="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">Sąd
				Okręgowy</FONT></font>
                                </p>
                                <li>
                                    <p>
                                        <font face="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">Ministerstwo
				Sprawiedliwości</FONT></font>
                                    </p>
                        </ol>
                        <p style="margin-left: 0.64cm; text-indent: 0.66cm">
                            <font face="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">Departament
			Strategii i Funduszy Europejskich</FONT></font>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" width="410" height="2" valign="TOP">
                        <p>
                            <font face="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">Okręg
			Sądu   </FONT></font>
                        </p>
                    </td>
                </tr>
                <tr valign="TOP">
                    <td rowspan="2" width="209" height="1.a4">
                        <p><font face="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">Okręgowego</FONT></font></p>
                        </P>
			<p>
                <font face="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">w
			.................................</FONT></font>
            </p>
                    </td>
                    <td rowspan="2" width="191">
                        <p><font face="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">Apelacyjnego</FONT></font></p>

                        <p>
                            <font face="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">w
			.....................................</FONT></font>
                        </p>
                    </td>
                    <td rowspan="3" width="338">
                        <p style="margin-left: 0.15cm; margin-right: 0.15cm; margin-top: 0.01cm; margin-bottom: 0.01cm">
                            <font face="Times New Roman, serif"><FONT SIZE=3><FONT FACE="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">Termin
			przekazania: </FONT></FONT></FONT></font>
                        </p>
                        <p style="margin-left: 0.42cm; margin-top: 0.07cm">
                            <font face="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">zgodnie
			z PBSSP 2017 r.</FONT></font>
                        </p>
                    </td>
                </tr>
            </table>

            <div>

                <div id="Div2" style="z-index: 10;">
                    <div style="margin-left: auto; margin-right: auto; text-align: center; width: auto;">
                        <asp:Label ID="Label3" runat="server" Text="Sąd " Style="font-weight: 700"></asp:Label>
                        <br />
                    </div>
                    <div style="margin-left: auto; margin-right: auto; text-align: center; width: auto;">
                        <asp:Label runat="server" ID="id_dzialu" Visible="False"></asp:Label>
                    </div>

                    <asp:Label ID="tabela1Label" runat="server"></asp:Label>

                    <br />
                    <br />
                    <table cellpadding="0" cellspacing="0" style="width: 50%;">
                        <tr>
                            <td colspan="3" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px; width: 250px;">Wyszczególnienie</td>
                            <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;">Liczby spraw</td>
                        </tr>
                        <tr>
                            <td colspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 130px; padding-left: 30px;">Wpłynęło</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #000000; width: 20px;">01</td>
                            <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #666666 #666666">
                                <a href="javascript:openPopup('popup.aspx?sesja=1!1.1.h!1!4')">
                                    <asp:Label CssClass="normal" ID="tab_01_w01_c01" runat="server" Text="0"></asp:Label></a>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 130px; padding-left: 30px;">Załatwiono</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #666666 #000000; width: 20px;">02</td>
                            <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #666666 #666666"><a href="javascript:openPopup('popup.aspx?sesja=2!1.1.h!1!4')">
                                <asp:Label CssClass="normal" ID="tab_01_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                        <tr>
                            <td align="center" rowspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 30px;">w tym</td>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px; width: 200px;">Uwzględniono w całości lub części</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #666666 #000000;">03</td>
                            <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #666666 #666666"><a href="javascript:openPopup('popup.aspx?sesja=3!1.1.h!1!4')">
                                <asp:Label CssClass="normal" ID="tab_01_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                        <tr>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px; width: 100px;">Oddalono</td>
                            <td align="center" class="" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #666666 #000000;">04</td>
                            <td align="center" class="" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #666666 #666666"><a href="javascript:openPopup('popup.aspx?sesja=4!1.1.h!1!4')">
                                <asp:Label CssClass="normal" ID="tab_01_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666; padding-left: 30px; width: 130px;">Pozostało</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;">05</td>
                            <td align="center" style="border-style: solid; border-width: thin; border-color: #666666 #000000 #000000 #666666"><a href="javascript:openPopup('popup.aspx?sesja=5!1.1.h!1!4')">
                                <asp:Label CssClass="normal" ID="tab_01_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                    </table>
                    <br />
                    <br />
                </div>
                <div id="zalatwienia" class="page-break">
                    <br />

                    <asp:Label ID="tabela2Label" runat="server"></asp:Label>
                    <br />
                    <table cellpadding="0" cellspacing="0" style="width: 100%;">
                        <tr>
                            <td align="center" colspan="3" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 250px;">Sprawy wg. repetytoriów</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;">Razem<br />
                                (kol. 2-9)</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;">Do 3
                   <br />
                                miesięcy</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;">Powyżej 3 do<br />
                                6 miesięcy</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;">Powyżej 6 do<br />
                                12 miesięcy</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;">Powyżej 12 miesięcy do<br />
                                2 lat</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;">Powyżej 2 do<br />
                                3 lat</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;">Powyżej 3 do<br />
                                5 lat</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;">Powyżej 5 do<br />
                                8 lat</td>
                            <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666; width: 100px;">Ponad 8 lat</td>
                        </tr>
                        <tr>
                            <td align="center" colspan="3" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" class="">0</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;" class="">1</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;" class="">2</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;" class="">3</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;" class="">4</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;" class="">5</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;" class="">6</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;" class="">7</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;" class="">8</td>
                            <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666; width: 100px;" class="">9</td>
                        </tr>
                        <tr>
                            <td colspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px; width: 230px;">C</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #000000;">01</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #000000 #000000 #666666; width: 128px;"><a href="javascript:openPopup('popup.aspx?sesja=1!2.2.a!1!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #000000 #000000 #666666; width: 128px;"><a href="javascript:openPopup('popup.aspx?sesja=1!2.2.a!2!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #000000 #000000 #666666; width: 128px;"><a href="javascript:openPopup('popup.aspx?sesja=1!2.2.a!3!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #000000 #000000 #666666; width: 128px;"><a href="javascript:openPopup('popup.aspx?sesja=1!2.2.a!4!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #000000 #000000 #666666; width: 128px;"><a href="javascript:openPopup('popup.aspx?sesja=1!2.2.a!5!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #000000 #000000 #666666; width: 128px;"><a href="javascript:openPopup('popup.aspx?sesja=1!2.2.a!6!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #000000 #000000 #666666; width: 128px;"><a href="javascript:openPopup('popup.aspx?sesja=1!2.2.a!7!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #000000 #000000 #666666; width: 128px;"><a href="javascript:openPopup('popup.aspx?sesja=1!2.2.a!8!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w01_c08" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #000000 #000000 #666666 #666666; width: 128px;"><a href="javascript:openPopup('popup.aspx?sesja=1!2.2.a!9!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w01_c09" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px; width: 230px;">CG-G</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #666666 #000000; width: 40px;">02</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 128px;"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.a!1!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.a!2!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.a!3!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.a!4!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w02_c04" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.a!5!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w02_c05" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.a!6!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w02_c06" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.a!7!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w02_c07" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.a!8!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w02_c08" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #666666 #666666; width: 100px;"><a href="javascript:openPopup('popup.aspx?sesja=2!2.2.a!9!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w02_c09" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px; width: 230px;">Ns</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #666666 #000000; width: 40px;">03</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.a!1!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.a!2!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.a!3!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.a!4!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w03_c04" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.a!5!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w03_c05" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.a!6!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w03_c06" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.a!7!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w03_c07" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.a!8!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w03_c08" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #666666 #666666; width: 100px;"><a href="javascript:openPopup('popup.aspx?sesja=3!2.2.a!9!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w03_c09" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px; width: 230px;">Nc</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #666666 #000000; width: 40px;">04</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.a!1!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.a!2!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.a!3!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.a!4!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w04_c04" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.a!5!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w04_c05" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.a!6!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w04_c06" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.a!7!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w04_c07" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.a!8!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w04_c08" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #666666 #666666; width: 100px;"><a href="javascript:openPopup('popup.aspx?sesja=4!2.2.a!9!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w04_c09" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                        <tr>
                            <td rowspan="2" style="border-style: solid; border-width: thin 0px medium thin; border-color: #666666; width: 30px;" align="center">Co</td>
                            <td class="" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px; width: 200px;">skarga na czynności komornicze</td>
                            <td align="center" class="" style="border-left: thin solid #000000; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;">05</td>
                            <td align="center" class="" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;"><a href="javascript:openPopup('popup.aspx?sesja=5!2.2.a!1!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" class="" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;"><a href="javascript:openPopup('popup.aspx?sesja=5!2.2.a!2!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w05_c02" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" class="" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;"><a href="javascript:openPopup('popup.aspx?sesja=5!2.2.a!3!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w05_c03" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" class="" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;"><a href="javascript:openPopup('popup.aspx?sesja=5!2.2.a!4!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w05_c04" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" class="" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;"><a href="javascript:openPopup('popup.aspx?sesja=5!2.2.a!5!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w05_c05" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" class="" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;"><a href="javascript:openPopup('popup.aspx?sesja=5!2.2.a!6!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w05_c06" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" class="" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;"><a href="javascript:openPopup('popup.aspx?sesja=5!2.2.a!7!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w05_c07" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" class="" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 100px;"><a href="javascript:openPopup('popup.aspx?sesja=5!2.2.a!8!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w05_c08" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" class="" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #666666 #666666; width: 100px;"><a href="javascript:openPopup('popup.aspx?sesja=5!2.2.a!9!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w05_c09" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                        <tr>
                            <td style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666; padding-left: 30px; width: 200px;">nadzór nad egzekucją nieruchomości</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000; width: 40px;">06</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666; width: 100px;"><a href="javascript:openPopup('popup.aspx?sesja=6!2.2.a!1!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666; width: 100px;"><a href="javascript:openPopup('popup.aspx?sesja=6!2.2.a!2!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w06_c02" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666; width: 100px;"><a href="javascript:openPopup('popup.aspx?sesja=6!2.2.a!3!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w06_c03" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666; width: 100px;"><a href="javascript:openPopup('popup.aspx?sesja=6!2.2.a!4!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w06_c04" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666; width: 100px;"><a href="javascript:openPopup('popup.aspx?sesja=6!2.2.a!5!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w06_c05" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666; width: 100px;"><a href="javascript:openPopup('popup.aspx?sesja=6!2.2.a!6!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w06_c06" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666; width: 100px;"><a href="javascript:openPopup('popup.aspx?sesja=6!2.2.a!7!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w06_c07" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666; width: 100px;"><a href="javascript:openPopup('popup.aspx?sesja=6!2.2.a!8!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w06_c08" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-left: thin solid #666666; border-right: thin solid #000000; border-top: thin solid #666666; border-bottom: thin solid #000000;"><a href="javascript:openPopup('popup.aspx?sesja=6!2.2.a!9!4')">
                                <asp:Label CssClass="normal" ID="tab_02_w06_c09" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                    </table>
                    <br />
                    <br />
                </div>
                <div id="wyznaczenia" class="page-break">
                    <asp:Label ID="tabela3Label" runat="server"></asp:Label>
                    <table cellpadding="0" cellspacing="0" style="width: 100%;">
                        <tr>
                            <td align="center" colspan="2" rowspan="2" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666; width: 250px;">Środki odwoławcze, które zostały przekazane do rozpoznania sądowi II instancji</td>
                            <td align="center" class="" rowspan="2" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;">Ogółem
                    <br />
                                kol. (2-7)</td>
                            <td align="center" class="" colspan="6" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666; border-width: thin thin 0px thin;">Z tego od daty orzeczenia sądu rejonowego do daty przekazania do sądu II instancji upłynął okres</td>
                        </tr>
                        <tr>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 90px;" align="center">do 2 mies.</td>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 90px;" align="center">pow. 2 do 3 mies.</td>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 90px;" align="center">pow. 3 do 6 miesięcy</td>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 90px;" align="center">pow.6 do 12 miesięcy</td>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 90px;" align="center">pow. 12 mies. do 2 lat</td>
                            <td style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666; width: 90px;" align="center">ponad 2 lata</td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" class="">0</td>
                            <td align="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;">1</td>
                            <td align="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" class="">2</td>
                            <td align="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" class="">3</td>
                            <td align="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" class="">4</td>
                            <td align="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" class="">5</td>
                            <td align="center" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" class="">6</td>
                            <td align="center" style="border-left: thin solid #666666; border-right: thin solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" class="">7</td>
                        </tr>
                        <tr>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; width: 230px;">Apelacje</td>
                            <td align="center" style="width: ; border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #000000; width: 20px;">01</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666; width 128px;"><a href="javascript:openPopup('popup.aspx?sesja=1!4.1!1!4')">
                                <asp:Label CssClass="normal" ID="tab_03_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666; width 128px;"><a href="javascript:openPopup('popup.aspx?sesja=1!4.1!2!4')">
                                <asp:Label CssClass="normal" ID="tab_03_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666; width 128px;"><a href="javascript:openPopup('popup.aspx?sesja=1!4.1!3!4')">
                                <asp:Label CssClass="normal" ID="tab_03_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666; width 128px;"><a href="javascript:openPopup('popup.aspx?sesja=1!4.1!4!4')">
                                <asp:Label CssClass="normal" ID="tab_03_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666; width 128px;"><a href="javascript:openPopup('popup.aspx?sesja=1!4.1!5!4')">
                                <asp:Label CssClass="normal" ID="tab_03_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666; width 128px;"><a href="javascript:openPopup('popup.aspx?sesja=1!4.1!6!4')">
                                <asp:Label CssClass="normal" ID="tab_03_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #000000 #000000 #666666 #666666; width 128px;"><a href="javascript:openPopup('popup.aspx?sesja=1!4.1!7!4')">
                                <asp:Label CssClass="normal" ID="tab_03_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                        <tr>
                            <td align="center" style="border-style: solid; border-width: thin; border-color: #666666; width: 230px;">Zażalenia</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000; width 128px;">02</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666; width: 128px;"><a href="javascript:openPopup('popup.aspx?sesja=2!4.1!1!4')">
                                <asp:Label CssClass="normal" ID="tab_03_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666; width 128px;"><a href="javascript:openPopup('popup.aspx?sesja=2!4.1!2!4')">
                                <asp:Label CssClass="normal" ID="tab_03_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666; width 128px;"><a href="javascript:openPopup('popup.aspx?sesja=2!4.1!3!4')">
                                <asp:Label CssClass="normal" ID="tab_03_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666; width 128px;"><a href="javascript:openPopup('popup.aspx?sesja=2!4.1!4!4')">
                                <asp:Label CssClass="normal" ID="tab_03_w02_c04" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666; width 128px;"><a href="javascript:openPopup('popup.aspx?sesja=2!4.1!5!4')">
                                <asp:Label CssClass="normal" ID="tab_03_w02_c05" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666; width 128px;"><a href="javascript:openPopup('popup.aspx?sesja=2!4.1!6!4')">
                                <asp:Label CssClass="normal" ID="tab_03_w02_c06" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin; border-color: #666666 #000000 #000000 #666666; width 128px;"><a href="javascript:openPopup('popup.aspx?sesja=1!4.1!7!4')">
                                <asp:Label CssClass="normal" ID="tab_03_w02_c07" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                    </table>
                    <br />
                    <br />
                </div>
                <div id="Div11" class="page-break">
                    &nbsp;<asp:Label ID="tabela4Label" runat="server"></asp:Label>
                    &nbsp;
    &nbsp;<br />
                    <table cellpadding="0" cellspacing="0" style="width: 100%;">
                        <tr>
                            <td colspan="3" rowspan="2" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;">Sprawy wg. repetytoriów</td>
                            <td colspan="4" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666; border-width: thin thin 0px thin;" align="center">Liczba powołanych biegłych</td>
                        </tr>
                        <tr>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" align="center">Razem kol. (2-4)</td>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" align="center">biegli sądowi</td>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" align="center">biegli z poza listy </td>
                            <td style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" align="center">inne podmioty</td>
                        </tr>
                        <tr>
                            <td colspan="3" style="border-left: thin solid #666666; border-right: 0px solid #666666; border-top: thin solid #666666; border-bottom: 0px solid #666666;" align="center">0</td>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" align="center">1</td>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" align="center">2</td>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" align="center">3</td>
                            <td style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" align="center">4</td>
                        </tr>
                        <tr>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;" colspan="2">Ogółem</td>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #000000;" align="center">01</td>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!1!4')">
                                <asp:Label CssClass="normal" ID="tab_04_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!2!4')">
                                <asp:Label CssClass="normal" ID="tab_04_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!3!4')">
                                <asp:Label CssClass="normal" ID="tab_04_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                            <td style="border-style: solid; border-width: thin thin 0px thin; border-color: #000000 #000000 #666666 #666666;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=1!7.1!4!4')">
                                <asp:Label CssClass="normal" ID="tab_04_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                        <tr>
                            <td style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666;" align="center" rowspan="3">w tym </td>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;">C</td>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #666666 #000000;" align="center">02</td>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!1!4')">
                                <asp:Label CssClass="normal" ID="tab_04_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!2!4')">
                                <asp:Label CssClass="normal" ID="tab_04_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!3!4')">
                                <asp:Label CssClass="normal" ID="tab_04_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                            <td style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #666666 #666666;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=2!7.1!4!4')">
                                <asp:Label CssClass="normal" ID="tab_04_w02_c04" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                        <tr>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;">CG-G</td>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #666666 #000000;" align="center">03</td>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!1!4')">
                                <asp:Label CssClass="normal" ID="tab_04_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!2!4')">
                                <asp:Label CssClass="normal" ID="tab_04_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!3!4')">
                                <asp:Label CssClass="normal" ID="tab_04_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                            <td style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #666666 #666666;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=3!7.1!4!4')">
                                <asp:Label CssClass="normal" ID="tab_04_w03_c04" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                        <tr>
                            <td style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666; padding-left: 30px;">Ns</td>
                            <td style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;" align="center">04</td>
                            <td style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=4!7.1!1!4')">
                                <asp:Label CssClass="normal" ID="tab_04_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                            <td style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=4!7.1!2!4')">
                                <asp:Label CssClass="normal" ID="tab_04_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                            <td style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=4!7.1!3!4')">
                                <asp:Label CssClass="normal" ID="tab_04_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                            <td style="border-style: solid; border-width: thin; border-color: #666666 #000000 #000000 #666666;" align="center"><a href="javascript:openPopup('popup.aspx?sesja=4!7.1!4!4')">
                                <asp:Label CssClass="normal" ID="tab_04_w04_c04" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                    </table>
                    <br />
                    <br />
                </div>

                <br />
                <div id="Div11" class="page-break">
                    &nbsp;<asp:Label ID="tabela5Label" runat="server"></asp:Label>
                    &nbsp;
    &nbsp;7,2<br />
                    <table cellpadding="0" cellspacing="0" style="width: 100%;">
                        <tr>
                            <td align="center" colspan="3" rowspan="3" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">Sprawy wg. repetytorów</td>
                            <td align="center" class="" colspan="8" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;">Lista sporządzonych opinii</td>
                        </tr>
                        <tr>
                            <td align="center" rowspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">razem<br />
                                (kol. 1=2 do 5=6 do 8)</td>
                            <td align="center" rowspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">w ustawowym<br />
                                terminie</td>
                            <td align="center" class="col_123" colspan="3" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">po ustalonym terminie</td>
                            <td align="center" class="col_123" colspan="3" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;">wg. czasu wydania opinii</td>
                        </tr>
                        <tr>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">do 30 dni</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">pow. 1 do&nbsp; 3<br />
                                miesięcy.</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">pow. 3<br />
                                miesięcy</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">do 30 dni</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">pow. 1 do&nbsp; 3<br />
                                miesięcy.</td>
                            <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" class="col_123">pow. 3<br />
                                miesięcy</td>
                        </tr>
                        <tr>
                            <td align="center" colspan="3" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">0</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">1</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">2</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">3</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">4</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">5</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">6</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">7</td>
                            <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" class="col_123">8</td>
                        </tr>
                        <tr>
                            <td align="justify" colspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;">Ogółem</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #000000;">01</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=1!7.2!1!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=1!7.2!2!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=1!7.2!3!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=1!7.2!4!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=1!7.2!5!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=1!7.2!6!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=1!7.2!7!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #000000 #000000 #666666 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=1!7.2!8!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w01_c08" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                        <tr>
                            <td align="center" rowspan="3" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666;">w tym</td>
                            <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;">C</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #666666 #000000;">02</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!7.2!1!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!7.2!2!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!7.2!3!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!7.2!4!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w02_c04" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!7.2!5!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w02_c05" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!7.2!6!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w02_c06" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!7.2!7!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w02_c07" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #666666 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!7.2!8!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w02_c08" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                        <tr>
                            <td align="justify" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;">CG-G</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #666666 #000000;">03</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!7.2!1!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!7.2!2!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!7.2!3!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!7.2!4!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w03_c04" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!7.2!5!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w03_c05" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!7.2!5!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w03_c06" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!7.2!6!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w03_c07" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #666666 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!7.2!7!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w03_c08" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                        <tr>
                            <td align="justify" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666; padding-left: 30px;">Ns</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;">04</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!7.2!1!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!7.2!2!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!7.2!3!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!7.2!4!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w04_c04" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!7.2!5!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w04_c05" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!7.2!6!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w04_c06" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!7.2!7!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w04_c07" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin; border-color: #666666 #000000 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=1!5!8!4')">
                                <asp:Label CssClass="normal" ID="tab_05_w04_c08" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                    </table>
                    <br />
                    <br />
                </div>

                <div id="Div11" class="page-break">
                    <br />
                    <br />
                    &nbsp;<asp:Label ID="tabela6Label" runat="server"></asp:Label>
                    &nbsp;
    &nbsp;<br />
                    <table cellpadding="0" cellspacing="0" style="width: 100%;">
                        <tr>
                            <td align="center" colspan="3" rowspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">Sprawy wg. repetytorów</td>
                            <td align="center" class="" colspan="4" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">Postanowienia o przyznaniu wynagrodzenia wg
                    <br />
                                czasu od złożenia rachunku </td>
                            <td align="center" class="" colspan="4" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;">Skierowanie rachunku&nbsp;do oddziału finansowego wg czasu od postanowienia o przyznaniu wynagrodzenia</td>
                        </tr>
                        <tr>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">razem<br />
                                (kol. 1 do 4)</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">do 14 dni</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">pow 14 do 30 dni</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">powyżej
                    <br />
                                miesięca.</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">razem
                    <br />
                                (kol. 6 do 7)</td>
                            <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" class="col_123">do 14 dni</td>
                            <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" class="col_123">pow. 14 do&nbsp;30 dni.</td>
                            <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" class="col_123">powyżej<br />
                                miesięca</td>
                        </tr>
                        <tr>
                            <td align="center" colspan="3" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">0</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">1</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">2</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">3</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">4</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">5</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">6</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123">7</td>
                            <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" class="col_123">8</td>
                        </tr>
                        <tr>
                            <td align="justify" colspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;">Ogółem</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #000000;">01</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=1!7.3!1!4')">
                                <asp:Label CssClass="normal" ID="tab_06_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=1!7.3!2!4')">
                                <asp:Label CssClass="normal" ID="tab_06_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=1!7.3!3!4')">
                                <asp:Label CssClass="normal" ID="tab_06_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=1!7.3!4!4')">
                                <asp:Label CssClass="normal" ID="tab_06_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=1!7.3!5!4')">
                                <asp:Label CssClass="normal" ID="tab_06_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=1!7.3!6!4')">
                                <asp:Label CssClass="normal" ID="tab_06_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #000000 #666666 #666666 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=1!7.3!7!4')">
                                <asp:Label CssClass="normal" ID="tab_06_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #000000 #000000 #666666 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=1!7.3!8!4')">
                                <asp:Label CssClass="normal" ID="tab_06_w01_c08" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                        <tr>
                            <td align="center" rowspan="3" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666;">w tym</td>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;">C</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #666666 #000000;">02</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!7.3!1!4')">
                                <asp:Label CssClass="normal" ID="tab_06_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!7.3!2!4')">
                                <asp:Label CssClass="normal" ID="tab_06_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!7.3!3!4')">
                                <asp:Label CssClass="normal" ID="tab_06_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!7.3!4!4')">
                                <asp:Label CssClass="normal" ID="tab_06_w02_c04" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!7.3!5!4')">
                                <asp:Label CssClass="normal" ID="tab_06_w02_c05" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!7.3!6!4')">
                                <asp:Label CssClass="normal" ID="tab_06_w02_c06" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!7.3!7!4')">
                                <asp:Label CssClass="normal" ID="tab_06_w02_c07" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #666666 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=2!7.3!8!4')">
                                <asp:Label CssClass="normal" ID="tab_06_w02_c08" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                        <tr>
                            <td style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666; padding-left: 30px;">CG-G</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666 #666666 #666666 #000000;">03</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!7.3!1!4')">
                                <asp:Label CssClass="normal" ID="tab_06_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!7.3!2!4')">
                                <asp:Label CssClass="normal" ID="tab_06_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!7.3!3!4')">
                                <asp:Label CssClass="normal" ID="tab_06_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!7.3!4!4')">
                                <asp:Label CssClass="normal" ID="tab_06_w03_c04" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!7.3!5!4')">
                                <asp:Label CssClass="normal" ID="tab_06_w03_c05" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!7.3!6!4')">
                                <asp:Label CssClass="normal" ID="tab_06_w03_c06" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!7.3!7!4')">
                                <asp:Label CssClass="normal" ID="tab_06_w03_c07" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666 #000000 #666666 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=3!7.3!8!4')">
                                <asp:Label CssClass="normal" ID="tab_06_w03_c08" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                        <tr>
                            <td style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666; padding-left: 30px;">Ns</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #000000;">04</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!7.3!1!4')">
                                <asp:Label CssClass="normal" ID="tab_06_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!7.3!2!4')">
                                <asp:Label CssClass="normal" ID="tab_06_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!7.3!3!4')">
                                <asp:Label CssClass="normal" ID="tab_06_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!7.3!4!4')">
                                <asp:Label CssClass="normal" ID="tab_06_w04_c04" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!7.3!5!4')">
                                <asp:Label CssClass="normal" ID="tab_06_w04_c05" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!7.3!6!4')">
                                <asp:Label CssClass="normal" ID="tab_06_w04_c06" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666 #666666 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!7.3!7!4')">
                                <asp:Label CssClass="normal" ID="tab_06_w04_c07" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin; border-color: #666666 #000000 #000000 #666666;" class="col_123"><a href="javascript:openPopup('popup.aspx?sesja=4!7.3!8!4')">
                                <asp:Label CssClass="normal" ID="tab_06_w04_c08" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                    </table>
                    <br />
                    <br />
                </div>
                <div>

                    <table style="width: 100%;">
                        <tr>
                            <td style="width: 1000px"><strong>Dział 8.1 Liczba powołań tłumaczy </strong></td>
                            <td align="center" style="border: thin solid #000000">
                                <a href="javascript:openPopup('popup.aspx?sesja=1!8.1!1!4')">
                                    <asp:Label ID="tab_81_w01_c01" runat="server" Text="0" CssClass="normal"></asp:Label>
                                </a>
                            </td>
                        </tr>
                    </table>
                    <br />

                    <asp:Label ID="tabela7Label" runat="server"></asp:Label>
                    <br />
                    <table cellpadding="0" cellspacing="0" style="width: 100%;">
                        <tr>
                            <td align="center" colspan="8" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;">Liczba sporządzonych tłumaczeń pisemnych</td>
                        </tr>
                        <tr>
                            <td align="center" rowspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_137">Razem<br />
                                (kol.1=kol. 2 do 6)</td>
                            <td align="center" rowspan="2" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_137">w ustalonym terminie</td>
                            <td align="center" colspan="3" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_137">po ustalonym terminie</td>
                            <td align="center" colspan="3" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" class="col_137">wg. czasu wydania tłumaczenia</td>
                        </tr>
                        <tr>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_137">do 30 dni</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_137">pow. 1 do 3 miesięcy</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_137">pow. 3 miesięcy</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_137">do 30 dni</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_137">pow. 1 do 3 miesięcy</td>
                            <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" class="col_137">pow. 3 miesięcy</td>
                        </tr>
                        <tr>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_137">1</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_137">2</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_137">3</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_137">4</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_137">5</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_137">6</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" class="col_137">7</td>
                            <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" class="col_137">8</td>
                        </tr>
                        <tr>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666;" class="col_137"><a href="javascript:openPopup('popup.aspx?sesja=1!8.2!1!4')">
                                <asp:Label CssClass="normal" ID="tab_07_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666;" class="col_137"><a href="javascript:openPopup('popup.aspx?sesja=1!8.2!2!4')">
                                <asp:Label CssClass="normal" ID="tab_07_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666;" class="col_137"><a href="javascript:openPopup('popup.aspx?sesja=1!8.2!3!4')">
                                <asp:Label CssClass="normal" ID="tab_07_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666;" class="col_137"><a href="javascript:openPopup('popup.aspx?sesja=1!8.2!4!4')">
                                <asp:Label CssClass="normal" ID="tab_07_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666;" class="col_137"><a href="javascript:openPopup('popup.aspx?sesja=1!8.2!5!4')">
                                <asp:Label CssClass="normal" ID="tab_07_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666;" class="col_137"><a href="javascript:openPopup('popup.aspx?sesja=1!8.2!6!4')">
                                <asp:Label CssClass="normal" ID="tab_07_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666;" class="col_137"><a href="javascript:openPopup('popup.aspx?sesja=1!8.2!7!4')">
                                <asp:Label CssClass="normal" ID="tab_07_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin; border-color: #666666;" class="col_137"><a href="javascript:openPopup('popup.aspx?sesja=1!8.2!8!4')">
                                <asp:Label CssClass="normal" ID="tab_07_w01_c08" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                    </table>
                    <br />
                </div>
                <div>
                    <br />
                    <asp:Label ID="tabela8Label" runat="server"></asp:Label>
                    &nbsp;<table cellpadding="0" cellspacing="0" style="width: 100%;">
                        <tr>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;" colspan="4">Postanowienia o przyznaniu wynagrodzenia wg czasu od złożenia rachunku</td>
                            <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;" colspan="4">Skierowanie rachunku&nbsp;do oddziału finansowego wg czasu od postanowienia o przyznaniu wynagrodzenia</td>
                        </tr>
                        <tr>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">Razem<br />
                                (kol. 2 do 4)</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">do 14 dni</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">pow.14 do 30 dni</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">powyżej miesiąca</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">razem (kol. 6 do 8)</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">do 14 dni</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">pow. 14 do 30 dni</td>
                            <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;">powyżej&nbsp; miesiąca</td>
                        </tr>
                        <tr>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">1</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">2</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">3</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">4</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">5</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">6</td>
                            <td align="center" style="border-style: solid; border-width: thin 0px 0px thin; border-color: #666666;">7</td>
                            <td align="center" style="border-style: solid; border-width: thin thin 0px thin; border-color: #666666;">8</td>
                        </tr>
                        <tr>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666;"><a href="javascript:openPopup('popup.aspx?sesja=1!8.3!1!4')">
                                <asp:Label CssClass="normal" ID="tab_08_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666;"><a href="javascript:openPopup('popup.aspx?sesja=1!8.3!2!4')">
                                <asp:Label CssClass="normal" ID="tab_08_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666;"><a href="javascript:openPopup('popup.aspx?sesja=1!8.3!3!4')">
                                <asp:Label CssClass="normal" ID="tab_08_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666;"><a href="javascript:openPopup('popup.aspx?sesja=1!8.3!4!4')">
                                <asp:Label CssClass="normal" ID="tab_08_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666;"><a href="javascript:openPopup('popup.aspx?sesja=1!8.3!5!4')">
                                <asp:Label CssClass="normal" ID="tab_08_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666;"><a href="javascript:openPopup('popup.aspx?sesja=1!8.3!6!4')">
                                <asp:Label CssClass="normal" ID="tab_08_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin 0px thin thin; border-color: #666666;"><a href="javascript:openPopup('popup.aspx?sesja=1!8.3!7!4')">
                                <asp:Label CssClass="normal" ID="tab_08_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                            <td align="center" style="border-style: solid; border-width: thin; border-color: #666666;"><a href="javascript:openPopup('popup.aspx?sesja=1!8.3!8!4')">
                                <asp:Label CssClass="normal" ID="tab_08_w01_c08" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                    </table>
                    <br />
                </div>
                <div id="debag">

                    <br />
                    Raport statystyczny
                    <asp:Label ID="Label27" runat="server"></asp:Label>
                    &nbsp;Sporzadzone dn.
            <asp:Label ID="Label29" runat="server"></asp:Label>&nbsp;przez&nbsp;
&nbsp;&nbsp;
            <asp:Label ID="Label28" runat="server"></asp:Label>
                    &nbsp;<asp:Label ID="Label30" runat="server"></asp:Label>
                    <br />

                    <asp:Label ID="Label11" runat="server"></asp:Label>
                </div>

                <br />
            </div>
        </div>
    </div>
</asp:Content>