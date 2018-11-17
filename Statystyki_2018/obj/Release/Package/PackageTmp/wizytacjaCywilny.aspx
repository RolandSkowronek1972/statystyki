<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="wizytacjaCywilny.aspx.cs" Inherits="stat2018.wizytacjaCywilny" %>

<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
          <style>
  
#menu {
    position:relative;
}
#menu.scrolling {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
}


              .auto-style1 {
                  height: 22px;
              }


              .auto-style2 {
                  width: 20px;
              }


              </style>
      <script src="Scripts/jquery-1.8.3.js"></script>
      <script src="Scripts/rls.js"></script>
  
     
     <div id="menu" class="manu_back noprint" style="height:40px;" > 
   
                  
   <table >
        <tr>
            <td style="width:auto;padding-left:5px;">
                <asp:Label ID="Label4" runat="server" Text="Proszę wybrać zakres:"></asp:Label>
            </td>
            <td style="width:auto;padding-left:5px;">

                <dx:ASPxDateEdit ID="Date1" runat="server" Theme="Moderno">
                </dx:ASPxDateEdit>
              


            </td>
            <td style="width:auto;padding-left:5px;">
               
                       <dx:ASPxDateEdit ID="Date2" runat="server" Theme="Moderno">
                </dx:ASPxDateEdit></td>
            <td style="width:auto;padding-left:5px;" >
                <asp:LinkButton ID="LinkButton54" runat="server" class="ax_box" OnClick="Odswiez">  Odśwież</asp:LinkButton>
            </td>
            <td style="width:auto;padding-left:5px;">
                  <asp:LinkButton ID="LinkButton55" runat="server"  class="ax_box" CssClass="ax_box"> Drukuj </asp:LinkButton>
            </td>
           
            <td style="width:auto;padding-left:5px;">
                 <asp:LinkButton ID="LinkButton57" runat="server" CssClass="ax_box" OnClick="tworzPlikExcell">Zapisz do Excel</asp:LinkButton>
            </td>
        </tr>
    
    </table>
      </div>
       <div style="width:1150px; margin: 0 auto 0 auto; position:relative;top:30px;" class="content landscape">
        <div >
              <asp:Label ID="d1Label" runat="server" Text="Dział 1 "></asp:Label>
           <asp:Label ID="infoLabel01" runat="server" Text="dział 1 \/\/\/" Visible="False"></asp:Label>
           <br />
           <table style="width:100%;">
               <tr>
                   <td class="col_500 wciecie borderAll">I.3. Wizytowany wydział sądu</td>
                   <td class="borderAll wciecie">
                       <asp:TextBox ID="tab_1_w01_c01" runat="server" Width="90%"></asp:TextBox>
                   </td>
               </tr>
               <tr>
                   <td class="col_500 wciecie borderAll">1.4. Osoba/osoby przeprowadzająca/e wizytację</td>
                   <td class="borderAll wciecie">
                       <asp:TextBox ID="TextBox2" runat="server" Rows="4" TextMode="MultiLine" Width="90%"></asp:TextBox>
                   </td>
               </tr>
               <tr>
                   <td class="col_500 wciecie borderAll">I.5. Termin przeprowadzenia wizytacji</td>
                   <td class="borderAll wciecie">
                       <dx:ASPxDateEdit ID="tab_1_w02_c01" runat="server" Theme="Moderno" OnInit="tab_1_w02_c01_dateInit">
                       </dx:ASPxDateEdit>
                   </td>
               </tr>
               <tr>
                   <td class="col_500 wciecie borderAll">I.6. Okres objęty wizytacją</td>
                   <td class="borderAll wciecie">
                       <asp:TextBox ID="tab_1_w03_c01" runat="server" Width="90%"></asp:TextBox>
                   </td>
               </tr>
           </table>
            </div>
           <div class="page-break">
