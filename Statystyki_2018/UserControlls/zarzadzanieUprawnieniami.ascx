<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="zarzadzanieUprawnieniami.ascx.cs" Inherits="stat2018.UserControlls.zarzadzanieUprawnieniami" %>
<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<link href="../style/Tables.css" rel="stylesheet" />
  <script type="text/javascript">
        var lastCountry = null;
      function OnCountryChanged(CBRodzaje) {
        

            if (CBListaFormularzy.InCallback())
                lastCountry = CBRodzaje.GetValue().toString();

            else
                CBListaFormularzy.PerformCallback(CBRodzaje.GetValue().toString());
        }
        function OnEndCallback(s, e) {
            if (lastCountry) {
                CBListaFormularzy.PerformCallback(lastCountry);
                lastCountry = null;
            }
        }
    </script>
<div style="display:flex">
    <div style="width:20%"><dx:ASPxComboBox ID="CBRodzaje" runat="server" Theme="Moderno" DataSourceID="rodzaje" IncrementalFilteringMode="StartsWith"
                                    TextField="nazwa" ValueField="ident" EnableSynchronization="False">
     <ClientSideEvents SelectedIndexChanged="function(s, e) { OnCountryChanged(s); }" />
</dx:ASPxComboBox></div>
    <div style="width:20%"><dx:ASPxComboBox ID="CBListaFormularzy" runat="server" ClientInstanceName="CBListaFormularzy" IncrementalFilteringMode="StartsWith" EnableSynchronization="False"  TextField="nazwa" ValueField="ident" OnCallback="CBListaFormularzy_Callback" Theme="Moderno">
    <ClientSideEvents EndCallback=" OnEndCallback" />
</dx:ASPxComboBox></div>
<div style="width:20%">
    <dx:ASPxButton ID="ASPxButton3" runat="server" Text="Dodaj uprawnienia" Theme="Moderno">
    </dx:ASPxButton>
    </div>
<div style="width:20%">
    <dx:ASPxButton ID="ASPxButton2" runat="server" Text="Usuń uprawnienia" Theme="Moderno">
    </dx:ASPxButton>
   
    </div>


</div>

<asp:SqlDataSource ID="rodzaje" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="SELECT DISTINCT ident ,nazwa FROM [rodzaje] ORDER BY [nazwa]"></asp:SqlDataSource>
