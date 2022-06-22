<%@ Page Language="C#" MasterPageFile="~/EVA.master" AutoEventWireup="true" CodeFile="payment.aspx.cs" Inherits="payment" Title="Successfull Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="style.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 36px;
        }
        .style3
        {
            width: 36px;
            height: 20px;
        }
        .style4
        {
            height: 20px;
        }
        .style5
        {
            width: 130px;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:ScriptManagerProxy ID="scriptProxy" runat="server">
    </asp:ScriptManagerProxy>
    <asp:UpdatePanel ID="upPanel" runat="server">
        <ContentTemplate><div class="content">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
    
                      <tr>
              <td>
                  <table cellpadding="0" cellspacing="0" class="style1">
                      <tr>
                          <td class="style2">
                              <asp:Image ID="img" runat="server" ImageUrl="~/images/success.bmp" />
                          </td>
                          <td valign="middle">
                              &nbsp;
                              <asp:Label ID="lblMessage" runat="server">Thank you for your payment. Please 
                              click below button to view your requested verification.</asp:Label>
                          </td>
                      </tr>
                      <tr>
                          <td class="style3">
                              &nbsp;</td>
                          <td class="style4">
                              &nbsp;</td>
                      </tr>
                      <tr>
                          <td class="style3">
                              &nbsp;</td>
                          <td class="style4">
                              <table cellpadding="0" cellspacing="0" class="style1">
                                  <tr>
                                      <td class="style5">
                                          &nbsp;&nbsp;
                                          <asp:Label ID="Label1" runat="server" Text="Verification Type :"></asp:Label>
                                      </td>
                                      <td>
                                          <asp:Label ID="lblType" runat="server"></asp:Label>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style5">
                                          &nbsp;&nbsp;
                                          <asp:Label ID="Label2" runat="server" Text="Amount Paid :"></asp:Label>
                                      </td>
                                      <td>
                                          <asp:Label ID="lblAmount" runat="server"></asp:Label>
                                      </td>
                                  </tr>
                              </table>
                          </td>
                      </tr>
                      <tr>
                          <td class="style3">
                              &nbsp;</td>
                          <td class="style4">
                              &nbsp;</td>
                      </tr>
                      <tr>
                          <td class="style3">
                          </td>
                          <td class="style4">
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              <asp:Button ID="btnView" runat="server" onclick="btnView_Click" 
                                  Text="View Verification" />
                          </td>
                      </tr>
                  </table>
                          </td>
          </tr>
      </table>
      </div><div class="clear">   
            </div>
            
      </ContentTemplate>
      </asp:UpdatePanel>
</asp:Content>
