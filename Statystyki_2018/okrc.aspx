﻿<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="okrc.aspx.cs" Inherits="stat2018.okrc" %>

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

        @media print {
            @page {
                size: 29cm 21.7cm;
                margin: 0mm 0mm 0mm 0mm;
            }

            .horizont {
                transform: translate(-55mm, 0) scale(0.6);
                -webkit-transform: translate(-55mm, 0) scale(0.6);
                -moz-transform: translate(-55mm, 0) scale(0.6);
            }
        }
    </style>

    <script src="Scripts/rls.js"></script>

    <div class="noprint">
        <div id="menu" style="background-color: #f7f7f7; z-index: 9999">
            <div class="manu_back" style="height: 40px; margin: 0 auto 0 auto; position: relative; width: 1050px; left: 0px;">
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
                            <asp:LinkButton ID="LinkButton54" runat="server" class="ax_box" OnClick="LinkButton54_Click">  Odśwież</asp:LinkButton>
                        </td>
                        <td style="width: auto; padding-left: 5px;">
                            <asp:LinkButton ID="LinkButton55" runat="server" class="ax_box" OnClick="LinkButton55_Click" CssClass="ax_box"> Drukuj </asp:LinkButton>
                        </td>
                        <td style="width: auto; padding-left: 5px;">

                            <asp:LinkButton ID="LinkButton56" runat="server" OnClick="Button1_Click" CssClass="ax_box" Visible="False">DRUKUJ</asp:LinkButton>
                        </td>
                        <td style="width: auto; padding-left: 5px;">
                            <asp:LinkButton ID="LinkButton57" runat="server" CssClass="ax_box" OnClick="Button3_Click">Zapisz do Excel</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>

    <div style="width: 1150px; margin: 0 auto 0 auto; position: relative; top: 60px;">

        <div id="Div2" style="z-index: 10;">
            <div style="margin-left: auto; margin-right: auto; text-align: center; width: auto;">
                <asp:Label ID="Label3" runat="server" Text="Sąd " Style="font-weight: 700"></asp:Label>
                <br />
            </div>

            <br />
        </div>
    </div>

    <div id="zalatwienia2" class="horizont" style="position: relative; top: 60px;">
        <br />

        <asp:Label ID="tabela2Label" runat="server"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;
       <asp:Label ID="infoLabel2" runat="server" Text="Tabela 1\/" Visible="False"></asp:Label>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCreated="GridView1_RowCreated"
            Width="1150px" ShowHeader="False" OnRowDataBound="GridView1_RowDataBound">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
                    <ItemStyle CssClass="col_25" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="imie" SortExpression="imie">

                    <ItemTemplate>
                        <asp:Label ID="funkcja" runat="server" Text='<%# Eval("funkcja") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_100" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="imie" SortExpression="imie">

                    <ItemTemplate>
                        <asp:Label ID="syanowisko" runat="server" Text='<%# Eval("stanowisko") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_100" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="imie" SortExpression="imie">

                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                        &nbsp;<asp:Label ID="Label1" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_180" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="d_02" SortExpression="d_02">

                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!7"%>')">
                            <asp:Label ID="Label201" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_45" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="d_02" SortExpression="d_02">

                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!7"%>')">
                            <asp:Label ID="Label202" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_45" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="d_03" SortExpression="d_03">

                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!7"%>')">
                            <asp:Label ID="Label203" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_45" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="d_04" SortExpression="d_04">

                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!7"%>')">
                            <asp:Label ID="Label204" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_45" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="d_05" SortExpression="d_05">

                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!7"%>')">
                            <asp:Label ID="Label205" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_45 gray" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="d_06" SortExpression="d_06">

                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!7"%>')">
                            <asp:Label ID="Label206" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_45" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!7"%>')">
                            <asp:Label ID="Label207" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_45" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!7"%>')">
                            <asp:Label ID="Label208" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_45" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!7"%>')">
                            <asp:Label ID="Label209" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_45" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!7"%>')">
                            <asp:Label ID="Label210" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_45 gray" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!7"%>')">
                            <asp:Label ID="Label211" runat="server" Text='<%# Eval("d_11")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_45" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!7"%>')">
                            <asp:Label ID="Label212" runat="server" Text='<%# Eval("d_12")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_45" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!13!7"%>')">
                            <asp:Label ID="Label213" runat="server" Text='<%# Eval("d_13")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_45" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!14!7"%>')">
                            <asp:Label ID="Label214" runat="server" Text='<%# Eval("d_14")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_45" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!15!7"%>')">
                            <asp:Label ID="Label215" runat="server" Text='<%# Eval("d_15")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_45 gray" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!16!7"%>')">
                            <asp:Label ID="Label216" runat="server" Text='<%# Eval("d_16")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_45" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!17!7"%>')">
                            <asp:Label ID="Label217" runat="server" Text='<%# Eval("d_17")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_45" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!18!7"%>')">
                            <asp:Label ID="Label218" runat="server" Text='<%# Eval("d_18")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_45" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!19!7"%>')">
                            <asp:Label ID="Label219" runat="server" Text='<%# Eval("d_19")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_45 gray" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!20!7"%>')">
                            <asp:Label ID="Label220" runat="server" Text='<%# Eval("d_20")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_45" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!21!7"%>')">
                            <asp:Label ID="Label221" runat="server" Text='<%# Eval("d_21")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_45" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!22!7"%>')">
                            <asp:Label ID="Label222" runat="server" Text='<%# Eval("d_22")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_45" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!23!7"%>')">
                            <asp:Label ID="Label223" runat="server" Text='<%# Eval("d_23")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_45" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!24!7"%>')">
                            <asp:Label ID="Label224x" runat="server" Text='<%# Eval("d_24")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_45" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!25!7"%>')">
                            <asp:Label ID="Label225" runat="server" Text='<%# Eval("d_25")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_45" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!26!7"%>')">
                            <asp:Label ID="Label226" runat="server" Text='<%# Eval("d_26")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_45" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!27!7"%>')">
                            <asp:Label ID="Label227" runat="server" Text='<%# Eval("d_27")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_45  gray" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="d_15" SortExpression="d_01">
                    <ItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Width="90%"></asp:TextBox>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_45" />
                </asp:TemplateField>
            </Columns>
            <FooterStyle Font-Bold="True" HorizontalAlign="Center" Wrap="False" BorderColor="#CCCCCC" />
            <HeaderStyle Wrap="False" />
            <RowStyle Wrap="False" />
        </asp:GridView>
        <br />
    </div>
    <div style="width: 1150px; margin: 0 auto 0 auto; position: relative; top: 30px;">

        <div id="zalatwienia" class="page-break">
            <br />

            <asp:Label ID="Label2" runat="server"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;
       <asp:Label ID="infoLabel3" runat="server" Text="Tabela 3\/" Visible="False"></asp:Label>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" OnRowCreated="GridView2_RowCreated"
                Width="1150px" ShowHeader="False" OnRowDataBound="GridView2_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
                        <ItemStyle CssClass="col_25" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="imie" SortExpression="imie">

                        <ItemTemplate>
                            <asp:Label ID="funkcja" runat="server" Text='<%# Eval("funkcja") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_150" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="imie" SortExpression="imie">

                        <ItemTemplate>
                            <asp:Label ID="syanowisko" runat="server" Text='<%# Eval("stanowisko") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_150" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="imie" SortExpression="imie">

                        <ItemTemplate>
                            <asp:Label ID="Label10" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            &nbsp;<asp:Label ID="Label1" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_150" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_02" SortExpression="d_02">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!7"%>')">
                                <asp:Label ID="Label201" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_45" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_02" SortExpression="d_02">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!7"%>')">
                                <asp:Label ID="Label202" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_45" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_03">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!7"%>')">
                                <asp:Label ID="Label203" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_45" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_04">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!7"%>')">
                                <asp:Label ID="Label204" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_45" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_05">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!7"%>')">
                                <asp:Label ID="Label205" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_45" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_06">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!7"%>')">
                                <asp:Label ID="Label206" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_45" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!7"%>')">
                                <asp:Label ID="Label207" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_45" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!7"%>')">
                                <asp:Label ID="Label208" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_45 gray" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_15" SortExpression="d_01">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Width="90%"></asp:TextBox>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_45" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle Font-Bold="True" HorizontalAlign="Center" Wrap="False" BackColor="#CCCCCC" />
                <HeaderStyle Wrap="False" />
                <RowStyle Wrap="False" />
            </asp:GridView>
            <br />
            <br />
        </div>

        <div id="debag">
            <br />
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
</asp:Content>