<%@ Page Language="C#" MasterPageFile="EVAadmin.master" AutoEventWireup="true" CodeFile="detail.aspx.cs" Inherits="Admin_detail" Title="Status Details" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link href="http://fonts.cdnfonts.com/css/helvetica-2" rel="stylesheet"/>
        <link href="css/style.css" rel="stylesheet" />
    
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 16px;
        }
        .style3
        {
            height: 19px;
        }
    </style>
 </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManagerProxy ID="scriptProxy" runat="server">
    </asp:ScriptManagerProxy>
    <asp:UpdatePanel ID="upPanel" runat="server">    
    <ContentTemplate> 

    <div class="content1" >
    
        <table cellpadding="0" cellspacing="0" class="style1">
            <tr>
                <td>
                    <asp:Label ID="Label16" runat="server" CssClass="label" 
                        Text="Following are the details of error."></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style3">
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" 
                        GridLines="None" Width="700px">
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <Columns>
                            <asp:BoundField DataField="StatusId" HeaderText="StatusId" 
                                InsertVisible="False" ReadOnly="True" SortExpression="StatusId" Visible="False">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="RecordNo" HeaderText="Record No" 
                                SortExpression="RecordNo">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle HorizontalAlign="Left" Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="FieldName" HeaderText="Field Name" 
                                SortExpression="FieldName">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle HorizontalAlign="Left" Width="150px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="FieldValue" HeaderText="Field Value" 
                                SortExpression="FieldValue">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle HorizontalAlign="Left" Width="150px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Error" HeaderText="Error" SortExpression="Error">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle HorizontalAlign="Left" Width="250px" />
                            </asp:BoundField>
                        </Columns>
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#999999" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:MemeberShipConnectionString %>" 
                        SelectCommand="SELECT * FROM [UploadStatus] WHERE ([StatusId] = @StatusId)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="StatusId" QueryStringField="id" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="style2">
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnClose" runat="server" onclick="btnClose_Click" 
                        Text="Cancel" Font-Names="Verdana,Arial,Helvetica,sans-serif" 
                        Font-Size="Small" />
                </td>
            </tr>
        </table>
    
     <div class="clear">
     
    </div>
</div></ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
