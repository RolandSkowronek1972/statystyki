<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="oglk.aspx.cs" Inherits="stat2018.oglk" MaintainScrollPositionOnPostback="true" EnableEventValidation="false" %>


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

          <div id="tabela1"  style="z-index:10; "> 
  &nbsp;</div>



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
       <asp:Label ID="infoLabel2" runat="server" Text="Tabela 1+2 \/\/" Visible="False"></asp:Label>
       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="tabela_1" OnRowCreated="GridView1_RowCreated" 
        Width="1150px" ShowHeader="False" OnRowDataBound="GridView1_RowDataBound">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
            <ItemStyle  CssClass="col_35" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="imie" SortExpression="imie">
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                    &nbsp;<asp:Label ID="Label1" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle  CssClass="col_160" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
               
                <ItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Width="60px"></asp:TextBox>
               
                     
                </ItemTemplate>
                <ItemStyle  CssClass="col_60" />
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
                  <ItemStyle  CssClass="col_45" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_03" SortExpression="d_03">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')"><asp:Label ID="Label203" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label> </a>
    
                </ItemTemplate>
                  <ItemStyle  CssClass="col_45" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
              
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')"><asp:Label ID="Label204" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label> </a>
             
                </ItemTemplate>
                  <ItemStyle  CssClass="col_45" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
               
                <ItemTemplate>
                 <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')"><asp:Label ID="Label205" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_45" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')"><asp:Label ID="Label206" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_45" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')"><asp:Label ID="Label207" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_45" />
            </asp:TemplateField>
        
            <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')"><asp:Label ID="Label208" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label> </a>    
                </ItemTemplate>
                  <ItemStyle  CssClass="col_45" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')"><asp:Label ID="Label209" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_45" />
            </asp:TemplateField>
        
               <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                  <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')"><asp:Label ID="Label210" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_45" />
            </asp:TemplateField>

               <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!2"%>')"><asp:Label ID="Label211" runat="server" Text='<%# Eval("d_11")%>' CssClass="normal"></asp:Label> </a>    
                </ItemTemplate>
                  <ItemStyle  CssClass="col_45" />
            </asp:TemplateField>

               <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!2"%>')"><asp:Label ID="Label212" runat="server" Text='<%# Eval("d_12")%>' CssClass="normal"></asp:Label> </a> 
          
                      
                </ItemTemplate>
                  <ItemStyle  CssClass="col_45" />
            </asp:TemplateField>
          
               <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!13!2"%>')"><asp:Label ID="Label213" runat="server" Text='<%# Eval("d_13")%>' CssClass="normal"></asp:Label> </a> 
          
                      
                </ItemTemplate>
                  <ItemStyle  CssClass="col_45" />
            </asp:TemplateField>
          
               <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!14!2"%>')"><asp:Label ID="Label214" runat="server" Text='<%# Eval("d_14")%>' CssClass="normal"></asp:Label> </a> 
          
                      
                </ItemTemplate>
                  <ItemStyle  CssClass="col_45" />
            </asp:TemplateField>
          
               <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!15!2"%>')"><asp:Label ID="Label215" runat="server" Text='<%# Eval("d_15")%>' CssClass="normal"></asp:Label> </a> 
          
                      
                </ItemTemplate>
                  <ItemStyle  CssClass="col_45" />
            </asp:TemplateField>
            
               <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!16!2"%>')"><asp:Label ID="Label216" runat="server" Text='<%# Eval("d_16")%>' CssClass="normal"></asp:Label> </a> 
          
                      
                </ItemTemplate>
                  <ItemStyle  CssClass="col_45" />
            </asp:TemplateField>
            
               <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!17!2"%>')"><asp:Label ID="Label217" runat="server" Text='<%# Eval("d_17")%>' CssClass="normal"></asp:Label> </a> 
          
                      
                </ItemTemplate>
                  <ItemStyle  CssClass="col_45" BackColor="#cccccc"/>
            </asp:TemplateField>
            
               <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!18!2"%>')"><asp:Label ID="Label218" runat="server" Text='<%# Eval("d_18")%>' CssClass="normal"></asp:Label> </a> 
          
                      
                </ItemTemplate>
                  <ItemStyle  CssClass="col_45" />
            </asp:TemplateField>
            
               <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!19!2"%>')"><asp:Label ID="Label219" runat="server" Text='<%# Eval("d_19")%>' CssClass="normal"></asp:Label> </a> 
          
                      
                </ItemTemplate>
                  <ItemStyle  CssClass="col_45" />
            </asp:TemplateField>
            
            
            
             
        </Columns>
           <FooterStyle Font-Bold="True" HorizontalAlign="Center" Wrap="False" />
           <HeaderStyle Wrap="False" />
           <RowStyle Wrap="False" />
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
        <asp:Label ID="Label17" runat="server"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="infoLabel3" runat="server" Text="Tabela 3 \/" Visible="False"></asp:Label>
    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
        DataSourceID="tabela_3" onrowcreated="GridView3_RowCreated" Width="100%" ShowHeader="False" OnRowDataBound="GridView3_RowDataBound" ShowFooter="True">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
            <ItemStyle Width="15px" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="nazwisko" SortExpression="nazwisko">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("nazwisko") %>'></asp:TextBox>
                </EditItemTemplate>
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

    



        </Columns>
        <FooterStyle Font-Bold="True" HorizontalAlign="Center" />
        <RowStyle Height="25px" />
    </asp:GridView>
    <asp:SqlDataSource ID="tabela_3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:wap %>" 
        
        SelectCommand="SELECT ROW_NUMBER() OVER( ORDER BY ident ) AS id,  ident, imie, nazwisko, funkcja, stanowisko, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15, d_16, d_17, d_18, d_19, d_20, d_21, d_22,d_23, d_24,d_24,d_25,d_26,d_27,d_28, sesja, id_sedziego, id_dzialu, id_tabeli FROM tbl_statystyki_tbl_02 WHERE (id_tabeli = 3) AND (id_dzialu = @id_dzialu) ORDER BY id">
        <SelectParameters>
            <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
        </SelectParameters>
    </asp:SqlDataSource>
        <br />
        </div>
       <div id="Div11"  class="page-break"> 
    &nbsp;<asp:Label ID="Label2" runat="server">Ewidencja spraw odroczonych    </asp:Label>
