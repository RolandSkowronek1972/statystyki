<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="otrkd.aspx.cs" Inherits="stat2018.otrkd" MaintainScrollPositionOnPostback="true" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="Scripts/rls.js"></script>


<ajaxToolkit:ToolkitScriptManager runat="Server" EnableScriptGlobalization="true"
        EnableScriptLocalization="true" ID="ScriptManager1" />
    <div class="dataBar"> 

    <div class="noprint" >
      <div  class="manu_back">
                  
        <table class="tbl_manu">

        <tr>
            <td style="width:350px;">&nbsp;<asp:Label ID="Label4" runat="server" Text="Proszę wybrać zakres:"></asp:Label>
                <asp:textbox runat="server" ID="Date1"  ReadOnly="False" EnableViewState="False" ViewStateMode="Enabled" Width="75px"></asp:textbox>     
                <ajaxToolkit:CalendarExtender ID="Date1_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="Date1" ViewStateMode="Enabled">
                </ajaxToolkit:CalendarExtender>

                      <asp:TextBox runat="server" ID="Date2" ReadOnly="False" EnableViewState="False" Width="75px" />
                      
        <ajaxToolkit:CalendarExtender ID="Date2ButtonExtender" runat="server" TargetControlID="Date2"   Enabled="True" ViewStateMode="Enabled"      />

            </td>
            <td >
                <asp:LinkButton ID="LinkButton54" runat="server" class="ax_box" OnClick="LinkButton54_Click">  Odśwież</asp:LinkButton>
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
   <div style="width:1150px; margin: 0 auto 0 auto; position:relative;top:60px;" >
     
    <div id="wyznaczenia2" > 
    		   <asp:Label ID="Label3" runat="server" Text="Sąd " style="font-weight: 700"></asp:Label>   
         <br />
    
  <asp:label runat="server" ID="id_dzialu" Visible="False"></asp:label>
         <br />
         <asp:Label ID="Label406" runat="server"></asp:Label>
         <br />
