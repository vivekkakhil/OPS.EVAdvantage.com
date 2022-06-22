<%@ Page Language="C#" MasterPageFile="~/EVA.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="contact" Title="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="style.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:ScriptManagerProxy ID="scriptProxy" runat="server">
    </asp:ScriptManagerProxy>
    <asp:UpdatePanel ID="upPanel" runat="server">
        <ContentTemplate>
<div class="content"> <b>Contact Us</b><br/>
    <br/>
    Thank you for visiting our site. We look forward to providing you with the expertise, service and strategies you need to avoid costly pitfalls and focus on achieving your core business goals.<br/>
    <br/>
    We're easy to reach, and available to answer your questions:<br/>
    <br/>
    <strong>Mailing Address:</strong><br/>
    <%--P.O. Box 2068<br/>
    Mission Viejo, CA 92690<br/>--%>
92 Argonaut, Suite 260<br/>
Aliso Viejo, CA 92656<br/>

    <br/>
    <%--P: 949.276.7750<br/>
    F: 949.276.7753<br/>
    P: 866-569-0343 x311<br/>--%>
    P: 877-783-0240<br/>
    F: 866-710-3846<br/>
    <br/>
    <strong>Email us at:</strong><br/>
    <a href="mailto:gacosta@ucadvantage.net">gacosta@ucadvantage.net</a>
    <div class="clear"></div>
  </div></ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>