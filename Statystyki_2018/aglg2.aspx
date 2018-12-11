<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="aglg2.aspx.cs" Inherits="stat2018.aglg2" %>

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
                  <asp:LinkButton ID="LinkButton55" runat="server"  class="ax_box" CssClass="ax_box"> Drukuj </asp:LinkButton>
            </td>
           
            <td style="width:auto;padding-left:5px;">
                 <asp:LinkButton ID="LinkButton57" runat="server" CssClass="ax_box" OnClick="tworzPlikExcell">Zapisz do Excel</asp:LinkButton>
            </td>
        </tr>
    
    </table>
      </div>
       <div style="width:1150px; margin: 0 auto 0 auto; position:relative;top:30px;" class="content landscape">
           <br />
               <div class="page-break">
&nbsp;<asp:Label ID="Label1" runat="server" Text="Wydajność sędziów "></asp:Label>
           &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel1" runat="server" Text="tabela  1" Visible="False"></asp:Label>
           <br />
        
<asp:GridView ID="gwTabela1" runat="server" OnRowCreated="naglowekTabeli_gwTabela1"  AutoGenerateColumns="False"  OnRowDataBound="stopkaTabeli_gwTabela1"  Width = "100%" ShowHeader = "False" ShowFooter = "True"  >
        <Columns>
    
                        <asp:TemplateField HeaderText = "imie" SortExpression = "imie" >
                                          <ItemTemplate >
                                              <asp:Label ID = "Label47" runat = "server" Text = '<%# Eval("nazwisko") %>' ></asp:Label >
                                           <asp:Label ID = "Label48"  runat = "server" Text = '<%# Bind("imie") %>' ></asp:Label >
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
       <asp:TemplateField HeaderText = "d_12" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!2"%>')" ><asp:Label ID = "Label_gwTabela1112" runat = "server" Text = '<%# Eval("d_12")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_13" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!13!2"%>')" ><asp:Label ID = "Label_gwTabela1113" runat = "server" Text = '<%# Eval("d_13")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_14" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!14!2"%>')" ><asp:Label ID = "Label_gwTabela1114" runat = "server" Text = '<%# Eval("d_14")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_15" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!15!2"%>')" ><asp:Label ID = "Label_gwTabela1115" runat = "server" Text = '<%# Eval("d_15")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_16" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!16!2"%>')" ><asp:Label ID = "Label_gwTabela1116" runat = "server" Text = '<%# Eval("d_16")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_17" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!17!2"%>')" ><asp:Label ID = "Label_gwTabela1117" runat = "server" Text = '<%# Eval("d_17")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_18" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!18!2"%>')" ><asp:Label ID = "Label_gwTabela1118" runat = "server" Text = '<%# Eval("d_18")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_19" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!19!2"%>')" ><asp:Label ID = "Label_gwTabela1119" runat = "server" Text = '<%# Eval("d_19")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_20" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!20!2"%>')" ><asp:Label ID = "Label_gwTabela1120" runat = "server" Text = '<%# Eval("d_20")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_21" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!21!2"%>')" ><asp:Label ID = "Label_gwTabela1121" runat = "server" Text = '<%# Eval("d_21")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_22" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!22!2"%>')" ><asp:Label ID = "Label_gwTabela1122" runat = "server" Text = '<%# Eval("d_22")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_23" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!23!2"%>')" ><asp:Label ID = "Label_gwTabela1123" runat = "server" Text = '<%# Eval("d_23")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
     
     
        </Columns>
    </asp:GridView>

                   <br />
        




               </div>
           <br />
           <div class="page-break">
&nbsp;<asp:Label ID="Label7" runat="server" Text="efektywny czas pracy sędziów funkcyjnych "></asp:Label>
           &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel2" runat="server" Text="tabela 2" Visible="False"></asp:Label>
           <br />
        




     <asp:GridView ID="gwTabela2" runat="server" OnRowCreated="naglowekTabeli_gwTabela2"  AutoGenerateColumns="False"  Width = "100%" ShowHeader = "False" OnRowDataBound="stopkaTabeli_gwTabela2" ShowFooter="True"  >
        <Columns>
  
                        <asp:TemplateField HeaderText = "imie" SortExpression = "imie" >
                                          <ItemTemplate >
                                              <asp:Label ID = "Label31" runat = "server" Text = '<%# Eval("nazwisko") %>' ></asp:Label >
                                           <asp:Label ID = "Label32"  runat = "server" Text = '<%# Bind("imie") %>' ></asp:Label >
                                                            </ItemTemplate >
                                                            <ItemStyle  CssClass = "t2_nazwisko" />
                                                        </asp:TemplateField >
       <asp:TemplateField HeaderText = "d_01" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')" ><asp:Label ID = "Label_gwTabela2111" runat = "server" Text = '<%# Eval("d_01")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_02" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')" ><asp:Label ID = "Label_gwTabela2112" runat = "server" Text = '<%# Eval("d_02")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_03" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')" ><asp:Label ID = "Label_gwTabela2113" runat = "server" Text = '<%# Eval("d_03")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_04" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')" ><asp:Label ID = "Label_gwTabela2114" runat = "server" Text = '<%# Eval("d_04")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_05" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')" ><asp:Label ID = "Label_gwTabela2115" runat = "server" Text = '<%# Eval("d_05")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_06" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')" ><asp:Label ID = "Label_gwTabela2116" runat = "server" Text = '<%# Eval("d_06")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_07" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')" ><asp:Label ID = "Label_gwTabela2117" runat = "server" Text = '<%# Eval("d_07")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
     
      <asp:TemplateField HeaderText = "d_07" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')" ><asp:Label ID = "Label_gwTabela2118" runat = "server" Text = '<%# Eval("d_08")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
     
        </Columns>
    </asp:GridView>



                   <br />
        

               </div>
           <div class="page-break">
