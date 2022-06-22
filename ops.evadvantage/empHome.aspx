<%@ Page Language="C#" MasterPageFile="~/EVA.master" AutoEventWireup="true" CodeFile="empHome.aspx.cs" Inherits="empHome" Title="Employee home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 438px;
        }
        .style4
        {
            width: 798px;
        }
    </style><link href="style.css" rel="stylesheet" type="text/css" />
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManagerProxy ID="scriptProxy" runat="server">
    </asp:ScriptManagerProxy>
    <asp:UpdatePanel ID="upPanel" runat="server">
        <ContentTemplate>
            <div class="content">
            <table cellpadding="0" cellspacing="0" class="style1">
                <tr>
                    <td class="style2">
                        <asp:LinkButton ID="lnkEdit" runat="server" onclick="lnkEdit_Click">Edit 
                        Information</asp:LinkButton>
                    </td>
                    <td align="right">
                        <asp:LinkButton ID="lnkAddNewCode" runat="server" onclick="lnkAddNewCode_Click">Add 
                        New Code</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" >
                        <hr class="style4" /></td>
                </tr>
                <tr>
                    <td colspan="2">
                        &nbsp;</td>
                </tr>
            </table>
              <table cellpadding="0" cellspacing="0" class="style1">
                  <tr>
                      <td align="left">
                          <table cellpadding="0" cellspacing="0" class="style1">
                              <tr>
                                  <td>
                                      <%--<asp:Label ID="Label2" runat="server" 
                                          style="font-size: small; font-weight: 700; text-decoration: underline; color: #003399" 
                                          Text="Active Codes"></asp:Label>--%>
                                          <asp:Label ID="Label2" runat="server" 
                                          style="font-size: small; font-weight: 700; text-decoration: underline; color: #003399" 
                                          Text="Active Salary Authorization Codes"></asp:Label>
                                  </td>
                                  <td align="right">
                                      <asp:Image ID="Image1" runat="server" ImageUrl="~/images/ratingplus.gif" />
                                      <asp:Label ID="Label4" runat="server" style="font-size: small" Text="Enable"></asp:Label>
                                      &nbsp;
                                      <asp:Image ID="Image2" runat="server" ImageUrl="~/images/ratingminus.gif" />
                                      <asp:Label ID="Label5" runat="server" style="font-size: small" Text="Disable"></asp:Label>
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
                                          CellPadding="4" DataSourceID="SqlDataSource1" 
                                          EmptyDataText="No code is active please click to add new code." 
                                          ForeColor="#333333" GridLines="None" Width="798px">
                                          <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                          <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                          <Columns>
                                              <asp:BoundField DataField="AuthCodeId" HeaderText="AuthCodeId" 
                                                  InsertVisible="False" ReadOnly="True" SortExpression="AuthCodeId" 
                                                  Visible="False" />
                                              <asp:BoundField DataField="AuthCodeNo" HeaderText="Auth Code" 
                                                  SortExpression="AuthCode">
                                                  <HeaderStyle HorizontalAlign="Left" />
                                                  <ItemStyle HorizontalAlign="Left" />
                                              </asp:BoundField>
                                              <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" 
                                                  Visible="False" />
                                              <asp:BoundField DataField="IssueDate" HeaderText="Created Date" 
                                                  SortExpression="IssueDate">
                                                  <HeaderStyle HorizontalAlign="Left" />
                                                  <ItemStyle HorizontalAlign="Left" />
                                              </asp:BoundField>
                                              <asp:BoundField DataField="ExpiredDate" HeaderText="Expiry Date" 
                                                  SortExpression="Expired Date">
                                                  <HeaderStyle HorizontalAlign="Left" />
                                                  <ItemStyle HorizontalAlign="Left" />
                                              </asp:BoundField>
                                              <asp:TemplateField HeaderText="Status" SortExpression="Status">
                                                  <EditItemTemplate>
                                                      <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Status") %>'></asp:TextBox>
                                                  </EditItemTemplate>
                                                  <ItemTemplate>
                                                      <asp:Image ID="img" runat="server" 
                                                          ImageUrl='<%# GetImageUrl(Eval("Status")) %>' />
                                                      <%-- <asp:Label ID="Label1" runat="server" Text='<%# Bind("Status") %>'></asp:Label>--%>
                                                  </ItemTemplate>
                                                  <HeaderStyle HorizontalAlign="Left" />
                                                  <ItemStyle HorizontalAlign="Left" />
                                              </asp:TemplateField>
                                              <asp:TemplateField HeaderText="Change Status">
                                                  <HeaderStyle HorizontalAlign="Left" />
                                                  <ItemStyle HorizontalAlign="Left" />
                                                  <ItemTemplate>
                                                      <asp:LinkButton ID="lnkChange" runat="server" 
                                                           OnCommand="ChangeStatus" CommandName='<%# Bind("AuthCodeId") %>' CommandArgument='<%# Bind("Status") %>'
                                                          Text="Change Status" Font-Size="11px"></asp:LinkButton>
                                                  </ItemTemplate>
                                              </asp:TemplateField>
                                          </Columns>
                                          <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                          <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                          <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                          <EditRowStyle BackColor="#999999" />
                                          <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                      </asp:GridView>
                                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                          ConnectionString="<%$ ConnectionStrings:EVAConnectionString %>" 
                                          SelectCommand="Sp_Get_ActiveCode" SelectCommandType="StoredProcedure">
                                          <SelectParameters>
                                              <asp:SessionParameter Name="userid" SessionField="userid" Type="Int32" />
                                          </SelectParameters>
                                      </asp:SqlDataSource>
                                  </td>
                              </tr>
                              <tr>
                                  <td>
                                      &nbsp;</td>
                              </tr>
                              <tr>
                                  <td>
                                      <table cellpadding="0" cellspacing="0" class="style1">
                                          <tr>
                                              <td>
                                                  <%--<asp:Label ID="Label3" runat="server" 
                                                      style="font-size: small; font-weight: 700; text-decoration: underline; color: #003399" 
                                                      Text="Used/Expired Code"></asp:Label>--%>
                                                  <asp:Label ID="Label3" runat="server" 
                                                      style="font-size: small; font-weight: 700; text-decoration: underline; color: #003399" 
                                                      Text="Used/Expired Salary Authorization Code"></asp:Label>
                                              </td>
                                              <td align="right">
                                                  <asp:Image ID="Image3" runat="server" ImageUrl="~/images/DNNExplorer_OK.gif" />
                                                  &nbsp;<asp:Label ID="Label6" runat="server" style="font-size: small" Text="Used"></asp:Label>
                                                  &nbsp;&nbsp;
                                                  <asp:Image ID="Image4" runat="server" 
                                                      ImageUrl="~/images/DNNExplorer_Cancel.gif" />
                                                  &nbsp;<asp:Label ID="Label7" runat="server" style="font-size: small" Text="Expired"></asp:Label>
                                              </td>
                                          </tr>
                                      </table>
                                  </td>
                              </tr>
                              <tr>
                                  <td>
                                      &nbsp;</td>
                              </tr>
                              <tr>
                                  <td>
                                      <asp:GridView ID="gvUsed" runat="server" AllowPaging="True" 
                                          AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" 
                                          EmptyDataText="No codes are used/expired." ForeColor="#333333" GridLines="None" 
                                          PageSize="5" Width="798px">
                                          <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                          <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                          <Columns>
                                              <asp:BoundField DataField="AuthCodeId" HeaderText="AuthCodeId" 
                                                  InsertVisible="False" ReadOnly="True" SortExpression="AuthCodeId" 
                                                  Visible="False">
                                                  <HeaderStyle HorizontalAlign="Left" />
                                                  <ItemStyle HorizontalAlign="Left" />
                                              </asp:BoundField>
                                              <asp:BoundField DataField="AuthCodeNo" HeaderText="Auth Code" 
                                                  SortExpression="AuthCodeNo">
                                                  <HeaderStyle HorizontalAlign="Left" />
                                                  <ItemStyle HorizontalAlign="Left" />
                                              </asp:BoundField>
                                              <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" 
                                                  Visible="False">
                                                  <HeaderStyle HorizontalAlign="Left" />
                                                  <ItemStyle HorizontalAlign="Left" />
                                              </asp:BoundField>
                                              <asp:BoundField DataField="IssueDate" HeaderText="Created Date" 
                                                  ReadOnly="True" SortExpression="IssueDate">
                                                  <HeaderStyle HorizontalAlign="Left" />
                                                  <ItemStyle HorizontalAlign="Left" />
                                              </asp:BoundField>
                                              <asp:TemplateField HeaderText="Status" SortExpression="Status">
                                                  <EditItemTemplate>
                                                      <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Status") %>'></asp:TextBox>
                                                  </EditItemTemplate>
                                                  <ItemTemplate>
                                                  <asp:Image ID="imgUsed" runat="server" 
                                                          ImageUrl='<%# GetUsedImageUrl(Eval("Status")) %>' />
                                                      <%--<asp:Label ID="Label1" runat="server" Text='<%# Bind("Status") %>'></asp:Label>--%>
                                                  </ItemTemplate>
                                                  <HeaderStyle HorizontalAlign="Left" />
                                                  <ItemStyle HorizontalAlign="Left" />
                                              </asp:TemplateField>
                                              <asp:BoundField DataField="ExpiredDate" HeaderText="Used/Expiry Date" 
                                                  ReadOnly="True" SortExpression="ExpiredDate">
                                                  <HeaderStyle HorizontalAlign="Left" />
                                                  <ItemStyle HorizontalAlign="Left" />
                                              </asp:BoundField>
                                              <asp:BoundField DataField="FirstName" HeaderText="Verifier" 
                                                  SortExpression="FirstName">
                                                  <HeaderStyle HorizontalAlign="Left" />
                                                  <ItemStyle HorizontalAlign="Left" />
                                              </asp:BoundField>
                                          </Columns>
                                          <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                          <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                          <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                          <EditRowStyle BackColor="#999999" />
                                          <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                      </asp:GridView>
                                      <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                          ConnectionString="<%$ ConnectionStrings:EVAConnectionString %>" 
                                          SelectCommand="Sp_Get_UsedCode" SelectCommandType="StoredProcedure">
                                          <SelectParameters>
                                              <asp:SessionParameter Name="userid" SessionField="userid" Type="Int32" />
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
    
            </div></div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

