﻿<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="oopp_stary.aspx.cs" Inherits="stat2018.oopp_stary" MaintainScrollPositionOnPostback="true"%>

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


            </style>
     
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
    

   
         <div style="margin: 0px 30px 0px 30px; position:relative;top:60px; width:100%;" >
     <div id="Div2"  style="z-index:10; "> 
           <div style="margin-left:auto;margin-right:auto;text-align: center; width:auto; "> 
     <asp:Label ID="Label3" runat="server" Text="Sąd " style="font-weight: 700"></asp:Label>
     <br />
         </div> 
         <div style="margin-left:auto;margin-right:auto;text-align: center; width:auto; ">  
             <asp:label runat="server" ID="id_dzialu"></asp:label></div> 
  

     </div>
   <div id="zalatwienia"  style="clear:both;"> 
  
    <asp:Label ID="Label19" runat="server"></asp:Label>
       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="statystyki" OnRowCreated="grvMergeHeader_RowCreated" ShowHeader="False"  Width="100%" CssClass="GridView1" ShowFooter="True" OnRowDataBound="GridView1_RowDataBound">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
            <ItemStyle Width="15px" />
            </asp:BoundField>
            <asp:BoundField DataField="funkcja" HeaderText="funkcja" 
                SortExpression="funkcja">
            <ItemStyle  CssClass="t2_funkcja" />
            </asp:BoundField>
            <asp:BoundField DataField="stanowisko" HeaderText="stanowisko" 
                SortExpression="stanowisko">
            <ItemStyle  CssClass="tx_stanowisko" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="imie" SortExpression="imie">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("imie") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                    &nbsp;<asp:Label ID="Label1" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle  CssClass="tx_nazwisko" />
            </asp:TemplateField>
           <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                <ItemTemplate>


                  <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!1!5"%>')"><asp:Label ID="Label1001" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label> </a> 
          
                </ItemTemplate>
                          <ItemStyle CssClass="tx_d1"  BackColor="#cccccc"/>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_02" SortExpression="d_02">
                <ItemTemplate>
                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!2!5"%>')"><asp:Label ID="Label1002" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label> </a> 
                 </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1"   BackColor="#cccccc"/>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_03" SortExpression="d_03">
                <ItemTemplate>
                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!3!5"%>')"><asp:Label ID="Label1003" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label> </a> 
                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" BackColor="#cccccc" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
                
                <ItemTemplate>
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!4!5"%>')"><asp:Label ID="Label1004" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label> </a> 
             
                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" BackColor="#cccccc"/>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
                <ItemTemplate>
                          <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!5!5"%>')"><asp:Label ID="Label1005" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label> </a> 
                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
                <ItemTemplate>
                         <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!6!5"%>')"><asp:Label ID="Label1006" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label> </a> 
                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!7!5"%>')"><asp:Label ID="Label1007" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label> </a> 
                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_08" SortExpression="d_08">
                
                <ItemTemplate>
                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!8!5"%>')"><asp:Label ID="Label1008" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label> </a> 
                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" /> 
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_09" SortExpression="d_09">
                <ItemTemplate>
                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!9!5"%>')"><asp:Label ID="Label1009" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label> </a>  
                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1"  />
            </asp:TemplateField>


            <asp:TemplateField HeaderText="d_10" SortExpression="d_10">
               
                <ItemTemplate>
                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!10!5"%>')"><asp:Label ID="Label1010" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label> </a>  
                </ItemTemplate>
                <ItemStyle CssClass="tx_d1"  />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_11" SortExpression="d_11">
                
                <ItemTemplate >
                   
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!11!5"%>')"><asp:Label ID="Label1011" runat="server" Text='<%# Eval("d_11")%>' CssClass="normal"></asp:Label> </a>  
                            
                                                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1"   />
            </asp:TemplateField>
               <asp:TemplateField HeaderText="d_12" SortExpression="d_12">
                <ItemTemplate >
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!12!5"%>')"><asp:Label ID="Label1012" runat="server" Text='<%# Eval("d_12")%>' CssClass="normal"></asp:Label> </a>  
                </ItemTemplate>
               <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>
              <asp:TemplateField HeaderText="d_13" SortExpression="d_13">
                 <ItemTemplate >
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!13!5"%>')"><asp:Label ID="Label1013" runat="server" Text='<%# Eval("d_13")%>' CssClass="normal"></asp:Label> </a>  
                 </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>
              
              <asp:TemplateField HeaderText="d_15" SortExpression="d_15">
                
                <ItemTemplate >
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!14!5"%>')"><asp:Label ID="Label1014" runat="server" Text='<%# Eval("d_14")%>' CssClass="normal"></asp:Label> </a>  
                            
                                                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>
              <asp:TemplateField HeaderText="d_15" SortExpression="d_15">
                <ItemTemplate >
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!15!5"%>')"><asp:Label ID="Label1015" runat="server" Text='<%# Eval("d_15")%>' CssClass="normal"></asp:Label> </a>  
                                                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>
        
            <asp:TemplateField HeaderText="d_16" SortExpression="d_16"> 
                <ItemTemplate >
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!16!5"%>')"><asp:Label ID="Label1016" runat="server" Text='<%# Eval("d_16")%>' CssClass="normal"></asp:Label> </a>  
                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>

             <asp:TemplateField HeaderText="d_17" SortExpression="d_17"> 
                <ItemTemplate >
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!17!5"%>')"><asp:Label ID="Label1017" runat="server" Text='<%# Eval("d_17")%>' CssClass="normal"></asp:Label> </a>  
                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" BackColor="#cccccc"/>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="d_18" SortExpression="d_18"> 
                <ItemTemplate >
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!18!5"%>')"><asp:Label ID="Label1018" runat="server" Text='<%# Eval("d_18")%>' CssClass="normal"></asp:Label> </a>  
                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" BackColor="#cccccc" />
            </asp:TemplateField>

              <asp:TemplateField HeaderText="d_19" SortExpression="d_19"> 
                <ItemTemplate >
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!19!5"%>')"><asp:Label ID="Label1019" runat="server" Text='<%# Eval("d_19")%>' CssClass="normal"></asp:Label> </a>  
                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>


            <asp:TemplateField HeaderText="d_20" SortExpression="d_20">
               
                <ItemTemplate>
                                   <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!20!5"%>')"><asp:Label ID="Label1020" runat="server" Text='<%# Eval("d_20")%>' CssClass="normal"></asp:Label> </a>  
                </ItemTemplate>
                <ItemStyle CssClass="tx_d1"  />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_21" SortExpression="d_21">
                
                <ItemTemplate >
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!21!5"%>')"><asp:Label ID="Label1021" runat="server" Text='<%# Eval("d_21")%>' CssClass="normal"></asp:Label> </a>  
                            
                                                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>
               <asp:TemplateField HeaderText="d_22" SortExpression="d_22">
                <ItemTemplate >
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!22!5"%>')"><asp:Label ID="Label1022" runat="server" Text='<%# Eval("d_22")%>' CssClass="normal"></asp:Label> </a>  
                </ItemTemplate>
               <ItemStyle  CssClass="tx_d1"  />
            </asp:TemplateField>
              <asp:TemplateField HeaderText="d_23" SortExpression="d_23">
                 <ItemTemplate >
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!23!5"%>')"><asp:Label ID="Label1023" runat="server" Text='<%# Eval("d_23")%>' CssClass="normal"></asp:Label> </a>  
                 </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1"  />
            </asp:TemplateField>
              
              <asp:TemplateField HeaderText="d_24" SortExpression="d_24">
                
                <ItemTemplate >
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!24!5"%>')"><asp:Label ID="Label1024" runat="server" Text='<%# Eval("d_24")%>' CssClass="normal"></asp:Label> </a>  
                            
                                                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1"   />
            </asp:TemplateField>
              <asp:TemplateField HeaderText="d_25" SortExpression="d_25">
                <ItemTemplate >
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!25!5"%>')"><asp:Label ID="Label1025" runat="server" Text='<%# Eval("d_25")%>' CssClass="normal"></asp:Label> </a>  
                            
                                                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1"   />
            </asp:TemplateField>
        
            <asp:TemplateField HeaderText="d_26" SortExpression="d_26"> 
                <ItemTemplate >
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!26!5"%>')"><asp:Label ID="Label1026" runat="server" Text='<%# Eval("d_26")%>' CssClass="normal"></asp:Label> </a>  
                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>

             <asp:TemplateField HeaderText="d_27" SortExpression="d_27"> 
                <ItemTemplate >
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!27!5"%>')"><asp:Label ID="Label1027" runat="server" Text='<%# Eval("d_27")%>' CssClass="normal"></asp:Label> </a>  
                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>

             <asp:TemplateField HeaderText="d_28" SortExpression="d_28"> 
                <ItemTemplate >
                       <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!28!5"%>')"><asp:Label ID="Label1028" runat="server" Text='<%# Eval("d_28")%>' CssClass="normal"></asp:Label> </a>  
                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>

              <asp:TemplateField HeaderText="d_29" SortExpression="d_29"> 
                <ItemTemplate >
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!29!5"%>')"><asp:Label ID="Label1029" runat="server" Text='<%# Eval("d_29")%>' CssClass="normal"></asp:Label> </a>  
                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="d_30" SortExpression="d_30">
                <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!30!5"%>')"><asp:Label ID="Label1030" runat="server" Text='<%# Eval("d_30")%>' CssClass="normal"></asp:Label> </a>  
                </ItemTemplate>
                <ItemStyle CssClass="tx_d1"  />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_31" SortExpression="d_31">
                
                <ItemTemplate >
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!31!5"%>')"><asp:Label ID="Label1031" runat="server" Text='<%# Eval("d_31")%>' CssClass="normal"></asp:Label> </a>  
                            
                                                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>
               <asp:TemplateField HeaderText="d_32" SortExpression="d_32">
                <ItemTemplate >
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!32!5"%>')"><asp:Label ID="Label1032" runat="server" Text='<%# Eval("d_32")%>' CssClass="normal"></asp:Label> </a>  
                </ItemTemplate>
               <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>
              <asp:TemplateField HeaderText="d_33" SortExpression="d_33">
                 <ItemTemplate >
                              <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!33!5"%>')"><asp:Label ID="Label1033" runat="server" Text='<%# Eval("d_33")%>' CssClass="normal"></asp:Label> </a>  
                 </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>
              
              <asp:TemplateField HeaderText="d_35" SortExpression="d_35">
                <ItemTemplate >
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!34!5"%>')"><asp:Label ID="Label1034" runat="server" Text='<%# Eval("d_34")%>' CssClass="normal"></asp:Label> </a>  
                                                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>
              <asp:TemplateField HeaderText="d_35" SortExpression="d_35">
                <ItemTemplate >
    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!35!5"%>')"><asp:Label ID="Label1035" runat="server" Text='<%# Eval("d_35")%>' CssClass="normal"></asp:Label> </a>  
                                               </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>
        
            <asp:TemplateField HeaderText="d_36" SortExpression="d_36"> 
                <ItemTemplate >
                               <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!36!5"%>')"><asp:Label ID="Label1036" runat="server" Text='<%# Eval("d_36")%>' CssClass="normal"></asp:Label> </a>  
                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1"  />
            </asp:TemplateField>

             <asp:TemplateField HeaderText="d_37" SortExpression="d_37"> 
                <ItemTemplate >
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!37!5"%>')"><asp:Label ID="Label1037" runat="server" Text='<%# Eval("d_37")%>' CssClass="normal"></asp:Label> </a>  
                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1"    />
            </asp:TemplateField>

             <asp:TemplateField HeaderText="d_38" SortExpression="d_38"> 
                <ItemTemplate >
                              <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!38!5"%>')"><asp:Label ID="Label1038" runat="server" Text='<%# Eval("d_38")%>' CssClass="normal"></asp:Label> </a>  
                 </ItemTemplate>
                      <ItemStyle  CssClass="tx_d1"/>
            </asp:TemplateField>

              <asp:TemplateField HeaderText="d_39" SortExpression="d_39"> 
                <ItemTemplate >
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!39!5"%>')"><asp:Label ID="Label1039" runat="server" Text='<%# Eval("d_39")%>' CssClass="normal"></asp:Label> </a>  
                </ItemTemplate>
                   <ItemStyle  CssClass="tx_d1"  />
            </asp:TemplateField> 

         



                <asp:TemplateField HeaderText="d_30" SortExpression="d_30">
                <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!40!5"%>')"><asp:Label ID="Label1040" runat="server" Text='<%# Eval("d_40")%>' CssClass="normal"></asp:Label> </a>  
                </ItemTemplate>
                <ItemStyle CssClass="tx_d1"  />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_31" SortExpression="d_31">
                
                <ItemTemplate >
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!41!5"%>')"><asp:Label ID="Label1041" runat="server" Text='<%# Eval("d_41")%>' CssClass="normal"></asp:Label> </a>  
                            
                                                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>
               <asp:TemplateField HeaderText="d_32" SortExpression="d_32">
                <ItemTemplate >
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!42!5"%>')"><asp:Label ID="Label1042" runat="server" Text='<%# Eval("d_42")%>' CssClass="normal"></asp:Label> </a>  
                </ItemTemplate>
               <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>
              <asp:TemplateField HeaderText="d_33" SortExpression="d_33">
                 <ItemTemplate >
                              <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!43!5"%>')"><asp:Label ID="Label1043" runat="server" Text='<%# Eval("d_43")%>' CssClass="normal"></asp:Label> </a>  
                 </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1"   />
            </asp:TemplateField>
              
              <asp:TemplateField HeaderText="d_35" SortExpression="d_35">
                <ItemTemplate >
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!44!5"%>')"><asp:Label ID="Label1044" runat="server" Text='<%# Eval("d_44")%>' CssClass="normal"></asp:Label> </a>  
                                                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>
              <asp:TemplateField HeaderText="d_35" SortExpression="d_35">
                <ItemTemplate >
    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!45!5"%>')"><asp:Label ID="Label1045" runat="server" Text='<%# Eval("d_45")%>' CssClass="normal"></asp:Label> </a>  
                                               </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1"   />
            </asp:TemplateField>
        
            <asp:TemplateField HeaderText="d_36" SortExpression="d_36"> 
                <ItemTemplate >
                               <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!46!5"%>')"><asp:Label ID="Label1046" runat="server" Text='<%# Eval("d_46")%>' CssClass="normal"></asp:Label> </a>  
                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1"  />
            </asp:TemplateField>

             <asp:TemplateField HeaderText="d_37" SortExpression="d_37"> 
                <ItemTemplate >
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!47!5"%>')"><asp:Label ID="Label1047" runat="server" Text='<%# Eval("d_47")%>' CssClass="normal"></asp:Label> </a>  
                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>

             <asp:TemplateField HeaderText="d_38" SortExpression="d_38"> 
                <ItemTemplate >
                              <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!48!5"%>')"><asp:Label ID="Label1048" runat="server" Text='<%# Eval("d_48")%>' CssClass="normal"></asp:Label> </a>  
                 </ItemTemplate>
                      <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>

              <asp:TemplateField HeaderText="d_39" SortExpression="d_39"> 
                <ItemTemplate >
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!49!5"%>')"><asp:Label ID="Label1049" runat="server" Text='<%# Eval("d_49")%>' CssClass="normal"></asp:Label> </a>  
                </ItemTemplate>
                   <ItemStyle  CssClass="tx_d1"  />
            </asp:TemplateField> 




            <asp:TemplateField HeaderText="d_50" SortExpression="d_50">
                <ItemTemplate>
                          <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!50!5"%>')"><asp:Label ID="Label1050" runat="server" Text='<%# Eval("d_50")%>' CssClass="normal"></asp:Label> </a>  
           </ItemTemplate>
                <ItemStyle CssClass="tx_d1"  />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_51" SortExpression="d_51">
                
                <ItemTemplate >
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!51!5"%>')"><asp:Label ID="Label1051" runat="server" Text='<%# Eval("d_51")%>' CssClass="normal"></asp:Label> </a>  
                   
                                                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1"   />
            </asp:TemplateField>
               <asp:TemplateField HeaderText="d_52" SortExpression="d_52">
                <ItemTemplate >
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!52!5"%>')"><asp:Label ID="Label1052" runat="server" Text='<%# Eval("d_52")%>' CssClass="normal"></asp:Label> </a>  
               </ItemTemplate>
               <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>
              <asp:TemplateField HeaderText="d_53" SortExpression="d_53">
                 <ItemTemplate >
                           <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!53!5"%>')"><asp:Label ID="Label1053" runat="server" Text='<%# Eval("d_53")%>' CssClass="normal"></asp:Label> </a>  
                 </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>
              
              <asp:TemplateField HeaderText="d_54" SortExpression="d_54">
                
                <ItemTemplate >
                                           <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!54!5"%>')"><asp:Label ID="Label1054" runat="server" Text='<%# Eval("d_54")%>' CssClass="normal"></asp:Label> </a>  
                               
                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>
              <asp:TemplateField HeaderText="d_55" SortExpression="d_55">
                <ItemTemplate >
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!55!5"%>')"><asp:Label ID="Label1055" runat="server" Text='<%# Eval("d_55")%>' CssClass="normal"></asp:Label> </a>  
        
                                                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>
        
            <asp:TemplateField HeaderText="d_56" SortExpression="d_56"> 
                <ItemTemplate >
                                              <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!56!5"%>')"><asp:Label ID="Label1056" runat="server" Text='<%# Eval("d_56")%>' CssClass="normal"></asp:Label> </a>  
      
                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1"  />
            </asp:TemplateField>

             <asp:TemplateField HeaderText="d_57" SortExpression="d_57"> 
                <ItemTemplate >
                   <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!57!5"%>')"><asp:Label ID="Label1057" runat="server" Text='<%# Eval("d_57")%>' CssClass="normal"></asp:Label> </a>  
      
                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>

             <asp:TemplateField HeaderText="d_58" SortExpression="d_58"> 
                <ItemTemplate >
               <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!58!5"%>')"><asp:Label ID="Label1058" runat="server" Text='<%# Eval("d_58")%>' CssClass="normal"></asp:Label> </a>  
      
                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>

              <asp:TemplateField HeaderText="d_59" SortExpression="d_59"> 
                <ItemTemplate >
                               <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!59!5"%>')"><asp:Label ID="Label1059" runat="server" Text='<%# Eval("d_59")%>' CssClass="normal"></asp:Label> </a>  
      
                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>

            

            
            <asp:TemplateField HeaderText="d_50" SortExpression="d_50">
                <ItemTemplate>
                          <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!60!5"%>')"><asp:Label ID="Label1060" runat="server" Text='<%# Eval("d_60")%>' CssClass="normal"></asp:Label> </a>  
           </ItemTemplate>
                <ItemStyle CssClass="tx_d1"  />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_51" SortExpression="d_51">
                
                <ItemTemplate >
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!61!5"%>')"><asp:Label ID="Label1061" runat="server" Text='<%# Eval("d_61")%>' CssClass="normal"></asp:Label> </a>  
                   
                                                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1"  />
            </asp:TemplateField>
               <asp:TemplateField HeaderText="d_52" SortExpression="d_52">
                <ItemTemplate >
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!62!5"%>')"><asp:Label ID="Label1062" runat="server" Text='<%# Eval("d_62")%>' CssClass="normal"></asp:Label> </a>  
               </ItemTemplate>
               <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>
              <asp:TemplateField HeaderText="d_53" SortExpression="d_53">
                 <ItemTemplate >
                           <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!63!5"%>')"><asp:Label ID="Label1063" runat="server" Text='<%# Eval("d_63")%>' CssClass="normal"></asp:Label> </a>  
                 </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" BackColor="#cccccc"/>
            </asp:TemplateField>
              
              <asp:TemplateField HeaderText="d_54" SortExpression="d_54">
                
                <ItemTemplate >
                                           <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!64!5"%>')"><asp:Label ID="Label1064" runat="server" Text='<%# Eval("d_64")%>' CssClass="normal"></asp:Label> </a>  
                               
                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" BackColor="#cccccc"/>
            </asp:TemplateField>
              <asp:TemplateField HeaderText="d_55" SortExpression="d_55">
                <ItemTemplate >
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!65!5"%>')"><asp:Label ID="Label1065" runat="server" Text='<%# Eval("d_65")%>' CssClass="normal"></asp:Label> </a>  
        
                                                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1"  BackColor="#cccccc"/>
            </asp:TemplateField>
        
            <asp:TemplateField HeaderText="d_56" SortExpression="d_56"> 
                <ItemTemplate >
                                              <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!66!5"%>')"><asp:Label ID="Label1066" runat="server" Text='<%# Eval("d_66")%>' CssClass="normal"></asp:Label> </a>  
      
                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" BackColor="#cccccc" />
            </asp:TemplateField>

             <asp:TemplateField HeaderText="d_57" SortExpression="d_57"> 
                <ItemTemplate >
                   <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!67!5"%>')"><asp:Label ID="Label1067" runat="server" Text='<%# Eval("d_67")%>' CssClass="normal"></asp:Label> </a>  
      
                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1"  />
            </asp:TemplateField>

             <asp:TemplateField HeaderText="d_58" SortExpression="d_58"> 
                <ItemTemplate >
               <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!68!5"%>')"><asp:Label ID="Label1068" runat="server" Text='<%# Eval("d_68")%>' CssClass="normal"></asp:Label> </a>  
      
                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>

              <asp:TemplateField HeaderText="d_59" SortExpression="d_59"> 
                <ItemTemplate >
                               <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!69!5"%>')"><asp:Label ID="Label1069" runat="server" Text='<%# Eval("d_69")%>' CssClass="normal"></asp:Label> </a>  
      
                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1"  />
            </asp:TemplateField>



                <asp:TemplateField HeaderText="d_50" SortExpression="d_50">
                <ItemTemplate>
                          <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!70!5"%>')"><asp:Label ID="Label1070" runat="server" Text='<%# Eval("d_70")%>' CssClass="normal"></asp:Label> </a>  
           </ItemTemplate>
                <ItemStyle CssClass="tx_d1"  />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_51" SortExpression="d_51">
                
                <ItemTemplate >
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!71!5"%>')"><asp:Label ID="Label1071" runat="server" Text='<%# Eval("d_71")%>' CssClass="normal"></asp:Label> </a>  
                   
                                                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1"  />
            </asp:TemplateField>
               <asp:TemplateField HeaderText="d_52" SortExpression="d_52">
                <ItemTemplate >
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!72!5"%>')"><asp:Label ID="Label1072" runat="server" Text='<%# Eval("d_72")%>' CssClass="normal"></asp:Label> </a>  
               </ItemTemplate>
               <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>
              <asp:TemplateField HeaderText="d_53" SortExpression="d_53">
                 <ItemTemplate >
                           <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!73!5"%>')"><asp:Label ID="Label1073" runat="server" Text='<%# Eval("d_73")%>' CssClass="normal"></asp:Label> </a>  
                 </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>
              
              <asp:TemplateField HeaderText="d_54" SortExpression="d_54">
                
                <ItemTemplate >
                                           <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!74!5"%>')"><asp:Label ID="Label1074" runat="server" Text='<%# Eval("d_74")%>' CssClass="normal"></asp:Label> </a>  
                               
                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>
              <asp:TemplateField HeaderText="d_55" SortExpression="d_55">
                <ItemTemplate >
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!75!5"%>')"><asp:Label ID="Label1075" runat="server" Text='<%# Eval("d_75")%>' CssClass="normal"></asp:Label> </a>  
        
                                                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1"  />
            </asp:TemplateField>
        
            <asp:TemplateField HeaderText="d_56" SortExpression="d_56"> 
                <ItemTemplate >
                                              <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!76!5"%>')"><asp:Label ID="Label1076" runat="server" Text='<%# Eval("d_76")%>' CssClass="normal"></asp:Label> </a>  
      
                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1"  />
            </asp:TemplateField>

             <asp:TemplateField HeaderText="d_57" SortExpression="d_57"> 
                <ItemTemplate >
                   <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!77!5"%>')"><asp:Label ID="Label1077" runat="server" Text='<%# Eval("d_77")%>' CssClass="normal"></asp:Label> </a>  
      
                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>

             <asp:TemplateField HeaderText="d_58" SortExpression="d_58"> 
                <ItemTemplate >
               <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!78!5"%>')"><asp:Label ID="Label1078" runat="server" Text='<%# Eval("d_78")%>' CssClass="normal"></asp:Label> </a>  
      
                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>

              <asp:TemplateField HeaderText="d_59" SortExpression="d_59"> 
                <ItemTemplate >
                               <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!79!5"%>')"><asp:Label ID="Label1079" runat="server" Text='<%# Eval("d_79")%>' CssClass="normal"></asp:Label> </a>  
      
                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" BackColor="#cccccc" />
            </asp:TemplateField>


            
                <asp:TemplateField HeaderText="d_50" SortExpression="d_50">
                <ItemTemplate>
                          <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!80!5"%>')"><asp:Label ID="Label1080" runat="server" Text='<%# Eval("d_80")%>' CssClass="normal"></asp:Label> </a>  
           </ItemTemplate>
                <ItemStyle CssClass="tx_d1" BackColor="#cccccc"  />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_51" SortExpression="d_51">
                
                <ItemTemplate >
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!81!5"%>')"><asp:Label ID="Label1081" runat="server" Text='<%# Eval("d_81")%>' CssClass="normal"></asp:Label> </a>  
                   
                                                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1"  />
            </asp:TemplateField>
               <asp:TemplateField HeaderText="d_52" SortExpression="d_52">
                <ItemTemplate >
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!82!5"%>')"><asp:Label ID="Label1082" runat="server" Text='<%# Eval("d_82")%>' CssClass="normal"></asp:Label> </a>  
               </ItemTemplate>
               <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>
              <asp:TemplateField HeaderText="d_53" SortExpression="d_53">
                 <ItemTemplate >
                           <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!83!5"%>')"><asp:Label ID="Label1083" runat="server" Text='<%# Eval("d_83")%>' CssClass="normal"></asp:Label> </a>  
                 </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>
              
              <asp:TemplateField HeaderText="d_54" SortExpression="d_54">
                
                <ItemTemplate >
                                           <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!84!5"%>')"><asp:Label ID="Label1084" runat="server" Text='<%# Eval("d_84")%>' CssClass="normal"></asp:Label> </a>  
                               
                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>
              <asp:TemplateField HeaderText="d_55" SortExpression="d_55">
                <ItemTemplate >
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!85!5"%>')"><asp:Label ID="Label1085" runat="server" Text='<%# Eval("d_85")%>' CssClass="normal"></asp:Label> </a>  
        
                                                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>
        
            <asp:TemplateField HeaderText="d_56" SortExpression="d_56"> 
                <ItemTemplate >
                                              <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!86!5"%>')"><asp:Label ID="Label1086" runat="server" Text='<%# Eval("d_86")%>' CssClass="normal"></asp:Label> </a>  
      
                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1"  />
            </asp:TemplateField>

             <asp:TemplateField HeaderText="d_57" SortExpression="d_57"> 
                <ItemTemplate >
                   <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!87!5"%>')"><asp:Label ID="Label1087" runat="server" Text='<%# Eval("d_87")%>' CssClass="normal"></asp:Label> </a>  
      
                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>

             <asp:TemplateField HeaderText="d_58" SortExpression="d_58"> 
                <ItemTemplate >
               <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!88!5"%>')"><asp:Label ID="Label1088" runat="server" Text='<%# Eval("d_88")%>' CssClass="normal"></asp:Label> </a>  
      
                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>

              <asp:TemplateField HeaderText="d_59" SortExpression="d_59"> 
                <ItemTemplate >
                               <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!89!5"%>')"><asp:Label ID="Label1089" runat="server" Text='<%# Eval("d_89")%>' CssClass="normal"></asp:Label> </a>  
      
                </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>






          
            <asp:TemplateField HeaderText="d_90" SortExpression="d_90">
               
                <ItemTemplate>
                                  <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!90!5"%>')"><asp:Label ID="Label1090" runat="server" Text='<%# Eval("d_90")%>' CssClass="normal"></asp:Label> </a>  
      
                </ItemTemplate>
                <ItemStyle CssClass="tx_d1"   />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_91" SortExpression="d_91">
                <ItemTemplate >
                     <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!91!5"%>')"><asp:Label ID="Label1091" runat="server" Text='<%# Eval("d_91")%>' CssClass="normal"></asp:Label> </a>  
                
              </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1"/>
            </asp:TemplateField>

               <asp:TemplateField HeaderText="d_92" SortExpression="d_92">
                <ItemTemplate >
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!92!5"%>')"><asp:Label ID="Label1092" runat="server" Text='<%# Eval("d_92")%>' CssClass="normal"></asp:Label> </a>  
      
                </ItemTemplate>
               <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>

              <asp:TemplateField HeaderText="d_93" SortExpression="d_93">
                 <ItemTemplate >
                             <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!93!5"%>')"><asp:Label ID="Label1093" runat="server" Text='<%# Eval("d_93")%>' CssClass="normal"></asp:Label> </a>  
      
                 </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>
              
           
             <asp:TemplateField HeaderText="d_94" SortExpression="d_94">
                 <ItemTemplate >
                                               <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!94!5"%>')"><asp:Label ID="Label1094" runat="server" Text='<%# Eval("d_94")%>' CssClass="normal"></asp:Label> </a>  
      
                 </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>

             <asp:TemplateField HeaderText="d_95" SortExpression="d_95">
                 <ItemTemplate >
                   <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!95!5"%>')"><asp:Label ID="Label1095" runat="server" Text='<%# Eval("d_95")%>' CssClass="normal"></asp:Label> </a>  
      
                 </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>
             <asp:TemplateField HeaderText="d_96" SortExpression="d_96">
                 <ItemTemplate >
               <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!96!5"%>')"><asp:Label ID="Label1096" runat="server" Text='<%# Eval("d_96")%>' CssClass="normal"></asp:Label> </a>  
      
                 </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>
              <asp:TemplateField HeaderText="d_97" SortExpression="d_97">
                 <ItemTemplate >
                         <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!97!5"%>')"><asp:Label ID="Label1097" runat="server" Text='<%# Eval("d_97")%>' CssClass="normal"></asp:Label> </a>  
      
                 </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>

              <asp:TemplateField HeaderText="d_98" SortExpression="d_98">
                 <ItemTemplate >
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!98!5"%>')"><asp:Label ID="Label1098" runat="server" Text='<%# Eval("d_98")%>' CssClass="normal"></asp:Label> </a>  
      
                 </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>

              <asp:TemplateField HeaderText="d_99" SortExpression="d_99">
                 <ItemTemplate >
                       <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!99!5"%>')"><asp:Label ID="Label1093" runat="server" Text='<%# Eval("d_99")%>' CssClass="normal"></asp:Label> </a>  
      
                 </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1"  />
            </asp:TemplateField>

              <asp:TemplateField HeaderText="d_100" SortExpression="d_100">
                 <ItemTemplate >
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!100!5"%>')"><asp:Label ID="Label1100" runat="server" Text='<%# Eval("d_100")%>' CssClass="normal"></asp:Label> </a>  
      
                 </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>

              <asp:TemplateField HeaderText="d_101" SortExpression="d_101">
                 <ItemTemplate >
                  <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!101!5"%>')"><asp:Label ID="Label1101" runat="server" Text='<%# Eval("d_101")%>' CssClass="normal"></asp:Label> </a>  
              </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>

              <asp:TemplateField HeaderText="d_102" SortExpression="d_102">
                 <ItemTemplate >
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!102!5"%>')"><asp:Label ID="Label1102" runat="server" Text='<%# Eval("d_102")%>' CssClass="normal"></asp:Label> </a>  
      
                 </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>

              <asp:TemplateField HeaderText="d_103" SortExpression="d_103">
                 <ItemTemplate >
                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!103!5"%>')"><asp:Label ID="Label1103" runat="server" Text='<%# Eval("d_103")%>' CssClass="normal"></asp:Label> </a>  
      
                 </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>

              <asp:TemplateField HeaderText="d_104" SortExpression="d_104">
                 <ItemTemplate >
                                     <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!104!5"%>')"><asp:Label ID="Label1104" runat="server" Text='<%# Eval("d_104")%>' CssClass="normal"></asp:Label> </a>  
      
                 </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>
              <asp:TemplateField HeaderText="d_104" SortExpression="d_104">
                 <ItemTemplate >
                                     <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!105!5"%>')"><asp:Label ID="Label1105" runat="server" Text='<%# Eval("d_105")%>' CssClass="normal"></asp:Label> </a>  
      
                 </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>

                   <asp:TemplateField HeaderText="d_106" SortExpression="d_104">
                 <ItemTemplate >
                                     <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!106!5"%>')"><asp:Label ID="Label1106" runat="server" Text='<%# Eval("d_106")%>' CssClass="normal"></asp:Label> </a>  
      
                 </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_106" SortExpression="d_104">
                 <ItemTemplate >
                                     <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!107!5"%>')"><asp:Label ID="Label1107" runat="server" Text='<%# Eval("d_107")%>' CssClass="normal"></asp:Label> </a>  
      
                 </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>


                    <asp:TemplateField HeaderText="d_106" SortExpression="d_104">
                 <ItemTemplate >
                                     <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!108!5"%>')"><asp:Label ID="Label1108" runat="server" Text='<%# Eval("d_108")%>' CssClass="normal"></asp:Label> </a>  
      
                 </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>


                    <asp:TemplateField HeaderText="d_106" SortExpression="d_104">
                 <ItemTemplate >
                                     <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!109!5"%>')"><asp:Label ID="Label1109" runat="server" Text='<%# Eval("d_109")%>' CssClass="normal"></asp:Label> </a>  
      
                 </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_106" SortExpression="d_104">
                 <ItemTemplate >
                                     <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!110!5"%>')"><asp:Label ID="Label1110" runat="server" Text='<%# Eval("d_110")%>' CssClass="normal"></asp:Label> </a>  
      
                 </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>

                 <asp:TemplateField HeaderText="d_106" SortExpression="d_104">
                 <ItemTemplate >
                                     <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!111!5"%>')"><asp:Label ID="Label1111" runat="server" Text='<%# Eval("d_111")%>' CssClass="normal"></asp:Label> </a>  
      
                 </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>

                 <asp:TemplateField HeaderText="d_106" SortExpression="d_104">
                 <ItemTemplate >
                                     <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!112!5"%>')"><asp:Label ID="Label1112" runat="server" Text='<%# Eval("d_112")%>' CssClass="normal"></asp:Label> </a>  
      
                 </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>

                 <asp:TemplateField HeaderText="d_106" SortExpression="d_104">
                 <ItemTemplate >
                                     <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!113!5"%>')"><asp:Label ID="Label1113" runat="server" Text='<%# Eval("d_113")%>' CssClass="normal"></asp:Label> </a>  
      
                 </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>

                 <asp:TemplateField HeaderText="d_106" SortExpression="d_104">
                 <ItemTemplate >
                                     <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!114!5"%>')"><asp:Label ID="Label1114" runat="server" Text='<%# Eval("d_114")%>' CssClass="normal"></asp:Label> </a>  
      
                 </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>

                 <asp:TemplateField HeaderText="d_106" SortExpression="d_104">
                 <ItemTemplate >
                                     <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!115!5"%>')"><asp:Label ID="Label1115" runat="server" Text='<%# Eval("d_115")%>' CssClass="normal"></asp:Label> </a>  
      
                 </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>

                 <asp:TemplateField HeaderText="d_106" SortExpression="d_104">
                 <ItemTemplate >
                                     <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!116!5"%>')"><asp:Label ID="Label1116" runat="server" Text='<%# Eval("d_116")%>' CssClass="normal"></asp:Label> </a>  
      
                 </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>

                   <asp:TemplateField HeaderText="d_106" SortExpression="d_104">
                 <ItemTemplate >
                                     <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!117!5"%>')"><asp:Label ID="Label1117" runat="server" Text='<%# Eval("d_117")%>' CssClass="normal"></asp:Label> </a>  
      
                 </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>

                   <asp:TemplateField HeaderText="d_106" SortExpression="d_104">
                 <ItemTemplate >
                                     <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!118!5"%>')"><asp:Label ID="Label1118" runat="server" Text='<%# Eval("d_118")%>' CssClass="normal"></asp:Label> </a>  
      
                 </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>

                   <asp:TemplateField HeaderText="d_106" SortExpression="d_104">
                 <ItemTemplate >
                                     <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!119!5"%>')"><asp:Label ID="Label1119" runat="server" Text='<%# Eval("d_119")%>' CssClass="normal"></asp:Label> </a>  
      
                 </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>

                   <asp:TemplateField HeaderText="d_106" SortExpression="d_104">
                 <ItemTemplate >
                                     <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!120!5"%>')"><asp:Label ID="Label1120" runat="server" Text='<%# Eval("d_120")%>' CssClass="normal"></asp:Label> </a>  
      
                 </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>

                   <asp:TemplateField HeaderText="d_106" SortExpression="d_104">
                 <ItemTemplate >
                                     <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!121!5"%>')"><asp:Label ID="Label1121" runat="server" Text='<%# Eval("d_121")%>' CssClass="normal"></asp:Label> </a>  
      
                 </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>

                   <asp:TemplateField HeaderText="d_106" SortExpression="d_104">
                 <ItemTemplate >
                                     <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!122!5"%>')"><asp:Label ID="Label1122" runat="server" Text='<%# Eval("d_122")%>' CssClass="normal"></asp:Label> </a>  
      
                 </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>


                   <asp:TemplateField HeaderText="d_106" SortExpression="d_104">
                 <ItemTemplate >
                                     <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!123!5"%>')"><asp:Label ID="Label1123" runat="server" Text='<%# Eval("d_123")%>' CssClass="normal"></asp:Label> </a>  
      
                 </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>

                   <asp:TemplateField HeaderText="d_106" SortExpression="d_104">
                 <ItemTemplate >
                                     <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!124!5"%>')"><asp:Label ID="Label1124" runat="server" Text='<%# Eval("d_124")%>' CssClass="normal"></asp:Label> </a>  
      
                 </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>


                   <asp:TemplateField HeaderText="d_106" SortExpression="d_104">
                 <ItemTemplate >
                                     <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!125!5"%>')"><asp:Label ID="Label1125" runat="server" Text='<%# Eval("d_125")%>' CssClass="normal"></asp:Label> </a>  
      
                 </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>

                   <asp:TemplateField HeaderText="d_106" SortExpression="d_104">
                 <ItemTemplate >
                                     <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!2!126!5"%>')"><asp:Label ID="Label1126" runat="server" Text='<%# Eval("d_126")%>' CssClass="normal"></asp:Label> </a>  
      
                 </ItemTemplate>
                  <ItemStyle  CssClass="tx_d1" />
            </asp:TemplateField>


        </Columns>
           <FooterStyle HorizontalAlign="Center" />
    </asp:GridView>
    <asp:SqlDataSource ID="statystyki" runat="server" 
        ConnectionString="<%$ ConnectionStrings:wap %>" 
        
        SelectCommand="
	SELECT ROW_NUMBER() OVER( ORDER BY ident ) AS id, 
	 [ident]      ,[imie]      ,[nazwisko]      ,[funkcja]      ,[stanowisko]      ,[id_sedziego]
      ,[d_01]      ,[d_02]      ,[d_03]      ,[d_04]
      ,[d_05]
      ,[d_06]
      ,[d_07]
      ,[d_08]
      ,[d_09]
      ,[d_10]
      ,[d_11]
      ,[d_12]
      ,[d_13]
      ,[d_14]
      ,[d_15]
      ,[d_16]
      ,[d_17]
      ,[d_18]
      ,[d_19]
      ,[d_20]
      ,[d_21]
      ,[d_22]
      ,[d_23]
      ,[d_24]
      ,[d_25]
      ,[d_26]
      ,[d_27]
      ,[d_28]
      ,[d_29]
      ,[d_30]
      ,[d_31]
      ,[d_32]
      ,[d_33]
      ,[d_34]
      ,[d_35]
      ,[d_36]
      ,[d_37]
      ,[d_38]
      ,[d_39]
      ,[d_40]
      ,[d_41]
      ,[d_42]
      ,[d_43]
      ,[d_44]
      ,[d_45]
      ,[d_46]
      ,[d_47]
      ,[d_48]
      ,[d_49]
      ,[d_50]
      ,[d_51]
      ,[d_52]
      ,[d_53]
      ,[d_54]
      ,[d_55]
      ,[d_56]
      ,[d_57]
      ,[d_58]
      ,[d_59]
      ,[d_60]
      ,[d_61]
      ,[d_62]
      ,[d_63]
      ,[d_64]
      ,[d_65]
      ,[d_66]
      ,[d_67]
      ,[d_68]
      ,[d_69]
      ,[d_70]
      ,[d_71]
      ,[d_72]
      ,[d_73]
      ,[d_74]
      ,[d_75]
      ,[d_76]
      ,[d_77]
      ,[d_78]
      ,[d_79]
      ,[d_80]
      ,[d_81]
      ,[d_82]
      ,[d_83]
      ,[d_84]
      ,[d_85]
      ,[d_86]
      ,[d_87]
      ,[d_88]
      ,[d_89]
      ,[d_90]
      ,[d_91]
      ,[d_92]
      ,[d_93]
      ,[d_94]
      ,[d_95]
      ,[d_96]
      ,[d_97]
      ,[d_98]
      ,[d_99]
      ,[d_100]
      ,[d_101]
      ,[d_102]
      ,[d_103]
      ,[d_104]
      ,[d_105]
      ,[d_106]
      ,[d_107]
      ,[d_108]
      ,[d_109] 
      ,[d_110] 
        ,[d_111]
      ,[d_112]
      ,[d_113]
      ,[d_114]
      ,[d_115]
      ,[d_116]
      ,[d_117]
      ,[d_118]
      ,[d_119] 
      ,[d_120] 
        ,[d_121]
      ,[d_122]
      ,[d_123]
      ,[d_124]
      ,[d_125]
      ,[d_126]
      ,[d_127]
      ,[d_128]
      ,[d_129] 
      ,[d_130] 
  FROM tbl_statystyki_tbl_x5
   WHERE (id_dzialu = @id_dzialu) ORDER BY id">
        <SelectParameters>
            <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" DefaultValue="" />
        </SelectParameters>
    </asp:SqlDataSource>
       </div>
    
    <br />
        Raport statystyczny 
                    <asp:Label ID="Label27" runat="server"></asp:Label>
                &nbsp;Sporzadzone dn.
            <asp:Label ID="Label29" runat="server"></asp:Label>&nbsp;przez&nbsp;
&nbsp;&nbsp;
            <asp:Label ID="Label28" runat="server"></asp:Label>
&nbsp;<asp:Label ID="Label30" runat="server"></asp:Label>
             <asp:Panel ID="Panel5" runat="server">
                 <asp:Label ID="Label31" runat="server"></asp:Label>
             </asp:Panel>
        <br />

        <asp:Label ID="Label11" runat="server"></asp:Label>
    
    
       <br />
    
    
  </div>

    <asp:Panel ID="Panel4" runat="server" Visible="False">
        
    </asp:Panel>
</asp:Content>

