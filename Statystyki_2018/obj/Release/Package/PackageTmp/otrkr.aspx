﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="otrkr.aspx.cs" Inherits="stat2018.otrkr" MaintainScrollPositionOnPostback="true" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script src="Scripts/rls.js"></script>
     <div class="dataBar"> 
    <div class="noprint" >
      <div  class="manu_back">
              <ajaxtoolkit:toolkitscriptmanager runat="Server" EnableScriptGlobalization="true"
        EnableScriptLocalization="true" ID="ScriptManager1" />     
   <table class="tbl_manu">

        <tr>
            <td style="width:350px;">
                <asp:Label ID="Label4" runat="server" Text="Proszę wybrać zakres:"></asp:Label>
                <asp:textbox runat="server" ID="Date1"  ReadOnly="False" EnableViewState="False" ViewStateMode="Enabled" Width="75px"></asp:textbox>     
                <ajaxtoolkit:calendarextender ID="Date1_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="Date1" ViewStateMode="Enabled">
                </ajaxtoolkit:calendarextender>

                      <asp:TextBox runat="server" ID="Date2" ReadOnly="False" EnableViewState="False" Width="75px" />
                      
        <ajaxtoolkit:calendarextender ID="Date2ButtonExtender" runat="server" TargetControlID="Date2"   Enabled="True" ViewStateMode="Enabled"      />

            </td>
            <td >
                <asp:LinkButton ID="LinkButton54" runat="server" class="ax_box" OnClick="LinkButton54_Click"> Odśwież</asp:LinkButton>
            </td>
            <td>
                  <asp:LinkButton ID="LinkButton55" runat="server"  class="ax_box" OnClick="LinkButton55_Click" CssClass="ax_box"> Drukuj </asp:LinkButton>
            </td>
            <td>
                
                <asp:LinkButton ID="LinkButton56" runat="server" OnClick="Button1_Click" CssClass="ax_box" Visible="False">DRUKUJ</asp:LinkButton>
            </td>
            <td>
                 <asp:LinkButton ID="LinkButton57" runat="server" CssClass="ax_box" OnClick="Button3_Click">Zapisz do Excel</asp:LinkButton>
            </td>
        </tr>
    
    </table>
    </div>
      </div>
     </div>  
   <div style="width:1150px; margin: 0 auto 0 auto; position:relative;top:60px;" class="content">
    
   <div id="zalatwienia" > 
        <div id="Div2"  style="z-index:10; "> 
 <div style="margin-left:auto;margin-right:auto;text-align: center; width:auto; "> 
     <asp:Label ID="Label3" runat="server" Text="Sąd " style="font-weight: 700"></asp:Label>
     <br />
         </div> 
         

     </div>
       <br />
   <asp:label runat="server" ID="id_dzialu" Visible="False"></asp:label>
       <br />
       &nbsp;<asp:Label ID="Label19" runat="server"></asp:Label>
       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="statystyki" OnRowCreated="grvMergeHeader_RowCreated" 
       
        Width="100%" ShowHeader="False" OnRowDataBound="GridView1_RowDataBound" ShowFooter="True">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
            <ItemStyle Width="15px" HorizontalAlign="Center" />
            </asp:BoundField>
        
        
            <asp:TemplateField HeaderText="imie" SortExpression="imie">
               
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                    &nbsp;<asp:Label ID="Label1" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle  CssClass="t2_nazwisko" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
               
                <ItemTemplate>
                         <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')"><asp:Label ID="Label101" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label> </a>
    
                </ItemTemplate>
                <ItemStyle  CssClass="t1_d7" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_02" SortExpression="d_02">
                
                <ItemTemplate>
               <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')"><asp:Label ID="Label102" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label> </a>
    
                 </ItemTemplate>
                  <ItemStyle  CssClass="t1_d7" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_03" SortExpression="d_03">
                
                <ItemTemplate>
   <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')"><asp:Label ID="Label103" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label> </a>
    
                </ItemTemplate>
                  <ItemStyle  CssClass="t1_d7" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
              
                <ItemTemplate>
                         
                         <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')"><asp:Label ID="Label104" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label> </a>
         </ItemTemplate>
                  <ItemStyle  CssClass="t1_d7" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
               
                <ItemTemplate>
                     <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')"><asp:Label ID="Label105" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label> </a>
    
                             </ItemTemplate>
                  <ItemStyle  CssClass="t1_d7" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
              
                <ItemTemplate>
                                     <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')"><asp:Label ID="Label106" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label> </a>
        
                </ItemTemplate>
                  <ItemStyle  CssClass="t1_d7" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                      <ItemTemplate>
                             <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')"><asp:Label ID="Label107" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label> </a>
     </ItemTemplate>
                  <ItemStyle  CssClass="t1_d7"  />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_08" SortExpression="d_08">
                
                <ItemTemplate>
                       <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')"><asp:Label ID="Label108" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label> </a>
    

                </ItemTemplate>
                  <ItemStyle  CssClass="t1_d7" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_09" SortExpression="d_09">
                
                <ItemTemplate>
                           <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')"><asp:Label ID="Label109" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label> </a>
       
                </ItemTemplate>
                  <ItemStyle  CssClass="t1_d7" BackColor="#CCCCCC" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_10" SortExpression="d_10">
               
                <ItemTemplate>

                     <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')"><asp:Label ID="Label110" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label> </a>
     
                  </ItemTemplate>

                   <ItemStyle CssClass="t1_d7"  />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_11" SortExpression="d_11">
               
                <ItemTemplate >
                                 <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!2"%>')"><asp:Label ID="Label111" runat="server" Text='<%# Eval("d_11")%>' CssClass="normal"></asp:Label> </a>
    
                                                </ItemTemplate>
                  <ItemStyle  CssClass="t1_d7" />
            </asp:TemplateField>
             
            <asp:TemplateField HeaderText="d_12" SortExpression="d_12">
               
                <ItemTemplate >
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!2"%>')"><asp:Label ID="Label112" runat="server" Text='<%# Eval("d_12")%>' CssClass="normal"></asp:Label> </a>
              
                                                </ItemTemplate>
                  <ItemStyle  CssClass="t1_d7" />
            </asp:TemplateField>
             <asp:TemplateField HeaderText="d_13" SortExpression="d_13">
               
                <ItemTemplate >
                                               <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!13!2"%>')"><asp:Label ID="Label113" runat="server" Text='<%# Eval("d_13")%>' CssClass="normal"></asp:Label> </a>
    
                                                </ItemTemplate>
                  <ItemStyle  CssClass="t1_d7" BackColor="#CCCCCC"/>
            </asp:TemplateField>


             <asp:TemplateField HeaderText="d_14" SortExpression="d_14">
               
                <ItemTemplate >
                 <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!14!2"%>')"><asp:Label ID="Label114" runat="server" Text='<%# Eval("d_14")%>' CssClass="normal"></asp:Label> </a>
       
                                                </ItemTemplate>
                  <ItemStyle  CssClass="t1_d7" />
            </asp:TemplateField>

             <asp:TemplateField HeaderText="d_15" SortExpression="d_15">
               
                <ItemTemplate >
                             <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!15!2"%>')"><asp:Label ID="Label115" runat="server" Text='<%# Eval("d_15")%>' CssClass="normal"></asp:Label> </a>
                                     </ItemTemplate>
                  <ItemStyle  CssClass="t1_d7" />
            </asp:TemplateField>

             <asp:TemplateField HeaderText="d_16" SortExpression="d_16">
               
                <ItemTemplate >
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!16!2"%>')"><asp:Label ID="Label116" runat="server" Text='<%# Eval("d_16")%>' CssClass="normal"></asp:Label> </a>
                                          </ItemTemplate>
                  <ItemStyle  CssClass="t1_d7" />
            </asp:TemplateField>

             <asp:TemplateField HeaderText="d_17" SortExpression="d_17">
               
                <ItemTemplate >
                       <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!17!2"%>')"><asp:Label ID="Label117" runat="server" Text='<%# Eval("d_17")%>' CssClass="normal"></asp:Label> </a>
                       
                                                </ItemTemplate>
                  <ItemStyle  CssClass="t1_d7" />
            </asp:TemplateField>

             <asp:TemplateField HeaderText="d_18" SortExpression="d_18">
               
                <ItemTemplate >
                                             <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!18!2"%>')"><asp:Label ID="Label118" runat="server" Text='<%# Eval("d_18")%>' CssClass="normal"></asp:Label> </a>
       
                                                </ItemTemplate>
                  <ItemStyle  CssClass="t1_d7" />
            </asp:TemplateField>

          

        </Columns>
           <FooterStyle BackColor="Silver" HorizontalAlign="Center" />
    </asp:GridView>
    <asp:SqlDataSource ID="statystyki" runat="server" 
        ConnectionString="<%$ ConnectionStrings:wap %>" 
        
        SelectCommand="SELECT ROW_NUMBER() OVER( ORDER BY ident ) AS id, ident, imie, nazwisko, funkcja, stanowisko, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15, d_16, d_17, d_18, d_19, d_20, d_21, d_22, sesja, id_sedziego, id_dzialu, id_tabeli FROM tbl_statystyki_tbl_02 WHERE (id_tabeli = 2) AND (id_dzialu = @id_dzialu) ORDER BY id">
        <SelectParameters>
            <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
       </div>
    <div id="wyznaczenia"  class="page-break"> 
        <br />
        <asp:Label ID="Label17" runat="server"></asp:Label>
    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
        DataSourceID="tabela_3" onrowcreated="GridView3_RowCreated" Width="100%" OnRowDataBound="GridView3_RowDataBound" ShowFooter="True" ShowHeader="False">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
            <ItemStyle Width="15px" HorizontalAlign="Center" />
            </asp:BoundField>
           
         
            <asp:TemplateField HeaderText="nazwisko" SortExpression="nazwisko">
               
                <ItemTemplate>
                    <asp:Label ID="Label12" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                    &nbsp;<asp:Label ID="Label1" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle cssclass="t3_nazwisko" />
            </asp:TemplateField>
                <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
               
                <ItemTemplate>
                         <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')"><asp:Label ID="Label201" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label> </a>
    
                </ItemTemplate>
                <ItemStyle  CssClass="col_123" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_02" SortExpression="d_02">
                
                <ItemTemplate>
               <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')"><asp:Label ID="Label202" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label> </a>
    
                 </ItemTemplate>
                  <ItemStyle  CssClass="col_123" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_03" SortExpression="d_03">
                
                <ItemTemplate>
   <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')"><asp:Label ID="Label203" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label> </a>
    
                </ItemTemplate>
                  <ItemStyle  CssClass="col_123" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
              
                <ItemTemplate>
                         
                         <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')"><asp:Label ID="Label204" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label> </a>
         </ItemTemplate>
                  <ItemStyle  CssClass="col_123" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
               
                <ItemTemplate>
                     <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')"><asp:Label ID="Label205" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label> </a>
    
                             </ItemTemplate>
                  <ItemStyle  CssClass="col_123" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
              
                <ItemTemplate>
                                     <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')"><asp:Label ID="Label206" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label> </a>
        
                </ItemTemplate>
                  <ItemStyle  CssClass="col_123" />
            </asp:TemplateField>
         </Columns>
        <FooterStyle BackColor="Silver" HorizontalAlign="Center" />
        <RowStyle Height="25px" />
    </asp:GridView>
    <asp:SqlDataSource ID="tabela_3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:wap %>" 
        
        SelectCommand="SELECT ROW_NUMBER() OVER( ORDER BY ident ) AS id,  ident, imie, nazwisko, funkcja, stanowisko, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15, d_16, d_17, d_18, d_19, d_20, d_21, d_22, sesja, id_sedziego, id_dzialu, id_tabeli FROM tbl_statystyki_tbl_02 WHERE (id_tabeli = 3) AND (id_dzialu = @id_dzialu) ORDER BY id">
        <SelectParameters>
            <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
        </SelectParameters>
    </asp:SqlDataSource>
        </div>
    <div id="wyznaczenia2"  class="page-break"> 
        <br />
        <asp:Label ID="Label2" runat="server"></asp:Label>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
        DataSourceID="tabela4" onrowcreated="GridView2_RowCreated" Width="100%" OnRowDataBound="GridView2_RowDataBound" ShowFooter="True" ShowHeader="False">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
            <ItemStyle Width="15px" HorizontalAlign="Center" />
            </asp:BoundField>
           
         
            <asp:TemplateField HeaderText="nazwisko" SortExpression="nazwisko">
               
                <ItemTemplate>
                    <asp:Label ID="Label12" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                    &nbsp;<asp:Label ID="Label1" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle cssclass="t3_nazwisko" />
            </asp:TemplateField>
           <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
               
                <ItemTemplate>
                         <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')"><asp:Label ID="Label301" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label> </a>
    
                </ItemTemplate>
                <ItemStyle  CssClass="col_123" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_02" SortExpression="d_02">
                
                <ItemTemplate>
               <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')"><asp:Label ID="Label302" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label> </a>
    
                 </ItemTemplate>
                  <ItemStyle  CssClass="col_123" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_03" SortExpression="d_03">
                
                <ItemTemplate>
   <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')"><asp:Label ID="Label303" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label> </a>
    
                </ItemTemplate>
                  <ItemStyle  CssClass="col_123" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
              
                <ItemTemplate>
                         
                         <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')"><asp:Label ID="Label304" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label> </a>
         </ItemTemplate>
                  <ItemStyle  CssClass="col_123" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
               
                <ItemTemplate>
                     <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')"><asp:Label ID="Label305" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label> </a>
    
                             </ItemTemplate>
                  <ItemStyle  CssClass="col_123" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
              
                <ItemTemplate>
                                     <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')"><asp:Label ID="Label306" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label> </a>
        
                </ItemTemplate>
                  <ItemStyle  CssClass="col_123" />
            </asp:TemplateField>
         </Columns>
        <FooterStyle BackColor="Silver" HorizontalAlign="Center" />
        <RowStyle Height="25px" />
    </asp:GridView>
    <asp:SqlDataSource ID="tabela4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:wap %>" 
        
        SelectCommand="SELECT ROW_NUMBER() OVER( ORDER BY ident ) AS id,  ident, imie, nazwisko, funkcja, stanowisko, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15, d_16, d_17, d_18, d_19,  sesja, id_sedziego, id_dzialu, id_tabeli FROM tbl_statystyki_tbl_02 WHERE (id_tabeli = 4) AND (id_dzialu = @id_dzialu) ORDER BY id">
        <SelectParameters>
            <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
        </SelectParameters>
    </asp:SqlDataSource>
            Raport statystyczny 
                    <asp:Label ID="Label27" runat="server"></asp:Label>
                &nbsp;Sporzadzone dn.
            <asp:Label ID="Label29" runat="server"></asp:Label>
&nbsp;<np. 21 czerwca 2015>przez
            <asp:Label ID="Label28" runat="server"></asp:Label>
&nbsp;<asp:Label ID="Label30" runat="server"></asp:Label>
        <br />
        </div>
    <br />
    <div id="debag" >
          <br />
    <asp:Label ID="Label11" runat="server"></asp:Label>
   
        </div>
    
 
    <br />
       
  </div>

    
</asp:Content>