&nbsp;
    &nbsp;<asp:Label ID="infoLabel4" runat="server" Text="Tabela 4 \/" Visible="False"></asp:Label>
           <br />
           <br />
           <table cellpadding="0" cellspacing="0" class="borderAll" style="width:100%;">
               <tr>
                   <td class="borderTopLeft" colspan="2">Sprawy według repertoriów/wykazów</td>
                   <td align="center" class="borderTopLeft">Ilość spraw wyznaczonych</td>
                   <td align="center" class="borderTopLeft">Ilość spraw odroczonych</td>
               </tr>
               <tr>
                   <td class="borderTopLeft wciecie">Ogółem (suma wierszy 2,7,8) </td>
                   <td class="borderTopLeft col_36">1</td>
                   <td align="center" class="borderTopLeft">  <a href="javascript:openPopup('popup.aspx?sesja=1!4!1!3')"><asp:Label CssClass="normal" ID="tab_4_w01_c01" runat="server" Text="0"></asp:Label></a></td>
      
                   <td align="center" class="borderTopLeft">  <a href="javascript:openPopup('popup.aspx?sesja=1!4!2!3')"><asp:Label CssClass="normal" ID="tab_4_w01_c02" runat="server" Text="0"></asp:Label></a></td>
              </tr>
               <tr>
                   <td class="borderTopLeft wciecie">Sprawy karne ogółem (suma wierszy 3,4,6,9,10)</td>
                   <td class="borderTopLeft col_36">2</td>
                 	<td class="borderTopLeft" align="center"><a href="javascript:openPopup('popup.aspx?sesja=2!4!1!3')"><asp:Label CssClass="normal" ID="tab_4_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderTopLeft" align="center"><a href="javascript:openPopup('popup.aspx?sesja=2!4!2!3')"><asp:Label CssClass="normal" ID="tab_4_w02_c02" runat="server" Text="0"></asp:Label></a></td>
       
               </tr>
               <tr>
                   <td class="borderTopLeft wciecie">K</td>
                   <td class="borderTopLeft col_36">3</td>
                   <td class="borderTopLeft" align="center"><a href="javascript:openPopup('popup.aspx?sesja=3!4!1!3')"><asp:Label CssClass="normal" ID="tab_4_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                   <td class="borderTopLeft" align="center"><a href="javascript:openPopup('popup.aspx?sesja=3!4!2!3')"><asp:Label CssClass="normal" ID="tab_4_w03_c02" runat="server" Text="0"></asp:Label></a></td>
               </tr>
               <tr>
                   <td class="borderTopLeft wciecie">Kp</td>
                   <td class="borderTopLeft col_36">4</td>
                   <td class="borderTopLeft" align="center"><a href="javascript:openPopup('popup.aspx?sesja=4!4!1!3')"><asp:Label CssClass="normal" ID="tab_4_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                   <td class="borderTopLeft" align="center"><a href="javascript:openPopup('popup.aspx?sesja=4!4!2!3')"><asp:Label CssClass="normal" ID="tab_4_w04_c02" runat="server" Text="0"></asp:Label></a></td>
          
        </tr>
               <tr>                   <td class="borderTopLeft wciecie">Ko (suma wierszy 6,7) </td>
                   <td class="borderTopLeft col_36">5</td>
                    <td class="borderTopLeft" align="center"><a href="javascript:openPopup('popup.aspx?sesja=5!4!1!3')"><asp:Label CssClass="normal" ID="tab_4_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderTopLeft" align="center"><a href="javascript:openPopup('popup.aspx?sesja=5!4!2!3')"><asp:Label CssClass="normal" ID="tab_4_w05_c02" runat="server" Text="0"></asp:Label></a></td>
       
                    </tr>
               <tr>
                   <td class="borderTopLeft wciecie">Ko -sprawy karne</td>
                   <td class="borderTopLeft col_36">6</td>
                    <td class="borderTopLeft" align="center"><a href="javascript:openPopup('popup.aspx?sesja=6!4!1!3')"><asp:Label CssClass="normal" ID="tab_4_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderTopLeft" align="center"><a href="javascript:openPopup('popup.aspx?sesja=6!4!2!3')"><asp:Label CssClass="normal" ID="tab_4_w06_c02" runat="server" Text="0"></asp:Label></a></td>
       </tr>
               <tr>
                    <td class="borderTopLeft wciecie">Ko - sprawy wykroczeniowe </td>
                    <td class="borderTopLeft col_36">7</td>
                    <td class="borderTopLeft" align="center"><a href="javascript:openPopup('popup.aspx?sesja=7!4!1!3')"><asp:Label CssClass="normal" ID="tab_4_w07_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderTopLeft" align="center"><a href="javascript:openPopup('popup.aspx?sesja=7!4!2!3')"><asp:Label CssClass="normal" ID="tab_4_w07_c02" runat="server" Text="0"></asp:Label></a></td>
                   </tr>
               <tr>
                   <td class="borderTopLeft wciecie">W</td>
                   <td class="borderTopLeft col_36">8</td>
                   <td class="borderTopLeft" align="center"><a href="javascript:openPopup('popup.aspx?sesja=8!4!1!3')"><asp:Label CssClass="normal" ID="tab_4_w08_c01" runat="server" Text="0"></asp:Label></a></td>
                   <td class="borderTopLeft" align="center"><a href="javascript:openPopup('popup.aspx?sesja=8!4!2!3')"><asp:Label CssClass="normal" ID="tab_4_w08_c02" runat="server" Text="0"></asp:Label></a></td>
          </tr>
               <tr>
                   <td class="borderTopLeft wciecie">Kop</td>
                   <td class="borderTopLeft col_36">9</td>
                   <td class="borderTopLeft" align="center"><a href="javascript:openPopup('popup.aspx?sesja=9!4!1!3')"><asp:Label CssClass="normal" ID="tab_4_w09_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderTopLeft" align="center"><a href="javascript:openPopup('popup.aspx?sesja=9!4!2!3')"><asp:Label CssClass="normal" ID="tab_4_w09_c02" runat="server" Text="0"></asp:Label></a></td>
       
               </tr>
               <tr>
                   <td class="borderTopLeft wciecie">Odpowiedzialność podmiotów zbiorowych </td>
                   <td class="borderTopLeft col_36">10</td>
                   <td class="borderTopLeft" align="center"><a href="javascript:openPopup('popup.aspx?sesja=10!4!1!3')"><asp:Label CssClass="normal" ID="tab_4_w10_c01" runat="server" Text="0"></asp:Label></a></td>
                   <td class="borderTopLeft" align="center"><a href="javascript:openPopup('popup.aspx?sesja=10!4!2!3')"><asp:Label CssClass="normal" ID="tab_4_w10_c02" runat="server" Text="0"></asp:Label></a></td>
       
               </tr>
           </table>
        <br />
        </div>
    
    <br />
    <div id="Div11"  class="page-break"> 
    &nbsp;<asp:Label ID="Label15" runat="server"></asp:Label>
