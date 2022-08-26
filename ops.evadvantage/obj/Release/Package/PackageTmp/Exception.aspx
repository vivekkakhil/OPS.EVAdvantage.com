<%@ Page Title="" Language="C#" MasterPageFile="EVAadmin.master" AutoEventWireup="true"
    CodeFile="Exception.aspx.cs" Inherits="Admin_Exception" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
   <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link href="http://fonts.cdnfonts.com/css/helvetica-2" rel="stylesheet"/>
        <link href="css/style.css" rel="stylesheet" />
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
             <section class="loginPage">

                <div class="container">

                    <div class="formInner2">
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
                                onselectedindexchanged="ddlClient_SelectedIndexChanged">
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
                            <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                            &nbsp;<asp:Button ID="btnClear" runat="server" OnClick="btnClear_Click" Text="Clear"
                                CausesValidation="false"  />
                        </td>
                    </tr>
                </table>
                <div class="clear">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                        ShowSummary="False" Style="margin-left: 0px" />
                </div>
            </div>
                        </div>
                    </div>
                 </section>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