&nbsp;<asp:Label ID="Label6" runat="server" Text="Efektywny czas pracy sędziów funkcyjnych "></asp:Label>
           &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel3" runat="server" Text="tabela 3" Visible="False"></asp:Label>
           <br />
        




     <asp:GridView ID="gwTabela3" runat="server" OnRowCreated="naglowekTabeli_gwTabela3"  AutoGenerateColumns="False"  Width = "100%" ShowHeader = "False" OnRowDataBound="stopkaTabeli_gwTabela3" ShowFooter="True"  >
        <Columns>
  
                        <asp:TemplateField HeaderText = "imie" SortExpression = "imie" >
                                          <ItemTemplate >
                                              <asp:Label ID = "Label31" runat = "server" Text = '<%# Eval("nazwisko") %>' ></asp:Label >
                                           <asp:Label ID = "Label32"  runat = "server" Text = '<%# Bind("imie") %>' ></asp:Label >
                                                            </ItemTemplate >
                                                            <ItemStyle  CssClass = "t2_nazwisko" />
                                                        </asp:TemplateField >
       <asp:TemplateField HeaderText = "d_01" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')" ><asp:Label ID = "Label_gwTabela2111" runat = "server" Text = '<%# Eval("d_01")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_02" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')" ><asp:Label ID = "Label_gwTabela2112" runat = "server" Text = '<%# Eval("d_02")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_03" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')" ><asp:Label ID = "Label_gwTabela2113" runat = "server" Text = '<%# Eval("d_03")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_04" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')" ><asp:Label ID = "Label_gwTabela2114" runat = "server" Text = '<%# Eval("d_04")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_05" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')" ><asp:Label ID = "Label_gwTabela2115" runat = "server" Text = '<%# Eval("d_05")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_06" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')" ><asp:Label ID = "Label_gwTabela2116" runat = "server" Text = '<%# Eval("d_06")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_07" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')" ><asp:Label ID = "Label_gwTabela2117" runat = "server" Text = '<%# Eval("d_07")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
     
      <asp:TemplateField HeaderText = "d_07" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')" ><asp:Label ID = "Label_gwTabela2118" runat = "server" Text = '<%# Eval("d_08")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
     <asp:TemplateField HeaderText = "d_07" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')" ><asp:Label ID = "Label_gwTabela2119" runat = "server" Text = '<%# Eval("d_09")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
     
        </Columns>
    </asp:GridView>



                   <br />
        

               </div>
           <div class="page-break">
&nbsp;<asp:Label ID="Label10" runat="server" Text="Informacja w zakresie długości postępowania międzyinstancyjnego       "></asp:Label>
           &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="infoLabel4" runat="server" Text="tabela 4  \/\/\/" Visible="False"></asp:Label>
&nbsp;<br />
        




     <asp:GridView ID="gwTabela4" runat="server" OnRowCreated="naglowekTabeli_gwTabela4"  AutoGenerateColumns="False"  Width = "100%" ShowHeader = "False" OnRowDataBound="stopkaTabeli_gwTabela4" ShowFooter="True"  >
        <Columns>
  
                        <asp:TemplateField HeaderText = "imie" SortExpression = "imie" >
                                          <ItemTemplate >
                                              <asp:Label ID = "Label33" runat = "server" Text = '<%# Eval("nazwisko") %>' ></asp:Label >
                                           <asp:Label ID = "Label34"  runat = "server" Text = '<%# Bind("imie") %>' ></asp:Label >
                                                            </ItemTemplate >
                                                            <ItemStyle  CssClass = "t2_nazwisko" />
                                                        </asp:TemplateField >
       <asp:TemplateField HeaderText = "d_01" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')" ><asp:Label ID = "Label_gwTabela2123" runat = "server" Text = '<%# Eval("d_01")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_02" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')" ><asp:Label ID = "Label_gwTabela2124" runat = "server" Text = '<%# Eval("d_02")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_03" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')" ><asp:Label ID = "Label_gwTabela2125" runat = "server" Text = '<%# Eval("d_03")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_04" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')" ><asp:Label ID = "Label_gwTabela2126" runat = "server" Text = '<%# Eval("d_04")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_05" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')" ><asp:Label ID = "Label_gwTabela2127" runat = "server" Text = '<%# Eval("d_05")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_06" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')" ><asp:Label ID = "Label_gwTabela2128" runat = "server" Text = '<%# Eval("d_06")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_07" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')" ><asp:Label ID = "Label_gwTabela2129" runat = "server" Text = '<%# Eval("d_07")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
     
      <asp:TemplateField HeaderText = "d_07" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')" ><asp:Label ID = "Label_gwTabela2130" runat = "server" Text = '<%# Eval("d_08")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
     <asp:TemplateField HeaderText = "d_07" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')" ><asp:Label ID = "Label_gwTabela2131" runat = "server" Text = '<%# Eval("d_09")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
  
     
        </Columns>
    </asp:GridView>



                   <br />
               <br />


  
                   <br />
        




               </div>
              <div class="page-break">
&nbsp;<asp:Label ID="Label3" runat="server"></asp:Label>
           &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel5" runat="server" Text="tabela 5  \/\/\/" Visible="False"></asp:Label>
           <br />
        




     <asp:GridView ID="gwTabela5" runat="server" OnRowCreated="naglowekTabeli_gwTabela5"  AutoGenerateColumns="False"  Width = "100%" ShowHeader = "False" OnRowDataBound="stopkaTabeli_gwTabela5" ShowFooter="True"  >
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
   
                <asp:TemplateField HeaderText = "d_03" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')" ><asp:Label ID = "Label_gwTabela2109" runat = "server" Text = '<%# Eval("d_09")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
   
                 </Columns>
    </asp:GridView>
                   <br />
        




               </div>


           <div class="page-break">
