<%@ Page Title="" Language="C#" MasterPageFile="EVAadmin.master" AutoEventWireup="true"
    CodeFile="Exception.aspx.cs" Inherits="Admin_Exception" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../style.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style7
        {
            width: 170px;
        }
        .style8
        {
            height: 26px;
            width: 170px;
        }
        .style9
        {
            width: 170px;
            height: 3px;
        }
        .style10
        {
            height: 11px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManagerProxy ID="scriptProxy" runat="server">
    </asp:ScriptManagerProxy>
    <asp:UpdatePanel ID="upPanel" runat="server">
        <ContentTemplate>
            <div class="content1">
                <table cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td>
                            <asp:Label ID="Label16" runat="server" CssClass="label" Text="View / Add / Edit Exceptions for a Compay."></asp:Label>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label18" runat="server" Font-Bold="True" ForeColor="Red" Text="*"></asp:Label>
                            <asp:Label ID="Label17" runat="server" Text="Marked fields are mandatory." Font-Italic="True"></asp:Label>
                        </td>
                    </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                    <tr>
                        <td class="style8" colspan="2">
                            <asp:Label ID="lblErrorMessage" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" class="style7">
                            <asp:Label ID="Label19" runat="server" Font-Bold="True" ForeColor="Red" Text="*"></asp:Label>
                            <asp:Label ID="Label1" runat="server" Text="Client :"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:DropDownList ID="ddlClient" runat="server" CssClass="textbox" AutoPostBack="true"
                                Width="405px" onselectedindexchanged="ddlClient_SelectedIndexChanged">
                            </asp:DropDownList>
                            
                        </td>
                    </tr>
                    <tr>
                        <td align="left" class="style9">
                        </td>
                        <td align="left" class="style10">
                        </td>
                    </tr>
                    <tr>
                        <td align="left" class="style7" valign="top">
                            <asp:Label ID="Label24" runat="server" Font-Bold="True" ForeColor="Red" Text="*"></asp:Label>
                            <asp:Label ID="Label23" runat="server" Text="Exceptions :"></asp:Label>
                        </td>
                        <td align="left" valign="top">
                            <asp:TextBox ID="txtException" TextMode="MultiLine" runat="server" Height="324px" Width="623px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" class="style9">
                        </td>
                        <td align="left" class="style10">
                        </td>
                    </tr>
                    <tr>
                        <td align="left" class="style7">
                            &nbsp;
                        </td>
                        <td align="left">
                            <asp:Button ID="btnSave" runat="server" Text="Save" Width="57px" OnClick="btnSave_Click" />
                            &nbsp;<asp:Button ID="btnClear" runat="server" OnClick="btnClear_Click" Text="Clear"
                                CausesValidation="false" Width="57px" />
                        </td>
                    </tr>
                </table>
                <div class="clear">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                        ShowSummary="False" Style="margin-left: 0px" />
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