&nbsp;
    &nbsp;<asp:Label ID="infoLabel5" runat="server" Text="Tabela 5 \/" Visible="False"></asp:Label>
        <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" 
        DataSourceID="tabela_5" onrowcreated="GridView5_RowCreated" Width="100%" ShowHeader="False" OnRowDataBound="GridView5_RowDataBound" ShowFooter="True">
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
                <ItemStyle cssclass="col_200" />
            </asp:TemplateField>
                 <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
               
                <ItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Width="60px"></asp:TextBox>
               
                     
                </ItemTemplate>
                <ItemStyle  CssClass="col_60" />
            </asp:TemplateField>
       
              <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
               
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')"><asp:Label ID="Label401" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label> </a>
    
                     
                </ItemTemplate>
                <ItemStyle  CssClass="col_60" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_02" SortExpression="d_02">
               
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')"><asp:Label ID="Label402" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label> </a>
    
                 </ItemTemplate>
                  <ItemStyle  CssClass="col_60" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_03" SortExpression="d_03">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')"><asp:Label ID="Label403" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label> </a>
    
                </ItemTemplate>
                  <ItemStyle  CssClass="col_60" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
              
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')"><asp:Label ID="Label404" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label> </a>
             
                </ItemTemplate>
                  <ItemStyle  CssClass="col_60" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
               
                <ItemTemplate>
                 <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')"><asp:Label ID="Label405" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_60" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')"><asp:Label ID="Label406" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_60" />
            </asp:TemplateField>

           <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')"><asp:Label ID="Label407" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_60" />
            </asp:TemplateField>

     <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')"><asp:Label ID="Label408" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_60" />
            </asp:TemplateField>
        
     <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')"><asp:Label ID="Label409" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_60" />
            </asp:TemplateField>
       
            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')"><asp:Label ID="Label410" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_60" />
            </asp:TemplateField>
 
                   <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!2"%>')"><asp:Label ID="Label411" runat="server" Text='<%# Eval("d_11")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_60" />
            </asp:TemplateField>
 
                   <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!2"%>')"><asp:Label ID="Label412" runat="server" Text='<%# Eval("d_12")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_60" />
            </asp:TemplateField>
        <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!13!2"%>')"><asp:Label ID="Label413" runat="server" Text='<%# Eval("d_13")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_60" />
            </asp:TemplateField>
        <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!14!2"%>')"><asp:Label ID="Label414" runat="server" Text='<%# Eval("d_14")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_60" />
            </asp:TemplateField>
        <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!15!2"%>')"><asp:Label ID="Label415" runat="server" Text='<%# Eval("d_15")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_60" />
            </asp:TemplateField>

        <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!16!2"%>')"><asp:Label ID="Label416" runat="server" Text='<%# Eval("d_16")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_60" />
            </asp:TemplateField>
        <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!17!2"%>')"><asp:Label ID="Label417" runat="server" Text='<%# Eval("d_17")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_60" />
            </asp:TemplateField>
        <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!18!2"%>')"><asp:Label ID="Label418" runat="server" Text='<%# Eval("d_18")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_60" />
            </asp:TemplateField>
                <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!19!2"%>')"><asp:Label ID="Label419" runat="server" Text='<%# Eval("d_19")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_60" />
            </asp:TemplateField>
                <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!20!2"%>')"><asp:Label ID="Label420" runat="server" Text='<%# Eval("d_20")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_60" />
            </asp:TemplateField>
                <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!21!2"%>')"><asp:Label ID="Label421" runat="server" Text='<%# Eval("d_21")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_60" />
            </asp:TemplateField>

        </Columns>
            <FooterStyle Font-Bold="True" HorizontalAlign="Center" />
    </asp:GridView>
    <asp:SqlDataSource ID="tabela_5" runat="server" 
        ConnectionString="<%$ ConnectionStrings:wap %>" 
        
        SelectCommand="SELECT ROW_NUMBER() OVER (ORDER BY ident) AS id, ident, imie, nazwisko, funkcja, stanowisko, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15, d_16, d_17, d_18, d_19, d_20, d_21, d_22, d_23, d_24,d_25, d_26,d_27,d_28, sesja, id_sedziego, id_tabeli FROM tbl_statystyki_tbl_02 WHERE (id_tabeli = 5) AND (id_dzialu = @id_dzialu) ORDER BY id">
        <SelectParameters>
            <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
        </SelectParameters>
    </asp:SqlDataSource>
        <br />
        </div>
       <div id="Div11"  class="page-break"> 
    &nbsp;<asp:Label ID="Label5" runat="server"></asp:Label>
