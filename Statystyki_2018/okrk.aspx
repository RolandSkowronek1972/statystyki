﻿<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="okrk.aspx.cs" Inherits="stat2018.okrk" %>

<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.13.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

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

                <dx:ASPxDateEdit ID="Date1" runat="server" Theme="Moderno">
                </dx:ASPxDateEdit>
              


            </td>
            <td style="width:auto;padding-left:5px;">
               
                       <dx:ASPxDateEdit ID="Date2" runat="server" Theme="Moderno">
                </dx:ASPxDateEdit></td>
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
    


    <asp:Label ID="tabela1Label" runat="server"></asp:Label>
       &nbsp;&nbsp;&nbsp;&nbsp;
       <asp:Label ID="infoLabel2" runat="server" Text="Tabela 1\/" Visible="False"></asp:Label>
       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCreated="GridView1_RowCreated" 
        Width="1150px" ShowHeader="False" OnRowDataBound="GridView1_RowDataBound">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
            <ItemStyle  CssClass="col_25" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="imie" SortExpression="imie">
               
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Eval("funkcja") %>'></asp:Label>
                   
                </ItemTemplate>
                <ItemStyle  CssClass="col_130" />
            </asp:TemplateField>
                <asp:TemplateField HeaderText="imie" SortExpression="imie">
               
                <ItemTemplate>
                    <asp:Label ID="lbNazwisko" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label><br />
                    &nbsp;<asp:Label ID="lbImie" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                 </ItemTemplate>
                <ItemStyle  CssClass="col_130" />
            </asp:TemplateField>
                 <asp:TemplateField HeaderText="d_02" SortExpression="d_02">
               
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')"><asp:Label ID="Label201" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label> </a>
    
                 </ItemTemplate>
                  <ItemStyle  CssClass="col_45" />
            </asp:TemplateField>
            
                 <asp:TemplateField HeaderText="d_02" SortExpression="d_02">
               
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')"><asp:Label ID="Label202" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label> </a>
    
                 </ItemTemplate>
                  <ItemStyle  CssClass="col_40" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_03" SortExpression="d_03">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')"><asp:Label ID="Label203" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label> </a>
    
                </ItemTemplate>
                  <ItemStyle  CssClass="col_40" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
              
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')"><asp:Label ID="Label204" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label> </a>
             
                </ItemTemplate>
                  <ItemStyle  CssClass="col_40" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
               
                <ItemTemplate>
                 <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')"><asp:Label ID="Label205" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_40" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')"><asp:Label ID="Label206" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_40" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')"><asp:Label ID="Label207" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_40" />
            </asp:TemplateField>
        
            <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')"><asp:Label ID="Label208" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label> </a>    
                </ItemTemplate>
                  <ItemStyle  CssClass="col_40" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')"><asp:Label ID="Label209" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_40" />
            </asp:TemplateField>
        
               <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                  <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')"><asp:Label ID="Label210" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_40" />
            </asp:TemplateField>

               <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!2"%>')"><asp:Label ID="Label211" runat="server" Text='<%# Eval("d_11")%>' CssClass="normal"></asp:Label> </a>    
                </ItemTemplate>
                  <ItemStyle  CssClass="col_40" />
            </asp:TemplateField>

               <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!2"%>')"><asp:Label ID="Label212" runat="server" Text='<%# Eval("d_12")%>' CssClass="normal"></asp:Label> </a> 
          
                      
                </ItemTemplate>
                  <ItemStyle  CssClass="col_40" />
            </asp:TemplateField>
          
               <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!13!2"%>')"><asp:Label ID="Label213" runat="server" Text='<%# Eval("d_13")%>' CssClass="normal"></asp:Label> </a> 
          
                      
                </ItemTemplate>
                  <ItemStyle  CssClass="col_40" />
            </asp:TemplateField>
          
               <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!14!2"%>')"><asp:Label ID="Label214" runat="server" Text='<%# Eval("d_14")%>' CssClass="normal"></asp:Label> </a> 
          
                      
                </ItemTemplate>
                  <ItemStyle  CssClass="col_40" />
            </asp:TemplateField>
          
               <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!15!2"%>')"><asp:Label ID="Label215" runat="server" Text='<%# Eval("d_15")%>' CssClass="normal"></asp:Label> </a> 
          
                      
                </ItemTemplate>
                  <ItemStyle  CssClass="col_40" />
            </asp:TemplateField>
            
               <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!16!2"%>')"><asp:Label ID="Label216" runat="server" Text='<%# Eval("d_16")%>' CssClass="normal"></asp:Label> </a> 
          
                      
                </ItemTemplate>
                  <ItemStyle  CssClass="col_40" />
            </asp:TemplateField>
            
               <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!17!2"%>')"><asp:Label ID="Label217" runat="server" Text='<%# Eval("d_17")%>' CssClass="normal"></asp:Label> </a> 
          
                      
                </ItemTemplate>
                  <ItemStyle  CssClass="col_40" />
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!18!2"%>')"><asp:Label ID="Label218" runat="server" Text='<%# Eval("d_18")%>' CssClass="normal"></asp:Label> </a> 
          
                      
                </ItemTemplate>
                  <ItemStyle  CssClass="col_40" />
            </asp:TemplateField>
            
            
             <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!19!2"%>')"><asp:Label ID="Label219" runat="server" Text='<%# Eval("d_19")%>' CssClass="normal"></asp:Label> </a> 
          
                      
                </ItemTemplate>
                  <ItemStyle  CssClass="col_40"/>
            </asp:TemplateField>
            
             
        </Columns>
           <FooterStyle Font-Bold="True" HorizontalAlign="Center" Wrap="False" />
           <HeaderStyle Wrap="False" />
           <RowStyle Wrap="False" />
    </asp:GridView>
       <br />
       </div>
    <div id="wyznaczenia"  class="page-break"> 
        <asp:Label ID="tabela3Label" runat="server"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="infoLabel3" runat="server" Text="Tabela 3 \/" Visible="False"></asp:Label>
    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" onrowcreated="GridView3_RowCreated" Width="100%" ShowHeader="False" OnRowDataBound="GridView3_RowDataBound" ShowFooter="True">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
            <ItemStyle Width="15px" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="nazwisko" SortExpression="nazwisko">
               
                <ItemTemplate>
                    <asp:Label ID="lbStanowosko" runat="server" Text='<%# Eval("stanowisko") %>'></asp:Label>
                   
                </ItemTemplate>
                <ItemStyle cssclass="t3_nazwisko" />
            </asp:TemplateField>
         
            
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
                <ItemStyle  CssClass="col_46" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_02" SortExpression="d_02">
               
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')"><asp:Label ID="Label302" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label> </a>
    
                 </ItemTemplate>
                  <ItemStyle  CssClass="col_46" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_03" SortExpression="d_03">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')"><asp:Label ID="Label303" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label> </a>
    
                </ItemTemplate>
                  <ItemStyle  CssClass="col_46" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
              
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')"><asp:Label ID="Label304" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label> </a>
             
                </ItemTemplate>
                  <ItemStyle  CssClass="col_46" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
               
                <ItemTemplate>
                 <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')"><asp:Label ID="Label305" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_46" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')"><asp:Label ID="Label306" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_46" />
            </asp:TemplateField>
               <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')"><asp:Label ID="Label307" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_46" />
            </asp:TemplateField>

       <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')"><asp:Label ID="Label308" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_46" />
            </asp:TemplateField>

               <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')"><asp:Label ID="Label309" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_46" />
            </asp:TemplateField>
               <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')"><asp:Label ID="Label310" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_46" />
            </asp:TemplateField>

                       <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
               
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!2"%>')"><asp:Label ID="Label311" runat="server" Text='<%# Eval("d_11")%>' CssClass="normal"></asp:Label> </a>
    
                     
                </ItemTemplate>
                <ItemStyle  CssClass="col_46" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_02" SortExpression="d_02">
               
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!2"%>')"><asp:Label ID="Label312" runat="server" Text='<%# Eval("d_12")%>' CssClass="normal"></asp:Label> </a>
    
                 </ItemTemplate>
                  <ItemStyle  CssClass="col_46" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_03" SortExpression="d_03">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!13!2"%>')"><asp:Label ID="Label313" runat="server" Text='<%# Eval("d_13")%>' CssClass="normal"></asp:Label> </a>
    
                </ItemTemplate>
                  <ItemStyle  CssClass="col_46" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
              
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!14!2"%>')"><asp:Label ID="Label314" runat="server" Text='<%# Eval("d_14")%>' CssClass="normal"></asp:Label> </a>
             
                </ItemTemplate>
                  <ItemStyle  CssClass="col_46" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
               
                <ItemTemplate>
                 <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!15!2"%>')"><asp:Label ID="Label315" runat="server" Text='<%# Eval("d_15")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_46" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!16!2"%>')"><asp:Label ID="Label316" runat="server" Text='<%# Eval("d_16")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_46" />
            </asp:TemplateField>
               <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!17!2"%>')"><asp:Label ID="Label317" runat="server" Text='<%# Eval("d_17")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_46" />
            </asp:TemplateField>

       <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!18!2"%>')"><asp:Label ID="Label318" runat="server" Text='<%# Eval("d_18")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_46" />
            </asp:TemplateField>

        </Columns>
        <FooterStyle Font-Bold="True" HorizontalAlign="Center" />
        <RowStyle Height="25px" />
    </asp:GridView>
        <br />
        </div>
    
    <br />
    <div id="Div11"  class="page-break"> 
    &nbsp;<asp:Label ID="Tabela4label" runat="server"></asp:Label>
