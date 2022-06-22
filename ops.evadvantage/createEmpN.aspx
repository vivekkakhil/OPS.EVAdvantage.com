<%@ Page Title="" Language="C#" MasterPageFile="~/Login.master" AutoEventWireup="true"
    CodeFile="createEmpN.aspx.cs" Inherits="createEmpN" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
        }
        .style4
        {
            width: 100%;
            height: 29px;
        }
        .style5
        {
            width: 171px;
        }
        .style6
        {
        }
    </style>
    <link href="css/dhtmlgoodies_calendar.css" rel="stylesheet" type="text/css" />
    <link href="style.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManagerProxy ID="scriptProxy" runat="server">
    </asp:ScriptManagerProxy>
    <asp:UpdatePanel ID="upPanel" runat="server">
        <contenttemplate><div class="content" align="left"> 
   <table cellpadding="0" cellspacing="0" class="style4">
   <tr>
   <td colspan="2" style="padding-top: 10px; padding-bottom: 30px;"><h3>
        Create Employee:</h3>
   </td>
   </tr>
                    <tr>
                        <td class="style6">
                            <asp:Label ID="Label16" runat="server" 
                                Text="Please fill up the following information to activate your account." 
                                 CssClass="label"></asp:Label>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label18" runat="server" Font-Bold="True" ForeColor="Red" 
                                Text="*"></asp:Label>
                            <asp:Label ID="Label17" runat="server" 
                                Text="Marked fields are mandatory." Font-Italic="True"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6" colspan="2">
                            <hr style="width: 798px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style6" colspan="2">
                            &nbsp;</td>
                    </tr>
                </table>
    <table cellpadding="0" cellspacing="0" width="100%">
        
        <tr>
            <td align="left" class="style1" colspan="2">
            </td>
        </tr>
        <tr>
            <td align="left" class="style5">
                <asp:Label ID="Label15" runat="server" Font-Bold="True" ForeColor="Red" 
                    Text="*"></asp:Label>
                <asp:Label ID="Label1" runat="server" Text="Social Security # :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSSN" runat="server" Width="126px" CssClass="textbox"></asp:TextBox>
                <%--<asp:Label ID="Label19" runat="server" Text="(###-##-####)"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtSSN" ErrorMessage="Please enter Social Security #." 
                    Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                    ControlToValidate="txtSSN" Display="Dynamic" 
                    ErrorMessage="Please enter proper SSN." 
                    ValidationExpression="\d{3}-\d{2}-\d{4}">*</asp:RegularExpressionValidator>--%>
                <asp:Label ID="Label19" runat="server" Text="(#########)"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtSSN" ErrorMessage="Please enter Social Security #." 
                    Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                    ControlToValidate="txtSSN" Display="Dynamic" 
                    ErrorMessage="Please enter proper SSN." 
                    ValidationExpression="\d{3}\d{2}\d{4}">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td align="left"  >
                <asp:Label ID="Label9" runat="server" Font-Bold="True" ForeColor="Red" Text="*"></asp:Label>
                <asp:Label ID="Label2" runat="server" Text="Company Code :"></asp:Label>
            </td>
            <td >
                <asp:DropDownList ID="ddlCompany" runat="server" Height="26px" Width="370px" 
                    CssClass="textbox">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="ddlCompany" ErrorMessage="Please select Company Code" 
                    InitialValue="0" Display="Dynamic">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="left" >
                <asp:Label ID="Label10" runat="server" Font-Bold="True" ForeColor="Red" 
                    Text="*"></asp:Label>
                <asp:Label ID="Label3" runat="server" Text="Date Of Birth :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDate" runat="server" CssClass="textbox" Enabled="False"></asp:TextBox><img  alt="date" src="images/calendar.gif" onclick="displayCalendar(document.getElementById('ctl00_ContentPlaceHolder1_txtDate'),'mm/dd/yyyy',this)" id="btnStartDate" /><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtDate" Display="Dynamic"
                            ErrorMessage="Please enter proper date." Font-Bold="True" ValidationExpression="(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d">*</asp:RegularExpressionValidator>
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="txtDate" ErrorMessage="Please select date.">*</asp:RequiredFieldValidator>
                
                </td>
        </tr>
        <tr>
            <td align="left"  >
                <asp:Label ID="Label11" runat="server" Font-Bold="True" ForeColor="Red" 
                    Text="*"></asp:Label>
                <asp:Label ID="Label4" runat="server" Text="E-Mail :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" Width="158px" CssClass="textbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="Please enter email address.">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="Please enter valid email." 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td align="left" >
                <asp:Label ID="Label12" runat="server" Font-Bold="True" ForeColor="Red" 
                    Text="*"></asp:Label>
                <asp:Label ID="Label5" runat="server" Text="User Name :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtUser" runat="server" Width="158px" CssClass="textbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="txtUser" ErrorMessage="Please enter username.">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="left" >
                <asp:Label ID="Label13" runat="server" Font-Bold="True" ForeColor="Red" 
                    Text="*"></asp:Label>
                <asp:Label ID="Label6" runat="server" Text="Password :"></asp:Label>
            </td>
            <td>
                <%--<asp:TextBox ToolTip="Password must be at least 10 characters,must contain at least one lower case letter, one upper case letter, one digit and one special character.Valid special characters (which are configurable) are -   @#$%^&amp;+=!"
                 runat="server" ID="txtPwd" TextMode="Password" Width="158px" CssClass="textbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="txtPwd" ErrorMessage="Please enter password.">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                    ControlToValidate="txtPwd" 
                    ErrorMessage="Password must be at least 10 characters,must contain at least one lower case letter, one upper case letter, one digit and one special character.Valid special characters (which are configurable) are -   @#$%^&amp;+=!" 
                    ValidationExpression="^.*(?=.{10,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&amp;+=!]).*$">*</asp:RegularExpressionValidator>--%>
                <asp:TextBox ToolTip="Password must be at least 7 characters,must contain at least one lower case letter, one upper case letter, one digit and one special character.Valid special characters (which are configurable) are -   @#$%^&amp;+=!"
                 runat="server" ID="txtPwd" TextMode="Password" Width="158px" CssClass="textbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="txtPwd" ErrorMessage="Please enter password.">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                    ControlToValidate="txtPwd" 
                    ErrorMessage="Password must be at least 10 characters,must contain at least one lower case letter, one upper case letter, one digit and one special character.Valid special characters (which are configurable) are -   @#$%^&amp;+=!" 
                    ValidationExpression="^.*(?=.{7,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&amp;+=!]).*$">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td align="left" >
                <asp:Label ID="Label14" runat="server" Font-Bold="True" ForeColor="Red" 
                    Text="*"></asp:Label>
                <asp:Label ID="Label7" runat="server" Text="Re-Type Password :"></asp:Label>
            </td>
            <td>
                <%--<asp:TextBox ToolTip="Password must be at least 10 characters,must contain at least one lower case letter, one upper case letter, one digit and one special character.Valid special characters (which are configurable) are -   @#$%^&amp;+=!"
                ID="txtRePwd" runat="server" TextMode="Password" Width="158px" CssClass="textbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="txtRePwd" ErrorMessage="Please Re-Type password.">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="txtPwd" ControlToValidate="txtRePwd" 
                    ErrorMessage="Password and Re-Type password should be same.">*</asp:CompareValidator>--%>
                <asp:TextBox ToolTip="Password must be at least 7 characters,must contain at least one lower case letter, one upper case letter, one digit and one special character.Valid special characters (which are configurable) are -   @#$%^&amp;+=!"
                ID="txtRePwd" runat="server" TextMode="Password" Width="158px" CssClass="textbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="txtRePwd" ErrorMessage="Please Re-Type password.">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="txtPwd" ControlToValidate="txtRePwd" 
                    ErrorMessage="Password and Re-Type password should be same.">*</asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td >
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td  >
                &nbsp;</td>
            <td>
                <asp:Button ID="btnCreate" runat="server" Text="Create" 
                    onclick="btnCreate_Click" />
                &nbsp;<asp:Button ID="btnClear" runat="server" CausesValidation="False" 
                    onclick="btnClear_Click" Text="Clear" Width="56px" />
                &nbsp;<asp:Button ID="btnCancel" runat="server" Text="Cancel" 
                    CausesValidation="False" onclick="btnCancel_Click" />
            </td>
        </tr>
       
    </table><div class="clear">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    ShowMessageBox="True" ShowSummary="False" style="margin-left: 0px" />
            </div></div></contenttemplate>
    </asp:UpdatePanel>
    <script>
        //alert(document.forms[0].ContentPlaceHolder1_txtDate);
    </script>
</asp:Content>