&nbsp;<asp:Label ID="Label9" runat="server">ość spraw Ga, w których postępowanie toczy się powyżej 3 miesięcy od daty wpływu akt do Sądu II instancji</asp:Label>
          &nbsp;<asp:Label ID="infoLabel6" runat="server" Text="tabela 6  \/\/\/" Visible="False"></asp:Label>
           <br />
        

               <asp:GridView ID="gwTabela6" runat="server" OnRowCreated="naglowekTabeli_gwTabela6"  AutoGenerateColumns="False"  OnRowDataBound="stopkaTabeli_gwTabela6"  Width = "100%" ShowHeader = "False" ShowFooter = "True"  >
        <Columns>
                        <asp:TemplateField HeaderText = "imie" SortExpression = "imie" >
                                          <ItemTemplate >
                                              <asp:Label ID = "Label23" runat = "server" Text = '<%# Eval("nazwisko") %>' ></asp:Label >
                                           <asp:Label ID = "Label24"  runat = "server" Text = '<%# Bind("imie") %>' ></asp:Label >
                                                            </ItemTemplate >
                                                            <ItemStyle  CssClass = "t2_nazwisko" />
                                                        </asp:TemplateField >
       <asp:TemplateField HeaderText = "d_01" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')" ><asp:Label ID = "Label_gwTabela6101" runat = "server" Text = '<%# Eval("d_01")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80 center"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_02" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')" ><asp:Label ID = "Label_gwTabela6102" runat = "server" Text = '<%# Eval("d_02")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80 center"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_03" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')" ><asp:Label ID = "Label_gwTabela6103" runat = "server" Text = '<%# Eval("d_03")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80 center"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_04" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')" ><asp:Label ID = "Label_gwTabela6104" runat = "server" Text = '<%# Eval("d_04")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80 center"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_05" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')" ><asp:Label ID = "Label_gwTabela6105" runat = "server" Text = '<%# Eval("d_05")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80 center"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_06" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')" ><asp:Label ID = "Label_gwTabela6106" runat = "server" Text = '<%# Eval("d_06")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80 center"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_07" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')" ><asp:Label ID = "Label_gwTabela6107" runat = "server" Text = '<%# Eval("d_07")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80 center"/>
                </asp:TemplateField>
        </Columns>
    </asp:GridView>



                   <br />
        




               </div>
                 
<div class="page-break">
&nbsp;<asp:Label ID="Label13" runat="server">Stan referatów - I instancja</asp:Label>
          &nbsp;
           <asp:Label ID="infoLabel7" runat="server" Text="tabela 7  \/\/\/" Visible="False"></asp:Label>
           <br />
        


    <asp:GridView ID="gwTabela7" runat="server" OnRowCreated="naglowekTabeli_gwTabela7"  AutoGenerateColumns="False"  OnRowDataBound="stopkaTabeli_gwTabela7"  Width = "100%" ShowHeader = "False" ShowFooter = "True"  >
        <Columns>
                        <asp:TemplateField HeaderText = "imie" SortExpression = "imie" >
                                          <ItemTemplate >
                                              <asp:Label ID = "Label25" runat = "server" Text = '<%# Eval("nazwisko") %>' ></asp:Label >
                                           <asp:Label ID = "Label26"  runat = "server" Text = '<%# Bind("imie") %>' ></asp:Label >
                                                            </ItemTemplate >
                                                            <ItemStyle  CssClass = "t2_nazwisko" />
                                                        </asp:TemplateField >
       <asp:TemplateField HeaderText = "d_01" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')" ><asp:Label ID = "Label_gwTabela7101" runat = "server" Text = '<%# Eval("d_01")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_02" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')" ><asp:Label ID = "Label_gwTabela7102" runat = "server" Text = '<%# Eval("d_02")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_03" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')" ><asp:Label ID = "Label_gwTabela7103" runat = "server" Text = '<%# Eval("d_03")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_04" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')" ><asp:Label ID = "Label_gwTabela7104" runat = "server" Text = '<%# Eval("d_04")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_05" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')" ><asp:Label ID = "Label_gwTabela7105" runat = "server" Text = '<%# Eval("d_05")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_06" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')" ><asp:Label ID = "Label_gwTabela7106" runat = "server" Text = '<%# Eval("d_06")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_07" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')" ><asp:Label ID = "Label_gwTabela7107" runat = "server" Text = '<%# Eval("d_07")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_08" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')" ><asp:Label ID = "Label_gwTabela7108" runat = "server" Text = '<%# Eval("d_08")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_09" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')" ><asp:Label ID = "Label_gwTabela7109" runat = "server" Text = '<%# Eval("d_09")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_10" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')" ><asp:Label ID = "Label_gwTabela7110" runat = "server" Text = '<%# Eval("d_10")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_11" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!2"%>')" ><asp:Label ID = "Label_gwTabela7111" runat = "server" Text = '<%# Eval("d_11")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
        </Columns>
    </asp:GridView>
      

                   <br />
   

               </div>
           
           
           <div class="page-break">
&nbsp;<asp:Label ID="Label15" runat="server">Wskaźnik pozostałości</asp:Label>
          &nbsp;<asp:Label ID="infoLabel8" runat="server" Text="tabela 8  \/\/\/" Visible="False"></asp:Label>
           <br />
        


               <asp:GridView ID="gwTabela8" runat="server" OnRowCreated="naglowekTabeli_gwTabela8"  AutoGenerateColumns="False"  OnRowDataBound="stopkaTabeli_gwTabela8"  Width = "100%" ShowHeader = "False" ShowFooter = "True"  >
        <Columns>
                        <asp:TemplateField HeaderText = "imie" SortExpression = "imie" >
                                          <ItemTemplate >
                                              <asp:Label ID = "Label35" runat = "server" Text = '<%# Eval("nazwisko") %>' ></asp:Label >
                                           <asp:Label ID = "Label36"  runat = "server" Text = '<%# Bind("imie") %>' ></asp:Label >
                                                            </ItemTemplate >
                                                            <ItemStyle  CssClass = "t2_nazwisko" />
                                                        </asp:TemplateField >
       <asp:TemplateField HeaderText = "d_01" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')" ><asp:Label ID = "Label_gwTabela8101" runat = "server" Text = '<%# Eval("d_01")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_02" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')" ><asp:Label ID = "Label_gwTabela8102" runat = "server" Text = '<%# Eval("d_02")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_03" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')" ><asp:Label ID = "Label_gwTabela8103" runat = "server" Text = '<%# Eval("d_03")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_04" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')" ><asp:Label ID = "Label_gwTabela8104" runat = "server" Text = '<%# Eval("d_04")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_05" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')" ><asp:Label ID = "Label_gwTabela8105" runat = "server" Text = '<%# Eval("d_05")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_06" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')" ><asp:Label ID = "Label_gwTabela8106" runat = "server" Text = '<%# Eval("d_06")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_07" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')" ><asp:Label ID = "Label_gwTabela8107" runat = "server" Text = '<%# Eval("d_07")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_08" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')" ><asp:Label ID = "Label_gwTabela8108" runat = "server" Text = '<%# Eval("d_08")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
        </Columns>
    </asp:GridView>
         

                   <br />
        




               </div>
                 