&nbsp;
    &nbsp;<asp:Label ID="infoLabel5" runat="server" Text="Tabela 4 \/" Visible="False"></asp:Label>
        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" onrowcreated="GridView5_RowCreated" Width="100%" ShowHeader="False" OnRowDataBound="GridView5_RowDataBound" ShowFooter="True">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
            <ItemStyle Width="15px" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="nazwisko" SortExpression="nazwisko">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox28" runat="server" Text='<%# Bind("nazwisko") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label14" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                    &nbsp;<asp:Label ID="Label13" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle cssclass="t4_nazwisko" />
            </asp:TemplateField>
              <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
               
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')"><asp:Label ID="Label401" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label> </a>
    
                     
                </ItemTemplate>
                <ItemStyle  CssClass="col_91" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_02" SortExpression="d_02">
               
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')"><asp:Label ID="Label402" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label> </a>
    
                 </ItemTemplate>
                  <ItemStyle  CssClass="col_91" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_03" SortExpression="d_03">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')"><asp:Label ID="Label403" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label> </a>
    
                </ItemTemplate>
                  <ItemStyle  CssClass="col_91" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
              
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')"><asp:Label ID="Label404" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label> </a>
             
                </ItemTemplate>
                  <ItemStyle  CssClass="col_91" />
            </asp:TemplateField>
        
                <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
              
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')"><asp:Label ID="Label405" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label> </a>
             
                </ItemTemplate>
                  <ItemStyle  CssClass="col_91" />
            </asp:TemplateField>

                 <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
              
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')"><asp:Label ID="Label406" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label> </a>
             
                </ItemTemplate>
                  <ItemStyle  CssClass="col_91" />
            </asp:TemplateField>

                 <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
              
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')"><asp:Label ID="Label407" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label> </a>
             
                </ItemTemplate>
                  <ItemStyle  CssClass="col_91" />
            </asp:TemplateField>

                 <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
              
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')"><asp:Label ID="Label408" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label> </a>
             
                </ItemTemplate>
                  <ItemStyle  CssClass="col_91" />
            </asp:TemplateField>


             <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
              
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')"><asp:Label ID="Label409" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label> </a>
             
                </ItemTemplate>
                  <ItemStyle  CssClass="col_91" />
            </asp:TemplateField>


             <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
              
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')"><asp:Label ID="Label410" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label> </a>
             
                </ItemTemplate>
                  <ItemStyle  CssClass="col_91" />
            </asp:TemplateField>


        </Columns>
            <FooterStyle Font-Bold="True" HorizontalAlign="Center" />
    </asp:GridView>
        <br />
        </div>

        <div id="Div11"  class="page-break"> 
    &nbsp;<asp:Label ID="Label2" runat="server"></asp:Label>