&nbsp;<asp:Label ID="d1Label0" runat="server" Text="Dział 2"></asp:Label>
           <asp:Label ID="InfoLabel2" runat="server" Text="dział 2 \/\/\/" Visible="False"></asp:Label>
           <br />
           <table style="width:100%;">
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
                       <asp:TextBox ID="tab_2_w02_c01" runat="server" Rows="4" TextMode="MultiLine" Width="90%"></asp:TextBox>
                   </td>
               </tr>
               <tr>
                   <td class="col_500 wciecie borderAll">III.3. Okres objęty poprzednia wizytacją </td>
                   <td class="borderAll wciecie">
                       <asp:TextBox ID="tab_2_w03_c01" runat="server" Width="90%"></asp:TextBox>
                   </td>
               </tr>
               <tr>
                   <td class="col_500 wciecie borderAll">II.4. Wykonanie zarządzeń nadzorczych wydanych w wyniku przeprowadzenia poprzedniej wizytacji</td>
                   <td class="borderAll wciecie">
                       <asp:TextBox ID="tab_2_w04_c01" runat="server" Rows="4" TextMode="MultiLine" Width="90%"></asp:TextBox>
                   </td>
               </tr>
               <tr>
                   <td class="col_500 wciecie borderAll">II.5. Czynności nadzorcze podjęte po zakonczeniu poprzedniej wizytacji</td>
                   <td class="borderAll wciecie">
                       <asp:TextBox ID="tab_2_w05_c01" runat="server" Rows="4" TextMode="MultiLine" Width="90%"></asp:TextBox>
                   </td>
               </tr>
               <tr>
                   <td class="col_500 wciecie borderAll">II.6. Wykonanie zarządzeń nadzorczych wydanych w wyniku czynności nadzorczych, o których mowa w II.5.</td>
                   <td class="borderAll wciecie">
                       <asp:TextBox ID="tab_2_w05_c2" runat="server" Rows="4" TextMode="MultiLine" Width="90%"></asp:TextBox>
                   </td>
               </tr>
           </table>
               </div>
           <br />
               <div class="page-break">
&nbsp;<asp:Label ID="Label1" runat="server" Text="Dział 3.1"></asp:Label>
           &nbsp;&nbsp;&nbsp;
           <asp:Label ID="InfoLabel_3_1" runat="server" Text="tabela  3 \/\/\/" Visible="False"></asp:Label>
           <br />
        




     <asp:GridView ID="gwTabela3" runat="server" OnRowCreated="naglowekTabeli_gwTabela1"  AutoGenerateColumns="False"  Width = "100%" ShowHeader = "False" ShowFooter = "True"  >
        <Columns>
  
                        <asp:TemplateField HeaderText = "imie" SortExpression = "imie" >
                                          <ItemTemplate >
                                              <asp:Label ID = "Label5" runat = "server" Text = '<%# Eval("nazwisko") %>' ></asp:Label >
                                           <asp:Label ID = "Label2"  runat = "server" Text = '<%# Bind("imie") %>' ></asp:Label >
                                                            </ItemTemplate >
                                                            <ItemStyle  CssClass = "t2_nazwisko" />
                                                        </asp:TemplateField >
       <asp:TemplateField HeaderText = "d_01" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')" ><asp:Label ID = "Label_gwTabela1101" runat = "server" Text = '<%# Eval("d_01")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_02" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')" ><asp:Label ID = "Label_gwTabela1102" runat = "server" Text = '<%# Eval("d_02")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_03" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')" ><asp:Label ID = "Label_gwTabela1103" runat = "server" Text = '<%# Eval("d_03")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_04" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')" ><asp:Label ID = "Label_gwTabela1104" runat = "server" Text = '<%# Eval("d_04")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_05" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')" ><asp:Label ID = "Label_gwTabela1105" runat = "server" Text = '<%# Eval("d_05")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_06" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')" ><asp:Label ID = "Label_gwTabela1106" runat = "server" Text = '<%# Eval("d_06")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_07" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')" ><asp:Label ID = "Label_gwTabela1107" runat = "server" Text = '<%# Eval("d_07")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_08" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')" ><asp:Label ID = "Label_gwTabela1108" runat = "server" Text = '<%# Eval("d_08")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_09" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')" ><asp:Label ID = "Label_gwTabela1109" runat = "server" Text = '<%# Eval("d_09")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_10" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')" ><asp:Label ID = "Label_gwTabela1110" runat = "server" Text = '<%# Eval("d_10")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_11" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!2"%>')" ><asp:Label ID = "Label_gwTabela1111" runat = "server" Text = '<%# Eval("d_11")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
     
    
        </Columns>
    </asp:GridView>
                   <br />
        




               </div>
           <br />
              <div class="page-break">
