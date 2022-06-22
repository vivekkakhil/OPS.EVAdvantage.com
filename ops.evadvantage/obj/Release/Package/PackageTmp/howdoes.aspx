<%@ Page Language="C#" MasterPageFile="~/EVA.master" AutoEventWireup="true" CodeFile="howdoes.aspx.cs" Inherits="howdoes" Title="How does it work?" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="style.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:ScriptManagerProxy ID="scriptProxy" runat="server">
    </asp:ScriptManagerProxy>
    <asp:UpdatePanel ID="upPanel" runat="server">
        <ContentTemplate><div class="content"> 
		<b>How it works: The Verification Process Step by Step<b/>
    <img src="images/v2.gif" width="780" height="568" border="0" />
    <div class="clear"></div>
</div> </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