&nbsp;Uwaga: standardy wg Rozporządzenia MS z dnia 9 czerwca 2003r ( Dz. U. Nr 116 poz. 1100)<asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
        DataSourceID="tabela_3" onrowcreated="GridView3_RowCreated" Width="100%" ShowHeader="False" ShowFooter="True" OnRowDataBound="GridView3_RowDataBound">
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
              <ItemStyle cssclass="col_90" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_02" SortExpression="d_02">
               
                <ItemTemplate>
               <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')"><asp:Label ID="Label202" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label> </a> 
                </ItemTemplate>
              <ItemStyle cssclass="col_90" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_03" SortExpression="d_03">
              
                <ItemTemplate>
                       <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')"><asp:Label ID="Label203" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label> </a> 
             
                </ItemTemplate>
              <ItemStyle cssclass="col_90" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
               
                <ItemTemplate>
                       <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')"><asp:Label ID="Label204" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label> </a> 
             
                </ItemTemplate>
              <ItemStyle cssclass="col_90" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
                <ItemTemplate>
                       <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')"><asp:Label ID="Label205" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label> </a> 
             
                </ItemTemplate>
              <ItemStyle cssclass="col_90" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')"><asp:Label ID="Label206" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label> </a> 
             
                </ItemTemplate>
              <ItemStyle cssclass="col_90" />
            </asp:TemplateField>
      <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                       <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')"><asp:Label ID="Label207" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label> </a> 
             
                </ItemTemplate>
              <ItemStyle cssclass="col_90" />
            </asp:TemplateField>
             <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')"><asp:Label ID="Label208" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label> </a> 
             
                </ItemTemplate>
              <ItemStyle cssclass="col_90" />
            </asp:TemplateField>
              <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')"><asp:Label ID="Label209" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label> </a> 
             
                </ItemTemplate>
              <ItemStyle cssclass="col_90" />
            </asp:TemplateField>
          
                   <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')"><asp:Label ID="Label210" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label> </a> 
             
                </ItemTemplate>
              <ItemStyle cssclass="col_90" />
            </asp:TemplateField>
       
                   <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!2"%>')"><asp:Label ID="Label211" runat="server" Text='<%# Eval("d_11")%>' CssClass="normal"></asp:Label> </a> 
             
                </ItemTemplate>
              <ItemStyle cssclass="col_90" />
            </asp:TemplateField>
       
              <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!2"%>')"><asp:Label ID="Label212" runat="server" Text='<%# Eval("d_12")%>' CssClass="normal"></asp:Label> </a> 
             
                </ItemTemplate>
              <ItemStyle cssclass="col_90" />
            </asp:TemplateField>
             <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!13!2"%>')"><asp:Label ID="Label213" runat="server" Text='<%# Eval("d_13")%>' CssClass="normal"></asp:Label> </a> 
             
                </ItemTemplate>
              <ItemStyle cssclass="col_90" />
            </asp:TemplateField>
             <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!14!2"%>')"><asp:Label ID="Label214" runat="server" Text='<%# Eval("d_14")%>' CssClass="normal"></asp:Label> </a> 
             
                </ItemTemplate>
              <ItemStyle cssclass="col_90" />
            </asp:TemplateField>
             <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                      <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!15!2"%>')"><asp:Label ID="Label215" runat="server" Text='<%# Eval("d_15")%>' CssClass="normal"></asp:Label> </a> 
             
                </ItemTemplate>
              <ItemStyle cssclass="col_90" />
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="Silver" HorizontalAlign="Center" />
        <RowStyle Height="25px" />


    </asp:GridView>
    <asp:SqlDataSource ID="tabela_3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:wap %>" 
        
        SelectCommand="SELECT ROW_NUMBER() OVER( ORDER BY ident ) AS id,  ident, imie, nazwisko,  d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15, d_16, d_17, d_18, d_19, d_20, d_21, d_22, sesja, id_sedziego, id_dzialu, id_tabeli FROM tbl_statystyki_tbl_02 WHERE (id_tabeli =2) AND (id_dzialu = @id_dzialu) ORDER BY id">
        <SelectParameters>
            <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
        </SelectParameters>
    </asp:SqlDataSource>
        <br />
       
        </div>
    <div id="zalatwienia1"  class="page-break"> 
        <br />
    
        <asp:Label ID="Label3x" runat="server" Text="Sąd " style="font-weight: 700"></asp:Label>   
     <br />

    <asp:Label ID="Label19" runat="server"></asp:Label>
         <br />
&nbsp;Uwaga: standardy wg Rozporządzenia MS z dnia 9 czerwca 2003r ( Dz. U. Nr 116 poz. 1100)<br />
       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="statystyki" OnRowCreated="grvMergeHeader_RowCreated" 
        Width="100%" ShowHeader="False" OnRowDataBound="make_footer" ShowFooter="True">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
            <ItemStyle Width="15px" HorizontalAlign="Center" />
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
             
                   <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')"><asp:Label ID="Label301" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label> </a> 
             
                </ItemTemplate>
                <ItemStyle  CssClass="col_198" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_02" SortExpression="d_02">
                
                <ItemTemplate>
                  <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')"><asp:Label ID="Label302" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label> </a> 
                 
                 </ItemTemplate>
                  <ItemStyle  CssClass="col_198" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_03" SortExpression="d_03">
                
                <ItemTemplate>
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')"><asp:Label ID="Label303" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label> </a> 
                </ItemTemplate>
                  <ItemStyle  CssClass="col_198" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
                
                <ItemTemplate>
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')"><asp:Label ID="Label304" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label> </a> 
                 
             
                </ItemTemplate>
                  <ItemStyle  CssClass="col_198" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
               
                <ItemTemplate>
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')"><asp:Label ID="Label305" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label> </a> 
                 
                </ItemTemplate>
                  <ItemStyle  CssClass="col_198" />
            </asp:TemplateField>
          
        
        </Columns>
           <FooterStyle BackColor="Silver" HorizontalAlign="Center" />
    </asp:GridView>
    <asp:SqlDataSource ID="statystyki" runat="server" 
        ConnectionString="<%$ ConnectionStrings:wap %>" 
        
        SelectCommand="SELECT ROW_NUMBER() OVER( ORDER BY ident ) AS id, ident, imie, nazwisko,  d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15, d_16, d_17, d_18, d_19, d_20, d_21, d_22, sesja, id_sedziego, id_dzialu, id_tabeli FROM tbl_statystyki_tbl_02 WHERE (id_tabeli = 3) AND (id_dzialu = @id_dzialu) ORDER BY id">
        <SelectParameters>
            <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
       </div>
    <div id="zalatwienia"  class="page-break"> 
    <br />
    <asp:Label ID="Label5" runat="server" Text="Sąd " style="font-weight: 700"></asp:Label>   
     
        <br />

    <asp:Label ID="Label2" runat="server"></asp:Label>
         <br />