<div class="page-break">
&nbsp;<asp:Label ID="Label17" runat="server">Zawieszenia </asp:Label>
          &nbsp;<asp:Label ID="infoLabel9" runat="server" Text="tabela 9  \/\/\/" Visible="False"></asp:Label>
           <br />
        <table style="width:100%;">
            <tr>
                <td class="borderAll center">&nbsp;</td>
                <td class="borderAll center">Liczba spraw</td>
                <td class="borderAll center">Terminy czynności nazdorczych</td>
            </tr>
             <tr> 
  <td class="borderAll col_200 center"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!9!1!3')"><asp:TextBox CssClass="normal" ID="tab_9_w01_c01" runat="server" Text="0"></asp:TextBox></a></td>
  <td class="borderAll col_200 center"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!9!2!3')"><asp:TextBox CssClass="normal" ID="tab_9_w01_c02" runat="server" Text="0"></asp:TextBox></a></td>
  <td class="borderAll col_200 center"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!9!3!3')"><asp:TextBox CssClass="normal" ID="tab_9_w01_c03" runat="server" Text="0"></asp:TextBox></a></td>
   </tr> 
   <tr> 
  <td class="borderAll col_200 center"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!9!1!3')"><asp:TextBox CssClass="normal" ID="tab_9_w02_c01" runat="server" Text="0"></asp:TextBox></a></td>
  <td class="borderAll col_200 center"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!9!2!3')"><asp:TextBox CssClass="normal" ID="tab_9_w02_c02" runat="server" Text="0"></asp:TextBox></a></td>
  <td class="borderAll col_200 center"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!9!3!3')"><asp:TextBox CssClass="normal" ID="tab_9_w02_c03" runat="server" Text="0"></asp:TextBox></a></td>
   </tr> 
   <tr> 
  <td class="borderAll col_200 center"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!9!1!3')"><asp:TextBox CssClass="normal" ID="tab_9_w03_c01" runat="server" Text="0"></asp:TextBox></a></td>
  <td class="borderAll col_200 center"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!9!2!3')"><asp:TextBox CssClass="normal" ID="tab_9_w03_c02" runat="server" Text="0"></asp:TextBox></a></td>
  <td class="borderAll col_200 center"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!9!3!3')"><asp:TextBox CssClass="normal" ID="tab_9_w03_c03" runat="server" Text="0"></asp:TextBox></a></td>
   </tr> 
   <tr> 
  <td class="borderAll col_200 center"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!9!1!3')"><asp:TextBox CssClass="normal" ID="tab_9_w04_c01" runat="server" Text="0"></asp:TextBox></a></td>
  <td class="borderAll col_200 center"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!9!2!3')"><asp:TextBox CssClass="normal" ID="tab_9_w04_c02" runat="server" Text="0"></asp:TextBox></a></td>
  <td class="borderAll col_200 center"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!9!3!3')"><asp:TextBox CssClass="normal" ID="tab_9_w04_c03" runat="server" Text="0"></asp:TextBox></a></td>
   </tr> 
   <tr> 
  <td class="borderAll col_200 center"> 
  <a href="javascript: openPopup('popup.aspx?sesja=5!9!1!3')"><asp:TextBox CssClass="normal" ID="tab_9_w05_c01" runat="server" Text="0"></asp:TextBox></a></td>
  <td class="borderAll col_200 center"> 
  <a href="javascript: openPopup('popup.aspx?sesja=5!9!2!3')"><asp:TextBox CssClass="normal" ID="tab_9_w05_c02" runat="server" Text="0"></asp:TextBox></a></td>
  <td class="borderAll col_200 center"> 
  <a href="javascript: openPopup('popup.aspx?sesja=5!9!3!3')"><asp:TextBox CssClass="normal" ID="tab_9_w05_c03" runat="server" Text="0"></asp:TextBox></a></td>
   </tr> 
   <tr> 
  <td class="borderAll col_200 center"> 
  <a href="javascript: openPopup('popup.aspx?sesja=6!9!1!3')"><asp:TextBox CssClass="normal" ID="tab_9_w06_c01" runat="server" Text="0"></asp:TextBox></a></td>
  <td class="borderAll col_200 center"> 
  <a href="javascript: openPopup('popup.aspx?sesja=6!9!2!3')"><asp:TextBox CssClass="normal" ID="tab_9_w06_c02" runat="server" Text="0"></asp:TextBox></a></td>
  <td class="borderAll col_200 center"> 
  <a href="javascript: openPopup('popup.aspx?sesja=6!9!3!3')"><asp:TextBox CssClass="normal" ID="tab_9_w06_c03" runat="server" Text="0"></asp:TextBox></a></td>
   </tr> 
   <tr> 
  <td class="borderAll col_200 center"> 
  <a href="javascript: openPopup('popup.aspx?sesja=7!9!1!3')"><asp:TextBox CssClass="normal" ID="tab_9_w07_c01" runat="server" Text="0"></asp:TextBox></a></td>
  <td class="borderAll col_200 center"> 
  <a href="javascript: openPopup('popup.aspx?sesja=7!9!2!3')"><asp:TextBox CssClass="normal" ID="tab_9_w07_c02" runat="server" Text="0"></asp:TextBox></a></td>
  <td class="borderAll col_200 center"> 
  <a href="javascript: openPopup('popup.aspx?sesja=7!9!3!3')"><asp:TextBox CssClass="normal" ID="tab_9_w07_c03" runat="server" Text="0"></asp:TextBox></a></td>
   </tr> 
   <tr> 
  <td class="borderAll col_200 center"> 
  <a href="javascript: openPopup('popup.aspx?sesja=8!9!1!3')"><asp:TextBox CssClass="normal" ID="tab_9_w08_c01" runat="server" Text="0"></asp:TextBox></a></td>
  <td class="borderAll col_200 center"> 
  <a href="javascript: openPopup('popup.aspx?sesja=8!9!2!3')"><asp:TextBox CssClass="normal" ID="tab_9_w08_c02" runat="server" Text="0"></asp:TextBox></a></td>
  <td class="borderAll col_200 center"> 
  <a href="javascript: openPopup('popup.aspx?sesja=8!9!3!3')"><asp:TextBox CssClass="normal" ID="tab_9_w08_c03" runat="server" Text="0"></asp:TextBox></a></td>
   </tr> 
   <tr> 
  <td class="borderAll col_200 center"> 
  <a href="javascript: openPopup('popup.aspx?sesja=9!9!1!3')"><asp:TextBox CssClass="normal" ID="tab_9_w09_c01" runat="server" Text="0"></asp:TextBox></a></td>
  <td class="borderAll col_200 center"> 
  <a href="javascript: openPopup('popup.aspx?sesja=9!9!2!3')"><asp:TextBox CssClass="normal" ID="tab_9_w09_c02" runat="server" Text="0"></asp:TextBox></a></td>
  <td class="borderAll col_200 center"> 
  <a href="javascript: openPopup('popup.aspx?sesja=9!9!3!3')"><asp:TextBox CssClass="normal" ID="tab_9_w09_c03" runat="server" Text="0"></asp:TextBox></a></td>
   </tr> 
    </table>




                   <br />




               <br />
         



                   <br />
        




               </div>
  
           <div class="page-break">
