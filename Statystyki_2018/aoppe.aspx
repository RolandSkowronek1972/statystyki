﻿<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="aoppe.aspx.cs" Inherits="stat2018.aoppe" %>

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
                  margin: 0mm 0mm 0mm 0mm;
                 /*  break-after:always; change the margins as you want them to be. */
               /*   transform: translate(-30mm,-30mm) ; 
                -webkit-transform: translate(-30mm,-30mm)  ;
                -moz-transform: translate(-30mm,-30mm)  */
              }

              div {
                  transform: translate(0, 0);
                  -webkit-transform: translate(0, 0 ); /* Saf3.1+, Chrome */
                  -moz-transform: translate(0, 0); /* FF3.5+ */
                
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
                 <asp:LinkButton ID="LinkButton57" runat="server" CssClass="ax_box" OnClick="tworzPlikExcell">Zapisz do Excel</asp:LinkButton>
            </td>
        </tr>
    
    </table>
      </div>
       <div  margin: 0 auto 0 auto; position:relative;top:30px;" >
             <div style="margin-left:auto;margin-right:auto;text-align: center; width:auto; "> 
            <asp:Label ID="LabelNazwaSadu" runat="server" Text="Sąd " style="font-weight: 700"></asp:Label>
     <br />
         </div> 
  
           <br />
               <div >
&nbsp;<asp:Label ID="Label1" runat="server" Text="Uzasadnienia"></asp:Label>
           &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel1" runat="server" Text="tabela  1" Visible="False"></asp:Label>
           <br />
        
<asp:GridView ID="gwTabela1" runat="server" OnRowCreated="naglowekTabeli_gwTabela1"  AutoGenerateColumns="False"  OnRowDataBound="stopkaTabeli_gwTabela1"  Width = "100%" ShowHeader = "False" ShowFooter = "True"  >
    

       <Columns>
    <asp:BoundField DataField = "id" HeaderText = "L.p." SortExpression = "id" >
                <ItemStyle Width = "15px" />
                  </asp:BoundField >
                        <asp:TemplateField HeaderText = "imie" SortExpression = "imie" >
                                          <ItemTemplate >
                                              <asp:Label ID = "Label2" runat = "server" Text = '<%# Eval("nazwisko") %>' ></asp:Label >
                                           <asp:Label ID = "Label3"  runat = "server" Text = '<%# Bind("imie") %>' ></asp:Label >
                                                            </ItemTemplate >
                                                            <ItemStyle  CssClass = "col_160Fest" />
                                                        </asp:TemplateField >
       <asp:TemplateField HeaderText = "d_01" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!6"%>')" ><asp:Label ID = "Label_gw1101" runat = "server" Text = '<%# Eval("d_01")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80_fest_fest"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_02" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!6"%>')" ><asp:Label ID = "Label_gw1102" runat = "server" Text = '<%# Eval("d_02")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80_fest_fest"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_03" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!6"%>')" ><asp:Label ID = "Label_gw1103" runat = "server" Text = '<%# Eval("d_03")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80_fest_fest"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_04" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!6"%>')" ><asp:Label ID = "Label_gw1104" runat = "server" Text = '<%# Eval("d_04")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80_fest_fest"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_05" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!6"%>')" ><asp:Label ID = "Label_gw1105" runat = "server" Text = '<%# Eval("d_05")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80_fest_fest"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_06" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!6"%>')" ><asp:Label ID = "Label_gw1106" runat = "server" Text = '<%# Eval("d_06")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80_fest_fest"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_07" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!6"%>')" ><asp:Label ID = "Label_gw1107" runat = "server" Text = '<%# Eval("d_07")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80_fest_fest"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_08" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!6"%>')" ><asp:Label ID = "Label_gw1108" runat = "server" Text = '<%# Eval("d_08")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80_fest_fest"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_09" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!6"%>')" ><asp:Label ID = "Label_gw1109" runat = "server" Text = '<%# Eval("d_09")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80_fest_fest"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_10" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!6"%>')" ><asp:Label ID = "Label_gw1110" runat = "server" Text = '<%# Eval("d_10")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80_fest_fest"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_11" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!6"%>')" ><asp:Label ID = "Label_gw1111" runat = "server" Text = '<%# Eval("d_11")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80_fest_fest"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_12" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!6"%>')" ><asp:Label ID = "Label_gw1112" runat = "server" Text = '<%# Eval("d_12")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80_fest_fest"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_13" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!13!6"%>')" ><asp:Label ID = "Label_gw1113" runat = "server" Text = '<%# Eval("d_13")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80_fest_fest"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_14" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!14!6"%>')" ><asp:Label ID = "Label_gw1114" runat = "server" Text = '<%# Eval("d_14")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80_fest_fest"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_15" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!15!6"%>')" ><asp:Label ID = "Label_gw1115" runat = "server" Text = '<%# Eval("d_15")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80_fest_fest"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_16" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!16!6"%>')" ><asp:Label ID = "Label_gw1116" runat = "server" Text = '<%# Eval("d_16")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80_fest_fest"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_17" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!17!6"%>')" ><asp:Label ID = "Label_gw1117" runat = "server" Text = '<%# Eval("d_17")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80_fest_fest"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_18" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!18!6"%>')" ><asp:Label ID = "Label_gw1118" runat = "server" Text = '<%# Eval("d_18")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80_fest_fest"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_19" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!19!6"%>')" ><asp:Label ID = "Label_gw1119" runat = "server" Text = '<%# Eval("d_19")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80_fest_fest"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_20" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!20!6"%>')" ><asp:Label ID = "Label_gw1120" runat = "server" Text = '<%# Eval("d_20")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80_fest_fest"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_21" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!21!6"%>')" ><asp:Label ID = "Label_gw1121" runat = "server" Text = '<%# Eval("d_21")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80_fest_fest"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_22" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!22!6"%>')" ><asp:Label ID = "Label_gw1122" runat = "server" Text = '<%# Eval("d_22")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80_fest_fest"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_23" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!23!6"%>')" ><asp:Label ID = "Label_gw1123" runat = "server" Text = '<%# Eval("d_23")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80_fest_fest"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_24" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!24!6"%>')" ><asp:Label ID = "Label_gw1124" runat = "server" Text = '<%# Eval("d_24")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80_fest_fest"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_25" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!25!6"%>')" ><asp:Label ID = "Label_gw1125" runat = "server" Text = '<%# Eval("d_25")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80_fest_fest"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_26" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!26!6"%>')" ><asp:Label ID = "Label_gw1126" runat = "server" Text = '<%# Eval("d_26")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80_fest_fest"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_27" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!27!6"%>')" ><asp:Label ID = "Label_gw1127" runat = "server" Text = '<%# Eval("d_27")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80_fest_fest"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_28" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!28!6"%>')" ><asp:Label ID = "Label_gw1128" runat = "server" Text = '<%# Eval("d_28")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80_fest_fest"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_29" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!29!6"%>')" ><asp:Label ID = "Label_gw1129" runat = "server" Text = '<%# Eval("d_29")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80_fest_fest"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_30" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!30!6"%>')" ><asp:Label ID = "Label_gw1130" runat = "server" Text = '<%# Eval("d_30")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80_fest_fest"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_31" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!31!6"%>')" ><asp:Label ID = "Label_gw1131" runat = "server" Text = '<%# Eval("d_31")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80_fest_fest"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_32" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!32!6"%>')" ><asp:Label ID = "Label_gw1132" runat = "server" Text = '<%# Eval("d_32")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80_fest_fest"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_33" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!33!6"%>')" ><asp:Label ID = "Label_gw1133" runat = "server" Text = '<%# Eval("d_33")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80_fest_fest"/>
                </asp:TemplateField>
       <asp:TemplateField HeaderText = "d_34" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!34!6"%>')" ><asp:Label ID = "Label_gw1134" runat = "server" Text = '<%# Eval("d_34")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80_fest_fest"/>
                </asp:TemplateField>
      
       <asp:TemplateField HeaderText = "d_34" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!35!6"%>')" ><asp:Label ID = "Label_gw1135" runat = "server" Text = '<%# Eval("d_35")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80_fest_fest"/>
                </asp:TemplateField>

       <asp:TemplateField HeaderText = "d_34" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!36!6"%>')" ><asp:Label ID = "Label_gw1136" runat = "server" Text = '<%# Eval("d_36")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80_fest_fest"/>
                </asp:TemplateField>

       <asp:TemplateField HeaderText = "d_34" SortExpression = "d_01" > 
                <ItemTemplate >
          <a href = "javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!37!6"%>')" ><asp:Label ID = "Label_gw1137" runat = "server" Text = '<%# Eval("d_35")%>' CssClass = "normal" ></asp:Label> </a>
                                   </ItemTemplate>
                   <ItemStyle  CssClass = "col_80_fest_fest"/>
                </asp:TemplateField>
    

        </Columns>

       <FooterStyle CssClass="gray" />

    </asp:GridView>

                   <br />
    
               </div>
           <br />
         
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
