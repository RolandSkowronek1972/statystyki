<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="mss10e.aspx.cs" Inherits="stat2018.mss10e" %>

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
                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
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

    <div style="width: 1150px; margin: 0 auto 0 auto; position: relative;" >

        <div id="tabela1" style="z-index: 10; visibility: hidden;">
            <div style="margin-left: auto; margin-right: auto; text-align: center; width: auto;">
                <asp:Label ID="Label6" runat="server" Text="Sąd " Style="font-weight: 700"></asp:Label>
                <br />
            </div>
            <div style="margin-left: auto; margin-right: auto; text-align: center; width: auto;">
                <asp:Label runat="server" ID="Label9" Visible="False"></asp:Label>
            </div>
          
        </div>

        <div id="Div2" style="z-index: 10;">
            <div style="margin-left: auto; margin-right: auto; text-align: center; width: auto;">
                <asp:Label runat="server" ID="id_dzialu" Visible="False"></asp:Label>
            </div>

            <br />
            <br />
            <table style="width:100%;">
                <tr>
                    <td class="borderAll" colspan="4">
                            <font face="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 11pt">Ministerstwo
			Sprawiedliwości, Al. Ujazdowskie 11, 00-950 Warszawa</FONT></font></td>
                </tr>
                <tr>
                    <td class="borderAll col_400" colspan="2">Sąd : 1. Rejonowy *)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2. Okręgowy *)<br />
                        <br />
                        w </td>
                    <td class="borderAll col_400 center" rowspan="3">MS-S10e<br />
                        SPRAWOZDANIE z wykonywania kary pozbawienia wolności oraz środków karnych w systemie dozoru elektronicznego </td>
                    <td class="borderAll " rowspan="2">Adresaci:<br />
&nbsp;&nbsp;&nbsp;&nbsp; 1. Sąd Okręgowy<br />
&nbsp;&nbsp;&nbsp;&nbsp; 2. Ministerstwo Sprawiedliwości<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <font face="Arial, sans-serif"><FONT SIZE=2 STYLE="font-size: 9pt">Departament
			Strategii i Funduszy Europejskich</FONT></font>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="borderAll col_400" colspan="2">Okręg Sądu</td>
                </tr>
                <tr>
                    <td class="borderAll">Okręgowego<br />
                        <br />
                        <br />
                        <br />
                        <br />
                        w.................</td>
                    <td class="borderAll">Apelacyjnego<br />
                        <br />
                        <br />
                        <br />
                        <br />
                        w.................</td>
                    <td class="borderAll ">Termin przekazania: zgodnie z PBSSP 2019 r. </td>
                </tr>
            </table>
            <br />
            <br />

            <br />

            <br />

            <asp:Label ID="kod011" runat="server"></asp:Label>
            <br />

              <div id='Terminowość sporządzania tłumaczeń pisemnych' class="page-break" >
               <asp:PlaceHolder runat="server" ID="tablePlaceHolder"></asp:PlaceHolder>

 <br/>
 </div>

            <br />

               <br />
 &nbsp;<div class="page-break">
                <strong>Dział 6 </strong>Obciążenia administracyjne respondentów

                 <br />
                <br />
                Proszę podać czas (w minutach) przeznaczony na:<br />
                <br />

                <table style="width: 100%;">
                    <tr>
                        <td class="col_100">&nbsp;</td>
                        <td>przygotowanie danych dla potrzeb wypełnianego formularza</td>
                        <td class="borderAll col_100">
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>wypełnienie formularza</td>
                        <td class="borderAll col_100">
                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </table>

                <br />
            </div>

                <table style="width: 100%;">
                    <tr>
                        <td class="col_100">&nbsp;</td>
                        <td>Wyjaśnienia dotyczące sprawozdania można uzyskać pod numerem telefonu </td>
                        <td class=" col_180">
                            .......................................................</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    </table>

            <br />
            </strong>
            <br />

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

            </div>
    </div>
</asp:Content>