﻿<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="obbp.aspx.cs" Inherits="stat2018.obbp" %>

<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.15.0,  Culture=neutral,  PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


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
    @media print {
            @page {
                size: 29cm 21.7cm;
                margin: 10mm 10mm 10mm 10mm;
            }

            .horizont {
                transform: translate(-15mm, 0) scale(0.9);
                -webkit-transform: translate(-15mm, 0) scale(0.9);
                -moz-transform: translate(-15mm, 0) scale(0.9);
            }
        }

              </style>
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
                  <input id="Button1" class="ax_box" style="border-style: none; padding: 0px" type="button" onclick="JavaScript: window.print();" value="Drukuj" /></td>
            
           
            <td style="width:auto;padding-left:5px;">
                 <asp:LinkButton ID="LinkButton57" runat="server" CssClass="ax_box" OnClick="tworzPlikExcell">Zapisz do Excel</asp:LinkButton>
            </td>
        </tr>
    
    </table>
      </div>
       <div style="width:1150px; margin: 0 auto 0 auto; position:relative;top:30px;" >
           <br />
               <div class="horizont">
&nbsp;<asp:Label ID="Label1" runat="server" Text="Informacja statystyczna o ruchu spraw "></asp:Label>
           &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel1" runat="server" Text="tabela  1 + 2 \/\/\/" Visible="False"></asp:Label>
           <br />
        




     <asp:GridView ID="gwTabela1" runat="server" OnRowCreated="naglowekTabeli_gwTabela1"  AutoGenerateColumns="False"  Width = "100%" ShowHeader = "False" OnRowDataBound="gwTabela1_RowDataBound"  >
        <Columns>
              <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
            <ItemStyle  CssClass="col_25" />
            </asp:BoundField>

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
     
        </Columns>
    </asp:GridView>
                   <br />
        




               </div>
           <br />
           <div class="page-break">
&nbsp;<asp:Label ID="Label7" runat="server" Text="Wykaz terminowości sporządzania uzasadnień z orzeczeń"></asp:Label>
           &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel5" runat="server" Text="tabela 3  \/\/\/" Visible="False"></asp:Label>
           <br />
        
<table style="width:100%;">
                   <tr>
                     
                      <td class="borderAll center" rowspan="2">Rep.</td>
					
                      <td class="borderAll center" colspan="3">Ilość spraw przedstawionych SO</td>
					
				      <td class="borderAll center" colspan="3">Z tego od daty zaskarżenia orzeczenia </td>
				      
                   </tr>
                   <tr>
                     
                      <td class="col_168 borderAll">Razem</td>
					
                      <td class="col_168 borderAll">zażalenia</td>
				      <td class="col_168 borderAll">apelacje</td>
				      <td class="col_168 borderAll">do 2 miesięcy</td>
				      <td class="col_168 borderAll">do 3 miesięcy</td>
				      <td class="col_168 borderAll">pow. 3&nbsp; miesięcy</td>
				      
                   </tr>
                   <tr>
                     
                      <td class="col_168 borderAll">P</td>
					<td class="col_168 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!3!1!3')">  <asp:Label CssClass="normal" ID="tab_7_w01_c01" runat="server" Text="0"></asp:Label>  </a></td>
					
                      <td class="col_168 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!3!2!3')">  <asp:Label CssClass="normal" ID="tab_7_w01_c02" runat="server" Text="0"></asp:Label>  </a></td>
					
                      <td class="col_168 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!3!3!3')">  <asp:Label CssClass="normal" ID="tab_7_w01_c03" runat="server" Text="0"></asp:Label>  </a></td>
				      <td class="col_168 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!3!4!3')">  <asp:Label CssClass="normal" ID="tab_7_w01_c04" runat="server" Text="0"></asp:Label>  </a></td>
				      <td class="col_168 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!3!5!3')">  <asp:Label CssClass="normal" ID="tab_7_w01_c05" runat="server" Text="0"></asp:Label>  </a></td>
				      <td class="col_168 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!3!6!3')">  <asp:Label CssClass="normal" ID="tab_7_w01_c06" runat="server" Text="0"></asp:Label>  </a></td>
				      
                   </tr>
                                 
      </table>



                   <br />
        

               </div>
           <div class="page-break">
&nbsp;<asp:Label ID="Label10" runat="server" Text="Informacja w zakresie długości postępowania międzyinstancyjnego       "></asp:Label>
           &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="infoLabel3" runat="server" Text="tabela 4  \/\/\/" Visible="False"></asp:Label>
&nbsp;<asp:GridView ID="gwTabela4" runat="server" OnRowCreated="naglowekTabeli_gwTabela2"  AutoGenerateColumns="False"  Width = "100%" ShowHeader = "False"  >
        <Columns>
  
                        <asp:TemplateField HeaderText = "imie" SortExpression = "imie" >
                                          <ItemTemplate >
                                              <asp:Label ID = "Label11" runat = "server" Text = '<%# Eval("nazwisko") %>' ></asp:Label >
                                           <asp:Label ID = "Label12"  runat = "server" Text = '<%# Bind("imie") %>' ></asp:Label >
                                                            </ItemTemplate >
                                                            <ItemStyle  CssClass = "t2_nazwisko" />
                                                        </asp:TemplateField >
       <asp:TemplateField HeaderText = "d_01" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')" ><asp:Label ID = "Label_gwTabela2108" runat = "server" Text = '<%# Eval("d_01")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_02" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')" ><asp:Label ID = "Label_gwTabela2109" runat = "server" Text = '<%# Eval("d_02")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_03" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')" ><asp:Label ID = "Label_gwTabela2110" runat = "server" Text = '<%# Eval("d_03")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       
    <asp:TemplateField HeaderText = "d_03" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')" ><asp:Label ID = "Label_gwTabela2111" runat = "server" Text = '<%# Eval("d_05")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       
        </Columns>
    </asp:GridView>


  
                   <br />
        




               </div>
              <div class="page-break">
&nbsp;<asp:Label ID="Label3" runat="server"></asp:Label>
           &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel4" runat="server" Text="tabela 5  \/\/\/" Visible="False"></asp:Label>
           <br />
        




     <asp:GridView ID="gwTabela5" runat="server" OnRowCreated="naglowekTabeli_gwTabela3"  AutoGenerateColumns="False"  Width = "100%" ShowHeader = "False"  >
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
       <asp:TemplateField HeaderText = "d_03" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')" ><asp:Label ID = "Label_gwTabela2104" runat = "server" Text = '<%# Eval("d_04")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
         <asp:TemplateField HeaderText = "d_03" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')" ><asp:Label ID = "Label_gwTabela2106" runat = "server" Text = '<%# Eval("d_05")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_03" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')" ><asp:Label ID = "Label_gwTabela2106" runat = "server" Text = '<%# Eval("d_06")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_03" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')" ><asp:Label ID = "Label_gwTabela2107" runat = "server" Text = '<%# Eval("d_07")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_03" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')" ><asp:Label ID = "Label_gwTabela2108" runat = "server" Text = '<%# Eval("d_08")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
        </Columns>
    </asp:GridView>
                   <br />
        




               </div>
                 

           
             <div id="debag" >
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
           </div>
    
</asp:Content>
