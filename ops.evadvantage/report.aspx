<%@ Page Language="C#" EnableEventValidation="false" MasterPageFile="EVAadmin.master"
    AutoEventWireup="true" CodeFile="report.aspx.cs" Inherits="Admin_report" Title="Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
   <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link href="http://fonts.cdnfonts.com/css/helvetica-2" rel="stylesheet"/>
        <link href="css/style.css" rel="stylesheet" />
    <style type="text/css">
        .style1
        {
            width: 91px;
        }
        .style2
        {
            height: 27px;
        }
        .style3
        {
            width: 152px;
        }
        .style4
        {
            width: 55px;
        }
        .style5
        {
            width: 39px;
        }
        .style6
        {
        }
        .style7
        {
            width: 100%;
        }
        .style8
        {
            height: 17px;
        }
        .style9
        {
            width: 169px;
        }
        .style10
        {
            width: 91px;
            height: 27px;
        }
        .style11
        {
            height: 20px;
        }
        .style12
        {
            height: 20px;
            width: 336px;
        }
        .style13
        {
            width: 336px;
        }
                    .style14
                    {
                        text-align:right
                    }
        
    </style>

    <script src="js/dhtmlgoodies_calendar.js" type="text/javascript">        function btnStartDate_onclick() {

        }

    </script>

    <link href="css/dhtmlgoodies_calendar.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManagerProxy ID="TScriptManager1" runat="server" />
     <section class="loginPage">

                <div class="container">

                    <div class="formInner2">
    <div class="content1">
        <table cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td>
                    <asp:Label ID="Label16" runat="server" CssClass="label" Text="Please select company and enter from and to date to generate report."></asp:Label>
                </td>
                <td align="right">
                    <asp:Label ID="Label18" runat="server" Font-Bold="True" ForeColor="Red" Text="*"></asp:Label>
                    <asp:Label ID="Label17" runat="server" Font-Italic="True" Text="Marked fields are mandatory."></asp:Label>
                </td>
            </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
            <tr>
                <td class="style1">
                    &nbsp;
                </td>
                <td class="style9">
                    &nbsp;
                </td>
                <td class="style4">
                    &nbsp;
                </td>
                <td class="style5">
                    &nbsp;
                </td>
                <td class="style3">
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style10">
                    <asp:Label ID="Label20" runat="server" Font-Bold="True" ForeColor="Red" Text="*"></asp:Label>
                    <asp:Label ID="Label1" runat="server" Text="Client :"></asp:Label>
                </td>
                <td class="style2" colspan="5">
                    <asp:DropDownList ID="ddlClient" runat="server" CssClass="textbox" >
                    </asp:DropDownList>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlClient"
                        ErrorMessage="Please select client." InitialValue="0">*</asp:RequiredFieldValidator>--%>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Label ID="Label23" runat="server" Font-Bold="True" ForeColor="Red" Text="*"></asp:Label>
                    <asp:Label ID="Label2" runat="server" Text="From :"></asp:Label>
                </td>
                <td class="style9">
                    <asp:TextBox ID="txtfrom" runat="server" CssClass="textbox" ></asp:TextBox>
                </td>
                <td class="style4">
                    <%--<img id="Img1" alt="date" 
                                onclick="displayCalendar(document.forms[0].ctl00_ContentPlaceHolder1_txtfrom,'mm/dd/yyyy',this)" 
                                src="../images/calendar.gif" />--%>
                    <img id="imgCalFrom" src="../images/calendar.gif" style="cursor: pointer;" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtfrom"
                        ErrorMessage="Please enter from date.">*</asp:RequiredFieldValidator>
                    <asp:CalendarExtender ID="CalendarExtender2" PopupButtonID="imgCalFrom" TargetControlID="txtfrom"
                        runat="server" Format="MM/dd/yyyy">
                    </asp:CalendarExtender>
                </td>
                <td class="style5">
                    <asp:Label ID="Label24" runat="server" Font-Bold="True" ForeColor="Red" Text="*"></asp:Label>
                    <asp:Label ID="Label22" runat="server" Text="To :"></asp:Label>
                </td>
                <td class="style3">
                    <asp:TextBox ID="txtto" runat="server" CssClass="textbox" ></asp:TextBox>
                </td>
                <td>
                    <img id="imgCalTo" src="../images/calendar.gif" style="cursor: pointer;" />
                    <asp:CalendarExtender ID="CalendarExtender1" PopupButtonID="imgCalTo" TargetControlID="txtto"
                        runat="server" Format="MM/dd/yyyy">
                    </asp:CalendarExtender>
                    <%--<img id="btnStartDate0" alt="date" onclick="displayCalendar(document.forms[0].ctl00_ContentPlaceHolder1_txtto,'mm/dd/yyyy',this)"
                        src="../images/calendar.gif" /><asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                            runat="server" ControlToValidate="txtto" ErrorMessage="Please enter To date.">*</asp:RequiredFieldValidator>--%>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;
                </td>
                <td class="style9" colspan="2">
                    <asp:RadioButton ID="rdoNonAdmin" runat="server" Checked="true" GroupName="adm" Text="Non-Admin" />
                    <asp:RadioButton ID="rdoAdmin" GroupName="adm" Text="Admin" runat="server" />
                    <asp:RadioButton ID="rdoAll" GroupName="adm" Text="All" runat="server" />
                </td>
                <td class="style5">
                    &nbsp;
                </td>
                <td class="style3">
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;
                </td>
                <td class="style9">
                    &nbsp;
                </td>
                <td class="style4">
                    &nbsp;
                </td>
                <td class="style5">
                    &nbsp;
                </td>
                <td class="style3">
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;
                </td>
                <td class="style6" colspan="2">
                    <asp:Button ID="btnGen" runat="server" Text="View Data" OnClick="btnGen_Click" />
                   <asp:Button ID="btnExport" runat="server" OnClick="btnExport_Click" Text="Export to PDF" />
                </td>
                <td class="style5">
                    &nbsp;
                </td>
                <td class="style3">
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
        <table cellpadding="0" cellspacing="0" class="style7">
            <tr>
                <td class="style8">
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label21" runat="server" Style="font-size: small; 
                        text-decoration: underline; color: #003399" Text="Client Verification List"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style8">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="gvData" runat="server" AutoGenerateColumns="False" Width="100%"
                        AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None"
                        OnPageIndexChanging="gvData_PageIndexChanging" OnSorting="gvData_Sorting" EmptyDataText="There is no data to display.">
                        <FooterStyle  BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <Columns>
                            <asp:BoundField DataField="TypeOfVerification" HeaderText="Type Of Verification"
                                SortExpression="TypeOfVerification">
                                <HeaderStyle HorizontalAlign="Left" Width="150px" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CompName" HeaderText="Company Name" SortExpression="CompName">
                                <HeaderStyle HorizontalAlign="Left" Width="150px" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="EmployeeName" HeaderText="Employee Name" SortExpression="EmployeeName">
                                <HeaderStyle HorizontalAlign="Left" Width="150px" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="SSN" HeaderText="SSN" SortExpression="SSN">
                                <HeaderStyle HorizontalAlign="Left" Width="100px" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="VerifierName" HeaderText="Verifier" ReadOnly="True" SortExpression="VerifierName">
                                <HeaderStyle HorizontalAlign="Left" Width="150px" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="DateofIssued" HeaderText="Verification Date" SortExpression="DateofIssued">
                                <HeaderStyle HorizontalAlign="Left" Width="150px" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CreditCard" HeaderText="Credit Card" SortExpression="CreditCard">
                                <HeaderStyle HorizontalAlign="Left" Width="150px" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                        </Columns>
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#999999" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
        <table id="tbl" runat="server" cellpadding="0" cellspacing="0" class="style7">
            <tr>
                <td class="style12">
                </td>
                <td class="style11">
                </td>
            </tr>
            <tr>
                <td class="style13">
                    <asp:Label ID="Label25" runat="server" Text="Total Number of Employment Verifications :"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblE" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style13">
                    <asp:Label ID="Label26" runat="server" Text="Total Number of Employment and Wage Verifications :"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblEW" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style13">
                    <asp:Label ID="Label27" runat="server" Text="Total Number of Social Service Verifications :"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblSS" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style13">
                    <asp:Label ID="Label28" runat="server" Text="Total Number of Manual Social Service Verifications :"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblMSS" class="style14" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <div class="clear">
            <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="True"
                ShowSummary="False" Style="margin-left: 0px" />
        </div>
    </div>
                        </div>
                    </div>
         </section>
</asp:Content>
