﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="okrp.aspx.cs" Inherits="stat2018.okrp" %>

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
      <script src="Scripts/jquery-1.8.3.js"></script>


    <script src="Scripts/rls.js"></script>
  
      <div class="noprint" >  
       <div id="menu" style="background-color: #f7f7f7;z-index:9999">
        <div class="manu_back" style="height: 40px; margin: 0 auto 0 auto; position:relative;  width: 1050px;    left: 0px;">               
   <table >
        <tr>
            <td style="width:auto;padding-left:5px;">
                <asp:Label ID="Label4" runat="server" Text="Proszę wybrać zakres:"></asp:Label>
            </td>
            <td style="width:auto;padding-left:5px;">

                <dx:aspxdateedit ID="Date1" runat="server" Theme="Moderno">
                </dx:aspxdateedit>
              


            </td>
            <td style="width:auto;padding-left:5px;">
               
                       <dx:aspxdateedit ID="Date2" runat="server" Theme="Moderno">
                </dx:aspxdateedit></td>
            <td style="width:auto;padding-left:5px;" >
                <asp:LinkButton ID="LinkButton54" runat="server" class="ax_box" OnClick="LinkButton54_Click">  Odśwież</asp:LinkButton>
            </td>
            <td style="width:auto;padding-left:5px;">
                  <asp:LinkButton ID="LinkButton55" runat="server"  class="ax_box" OnClick="LinkButton55_Click" CssClass="ax_box"> Drukuj </asp:LinkButton>
            </td>
            <td style="width:auto;padding-left:5px;">
                
                <asp:LinkButton ID="LinkButton56" runat="server" OnClick="Button1_Click" CssClass="ax_box" Visible="False">DRUKUJ</asp:LinkButton>
            </td>
            <td style="width:auto;padding-left:5px;">
                 <asp:LinkButton ID="LinkButton57" runat="server" CssClass="ax_box" OnClick="Button3_Click">Zapisz do Excel</asp:LinkButton>
            </td>
        </tr>
    
    </table>
            </div>
      </div>
     </div>  
    

   <div style="width:1150px; margin: 0 auto 0 auto; position:relative;top:60px;" class="content">



     <div id="Div2"  style="z-index:10; "> 
        <div style="margin-left:auto;margin-right:auto;text-align: center; width:auto; "> 
            <asp:Label ID="Label3" runat="server" Text="Sąd " style="font-weight: 700"></asp:Label>
     <br />
         </div> 
  

         <br />


     </div>
   <div id="zalatwienia"  class="page-break"> 
    <br />
    


    <asp:Label ID="tabela2Label" runat="server"></asp:Label>
       &nbsp;&nbsp;&nbsp;&nbsp;
       <asp:Label ID="infoLabel2" runat="server" Text="Tabela 1\/" Visible="False"></asp:Label>
       <asp:GridView ID="Gridview1" runat="server" AutoGenerateColumns="False" DataSourceID = "tabela_1"  Width = "100%" ShowHeader = "False" OnRowCreated="Gridview1_RowCreated1" OnRowDataBound="Gridview1_RowDataBound1"  >
        <Columns>
    <asp:BoundField DataField = "id" HeaderText = "L.p." SortExpression = "id" >
                <ItemStyle Width = "15px" />
                  </asp:BoundField >
                 <asp:TemplateField HeaderText="funkcja" SortExpression="imie">
               
                <ItemTemplate>
                    <asp:Label ID="funkcja" runat="server" Text='<%# Eval("funkcja") %>'></asp:Label>
                  
                </ItemTemplate>
                <ItemStyle  CssClass="col_100" />
            </asp:TemplateField>
     <asp:TemplateField HeaderText="funkcja" SortExpression="imie">
               
                <ItemTemplate>
                    <asp:Label ID="stanowisko" runat="server" Text='<%# Eval("stanowisko") %>'></asp:Label>
                  
                </ItemTemplate>
                <ItemStyle  CssClass="col_100" />
            </asp:TemplateField>

                        <asp:TemplateField HeaderText = "imie" SortExpression = "imie" >
                                          <ItemTemplate >
                                              <asp:Label ID = "Label6" runat = "server" Text = '<%# Eval("nazwisko") %>' ></asp:Label >
                                           <asp:Label ID = "Label8"  runat = "server" Text = '<%# Bind("imie") %>' ></asp:Label >
                                                            </ItemTemplate >
                                                            <ItemStyle  CssClass = "t2_nazwisko" />
                                                        </asp:TemplateField >