&nbsp;
    &nbsp;<asp:Label ID="Label5" runat="server" Text="Tabela 5 \/" Visible="False"></asp:Label>
        <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" onrowcreated="NaglowekTabeli5" Width="100%" ShowHeader="False" OnRowDataBound="stopkaTabeli5">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
            <ItemStyle Width="15px" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="nazwisko" SortExpression="nazwisko">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox28" runat="server" Text='<%# Bind("nazwisko") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label14" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                    &nbsp;<asp:Label ID="Label13" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle cssclass="t4_nazwisko" />
            </asp:TemplateField>
              <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
               
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')"><asp:Label ID="Label401" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label> </a>
    
                     
                </ItemTemplate>
                <ItemStyle  CssClass="col_91" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_02" SortExpression="d_02">
               
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')"><asp:Label ID="Label402" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label> </a>
    
                 </ItemTemplate>
                  <ItemStyle  CssClass="col_91" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_03" SortExpression="d_03">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')"><asp:Label ID="Label403" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label> </a>
    
                </ItemTemplate>
                  <ItemStyle  CssClass="col_91" />
            </asp:TemplateField>
                  <asp:TemplateField HeaderText="d_11" SortExpression="d_11">
                
                <ItemTemplate>
                    <asp:TextBox ID="TextBox36" runat="server" Text='<%# Bind("d_04") %>' Width="73px" CssClass="t2_d3"></asp:TextBox>
                                                </ItemTemplate>
                  <ItemStyle  CssClass="t2_d3" />
            </asp:TemplateField>
        <asp:TemplateField HeaderText="d_11" SortExpression="d_11">
                
                <ItemTemplate>
                    <asp:TextBox ID="TextBox02" runat="server" Text='<%# Bind("d_05") %>' Width="73px" CssClass="t2_d3"></asp:TextBox>
                                                </ItemTemplate>
                  <ItemStyle  CssClass="t2_d3" />
            </asp:TemplateField>
                       <asp:TemplateField HeaderText="d_11" SortExpression="d_11">
                
                <ItemTemplate>
                    <asp:TextBox ID="TextBox03" runat="server" Text='<%# Bind("d_06") %>' Width="73px" CssClass="t2_d3"></asp:TextBox>
                                                </ItemTemplate>
                  <ItemStyle  CssClass="t2_d3" />
            </asp:TemplateField>
           


        </Columns>
            <FooterStyle Font-Bold="True" HorizontalAlign="Center" />
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
    
 
    <br />
       
  </div>

    
</asp:Content>

