<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="otrr.aspx.cs" Inherits="stat2018.otrr" %>
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
        <div id="Div2" style="z-index: 10;">
            <div style="margin-left: auto; margin-right: auto; text-align: center; width: auto;">
                <asp:label id="Label3" runat="server" text="Sąd " style="font-weight: 700"></asp:label>
            </div>
            <div style="margin-left: auto; margin-right: auto; text-align: center; width: auto;">
                <asp:label runat="server" id="id_dzialu" Visible="False"></asp:label>
            </div>
            <asp:label id="Label5" runat="server" viewstatemode="Enabled"></asp:label>

            <asp:gridview id="GridView2" runat="server" autogeneratecolumns="False"
                onrowcreated="GridView2_RowCreated" datasourceid="dane_do_tabeli_1"
                width="100%" showheader="False" datakeynames="opis,d_01,d_02,d_03,d_04,d_05,d_06,d_07,d_08,d_09,d_10,d_11,d_12,d_13,d_14,d_15,id_tabeli">
        <Columns>
            <asp:TemplateField HeaderText="opis" SortExpression="opis">
                <ItemTemplate>
                      <ItemStyle  CssClass="t1_opis" />
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("opis") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
               <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!1!1"%>')"><asp:Label ID="Label101" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label> </a>
                       
               </ItemTemplate>
  <ItemStyle  CssClass="col_90" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_02" SortExpression="d_02">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!2!1"%>')"><asp:Label ID="Label102" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
            <ItemStyle  CssClass="col_90" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_03" SortExpression="d_03">
                <ItemTemplate>
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!3!1"%>')"><asp:Label ID="Label103" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_90" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
                <ItemTemplate>
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!4!1"%>')"><asp:Label ID="Label104" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_90" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
                <ItemTemplate>
                               <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!5!1"%>')"><asp:Label ID="Label105" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label> </a>
        
                </ItemTemplate>
                <ItemStyle  CssClass="col_90" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!6!1"%>')"><asp:Label ID="Label106" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label> </a>
              </ItemTemplate>
                <ItemStyle  CssClass="col_90" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                         <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!7!1"%>')"><asp:Label ID="Label107" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label> </a>
           </ItemTemplate>
                <ItemStyle  CssClass="col_90" />
            </asp:TemplateField>
          
               <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                         <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!8!1"%>')"><asp:Label ID="Label108" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label> </a>
           </ItemTemplate>
                <ItemStyle  CssClass="col_90" />
            </asp:TemplateField>
             <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                         <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!9!1"%>')"><asp:Label ID="Label109" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label> </a>
           </ItemTemplate>
                <ItemStyle  CssClass="col_90" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                         <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!10!1"%>')"><asp:Label ID="Label110" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label> </a>
           </ItemTemplate>
                <ItemStyle  CssClass="col_90"  BackColor="#CCCCCC"/>
            </asp:TemplateField>
          
        </Columns>
    </asp:gridview>
            <asp:sqldatasource id="dane_do_tabeli_1" runat="server"
                connectionstring="<%$ ConnectionStrings:wap %>"
                selectcommand="SELECT DISTINCT id_, opis, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15,id_tabeli
