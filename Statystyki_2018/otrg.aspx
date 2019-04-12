<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="otrg.aspx.cs" Inherits="stat2018.otrg" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<%@ Register src="UserControlls/PopupLinkButtom.ascx" tagname="PopupLinkButtom" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script src="Scripts/rls.js"></script>
   <div class="dataBar"> 

     <div class="noprint">
    <div class="manu_back ">
     <table class="tbl_manu  Landscape ">
                     
            <tr>
                <td style="width: 350px;">
                    <asp:label id="Label4" runat="server" text="Proszę wybrać zakres:"></asp:label>
                    <asp:textbox runat="server" id="Date1" readonly="False" enableviewstate="False" viewstatemode="Enabled" width="75px"></asp:textbox>
                    <ajaxToolkit:CalendarExtender ID="Date1_CalendarExtender" runat="server"
                        Enabled="True" TargetControlID="Date1" ViewStateMode="Enabled">
                    </ajaxToolkit:CalendarExtender>

                    <asp:textbox runat="server" id="Date2" readonly="False" enableviewstate="False" width="75px" />

                    <ajaxToolkit:CalendarExtender ID="Date2ButtonExtender" runat="server" TargetControlID="Date2" Enabled="True" ViewStateMode="Enabled" />
                </td>
                <td>
                    <asp:linkbutton id="LinkButton54" runat="server" class="ax_box" onclick="LinkButton54_Click">  Odśwież</asp:linkbutton>
                </td>
                <td>
                    <asp:linkbutton id="LinkButton55" runat="server" class="ax_box" onclick="LinkButton55_Click" cssclass="ax_box"> Drukuj </asp:linkbutton>
                </td>
                <td>

                    <asp:linkbutton id="LinkButton56" runat="server" onclick="Button1_Click" cssclass="ax_box">Podgląd</asp:linkbutton>
                </td>
                <td>
                    <asp:linkbutton id="LinkButton57" runat="server" cssclass="ax_box" onclick="Button3_Click">Zapisz do Excel</asp:linkbutton>
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
                <ajaxToolkit:ToolkitScriptManager runat="Server" EnableScriptGlobalization="true"
                    EnableScriptLocalization="true" ID="ScriptManager1" />
                <asp:label runat="server" id="id_dzialu" Visible="False"></asp:label>
            </div>

            <br />
            &nbsp;<asp:label id="Label5" runat="server"></asp:label>

            <asp:gridview id="GridView1" runat="server" autogeneratecolumns="False"
                onrowcreated="GridView2_RowCreated" datasourceid="dane_do_tabeli_1"
                width="100%" showheader="False" datakeynames="opis,d_01,d_02,d_03,d_04,d_05,d_06,d_07,d_08,d_09,d_10,d_11,d_12,d_13,d_14,d_15,id_tabeli">
        <Columns>
            <asp:TemplateField HeaderText="opis" SortExpression="opis">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("opis") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                      <ItemStyle  CssClass="t1_opis" />
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("opis") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!1!1"%>')"><asp:Label ID="Label101" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label> </a>
                       
               </ItemTemplate>
  <ItemStyle  CssClass="col_54" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_02" SortExpression="d_02">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!2!1"%>')"><asp:Label ID="Label102" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
            <ItemStyle  CssClass="col_54" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_03" SortExpression="d_03">
                <ItemTemplate>
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!3!1"%>')"><asp:Label ID="Label103" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_54" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
                <ItemTemplate>
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!4!1"%>')"><asp:Label ID="Label104" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label> </a>
                </ItemTemplate>
                  <ItemStyle  CssClass="col_54" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
                <ItemTemplate>
                               <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!5!1"%>')"><asp:Label ID="Label105" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label> </a>
        
                </ItemTemplate>
                <ItemStyle  CssClass="col_54" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!6!1"%>')"><asp:Label ID="Label106" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label> </a>
              </ItemTemplate>
                <ItemStyle  CssClass="col_54" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                         <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!7!1"%>')"><asp:Label ID="Label107" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label> </a>
           </ItemTemplate>
                <ItemStyle  CssClass="col_54" />
            </asp:TemplateField>
          
               <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                         <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!8!1"%>')"><asp:Label ID="Label108" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label> </a>
           </ItemTemplate>
                <ItemStyle  CssClass="col_54" />
            </asp:TemplateField>
             <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                         <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!9!1"%>')"><asp:Label ID="Label109" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label> </a>
           </ItemTemplate>
                <ItemStyle  CssClass="col_54" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                         <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!10!1"%>')"><asp:Label ID="Label110" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label> </a>
           </ItemTemplate>
                <ItemStyle  CssClass="col_54"  />
            </asp:TemplateField>

               <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                         <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!11!1"%>')"><asp:Label ID="Label110" runat="server" Text='<%# Eval("d_11")%>' CssClass="normal"></asp:Label> </a>
           </ItemTemplate>
                <ItemStyle  CssClass="col_54" />
            </asp:TemplateField>

               <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                         <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!12!1"%>')"><asp:Label ID="Label111" runat="server" Text='<%# Eval("d_12")%>' CssClass="normal"></asp:Label> </a>
           </ItemTemplate>
                <ItemStyle  CssClass="col_54"  />
            </asp:TemplateField>
               <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                         <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!13!1"%>')"><asp:Label ID="Label112" runat="server" Text='<%# Eval("d_13")%>' CssClass="normal"></asp:Label> </a>
           </ItemTemplate>
                <ItemStyle  CssClass="col_54" />
            </asp:TemplateField>
               <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                         <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!14!1"%>')"><asp:Label ID="Label113" runat="server" Text='<%# Eval("d_14")%>' CssClass="normal"></asp:Label> </a>
           </ItemTemplate>
                <ItemStyle  CssClass="col_54"  />
            </asp:TemplateField>
               <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                         <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!15!1"%>')"><asp:Label ID="Label114" runat="server" Text='<%# Eval("d_15")%>' CssClass="normal"></asp:Label> </a>
           </ItemTemplate>
                <ItemStyle  CssClass="col_54"  BackColor="#CCCCCC"/>
            </asp:TemplateField>
      



        </Columns>
    </asp:gridview>

            <asp:sqldatasource id="dane_do_tabeli_1" runat="server"
                connectionstring="<%$ ConnectionStrings:wap %>"
                selectcommand="SELECT DISTINCT id_, opis, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15, id_tabeli
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

            <asp:label id="Label19" runat="server"></asp:label>
            <asp:gridview id="GridView2" runat="server" autogeneratecolumns="False"
                datasourceid="dane_do_tabeli2" onrowcreated="grvMergeHeader_RowCreated"
                width="100%" showheader="False">
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

               <asp:TemplateField HeaderText="d_10" SortExpression="d_10">
                  <ItemTemplate>
                       <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!2"%>')"><asp:Label ID="Label211" runat="server" Text='<%# Eval("d_11")%>' CssClass="normal"></asp:Label> </a> 
         

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
                  <ItemStyle  CssClass="t2_d2"  />
            </asp:TemplateField>

                <asp:TemplateField HeaderText="d_11" SortExpression="d_11">
                 <ItemTemplate >
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!14!2"%>')"><asp:Label ID="Label214" runat="server" Text='<%# Eval("d_14")%>' CssClass="normal"></asp:Label> </a> 
             
                    
                                                </ItemTemplate>
                  <ItemStyle  CssClass="t2_d2" />
            </asp:TemplateField>


                   <asp:TemplateField HeaderText="d_11" SortExpression="d_11">
                 <ItemTemplate >
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!15!2"%>')"><asp:Label ID="Label215" runat="server" Text='<%# Eval("d_15")%>' CssClass="normal"></asp:Label> </a> 
             
                    
                                                </ItemTemplate>
                  <ItemStyle  CssClass="t2_d2" BackColor="#CCCCCC"/>
            </asp:TemplateField>

                   <asp:TemplateField HeaderText="d_11" SortExpression="d_11">
                 <ItemTemplate >
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!16!2"%>')"><asp:Label ID="Label216" runat="server" Text='<%# Eval("d_16")%>' CssClass="normal"></asp:Label> </a> 
             
                    
                                                </ItemTemplate>
                  <ItemStyle  CssClass="t2_d2" />
            </asp:TemplateField>


                   <asp:TemplateField HeaderText="d_11" SortExpression="d_11">
                 <ItemTemplate >
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!17!2"%>')"><asp:Label ID="Label217" runat="server" Text='<%# Eval("d_17")%>' CssClass="normal"></asp:Label> </a> 
             
                    
                                                </ItemTemplate>
                  <ItemStyle  CssClass="t2_d2" />
            </asp:TemplateField>

                   <asp:TemplateField HeaderText="d_11" SortExpression="d_11">
                 <ItemTemplate >
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!18!2"%>')"><asp:Label ID="Label218" runat="server" Text='<%# Eval("d_18")%>' CssClass="normal"></asp:Label> </a> 
             
                    
                                                </ItemTemplate>
                  <ItemStyle  CssClass="t2_d2" />
            </asp:TemplateField>




            <asp:TemplateField HeaderText="d_12" SortExpression="d_12">
               
                <ItemTemplate>
                    <asp:TextBox ID="TextBox36" runat="server" Text='<%# Bind("d_19") %>' Width="40px" CssClass="t2_d4"></asp:TextBox>
                </ItemTemplate>
                <ItemStyle  CssClass="t2_d4" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_13" SortExpression="d_13">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("d_20") %>' ></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:TextBox ID="TextBox37" runat="server" Text='<%# Bind("d_13") %>' Width="40px" CssClass="t2_d4"></asp:TextBox>
                </ItemTemplate>
                <ItemStyle  CssClass="t2_d4" />
            </asp:TemplateField>
        </Columns>
    </asp:gridview>
            <asp:sqldatasource id="dane_do_tabeli2" runat="server"
                connectionstring="<%$ ConnectionStrings:wap %>"
                selectcommand="SELECT ROW_NUMBER() OVER( ORDER BY ident ) AS id, ident, imie, nazwisko, funkcja, stanowisko, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15, d_16, d_17, d_18, d_19, d_20, d_21, d_22, sesja, id_sedziego, id_dzialu, id_tabeli FROM tbl_statystyki_tbl_02 WHERE (id_tabeli = 2) AND (id_dzialu = @id_dzialu) ORDER BY id">
        <SelectParameters>
            <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
        </SelectParameters>
    </asp:sqldatasource>
        </div>
        <div id="wyznaczenia" class="page-break">
            &nbsp;<asp:label id="Label17" runat="server"></asp:label>
            <asp:gridview id="GridView3" runat="server" autogeneratecolumns="False"
                datasourceid="tabela_3" onrowcreated="GridView3_RowCreated" width="100%" showheader="False">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
            <ItemStyle Width="15px" />
            </asp:BoundField>
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
              <ItemStyle cssclass="t3_d1"   />
            </asp:TemplateField>
                  <asp:TemplateField HeaderText="d_09" SortExpression="d_09">
                  <ItemTemplate>
                   <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!2"%>')"><asp:Label ID="Label311" runat="server" Text='<%# Eval("d_11")%>' CssClass="normal"></asp:Label> </a> 
     
           </ItemTemplate>
              <ItemStyle cssclass="t3_d1" />
            </asp:TemplateField>

               <asp:TemplateField HeaderText="d_09" SortExpression="d_09">
                  <ItemTemplate>
                   <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!2"%>')"><asp:Label ID="Label312" runat="server" Text='<%# Eval("d_12")%>' CssClass="normal"></asp:Label> </a> 
     
           </ItemTemplate>
              <ItemStyle cssclass="t3_d1" />
            </asp:TemplateField>
 
               <asp:TemplateField HeaderText="d_09" SortExpression="d_09">
                  <ItemTemplate>
                   <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!13!2"%>')"><asp:Label ID="Label313" runat="server" Text='<%# Eval("d_13")%>' CssClass="normal"></asp:Label> </a> 
     
           </ItemTemplate>
              <ItemStyle cssclass="t3_d1" />
            </asp:TemplateField>
               <asp:TemplateField HeaderText="d_09" SortExpression="d_09">
                  <ItemTemplate>
                   <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!14!2"%>')"><asp:Label ID="Label314" runat="server" Text='<%# Eval("d_14")%>' CssClass="normal"></asp:Label> </a> 
     
           </ItemTemplate>
              <ItemStyle cssclass="t3_d1" />
            </asp:TemplateField>
            
               <asp:TemplateField HeaderText="d_09" SortExpression="d_09">
                  <ItemTemplate>
                   <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!15!2"%>')"><asp:Label ID="Label315" runat="server" Text='<%# Eval("d_15")%>' CssClass="normal"></asp:Label> </a> 
     
           </ItemTemplate>
              <ItemStyle cssclass="t3_d1" BackColor="#CCCCCC" />
            </asp:TemplateField>

               <asp:TemplateField HeaderText="d_09" SortExpression="d_09">
                  <ItemTemplate>
                   <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!16!2"%>')"><asp:Label ID="Label316" runat="server" Text='<%# Eval("d_16")%>' CssClass="normal"></asp:Label> </a> 
     
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
    </asp:sqldatasource>
        </div>

        <br />
        <div id="Div1" class="page-break">
            &nbsp;<asp:label id="Label15" runat="server"></asp:label>
            &nbsp;
    &nbsp;
            <asp:gridview id="GridView4" runat="server" autogeneratecolumns="False"
        datasourceid="tabela_4" onrowcreated="GridView4_RowCreated" width="100%" showheader="False">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
            <ItemStyle Width="15px" />
            </asp:BoundField>
            <asp:BoundField DataField="funkcja" HeaderText="funkcja"
                SortExpression="funkcja">
            <ItemStyle cssclass="t4_funkcja" />
            </asp:BoundField>
            <asp:BoundField DataField="stanowisko" HeaderText="stanowisko"
                SortExpression="stanowisko">
            <ItemStyle cssclass="t4_stanowisko" />
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
                    
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')"><asp:Label ID="Label410" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label> </a> 

                
                </ItemTemplate>
                 <ItemStyle cssclass="t4_d1" />
            </asp:TemplateField>

               <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="d_09" SortExpression="d_09">
                <ItemTemplate>
                    
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!2"%>')"><asp:Label ID="Label411" runat="server" Text='<%# Eval("d_11")%>' CssClass="normal"></asp:Label> </a> 

                
                </ItemTemplate>
                 <ItemStyle cssclass="t4_d1" />
            </asp:TemplateField>

               <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="d_09" SortExpression="d_09">
                <ItemTemplate>
                    
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!2"%>')"><asp:Label ID="Label412" runat="server" Text='<%# Eval("d_12")%>' CssClass="normal"></asp:Label> </a> 

                
                </ItemTemplate>
                 <ItemStyle cssclass="t4_d1" />
            </asp:TemplateField>

               <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="d_09" SortExpression="d_09">
                <ItemTemplate>
                    
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!13!2"%>')"><asp:Label ID="Label413" runat="server" Text='<%# Eval("d_13")%>' CssClass="normal"></asp:Label> </a> 

                
                </ItemTemplate>
                 <ItemStyle cssclass="t4_d1" />
            </asp:TemplateField>

               <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="d_09" SortExpression="d_09">
                <ItemTemplate>
                    
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!14!2"%>')"><asp:Label ID="Label414" runat="server" Text='<%# Eval("d_14")%>' CssClass="normal"></asp:Label> </a> 

                
                </ItemTemplate>
                 <ItemStyle cssclass="t4_d1" />
            </asp:TemplateField>


                    <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="d_09" SortExpression="d_09">
                <ItemTemplate>
                    
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!15!2"%>')"><asp:Label ID="Label415" runat="server" Text='<%# Eval("d_15")%>' CssClass="normal"></asp:Label> </a> 

                
                </ItemTemplate>
                 <ItemStyle cssclass="t4_d1" BackColor="#CCCCCC"/>
            </asp:TemplateField>
        </Columns>
    </asp:gridview>
            <asp:sqldatasource id="tabela_4" runat="server"
                connectionstring="<%$ ConnectionStrings:wap %>"
                selectcommand="SELECT ROW_NUMBER() OVER( ORDER BY ident ) AS id, ident, imie, nazwisko, funkcja, stanowisko, id_tabeli, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15, d_16, d_17, d_18, d_19, d_20, d_21, d_22, sesja, id_sedziego FROM tbl_statystyki_tbl_02 WHERE  (id_tabeli = 4) AND (id_dzialu = @id_dzialu) ORDER BY id">
        <SelectParameters>
            <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
        </SelectParameters>
    </asp:sqldatasource>
            Raport statystyczny 
                    <asp:Label ID="Label27" runat="server"></asp:Label>
                &nbsp;Sporzadzone dn.
            <asp:Label ID="Label29" runat="server" Text="Label"></asp:Label>
&nbsp;&nbsp;
            <asp:Label ID="Label28" runat="server" Text="Label"></asp:Label>
&nbsp;<asp:Label ID="Label30" runat="server" Text="Label"></asp:Label>
            <uzytkownik.imie><uzytkownik.nazwisko>
        </div>
        <div id="debag" >
            <asp:label id="Label11" runat="server"></asp:label>
            <br />
        </div>
        

        <br />
        <asp:sqldatasource id="podtabela2" runat="server" connectionstring="<%$ ConnectionStrings:wap %>" selectcommand="SELECT * FROM [glo_grupy_specjalizacji]"></asp:sqldatasource>
    </div>
</asp:Content>