<asp:TemplateField HeaderText = "d_01" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')" ><asp:Label ID = "Label_Gridview1101" runat = "server" Text = '<%# Eval("d_01")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_37"/>
                </asp:TemplateField>
<asp:TemplateField HeaderText = "d_02" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')" ><asp:Label ID = "Label_Gridview1102" runat = "server" Text = '<%# Eval("d_02")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_37"/>
                </asp:TemplateField>
<asp:TemplateField HeaderText = "d_03" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')" ><asp:Label ID = "Label_Gridview1103" runat = "server" Text = '<%# Eval("d_03")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_37"/>
                </asp:TemplateField>
<asp:TemplateField HeaderText = "d_04" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')" ><asp:Label ID = "Label_Gridview1104" runat = "server" Text = '<%# Eval("d_04")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_37"/>
                </asp:TemplateField>
<asp:TemplateField HeaderText = "d_05" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')" ><asp:Label ID = "Label_Gridview1105" runat = "server" Text = '<%# Eval("d_05")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_37"/>
                </asp:TemplateField>
<asp:TemplateField HeaderText = "d_06" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')" ><asp:Label ID = "Label_Gridview1106" runat = "server" Text = '<%# Eval("d_06")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_37"/>
                </asp:TemplateField>
<asp:TemplateField HeaderText = "d_07" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')" ><asp:Label ID = "Label_Gridview1107" runat = "server" Text = '<%# Eval("d_07")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_37"/>
                </asp:TemplateField>
<asp:TemplateField HeaderText = "d_08" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')" ><asp:Label ID = "Label_Gridview1108" runat = "server" Text = '<%# Eval("d_08")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_37"/>
                </asp:TemplateField>
<asp:TemplateField HeaderText = "d_09" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')" ><asp:Label ID = "Label_Gridview1109" runat = "server" Text = '<%# Eval("d_09")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_37"/>
                </asp:TemplateField>
<asp:TemplateField HeaderText = "d_10" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')" ><asp:Label ID = "Label_Gridview1110" runat = "server" Text = '<%# Eval("d_10")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_37"/>
                </asp:TemplateField>
<asp:TemplateField HeaderText = "d_11" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!2"%>')" ><asp:Label ID = "Label_Gridview1111" runat = "server" Text = '<%# Eval("d_11")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_37"/>
                </asp:TemplateField>
<asp:TemplateField HeaderText = "d_12" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!2"%>')" ><asp:Label ID = "Label_Gridview1112" runat = "server" Text = '<%# Eval("d_12")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_37"/>
                </asp:TemplateField>
<asp:TemplateField HeaderText = "d_13" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!13!2"%>')" ><asp:Label ID = "Label_Gridview1113" runat = "server" Text = '<%# Eval("d_13")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_37"/>
                </asp:TemplateField>
<asp:TemplateField HeaderText = "d_14" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!14!2"%>')" ><asp:Label ID = "Label_Gridview1114" runat = "server" Text = '<%# Eval("d_14")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_37"/>
                </asp:TemplateField>
<asp:TemplateField HeaderText = "d_15" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!15!2"%>')" ><asp:Label ID = "Label_Gridview1115" runat = "server" Text = '<%# Eval("d_15")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_37"/>
                </asp:TemplateField>
<asp:TemplateField HeaderText = "d_16" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!16!2"%>')" ><asp:Label ID = "Label_Gridview1116" runat = "server" Text = '<%# Eval("d_16")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_37"/>
                </asp:TemplateField>
<asp:TemplateField HeaderText = "d_17" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!17!2"%>')" ><asp:Label ID = "Label_Gridview1117" runat = "server" Text = '<%# Eval("d_17")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_37"/>
                </asp:TemplateField>


            
