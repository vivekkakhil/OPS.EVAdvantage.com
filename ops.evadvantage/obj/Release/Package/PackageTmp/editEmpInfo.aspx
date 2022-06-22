<%@ Page Language="C#" MasterPageFile="~/EVA.master" AutoEventWireup="true" CodeFile="editEmpInfo.aspx.cs" Inherits="editEmpInfo" Title="Edit Employee information" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
<style type="text/css">
        .style9
    {
        width: 150px;
    }
    </style>
    <link href="dhtmlgoodies_calendar.css" rel="stylesheet" type="text/css" />
    <link href="style.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:ScriptManagerProxy ID="scriptProxy" runat="server">
    </asp:ScriptManagerProxy>
    <asp:UpdatePanel ID="upPanel" runat="server">
        <ContentTemplate>
            <div class="content">
             <table cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td >
                            <asp:Label ID="Label16" runat="server" 
                                Text="You can update following account information."  CssClass="label"
                               ></asp:Label>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label18" runat="server" Font-Bold="True" ForeColor="Red" 
                                Text="*"></asp:Label>
                            <asp:Label ID="Label17" runat="server" 
                                Text="Marked fields are mandatory." Font-Italic="True"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" >
                            <hr style="width: 798px" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td align="right">
                            &nbsp;</td>
                    </tr>
                </table>
    <table cellpadding="0" cellspacing="0" width="100%">
        
        <tr>
            <td align="left"  colspan="2">
            </td>
        </tr>
        <%--<tr>
            <td align="left" class="style9">
                <asp:Label ID="Label15" runat="server" Font-Bold="True" ForeColor="Red" 
                    Text="*"></asp:Label>
                <asp:Label ID="Label2" runat="server" Text="Social Security # :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSSN" runat="server" Width="126px" CssClass="textbox"></asp:TextBox>
                <asp:Label ID="Label19" runat="server" Text="(###-##-####)"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtSSN" ErrorMessage="Please enter Social Security #." 
                    Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                    ControlToValidate="txtSSN" Display="Dynamic" 
                    ErrorMessage="Please enter proper SSN." 
                    ValidationExpression="\d{3}-\d{2}-\d{4}">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td align="left" class="style9">
                <asp:Label ID="Label9" runat="server" Font-Bold="True" ForeColor="Red" Text="*"></asp:Label>
                <asp:Label ID="Label3" runat="server" Text="Company Code :"></asp:Label>
            </td>
            <td >
                <asp:DropDownList ID="ddlCompany" runat="server" Height="27px" Width="370px" 
                    CssClass="textbox">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="ddlCompany" ErrorMessage="Please select Company Code" 
                    InitialValue="0" Display="Dynamic">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="left" class="style9">
                <asp:Label ID="Label10" runat="server" Font-Bold="True" ForeColor="Red" 
                    Text="*"></asp:Label>
                <asp:Label ID="Label4" runat="server" Text="Date Of Birth :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDate" runat="server" CssClass="textbox" Enabled="False"></asp:TextBox><img  alt="date" 
                    src="images/calendar.gif" 
                    onclick="displayCalendar(document.forms[0].ctl00_ContentPlaceHolder1_txtDate,'mm/dd/yyyy',this)" 
                    id="btnStartDate" /><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtDate" Display="Dynamic"
                            ErrorMessage="Please enter proper date." Font-Bold="True" ValidationExpression="(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d">*</asp:RegularExpressionValidator>
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="txtDate" ErrorMessage="Please select date.">*</asp:RequiredFieldValidator>
                
                </td>
        </tr>--%>
        <tr>
            <td align="left" class="style9">
                &nbsp;&nbsp;
                <asp:Label ID="Label1" runat="server" Text="Company Name :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtCompany" runat="server" CssClass="textbox" ReadOnly="true" 
                    Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="left" class="style9">
                &nbsp;&nbsp;
                <asp:Label ID="Label19" runat="server" Text="Social Security # :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSSN" runat="server" CssClass="textbox" Enabled="False" 
                    Width="158px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="left" class="style9">
                &nbsp;&nbsp;
                <asp:Label ID="Label20" runat="server" Text="Date Of Birth :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDate" runat="server" CssClass="textbox" Enabled="False" 
                    Width="158px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="left" class="style9">
                <asp:Label ID="Label11" runat="server" Font-Bold="True" ForeColor="Red" 
                    Text="*"></asp:Label>
                <asp:Label ID="Label5" runat="server" Text="E-Mail :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="textbox" Width="158px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="Please enter email address.">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="Please enter valid email." 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td align="left" class="style9" >
                <asp:Label ID="Label13" runat="server" Font-Bold="True" ForeColor="Red" 
                    Text="*"></asp:Label>
                <asp:Label ID="Label7" runat="server" Text="Password :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" Width="158px" 
                    CssClass="textbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="txtPwd" ErrorMessage="Please enter password.">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                    ControlToValidate="txtPwd" 
                    ErrorMessage="Password must be at least 10 characters,must contain at least one lower case letter, one upper case letter, one digit and one special character.Valid special characters (which are configurable) are -   @#$%^&amp;+=!" 
                    ValidationExpression="^.*(?=.{10,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&amp;+=!]).*$">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style9"   >
                &nbsp;</td>
            <td>
                <asp:Button ID="btnUpdate" runat="server" Text="Update" 
                    onclick="btnUpdate_Click" />
                &nbsp;<asp:Button ID="btnClear" runat="server" CausesValidation="False" 
                    onclick="btnClear_Click" Text="Clear" Width="56px" />
                &nbsp;<asp:Button ID="btnCancel" runat="server" Text="Cancel" 
                    CausesValidation="False" onclick="btnCancel_Click" />
            </td>
        </tr>
       
    </table>
            <div class="clear">
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    ShowMessageBox="True" ShowSummary="False" style="margin-left: 0px" />
            </div></div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