&nbsp;<asp:Label ID="Label19" runat="server">Uzasadnienia GC I instancja</asp:Label>
          &nbsp;<asp:Label ID="infoLabel10" runat="server" Text="tabela 10  \/\/\/" Visible="False"></asp:Label>
           <br />
        
               <asp:GridView ID="gwTabela10" runat="server" OnRowCreated="naglowekTabeli_gwTabela10"  AutoGenerateColumns="False"  OnRowDataBound="stopkaTabeli_gwTabela10"  Width = "100%" ShowHeader = "False" ShowFooter = "True"  >
        <Columns>
                        <asp:TemplateField HeaderText = "imie" SortExpression = "imie" >
                                          <ItemTemplate >
                                              <asp:Label ID = "Label37" runat = "server" Text = '<%# Eval("nazwisko") %>' ></asp:Label >
                                           <asp:Label ID = "Label38"  runat = "server" Text = '<%# Bind("imie") %>' ></asp:Label >
                                                            </ItemTemplate >
                                                            <ItemStyle  CssClass = "t2_nazwisko" />
                                                        </asp:TemplateField >
       <asp:TemplateField HeaderText = "d_01" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')" ><asp:Label ID = "Label_gwTabela10101" runat = "server" Text = '<%# Eval("d_01")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_02" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')" ><asp:Label ID = "Label_gwTabela10102" runat = "server" Text = '<%# Eval("d_02")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_03" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')" ><asp:Label ID = "Label_gwTabela10103" runat = "server" Text = '<%# Eval("d_03")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_04" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')" ><asp:Label ID = "Label_gwTabela10104" runat = "server" Text = '<%# Eval("d_04")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_05" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')" ><asp:Label ID = "Label_gwTabela10105" runat = "server" Text = '<%# Eval("d_05")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_06" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')" ><asp:Label ID = "Label_gwTabela10106" runat = "server" Text = '<%# Eval("d_06")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_07" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')" ><asp:Label ID = "Label_gwTabela10107" runat = "server" Text = '<%# Eval("d_07")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_08" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')" ><asp:Label ID = "Label_gwTabela10108" runat = "server" Text = '<%# Eval("d_08")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_08" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')" ><asp:Label ID = "Label_gwTabela10109" runat = "server" Text = '<%# Eval("d_09")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_08" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')" ><asp:Label ID = "Label_gwTabela10110" runat = "server" Text = '<%# Eval("d_10")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
 
                   </Columns>
    </asp:GridView>
       

                   <br />
        




               </div>
                 
<div class="page-break">
&nbsp;<asp:Label ID="Label21" runat="server">Postępowanie międzyinstancyjne </asp:Label>
           <asp:Label ID="infoLabel11" runat="server" Text="tabela 11  \/\/\/" Visible="False"></asp:Label>
           <br />
    <table style="width:100%;">
        <tr>
            <td class="col_180 borderAll" rowspan="2">ogółem</td>
            <td class="center borderAll" colspan="2">do 3 miesięcy</td>
            <td class="center borderAll" colspan="2">od 3 do 5 miesięcy</td>
            <td class="center borderAll" colspan="2">powyżej 5 miesięcy</td>
        </tr>
        <tr>
            <td class="col_180 borderAll">ogółem</td>
            <td class="col_180 borderAll">%</td>
            <td class="col_180 borderAll">ogółem</td>
            <td class="col_180 borderAll">%</td>
            <td class="col_180 borderAll">ogółem</td>
            <td class="col_180 borderAll">%</td>
        </tr>
        <tr>
                    <td class="col_140 center borderAll">
        <a href="javascript:openPopup('popup.aspx?sesja=1!11!1!3')"><asp:Label CssClass="normal" ID="tab_11_w01_c01" runat="server" Text="0"></asp:Label></a>
                </td>
                <td class="col_140 center borderAll">
                    <a href="javascript:openPopup('popup.aspx?sesja=1!11!2!3')"><asp:Label CssClass="normal" ID="tab_11_w01_c02" runat="server" Text="0"></asp:Label></a>
                </td>
                <td class="col_140 center borderAll">
                    <a href="javascript:openPopup('popup.aspx?sesja=1!11!3!3')"><asp:Label CssClass="normal" ID="tab_11_w01_c03" runat="server" Text="0"></asp:Label></a>
                </td>
                <td class="col_140 center borderAll">
                    <a href="javascript:openPopup('popup.aspx?sesja=1!11!4!3')"><asp:Label CssClass="normal" ID="tab_11_w01_c04" runat="server" Text="0"></asp:Label></a>
                </td>
                <td class="col_140 center borderAll">
                    <a href="javascript:openPopup('popup.aspx?sesja=1!11!5!3')"><asp:Label CssClass="normal" ID="tab_11_w01_c05" runat="server" Text="0"></asp:Label></a>
                </td>
                <td class="col_140 center borderAll">
                    <a href="javascript:openPopup('popup.aspx?sesja=1!11!6!3')"><asp:Label CssClass="normal" ID="tab_11_w01_c06" runat="server" Text="0"></asp:Label></a>
                </td>
                <td class="col_140 center borderAll">
                    <a href="javascript:openPopup('popup.aspx?sesja=1!11!7!3')"><asp:Label CssClass="normal" ID="tab_11_w01_c07" runat="server" Text="0"></asp:Label></a>
                </td>
                </tr>
    </table>
    <br />
                
               </div>
 
                           
