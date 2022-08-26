<%@ Page Language="C#" MasterPageFile="EVAadmin.master" AutoEventWireup="true" CodeFile="company.aspx.cs"
    Inherits="Admin_company" Title="Company" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
         <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link href="http://fonts.cdnfonts.com/css/helvetica-2" rel="stylesheet"/>
        <link href="css/style.css" rel="stylesheet" />

    <style type="text/css">
        .style1
        {
            width: 430px;
        }
        .style4
        {
            height: 11px;
        }
        .style5
        {
            height: 5px;
        }
        .style6
        {
            width: 100%;
        }
        .style8
        {
            width: 423px;
            height: 16px;
        }
        .style9
        {
            height: 16px;
            width: 349px;
        }
        .style10
        {
            width: 423px;
            height: 37px;
        }
        .style11
        {
            height: 37px;
        }
        .style12
        {
            height: 37px;
            width: 349px;
        }
    </style>

    <script type="text/javascript">
        function doClick(buttonName, e) {
            //the purpose of this function is to allow the enter key to 

            //point to the correct button to click.

            var key;

            if (window.event)
                key = window.event.keyCode;     //IE

            else
                key = e.which;     //firefox


            if (key == 13) {
                //Get the button the user wants to have clicked

                var btn = document.getElementById(buttonName);
                if (btn != null) { //If we find the button click it

                    btn.click();
                    event.keyCode = 0
                }
            }
        }
    </script>

    <link rel="stylesheet" href="../css/bubble-tooltip.css" media="screen">

    <script type="text/javascript" src="../Scripts/bubble-tooltip.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManagerProxy ID="scriptProxy" runat="server">
    </asp:ScriptManagerProxy>
    <asp:UpdatePanel ID="upPanel" runat="server">
        <ContentTemplate>
             <section class="loginPage">

                <div class="container">

                    <div class="formInner2">
            <div class="content1">
                <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                    <tr>
                        <td class="style1">
                        </td>
                        <td align="right">
                            <asp:Label ID="Label18" runat="server" Font-Bold="True" ForeColor="Red" Text="*"></asp:Label>
                            <asp:Label ID="Label17" runat="server" Font-Italic="True" Text="Marked fields are mandatory."></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style1">
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                    <tr>
                        <td align="left" class="style5">
                            <asp:Label ID="Label20" runat="server" Font-Bold="True" ForeColor="Red" Text="*"></asp:Label>
                            <asp:Label ID="Label19" runat="server" Text="Company :"></asp:Label>
                        </td>
                        <td align="left" style="width: 650px">
                            <asp:TextBox ID="txtCompany" runat="server" CssClass="textbox" Width="370px" ValidationGroup="add"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCompany"
                                ErrorMessage="Please enter company." ValidationGroup="add">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                        </td>
                        <td class="style4">
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;
                        </td>
                        <td align="left">
                            <asp:Button ID="btnAdd" runat="server" Text="Add"  OnClick="btnAdd_Click"
                                ValidationGroup="add" />
                            &nbsp;<asp:Button ID="btnClear" runat="server" CausesValidation="False" Text="Clear"
                                 OnClick="btnClear_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style5" colspan="2">
                            <table cellpadding="0" cellspacing="0" class="style6">
                                <tr>
                                    <td class="style8">
                                    </td>
                                    <td align="right" class="style9">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style10">
                                        <asp:Label ID="Label21" runat="server" Style="font-size: small; font-weight: 700;
                                            text-decoration: underline; color: #003399" Text="Company List"></asp:Label>
                                    </td>
                                    <td align="right" class="style12">
                                        <asp:TextBox ID="txtSearch" runat="server" CssClass="textbox" Width="249px"></asp:TextBox>
                                        &nbsp;<asp:Button ID="btnSearch" runat="server" CausesValidation="False" Text="Search" />
                                    </td>
                                    <td class="style11">
                                        &nbsp;
                                        <img src="../images/action_help.gif" onmousemove="showToolTip(event,'Enter Company code or Company Name to search company.');return false"
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
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                    <tr>
                        <td align="left">
                            <asp:GridView ID="gvCompany" runat="server" AllowPaging="True" AllowSorting="True"
                                AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333"
                                GridLines="None" Width="100%" DataKeyNames="CompanyId" EmptyDataText="There is no data to display.">
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <Columns>
                                    <asp:BoundField DataField="CompanyId" HeaderText="CompanyId" InsertVisible="False"
                                        ReadOnly="True" SortExpression="CompanyId" Visible="False">
                                        <HeaderStyle Width="10px" />
                                        <ItemStyle Width="10px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CompanyCode" HeaderText="Company Code" SortExpression="CompanyCode"
                                        ReadOnly="True">
                                        <HeaderStyle HorizontalAlign="Left" Width="150px" />
                                        <ItemStyle HorizontalAlign="Left" Width="150px" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Company Name" SortExpression="CompanyName">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CompanyName") %>' ValidationGroup="grid"
                                                Width="370px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1"
                                                ErrorMessage="Please enter company." ValidationGroup="grid" Width="2px">*</asp:RequiredFieldValidator>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("CompanyName") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="400px" />
                                        <ItemStyle HorizontalAlign="Left" Width="400px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Edit" ShowHeader="False">
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="true" CommandName="Update"
                                                Text="Update" Font-Size="11px" ValidationGroup="grid"></asp:LinkButton>
                                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                                Text="Cancel" Font-Size="11px"></asp:LinkButton>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Edit"
                                                Text="Edit" Font-Size="11px"></asp:LinkButton>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="150px" />
                                        <ItemStyle Font-Size="XX-Small" HorizontalAlign="Left" Width="150px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" OnClientClick="return confirm('Are you sure you want to delete?');"
                                                OnCommand="Delete" CommandName='<%# Bind("companyid") %>' Text="Delete" Font-Size="11px"></asp:LinkButton>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Exception" ItemStyle-Wrap="false">
                                        <ItemTemplate>
                                            <a style="font-size: 11px;" href='Exception.aspx?cmId=<%# Eval("CompanyID") %>'>Add/Edit Exception</a>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                </Columns>
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                <EditRowStyle BackColor="#999999" />
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MemeberShipConnectionString %>"
                                SelectCommand="Sp_Select_Company" SelectCommandType="StoredProcedure" UpdateCommand="Sp_Update_Company"
                                UpdateCommandType="StoredProcedure" FilterExpression="CompanyName like '%{0}%' or CompanyCode like '{0}%'">
                                <FilterParameters>
                                    <asp:ControlParameter ControlID="txtSearch" Name="newparameter" PropertyName="Text" />
                                </FilterParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="CompanyName" Type="String" />
                                    <asp:Parameter Name="CompanyId" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
                <div class="clear">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="add"
                        ShowMessageBox="True" ShowSummary="False" Style="margin-left: 0px" />
                    <asp:ValidationSummary ID="ValidationSummary2" runat="server" ValidationGroup="grid"
                        ShowMessageBox="True" ShowSummary="False" Style="margin-left: 0px" />
                </div>
            </div>
                        </div>
                    </div>
                 </section>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