&nbsp;<asp:Label ID="Label3" runat="server" Text="Dział 3.2"></asp:Label>
           &nbsp;&nbsp;&nbsp;
           <asp:Label ID="Label6" runat="server" Text="tabela 4  \/\/\/" Visible="False"></asp:Label>
           <br />
        




     <asp:GridView ID="gwTabela3_2" runat="server" OnRowCreated="naglowekTabeli_gwTabela2"  AutoGenerateColumns="False"  Width = "100%" ShowHeader = "False" ShowFooter = "True"  >
        <Columns>
   
                        <asp:TemplateField HeaderText = "imie" SortExpression = "imie" >
                                          <ItemTemplate >
                                              <asp:Label ID = "Label5" runat = "server" Text = '<%# Eval("nazwisko") %>' ></asp:Label >
                                           <asp:Label ID = "Label2"  runat = "server" Text = '<%# Bind("imie") %>' ></asp:Label >
                                                            </ItemTemplate >
                                                            <ItemStyle  CssClass = "t2_nazwisko" />
                                                        </asp:TemplateField >
       <asp:TemplateField HeaderText = "d_01" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')" ><asp:Label ID = "Label_gwTabela2101" runat = "server" Text = '<%# Eval("d_01")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_02" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')" ><asp:Label ID = "Label_gwTabela2102" runat = "server" Text = '<%# Eval("d_02")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_03" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')" ><asp:Label ID = "Label_gwTabela2103" runat = "server" Text = '<%# Eval("d_03")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_04" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')" ><asp:Label ID = "Label_gwTabela2104" runat = "server" Text = '<%# Eval("d_04")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_05" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')" ><asp:Label ID = "Label_gwTabela2105" runat = "server" Text = '<%# Eval("d_05")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_06" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')" ><asp:Label ID = "Label_gwTabela2106" runat = "server" Text = '<%# Eval("d_06")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_07" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')" ><asp:Label ID = "Label_gwTabela2107" runat = "server" Text = '<%# Eval("d_07")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_08" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')" ><asp:Label ID = "Label_gwTabela2108" runat = "server" Text = '<%# Eval("d_08")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_09" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')" ><asp:Label ID = "Label_gwTabela2109" runat = "server" Text = '<%# Eval("d_09")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_10" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')" ><asp:Label ID = "Label_gwTabela2110" runat = "server" Text = '<%# Eval("d_10")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_11" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!2"%>')" ><asp:Label ID = "Label_gwTabela2111" runat = "server" Text = '<%# Eval("d_11")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
   
     
        </Columns>
    </asp:GridView>
                   <br />
        




               </div>
                 <div class="page-break">
