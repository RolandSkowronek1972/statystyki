﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ansc.aspx.cs" Inherits="stat2018.ansc"  MaintainScrollPositionOnPostback="true" %>


<%@ Register src="UserControlls/PopupLinkButtom.ascx" tagname="PopupLinkButtom" tagprefix="uc1" %>


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
         <div style="margin-left:auto;margin-right:auto;text-align: center; width:auto; ">  
             <asp:label runat="server" ID="id_dzialu" Visible="False"></asp:label></div> 
  

         <asp:Label ID="Label5" runat="server"></asp:Label>
  

         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="dane_do_tabeli_1" 
        Width="100%" ShowHeader="False" DataKeyNames="opis,d_01,d_02,d_03,d_04,d_05,d_06,d_07,d_08,d_09,d_10,d_11,d_12,d_13,d_14,d_15">
        <Columns>
            <asp:TemplateField HeaderText="opis" SortExpression="opis">
                <ItemTemplate>
                      <ItemStyle  CssClass="t1_opis" />
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("opis") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                <ItemTemplate>
                      <uc1:PopupLinkButtom ID="PopupLinkButtom1" runat="server" info='<%# Eval("d_01")+"#"+Eval("id_")+ "#"+Eval("id_tabeli")+"#1#1" %>' /> 
               </ItemTemplate>
  <ItemStyle  CssClass="col_55" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_02" SortExpression="d_02">
                <ItemTemplate>
                   <uc1:PopupLinkButtom ID="PopupLinkButtom2" runat="server" info='<%# Eval("d_02")+"#"+Eval("id_")+ "#"+Eval("id_tabeli")+"#2#1" %>' /> 
                </ItemTemplate>
            <ItemStyle  CssClass="col_55" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_03" SortExpression="d_03">
                <ItemTemplate>
                        <uc1:PopupLinkButtom ID="PopupLinkButtom3" runat="server" info='<%# Eval("d_03")+"#"+Eval("id_")+ "#"+Eval("id_tabeli") +"#3#1" %>' />  
                </ItemTemplate>
                  <ItemStyle  CssClass="col_55" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
                <ItemTemplate>
                      <uc1:PopupLinkButtom ID="PopupLinkButtom4" runat="server" info='<%# Eval("d_04")+"#"+Eval("id_")+ "#"+Eval("id_tabeli") +"#4#1" %>' /> 
                </ItemTemplate>
                  <ItemStyle  CssClass="col_55" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
                <ItemTemplate>
                    <uc1:PopupLinkButtom ID="PopupLinkButtom5" runat="server" info='<%# Eval("d_05")+"#"+Eval("id_")+ "#"+Eval("id_tabeli") +"#5#1"%>' /> 
                </ItemTemplate>
                <ItemStyle  CssClass="col_55" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
                <ItemTemplate>
                 <uc1:PopupLinkButtom ID="PopupLinkButtom6" runat="server" info='<%# Eval("d_06")+"#"+Eval("id_")+ "#"+Eval("id_tabeli") +"#6#1"%>' />     
                </ItemTemplate>
                <ItemStyle  CssClass="col_55" />
            </asp:TemplateField>
           

            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
                <ItemTemplate>
                        <uc1:PopupLinkButtom ID="PopupLinkButtom7" runat="server" info='<%# Eval("d_07")+"#"+Eval("id_")+ "#"+Eval("id_tabeli") +"#7#1"%>' />     
                </ItemTemplate>
                <ItemStyle  CssClass="col_55" />
            </asp:TemplateField>

                        <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
                <ItemTemplate>
                      <uc1:PopupLinkButtom ID="PopupLinkButtom8" runat="server" info='<%# Eval("d_08")+"#"+Eval("id_")+ "#"+Eval("id_tabeli") +"#8#1"%>' />     
                </ItemTemplate>
                <ItemStyle  CssClass="col_55" />
            </asp:TemplateField>

                        <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
                <ItemTemplate>
                     <uc1:PopupLinkButtom ID="PopupLinkButtom9" runat="server" info='<%# Eval("d_09")+"#"+Eval("id_")+ "#"+Eval("id_tabeli") +"#9#1"%>' />     
                </ItemTemplate>
                <ItemStyle  CssClass="col_55" />
            </asp:TemplateField>

                        <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
                <ItemTemplate>
                     <uc1:PopupLinkButtom ID="PopupLinkButtom10" runat="server" info='<%# Eval("d_10")+"#"+Eval("id_")+ "#"+Eval("id_tabeli") +"#10#1"%>' />     
                </ItemTemplate>
                <ItemStyle  CssClass="col_55" />
            </asp:TemplateField>

                        <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
                <ItemTemplate>
                     <uc1:PopupLinkButtom ID="PopupLinkButtom11" runat="server" info='<%# Eval("d_11")+"#"+Eval("id_")+ "#"+Eval("id_tabeli") +"#11#1"%>' />     
                </ItemTemplate>
                <ItemStyle  CssClass="col_55" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
                <ItemTemplate>
                    <uc1:PopupLinkButtom ID="PopupLinkButtom12" runat="server" info='<%# Eval("d_12")+"#"+Eval("id_")+ "#"+Eval("id_tabeli") +"#12#1"%>' />     
                </ItemTemplate>
                <ItemStyle  CssClass="col_55" />
            </asp:TemplateField>
           
            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
                <ItemTemplate>
                        <uc1:PopupLinkButtom ID="PopupLinkButtom13" runat="server" info='<%# Eval("d_13")+"#"+Eval("id_")+ "#"+Eval("id_tabeli") +"#13#1"%>' />     
                </ItemTemplate>
                <ItemStyle  CssClass="col_55" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
                <ItemTemplate>
                        <uc1:PopupLinkButtom ID="PopupLinkButtom14" runat="server" info='<%# Eval("d_14")+"#"+Eval("id_")+ "#"+Eval("id_tabeli") +"#14#1"%>' />     
                </ItemTemplate>
                <ItemStyle  CssClass="col_55" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
                <ItemTemplate>
                        <uc1:PopupLinkButtom ID="PopupLinkButtom15" runat="server" info='<%# Eval("d_15")+"#"+Eval("id_")+ "#"+Eval("id_tabeli") +"#15#1"%>' />     
                </ItemTemplate>
                <ItemStyle  CssClass="col_55" />
            </asp:TemplateField>



        </Columns>
    </asp:GridView>
  
    

    <asp:SqlDataSource ID="dane_do_tabeli_1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:wap %>" 
        
        
        SelectCommand="SELECT DISTINCT id_, opis, id_tabeli,d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15 FROM tbl_statystyki_tbl_01 WHERE (id_dzialu = @id_dzialu) AND (id_tabeli = 1) ORDER BY id_">
        <SelectParameters>
            <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
        </SelectParameters>
    </asp:SqlDataSource>
     </div>
   <div id="zalatwienia"  class="page-break"> 
    <br />
    


    <asp:Label ID="Label19" runat="server"></asp:Label>
       <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
        DataSourceID="dane_do_tabeli_2" 
        Width="100%" ShowHeader="False">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
            <ItemStyle Width="15px" />
            </asp:BoundField>
          
            <asp:TemplateField HeaderText="imie" SortExpression="imie">
               
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                    &nbsp;<asp:Label ID="Label1" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle  CssClass="t2_nazwisko" />
            </asp:TemplateField>

             <asp:TemplateField HeaderText="stanowisko" SortExpression="imie">
               
                <ItemTemplate>
                    <asp:Label ID="Label1110" runat="server" Text='<%# Eval("stanowisko") %>'></asp:Label>
                    
                </ItemTemplate>
                <ItemStyle  CssClass="t2_stanowisko" />
            </asp:TemplateField>

                <asp:TemplateField HeaderText="stanowisko" SortExpression="imie">
               
                <ItemTemplate>
                    <asp:Label ID="Label610" runat="server" Text='<%# Eval("funkcja") %>'></asp:Label>
                    
                </ItemTemplate>
                <ItemStyle  CssClass="t2_funkcja" />
            </asp:TemplateField>



            <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
               
                <ItemTemplate>
                     <uc1:PopupLinkButtom ID="PopupLinkButtom16" runat="server" info='<%# Eval("d_01")+"#"+Eval("id_sedziego")+ "#"+Eval("id_tabeli") +"#1#2"%>' />     
                    
                </ItemTemplate>
                <ItemStyle  CssClass="col_36" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_02" SortExpression="d_02">
                
                <ItemTemplate>
                    <uc1:PopupLinkButtom ID="PopupLinkButtom17" runat="server" info='<%# Eval("d_02")+"#"+Eval("id_sedziego")+ "#"+Eval("id_tabeli") +"#2#2"%>' />     
                   
                 </ItemTemplate>
                  <ItemStyle  CssClass="col_36" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_03" SortExpression="d_03">
                
                <ItemTemplate>
                    <uc1:PopupLinkButtom ID="PopupLinkButtom18" runat="server" info='<%# Eval("d_03")+"#"+Eval("id_sedziego")+ "#"+Eval("id_tabeli") +"#3#2"%>' />     
                   
                
                </ItemTemplate>
                  <ItemStyle  CssClass="col_36" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
               
                <ItemTemplate>
                    <uc1:PopupLinkButtom ID="PopupLinkButtom19" runat="server" info='<%# Eval("d_04")+"#"+Eval("id_sedziego")+ "#"+Eval("id_tabeli") +"#4#2"%>' />     
                   
             
                </ItemTemplate>
                  <ItemStyle  CssClass="col_36" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
               
                <ItemTemplate>
                    <uc1:PopupLinkButtom ID="PopupLinkButtom20" runat="server" info='<%# Eval("d_05")+"#"+Eval("id_sedziego")+ "#"+Eval("id_tabeli") +"#5#2"%>' />     
                   
                </ItemTemplate>
                  <ItemStyle  CssClass="col_36" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
               
                <ItemTemplate>
                    <uc1:PopupLinkButtom ID="PopupLinkButtom21" runat="server" info='<%# Eval("d_06")+"#"+Eval("id_sedziego")+ "#"+Eval("id_tabeli") +"#6#2"%>' />     
                   
                </ItemTemplate>
                  <ItemStyle  CssClass="col_36" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                    <uc1:PopupLinkButtom ID="PopupLinkButtom22" runat="server" info='<%# Eval("d_07")+"#"+Eval("id_sedziego")+ "#"+Eval("id_tabeli") +"#7#2"%>' />     
                   
                </ItemTemplate>
                  <ItemStyle  CssClass="col_36" />
            </asp:TemplateField>
        
            <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                    <uc1:PopupLinkButtom ID="PopupLinkButtom23" runat="server" info='<%# Eval("d_08")+"#"+Eval("id_sedziego")+ "#"+Eval("id_tabeli") +"#8#2"%>' />     
                   
                </ItemTemplate>
                  <ItemStyle  CssClass="col_36" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                    <uc1:PopupLinkButtom ID="PopupLinkButtom24" runat="server" info='<%# Eval("d_09")+"#"+Eval("id_sedziego")+ "#"+Eval("id_tabeli") +"#9#2"%>' />     
                   
                </ItemTemplate>
                  <ItemStyle  CssClass="col_36" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                    <uc1:PopupLinkButtom ID="PopupLinkButtom25" runat="server" info='<%# Eval("d_10")+"#"+Eval("id_sedziego")+ "#"+Eval("id_tabeli") +"#10#2"%>' />     
                   
                </ItemTemplate>
                  <ItemStyle  CssClass="col_36" />
            </asp:TemplateField>
        
         <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                    <uc1:PopupLinkButtom ID="PopupLinkButtom26" runat="server" info='<%# Eval("d_11")+"#"+Eval("id_sedziego")+ "#"+Eval("id_tabeli") +"#11#2"%>' />     
                   
                </ItemTemplate>
                  <ItemStyle  CssClass="col_36" />
            </asp:TemplateField>
        
             <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                    <uc1:PopupLinkButtom ID="PopupLinkButtom27" runat="server" info='<%# Eval("d_12")+"#"+Eval("id_sedziego")+ "#"+Eval("id_tabeli") +"#12#2"%>' />     
                   
                </ItemTemplate>
                  <ItemStyle  CssClass="col_36" />
            </asp:TemplateField>
        
             <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                    <uc1:PopupLinkButtom ID="PopupLinkButtom28" runat="server" info='<%# Eval("d_13")+"#"+Eval("id_sedziego")+ "#"+Eval("id_tabeli") +"#13#2"%>' />     
                   
                </ItemTemplate>
                  <ItemStyle  CssClass="col_36" />
            </asp:TemplateField>
        
             <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                    <uc1:PopupLinkButtom ID="PopupLinkButtom29" runat="server" info='<%# Eval("d_14")+"#"+Eval("id_sedziego")+ "#"+Eval("id_tabeli") +"#14#2"%>' />     
                   
                </ItemTemplate>
                  <ItemStyle  CssClass="col_36" />
            </asp:TemplateField>
        
             <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                    <uc1:PopupLinkButtom ID="PopupLinkButtom30" runat="server" info='<%# Eval("d_15")+"#"+Eval("id_sedziego")+ "#"+Eval("id_tabeli") +"#15#2"%>' />     
                   
                </ItemTemplate>
                  <ItemStyle  CssClass="col_36" />
            </asp:TemplateField>
        
             <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                    <uc1:PopupLinkButtom ID="PopupLinkButtom31" runat="server" info='<%# Eval("d_16")+"#"+Eval("id_sedziego")+ "#"+Eval("id_tabeli") +"#16#2"%>' />     
                   
                </ItemTemplate>
                  <ItemStyle  CssClass="col_36" />
            </asp:TemplateField>
          
             <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                    <uc1:PopupLinkButtom ID="PopupLinkButtom32" runat="server" info='<%# Eval("d_17")+"#"+Eval("id_sedziego")+ "#"+Eval("id_tabeli") +"#17#2"%>' />     
                   
                </ItemTemplate>
                  <ItemStyle  CssClass="col_36" />
            </asp:TemplateField>

                         <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                    <uc1:PopupLinkButtom ID="PopupLinkButtom33" runat="server" info='<%# Eval("d_18")+"#"+Eval("id_sedziego")+ "#"+Eval("id_tabeli") +"#18#2"%>' />     
                   
                </ItemTemplate>
                  <ItemStyle  CssClass="col_36" />
            </asp:TemplateField>

                         <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                    <uc1:PopupLinkButtom ID="PopupLinkButtom34" runat="server" info='<%# Eval("d_19")+"#"+Eval("id_sedziego")+ "#"+Eval("id_tabeli") +"#19#2"%>' />     
                   
                </ItemTemplate>
                  <ItemStyle  CssClass="col_36" />
            </asp:TemplateField>

                         <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                    <uc1:PopupLinkButtom ID="PopupLinkButtom35" runat="server" info='<%# Eval("d_20")+"#"+Eval("id_sedziego")+ "#"+Eval("id_tabeli") +"#20#2"%>' />     
                   
                </ItemTemplate>
                  <ItemStyle  CssClass="col_36" />
            </asp:TemplateField>

                         <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="col_36"></asp:TextBox>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_36" />
            </asp:TemplateField>

                       
                         <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="col_36"></asp:TextBox>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_36" />
            </asp:TemplateField>

                     

             
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="dane_do_tabeli_2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:wap %>" 
        
        SelectCommand="SELECT ROW_NUMBER() OVER( ORDER BY ident ) AS id, ident, imie, nazwisko, funkcja, stanowisko,  d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15, d_16, d_17, d_18, d_19, d_20, d_21, d_22,d_23, sesja, id_sedziego, id_dzialu, id_tabeli FROM tbl_statystyki_tbl_02 WHERE (id_tabeli = 2) AND (id_dzialu = @id_dzialu) ORDER BY id">
        <SelectParameters>
            <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
       </div>
    <div id="wyznaczenia"  class="page-break"> 
        <asp:Label ID="Label17" runat="server"></asp:Label>
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
        DataSourceID="tabela_3" Width="100%" ShowHeader="False">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
            <ItemStyle Width="15px" />
            </asp:BoundField>
           
            <asp:TemplateField HeaderText="nazwisko" SortExpression="nazwisko">
             
                <ItemTemplate>
                    <asp:Label ID="Label12" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                    &nbsp;<asp:Label ID="Label1" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle cssclass="t3_nazwisko" />
            </asp:TemplateField>

              <asp:TemplateField HeaderText="stanowisko" SortExpression="imie">
               
                <ItemTemplate>
                    <asp:Label ID="Label210" runat="server" Text='<%# Eval("stanowisko") %>'></asp:Label>
                    
                </ItemTemplate>
                <ItemStyle  CssClass="t2_stanowisko" />
            </asp:TemplateField>

                <asp:TemplateField HeaderText="stanowisko" SortExpression="imie">
               
                <ItemTemplate>
                    <asp:Label ID="Label2610" runat="server" Text='<%# Eval("funkcja") %>'></asp:Label>
                    
                </ItemTemplate>
                <ItemStyle  CssClass="t2_funkcja" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
               
                <ItemTemplate>
                    <uc1:PopupLinkButtom ID="PopupLinkButtom39" runat="server" info='<%# Eval("d_01")+"#"+Eval("id_sedziego")+ "#"+Eval("id_tabeli") +"#1#2"%>' />     
                    
                </ItemTemplate>
              <ItemStyle cssclass="col_65" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_02" SortExpression="d_02">
               
                <ItemTemplate>
                    <uc1:PopupLinkButtom ID="PopupLinkButtom40" runat="server" info='<%# Eval("d_02")+"#"+Eval("id_sedziego")+ "#"+Eval("id_tabeli") +"#2#2"%>' />     
                     
                </ItemTemplate>
              <ItemStyle cssclass="col_65" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_03" SortExpression="d_03">
             
                <ItemTemplate>
                     <uc1:PopupLinkButtom ID="PopupLinkButtom41" runat="server" info='<%# Eval("d_03")+"#"+Eval("id_sedziego")+ "#"+Eval("id_tabeli") +"#3#2"%>' />     
                </ItemTemplate>
              <ItemStyle cssclass="col_65" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
               
                <ItemTemplate>
                     <uc1:PopupLinkButtom ID="PopupLinkButtom42" runat="server" info='<%# Eval("d_04")+"#"+Eval("id_sedziego")+ "#"+Eval("id_tabeli") +"#4#2"%>' />     
                </ItemTemplate>
              <ItemStyle cssclass="col_65" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
                
                <ItemTemplate>
                     <uc1:PopupLinkButtom ID="PopupLinkButtom43" runat="server" info='<%# Eval("d_05")+"#"+Eval("id_sedziego")+ "#"+Eval("id_tabeli") +"#5#2"%>' />     
                </ItemTemplate>
              <ItemStyle cssclass="col_65" />
            </asp:TemplateField>
           
              <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
                
                <ItemTemplate>
                     <uc1:PopupLinkButtom ID="PopupLinkButtom44" runat="server" info='<%# Eval("d_06")+"#"+Eval("id_sedziego")+ "#"+Eval("id_tabeli") +"#6#2"%>' />     
                </ItemTemplate>
              <ItemStyle cssclass="col_65" />
            </asp:TemplateField>

              <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
                
                <ItemTemplate>
                     <uc1:PopupLinkButtom ID="PopupLinkButtom45" runat="server" info='<%# Eval("d_07")+"#"+Eval("id_sedziego")+ "#"+Eval("id_tabeli") +"#7#2"%>' />     
                </ItemTemplate>
              <ItemStyle cssclass="col_65" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
                
                <ItemTemplate>
                     <uc1:PopupLinkButtom ID="PopupLinkButtom46" runat="server" info='<%# Eval("d_08")+"#"+Eval("id_sedziego")+ "#"+Eval("id_tabeli") +"#8#2"%>' />     
                </ItemTemplate>
              <ItemStyle cssclass="col_65" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
                
                <ItemTemplate>
                    <uc1:PopupLinkButtom ID="PopupLinkButtom47" runat="server" info='<%# Eval("d_09")+"#"+Eval("id_sedziego")+ "#"+Eval("id_tabeli") +"#9#2"%>' />                          
                </ItemTemplate>
              <ItemStyle cssclass="col_65" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
                
                <ItemTemplate>
                     <uc1:PopupLinkButtom ID="PopupLinkButtom48" runat="server" info='<%# Eval("d_10")+"#"+Eval("id_sedziego")+ "#"+Eval("id_tabeli") +"#10#2"%>' />     
                </ItemTemplate>
              <ItemStyle cssclass="col_65" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
                
                <ItemTemplate>
                     <uc1:PopupLinkButtom ID="PopupLinkButtom49" runat="server" info='<%# Eval("d_11")+"#"+Eval("id_sedziego")+ "#"+Eval("id_tabeli") +"#11#2"%>' />     
                </ItemTemplate>
              <ItemStyle cssclass="col_65" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
                
                <ItemTemplate>
                     <uc1:PopupLinkButtom ID="PopupLinkButtom50" runat="server" info='<%# Eval("d_12")+"#"+Eval("id_sedziego")+ "#"+Eval("id_tabeli") +"#12#2"%>' />     
                </ItemTemplate>
              <ItemStyle cssclass="col_65" />
            </asp:TemplateField>

             <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
                
                <ItemTemplate>
                     <uc1:PopupLinkButtom ID="PopupLinkButtom51" runat="server" info='<%# Eval("d_13")+"#"+Eval("id_sedziego")+ "#"+Eval("id_tabeli") +"#13#2"%>' />     
                </ItemTemplate>
              <ItemStyle cssclass="col_65" />
            </asp:TemplateField>

          
             

        </Columns>
        <RowStyle Height="25px" />
    </asp:GridView>
    <asp:SqlDataSource ID="tabela_3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:wap %>" 
        
        SelectCommand="SELECT ROW_NUMBER() OVER( ORDER BY ident ) AS id,  ident, imie, nazwisko, funkcja, stanowisko, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15,  sesja, id_sedziego, id_dzialu, id_tabeli FROM tbl_statystyki_tbl_02 WHERE (id_tabeli = 3) AND (id_dzialu = @id_dzialu) ORDER BY id">
        <SelectParameters>
            <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
        </SelectParameters>
    </asp:SqlDataSource>
        </div>
    

        <div id="Div8"  class="page-break"> 
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

    <div id="debag" >
          <br />
    <asp:Label ID="Label11" runat="server"></asp:Label>
   
          <br />
   
        </div>
    

      
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
<link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/start/jquery-ui.css"
    rel="stylesheet" type="text/css" />

    <br />
       
  </div>

    
</asp:Content>

