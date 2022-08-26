<%@ Page Language="C#" MasterPageFile="EVAadmin.master" AutoEventWireup="true" CodeFile="dataUpload.aspx.cs" Inherits="Admin_dataUpload" Title="Upload client data" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
         <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link href="http://fonts.cdnfonts.com/css/helvetica-2" rel="stylesheet"/>
        <link href="css/style.css" rel="stylesheet" />
    <style type="text/css">
        .style3
        {
            height: 10px;
        }
        .style4
        {
            width: 100%;
        }
        .style5
        {
        }
        .style6
        {
            width: 28px;
        }
        .style7
        {
            width: 34px;
        }
       
        .style9
        {
            width: 179px;
        }
        .style10
        {
            width: 108px;
        }
    </style>  
    <script>
    function popUp(URL) 
    {
    
       var id='ViewData';
       eval("page" + id + " = window.open(URL, '" + id + "','toolbar=0,scrollbars=1,location=0,statusbar=0,menubar=0,resizable=0,width=750,height=200,left = 100,top = 100');");

    }                    

    </script>

    <link href="css/dhtmlgoodies_calendar.css" rel="stylesheet" type="text/css" />

    <script src="js/dhtmlgoodies_calendar.js" type="text/javascript"></script>
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
                                
                                Text="Please enter the company or from date and to date to view data uploaded status."></asp:Label>
                          
                        </td>
                       <td align="right">
                                                  &nbsp;&nbsp;&nbsp; &nbsp;</td>
                    </tr>
                    
                </table>
                <table cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td >
                          
                            &nbsp;</td>
                       
                    </tr>
                    <tr>
                        <td>
                            <table cellpadding="0" cellspacing="0" class="style4">
                                <tr>
                                    <td class="style10">
                                        <asp:Label ID="Label17" runat="server" Text="Company Name :"></asp:Label>
                                    </td>
                                    <td class="style8">
                                        <asp:TextBox ID="txtCompany" runat="server" CssClass="textbox" >
                                        </asp:TextBox>
                                    </td>
                                    <td class="style6">
                                        &nbsp;</td>
                                    <td class="style7">
                                        &nbsp;</td>
                                    <td align="right" class="style9">
                                         </td>
                                    <td align="right">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style10">
                                        <asp:Label ID="Label21" runat="server" Text="From :"></asp:Label>
                                    </td>
                                    <td class="style8">
                                        <asp:TextBox ID="txtfrom" Enabled="false"  runat="server" CssClass="textbox" ></asp:TextBox></td>
                                    <td class="style6">
                                        <img ID="btnStartDate" alt="date" 
                                            onclick="displayCalendar(document.forms[0].ContentPlaceHolder1_txtfrom,'mm/dd/yyyy',this)" 
                                            src="../images/calendar.gif" /></td>
                                    <td class="style7">
                                        <asp:Label ID="Label22" runat="server" Text="To :"></asp:Label>
                                    </td>
                                    <td align="left" class="style9">
                                        <asp:TextBox ID="txtto" Enabled="false" runat="server" CssClass="textbox" ></asp:TextBox>
                                    </td>
                                    <td align="left">
                                        <img ID="btnStartDate0" alt="date" 
                                            onclick="displayCalendar(document.forms[0].ContentPlaceHolder1_txtto,'mm/dd/yyyy',this)" 
                                            src="../images/calendar.gif" /></td>
                                </tr>
                                <tr>
                                    <td class="style10">
                                        &nbsp;</td>
                                    <td class="style8">
                                        &nbsp;</td>
                                    <td class="style6">
                                        &nbsp;</td>
                                    <td class="style7">
                                        &nbsp;</td>
                                    <td align="left" class="style9">
                                        &nbsp;</td>
                                    <td align="left">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style10">
                                        &nbsp;</td>
                                    <td class="style8">
                                        <asp:Button ID="btnSearch" runat="server" onclick="btnSearch_Click" 
                                            Text="Search" />
                                        &nbsp;<asp:Button ID="btnClear" runat="server" onclick="btnClear_Click" Text="Clear" 
                                             />
                                    </td>
                                    <td class="style6">
                                        &nbsp;</td>
                                    <td class="style7">
                                        &nbsp;</td>
                                    <td align="left" class="style9">
                                        &nbsp;</td>
                                    <td align="left">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style10">
                                        &nbsp;</td>
                                    <td class="style8">
                                        &nbsp;</td>
                                    <td class="style6">
                                        &nbsp;</td>
                                    <td class="style7">
                                        &nbsp;</td>
                                    <td align="right" class="style9">
                                        &nbsp;</td>
                                    <td align="right">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style5" colspan="2">
                                        <asp:Label ID="Label20" runat="server" 
                                            style="font-size: small; font-weight: 700; text-decoration: underline; color: #003399" 
                                            Text="File Upload Status"></asp:Label>
                                    </td>
                                    <td class="style6">
                                        &nbsp;</td>
                                    <td class="style7">
                                        &nbsp;</td>
                                    <td align="right" class="style9">
                                        &nbsp;&nbsp;&nbsp;&nbsp;</td>
                                    <td align="right">
                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/DNNExplorer_OK.gif" />
                                        &nbsp;<asp:Label ID="Label2" runat="server" style="font-size: small" 
                                            Text="Successed"></asp:Label>
                                        &nbsp;<asp:Image ID="Image2" runat="server" 
                                            ImageUrl="~/images/DNNExplorer_Cancel.gif" />
                                        &nbsp;<asp:Label ID="Label3" runat="server" style="font-size: small" Text="Failed"></asp:Label>
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
                       <td >
                          
                            <asp:GridView ID="gvStatus" runat="server" AllowPaging="True" 
                                AutoGenerateColumns="False" CellPadding="4" 
                                EmptyDataText="There is no data available to display." ForeColor="#333333" 
                                GridLines="None" Width="100%" onrowdatabound="gvStatus_RowDataBound" 
                                AllowSorting="True" onpageindexchanging="gvStatus_PageIndexChanging" 
                                onsorting="gvStatus_Sorting">
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <Columns>
                                    <asp:BoundField DataField="StatusId" HeaderText="StatusId" 
                                        InsertVisible="False" ReadOnly="True" SortExpression="StatusId" Visible="False">
                                        <HeaderStyle HorizontalAlign="Left"  />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CompanyId" HeaderText="CompanyId" 
                                        SortExpression="CompanyId" Visible="False">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Company" SortExpression="CompanyName">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CompanyName") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("CompanyName") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" Width="300px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="FileName" HeaderText="File" 
                                        SortExpression="FileName">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" Width="150px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="UploadDate" HeaderText="Upload Date &amp; Time" 
                                        SortExpression="UploadDate">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" Width="200px" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Status" SortExpression="Status" >
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Status") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                       <ItemTemplate>
                                                  <asp:Image ID="imgUsed" runat="server" 
                                                          ImageUrl='<%# GetUsedImageUrl(Eval("Status")) %>' />
                                                     
                                                  </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" Width="50px" />
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Details" >
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkDetail" runat="server" CausesValidation="False" 
                                               Text="Details" Font-Size="11px" OnCommand="GetDetail" CommandName='<%# Bind("StatusId") %>'  ></asp:LinkButton>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                </Columns>
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
                                    Font-Size="Small"  />
                                <EditRowStyle BackColor="#999999" />
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            </asp:GridView>
                        </td>
                    </tr>

                     <tr>
                       <td class="style3" >
                          
                         </td>
                    </tr>

                     </table>
 
    <div class="clear">
     
    </div>
</div>
                        </div>
                    </div>
             </section>
                        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