&nbsp;<asp:Label ID="Label7" runat="server" Text="Dział 3.3"></asp:Label>
           &nbsp;&nbsp;&nbsp;
           <asp:Label ID="Label8" runat="server" Text="tabela 5  \/\/\/" Visible="False"></asp:Label>
           <br />
        




     <asp:GridView ID="gwTabela3_3" runat="server" OnRowCreated="naglowekTabeli_gwTabela3_3"  AutoGenerateColumns="False"  Width = "100%" ShowHeader = "False" ShowFooter = "True"  >
        <Columns>
   
                        <asp:TemplateField HeaderText = "imie" SortExpression = "imie" >
                                          <ItemTemplate >
                                              <asp:Label ID = "Label5" runat = "server" Text = '<%# Eval("nazwisko") %>' ></asp:Label >
                                           <asp:Label ID = "Label2"  runat = "server" Text = '<%# Bind("imie") %>' ></asp:Label >
                                                            </ItemTemplate >
                                                            <ItemStyle  CssClass = "t2_nazwisko" />
                                                        </asp:TemplateField >
       <asp:TemplateField HeaderText = "d_01" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')" ><asp:Label ID = "Label_gwTabela2101" runat = "server" Text = '<%# Eval("d_01")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_02" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')" ><asp:Label ID = "Label_gwTabela2102" runat = "server" Text = '<%# Eval("d_02")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_03" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')" ><asp:Label ID = "Label_gwTabela2103" runat = "server" Text = '<%# Eval("d_03")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_04" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')" ><asp:Label ID = "Label_gwTabela2104" runat = "server" Text = '<%# Eval("d_04")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_05" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')" ><asp:Label ID = "Label_gwTabela2105" runat = "server" Text = '<%# Eval("d_05")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_06" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')" ><asp:Label ID = "Label_gwTabela2106" runat = "server" Text = '<%# Eval("d_06")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_07" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')" ><asp:Label ID = "Label_gwTabela2107" runat = "server" Text = '<%# Eval("d_07")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_08" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')" ><asp:Label ID = "Label_gwTabela2108" runat = "server" Text = '<%# Eval("d_08")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_09" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')" ><asp:Label ID = "Label_gwTabela2109" runat = "server" Text = '<%# Eval("d_09")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_10" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')" ><asp:Label ID = "Label_gwTabela2110" runat = "server" Text = '<%# Eval("d_10")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_11" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!2"%>')" ><asp:Label ID = "Label_gwTabela2111" runat = "server" Text = '<%# Eval("d_11")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
   
     
        </Columns>
    </asp:GridView>
                   <br />
        




               </div>

           <div class="page-break">
&nbsp;<asp:Label ID="Label9" runat="server" Text="Dział III.3.2. Obowiązujące w wydziale zasady przydziału pracy asystenom sędziów"></asp:Label>
           &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label11" runat="server" Text="tabela 6  \/\/\/" Visible="False"></asp:Label>
           &nbsp;<table style="width:100%;">
                   <tr>
                       <td class="auto-style1">
                           <asp:TextBox ID="tab_6_w01_c1" runat="server" Rows="6" TextMode="MultiLine" Width="99%"></asp:TextBox>
                       </td>
                   </tr>
                   <tr>
                       <td>Uwagi:</td>
                       </tr>
                       <tr>
                           <td>
                               <asp:TextBox ID="tab_6_w02_c1" runat="server" Rows="6" TextMode="MultiLine" Width="99%"></asp:TextBox>
                           </td>
                       </tr>
               </table>


  
                   <br />
        




               </div>

           <div class="page-break">
&nbsp;<asp:Label ID="Label10" runat="server" Text="Dział III.4.5.6.7 Zmiany limitów i obsad we wszystkich grupach zatrudnienia"></asp:Label>
           &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label12" runat="server" Text="tabela 7  \/\/\/" Visible="False"></asp:Label>
               <br />
