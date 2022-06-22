<%@ Page Language="C#" MasterPageFile="~/EVA.master" AutoEventWireup="true" CodeFile="services.aspx.cs" Inherits="services" Title="Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="style.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">.
<asp:ScriptManagerProxy ID="scriptProxy" runat="server">
    </asp:ScriptManagerProxy>
    <asp:UpdatePanel ID="upPanel" runat="server">
        <ContentTemplate><div class="content"> <b>Welcome To EVAdvantage</b><br />
    <br />
    EVAdvantage provides verification of employment and salary history, via this secure website, to lenders, creditors, employers, and Federal/State agencies.<br />
    <br />
    Three types of verifications are available:
    <ul>
      <li>Basic verification, including name, job title, dates of employment, and current status (active or separated)</li>
      <li>Complete verification, which includes name, job title, dates of employment, current status (active or separated), and payroll data (pay frequency, gross earnings for the year to date and the past 2 years)</li>
      <li>Health & Social Services verification</li>
    </ul>
    This service enables employers to save hours of HR time compiling employee information and saves time for both employees and organizations needing to verify employment.
	<br />
	<br />
	<a href="verifiers.aspx"><img src="images/viewDemo.gif" border="0" /></a>
    <div class="clear"></div>
  </div></ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

