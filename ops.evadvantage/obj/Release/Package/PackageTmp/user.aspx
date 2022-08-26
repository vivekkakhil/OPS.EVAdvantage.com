<%@ Page Language="C#" MasterPageFile="EVAadmin.master" AutoEventWireup="true" CodeFile="user.aspx.cs" Inherits="Admin_user" Title="Create New User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link href="http://fonts.cdnfonts.com/css/helvetica-2" rel="stylesheet"/>
        <link href="css/style.css" rel="stylesheet" />
    <style type="text/css">
        .style1
        {
            width: 136px;
        }
        .style2
        {
            width: 142px;
            height: 16px;
        }
        .style3
        {
            height: 16px;
        }
        .style4
        {
            height: 19px;
        }
        .style5
        {
            height: 20px;
        }
        .style7
        {
            width: 142px;
        }
        .style8
        {
            width: 273px;
        }
        .style9
        {
            height: 19px;
            width: 273px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManagerProxy ID="scriptProxy" runat="server">
    </asp:ScriptManagerProxy>
    <asp:UpdatePanel ID="upPanel" runat="server">
        <ContentTemplate>
<div class="content1">
<table id="tblMsg" runat="server" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td >
                            <asp:Label ID="Label16" runat="server" CssClass="label" 
                                Text="Please fill up the following information to create new user."></asp:Label>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label18" runat="server" Font-Bold="True" ForeColor="Red" 
                                Text="*"></asp:Label>
                            <asp:Label ID="Label17" runat="server" 
                                Text="Marked fields are mandatory." Font-Italic="True"></asp:Label>
                        </td>
                    </tr>
                </table>
 <table id="tblCreate" runat="server" width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
      
 <tr>
 <td class="style2" >
 
 </td><td></td>
 </tr>
                    <tr>
                        <td class="style7" >
                            <asp:Label ID="Label24" runat="server" Font-Bold="True" ForeColor="Red" 
                                Text="*"></asp:Label>
                            <asp:Label ID="Label19" runat="server" Text="User Type :"></asp:Label>
                        </td>
                        <td >
                            <asp:DropDownList ID="ddltype" runat="server" CssClass="textbox" 
                                Width="158px">
                                <asp:ListItem Value="-1">-Select-</asp:ListItem>
                                <asp:ListItem Value="1">Administrator</asp:ListItem>
                                <asp:ListItem Value="2">Moderator</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="ddltype" ErrorMessage="Please select user type." 
                                InitialValue="-1">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                 <tr>
                        <td class="style7"   >
           
                            <asp:Label ID="Label25" runat="server" Font-Bold="True" ForeColor="Red" 
                                Text="*"></asp:Label>
                            <asp:Label ID="Label20" runat="server" Text="User Name :"></asp:Label>
                        </td>
                 <td align="left">
           
                     <asp:TextBox ID="txtUser" runat="server" CssClass="textbox"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                         ControlToValidate="txtUser" ErrorMessage="Please enter user name.">*</asp:RequiredFieldValidator>
                        </td>
                </tr>
                    <tr>
                        <td class="style7"  >
                            <asp:Label ID="Label26" runat="server" Font-Bold="True" ForeColor="Red" 
                                Text="*"></asp:Label>
                            <asp:Label ID="Label21" runat="server" Text="Password :"></asp:Label>
                            </td>
                        <td   >
                            <asp:TextBox ID="txtPwd" runat="server" CssClass="textbox" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txtPwd" ErrorMessage="Please enter password.">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                                ControlToValidate="txtPwd" 
                                ErrorMessage="Password must be at least 10 characters,must contain at least one lower case letter, one upper case letter, one digit and one special character.Valid special characters (which are configurable) are -   @#$%^&amp;+=!" 
                                ValidationExpression="^.*(?=.{10,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&amp;+=!]).*$">*</asp:RegularExpressionValidator>
                            </td>
                    </tr>
                    <tr>
                        <td class="style7">
                            <asp:Label ID="Label27" runat="server" Font-Bold="True" ForeColor="Red" 
                                Text="*"></asp:Label>
                            <asp:Label ID="Label22" runat="server" Text="Re-Type Password :"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtrePwd" runat="server" CssClass="textbox" 
                                TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="txtrePwd" ErrorMessage="Please enter re-type password.">*</asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                ControlToCompare="txtPwd" ControlToValidate="txtrePwd" 
                                ErrorMessage="Password and Re-Type password should be same.">*</asp:CompareValidator>
                        </td>
     </tr>
     <tr>
         <td class="style7">
             <asp:Label ID="Label28" runat="server" Font-Bold="True" ForeColor="Red" 
                 Text="*"></asp:Label>
             <asp:Label ID="Label23" runat="server" Text="Email :"></asp:Label>
         </td>
         <td>
             <asp:TextBox ID="txtEmail" runat="server" CssClass="textbox"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                 ControlToValidate="txtEmail" ErrorMessage="Please enter email.">*</asp:RequiredFieldValidator>
             <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                 ControlToValidate="txtEmail" ErrorMessage="Please enter valid email." 
                 ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
         </td>
     </tr>
     <tr>
         <td class="style2">
         </td>
         <td class="style3">
         </td>
     </tr>
                    <tr>
                        <td class="style7"   >
                            &nbsp;</td>
                        <td >
                            <asp:Button ID="btnCreate" runat="server" Text="Create" Width="57px" 
                                onclick="btnCreate_Click" />
                            &nbsp;<asp:Button ID="btnClear" runat="server" CausesValidation="False" Text="Clear" 
                                Width="57px" onclick="btnClear_Click" />
                            &nbsp;<asp:Button ID="btnCancel" runat="server" CausesValidation="False" 
                                onclick="btnCancel_Click" Text="Cancel" />
                        </td>
                    </tr>
                </table>
                <table id="tblcode" runat="server" cellpadding="0" cellspacing="0" class="style1">
                  <tr>
                      <td align="left">
                          <table cellpadding="0" cellspacing="0" width="100%">
                              <tr id="truser" runat="server">
                                  <td class="style8" >
                                      <asp:LinkButton ID="lnkUser" runat="server" onclick="lnkUser_Click">Create New 
                                      User</asp:LinkButton>
                                  </td>
                                  <td align="right" >
                                  </td>
                              </tr>
                              <tr>
                                  <td class="style9">
                                      &nbsp;</td>
                                  <td align="right" class="style4">
                                      <asp:Button ID="btnSelection" runat="server" CausesValidation="False" 
                                          onclick="btnSelection_Click" Text="Clear Selection" />
                                  </td>
                              </tr>
                              <tr>
                                  <td class="style8">
                                      <asp:Label ID="Label3" runat="server" 
                                          style="font-size: small; font-weight: 700; text-decoration: underline; color: #003399" 
                                          Text="User List"></asp:Label>
                                  </td>
                                  <td align="right">
                                      <asp:Image ID="Image1" runat="server" ImageUrl="~/images/admin.gif" />
                                      &nbsp;<asp:Label ID="Label14" runat="server" style="font-size: small" 
                                          Text="Administrator"></asp:Label>
                                      &nbsp;
                                      <asp:Image ID="Image2" runat="server" ImageUrl="~/images/moderator.gif" />
                                      &nbsp;<asp:Label ID="Label5" runat="server" style="font-size: small" 
                                          Text="Moderator"></asp:Label>&nbsp;
                                          <asp:Image ID="Image3" runat="server" ImageUrl="~/images/ratingplus.gif" />
                                      &nbsp;<asp:Label ID="Label1" runat="server" style="font-size: small" Text="Active"></asp:Label>
                                      &nbsp;&nbsp;<asp:Image ID="Image4" runat="server" ImageUrl="~/images/ratingminus.gif" />
                                      &nbsp;<asp:Label ID="Label2" runat="server" style="font-size: small" 
                                          Text="Inactive"></asp:Label>
                                  
                                  </td>
                              </tr>
                          </table>
                      </td>
                  </tr>
                  <tr>
                      <td align="left">
                          &nbsp;</td>
                  </tr>
                  <tr>
                      <td align="left">
                          <table cellpadding="0" cellspacing="0" class="style1">
                              <tr>
                                  <td>
                                      <asp:GridView ID="gvActiveCode" runat="server" AutoGenerateColumns="False" 
                                          CellPadding="4" DataSourceID="SqlDataSource2" 
                                          EmptyDataText="There is no data available to display." 
                                          ForeColor="#333333" GridLines="None" Width="798px" AllowPaging="True" 
                                          AllowSorting="True" 
                                          onselectedindexchanging="gvActiveCode_SelectedIndexChanging">
                                          <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                          <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                          <Columns>
                                              <asp:BoundField DataField="UserId" HeaderText="UserId" InsertVisible="False" 
                                                  ReadOnly="True" SortExpression="UserId" Visible="False" />
                                              <asp:BoundField DataField="UserName" HeaderText="User Name" 
                                                  SortExpression="UserName">
                                                  <HeaderStyle HorizontalAlign="Left" />
                                                  <ItemStyle HorizontalAlign="Left" />
                                              </asp:BoundField>
                                              <asp:BoundField DataField="Pwd" HeaderText="Pwd" SortExpression="Pwd" 
                                                  Visible="False" />
                                              <asp:TemplateField HeaderText="Type" SortExpression="Type">
                                                  <EditItemTemplate>
                                                      <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Type") %>'></asp:TextBox>
                                                  </EditItemTemplate>
                                                  <ItemTemplate>
                                                  <asp:Image ID="imgUsed" runat="server" 
                                                          ImageUrl='<%# GetImageUrl(Eval("Type")) %>' />
                                                      
                                                  </ItemTemplate>
                                                  <HeaderStyle HorizontalAlign="Left" />
                                                  <ItemStyle HorizontalAlign="Left" />
                                              </asp:TemplateField>
                                              <asp:TemplateField HeaderText="Active?" SortExpression="IsActive">
                                                  <EditItemTemplate>
                                                      <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("IsActive") %>'></asp:TextBox>
                                                  </EditItemTemplate>
                                                  <ItemTemplate>
                                                      <asp:Image ID="imgUsed1" runat="server" 
                                                          ImageUrl='<%# GetStatusImageUrl(Eval("IsActive")) %>' />
                                                    
                                                  </ItemTemplate>
                                                  <HeaderStyle HorizontalAlign="Left" />
                                                  <ItemStyle HorizontalAlign="Left" />
                                              </asp:TemplateField>
                                               <asp:TemplateField HeaderText="Select" ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                               CommandName="Select"  Text="Select" Font-Size="11px" OnCommand="GetUserId"  CommandArgument='<%# Bind("UserId") %>'  ></asp:LinkButton>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="100px" />
                                        <ItemStyle HorizontalAlign="Left" Width="100px" />
                                    </asp:TemplateField>
                                              <asp:TemplateField HeaderText="Change Status">
                                                 
                                                  <ItemTemplate>
                                                       <asp:LinkButton ID="lnkChange" runat="server" 
                                                           OnCommand="ChangeStatus" CommandName='<%# Bind("UserId") %>' CommandArgument='<%# Bind("IsActive") %>'
                                                          Text="Change Status" Font-Size="11px" CausesValidation="false" ></asp:LinkButton>
                                                    
                                                  </ItemTemplate>
                                                  <HeaderStyle HorizontalAlign="Left" />
                                                  <ItemStyle HorizontalAlign="Left" />
                                              </asp:TemplateField>
                                          </Columns>
                                          <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                          <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                          <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
                                              Font-Size="Small" />
                                          <EditRowStyle BackColor="#999999" />
                                          <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                      </asp:GridView>
                                      <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                          ConnectionString="<%$ ConnectionStrings:MemeberShipConnectionString %>" 
                                          SelectCommand="Sp_Select_User" SelectCommandType="StoredProcedure">
                                      </asp:SqlDataSource>
                                  </td>
                              </tr>
                                                            
                          </table>
                      </td>
                  </tr>
            </table>
            <table id="tblDetail" runat="server" cellpadding="0" cellspacing="0" class="style1">
                  <tr>
                      <td align="left">
                          <table cellpadding="0" cellspacing="0" width="100%">
                              <tr>
                                  <td class="style5" >
                                  </td>
                                  <td align="right" class="style5" >
                                  </td>
                              </tr>
                              <tr>
                                  <td>
                                      <asp:Label ID="Label4" runat="server" 
                                          style="font-size: small; font-weight: 700; text-decoration: underline; color: #003399" 
                                          Text="Verification Detail"></asp:Label>
                                  </td>
                                  <td align="right">
                                      <asp:Image ID="Image5" runat="server" ImageUrl="~/images/DNNExplorer_OK.gif" />
                                      &nbsp;<asp:Label ID="Label29" runat="server" style="font-size: small" Text="Yes"></asp:Label>
                                      &nbsp;<asp:Image ID="Image6" runat="server" 
                                          ImageUrl="~/images/DNNExplorer_Cancel.gif" />
                                      &nbsp;<asp:Label ID="Label30" runat="server" style="font-size: small" Text="No"></asp:Label>
                                  </td>
                              </tr>
                          </table>
                      </td>
                  </tr>
                  <tr>
                      <td align="left">
                          &nbsp;</td>
                  </tr>
                  <tr>
                      <td align="left">
                          <table cellpadding="0" cellspacing="0" class="style1">
                              <tr>
                                  <td>
                                      <asp:GridView ID="gvDetail" runat="server" AutoGenerateColumns="False" 
                                          CellPadding="4" DataSourceID="SqlDataSource1" 
                                          EmptyDataText="There is no data to display." 
                                          ForeColor="#333333" GridLines="None" Width="798px" AllowPaging="True" 
                                          AllowSorting="True">
                                          <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                          <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                          <Columns>
                                              <asp:TemplateField HeaderText="Employee Name" SortExpression="UserId">
                                                  <EditItemTemplate>
                                                      <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("UserId") %>'></asp:TextBox>
                                                  </EditItemTemplate>
                                                  <ItemTemplate>
                                                      <asp:Label ID="Label1" runat="server" Text='<%# GetUser(Eval("UserId")) %>'></asp:Label>
                                                  </ItemTemplate>
                                                  <HeaderStyle HorizontalAlign="Left" Width="200px" />
                                                  <ItemStyle HorizontalAlign="Left" Width="200px" />
                                              </asp:TemplateField>
                                              <asp:BoundField DataField="AuthCodeNo" HeaderText="Used Auth Code" 
                                                  SortExpression="AuthCodeNo">
                                                  <HeaderStyle HorizontalAlign="Left" Width="200px" />
                                                  <ItemStyle HorizontalAlign="Left" Width="200px" />
                                              </asp:BoundField>
                                              <asp:BoundField DataField="ExpiredDate" HeaderText="Date" 
                                                  SortExpression="ExpiredDate">
                                                  <HeaderStyle HorizontalAlign="Left" Width="150px" />
                                                  <ItemStyle HorizontalAlign="Left" Width="150px" />
                                              </asp:BoundField>
                                              <asp:BoundField DataField="VerifyId" HeaderText="VerifyId" 
                                                  SortExpression="VerifyId" Visible="False">
                                                  <HeaderStyle HorizontalAlign="Left" />
                                                  <ItemStyle HorizontalAlign="Left" />
                                              </asp:BoundField>
                                              <asp:BoundField DataField="type" HeaderText="Verification Type" 
                                                  SortExpression="type">
                                                  <HeaderStyle HorizontalAlign="Left" Width="250px" />
                                                  <ItemStyle HorizontalAlign="Left" Width="250px" />
                                              </asp:BoundField>
                                              <asp:BoundField DataField="Company" HeaderText="Company" 
                                                  SortExpression="Company">
                                                  <HeaderStyle HorizontalAlign="Left" Width="200px" />
                                                  <ItemStyle HorizontalAlign="Left" Width="200px" />
                                              </asp:BoundField>
                                              <asp:TemplateField HeaderText="Credit Card?" SortExpression="IsCreditCard">
                                                  <EditItemTemplate>
                                                      <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("IsCreditCard") %>'></asp:TextBox>
                                                  </EditItemTemplate>
                                                  <ItemTemplate>
                                                      <%--<asp:Label ID="Label2" runat="server" Text='<%# Bind("IsCreditCard") %>'></asp:Label>--%>
                                                      <asp:Image ID="img" runat="server" ImageUrl='<%# GetImageUrlCC(Eval("IsCreditCard")) %>' />
                                                  </ItemTemplate>
                                                  <HeaderStyle HorizontalAlign="Left" Width="150px" />
                                                  <ItemStyle HorizontalAlign="Left" Width="150px" />
                                              </asp:TemplateField>
                                          </Columns>
                                          <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                          <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                          <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
                                              Font-Size="Small" />
                                          <EditRowStyle BackColor="#999999" />
                                          <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                      </asp:GridView>
                                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                          ConnectionString="<%$ ConnectionStrings:MemeberShipConnectionString %>" 
                                          SelectCommand="Sp_Get_CodeByVerifier" SelectCommandType="StoredProcedure">
                                          <SelectParameters>
                                              <asp:SessionParameter Name="verifyid" SessionField="verifyid" Type="Int32" />
                                          </SelectParameters>
                                      </asp:SqlDataSource>
                                  </td>
                              </tr>
                          </table>
                      </td>
                  </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
    <div class="clear">
       <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    ShowMessageBox="True" ShowSummary="False" style="margin-left: 0px" />
    </div>
</div></ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

