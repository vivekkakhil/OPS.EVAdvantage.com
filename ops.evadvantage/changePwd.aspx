<%@ Page Language="C#" MasterPageFile="EVAadmin.master" AutoEventWireup="true" CodeFile="changePwd.aspx.cs" Inherits="Admin_changePwd" Title="Change Password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                        <td >
                            <asp:Label ID="Label16" runat="server" CssClass="label" 
                                Text="Please enter new password to change old password."></asp:Label>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label18" runat="server" Font-Bold="True" ForeColor="Red" 
                                Text="*"></asp:Label>
                            <asp:Label ID="Label17" runat="server" 
                                Text="Marked fields are mandatory." Font-Italic="True"></asp:Label>
                        </td>
                    </tr>
                </table>
 <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
 <tr>
 <td class="style8">
 
 </td>
 </tr>
                    <tr>
                        <td align="left" class="style7">
                            <asp:Label ID="Label19" runat="server" Font-Bold="True" ForeColor="Red" 
                                Text="*"></asp:Label>
                            <asp:Label ID="Label1" runat="server" Text="Old Password :"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtOld" runat="server" CssClass="textbox" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtOld" 
                                ErrorMessage="Please enter Old password.">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                 <tr>
                     <td align="left" class="style7">
                         <asp:Label ID="Label24" runat="server" Font-Bold="True" ForeColor="Red" 
                             Text="*"></asp:Label>
                         <asp:Label ID="Label23" runat="server" Text="New Password :"></asp:Label>
                     </td>
                     <td align="left">
                         <asp:TextBox ID="txtNew" runat="server" CssClass="textbox" TextMode="Password"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                             ControlToValidate="txtNew" ErrorMessage="Please enter new password.">*</asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                             ControlToValidate="txtNew" 
                             ErrorMessage="Password must be at least 10 characters,must contain at least one lower case letter, one upper case letter, one digit and one special character.Valid special characters (which are configurable) are -   @#$%^&amp;+=!" 
                             ValidationExpression="^.*(?=.{10,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&amp;+=!]).*$">*</asp:RegularExpressionValidator>
                     </td>
     </tr>
                 <tr>
                        <td align="left" class="style7" >
           
                            <asp:Label ID="Label20" runat="server" Font-Bold="True" ForeColor="Red" 
                                Text="*"></asp:Label>
           
                            <asp:Label ID="Label2" runat="server" Text="Confirm New Password :"></asp:Label>
           
                </td>
                 <td align="left">
           
                     <asp:TextBox ID="txtConfirm" runat="server" CssClass="textbox" 
                         TextMode="Password"></asp:TextBox>
           
                     <asp:CompareValidator ID="CompareValidator1" runat="server" 
                         ControlToCompare="txtNew" ControlToValidate="txtConfirm" 
                         ErrorMessage="New and Confirm New password should be same.">*</asp:CompareValidator>
           
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                         ControlToValidate="txtConfirm" 
                         ErrorMessage="Please enter confirm new password.">*</asp:RequiredFieldValidator>
           
                </td>
                </tr>
                    <tr>
                        <td align="left" class="style9" >
                            </td>
                        <td align="left" class="style10" >
                            </td>
                    </tr>
                    <tr>
                        <td align="left" class="style7" >
                            &nbsp;</td>
                        <td align="left">
                            <asp:Button ID="btnSave" runat="server" Text="Save" Width="57px" 
                                onclick="btnSave_Click" />
                            &nbsp;<asp:Button ID="btnClear" runat="server" onclick="btnClear_Click" Text="Clear"  CausesValidation="false"
                                Width="57px" />
                        </td>
                    </tr>
                </table>
    <div class="clear">
      <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    ShowMessageBox="True" ShowSummary="False" style="margin-left: 0px" />
    </div>
</div>
                        </div>
                    </div>
                 </section>
                        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