&nbsp;Uwaga: standardy wg Rozporządzenia MS z dnia 9 czerwca 2003r ( Dz. U. Nr 116 poz. 1100)<br />
       <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
        DataSourceID="tabela_4" OnRowCreated="grvMergeHeader_RowCreated2" 
        Width="100%" ShowHeader="False" OnRowDataBound="makeFooter2" ShowFooter="True">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
            <ItemStyle Width="15px" HorizontalAlign="Center" />
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
                    
                 <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')"><asp:Label ID="Label401" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label> </a> 
                </ItemTemplate>
                <ItemStyle  CssClass="col_198" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_02" SortExpression="d_02">
                
                <ItemTemplate>
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')"><asp:Label ID="Label402" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label> </a> 
                 
                 </ItemTemplate>
                  <ItemStyle  CssClass="col_198" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_03" SortExpression="d_03">
                
                <ItemTemplate>
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')"><asp:Label ID="Label403" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label> </a> 
                </ItemTemplate>
                  <ItemStyle  CssClass="col_198" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
                
                <ItemTemplate>
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')"><asp:Label ID="Label404" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label> </a>                 </ItemTemplate>
                  <ItemStyle  CssClass="col_198" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
               
                <ItemTemplate>
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')"><asp:Label ID="Label405" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label> </a> 
                 
                </ItemTemplate>
                  <ItemStyle  CssClass="col_198" />
            </asp:TemplateField>
          
        
       


        </Columns>
           <FooterStyle BackColor="Silver" HorizontalAlign="Center" />
    </asp:GridView>
       <br />
    <asp:SqlDataSource ID="tabela_4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:wap %>" 
        
        SelectCommand="SELECT ROW_NUMBER() OVER( ORDER BY ident ) AS id, ident, imie, nazwisko,  d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15, d_16, d_17, d_18, d_19, d_20, d_21, d_22, sesja, id_sedziego, id_dzialu, id_tabeli FROM tbl_statystyki_tbl_02 WHERE (id_tabeli = 4) AND (id_dzialu = @id_dzialu) ORDER BY id">
        <SelectParameters>
            <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
         <strong>Ku.Wiz.3/06 – DWOiP-III-531-1/06 z dn.10.01.2006r. <br />
         Liczba wywiadów środowiskowych po terminie - 0<br />
         lub zlecone uzupełnienie -0
         <br />
         Sygnatury spraw:................................................
         <br />
         (**) w tym płatne Kierownik Zespołu
         <br />
&nbsp;&nbsp;&nbsp; </strong>* przebywa na urlopie macierzyńskim.<br /> 
 </div>


            <div id="debag" >
          <br />
       </div>
     <div id="raport"  class="page-break">
        
    <asp:Label ID="Label11" runat="server"></asp:Label>
   
        </div>
    
 
  
 
</div>
    </asp:Content>