&nbsp;<table style="width:100%;">
                   <tr>
                       <td class="borderAll center" rowspan="2">Rok<br />
                       </td>
                       <td class="borderAll center" colspan="3">Sędziowie </td>
                       <td class="borderAll center" colspan="3">referendarze sądowi</td>
                       <td class="borderAll center" colspan="3">referendarze sądowi</td>
                       <td class="borderAll center" colspan="3">urzędnicy sądowi </td>
                       <td class="borderAll center" colspan="3">relacje etatów</td>
                   </tr>
                   <tr>
                       <td class="borderAll center">liczba sędziów i wakujących stanowisk sędziowskich w ramach limitu w okresie statystycznym</td>
                       <td class="borderAll center">*obsada średnio-okresowa </td>
                       <td class="borderAll center">% do limitu</td>
                       <td class="borderAll center">liczba referendarzy w ramach limitu w okresie statystycznym</td>
                       <td class="borderAll center">*obsada średnio-okresowa </td>
                       <td class="borderAll center">% do limitu</td>
                       <td class="borderAll center">liczba asystentów w ramach limitu w okresie statystycznym</td>
                       <td class="borderAll center">*obsada średnio-okresowa </td>
                       <td class="borderAll center">% do limitu</td>
                       <td class="borderAll center">liczba urzędników w okresie statystycznym</td>
                       <td class="borderAll center">*obsada średnio-okresowa </td>
                       <td class="borderAll center">% do limitu</td>
                       <td class="borderAll center">liczba asystentów sędziów przypadająca na jednego sędziego</td>
                       <td class="borderAll center" colspan="2">liczba etatów urzędniczych przypadająca na jeden etat orzeczniczy </td>
                   </tr>
                   <tr>
                       <td class="borderAll center">
                           <asp:Label ID="tab_7_w01_c01" runat="server" Text=""></asp:Label>
                       </td>
                     
                      <td class="col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=1!7!2!3')">  <asp:Label CssClass="normal" ID="tab_7_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
					
                      <td class="col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=1!7!3!3')">  <asp:Label CssClass="normal" ID="tab_7_w01_c03" runat="server" Text="0"></asp:Label>  </a></td>
				      <td class="col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=1!7!4!3')">  <asp:Label CssClass="normal" ID="tab_7_w01_c04" runat="server" Text="0"></asp:Label>  </a></td>
				      <td class="col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=1!7!5!3')">  <asp:Label CssClass="normal" ID="tab_7_w01_c05" runat="server" Text="0"></asp:Label>  </a></td>
				      <td class="col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=1!7!6!3')">  <asp:Label CssClass="normal" ID="tab_7_w01_c06" runat="server" Text="0"></asp:Label>  </a></td>
				      <td class="col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=1!7!7!3')">  <asp:Label CssClass="normal" ID="tab_7_w01_c07" runat="server" Text="0"></asp:Label>  </a></td>
				      <td class="col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=1!7!8!3')">  <asp:Label CssClass="normal" ID="tab_7_w01_c08" runat="server" Text="0"></asp:Label>  </a></td>
				      <td class="col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=1!7!9!3')">  <asp:Label CssClass="normal" ID="tab_7_w01_c09" runat="server" Text="0"></asp:Label>  </a></td>
				      <td class="col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=1!7!10!3')">  <asp:Label CssClass="normal" ID="tab_7_w01_c10" runat="server" Text="0"></asp:Label>  </a></td>
				      <td class="col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=1!7!11!3')">  <asp:Label CssClass="normal" ID="tab_7_w01_c11" runat="server" Text="0"></asp:Label>  </a></td>
				      <td class="col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=1!7!12!3')">  <asp:Label CssClass="normal" ID="tab_7_w01_c12" runat="server" Text="0"></asp:Label>  </a></td>
				      <td class="col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=1!7!13!3')">  <asp:Label CssClass="normal" ID="tab_7_w01_c13" runat="server" Text="0"></asp:Label>  </a></td>
				      <td class="col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=1!7!14!3')">  <asp:Label CssClass="normal" ID="tab_7_w01_c14" runat="server" Text="0"></asp:Label>  </a></td>
				      <td class="col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=1!7!15!3')">  <asp:Label CssClass="normal" ID="tab_7_w01_c15" runat="server" Text="0"></asp:Label>  </a></td>
				      <td class="col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=1!7!16!3')">  <asp:Label CssClass="normal" ID="tab_7_w01_c16" runat="server" Text="0"></asp:Label>  </a></td>
				      
                   </tr>
                    <tr>
                       <td class="borderAll center">
                           <asp:Label ID="tab_7_w02_c01" runat="server" Text="Średnia za okres oceny"></asp:Label>
                       </td>
                     
                      <td class="col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=2!7!2!3')">  <asp:Label CssClass="normal" ID="tab_7_w02_c02" runat="server" Text="0"></asp:Label>  </a></td>
					
                      <td class="col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=2!7!3!3')">  <asp:Label CssClass="normal" ID="tab_7_w02_c03" runat="server" Text="0"></asp:Label>  </a></td>
				      <td class="col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=2!7!4!3')">  <asp:Label CssClass="normal" ID="tab_7_w02_c04" runat="server" Text="0"></asp:Label>  </a></td>
				      <td class="col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=2!7!5!3')">  <asp:Label CssClass="normal" ID="tab_7_w02_c05" runat="server" Text="0"></asp:Label>  </a></td>
				      <td class="col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=2!7!6!3')">  <asp:Label CssClass="normal" ID="tab_7_w02_c06" runat="server" Text="0"></asp:Label>  </a></td>
				      <td class="col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=2!7!7!3')">  <asp:Label CssClass="normal" ID="tab_7_w02_c07" runat="server" Text="0"></asp:Label>  </a></td>
				      <td class="col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=2!7!8!3')">  <asp:Label CssClass="normal" ID="tab_7_w02_c08" runat="server" Text="0"></asp:Label>  </a></td>
				      <td class="col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=2!7!9!3')">  <asp:Label CssClass="normal" ID="tab_7_w02_c09" runat="server" Text="0"></asp:Label>  </a></td>
				      <td class="col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=2!7!10!3')">  <asp:Label CssClass="normal" ID="tab_7_w02_c10" runat="server" Text="0"></asp:Label>  </a></td>
				      <td class="col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=2!7!11!3')">  <asp:Label CssClass="normal" ID="tab_7_w02_c11" runat="server" Text="0"></asp:Label>  </a></td>
				      <td class="col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=2!7!12!3')">  <asp:Label CssClass="normal" ID="tab_7_w02_c12" runat="server" Text="0"></asp:Label>  </a></td>
				      <td class="col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=2!7!13!3')">  <asp:Label CssClass="normal" ID="tab_7_w02_c13" runat="server" Text="0"></asp:Label>  </a></td>
				      <td class="col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=2!7!14!3')">  <asp:Label CssClass="normal" ID="tab_7_w02_c14" runat="server" Text="0"></asp:Label>  </a></td>
				      <td class="col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=2!7!15!3')">  <asp:Label CssClass="normal" ID="tab_7_w02_c15" runat="server" Text="0"></asp:Label>  </a></td>
				      <td class="col_168 borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=2!7!16!3')">  <asp:Label CssClass="normal" ID="tab_7_w02_c16" runat="server" Text="0"></asp:Label>  </a></td>
				      
                   </tr>
                   <tr>
                       <td>&nbsp;</td>
                       <td>&nbsp;</td>
                       <td>&nbsp;</td>
                       <td>&nbsp;</td>
                       <td>&nbsp;</td>
                       <td>&nbsp;</td>
                       <td>&nbsp;</td>
                       <td class="auto-style2">&nbsp;</td>
                       <td>&nbsp;</td>
                       <td>&nbsp;</td>
                       <td>&nbsp;</td>
                       <td>&nbsp;</td>
                       <td>&nbsp;</td>
                       <td>&nbsp;</td>
                       <td>&nbsp;</td>
                       <td>&nbsp;</td>
                   </tr>
                   <tr>
                       <td class="borderAll" colspan="8">III.5. Liczba osób wykonujących czynności na innej podstawie niż stosunek pracy, w tym stażyści z urzędów pracy ( podstawa zatrudnienia, okres wykonywania czynności) </td>
                       <td class="borderAll" colspan="8">
                               <asp:TextBox ID="tab_6_w02_c2" runat="server" Rows="6" TextMode="MultiLine" Width="99%"></asp:TextBox>
                           </td>
                   </tr>
                   <tr>
                       <td class="borderAll" colspan="8">III.6. Warunki pracy (liczba sal rozpraw itp., uwagi) </td>
                       <td class="borderAll" colspan="8">
                               <asp:TextBox ID="tab_6_w02_c3" runat="server" Rows="6" TextMode="MultiLine" Width="99%"></asp:TextBox>
                           </td>
                   </tr>
                   <tr>
                       <td class="borderAll" colspan="8">III.7. Wnioski </td>
                       <td class="borderAll" colspan="8">
                               <asp:TextBox ID="tab_6_w02_c4" runat="server" Rows="6" TextMode="MultiLine" Width="99%"></asp:TextBox>
                           </td>
                   </tr>
               </table>


  
                   <br />
        




               </div>
           <br />
    <asp:PlaceHolder runat="server" ID="tablePlaceHolder"></asp:PlaceHolder>
           </div>
    aa
</asp:Content>