&nbsp;
    &nbsp;<asp:Label ID="Label7" runat="server" Text="Tabela 6 \/" Visible="False"></asp:Label>
        <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" 
        DataSourceID="tabela_6" onrowcreated="GridView6_RowCreated" Width="100%" ShowHeader="False" OnRowDataBound="GridView6_RowDataBound" ShowFooter="True">
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
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')"><asp:Label ID="Label601" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label> </a>
    
                     
                </ItemTemplate>
                <ItemStyle  CssClass="col_91" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_02" SortExpression="d_02">
               
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')"><asp:Label ID="Label602" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label> </a>
    
                 </ItemTemplate>
                  <ItemStyle  CssClass="col_91" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_03" SortExpression="d_03">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')"><asp:Label ID="Label603" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label> </a>
    
                </ItemTemplate>
                  <ItemStyle  CssClass="col_91" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
              
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')"><asp:Label ID="Label604" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label> </a>
             
                </ItemTemplate>
                  <ItemStyle  CssClass="col_91" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
               
                <ItemTemplate>
                 <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')"><asp:Label ID="Label605" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_91" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')"><asp:Label ID="Label606" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_91" />
            </asp:TemplateField>


            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')"><asp:Label ID="Label607" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_91" />
            </asp:TemplateField>
<asp:TemplateField HeaderText="d_06" SortExpression="d_06">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')"><asp:Label ID="Label608" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_91" />
            </asp:TemplateField>
<asp:TemplateField HeaderText="d_06" SortExpression="d_06">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')"><asp:Label ID="Label609" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_91" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
               
                <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')"><asp:Label ID="Label610" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_91" />
            </asp:TemplateField>
        </Columns>
            <FooterStyle Font-Bold="True" HorizontalAlign="Center" />
    </asp:GridView>
    <asp:SqlDataSource ID="Tabela_6" runat="server" 
        ConnectionString="<%$ ConnectionStrings:wap %>" 
        
        SelectCommand="SELECT ROW_NUMBER() OVER (ORDER BY ident) AS id, ident, imie, nazwisko, funkcja, stanowisko, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15, d_16, d_17, d_18, d_19, d_20, d_21, d_22, d_23, d_24,d_25, d_26,d_27,d_28, sesja, id_sedziego, id_tabeli FROM tbl_statystyki_tbl_02 WHERE (id_tabeli = 6) AND (id_dzialu = @id_dzialu) ORDER BY id">
        <SelectParameters>
            <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
        </SelectParameters>
    </asp:SqlDataSource>
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