FROM            tbl_statystyki_tbl_01
WHERE        (id_dzialu = @id_dzialu) AND (id_tabeli = 1)
ORDER BY id_">
                <SelectParameters>
                    <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
                </SelectParameters>
    </asp:sqldatasource>
        </div>
        <div id="zalatwienia" class="page-break">
            <br />

            <asp:label id="Label19" runat="server" viewstatemode="Enabled"></asp:label>
            <asp:gridview id="GridView1" runat="server" autogeneratecolumns="False"
                datasourceid="statystyki" onrowcreated="grvMergeHeader_RowCreated"
                onselectedindexchanged="GridView1_SelectedIndexChanged"
                width="100%" showheader="False">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
            <asp:BoundField DataField="funkcja" HeaderText="funkcja"
                SortExpression="funkcja">
            <ItemStyle  CssClass="t2_funkcja" />
            </asp:BoundField>
            <asp:BoundField DataField="stanowisko" HeaderText="stanowisko"
                SortExpression="stanowisko">
            <ItemStyle  CssClass="t2_stanowisko" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="imie" SortExpression="imie">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("imie") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                    &nbsp;<asp:Label ID="Label1" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle  CssClass="t2_nazwisko" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                   <ItemTemplate>
                         <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')"><asp:Label ID="Label201" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label> </a> 
             
                 
                  </ItemTemplate>
                <ItemStyle  CssClass="t2_d2" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_02" SortExpression="d_02">
                  <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')"><asp:Label ID="Label202" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label> </a> 
             
                </ItemTemplate>
                  <ItemStyle  CssClass="t2_d2" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_03" SortExpression="d_03">
                 <ItemTemplate>
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')"><asp:Label ID="Label203" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label> </a> 
             
               
                </ItemTemplate>
                  <ItemStyle  CssClass="t2_d2" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
                  <ItemTemplate>
      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')"><asp:Label ID="Label204" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label> </a> 
                     
                </ItemTemplate>
                  <ItemStyle  CssClass="t2_d2" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
                <ItemTemplate>
                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')"><asp:Label ID="Label205" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label> </a> 
             
                  </ItemTemplate>
                  <ItemStyle  CssClass="t2_d2" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
                  <ItemTemplate>
                     <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')"><asp:Label ID="Label206" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label> </a> 
             
                </ItemTemplate>
                  <ItemStyle  CssClass="t2_d2" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                  <ItemTemplate>
                       <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')"><asp:Label ID="Label207" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label> </a> 
             
                          
                </ItemTemplate>
                  <ItemStyle  CssClass="t2_d2" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_08" SortExpression="d_08">
              
                <ItemTemplate>
                  <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')"><asp:Label ID="Label208" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label> </a> 
             
                

                </ItemTemplate>
                  <ItemStyle  CssClass="t2_d2" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_09" SortExpression="d_09">
                  <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')"><asp:Label ID="Label209" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label> </a> 
             
               </ItemTemplate>
                  <ItemStyle  CssClass="t2_d2" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_10" SortExpression="d_10">
                  <ItemTemplate>
                       <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')"><asp:Label ID="Label210" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label> </a> 
         

                  </ItemTemplate>

                   <ItemStyle CssClass="t2_d2" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_11" SortExpression="d_11">
                 <ItemTemplate >
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!2"%>')"><asp:Label ID="Label212" runat="server" Text='<%# Eval("d_12")%>' CssClass="normal"></asp:Label> </a> 
             
                    
                                                </ItemTemplate>
                  <ItemStyle  CssClass="t2_d2" />
            </asp:TemplateField>


                <asp:TemplateField HeaderText="d_11" SortExpression="d_11">
                 <ItemTemplate >
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!13!2"%>')"><asp:Label ID="Label213" runat="server" Text='<%# Eval("d_13")%>' CssClass="normal"></asp:Label> </a> 
             
                    
                                                </ItemTemplate>
                  <ItemStyle  CssClass="t2_d2"  BackColor="#CCCCCC"/>
            </asp:TemplateField>

                <asp:TemplateField HeaderText="d_11" SortExpression="d_11">
                 <ItemTemplate >
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!14!2"%>')"><asp:Label ID="Label214" runat="server" Text='<%# Eval("d_14")%>' CssClass="normal"></asp:Label> </a> 
             
                    
                                                </ItemTemplate>
                  <ItemStyle  CssClass="t2_d2" />
            </asp:TemplateField>
            
          
          
            <asp:TemplateField HeaderText="d_14" SortExpression="d_14">
               
                <ItemTemplate>
                    <asp:TextBox ID="TextBox37" runat="server" Text='<%# Bind("d_17") %>' CssClass="normal" Width="40px" style="text-align: center;"></asp:TextBox>
                </ItemTemplate>
                 <ItemStyle  CssClass="t2_d2" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_15" SortExpression="d_15">
               
                <ItemTemplate>
                    <asp:TextBox ID="TextBox36" runat="server" Text='<%# Bind("d_18") %>' CssClass="normal" Width="40px" style="text-align: center;"></asp:TextBox>
                </ItemTemplate>
                 <ItemStyle  CssClass="t2_d2" />
            </asp:TemplateField>
        </Columns>
    </asp:gridview>
            <asp:sqldatasource id="statystyki" runat="server"
                connectionstring="<%$ ConnectionStrings:wap %>"
                selectcommand="SELECT ROW_NUMBER() OVER( ORDER BY ident ) AS id, ident, imie, nazwisko, funkcja, stanowisko, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15, d_16, d_17, d_18, d_19, d_20, d_21, d_22, sesja, id_sedziego, id_dzialu, id_tabeli FROM tbl_statystyki_tbl_02 WHERE (id_tabeli = 2) AND (id_dzialu = @id_dzialu) ORDER BY id">
        <SelectParameters>
            <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
        </SelectParameters>
    </asp:sqldatasource>
            <br />
        </div>
        <div id="wyznaczenia" class="page-break">
            &nbsp;<asp:label id="Label17" runat="server" enableviewstate="False" viewstatemode="Disabled"></asp:label>
            <asp:gridview id="GridView3" runat="server" autogeneratecolumns="False"
                datasourceid="tabela_3" onrowcreated="GridView3_RowCreated" width="100%" showheader="False" OnSelectedIndexChanged="GridView3_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
            <asp:BoundField DataField="funkcja" HeaderText="funkcja"
                SortExpression="funkcja">
            <ItemStyle cssclass="t3_funkcja" />
            </asp:BoundField>
            <asp:BoundField DataField="stanowisko" HeaderText="stanowisko"
                SortExpression="stanowisko">
            <ItemStyle cssclass="t3_stanowisko" />
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
              <ItemStyle cssclass="t3_d1" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_02" SortExpression="d_02">
                 <ItemTemplate>
                                     <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')"><asp:Label ID="Label302" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label> </a> 
     
                </ItemTemplate>
              <ItemStyle cssclass="t3_d1" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_03" SortExpression="d_03">
                  <ItemTemplate>
                                     <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')"><asp:Label ID="Label303" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label> </a> 
     
             </ItemTemplate>
              <ItemStyle cssclass="t3_d1" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
                 <ItemTemplate>
                   <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')"><asp:Label ID="Label304" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label> </a> 
     
               </ItemTemplate>
              <ItemStyle cssclass="t3_d1" />
            </asp:TemplateField>            
            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
                 <ItemTemplate>
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')"><asp:Label ID="Label305" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label> </a> 
     
            </ItemTemplate>
              <ItemStyle cssclass="t3_d1" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
                 <ItemTemplate>
                   <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')"><asp:Label ID="Label306" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label> </a> 
  
             </ItemTemplate>
              <ItemStyle cssclass="t3_d1" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                               <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')"><asp:Label ID="Label307" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label> </a> 
     
                     
                </ItemTemplate>
              <ItemStyle cssclass="t3_d1" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_08" SortExpression="d_08">
                 <ItemTemplate>
                     
                  <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')"><asp:Label ID="Label308" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label> </a> 
     
          </ItemTemplate>
              <ItemStyle cssclass="t3_d1" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_09" SortExpression="d_09">
                  <ItemTemplate>
                   <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')"><asp:Label ID="Label309" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label> </a> 
     
           </ItemTemplate>
              <ItemStyle cssclass="t3_d1"  />
            </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_09" SortExpression="d_09">
                  <ItemTemplate>
                   <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')"><asp:Label ID="Label310" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label> </a> 
     
           </ItemTemplate>
              <ItemStyle cssclass="t3_d1"  BackColor="#CCCCCC" />
            </asp:TemplateField>
                  <asp:TemplateField HeaderText="d_09" SortExpression="d_09">
                  <ItemTemplate>
                   <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!2"%>')"><asp:Label ID="Label311" runat="server" Text='<%# Eval("d_11")%>' CssClass="normal"></asp:Label> </a> 
     
           </ItemTemplate>
              <ItemStyle cssclass="t3_d1" />
            </asp:TemplateField>
        </Columns>
    </asp:gridview>

            <asp:sqldatasource id="tabela_3" runat="server"
                connectionstring="<%$ ConnectionStrings:wap %>"
                selectcommand="SELECT ROW_NUMBER() OVER( ORDER BY ident ) AS id,  ident, imie, nazwisko, funkcja, stanowisko, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15, d_16, d_17, d_18, d_19, d_20, d_21, d_22, sesja, id_sedziego, id_dzialu, id_tabeli FROM tbl_statystyki_tbl_02 WHERE (id_tabeli = 3) AND (id_dzialu = @id_dzialu) ORDER BY id">
 <SelectParameters>
            <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
        </SelectParameters>
    </asp:sqldatasource>        </div>

        <br />
        <div id="Div1" class="page-break">
            &nbsp;<asp:label id="Label15" runat="server"></asp:label>
            &nbsp;
    &nbsp;<asp:gridview id="GridView4" runat="server" autogeneratecolumns="False"
        datasourceid="tabela_4" onrowcreated="GridView4_RowCreated" width="100%" showheader="False">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
            <asp:BoundField DataField="funkcja" HeaderText="funkcja"
                SortExpression="funkcja">
            <ItemStyle cssclass="t4_funkcja" />
            </asp:BoundField>
            <asp:BoundField DataField="stanowisko" HeaderText="stanowisko"
                SortExpression="stanowisko">
            <ItemStyle cssclass="t4_stanowisko" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="nazwisko" SortExpression="nazwisko">
               
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
                <ItemStyle cssclass="t4_d1" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_02" SortExpression="d_02">
                 <ItemTemplate>
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')"><asp:Label ID="Label402" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label> </a> 
     
           </ItemTemplate>
                <ItemStyle cssclass="t4_d1" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_03" SortExpression="d_03">
                 <ItemTemplate>
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')"><asp:Label ID="Label403" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label> </a> 
            </ItemTemplate>
                <ItemStyle cssclass="t4_d1" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
                  <ItemTemplate>
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')"><asp:Label ID="Label404" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label> </a> 
            </ItemTemplate>
                <ItemStyle cssclass="t4_d1" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
                  <ItemTemplate>
                       <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')"><asp:Label ID="Label405" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label> </a> 

           </ItemTemplate>
                 <ItemStyle cssclass="t4_d1" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                  <ItemTemplate>
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')"><asp:Label ID="Label406" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label> </a> 

                
                </ItemTemplate>
                 <ItemStyle cssclass="t4_d1" />
            </asp:TemplateField>
            <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="d_08" SortExpression="d_08">
                  <ItemTemplate>
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')"><asp:Label ID="Label407" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label> </a> 

          </ItemTemplate>
                 <ItemStyle cssclass="t4_d1" />
            </asp:TemplateField>
          
              <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="d_09" SortExpression="d_09">
                <ItemTemplate>
                    
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')"><asp:Label ID="Label408" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label> </a> 

                
                </ItemTemplate>
                 <ItemStyle cssclass="t4_d1" />
            </asp:TemplateField>
           
                   <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="d_09" SortExpression="d_09">
                <ItemTemplate>
                    
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')"><asp:Label ID="Label410" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label> </a> 

                
                </ItemTemplate>
                 <ItemStyle cssclass="t4_d1" />
            </asp:TemplateField>
                    <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="d_09" SortExpression="d_09">
                <ItemTemplate>
                    
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!2"%>')"><asp:Label ID="Label411" runat="server" Text='<%# Eval("d_11")%>' CssClass="normal"></asp:Label> </a> 

                
                </ItemTemplate>
                 <ItemStyle cssclass="t4_d1" BackColor="#CCCCCC"/>
            </asp:TemplateField>
        </Columns>
    </asp:gridview>
            <asp:sqldatasource id="tabela_4" runat="server"
                connectionstring="<%$ ConnectionStrings:wap %>"
                selectcommand="SELECT ROW_NUMBER() OVER( ORDER BY ident ) AS id, ident, imie, nazwisko, funkcja, stanowisko, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15, d_16, d_17, d_18, d_19, d_20, d_21, d_22, sesja, id_sedziego,id_tabeli FROM tbl_statystyki_tbl_02 WHERE  (id_tabeli = 4) AND (id_dzialu = @id_dzialu) ORDER BY id">
        <SelectParameters>
            <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
        </SelectParameters>
    </asp:sqldatasource>
            <br />
            Raport statystyczny 
                    <asp:Label ID="Label27" runat="server"></asp:Label>
                &nbsp;Sporzadzone dn.
            <asp:Label ID="Label29" runat="server" Text="Label"></asp:Label>
&nbsp;<np. 21 czerwca 2015>przez
            <asp:Label ID="Label28" runat="server" Text="Label"></asp:Label>
&nbsp;<uzytkownik.imie><uzytkownik.nazwisko>(ver. 15.0621)<br />
            <br />

    <asp:label id="Label11" runat="server" Visible="False"></asp:label>
            <br />
        </div>
     
    </div>
       
</asp:Content>