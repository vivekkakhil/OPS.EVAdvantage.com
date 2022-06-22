<%@ Page Language="C#" MasterPageFile="~/EVA.master" AutoEventWireup="true" CodeFile="authorizeNet.aspx.cs"
    Inherits="authorizeNet" Title="Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="style.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style3
        {
            width: 157px;
        }
        .style4
        {
            width: 157px;
            height: 35px;
        }
        .style5
        {
            height: 35px;
        }
    </style>

    <script language="javascript" type="text/javascript">
        function isNumberKey(evt) {
            evt = window.event;
            var charCode = evt.keyCode;
            if ((charCode >= 48 && charCode <= 57) || (charCode == 46)) {
                status = "";
                return true;
            }
            status = "This field accepts numbers only.";
            evt.keyCode = 0;
            return false;
        } 

    </script>

    <link rel="stylesheet" href="css/bubble-tooltip.css" media="screen">

    <script type="text/javascript" src="Scripts/bubble-tooltip.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManagerProxy ID="scriptProxy" runat="server">
    </asp:ScriptManagerProxy>
    <asp:UpdatePanel ID="upPanel" runat="server">
        <ContentTemplate>
            <div class="content">
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <asp:Label ID="Label16" runat="server" CssClass="label" Text="Please fill up the following information to make payment."></asp:Label>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label18" runat="server" Font-Bold="True" ForeColor="Red" Text="*"></asp:Label>
                            <asp:Label ID="Label17" runat="server" Font-Italic="True" Text="Marked fields are mandatory."></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <hr style="width: 798px" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                    <tr>
                        <td>
                            <table cellpadding="0" cellspacing="0" class="style1">
                                <tr>
                                    <td class="style3">
                                        <asp:Label ID="Label19" runat="server" Font-Bold="True" ForeColor="Red" Text="*"></asp:Label>
                                        <asp:Label ID="Label1" runat="server" Text="Company :"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtCompany" runat="server" CssClass="textbox"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCompany"
                                            ErrorMessage="Please enter Company.">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style3">
                                        <asp:Label ID="Label20" runat="server" Font-Bold="True" ForeColor="Red" Text="*"></asp:Label>
                                        <asp:Label ID="Label2" runat="server" Text="First Name :"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="textbox"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFirstName"
                                            ErrorMessage="Please enter First Name.">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style3">
                                        <asp:Label ID="Label21" runat="server" Font-Bold="True" ForeColor="Red" Text="*"></asp:Label>
                                        <asp:Label ID="Label3" runat="server" Text="Last Name :"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtLastName" runat="server" CssClass="textbox"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtLastName"
                                            ErrorMessage="Please enter Last Name.">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style3" valign="top">
                                        <asp:Label ID="Label22" runat="server" Font-Bold="True" ForeColor="Red" Text="*"></asp:Label>
                                        <asp:Label ID="Label4" runat="server" Text="Address :"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtAddress" runat="server" CssClass="textbox" Height="59px" TextMode="MultiLine"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAddress"
                                            ErrorMessage="Please enter Address.">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style3">
                                        <asp:Label ID="Label8" runat="server" Font-Bold="True" ForeColor="Red" Text="*"></asp:Label>
                                        <asp:Label ID="Label23" runat="server" Text="City :"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtCity" runat="server" CssClass="textbox"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCity"
                                            ErrorMessage="Please enter city.">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style3">
                                        <asp:Label ID="Label9" runat="server" Font-Bold="True" ForeColor="Red" Text="*"></asp:Label>
                                        <asp:Label ID="Label24" runat="server" Text="State :"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlState" runat="server" CssClass="textbox" Width="158px">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlState"
                                            ErrorMessage="Please enter state." InitialValue="0">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style3">
                                        <asp:Label ID="Label10" runat="server" Font-Bold="True" ForeColor="Red" Text="*"></asp:Label>
                                        <asp:Label ID="Label25" runat="server" Text="Zip Code :"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtZip" runat="server" CssClass="textbox"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtZip"
                                            ErrorMessage="Please enter proper zip code." ValidationExpression="\d{5}(-\d{4})?">*</asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtZip"
                                            ErrorMessage="Please enter Zip Code.">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style3">
                                        <asp:Label ID="Label11" runat="server" Font-Bold="True" ForeColor="Red" Text="*"></asp:Label>
                                        <asp:Label ID="Label5" runat="server" Text="Country :"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtCountry" runat="server" CssClass="textbox"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtCountry"
                                            ErrorMessage="Please enter Country.">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style3">
                                        &nbsp;&nbsp;
                                        <asp:Label ID="Label6" runat="server" Text="Phone Number :"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPhone" runat="server" CssClass="textbox"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style3">
                                        <asp:Label ID="Label13" runat="server" Font-Bold="True" ForeColor="Red" Text="*"></asp:Label>
                                        <asp:Label ID="Label7" runat="server" Text="Email Address :"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="textbox"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                                            ErrorMessage="Please enter proper email." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtEmail"
                                            ErrorMessage="Please enter email.">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style3">
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style4">
                                    </td>
                                    <td class="style5">
                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/logo_ccVisa.gif" />
                                        <asp:Image ID="Image2" runat="server" ImageUrl="~/images/logo_ccMC.gif" />
                                        <asp:Image ID="Image3" runat="server" ImageUrl="~/images/logo_ccAmex.gif" />
                                        <asp:Image ID="Image4" runat="server" ImageUrl="~/images/logo_ccDiscover.gif" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style3">
                                        <asp:Label ID="Label14" runat="server" Font-Bold="True" ForeColor="Red" Text="*"></asp:Label>
                                        <asp:Label ID="Label15" runat="server" Text="Credit Card Number :"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtCredit" runat="server" CssClass="textbox"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtCredit"
                                            ErrorMessage="Please enter Credit Card.">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style3">
                                        <asp:Label ID="Label26" runat="server" Font-Bold="True" ForeColor="Red" Text="*"></asp:Label>
                                        <asp:Label ID="Label27" runat="server" Text="Expiration Date :"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtMonth" runat="server" CssClass="textbox" MaxLength="2" Width="37px"></asp:TextBox>&nbsp;<asp:Label
                                            ID="Label30" runat="server" Font-Size="Large" Text="/"></asp:Label>
                                        &nbsp;<asp:TextBox ID="txtYear" runat="server" CssClass="textbox" MaxLength="2" Width="37px"></asp:TextBox>
                                        &nbsp;<asp:Label ID="Label31" runat="server" Text="(mm/yy)"></asp:Label>
                                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtMonth"
                                            ErrorMessage="Please enter proper month." MaximumValue="12" MinimumValue="1"
                                            Type="Integer">*</asp:RangeValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtMonth"
                                            ErrorMessage="Please enter Month.">*</asp:RequiredFieldValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtYear"
                                            ErrorMessage="Please enter year.">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style3">
                                        <asp:Label ID="Label28" runat="server" Font-Bold="True" ForeColor="Red" Text="*"></asp:Label>
                                        <asp:Label ID="Label29" runat="server" Text="Card Code :"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtCardCode" runat="server" CssClass="textbox" MaxLength="4" Width="53px"></asp:TextBox>
                                        &nbsp;<img src="images/action_help.gif" onmousemove="showToolTip(event,'For Master Card or Visa, it\'s the last three digits in the signature area on the back of your card. For American Express, it\'s the four digits on the front of the card.');return false"
                                            onmouseout="hideToolTip()" />
                                        <div id="bubble_tooltip">
                                            <div class="bubble_top">
                                                <span></span>
                                            </div>
                                            <div class="bubble_middle">
                                                <span id="bubble_tooltip_content"></span>
                                            </div>
                                            <div class="bubble_bottom">
                                            </div>
                                        </div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtCardCode"
                                            ErrorMessage="Please enter Card Code.">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style3">
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style3">
                                        &nbsp;
                                    </td>
                                    <td>
                                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" Width="57px" OnClick="btnSubmit_Click" />
                                        &nbsp;<asp:Button ID="btnClear" runat="server" Text="Clear" Width="57px" CausesValidation="False"
                                            OnClick="btnClear_Click" />
                                        &nbsp;<asp:Button ID="btnCancel" runat="server" CausesValidation="False" OnClick="btnCancel_Click"
                                            Text="Cancel" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </div>
            <div class="clear">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                    ShowSummary="False" Style="margin-left: 0px" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
