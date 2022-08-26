<%@ Page Language="C#" MasterPageFile="EVAadmin.master" AutoEventWireup="true" CodeFile="changePrice.aspx.cs" Inherits="Admin_changePrice" Title="Change Price" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
          <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link href="http://fonts.cdnfonts.com/css/helvetica-2" rel="stylesheet"/>
        <link href="css/style.css" rel="stylesheet" />

    <style type="text/css">
        .style7
        {
            width: 153px;
        }
        .style8
        {
            height: 26px;
        }
        .style9
        {
            width: 153px;
            height: 3px;
        }
        .style10
        {
            height: 11px;
        }
        .style11
        {
            width: 4px;
        }
        .style12
        {
            width: 4px;
            font-weight: bold;
        }
    </style>
    <script language="javascript" type="text/javascript">
    function isNumberKey(evt)
    {
        evt = window.event;
        var charCode = evt.keyCode;
        if ((charCode >= 48 && charCode <=57) || (charCode == 46)) {
        status = "";
        return true;
    }
        status = "This field accepts numbers only.";
        evt.keyCode=0;
        return false;
    } 

    </script>
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
                                Text="Please decide the price for different services."></asp:Label>
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
 <td colspan="2" class="style8">
 
 </td>
 </tr>
                    <tr>
                        <td align="left" class="style7">
                            <asp:Label ID="Label19" runat="server" Font-Bold="True" ForeColor="Red" 
                                Text="*"></asp:Label>
                            <asp:Label ID="Label1" runat="server" Text="Only Employment :"></asp:Label>
                        </td>
                        <td class="style11">
                            <asp:Label ID="Label21" runat="server"  Text="$"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtEmployment" runat="server" CssClass="textbox" Width="65px" 
                                o ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtEmployment" 
                                ErrorMessage="Please enter the only employment price.">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                 <tr>
                        <td align="left" class="style7" >
           
                            <asp:Label ID="Label20" runat="server" Font-Bold="True" ForeColor="Red" 
                                Text="*"></asp:Label>
           
                            <asp:Label ID="Label2" runat="server" Text="Employment + Salary :"></asp:Label>
           
                </td><td>
                            <asp:Label ID="Label22" runat="server" Text="$"></asp:Label>
                        </td>
                 <td align="left">
           
                     <asp:TextBox ID="txtSalary" runat="server" CssClass="textbox" Width="65px"></asp:TextBox>
           
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                         ControlToValidate="txtSalary" 
                         ErrorMessage="Please enter the employment + salary price.">*</asp:RequiredFieldValidator>
           
                </td>
                </tr>
                    <tr>
                        <td align="left" class="style9" >
                            </td><td class="style11"></td>
                        <td align="left" class="style10" >
                            </td>
                    </tr>
                    <tr>
                        <td align="left" class="style7" >
                            &nbsp;</td><td class="style11"></td>
                        <td align="left">
                            <asp:Button ID="btnSave" runat="server" Text="Save"  
                                onclick="btnSave_Click" />
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

