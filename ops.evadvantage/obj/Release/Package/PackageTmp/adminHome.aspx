<%@ Page Language="C#" MasterPageFile="EVAadmin.master" AutoEventWireup="true" CodeFile="adminHome.aspx.cs" Inherits="Admin_adminHome" Title="Admin Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <link href="../style.css" rel="stylesheet" type="text/css" />
 <script>
    function popUp(URL) 
    {
    
       var id='ViewData';
       eval("page" + id + " = window.open(URL, '" + id + "','toolbar=0,scrollbars=1,location=0,statusbar=0,menubar=0,resizable=0,width=650,height=500,left = 100,top = 100');");

    }                    

    </script>
    <style type="text/css">
        .style1
        {
            height: 14px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManagerProxy ID="scriptProxy" runat="server">
    </asp:ScriptManagerProxy>
    <asp:UpdatePanel ID="upPanel" runat="server">
        <ContentTemplate>
<div class="content1">
 <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                    <tr>
                        <td align="left">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
                    <tr>
                        <td align="left">
                           
                            <asp:Label ID="Label2" runat="server" 
                                style="font-size: small; font-weight: 700; text-decoration: underline; color: #003399" 
                                Text="Verifier New Request"></asp:Label>
                           
            </td>
            </tr>
                    <tr>
                        <td align="left">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="left">
                            <asp:GridView ID="gvActive" runat="server" AllowPaging="True" 
                                AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" 
                                ForeColor="#333333" GridLines="None" Width="798px" 
                                EmptyDataText="No new request for activation.">
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <Columns>
                                    <asp:BoundField DataField="UserId" HeaderText="UserId" InsertVisible="False" 
                                        ReadOnly="True" SortExpression="UserId" Visible="False">
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="UserName" HeaderText="User Name" 
                                        SortExpression="UserName">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="FirstName" HeaderText="First Name" 
                                        SortExpression="FirstName">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="LastName" HeaderText="Last Name" 
                                        SortExpression="LastName">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CompanyName" HeaderText="Company Name" 
                                        SortExpression="CompanyName">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Detail">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" />
                                        <ItemTemplate>
                                        <asp:LinkButton ID="lnkDetail" runat="server" Text="Detail" Font-Size="11px" OnCommand="Detail" CommandName='<%# Bind("UserName") %>' CommandArgument="Veri"></asp:LinkButton>
                                        
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Activate?">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" />
                                        <ItemTemplate>
                                        <asp:LinkButton ID="lnkActive" runat="server" Text="Yes" Font-Size="11px" OnCommand="Activate" CommandName='<%# Bind("UserId") %>' CommandArgument='<%# Bind("Email") %>'></asp:LinkButton>
                                        &nbsp;&nbsp;&nbsp;<asp:LinkButton ID="lnkActiveNo" runat="server" Text="No" Font-Size="11px" OnCommand="ActivateNo" CommandName='<%# Bind("UserId") %>' CommandArgument='<%# Bind("Email") %>'></asp:LinkButton>
                                        </ItemTemplate>
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
                                ConnectionString="<%$ ConnectionStrings:EVAConnectionString %>" 
                                SelectCommand="Sp_Get_UserToActivate" SelectCommandType="StoredProcedure">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
                </td></tr></table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                    <tr>
                        <td align="left">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
                    <tr>
                        <td align="left" class="style1">
                           
            </td>
            </tr>
                    <tr>
                        <td align="left">
                            <asp:Label ID="Label1" runat="server" 
                                style="font-size: small; font-weight: 700; text-decoration: underline; color: #003399" 
                                Text="Social Service User Request"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="left">
                            <asp:GridView ID="gvSSU" runat="server" AllowPaging="True" 
                                AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" 
                                ForeColor="#333333" GridLines="None" Width="798px" 
                                EmptyDataText="No new request for activation.">
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <Columns>
                                    <asp:BoundField DataField="UserId" HeaderText="UserId" InsertVisible="False" 
                                        ReadOnly="True" SortExpression="UserId" Visible="False">
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="UserName" HeaderText="User Name" 
                                        SortExpression="UserName">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="FirstName" HeaderText="First Name" 
                                        SortExpression="FirstName">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="LastName" HeaderText="Last Name" 
                                        SortExpression="LastName">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CompanyName" HeaderText="Company Name" 
                                        SortExpression="CompanyName">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Detail">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" />
                                        <ItemTemplate>
                                        <asp:LinkButton ID="lnkDetail" runat="server" Text="Detail" Font-Size="11px" OnCommand="Detail" CommandName='<%# Bind("UserName") %>' CommandArgument="SSV"></asp:LinkButton>
                                        
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Activate?">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" />
                                        <ItemTemplate>
                                        <asp:LinkButton ID="lnkActive" runat="server" Text="Yes" Font-Size="11px" OnCommand="Activate" CommandName='<%# Bind("UserId") %>' CommandArgument='<%# Bind("Email") %>'></asp:LinkButton>
                                        &nbsp;&nbsp;&nbsp;<asp:LinkButton ID="lnkActiveNo" runat="server" Text="No" Font-Size="11px" OnCommand="ActivateNo" CommandName='<%# Bind("UserId") %>' CommandArgument='<%# Bind("Email") %>'></asp:LinkButton>
                                        </ItemTemplate>
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
                                ConnectionString="<%$ ConnectionStrings:EVAConnectionString %>" 
                                SelectCommand="Sp_Get_UserToActivateForSSU" 
                                SelectCommandType="StoredProcedure">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
                </td></tr></table>
    <div class="clear">
    
    </div>
</div></ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