<div class="page-break">
&nbsp;<asp:Label ID="Label39" runat="server">Odroczone sprawy Ga</asp:Label>
          &nbsp;<asp:Label ID="infoLabel12" runat="server" Text="tabela 12  \/\/\/" Visible="False"></asp:Label>
           <br />
        



    <asp:GridView ID="gwTabela12" runat="server" OnRowCreated="naglowekTabeli_gwTabela12"  AutoGenerateColumns="False"  OnRowDataBound="stopkaTabeli_gwTabela12"  Width = "100%" ShowHeader = "False" ShowFooter = "True"  >
        <Columns>
                        <asp:TemplateField HeaderText = "imie" SortExpression = "imie" >
                                          <ItemTemplate >
                                              <asp:Label ID = "Label40" runat = "server" Text = '<%# Eval("nazwisko") %>' ></asp:Label >
                                           <asp:Label ID = "Label42"  runat = "server" Text = '<%# Bind("imie") %>' ></asp:Label >
                                                            </ItemTemplate >
                                                            <ItemStyle  CssClass = "t2_nazwisko" />
                                                        </asp:TemplateField >
       <asp:TemplateField HeaderText = "d_01" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')" ><asp:Label ID = "Label_gwTabela12101" runat = "server" Text = '<%# Eval("d_01")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_02" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')" ><asp:Label ID = "Label_gwTabela12102" runat = "server" Text = '<%# Eval("d_02")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_03" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')" ><asp:Label ID = "Label_gwTabela12103" runat = "server" Text = '<%# Eval("d_03")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_04" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')" ><asp:Label ID = "Label_gwTabela12104" runat = "server" Text = '<%# Eval("d_04")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_05" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')" ><asp:Label ID = "Label_gwTabela12105" runat = "server" Text = '<%# Eval("d_05")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_06" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')" ><asp:Label ID = "Label_gwTabela12106" runat = "server" Text = '<%# Eval("d_06")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
        </Columns>
    </asp:GridView>
 
                   <br />
       &nbsp;Odroczone sprawy Ga
           <asp:Label ID="infoLabel13" runat="server" Text="tabela 13  \/\/\/" Visible="False"></asp:Label>
           <br />
        



 <asp:GridView ID="gwTabela13" runat="server" OnRowCreated="naglowekTabeli_gwTabela13"  AutoGenerateColumns="False"  OnRowDataBound="stopkaTabeli_gwTabela13"  Width = "100%" ShowHeader = "False" ShowFooter = "True" OnSelectedIndexChanged="gwTabela13_SelectedIndexChanged"  >
        <Columns>
                        <asp:TemplateField HeaderText = "imie" SortExpression = "imie" >
                                          <ItemTemplate >
                                              <asp:Label ID = "Label45" runat = "server" Text = '<%# Eval("nazwisko") %>' ></asp:Label >
                                           <asp:Label ID = "Label46"  runat = "server" Text = '<%# Bind("imie") %>' ></asp:Label >
                                                            </ItemTemplate >
                                                            <ItemStyle  CssClass = "t2_nazwisko" />
                                                        </asp:TemplateField >
       <asp:TemplateField HeaderText = "d_01" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')" ><asp:Label ID = "Label_gwTabela13101" runat = "server" Text = '<%# Eval("d_01")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_02" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')" ><asp:Label ID = "Label_gwTabela13102" runat = "server" Text = '<%# Eval("d_02")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_03" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')" ><asp:Label ID = "Label_gwTabela13103" runat = "server" Text = '<%# Eval("d_03")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_04" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')" ><asp:Label ID = "Label_gwTabela13104" runat = "server" Text = '<%# Eval("d_04")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_05" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')" ><asp:Label ID = "Label_gwTabela13105" runat = "server" Text = '<%# Eval("d_05")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_06" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')" ><asp:Label ID = "Label_gwTabela13106" runat = "server" Text = '<%# Eval("d_06")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_07" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')" ><asp:Label ID = "Label_gwTabela13107" runat = "server" Text = '<%# Eval("d_07")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_08" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')" ><asp:Label ID = "Label_gwTabela13108" runat = "server" Text = '<%# Eval("d_08")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_09" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')" ><asp:Label ID = "Label_gwTabela13109" runat = "server" Text = '<%# Eval("d_09")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_10" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')" ><asp:Label ID = "Label_gwTabela13110" runat = "server" Text = '<%# Eval("d_10")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_11" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!2"%>')" ><asp:Label ID = "Label_gwTabela13111" runat = "server" Text = '<%# Eval("d_11")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_12" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!2"%>')" ><asp:Label ID = "Label_gwTabela13112" runat = "server" Text = '<%# Eval("d_12")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_13" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!13!2"%>')" ><asp:Label ID = "Label_gwTabela13113" runat = "server" Text = '<%# Eval("d_13")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_13" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!14!2"%>')" ><asp:Label ID = "Label_gwTabela13114" runat = "server" Text = '<%# Eval("d_14")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_60"/>
                </asp:TemplateField>
 
                   </Columns>
    </asp:GridView>
      
                   <br />
        




               </div>
                 
