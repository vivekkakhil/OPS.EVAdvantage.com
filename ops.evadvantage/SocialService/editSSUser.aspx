<%@ Page Language="C#" MasterPageFile="EVASsv.master" AutoEventWireup="true" CodeFile="editSSUser.aspx.cs" Inherits="SocialService_editSSUser" Title="Edit Information" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 198px;
        }
        .style3
        {
            width: 198px;
            height: 18px;
        }
        .style4
        {
            height: 18px;
        }
    </style>
    <link href="../style.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManagerProxy ID="scriptProxy" runat="server">
    </asp:ScriptManagerProxy>
    <asp:UpdatePanel ID="upPanel" runat="server">
        <ContentTemplate><div class="content">
  
      <table cellpadding="0" cellspacing="0" width="100%" >
                    <tr>
                        <td >
                            <asp:Label ID="Label16" runat="server" 
                                Text="You can update following account information." 
                                 CssClass="label" ></asp:Label>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label18" runat="server" Font-Bold="True" ForeColor="Red" 
                                Text="*"></asp:Label>
                            <asp:Label ID="Label17" runat="server" 
                                Text="Marked fields are mandatory." Font-Italic="True"></asp:Label>
                        </td>
                    </tr>
                  <tr>
                        <td  colspan="2">
                            <hr style="width: 798px" />
                        </td>
                    </tr>
                </table>
    <table cellpadding="0" cellspacing="0" width="100%">
        
        <tr>
            <td align="left" class="style3" >
            </td>
            <td class="style4">
            </td>
        </tr>
        <tr>
            <td align="left" class="style2">
                <asp:Label ID="Label15" runat="server" Font-Bold="True" ForeColor="Red" 
                    Text="*"></asp:Label>
                <asp:Label ID="Label1" runat="server" Text="First Name :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtFname" runat="server" CssClass="textbox" Width="158px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtFname" ErrorMessage="Please enter first name.">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="left" class="style2"  >
                <asp:Label ID="Label9" runat="server" Font-Bold="True" ForeColor="Red" Text="*"></asp:Label>
                <asp:Label ID="Label2" runat="server" Text="Last Name :"></asp:Label>
            </td>
            <td >
                <asp:TextBox ID="txtLname" runat="server" Width="158px" CssClass="textbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtLname" ErrorMessage="Please enter last name.">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="left" class="style2"  >
                <asp:Label ID="Label10" runat="server" Font-Bold="True" ForeColor="Red" 
                    Text="*"></asp:Label>
                <asp:Label ID="Label3" runat="server" Text="Company Name :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtCname" runat="server" Width="158px" CssClass="textbox"></asp:TextBox>
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtCname" ErrorMessage="Please enter company name.">*</asp:RequiredFieldValidator>
                
                </td>
        </tr>
        <tr>
            <td align="left" class="style2"  >
                <asp:Label ID="Label11" runat="server" Font-Bold="True" ForeColor="Red" 
                    Text="*"></asp:Label>
                <asp:Label ID="Label4" runat="server" Text="Company Address 1 :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtCadd1" runat="server" Width="158px" CssClass="textbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtCadd1" ErrorMessage="Please enter company address.">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="left" class="style2" >
                &nbsp;&nbsp;
                <asp:Label ID="Label5" runat="server" Text="Company Address 2 :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtCadd2" runat="server" Width="158px" CssClass="textbox"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="left" class="style2">
                <asp:Label ID="Label13" runat="server" Font-Bold="True" ForeColor="Red" 
                    Text="*"></asp:Label>
                <asp:Label ID="Label6" runat="server" Text="City :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtCity" runat="server" Width="158px" CssClass="textbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="txtCity" ErrorMessage="Please enter city name.">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="left" class="style2" >
                <asp:Label ID="Label14" runat="server" Font-Bold="True" ForeColor="Red" 
                    Text="*"></asp:Label>
                <asp:Label ID="Label7" runat="server" Text="State :"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlState" runat="server" Width="164px" 
                    CssClass="textbox" >
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="ddlState" ErrorMessage="Please select state." 
                    InitialValue="0">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="left" class="style2"  >
                <asp:Label ID="Label8" runat="server" Font-Bold="True" ForeColor="Red" 
                    Text="*"></asp:Label>
                <asp:Label ID="Label19" runat="server" Text="Zip Code :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtZip" runat="server" Width="158px" CssClass="textbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="txtZip" ErrorMessage="Please enter zip code.">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="txtZip" ErrorMessage="Please enter proper zip code." 
                    ValidationExpression="\d{5}(-\d{4})?">*</asp:RegularExpressionValidator>
            </td>
        </tr><tr>
            <td align="left" class="style2" >
                <asp:Label ID="Label20" runat="server" Font-Bold="True" ForeColor="Red" 
                    Text="*"></asp:Label>
                <asp:Label ID="Label21" runat="server" Text="Country :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtCountry" runat="server" Width="158px" CssClass="textbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    ControlToValidate="txtCountry" ErrorMessage="Please enter country.">*</asp:RequiredFieldValidator>
            </td>
        </tr><tr>
            <td align="left" class="style2" >
                <asp:Label ID="Label22" runat="server" Font-Bold="True" ForeColor="Red" 
                    Text="*"></asp:Label>
                <asp:Label ID="Label23" runat="server" Text="Work Telephone :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtTele" runat="server" Width="158px" CssClass="textbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                    ControlToValidate="txtTele" ErrorMessage="Please enter work telephone.">*</asp:RequiredFieldValidator>
            </td>
        </tr><tr>
            <td align="left" class="style2" >
                &nbsp;&nbsp;
                <asp:Label ID="Label25" runat="server" Text="Work Fax :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtFax" runat="server" Width="158px" CssClass="textbox"></asp:TextBox>
            </td>
        </tr><tr>
            <td align="left" class="style2"  >
                <asp:Label ID="Label26" runat="server" Font-Bold="True" ForeColor="Red" 
                    Text="*"></asp:Label>
                <asp:Label ID="Label27" runat="server" Text="Work Email :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" Width="158px" CssClass="textbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="Please enter email.">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="Please enter proper email" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
            </td>
        </tr><tr>
            <td align="left" class="style2"  >
                <asp:Label ID="Label32" runat="server" Font-Bold="True" ForeColor="Red" 
                    Text="*"></asp:Label>
                <asp:Label ID="Label33" runat="server" Text="Password :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" Width="158px" 
                    CssClass="textbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                    ControlToValidate="txtPwd" ErrorMessage="Please enter password.">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                    ControlToValidate="txtPwd" 
                    ErrorMessage="Password must be at least 10 characters,must contain at least one lower case letter, one upper case letter, one digit and one special character.Valid special characters (which are configurable) are -   @#$%^&amp;+=!" 
                    ValidationExpression="^.*(?=.{10,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&amp;+=!]).*$">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td align="left" class="style2" >
                <asp:Label ID="Label36" runat="server" Font-Bold="True" ForeColor="Red" 
                    Text="*"></asp:Label>
                <asp:Label ID="Label37" runat="server" Text="Secret Question :"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlQuestion" runat="server" Width="296px" 
                    CssClass="textbox">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
                    ControlToValidate="ddlQuestion" ErrorMessage="Please select secret question." 
                    InitialValue="0">*</asp:RequiredFieldValidator>
            </td>
        </tr><tr>
            <td align="left" class="style2" >
                <asp:Label ID="Label38" runat="server" Font-Bold="True" ForeColor="Red" 
                    Text="*"></asp:Label>
                <asp:Label ID="Label39" runat="server" Text="Answer :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtAns" runat="server" Width="158px" CssClass="textbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" 
                    ControlToValidate="txtAns" ErrorMessage="Please enter answer.">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2" >
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2"  >
                &nbsp;</td>
            <td>
                <asp:Button ID="btnUpdate" runat="server" Text="Update" 
                    onclick="btnUpdate_Click" />
                &nbsp;<asp:Button ID="btnClear" runat="server" CausesValidation="False" 
                    onclick="btnClear_Click" Text="Clear" Width="56px" /> &nbsp;<asp:Button ID="btnCancel" runat="server" Text="Cancel" 
                    CausesValidation="False" onclick="btnCancel_Click" />
            </td>
        </tr>
       
    </table>
      </div><div class="clear">
   <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    ShowMessageBox="True" ShowSummary="False" style="margin-left: 0px" />
            </div>
            
      </ContentTemplate>
      </asp:UpdatePanel>
</asp:Content>



