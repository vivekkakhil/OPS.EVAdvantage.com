<%@ Page Language="C#" MasterPageFile="EVAadmin.master" AutoEventWireup="true" CodeFile="verification.aspx.cs" Inherits="Admin_verification" Title="Verification" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../style.css" rel="stylesheet" type="text/css" />
      <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link href="http://fonts.cdnfonts.com/css/helvetica-2" rel="stylesheet"/>
        <link href="css/style.css" rel="stylesheet" />
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style3
        {
            width: 142px;
        }
    .style4
    {
        width: 142px;
        height: 23px;
    }
    .style5
    {
        height: 23px;
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
  <table cellpadding="0" cellspacing="0" width="100%" >
                <tr>
                    <td >
                        <asp:Label ID="Label16" runat="server" CssClass="label" 
                            Text="Please fill up the following information and submit the verification request."></asp:Label>
                    </td>
                    <td align="right">
                        <asp:Label ID="Label18" runat="server" Font-Bold="True" ForeColor="Red" 
                            Text="*"></asp:Label>
                        <asp:Label ID="Label17" runat="server" Font-Italic="True" 
                            Text="Marked fields are mandatory."></asp:Label>
                    </td>
                </tr>
            </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
      <tr>
      <td>
          <table cellpadding="0" cellspacing="0" class="style1">
              <tr>
                  <td class="style3">
                      &nbsp;</td>
                  <td>
                      &nbsp;</td>
              </tr>
              <tr>
                  <td class="style3">
                     
                      <asp:Label ID="Label24" runat="server" Text="Verifier Company"></asp:Label>
                       <asp:Label ID="Label25" runat="server" Font-Bold="True" ForeColor="Red" 
                          Text="*"></asp:Label>
                  </td>
                  <td>
                      <asp:TextBox ID="txtCompany" runat="server" CssClass="textbox"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                          ControlToValidate="txtCompany" ErrorMessage="Please enter verifier company">*</asp:RequiredFieldValidator>
                  </td>
              </tr>
              <tr id="trCC" runat="server">
                  <td class="style4">
                      </td>
                  <td class="style5">
                     &nbsp; <asp:CheckBox ID="chkCC" runat="server" Text=" Use Credit Card" />
                  </td>
              </tr>
              <tr>
                  <td class="style3">
                     
                      <asp:Label ID="Label1" runat="server" Text="Verification Type"></asp:Label>
                       <asp:Label ID="Label19" runat="server" Font-Bold="True" ForeColor="Red" 
                          Text="*"></asp:Label>
                  </td>
                  <td>
                      <asp:DropDownList ID="ddlType" runat="server" AutoPostBack="True" 
                          CssClass="textbox"
                          onselectedindexchanged="ddlType_SelectedIndexChanged" >
                      </asp:DropDownList>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                          ControlToValidate="ddlType" ErrorMessage="Please select verification type." 
                          InitialValue="0">*</asp:RequiredFieldValidator>
                  </td>
              </tr>
              <tr id="trKey" runat="server">
                  <td class="style3">
                      <%--<asp:Label ID="Label20" runat="server" Font-Bold="True" ForeColor="Red" 
                          Text="*"></asp:Label>--%>
                      <asp:Label ID="Label2" runat="server" Text="Salary Authorization Code :"></asp:Label>
                  </td>
                  <td>
                      <asp:TextBox ID="txtKey" runat="server" CssClass="textbox"></asp:TextBox>
                      <%--<asp:RequiredFieldValidator ID="RfvKey" runat="server" 
                          ControlToValidate="txtKey" Display="Dynamic" 
                          ErrorMessage="Please enter Authorization Key.">*</asp:RequiredFieldValidator>--%>
                  </td>
              </tr>
              <tr>
                  <td class="style3">
                      
                      <asp:Label ID="Label3" runat="server" Text="Social Security #"></asp:Label>
                      <asp:Label ID="Label21" runat="server" Font-Bold="True" ForeColor="Red" 
                          Text="*"></asp:Label>
                  </td>
                  <td>
                      <asp:TextBox ID="txtSSN" runat="server" CssClass="textbox"></asp:TextBox>
                      <asp:Label ID="Label23" runat="server" Text="(###-##-####)"></asp:Label>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                          ControlToValidate="txtSSN" ErrorMessage="Please enter Social Security #.">*</asp:RequiredFieldValidator>
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                          ControlToValidate="txtSSN" ErrorMessage="Please enter proper Social Security #" 
                          ValidationExpression="\d{3}-\d{2}-\d{4}">*</asp:RegularExpressionValidator>
                  </td>
              </tr>
              <tr>
                  <td class="style3">
                    
                      <asp:Label ID="Label4" runat="server" Text="Company"></asp:Label>
                        <asp:Label ID="Label22" runat="server" Font-Bold="True" ForeColor="Red" 
                          Text="*"></asp:Label>
                  </td>
                  <td>
                      <asp:DropDownList ID="ddlCompany" runat="server" AutoPostBack="True" 
                        CssClass="textbox"  onselectedindexchanged="ddlCompany_SelectedIndexChanged">
                      </asp:DropDownList>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                          ControlToValidate="ddlCompany" ErrorMessage="Please select Company." 
                          InitialValue="0">*</asp:RequiredFieldValidator>
                  </td>
              </tr>
              <tr>
                  <td class="style3">
                      &nbsp;</td>
                  <td>
                      &nbsp;</td>
              </tr>
              <tr id="trValid" runat="server">
                  <td class="style3">
                      &nbsp;</td>
                  <td>
                      <asp:Button ID="btnValidate" runat="server" Text="Validate" 
                          onclick="btnValidate_Click" />
                      &nbsp;<asp:Button ID="btnClear" runat="server" Text="Clear" 
                          CausesValidation="False" onclick="btnClear_Click" />
                      &nbsp;</td>
              </tr>
              <tr id="trContd" runat="server">
                  <td class="style3">
                      &nbsp;</td>
                  <td>
                      <asp:Button ID="btnContinue" runat="server" Text="Continue" 
                          onclick="btnContinue_Click" />
                      &nbsp;<asp:Button ID="btnCancel" runat="server" onclick="btnCancel_Click" 
                          Text="Cancel" />
                  </td>
              </tr>
          </table>
          </td>
      </tr>
      <tr>
      <td></td>
      </tr>
          <tr>
              <td>
                  &nbsp;</td>
          </tr>
      </table>
      </div><div class="clear">  <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    ShowMessageBox="True" ShowSummary="False" style="margin-left: 0px" />  
            </div>
            </div>
                    </div>
                 </section>
      </ContentTemplate>
      </asp:UpdatePanel>
</asp:Content>