<div class="page-break">
&nbsp;<asp:Label ID="Label43" runat="server">Terminowość przyznawania wynagrodzeń i wypłaty biegłym i tłumaczom</asp:Label>
          11
           <asp:Label ID="infoLabel14" runat="server" Text="tabela 14  \/\/\/" Visible="False"></asp:Label>
           <br />
        



    &nbsp;<table style="width:100%;">
                       <tr>
                           <td class="borderAll center" rowspan="3">Instancja
                           <td class="borderAll center" rowspan="3">Instancja</td>
                           <td class="borderAll center" rowspan="3">Złożone wnioski o przyznanie wynagrodzenia biegłemu (tłumaczowi)</td>
                           <td class="borderAll center" colspan="5">Rozpoznane wnioski o przyznanie wynagrodzenia biegłemu (tłumaczowi), licząc od daty wpływu wniosku/rachunku</td>
                           <td class="borderAll center" colspan="5">Wnioski przekazane do oddziału finansowego, licząc od daty uprawomocnienia orzeczenia</td>
                       </tr>
                       <tr>
                           <td class="borderAll center" rowspan="2">razem</td>
                           <td class="borderAll center" colspan="4">w tym w terminie</td>
                           <td class="borderAll center" rowspan="2">razem</td>
                           <td class="borderAll center" colspan="4">w tym po terminie</td>
                       </tr>
                       <tr>
                           <td class="borderAll center">do 14 dni</td>
                           <td class="borderAll center">pow. 14 do 30 dni</td>
                           <td class="borderAll center">powyżej 30 dni</td>
                           <td class="borderAll center">% powyżej 30 dni do razem</td>
                           <td class="borderAll center">do 14 dni</td>
                           <td class="borderAll center">pow. 14 do 30 dni</td>
                           <td class="borderAll center">powyżej 30 dni</td>
                           <td class="borderAll center">% powyżej 30 dni do</td>
                       </tr>
                       <tr>
                           <td class="borderAll center">I</td>
                                     <td class="col_90 center borderAll">
        <a href="javascript:openPopup('popup.aspx?sesja=1!14!1!3')"><asp:Label CssClass="normal" ID="tab_14_w01_c01" runat="server" Text="0"></asp:Label></a>
                </td>
                <td class="col_90 center borderAll">
                    <a href="javascript:openPopup('popup.aspx?sesja=1!14!2!3')"><asp:Label CssClass="normal" ID="tab_14_w01_c02" runat="server" Text="0"></asp:Label></a>
                </td>
                <td class="col_90 center borderAll">
                    <a href="javascript:openPopup('popup.aspx?sesja=1!14!3!3')"><asp:Label CssClass="normal" ID="tab_14_w01_c03" runat="server" Text="0"></asp:Label></a>
                </td>
                <td class="col_90 center borderAll">
                    <a href="javascript:openPopup('popup.aspx?sesja=1!14!4!3')"><asp:Label CssClass="normal" ID="tab_14_w01_c04" runat="server" Text="0"></asp:Label></a>
                </td>
                <td class="col_90 center borderAll">
                    <a href="javascript:openPopup('popup.aspx?sesja=1!14!5!3')"><asp:Label CssClass="normal" ID="tab_14_w01_c05" runat="server" Text="0"></asp:Label></a>
                </td>
                <td class="col_90 center borderAll">
                    <a href="javascript:openPopup('popup.aspx?sesja=1!14!6!3')"><asp:Label CssClass="normal" ID="tab_14_w01_c06" runat="server" Text="0"></asp:Label></a>
                </td>
                <td class="col_90 center borderAll">
                    <a href="javascript:openPopup('popup.aspx?sesja=1!14!7!3')"><asp:Label CssClass="normal" ID="tab_14_w01_c07" runat="server" Text="0"></asp:Label></a>
                </td>
   		<td class="col_90 center borderAll">
                    <a href="javascript:openPopup('popup.aspx?sesja=1!14!8!3')"><asp:Label CssClass="normal" ID="tab_14_w01_c08" runat="server" Text="0"></asp:Label></a>
                </td>
                <td class="col_90 center borderAll">
                    <a href="javascript:openPopup('popup.aspx?sesja=1!14!9!3')"><asp:Label CssClass="normal" ID="tab_14_w01_c09" runat="server" Text="0"></asp:Label></a>
                </td>
                <td class="col_90 center borderAll">
                    <a href="javascript:openPopup('popup.aspx?sesja=1!14!10!3')"><asp:Label CssClass="normal" ID="tab_14_w01_c10" runat="server" Text="0"></asp:Label></a>
                </td>
                 <td class="col_90 center borderAll">
                    <a href="javascript:openPopup('popup.aspx?sesja=1!14!11!3')"><asp:Label CssClass="normal" ID="tab_14_w01_c11" runat="server" Text="0"></asp:Label></a>
                </td>
 <td class="col_90 center borderAll">
                    <a href="javascript:openPopup('popup.aspx?sesja=1!14!12!3')"><asp:Label CssClass="normal" ID="tab_14_w01_c12" runat="server" Text="0"></asp:Label></a>
                </td>
                       </tr>
                       <tr>
                           <td class="borderAll center">I I</td>
                                      <td class="col_90 center borderAll">
        <a href="javascript:openPopup('popup.aspx?sesja=2!14!1!3')"><asp:Label CssClass="normal" ID="tab_14_w02_c01" runat="server" Text="0"></asp:Label></a>
                </td>
                <td class="col_90 center borderAll">
                    <a href="javascript:openPopup('popup.aspx?sesja=2!14!2!3')"><asp:Label CssClass="normal" ID="tab_14_w02_c02" runat="server" Text="0"></asp:Label></a>
                </td>
                <td class="col_90 center borderAll">
                    <a href="javascript:openPopup('popup.aspx?sesja=2!14!3!3')"><asp:Label CssClass="normal" ID="tab_14_w02_c03" runat="server" Text="0"></asp:Label></a>
                </td>
                <td class="col_90 center borderAll">
                    <a href="javascript:openPopup('popup.aspx?sesja=2!14!4!3')"><asp:Label CssClass="normal" ID="tab_14_w02_c04" runat="server" Text="0"></asp:Label></a>
                </td>
                <td class="col_90 center borderAll">
                    <a href="javascript:openPopup('popup.aspx?sesja=2!14!5!3')"><asp:Label CssClass="normal" ID="tab_14_w02_c05" runat="server" Text="0"></asp:Label></a>
                </td>
                <td class="col_90 center borderAll">
                    <a href="javascript:openPopup('popup.aspx?sesja=2!14!6!3')"><asp:Label CssClass="normal" ID="tab_14_w02_c06" runat="server" Text="0"></asp:Label></a>
                </td>
                <td class="col_90 center borderAll">
                    <a href="javascript:openPopup('popup.aspx?sesja=2!14!7!3')"><asp:Label CssClass="normal" ID="tab_14_w02_c07" runat="server" Text="0"></asp:Label></a>
                </td>
   		<td class="col_90 center borderAll">
                    <a href="javascript:openPopup('popup.aspx?sesja=2!14!8!3')"><asp:Label CssClass="normal" ID="tab_14_w02_c08" runat="server" Text="0"></asp:Label></a>
                </td>
                <td class="col_90 center borderAll">
                    <a href="javascript:openPopup('popup.aspx?sesja=2!14!9!3')"><asp:Label CssClass="normal" ID="tab_14_w02_c09" runat="server" Text="0"></asp:Label></a>
                </td>
                <td class="col_90 center borderAll">
                    <a href="javascript:openPopup('popup.aspx?sesja=2!14!10!3')"><asp:Label CssClass="normal" ID="tab_14_w02_c10" runat="server" Text="0"></asp:Label></a>
                </td>
                 <td class="col_90 center borderAll">
                    <a href="javascript:openPopup('popup.aspx?sesja=2!14!11!3')"><asp:Label CssClass="normal" ID="tab_14_w02_c11" runat="server" Text="0"></asp:Label></a>
                </td>
                <td class="col_90 center borderAll">
                    <a href="javascript:openPopup('popup.aspx?sesja=2!14!12!3')"><asp:Label CssClass="normal" ID="tab_14_w02_c12" runat="server" Text="0"></asp:Label></a>
                </td>
                       </tr>
                       <tr>
                           <td class="borderAll center">RAZEM</td>
                                      <td class="col_90 center borderAll">
        <a href="javascript:openPopup('popup.aspx?sesja=3!14!1!3')"><asp:Label CssClass="normal" ID="tab_14_w03_c01" runat="server" Text="0"></asp:Label></a>
                </td>
                <td class="col_90 center borderAll">
                    <a href="javascript:openPopup('popup.aspx?sesja=3!14!2!3')"><asp:Label CssClass="normal" ID="tab_14_w03_c02" runat="server" Text="0"></asp:Label></a>
                </td>
                <td class="col_90 center borderAll">
                    <a href="javascript:openPopup('popup.aspx?sesja=3!14!3!3')"><asp:Label CssClass="normal" ID="tab_14_w03_c03" runat="server" Text="0"></asp:Label></a>
                </td>
                <td class="col_90 center borderAll">
                    <a href="javascript:openPopup('popup.aspx?sesja=3!14!4!3')"><asp:Label CssClass="normal" ID="tab_14_w03_c04" runat="server" Text="0"></asp:Label></a>
                </td>
                <td class="col_90 center borderAll">
                    <a href="javascript:openPopup('popup.aspx?sesja=3!14!5!3')"><asp:Label CssClass="normal" ID="tab_14_w03_c05" runat="server" Text="0"></asp:Label></a>
                </td>
                <td class="col_90 center borderAll">
                    <a href="javascript:openPopup('popup.aspx?sesja=3!14!6!3')"><asp:Label CssClass="normal" ID="tab_14_w03_c06" runat="server" Text="0"></asp:Label></a>
                </td>
                <td class="col_90 center borderAll">
                    <a href="javascript:openPopup('popup.aspx?sesja=3!14!7!3')"><asp:Label CssClass="normal" ID="tab_14_w03_c07" runat="server" Text="0"></asp:Label></a>
                </td>
   		<td class="col_90 center borderAll">
                    <a href="javascript:openPopup('popup.aspx?sesja=3!14!8!3')"><asp:Label CssClass="normal" ID="tab_14_w03_c08" runat="server" Text="0"></asp:Label></a>
                </td>
                <td class="col_90 center borderAll">
                    <a href="javascript:openPopup('popup.aspx?sesja=3!14!9!3')"><asp:Label CssClass="normal" ID="tab_14_w03_c09" runat="server" Text="0"></asp:Label></a>
                </td>
                <td class="col_90 center borderAll">
                    <a href="javascript:openPopup('popup.aspx?sesja=3!14!10!3')"><asp:Label CssClass="normal" ID="tab_14_w03_c10" runat="server" Text="0"></asp:Label></a>
                </td>
                 <td class="col_90 center borderAll">
                    <a href="javascript:openPopup('popup.aspx?sesja=3!14!11!3')"><asp:Label CssClass="normal" ID="tab_14_w03_c11" runat="server" Text="0"></asp:Label></a>
                </td>
                <td class="col_90 center borderAll">
                    <a href="javascript:openPopup('popup.aspx?sesja=3!14!12!3')"><asp:Label CssClass="normal" ID="tab_14_w03_c12" runat="server" Text="0"></asp:Label></a>
                </td>
                       </tr>
    </table>
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
