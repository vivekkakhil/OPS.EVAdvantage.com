<%@ Page Language="C#" MasterPageFile="EVAadmin.master" AutoEventWireup="true" CodeFile="veriDetail.aspx.cs"
    Title="Verifier Detail" Inherits="Admin_veriDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link href="http://fonts.cdnfonts.com/css/helvetica-2" rel="stylesheet"/>
        <link href="css/style.css" rel="stylesheet" />
    <style type="text/css">
        .style1
        {
            width: 233px;
        }
        .style2
        {
            width: 233px;
            height: 23px;
        }
        .style3
        {
            height: 23px;
        }
        .style4
        {
            width: 233px;
            height: 9px;
        }
        .style5
        {
            height: 9px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManagerProxy ID="scriptProxy" runat="server">
    </asp:ScriptManagerProxy>
    <asp:UpdatePanel ID="upPanel" runat="server">
        <ContentTemplate>
            <div class="content1">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td>
                            <asp:Label ID="Label18" runat="server" CssClass="label" Text="Please see the verifier detail information below."></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <table cellpadding="0" cellspacing="0" width="100%" class="label">
                    <tr>
                        <td align="left" class="style2">
                            <asp:Label ID="Label34" runat="server" Text="User Name :"></asp:Label>
                        </td>
                        <td class="style3">
                            <asp:Label ID="lblUser" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" class="style2">
                            <asp:Label ID="Label33" runat="server" Text="Password :"></asp:Label>
                        </td>
                        <td class="style3">
                            <asp:Label ID="lblPwd" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" class="style2">
                            <asp:Label ID="Label1" runat="server" Text="First Name :"></asp:Label>
                        </td>
                        <td class="style3">
                            <asp:Label ID="lblfname" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" class="style2">
                            <asp:Label ID="Label2" runat="server" Text="Last Name :"></asp:Label>
                        </td>
                        <td class="style3">
                            <asp:Label ID="lbllname" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" class="style2">
                            <asp:Label ID="Label3" runat="server" Text="Company Name :"></asp:Label>
                        </td>
                        <td class="style3">
                            <asp:Label ID="lblcname" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" class="style2">
                            <asp:Label ID="Label4" runat="server" Text="Company Address :"></asp:Label>
                        </td>
                        <td class="style3">
                            <asp:Label ID="lblcadd" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" class="style2">
                            <asp:Label ID="Label6" runat="server" Text="City :"></asp:Label>
                        </td>
                        <td class="style3">
                            <asp:Label ID="lblcity" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" class="style2">
                            <asp:Label ID="Label7" runat="server" Text="State :"></asp:Label>
                        </td>
                        <td class="style3">
                            <asp:Label ID="lblstate" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" class="style2">
                            <asp:Label ID="Label19" runat="server" Text="Zip Code :"></asp:Label>
                        </td>
                        <td class="style3">
                            <asp:Label ID="lblzip" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" class="style2">
                            <asp:Label ID="Label21" runat="server" Text="Country :"></asp:Label>
                        </td>
                        <td class="style3">
                            <asp:Label ID="lblcountry" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" class="style2">
                            <asp:Label ID="Label23" runat="server" Text="Work Telephone :"></asp:Label>
                        </td>
                        <td class="style3">
                            <asp:Label ID="lblphone" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" class="style2">
                            <asp:Label ID="Label25" runat="server" Text="Work Fax :"></asp:Label>
                        </td>
                        <td class="style3">
                            <asp:Label ID="lblfax" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" class="style2">
                            <asp:Label ID="Label27" runat="server" Text="Work Email :"></asp:Label>
                        </td>
                        <td class="style3">
                            <asp:Label ID="lblemail" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr id="trBusi" runat="server">
                        <td align="left" class="style2">
                            <asp:Label ID="Label29" runat="server" Text="Type Of Business :"></asp:Label>
                        </td>
                        <td class="style3">
                            <asp:Label ID="lblbusiness" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" class="style4" style="white-space: nowrap;">
                         <asp:Label ID="Label5" runat="server" Text="Employee's Company Name to be Verified : "></asp:Label>
                        </td>
                        <td class="style5">
                            <asp:Label ID="lblEmployeeCompany" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr id="trReason" runat="server">
                        <td align="left" class="style2" valign="top">
                            <asp:Label ID="Label31" runat="server" Text="Reason(s) for Obtaining Verification :"></asp:Label>
                        </td>
                        <td class="style3" valign="top">
                            <asp:Label ID="lblreason" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                        </td>
                        <td class="style3">
                        </td>
                    </tr>
                    <tr>
                        <td class="style1" valign="top">
                            <div style="float: left;">
                                <asp:Label ID="Label32" runat="server" Text="Activate?"></asp:Label>
                            </div>
                            <div style="float: right; vertical-align: top; padding-right: 20px;">
                                <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                                    <ProgressTemplate>
                                        <div align="center" style="margin-top: 13px;">
                                            <img src='<%=ResolveUrl("~/Images/simple.gif")%>' alt="" />
                                            <span class="updateProgressMessage">Loading ...</span>
                                        </div>
                                    </ProgressTemplate>
                                </asp:UpdateProgress>
                            </div>
                        </td>
                        <td>
                            <asp:Button ID="btnYes" runat="server" OnClick="btnYes_Click" Text="Yes" Width="60px" />
                            &nbsp;<asp:Button ID="btnNo" runat="server" OnClick="btnNo_Click" Text="No" Width="60px" />
                            &nbsp;<asp:Button ID="btnClose" runat="server" OnClick="btnClose_Click" Text="Cancel"
                                Font-Names="Verdana,Arial,Helvetica,sans-serif" Font-Size="Small" Width="60px" />
                        </td>
                    </tr>
                </table>
                <div class="clear">
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