<asp:TemplateField HeaderText = "d_18" SortExpression = "d_01" > 
                <ItemTemplate >
       <asp:TextBox ID="TextBox29" runat="server" ></asp:TextBox>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_37"/>
                </asp:TemplateField>

                
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="tabela_1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:wap %>" 
        
        SelectCommand="SELECT ROW_NUMBER() OVER( ORDER BY ident ) AS id, ident, imie, nazwisko, funkcja, stanowisko, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15, d_16, d_17, d_18, d_19, d_20, d_21, d_22, d_23, d_24, d_25, d_26, d_27, d_28,d_29, d_30, d_31, sesja, id_sedziego, id_dzialu, id_tabeli FROM tbl_statystyki_tbl_02 WHERE (id_tabeli = 1) AND (id_dzialu = @id_dzialu) ORDER BY id">
        <SelectParameters>
            <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
        </SelectParameters>
    </asp:SqlDataSource>
     <br />
       </div>
    <div id="wyznaczenia"  class="page-break"> 
        <asp:Label ID="lbTabela2Title" runat="server"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="infoLabel3" runat="server" Text="Tabela 3 \/" Visible="False"></asp:Label>
    <asp:GridView ID="Gridview2" runat="server" AutoGenerateColumns="False" DataSourceID = "tabela_2"  Width = "100%" ShowHeader = "False" ShowFooter = "True" OnRowCreated="Gridview2_RowCreated" OnRowDataBound="Gridview2_RowDataBound"  >
        <Columns>
    <asp:BoundField DataField = "id" HeaderText = "L.p." SortExpression = "id" >
                <ItemStyle Width = "15px" />
                  </asp:BoundField >
                        <asp:TemplateField HeaderText = "imie" SortExpression = "imie" >
                                          <ItemTemplate >
                                              <asp:Label ID = "Label1" runat = "server" Text = '<%# Eval("nazwisko") %>' ></asp:Label >
                                           <asp:Label ID = "Label2"  runat = "server" Text = '<%# Bind("imie") %>' ></asp:Label >
                                                            </ItemTemplate >
                                                            <ItemStyle  CssClass = "t2_nazwisko" />
                                                        </asp:TemplateField >
<asp:TemplateField HeaderText = "d_01" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')" ><asp:Label ID = "Label_Gridview2101" runat = "server" Text = '<%# Eval("d_01")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_37"/>
                </asp:TemplateField>
<asp:TemplateField HeaderText = "d_02" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')" ><asp:Label ID = "Label_Gridview2102" runat = "server" Text = '<%# Eval("d_02")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_37"/>
                </asp:TemplateField>
<asp:TemplateField HeaderText = "d_03" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')" ><asp:Label ID = "Label_Gridview2103" runat = "server" Text = '<%# Eval("d_03")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_37"/>
                </asp:TemplateField>
<asp:TemplateField HeaderText = "d_04" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')" ><asp:Label ID = "Label_Gridview2104" runat = "server" Text = '<%# Eval("d_04")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_37"/>
                </asp:TemplateField>
<asp:TemplateField HeaderText = "d_05" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')" ><asp:Label ID = "Label_Gridview2105" runat = "server" Text = '<%# Eval("d_05")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_37"/>
                </asp:TemplateField>
<asp:TemplateField HeaderText = "d_06" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')" ><asp:Label ID = "Label_Gridview2106" runat = "server" Text = '<%# Eval("d_06")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_37"/>
                </asp:TemplateField>
<asp:TemplateField HeaderText = "d_07" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')" ><asp:Label ID = "Label_Gridview2107" runat = "server" Text = '<%# Eval("d_07")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_37"/>
                </asp:TemplateField>
<asp:TemplateField HeaderText = "d_08" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')" ><asp:Label ID = "Label_Gridview2108" runat = "server" Text = '<%# Eval("d_08")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_37"/>
                </asp:TemplateField>
            <asp:TemplateField HeaderText = "d_08" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')" ><asp:Label ID = "Label_Gridview2109" runat = "server" Text = '<%# Eval("d_09")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_37"/>
                </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="tabela_2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:wap %>" 
        
        SelectCommand="SELECT ROW_NUMBER() OVER( ORDER BY ident ) AS id,  ident, imie, nazwisko, funkcja, stanowisko, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15, d_16, d_17, d_18, d_19, d_20, d_21, d_22,d_23, d_24,d_24,d_25,d_26,d_27,d_28,d_29,d_30, sesja, id_sedziego, id_dzialu, id_tabeli FROM tbl_statystyki_tbl_02 WHERE (id_tabeli = 3) AND (id_dzialu = @id_dzialu) ORDER BY id">
        <SelectParameters>
            <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
        </SelectParameters>
    </asp:SqlDataSource>
        <br />
        </div>
    
    <br />

    <div id="debag" >
          <br />
     <br />
        Raport statystyczny 
                     <asp:Label ID="Label27" runat="server"></asp:Label>
                &nbsp;Sporzadzone dn.
            <asp:Label ID="Label29" runat="server"></asp:Label>
&nbsp;<np. 21 czerwca 2015>przez
            <asp:Label ID="Label28" runat="server"></asp:Label>
&nbsp;<asp:Label ID="Label30" runat="server"></asp:Label>
        <br />

        <asp:Label ID="Label11" runat="server"></asp:Label>
   
          </div>
    
 
    <br />
       
  </div>

    
</asp:Content>


